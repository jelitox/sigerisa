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
class TiposolicitudCaracteristicaController extends AdminController {

    public $model = 'tiposolicitud_caracteristica';

    public function index($page=1) {
        try {
            $this->results = Load::model('tipo_solicitud')->paginate("page: $page", 'order: id');
            $this->caracteristicas = Load::model('caracteristica')->find();
            $this->tiposolicitud_caracteristica = Load::model('tiposolicitud_caracteristica')->obtener_tiposolicitud_caracteristicas();
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function asignar_tiposolicitud_caracteristica($page = 1) {
        //por ahora este paso no es auditable :-s
        try {
            if (Input::hasPost('priv') || Input::hasPost('privilegios_pagina')) {
                $obj = Load::model('tiposolicitud_caracteristica');
                $datos = Input::post('priv');
                $priv_pag = Input::post('privilegios_pagina');
                if ($obj->editartiposolicitud_caracteristicas($datos, $priv_pag)) {
                    Flash::valid('Los privilegios Fueron Editados Exitosamente...!!!');
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::toAction("index/$page");
    }

}

