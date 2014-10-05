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
Load::models('tipo_solicitud');
Load::models('tiposolicitud_caracteristica');

class TipoSolicitudController extends AdminController {

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
            $tipo_solicitudes = new Tipo_solicitud();
            $this->tipo_solicitudes = $tipo_solicitudes->paginate("page: $pagina");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
            $this->titulo = 'Crear Tipo_solicitud';

            if (Input::hasPost('tipo_solicitud')) {
                $tipo_solicitud = new Tipo_solicitud(Input::post('tipo_solicitud'));
                if ($tipo_solicitud->save()) {
                    Flash::valid('El Tipo_solicitud Ha Sido Agregado Exitosamente...!!!');
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
        $this->titulo = 'Editar Tipo_solicitud';
        try {
            $id = (int) $id;

            View::select('crear');

            $tipo_solicitud = new Tipo_solicitud();
            $this->tipo_solicitud = $tipo_solicitud->find_first($id);

            if ($this->tipo_solicitud) {//validamos la existencia del recurso.
                if (Input::hasPost('tipo_solicitud')) {
                    if ($tipo_solicitud->update(Input::post('tipo_solicitud'))) {
                        Flash::valid('El Tipo_solicitud ha sido Actualizado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                        unset($this->tipo_solicitud); //para que cargue el $_POST en el form
                    }
                }
            } else {
                Flash::warning("No existe ningun tipo_solicitud con id '{$id}'");
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
            $rec = new Tipo_solicitud();

            if (is_int($id)) {

                if (!$rec->find_first($id)) {
                    Flash::warning("No existe ningun tipo_solicitud con id '{$id}'");
                } elseif ($rec->delete()) {
                    Flash::valid("El tipo_solicitud <b>{$rec->tipo_solicitud}</b> ha sido Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudo Eliminar el Tipo_solicitud <b>{$rec->tipo_solicitud}</b>...!!!");
                }
            } elseif (is_string($id)) {
                if ($rec->delete_all("id IN ($id)")) {
                    Flash::valid("El Tipo_solicitud <b>{$id}</b> fue Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudieron Eliminar los Tipo_solicituds...!!!");
                }
            } elseif (Input::hasPost('tipo_solicitudes_id')) {
                $this->ids = Input::post('tipo_solicitudes_id');
                return;
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

  public function asignar($id){
            $id = (int) $id;
            $tipo_solicitud = new Tipo_solicitud();
            $tipo_solicitud->getInformacionTiposolicitud($id);
            /*if (Input::hasPost('detalle_denuncia')) {
                $denuncia_dt = new DetalleDenuncia();
                if($denuncia_dt->guardar(Input::post('detalle_denuncia'), array('denuncia_id'=>$id))) {
                    $denuncia->estatus = 'A';
                    $denuncia->save();
                    Flash::valid('La denuncia Ha Sido Asiganda Exitosamente...!!!');
                    if (!Input::isAjax()) {
                        return Router::redirect();
                    }
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
            $this->denuncia= $denuncia;
            */
            $this->titulo = 'Asiganción de Personal a la Denuncia';

    }

}

