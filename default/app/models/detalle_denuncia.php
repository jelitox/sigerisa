<?php
/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 * LICENSE
 *
 * @package Modelos
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
class DetalleDenuncia extends ActiveRecord {

//    public $debug = true;

    protected function initialize() {
        //validaciones
        //$this->validates_presence_of('nombre', 'message: Debe escribir un <b>Nombre</b>');
        //$this->validates_presence_of('observacion', 'message: Debe escribir una <b>Descripción del Cargo</b>');
        //$this->validates_uniqueness_of('nombre', 'message: Este Cargo <b>ya existe</b> en el sistema');
    }
    /*Metodo para guardar los detalles de las denuncias */

     public function guardar($data, $optData=array()){
        $obj = new DetalleDenuncia($data);
        if(!empty($optData)) {
            $obj->dump_result_self($optData);
        }

        $obj->begin();

        if (!$obj->save($data)) {
            $obj->rollback();
            return FALSE;
        }
      
        $obj->commit();
        return TRUE;
    }


    public function paginarRegistradas($pagina = 1){
        $cols = "P.*, denuncia.* ";
        $joins = ' INNER JOIN persona as P ON P.id = denuncia.persona_id ';
        return $this->paginate("page: $pagina", "columns: $cols", "join: $joins", "conditions: denuncia.estatus='R'");
    }

    public function getInformacionDenuncia($id){
        $cols = "P.*, denuncia.* ";
        $joins = ' INNER JOIN persona as P ON P.id = denuncia.persona_id ';
        return $this->find_first("conditions: denuncia.id = $id","columns: $cols", "join: $joins");
    }
    /**
     * Obtiene los recursos a los que un rol tiene acceso.
     * 
     * @param  int $id_rol 
     * @return array         
     */
    protected function before_save() {
       $this->fecha_denuncia = date("Y-m-d");
    }

    public function obtener_recursos_por_rol($id_rol) {
        $cols = 'recursos.recurso';
        $joins = 'INNER JOIN roles_recursos as r ON r.recursos_id = recursos.id';
        $where = "r.roles_id = '$id_rol'";
        return $this->find("columns: $cols", "join: $joins", "$where");
    }

    protected function before_validation() {
        $this->recurso = !empty($this->modulo) ? "$this->modulo/" : '';
        $this->recurso .= "$this->controlador/";
        $this->recurso .= ! empty($this->accion) ? "$this->accion" : '*';
    }

    /**
     * Obtiene los recursos que no se han agregado al al bd.
     * 
     * @param  integer $pagina 
     * @return array          
     */
    public function obtener_recursos_nuevos($pagina = 1) {
        $recursos = LectorRecursos::obtenerRecursos();
        foreach ($recursos as $index => $re) {
            if ($this->exists('recurso = \'' . $re['recurso'] . '\'')) {
                unset($recursos[$index]);
            }
        }
        $recursos = LectorRecursos::paginar($recursos, $pagina, 6);
        $this->recursos_nuevos = $recursos->items;
        array_unshift($this->recursos_nuevos, null);
        return $recursos;
    }

    /**
     * Guarda los recursos que aun no estan en bd y fueron seleccionados
     * por el usuario.
     * 
     * @return boolean 
     */
    public function guardar_nuevos() {
        $recursos_a_guardar = array();
        $recursos_chequeados = Input::post('check');
        $descripciones = Input::post('descripcion');
        $activos = Input::post('activo');
        if ($recursos_chequeados) {
            foreach ($recursos_chequeados as $valor) {
                if (empty($descripciones[$valor])) {
                    Flash::error('Existen Recursos Seleccionados que no tienen especificada una Descripción');
                    return FALSE;
                }
                $data = null;
                $data = $this->recursos_nuevos[$valor];
                $data['descripcion'] = $descripciones[$valor];
                $data['activo'] = $activos[$valor];
                $recursos_a_guardar[] = $data;
            }
        } else {
            return FALSE;
        }
        $this->begin();
        foreach ($recursos_a_guardar as $e) {
            if (!$this->save($e)) {
                $this->rollback();
                return FALSE;
            }
        }
        $this->commit();
        return TRUE;
    }

    /**
     * Obtiene las acciones existentes por cada controlador.
     * 
     * @return array 
     */
    public function accionesPorControlador(){
        $res = $this->find("modulo = '$this->modulo' AND controlador = '$this->controlador' AND accion != ''",
                'columns: id,accion');
        return $res;
    }

}
