-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2014 a las 10:17:31
-- Versión del servidor: 5.5.37
-- Versión de PHP: 5.3.10-1ubuntu3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sigerisa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

DROP TABLE IF EXISTS `auditorias`;
CREATE TABLE IF NOT EXISTS `auditorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `fecha_at` datetime NOT NULL,
  `accion_realizada` text NOT NULL,
  `tabla_afectada` varchar(150) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`fecha_at`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `auditorias`
--

INSERT INTO `auditorias` (`id`, `usuarios_id`, `fecha_at`, `accion_realizada`, `tabla_afectada`, `ip`) VALUES
(1, 3, '2014-09-04 00:00:00', 'DELETE FROM roles_recursos WHERE id IN (''618'',''619'',''620'',''621'',''622'',''623'',''624'',''625'',''626'',''627'',''628'',''629'',''630'',''631'',''632'',''633'',''634'',''635'',''636'',''637'',''638'',''639'',''640'',''641'',''642'',''643'',''644'')', 'ROLES_RECURSOS', '127.0.0.1'),
(2, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''20'',nombre = ''Configuracion'',url = ''config/municipio/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''23''', 'MENUS', '127.0.0.1'),
(3, 3, '2014-09-04 00:00:00', 'UPDATE recursos SET modulo = ''config'',controlador = ''municipio'',accion = ''index'',recurso = ''config/municipio/index'',descripcion = ''menu configuracon de municipio'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(4, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''15'',nombre = ''Configuracion'',url = ''admin/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''23''', 'MENUS', '127.0.0.1'),
(5, 3, '2014-09-04 00:00:00', 'UPDATE usuarios SET login = ''admin'',clave = ''baxuN8I44GotM'',nombres = ''Administrador'',email = ''correo@correo.com'',activo = ''1'' WHERE  id = ''3''', 'USUARIOS', '127.0.0.1'),
(6, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''11'',nombre = ''Inicio'',url = ''index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(7, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''15'',nombre = ''Inicio'',url = ''admin/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(8, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(9, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(10, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(11, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(12, 3, '2014-09-04 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''100'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(13, 3, '2014-09-07 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicio/servicio/index'',posicion = ''1'',clases = ''servicio'',visible_en = ''3'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(14, 3, '2014-09-07 00:00:00', 'UPDATE recursos SET modulo = ''servicios'',controlador = ''servicios'',accion = NULL,recurso = ''servicios/servicios/*'',descripcion = ''servicios'',activo = ''1'' WHERE  id = ''23''', 'RECURSOS', '127.0.0.1'),
(15, 3, '2014-09-07 00:00:00', 'UPDATE recursos SET modulo = NULL,controlador = ''servicios'',accion = ''index'',recurso = ''servicios/index'',descripcion = ''servicios'',activo = ''1'' WHERE  id = ''23''', 'RECURSOS', '127.0.0.1'),
(16, 3, '2014-09-07 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''3'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(17, 3, '2014-09-07 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(18, 3, '2014-09-12 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''2'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(19, 3, '2014-09-12 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(20, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''mision_vision/index'',posicion = ''1'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(21, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''180'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(22, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''quienes_somos'',accion = ''index'',recurso = ''quienes_somos/quienes_somos/index'',descripcion = ''Quienes somos'',activo = ''1'' WHERE  id = ''24''', 'RECURSOS', '127.0.0.1'),
(23, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = NULL,controlador = ''mision'',accion = ''index'',recurso = ''mision/index'',descripcion = ''Mision y vision'',activo = ''1'' WHERE  id = ''25''', 'RECURSOS', '127.0.0.1'),
(24, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''171'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(25, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''24'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''170'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(26, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''24'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''40'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(27, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(28, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(29, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = NULL,recursos_id = ''30'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''40'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(30, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''mision'',accion = ''index'',recurso = ''quienes_somos/mision/index'',descripcion = ''Mision y vision'',activo = ''1'' WHERE  id = ''25''', 'RECURSOS', '127.0.0.1'),
(31, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''objetivos'',accion = ''index'',recurso = ''quienes_somos/objetivos/index'',descripcion = ''Objetivos'',activo = ''1'' WHERE  id = ''26''', 'RECURSOS', '127.0.0.1'),
(32, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''resena_historica'',accion = ''index'',recurso = ''quienes_somos/resena_historica/index'',descripcion = ''Reseña Historica'',activo = ''1'' WHERE  id = ''27''', 'RECURSOS', '127.0.0.1'),
(33, 3, '2014-09-15 00:00:00', 'UPDATE recursos SET modulo = ''config'',controlador = ''empleado'',accion = ''index'',recurso = ''config/empleado/index'',descripcion = ''empleado'',activo = ''1'' WHERE  id = ''31''', 'RECURSOS', '127.0.0.1'),
(34, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado'',posicion = ''100'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(35, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''41'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(36, 3, '2014-09-15 00:00:00', 'DELETE FROM roles_recursos WHERE id IN (''678'',''679'',''680'',''681'',''682'',''683'')', 'ROLES_RECURSOS', '127.0.0.1'),
(37, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''81'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(38, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''26'',nombre = ''Objetivos'',url = ''quienes_somos/objetivos/index'',posicion = ''42'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''31''', 'MENUS', '127.0.0.1'),
(39, 3, '2014-09-15 00:00:00', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(40, 3, '2014-09-18 22:37:28', 'UPDATE recursos SET modulo = ''admin'',controlador = ''municipio'',accion = ''index'',recurso = ''admin/municipio/index'',descripcion = ''menu configuracon de municipio'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(41, 3, '2014-09-18 22:37:47', 'UPDATE recursos SET modulo = ''admin'',controlador = ''empleado'',accion = ''index'',recurso = ''admin/empleado/index'',descripcion = ''empleado'',activo = ''1'' WHERE  id = ''31''', 'RECURSOS', '127.0.0.1'),
(42, 3, '2014-09-18 22:38:24', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''20'',nombre = ''Municipio'',url = ''admin/municipio/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''24''', 'MENUS', '127.0.0.1'),
(43, 3, '2014-09-18 22:55:58', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''81'',clases = NULL,visible_en = ''2'',activo = ''0'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(44, 3, '2014-09-18 22:56:06', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''81'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(45, 3, '2014-09-18 22:56:24', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''admin/empleado/index'',posicion = ''81'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(46, 3, '2014-09-18 23:08:54', 'UPDATE recursos SET modulo = ''admin'',controlador = ''empleado'',accion = ''*'',recurso = ''admin/empleado/*'',descripcion = ''empleado'',activo = ''1'' WHERE  id = ''31''', 'RECURSOS', '127.0.0.1'),
(47, 3, '2014-09-18 23:47:58', 'DELETE FROM roles_recursos WHERE id IN (''648'',''649'',''650'',''687'',''688'',''651'',''652'',''653'',''654'',''655'',''656'',''689'',''690'',''691'',''657'',''658'',''659'',''660'',''661'',''662'',''663'',''664'',''665'')', 'ROLES_RECURSOS', '127.0.0.1'),
(48, 3, '2014-09-19 00:36:20', 'DELETE FROM roles_recursos WHERE id IN (''695'',''696'',''697'',''698'',''699'',''700'',''701'',''702'',''703'',''704'',''705'',''706'',''707'',''708'',''709'',''710'',''711'',''712'',''713'',''714'',''715'',''716'',''717'')', 'ROLES_RECURSOS', '127.0.0.1'),
(49, 3, '2014-09-19 00:36:52', 'UPDATE recursos SET modulo = ''admin'',controlador = ''organizacion'',accion = ''*'',recurso = ''admin/organizacion/*'',descripcion = ''modulo de organizacion'',activo = ''1'' WHERE  id = ''33''', 'RECURSOS', '127.0.0.1'),
(50, 3, '2014-09-19 00:40:42', 'UPDATE organizacion SET descripcion = ''Consejo Comunal 12'',observacion = ''prueba dos'' WHERE  id = ''2''', 'ORGANIZACION', '127.0.0.1'),
(51, 3, '2014-09-19 00:50:04', 'DELETE FROM roles_recursos WHERE id IN (''723'',''724'',''725'',''726'',''727'',''728'',''729'',''730'',''731'',''732'',''733'',''734'',''735'',''736'',''737'',''738'',''739'',''721'',''722'')', 'ROLES_RECURSOS', '127.0.0.1'),
(52, 3, '2014-09-19 00:52:06', 'DELETE FROM roles_recursos WHERE id IN (''746'',''747'',''748'',''749'',''750'',''751'',''752'',''753'',''754'',''755'',''756'',''757'',''758'',''759'',''760'',''761'',''762'',''763'',''764'',''765'',''766'',''767'',''768'',''769'',''770'')', 'ROLES_RECURSOS', '127.0.0.1'),
(53, 3, '2014-09-19 00:52:21', 'DELETE FROM roles_recursos WHERE id IN (''740'',''741'',''742'',''743'',''744'',''745'',''718'',''719'',''720'',''666'',''667'',''668'',''669'',''670'',''671'',''672'',''673'',''674'')', 'ROLES_RECURSOS', '127.0.0.1'),
(54, 3, '2014-09-19 00:53:20', 'DELETE FROM roles_recursos WHERE id IN (''794'',''795'',''796'',''797'',''798'',''799'',''800'',''801'',''802'',''803'',''804'',''805'',''806'',''807'',''808'',''809'',''810'',''811'',''812'',''813'',''814'')', 'ROLES_RECURSOS', '127.0.0.1'),
(55, 3, '2014-09-19 01:05:51', 'UPDATE recursos SET modulo = ''admin'',controlador = ''municipio'',accion = ''index'',recurso = ''admin/municipio/index'',descripcion = ''menu configuracon de municipio'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(56, 3, '2014-09-19 01:06:09', 'UPDATE recursos SET modulo = ''admin'',controlador = ''municipio'',accion = ''crear'',recurso = ''admin/municipio/crear'',descripcion = ''formulario de registro de municipios'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(57, 3, '2014-09-19 01:06:21', 'UPDATE recursos SET modulo = ''admin'',controlador = ''municipio'',accion = ''crear'',recurso = ''admin/municipio/crear'',descripcion = ''formulario de registro de municipios'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(58, 3, '2014-09-19 01:06:38', 'UPDATE recursos SET modulo = ''admin'',controlador = ''municipio'',accion = ''eliminar'',recurso = ''admin/municipio/eliminar'',descripcion = ''vista para eliminar registro de municipios'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(59, 3, '2014-09-19 01:12:31', 'DELETE FROM roles_recursos WHERE id IN (''771'',''772'',''773'',''774'',''775'',''776'',''777'',''778'',''779'',''780'',''781'',''782'',''783'',''784'',''785'',''786'',''787'',''788'',''789'',''790'',''791'',''792'',''793'',''815'',''816'',''817'',''818'',''819'',''820'',''821'',''822'',''823'',''824'',''825'',''826'',''827'',''828'',''829'',''830'',''831'',''832'',''833'',''834'',''835'',''836'',''837'',''692'',''693'',''694'')', 'ROLES_RECURSOS', '127.0.0.1'),
(60, 3, '2014-09-19 01:12:54', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''40'',nombre = ''Municipio'',url = ''admin/municipio/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''24''', 'MENUS', '127.0.0.1'),
(61, 3, '2014-09-19 01:41:58', 'DELETE FROM roles_recursos WHERE id IN (''838'',''839'',''840'',''841'',''842'',''843'',''844'',''845'',''846'',''847'',''848'',''849'',''850'',''851'',''852'',''853'',''854'',''855'',''856'',''857'',''858'',''859'',''860'',''861'',''862'',''863'',''864'',''865'',''866'',''867'',''868'',''869'',''870'',''871'',''872'',''873'',''874'',''875'',''876'',''877'',''878'',''879'',''880'',''881'',''882'',''883'',''884'',''885'',''886'',''887'')', 'ROLES_RECURSOS', '127.0.0.1'),
(62, 3, '2014-09-19 04:42:45', 'DELETE FROM roles_recursos WHERE id IN (''888'',''889'',''890'',''891'',''892'',''893'',''894'',''895'',''896'',''897'',''898'',''899'',''900'',''901'',''902'',''903'',''904'',''905'',''906'',''907'',''908'',''909'',''910'',''911'',''912'',''913'',''914'',''915'',''916'',''917'',''918'',''919'',''920'',''921'',''922'',''923'',''924'',''925'',''926'',''927'',''928'',''929'',''930'',''931'',''932'',''933'',''934'',''935'',''936'',''937'',''938'',''939'',''940'',''941'',''942'',''943'')', 'ROLES_RECURSOS', '127.0.0.1'),
(63, 3, '2014-09-19 04:45:44', 'DELETE FROM roles_recursos WHERE id IN (''944'',''945'',''946'',''947'',''948'',''949'',''950'',''951'',''952'',''953'',''954'',''955'',''956'',''957'',''958'',''959'',''960'',''961'',''962'',''963'',''964'',''965'',''966'',''967'',''968'',''969'',''970'',''971'',''972'',''973'',''974'',''975'',''976'',''977'',''978'',''979'',''980'',''981'',''982'',''983'',''984'',''985'',''986'',''987'',''988'',''989'',''990'',''991'',''992'',''993'',''994'',''995'',''996'',''997'',''998'',''999'',''1000'',''1001'')', 'ROLES_RECURSOS', '127.0.0.1'),
(64, 3, '2014-09-19 04:47:37', 'DELETE FROM roles_recursos WHERE id IN (''1002'',''1003'',''1004'',''1005'',''1006'',''1007'',''1008'',''1009'',''1010'',''1011'',''1012'',''1013'',''1014'',''1015'',''1016'',''1017'',''1018'',''1019'',''1020'',''1021'',''1022'',''1023'',''1024'',''1025'',''1026'',''1027'',''1028'',''1029'',''1030'',''1031'',''1032'',''1033'',''1034'',''1035'',''1036'',''1037'',''1038'',''1039'',''1040'',''1041'',''1042'',''1043'',''1044'',''1045'',''1046'',''1047'',''1048'',''1049'',''1050'',''1051'',''1052'',''1053'',''1054'',''1055'',''1056'',''1057'',''1058'')', 'ROLES_RECURSOS', '127.0.0.1'),
(65, 3, '2014-09-19 04:50:51', 'UPDATE recursos SET modulo = ''admin'',controlador = ''solicitud'',accion = ''index'',recurso = ''admin/solicitud/index'',descripcion = ''listado principal de solicitudes'',activo = ''1'' WHERE  id = ''45''', 'RECURSOS', '127.0.0.1'),
(66, 3, '2014-09-19 04:51:13', 'UPDATE menus SET menus_id = NULL,recursos_id = ''45'',nombre = ''Solicitudes'',url = ''admin/solicitud/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''35''', 'MENUS', '127.0.0.1'),
(67, 3, '2014-09-19 04:55:24', 'UPDATE menus SET menus_id = NULL,recursos_id = ''21'',nombre = ''Noticias'',url = ''noticias/noticias/index'',posicion = ''100'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''25''', 'MENUS', '127.0.0.1'),
(68, 3, '2014-09-19 04:55:29', 'UPDATE menus SET menus_id = ''25'',recursos_id = ''21'',nombre = ''Circulares'',url = ''noticias/noticias/index'',posicion = ''80'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''26''', 'MENUS', '127.0.0.1'),
(69, 3, '2014-09-19 05:04:13', 'UPDATE menus SET menus_id = NULL,recursos_id = ''46'',nombre = ''Denuncias'',url = ''admin/denuncia/index'',posicion = ''2'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''36''', 'MENUS', '127.0.0.1'),
(70, 3, '2014-09-19 05:04:49', 'UPDATE recursos SET modulo = ''admin'',controlador = ''denuncia'',accion = ''index'',recurso = ''admin/denuncia/index'',descripcion = ''listado principal de denuncias'',activo = ''1'' WHERE  id = ''46''', 'RECURSOS', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `observacion`) VALUES
(1, 'Coordinador', 'Coordinador del Departamento'),
(2, 'Funcionario', 'Funcionario del Departamento'),
(3, 'Secretaria', 'Secretaria del Departamento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancia_inspeccion_sanitaria`
--

