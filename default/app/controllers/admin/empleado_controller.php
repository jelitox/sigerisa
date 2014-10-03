<?php
/**
* Backend - KumbiaPHP Backend
* PHP version 5
* LICENSE
*
* @package Controller
* @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
* @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
*/
Load::models('empleado');
Load::models('persona');

class EmpleadoController extends AdminController {

    public function index($pagina = 1) {
        try {
            $emp = new Empleado();
            $this->empleado = $emp->paginar($pagina);
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
      /**
     * Crea un empleado desde el backend.
     */
    public function crear() {
        try {
            //obtenemos los empleadosusuarios activos para listarlos en el form
            //ya que al crear un user se deben especificar los roles que poseerá
            //$this->roles = Load::model('roles')->find_all_by_activo(1);

            if ((Input::hasPost('persona'))&& (Input::hasPost('empleado')) ){
            //esto es para tener atributos que no son campos de la tabla
                $emp = new Empleado(); 
                $per = new Persona();
                //guarda los datos del usuario, y le asigna los roles 
                //seleccionados en el formulario.
                $per->begin();
                $persona = $per->guardar(Input::post('persona'));
                $persona_id = $per->getUltimaPersona();
                if($persona){
                    $lcEmp = $emp->guardar(Input::post('empleado'), array('persona_id'=>$persona_id->id) );
                    if ($lcEmp){
                        $per->commit();
                        Flash::valid('El Empleado Ha Sido Agregado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    }
                    else {
                        $per->rollback();
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                    }
                }
            }
            else{
                return false;
            }

        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
}
