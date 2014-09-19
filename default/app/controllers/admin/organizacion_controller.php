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
Load::models('organizacion');

class OrganizacionController extends AdminController {

    /**
     * Luego de ejecutar las acciones, se verifica si la petición es ajax
     * para no mostrar ni vista ni template.
     */
    protected function after_filter() {
        if (Input::isAjax()) {
            View::select(NULL, NULL);
        }
    }

    public function index($pagina = 1) {
        try {
            $organizaciones = new Organizacion();
            $this->organizaciones = $organizaciones->paginate("page: $pagina");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
            $this->titulo = 'Crear Organización';

            if (Input::hasPost('organizacion')) {
                $cargo = new Organizacion(Input::post('organizacion'));
                if ($cargo->save()) {
                    Flash::valid('La Organización Ha Sido Agregada Exitosamente...!!!');
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

    public function editar($id) {
        $this->titulo = 'Editar Organización';
        try {
            $id = (int) $id;

            View::select('crear');

            $organizacion = new Organizacion();
            $this->organizacion = $organizacion->find_first($id);

            if ($this->organizacion) {//validamos la existencia del recurso.
                if (Input::hasPost('organizacion')) {
                    if ($organizacion->update(Input::post('organizacion'))) {
                        Flash::valid('La Organización ha sido Actualizado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                        unset($this->organizacion); //para que cargue el $_POST en el form
                    }
                }
            } else {
                Flash::warning("No existe ninguna organizacion con id '{$id}'");
                if (!Input::isAjax()) {
                    return Router::redirect();
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function eliminar($id = NULL) {
        try {
            $rec = new Organizacion();

            if (is_int($id)) {

                if (!$rec->find_first($id)) {
                    Flash::warning("No existe ninguna organizacion con id '{$id}'");
                } elseif ($rec->delete()) {
                    Flash::valid("La organizacion <b>{$rec->organizacion}</b> ha sido Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudo Eliminar la organizacion <b>{$rec->organizacion}</b>...!!!");
                }
            } elseif (is_string($id)) {
                if ($rec->delete_all("id IN ($id)")) {
                    Flash::valid("La organización <b>{$id}</b> fue Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudieron Eliminar la organizacion...!!!");
                }
            } elseif (Input::hasPost('organizacion_id')) {
                $this->ids = Input::post('organizacion_id');
                return;
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

}