DROP TABLE IF EXISTS `constancia_inspeccion_sanitaria`;
CREATE TABLE IF NOT EXISTS `constancia_inspeccion_sanitaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_constancia_inspeccion_sanitaria_solicitud1_idx` (`solicitud_id`),
  KEY `fk_constancia_inspeccion_sanitaria_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia`
--

DROP TABLE IF EXISTS `denuncia`;
CREATE TABLE IF NOT EXISTS `denuncia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `fecha_denuncia` date DEFAULT NULL,
  `datos_denunciado` text,
  `direccion_denunciado` text,
  `planteamiento_problema` text,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_denuncia_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_denuncia`
--

DROP TABLE IF EXISTS `detalle_denuncia`;
CREATE TABLE IF NOT EXISTS `detalle_denuncia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NOT NULL,
  `denuncia_id` int(11) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `fecha_inspeccion` date DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_denuncia_denuncia1_idx` (`denuncia_id`),
  KEY `fk_detalle_denuncia_empleado1_idx` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------



--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado_persona` (`persona_id`),
  KEY `fk_empleado_cargo` (`cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menus_id` int(11) DEFAULT NULL,
  `recursos_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `posicion` int(11) NOT NULL DEFAULT '100',
  `clases` varchar(50) DEFAULT NULL,
  `visible_en` int(11) NOT NULL DEFAULT '1',
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `menus_id` (`menus_id`),
  KEY `recursos_id` (`recursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `menus_id`, `recursos_id`, `nombre`, `url`, `posicion`, `clases`, `visible_en`, `activo`) VALUES
(1, 18, 1, 'Usuarios', 'admin/usuarios', 10, NULL, 2, 1),
(3, 18, 2, 'Roles', 'admin/roles', 20, NULL, 2, 1),
(4, 18, 3, 'Recursos', 'admin/recursos', 30, NULL, 2, 1),
(5, 18, 4, 'Menu', 'admin/menu', 100, NULL, 2, 1),
(7, 18, 5, 'Privilegios', 'admin/privilegios', 90, NULL, 2, 1),
(18, NULL, 17, 'Administración', 'admin/usuarios/index', 100, NULL, 2, 1),
(19, NULL, 22, 'Inicio', 'admin/principal/index', 100, NULL, 2, 1),
(21, 18, 15, 'Config. Aplicacion', 'admin', 1000, NULL, 2, 1),
(22, 18, 18, 'Auditorias', 'admin/auditorias', 900, NULL, 2, 1),
(23, NULL, 15, 'Configuracion', 'admin/index', 80, NULL, 2, 1),
(24, 23, 40, 'Municipio', 'admin/municipio/index', 80, NULL, 2, 1),
(25, NULL, 21, 'Noticias', 'noticias/noticias/index', 100, NULL, 1, 0),
(26, 25, 21, 'Circulares', 'noticias/noticias/index', 80, NULL, 1, 0),
(27, NULL, 23, 'Servicios', 'servicios/index', 180, 'servicios', 1, 1),
(28, NULL, 30, 'Quienes Somos', 'quienes_somos/index', 40, NULL, 1, 1),
(30, 23, 31, 'Empleado', 'admin/empleado/index', 81, NULL, 2, 1),
(32, 23, 34, 'Cargos', 'admin/cargo/index', 85, NULL, 2, 1),
(33, 23, 37, 'Organizaciones', 'admin/organizacion/index', 12, NULL, 2, 1),
(34, 23, 42, 'Parroquias', 'admin/parroquia/index', 80, NULL, 2, 1),
(35, NULL, 45, 'Solicitudes', 'admin/solicitud/index', 1, NULL, 2, 1),
(36, NULL, 46, 'Denuncias', 'admin/denuncia/index', 2, NULL, 2, 1),
(37, NULL, 47, 'Planificación', 'admin/planificacion/index', 3, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`) VALUES
(1, 'Paez'),
(2, 'Araure');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion_funcionario`
--

DROP TABLE IF EXISTS `observacion_funcionario`;
CREATE TABLE IF NOT EXISTS `observacion_funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `observacion` text,
  `fecha_inspeccion` date DEFAULT NULL,
  `fecha_revision` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_observacion_funcionario_solicitud1_idx` (`solicitud_id`),
  KEY `fk_observacion_funcionario_empleado1_idx` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
CREATE TABLE IF NOT EXISTS `organizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `organizacion`
--

