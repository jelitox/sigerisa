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
Load::models('caracteristica');

class CaracteristicaController extends AdminController {

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
            $caracteristicas = new Caracteristica();
            $this->caracteristicas = $caracteristicas->paginate("page: $pagina");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
            $this->titulo = 'Crear Caracteristica';

            if (Input::hasPost('caracteristica')) {
                $caracteristica = new Caracteristica(Input::post('caracteristica'));
                if ($caracteristica->save()) {
                    Flash::valid('El Caracteristica Ha Sido Agregado Exitosamente...!!!');
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
        $this->titulo = 'Editar Caracteristica';
        try {
            $id = (int) $id;

            View::select('crear');

            $caracteristica = new Caracteristica();
            $this->caracteristica = $caracteristica->find_first($id);

            if ($this->caracteristica) {//validamos la existencia del recurso.
                if (Input::hasPost('caracteristica')) {
                    if ($caracteristica->update(Input::post('caracteristica'))) {
                        Flash::valid('El Caracteristica ha sido Actualizado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect('/admin/caracteristica/index');
                        }
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                        unset($this->caracteristica); //para que cargue el $_POST en el form
                    }
                }
            } else {
                Flash::warning("No existe ningun caracteristica con id '{$id}'");
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
            $rec = new Caracteristica();

            if (is_int($id)) {

                if (!$rec->find_first($id)) {
                    Flash::warning("No existe ningun caracteristica con id '{$id}'");
                } elseif ($rec->delete()) {
                    Flash::valid("El caracteristica <b>{$rec->caracteristica}</b> ha sido Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudo Eliminar el Caracteristica <b>{$rec->caracteristica}</b>...!!!");
                }
            } elseif (is_string($id)) {
                if ($rec->delete_all("id IN ($id)")) {
                    Flash::valid("El Caracteristica <b>{$id}</b> fue Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudieron Eliminar los Caracteristicas...!!!");
                }
            } elseif (Input::hasPost('caracteristicas_id')) {
                $this->ids = Input::post('caracteristicas_id');
                return;
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

}
