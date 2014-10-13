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
Load::models('solicitud','tipo_solicitud','tiposolicitud_caracteristica');
    


class SolicitudController extends AdminController {

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
            $solicitudes = new Solicitud();
            $this->solicitudes = $solicitudes->paginate("page: $pagina");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
            $this->titulo = 'Crear Solicitud';
            $tiposolicitud = new TipoSolicitud(); 
            $this->tiposolicitudes = $tiposolicitud->getListadoTipoSolicitud();
            
            if (Input::hasPost('solicitud')) {
                $solicitud = new Solicitud(Input::post('solicitud'));
                if ($solicitud->save()) {
                    Flash::valid('La Solicitud Ha Sido Agregado Exitosamente...!!!');
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
  public function getTiposolicitudCaracteristicas(){
       View::response('view'); 
       $tiposolicitud_id=Input::post('tiposolicitud_id');
       $tiposolicitud_caracteristica = new TiposolicitudCaracteristica(); 
       $this->tiposolicitud_caracteristicas = $tiposolicitud_caracteristica->obtener_tiposolicitud_caracteristica($tiposolicitud_id);
       //var_dump($this->tiposolicitud_caracteristicas);
       foreach($this->tiposolicitud_caracteristicas as $this->dis) {
                 //echo Form::radio('solicitud.caracteristica', $dis->tipo_valor); 
                //echo $this->dis{0}; 
        }      
    }

    public function editar($id) {
        $this->titulo = 'Editar Solicitud';
        try {
            $id = (int) $id;

            View::select('crear');

            $solicitud = new Solicitud();
            $this->solicitud = $solicitud->find_first($id);

            if ($this->solicitud) {//validamos la existencia del recurso.
                if (Input::hasPost('solicitud')) {
                    if ($solicitud->update(Input::post('solicitud'))) {
                        Flash::valid('La Solicitud ha sido Actualizado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                        unset($this->solicitud); //para que cargue el $_POST en el form
                    }
                }
            } else {
                Flash::warning("No existe ninguna solicitud con id '{$id}'");
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
            $rec = new Solicitud();

            if (is_int($id)) {

                if (!$rec->find_first($id)) {
                    Flash::warning("No existe ninguna solicitud con id '{$id}'");
                } elseif ($rec->delete()) {
                    Flash::valid("La solicitud <b>{$rec->solicitud}</b> ha sido Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudo Eliminar la Solicitud <b>{$rec->solicitud}</b>...!!!");
                }
            } elseif (is_string($id)) {
                if ($rec->delete_all("id IN ($id)")) {
                    Flash::valid("La Solicitud <b>{$id}</b> fue Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudieron Eliminar las Solicitudes...!!!");
                }
            } elseif (Input::hasPost('solicitudes_id')) {
                $this->ids = Input::post('solicitudes_id');
                return;
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

}
