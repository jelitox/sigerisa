<?php

/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 *
 * @package Modelos
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
class Persona extends ActiveRecord
{

    protected function initialize(){
        
    }

    protected function before_save() {
        $fecha_nac= new DateTime($this->fecha_nacimiento);
        $this->fecha_nacimiento = $fecha_nac->format('Y-m-d');

    }



    /**
     * Devuelve los usuarios de la bd Paginados.
     * 
     * @param  integer $pagina numero de pagina a mostrar
     * @return array          resultado de la consulta
     */
    public function paginar($pagina = 1)
    {
        return $this->paginate("page: $pagina");
    }
    /**
     * Guarda los datos de un usuario, y los roles que va a poseer
     *
     * @param array $data datos que se enviaron del form
     * @param array $roles ids de los roles a guardar para el user
     * @return boolean retorna TRUE si se pudieron guardar los datos con exito
     */
    public function guardar($data){
        $obj = new Persona($data);
        $rs = $obj->create();
        return $rs;
    }

    /* obtener el ultimo registro */

    public function getUltimaPersona(){
        return $this->find_by_sql('SELECT id FROM persona ORDER BY id DESC LIMIT 1');
    }

}
