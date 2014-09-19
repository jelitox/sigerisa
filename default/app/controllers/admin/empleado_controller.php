<?php
/**
* Backend - KumbiaPHP Backend
* PHP version 5
* LICENSE
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* ERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Affero General Public License for more details.
*
* You should have received a copy of the GNU Affero General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
* @package Controller
* @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
* @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
*/
Load::models('empleado');

class EmpleadoController extends AdminController {

    public function index($pagina = 1) {
        try {
            $usr = new Empleado();
            $this->empleado = $usr->paginar($pagina);
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

            if (Input::hasPost('empleado')) {
                //esto es para tener atributos que no son campos de la tabla
                $usr = new Empleado(Input::post('empleado')); 
                //guarda los datos del empleado, y le asigna los roles 
                //seleccionados en el formulario.
                if ($usr->guardar(Input::post('empleado'))) {
                    Flash::valid('El Usuario Ha Sido Agregado Exitosamente...!!!');
                    if (!Input::isAjax()) {
                        return Router::redirect();
                    }
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
}
