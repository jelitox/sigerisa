<?php

/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 * LICENSE
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * @package Modelos
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
class RolesUsuarios extends ActiveRecord {

//    public $debug = true;

    protected function initialize() {
        $this->belongs_to('usuarios');
        $this->belongs_to('roles');
    }

    /**
     * Crea una asociación Usuario, Rol
     * @param  int $usuario id usuario
     * @param  int    $rol     id rol
     * @return boolean  
     */
    public function asignarRol($id_usuario,$id_rol){
        return ($this->create(array(
            'usuarios_id' => $id_usuario,
            'roles_id' => $id_rol,
        )));
    }
}

