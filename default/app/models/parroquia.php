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
 * @package Modelos
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
class Parroquia extends ActiveRecord {

//    public $debug = true;

    protected function initialize() {
        //validaciones
        $this->has_one('municipio');
        $this->validates_presence_of('nombre', 'message: Debe escribir un <b>Nombre</b>');
        $this->validates_presence_of('municipio_id', 'message: Debe seleccionar un municipio');
        $this->validates_uniqueness_of('nombre', 'message: Esta Parroquia <b>ya existe</b> en el sistema');
    }

   /**
     * Devuelve los menus de la bd paginados
     * 
     *@param  int $pagina       
     * @return array
     */
    public function parroquias_paginados($pagina) {
        $cols = 'parroquia.' . join(',parroquia.', $this->fields) . ",m.nombre as municipio";
        $joins = 'INNER JOIN municipio as m ON m.id = municipio_id ';
        //$joins .= 'LEFT JOIN menus as m2 ON m2.id = menus.menus_id ';
        return $this->paginate("page: $pagina", "columns: $cols", "join: $joins");
    }

    /**
     * Obtiene las acciones existentes por cada controlador.
     * 
     * @return array 
     */
    public function accionesPorControlador(){
        $res = $this->find("modulo = '$this->modulo' AND controlador = '$this->controlador' AND accion != ''",
                'columns: id,accion');
        return $res;
    }

}
