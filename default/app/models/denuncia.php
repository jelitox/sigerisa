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
class Denuncia extends ActiveRecord {

//    public $debug = true;

    protected function initialize() {
        //validaciones
        //$this->validates_presence_of('nombre', 'message: Debe escribir un <b>Nombre</b>');
        //$this->validates_presence_of('observacion', 'message: Debe escribir una <b>Descripción del Cargo</b>');
        //$this->validates_uniqueness_of('nombre', 'message: Este Cargo <b>ya existe</b> en el sistema');
    }
    public function paginarRegistradas($pagina = 1){
        $cols = "P.*, denuncia.* ";
        $joins = ' INNER JOIN persona as P ON P.id = denuncia.persona_id ';
        return $this->paginate("page: $pagina", "columns: $cols", "join: $joins", "conditions: denuncia.estatus='R'");
    }
    //paginar asignadas 
    public function paginarAsignadas($pagina = 1){
        $cols = "P.*, denuncia.* ";
        $joins = ' INNER JOIN persona as P ON P.id = denuncia.persona_id ';
        return $this->paginate("page: $pagina", "columns: $cols", "join: $joins", "conditions: denuncia.estatus='A'");
    }

    public function getInformacionDenuncia($id){
        $cols = "P.*, denuncia.* ";
        $joins = ' INNER JOIN persona as P ON P.id = denuncia.persona_id ';
        return $this->find_first("conditions: denuncia.id = $id","columns: $cols", "join: $joins");
    }
    //informacion con detalles para poder asignar
    public function getInformacionDenunciaDetalles($id){
        $cols = "E.*, P.*, DN.*, denuncia.* ";
        $joins = ' INNER JOIN detalle_denuncia as DN ON DN.denuncia_id = DN.denuncia_id ';
        $joins.= ' INNER JOIN empleado as E ON E.id = DN.empleado_id ';
        $joins.= ' INNER JOIN persona as P ON P.id = E.persona_id ';
        return $this->find_first("conditions: denuncia.id = $id AND DN.activo=1","columns: $cols", "join: $joins");
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



}
