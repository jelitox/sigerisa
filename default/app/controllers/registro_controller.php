<?php

/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 * LICENSE
 *
 *
 * @package Controller
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */

class RegistroController extends AppController {

	public function before_filter(){
		if (!Config::get('config.application.registro')){
			return View::notFound();
		}
	}

    public function index() {
        if (Input::hasPost('usuarios')){

            //if (Load::model('usuarios', Input::post('registro'))->registrar()){
			//	Flash::valid("Exito");
			//}else{
			//	Flash::error("Problemas");			
			//}
        }else{ return false;
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
