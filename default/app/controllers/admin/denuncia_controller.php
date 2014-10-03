<?php
/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 * LICENSE
 *
 * @package Controller
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
Load::models('denuncia');
Load::models('detalle_denuncia');

class DenunciaController extends AdminController {

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
            $denuncias = new Denuncia();
            $this->denuncias = $denuncias->paginate("page: $pagina");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
    public function listado($pagina = 1) {
        try {
            $denuncias = new Denuncia();
            $this->denuncias = $denuncias->paginarRegistradas($pagina);
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
        public function asignadas($pagina = 1) {
        try {
            $denuncias = new Denuncia();
            $this->denuncias = $denuncias->paginarAsignadas($pagina);
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
            $this->titulo = 'Crear Denuncia';

            if (Input::hasPost('denuncia')) {
                $denuncia = new Denuncia(Input::post('denuncia'));
                if ($denuncia->save()) {
                    Flash::valid('La denuncia Ha Sido Agregado Exitosamente...!!!');
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

    public function asignar($id){
            $id = (int) $id;
            $denuncia = new Denuncia();
            $denuncia->getInformacionDenuncia($id);
            if (Input::hasPost('detalle_denuncia')) {
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
            $this->titulo = 'Asiganción de Personal a la Denuncia';

    }

    public function rechazar($id){
        $id = (int) $id;
        $denuncia = new Denuncia();
        $denuncia->getInformacionDenuncia($id);


        $this->denuncia= $denuncia;
        $this->titulo = 'Rechazo de la Denuncia';

    }


    public function editar($id) {
        $this->titulo = 'Editar Cargo';
        try {
            $id = (int) $id;

            View::select('crear');

            $cargo = new Cargo();
            $this->cargo = $cargo->find_first($id);

            if ($this->cargo) {//validamos la existencia del recurso.
                if (Input::hasPost('cargo')) {
                    if ($cargo->update(Input::post('cargo'))) {
                        Flash::valid('El Cargo ha sido Actualizado Exitosamente...!!!');
                        if (!Input::isAjax()) {
                            return Router::redirect();
                        }
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                        unset($this->cargo); //para que cargue el $_POST en el form
                    }
                }
            } else {
                Flash::warning("No existe ningun cargo con id '{$id}'");
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
            $rec = new Cargo();

            if (is_int($id)) {

                if (!$rec->find_first($id)) {
                    Flash::warning("No existe ningun cargo con id '{$id}'");
                } elseif ($rec->delete()) {
                    Flash::valid("El cargo <b>{$rec->cargo}</b> ha sido Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudo Eliminar el Cargo <b>{$rec->cargo}</b>...!!!");
                }
            } elseif (is_string($id)) {
                if ($rec->delete_all("id IN ($id)")) {
                    Flash::valid("El Cargo <b>{$id}</b> fue Eliminado...!!!");
                } else {
                    Flash::warning("No se Pudieron Eliminar los Cargos...!!!");
                }
            } elseif (Input::hasPost('cargos_id')) {
                $this->ids = Input::post('cargos_id');
                return;
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

}
