<?php
/**
 * @package Controller
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Alexis Borges <programador.manuel@gmail.com>
 */
Load::models('usuarios');
Load::models('persona');
class RegistroController extends AppController {
	public function before_filter(){
		if (!Config::get('config.application.registro')){
			return View::notFound();
		}
	}
    public function index() {
        if ((Input::hasPost('usuarios'))&& (Input::hasPost('persona')) ){
            //esto es para tener atributos que no son campos de la tabla
                $rol = array('id'=>'1');
                $usr = new Usuarios(); 
                $per = new Persona();
                //guarda los datos del usuario, y le asigna los roles 
                //seleccionados en el formulario.
                $usr->begin();
                $persona = $per->guardar(Input::post('persona'));
                $persona_id = $per->getUltimaPersona();
                if($persona){
                    if ( $usr->guardar(Input::post('usuarios'), $rol, array('persona_id'=>$persona_id->id) ) ){
                        $usr->commit();
                        Flash::valid('El Usuario Ha Sido Agregado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    }
                    else {
                        $usr->rollback();
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                    }
                }
        }
        else{
            return false;
        }
    }

    public function activar($id_usuario, $hash) {
        $usuario = Load::model('usuarios');
        if ($usuario->activarCuenta($id_usuario, $hash)) {
            $this->user = $usuario;
        } else {
            View::response('error');
        }
    }






}