INSERT INTO `organizacion` (`id`, `descripcion`, `observacion`) VALUES
(1, 'Empresa de Prueba', 'datos de prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

DROP TABLE IF EXISTS `parroquia`;
CREATE TABLE IF NOT EXISTS `parroquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parroquia_1` (`municipio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id`, `nombre`, `municipio_id`) VALUES
(1, 'Capital Paez', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(11) NOT NULL,
  `nombre1` varchar(45) DEFAULT NULL,
  `nombre2` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono_movil` int(10) DEFAULT NULL,
  `telefono_local` int(10) DEFAULT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rif_UNIQUE` (`cedula`),
  KEY `fk_persona_organizacion` (`organizacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `fecha_nacimiento`, `direccion`, `telefono_movil`, `telefono_local`, `organizacion_id`) VALUES
(1, '123123', 'edgar ', 'enrique', 'roa', 'gutierrez', '1988-09-01', 'urb. las palmas', 414111111, 2147483647, NULL),
(2, '1231234', 'edgar', 'enrique', 'roa', 'gutierrez', '1988-09-01', 'urb. las palmas', 414111111, 25562100, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

DROP TABLE IF EXISTS `recursos`;
CREATE TABLE IF NOT EXISTS `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) DEFAULT NULL,
  `controlador` varchar(50) NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `recurso` varchar(200) NOT NULL,
  `descripcion` text,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id`, `modulo`, `controlador`, `accion`, `recurso`, `descripcion`, `activo`) VALUES
(1, 'admin', 'usuarios', NULL, 'admin/usuarios/*', 'modulo para la administracion de los usuarios del sistema', 1),
(2, 'admin', 'roles', NULL, 'admin/roles/*', 'modulo para la gestion de los roles de la aplicacion\r\n', 1),
(3, 'admin', 'recursos', NULL, 'admin/recursos/*', 'modulo para la gestion de los recursos de la aplicacion', 1),
(4, 'admin', 'menu', NULL, 'admin/menu/*', 'modulo para la administracion del menu en la app', 1),
(5, 'admin', 'privilegios', NULL, 'admin/privilegios/*', 'modulo para la administracion de los privilegios que tendra cada rol', 1),
(11, NULL, 'index', NULL, 'index/*', 'modulo inicial del sistema, donde se loguean los usuarios y donde se desloguean', 1),
(14, 'admin', 'usuarios', 'perfil', 'admin/usuarios/perfil', 'modulo para la configuracion del perfil del usuario', 1),
(15, 'admin', 'index', NULL, 'admin/index/*', 'modulo para la configuración del sistema', 1),
(17, 'admin', 'usuarios', 'index', 'admin/usuarios/index', 'modulo para listar los usuarios del sistema, lo usará¡ el menu administracion', 1),
(18, 'admin', 'auditorias', NULL, 'admin/auditorias/*', 'Modulo para revisar las acciones que los usuarios han realizado en el sistema', 1),
(19, NULL, 'index', 'index', 'index/index', 'recurso que no necesita permisos, es solo de prueba :-)', 1),
(20, 'admin', 'municipio', 'eliminar', 'admin/municipio/eliminar', 'vista para eliminar registro de municipios', 1),
(21, 'noticias', 'noticias', 'index', 'noticias/noticias/index', 'p', 1),
(22, 'admin', 'principal', 'index', 'admin/principal/index', 's', 1),
(23, NULL, 'servicios', 'index', 'servicios/index', 'servicios', 1),
(24, 'quienes_somos', 'quienes_somos', 'index', 'quienes_somos/quienes_somos/index', 'Quienes somos', 1),
(25, 'quienes_somos', 'mision', 'index', 'quienes_somos/mision/index', 'Mision y vision', 1),
(26, 'quienes_somos', 'objetivos', 'index', 'quienes_somos/objetivos/index', 'Objetivos', 1),
(27, 'quienes_somos', 'resena_historica', 'index', 'quienes_somos/resena_historica/index', 'Reseña Historica', 1),
(28, NULL, 'desarrolladores', 'index', 'desarrolladores/index', 'Desarrolladores', 1),
(29, NULL, 'contactanos', 'index', 'contactanos/index', 'Contactanos', 1),
(30, 'quienes_somos', 'index', NULL, 'quienes_somos/index/*', 'm', 1),
(31, 'admin', 'empleado', '*', 'admin/empleado/*', 'empleado', 1),
(32, 'admin', 'cargo', '*', 'admin/cargo/*', 'modulo de gestion de cargos del sistema', 1),
(33, 'admin', 'organizacion', '*', 'admin/organizacion/*', 'modulo de organizacion', 1),
(34, 'admin', 'cargo', 'index', 'admin/cargo/index', 'listado principal de los cargos', 1),
(35, 'admin', 'cargo', 'crear', 'admin/cargo/crear', 'formulario principal de registro de los cargos', 1),
(36, 'admin', 'cargo', 'eliminar', 'admin/cargo/eliminar', 'ventana para eliminar registros de los cargos', 1),
(37, 'admin', 'organizacion', 'index', 'admin/organizacion/index', 'pagina principal de registro de organizacion', 1),
(38, 'admin', 'organizacion', 'crear', 'admin/organizacion/crear', 'formulario principal de registro de organizacion', 1),
(39, 'admin', 'organizacion', 'eliminar', 'admin/organizacion/eliminar', 'vista principal de eliminar registro de organizacion', 1),
(40, 'admin', 'municipio', 'index', 'admin/municipio/index', 'listado principal de municipios', 1),
(41, 'admin', 'municipio', 'crear', 'admin/municipio/crear', 'formulario principal para registro de municipios', 1),
(42, 'admin', 'parroquia', 'index', 'admin/parroquia/index', 'listado principal de las parroquias', 1),
(43, 'admin', 'parroquia', 'crear', 'admin/parroquia/crear', 'formulario principal de registro de las parroquias', 1),
(44, 'admin', 'parroquia', 'eliminar', 'admin/parroquia/eliminar', 'vista para eliminar los registro de las parroquias', 1),
(45, 'admin', 'solicitud', 'index', 'admin/solicitud/index', 'listado principal de solicitudes', 1),
(46, 'admin', 'denuncia', 'index', 'admin/denuncia/index', 'listado principal de denuncias', 1),
(47, 'admin', 'planificacion', 'index', 'admin/planificacion/index', 'listado de planificacion de visitas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `plantilla` varchar(50) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol` (`rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`, `plantilla`, `activo`) VALUES
(1, 'usuario comun', NULL, 1),
(2, 'usuario administrador', NULL, 1),
(4, 'administrador del sistema', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_recursos`
--

DROP TABLE IF EXISTS `roles_recursos`;
CREATE TABLE IF NOT EXISTS `roles_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `recursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`),
  KEY `recursos_id` (`recursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1121 ;

--
-- Volcado de datos para la tabla `roles_recursos`
--

INSERT INTO `roles_recursos` (`id`, `roles_id`, `recursos_id`) VALUES
(684, 1, 23),
(685, 2, 23),
(686, 4, 23),
(1059, 1, 11),
(1060, 2, 11),
(1061, 4, 11),
(1062, 1, 18),
(1063, 2, 18),
(1064, 4, 18),
(1065, 1, 32),
(1066, 2, 32),
(1067, 4, 32),
(1068, 2, 35),
(1069, 4, 35),
(1070, 2, 36),
(1071, 4, 36),
(1072, 2, 34),
(1073, 4, 34),
(1074, 2, 46),
(1075, 4, 46),
(1076, 2, 31),
(1077, 4, 31),
(1078, 1, 15),
(1079, 2, 15),
(1080, 4, 15),
(1081, 1, 4),
(1082, 2, 4),
(1083, 4, 4),
(1084, 2, 41),
(1085, 4, 41),
(1086, 2, 40),
(1087, 4, 40),
(1088, 2, 38),
(1089, 4, 38),
(1090, 1, 37),
(1091, 2, 37),
(1092, 4, 37),
(1093, 2, 43),
(1094, 4, 43),
(1095, 2, 44),
(1096, 4, 44),
(1097, 2, 42),
(1098, 4, 42),
(1099, 2, 47),
(1100, 4, 47),
(1101, 1, 5),
(1102, 2, 5),
(1103, 4, 5),
(1104, 1, 3),
(1105, 2, 3),
(1106, 4, 3),
(1107, 1, 2),
(1108, 2, 2),
(1109, 4, 2),
(1110, 2, 45),
(1111, 4, 45),
(1112, 1, 1),
(1113, 2, 1),
(1114, 4, 1),
(1115, 1, 17),
(1116, 2, 17),
(1117, 4, 17),
(1118, 1, 14),
(1119, 2, 14),
(1120, 4, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
CREATE TABLE IF NOT EXISTS `roles_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`id`, `roles_id`, `usuarios_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 4, 3);

-- --------------------------------------------------------



-- -----------------------------------------------------
-- Table `sigerisa`.`tipo_solicitud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`tipo_solicitud` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`tipo_solicitud` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `observacion` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- -----------------------------------------------------
-- Table `sigerisa`.`caracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`caracteristica` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`caracteristica` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `tipo_valor` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`tiposolicitud_caracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`tiposolicitud_caracteristica` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`tiposolicitud_caracteristica` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `tipo_solicitud_id` INT NOT NULL ,
  `caracteristica_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_categoria_solicitud_tipo_solicitud1_idx` (`tipo_solicitud_id` ASC) ,
  INDEX `fk_tiposolicitud_caracteristica_caracteristica` (`caracteristica_id` ASC) ,
  CONSTRAINT `fk_tiposolicitud_caracteristica_tipo_solicitud`
    FOREIGN KEY (`tipo_solicitud_id` )
    REFERENCES `sigerisa`.`tipo_solicitud` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tiposolicitud_caracteristica_caracteristica`
    FOREIGN KEY (`caracteristica_id` )
    REFERENCES `sigerisa`.`caracteristica` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`solicitud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`solicitud` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`solicitud` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` INT NOT NULL ,
  `parroquia_id` INT NOT NULL ,
  `denominado` VARCHAR(45) NULL ,
  `direccion` VARCHAR(45) NULL ,
  `propietario` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `fecha_recibido` DATE NULL ,
  `fecha_solicitud` DATE NULL ,
  `fecha_comision` DATE NULL ,
  `fecha_para` DATE NULL ,
  `empleado_id` INT NOT NULL ,
  `observaciones_generales` TEXT NULL ,
  `estatus` VARCHAR(1) NOT NULL ,
  `tipo_solicitud_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_solicitud_municipio1_idx` (`parroquia_id` ASC) ,
  INDEX `fk_solicitud_persona1_idx` (`persona_id` ASC) ,
  INDEX `fk_solicitud_empleado1_idx` (`empleado_id` ASC) ,
  INDEX `fk_solicitud_tipo_solicitud` (`tipo_solicitud_id` ASC) ,
  CONSTRAINT `fk_solicitud_agua_urbanismo_municipio1`
    FOREIGN KEY (`parroquia_id` )
    REFERENCES `sigerisa`.`parroquia` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_empleado1`
    FOREIGN KEY (`empleado_id` )
    REFERENCES `sigerisa`.`empleado` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_tipo_solicitud`
    FOREIGN KEY (`tipo_solicitud_id` )
    REFERENCES `sigerisa`.`tipo_solicitud` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`detalle_solicitud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`detalle_solicitud` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`detalle_solicitud` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `solicitud_id` INT NOT NULL ,
  `tiposolicitud_caracteristica_id` INT NOT NULL ,
  `resultado` VARCHAR(45) NOT NULL ,
  INDEX `fk_detalle_solicitud_solicitudes1_idx` (`solicitud_id` ASC) ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_detalle_solicitud_tiposolicitud_caracteristica` (`tiposolicitud_caracteristica_id` ASC) ,
  CONSTRAINT `fk_detalle_solicitud_solicitudes1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_solicitud_tiposolicitud_caracteristica`
    FOREIGN KEY (`tiposolicitud_caracteristica_id` )
    REFERENCES `sigerisa`.`tiposolicitud_caracteristica` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `persona_id_UNIQUE` (`persona_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_usuarios_persona1` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `clave`, `email`, `activo`, `persona_id`) VALUES
(2, 'usuario', 'baxuN8I44GotM', 'correo@correo.com', 1, 2),
(3, 'admin', 'baxuN8I44GotM', 'correo1@correo.com', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `auditorias_ibfk_10` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON UPDATE NO ACTION;


--
-- Filtros para la tabla `constancia_inspeccion_sanitaria`
--
ALTER TABLE `constancia_inspeccion_sanitaria`
  ADD CONSTRAINT `fk_constancia_inspeccion_sanitaria_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constancia_inspeccion_sanitaria_solicitud1` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `fk_denuncia_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_denuncia`
--
ALTER TABLE `detalle_denuncia`
  ADD CONSTRAINT `fk_detalle_denuncia_denuncia1` FOREIGN KEY (`denuncia_id`) REFERENCES `denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_denuncia_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_10` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `menus_ibfk_20` FOREIGN KEY (`recursos_id`) REFERENCES `recursos` (`id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `observacion_funcionario`
--
ALTER TABLE `observacion_funcionario`
  ADD CONSTRAINT `fk_observacion_funcionario_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_observacion_funcionario_solicitud1` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `fk_parroquia_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_organizacion` FOREIGN KEY (`organizacion_id`) REFERENCES `organizacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles_recursos`
--
ALTER TABLE `roles_recursos`
  ADD CONSTRAINT `roles_recursos_ibfk_10` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `roles_recursos_ibfk_20` FOREIGN KEY (`recursos_id`) REFERENCES `recursos` (`id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `roles_usuarios_ibfk_10` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `roles_usuarios_ibfk_20` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
