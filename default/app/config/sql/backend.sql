-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-09-2014 a las 16:14:58
-- Versión del servidor: 5.5.37
-- Versión de PHP: 5.3.10-1ubuntu3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `backend`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

CREATE TABLE IF NOT EXISTS `auditorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `fecha_at` date NOT NULL,
  `accion_realizada` text NOT NULL,
  `tabla_afectada` varchar(150) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `auditorias`
--

INSERT INTO `auditorias` (`id`, `usuarios_id`, `fecha_at`, `accion_realizada`, `tabla_afectada`, `ip`) VALUES
(1, 3, '2014-09-04', 'DELETE FROM roles_recursos WHERE id IN (''618'',''619'',''620'',''621'',''622'',''623'',''624'',''625'',''626'',''627'',''628'',''629'',''630'',''631'',''632'',''633'',''634'',''635'',''636'',''637'',''638'',''639'',''640'',''641'',''642'',''643'',''644'')', 'ROLES_RECURSOS', '127.0.0.1'),
(2, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''20'',nombre = ''Configuracion'',url = ''config/municipio/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''23''', 'MENUS', '127.0.0.1'),
(3, 3, '2014-09-04', 'UPDATE recursos SET modulo = ''config'',controlador = ''municipio'',accion = ''index'',recurso = ''config/municipio/index'',descripcion = ''menu configuracon de municipio'',activo = ''1'' WHERE  id = ''20''', 'RECURSOS', '127.0.0.1'),
(4, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''15'',nombre = ''Configuracion'',url = ''admin/index'',posicion = ''80'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''23''', 'MENUS', '127.0.0.1'),
(5, 3, '2014-09-04', 'UPDATE usuarios SET login = ''admin'',clave = ''baxuN8I44GotM'',nombres = ''Administrador'',email = ''correo@correo.com'',activo = ''1'' WHERE  id = ''3''', 'USUARIOS', '127.0.0.1'),
(6, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''11'',nombre = ''Inicio'',url = ''index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(7, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''15'',nombre = ''Inicio'',url = ''admin/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(8, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(9, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(10, 3, '2014-09-04', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(11, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''1'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(12, 3, '2014-09-04', 'UPDATE menus SET menus_id = NULL,recursos_id = ''22'',nombre = ''Inicio'',url = ''admin/principal/index'',posicion = ''100'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''19''', 'MENUS', '127.0.0.1'),
(13, 3, '2014-09-07', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicio/servicio/index'',posicion = ''1'',clases = ''servicio'',visible_en = ''3'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(14, 3, '2014-09-07', 'UPDATE recursos SET modulo = ''servicios'',controlador = ''servicios'',accion = NULL,recurso = ''servicios/servicios/*'',descripcion = ''servicios'',activo = ''1'' WHERE  id = ''23''', 'RECURSOS', '127.0.0.1'),
(15, 3, '2014-09-07', 'UPDATE recursos SET modulo = NULL,controlador = ''servicios'',accion = ''index'',recurso = ''servicios/index'',descripcion = ''servicios'',activo = ''1'' WHERE  id = ''23''', 'RECURSOS', '127.0.0.1'),
(16, 3, '2014-09-07', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''3'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(17, 3, '2014-09-07', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(18, 3, '2014-09-12', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''2'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(19, 3, '2014-09-12', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''1'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(20, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''mision_vision/index'',posicion = ''1'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(21, 3, '2014-09-15', 'UPDATE menus SET menus_id = NULL,recursos_id = ''23'',nombre = ''Servicios'',url = ''servicios/index'',posicion = ''180'',clases = ''servicios'',visible_en = ''1'',activo = ''1'' WHERE  id = ''27''', 'MENUS', '127.0.0.1'),
(22, 3, '2014-09-15', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''quienes_somos'',accion = ''index'',recurso = ''quienes_somos/quienes_somos/index'',descripcion = ''Quienes somos'',activo = ''1'' WHERE  id = ''24''', 'RECURSOS', '127.0.0.1'),
(23, 3, '2014-09-15', 'UPDATE recursos SET modulo = NULL,controlador = ''mision'',accion = ''index'',recurso = ''mision/index'',descripcion = ''Mision y vision'',activo = ''1'' WHERE  id = ''25''', 'RECURSOS', '127.0.0.1'),
(24, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''171'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(25, 3, '2014-09-15', 'UPDATE menus SET menus_id = NULL,recursos_id = ''24'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''170'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(26, 3, '2014-09-15', 'UPDATE menus SET menus_id = NULL,recursos_id = ''24'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''40'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(27, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(28, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''29''', 'MENUS', '127.0.0.1'),
(29, 3, '2014-09-15', 'UPDATE menus SET menus_id = NULL,recursos_id = ''30'',nombre = ''Quienes Somos'',url = ''quienes_somos/index'',posicion = ''40'',clases = NULL,visible_en = ''1'',activo = ''1'' WHERE  id = ''28''', 'MENUS', '127.0.0.1'),
(30, 3, '2014-09-15', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''mision'',accion = ''index'',recurso = ''quienes_somos/mision/index'',descripcion = ''Mision y vision'',activo = ''1'' WHERE  id = ''25''', 'RECURSOS', '127.0.0.1'),
(31, 3, '2014-09-15', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''objetivos'',accion = ''index'',recurso = ''quienes_somos/objetivos/index'',descripcion = ''Objetivos'',activo = ''1'' WHERE  id = ''26''', 'RECURSOS', '127.0.0.1'),
(32, 3, '2014-09-15', 'UPDATE recursos SET modulo = ''quienes_somos'',controlador = ''resena_historica'',accion = ''index'',recurso = ''quienes_somos/resena_historica/index'',descripcion = ''Reseña Historica'',activo = ''1'' WHERE  id = ''27''', 'RECURSOS', '127.0.0.1'),
(33, 3, '2014-09-15', 'UPDATE recursos SET modulo = ''config'',controlador = ''empleado'',accion = ''index'',recurso = ''config/empleado/index'',descripcion = ''empleado'',activo = ''1'' WHERE  id = ''31''', 'RECURSOS', '127.0.0.1'),
(34, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado'',posicion = ''100'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(35, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''41'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(36, 3, '2014-09-15', 'DELETE FROM roles_recursos WHERE id IN (''678'',''679'',''680'',''681'',''682'',''683'')', 'ROLES_RECURSOS', '127.0.0.1'),
(37, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''23'',recursos_id = ''31'',nombre = ''Empleado'',url = ''config/empleado/index'',posicion = ''81'',clases = NULL,visible_en = ''2'',activo = ''1'' WHERE  id = ''30''', 'MENUS', '127.0.0.1'),
(38, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''26'',nombre = ''Objetivos'',url = ''quienes_somos/objetivos/index'',posicion = ''42'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''31''', 'MENUS', '127.0.0.1'),
(39, 3, '2014-09-15', 'UPDATE menus SET menus_id = ''28'',recursos_id = ''25'',nombre = ''Misión y Visión'',url = ''quienes_somos/mision/index'',posicion = ''41'',clases = NULL,visible_en = ''1'',activo = ''0'' WHERE  id = ''29''', 'MENUS', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

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
(24, 23, 20, 'Municipio', 'config/municipio/index', 80, NULL, 2, 1),
(25, NULL, 21, 'Noticias', 'noticias/noticias/index', 100, NULL, 1, 1),
(26, 25, 21, 'Circulares', 'noticias/noticias/index', 80, NULL, 1, 1),
(27, NULL, 23, 'Servicios', 'servicios/index', 180, 'servicios', 1, 1),
(28, NULL, 30, 'Quienes Somos', 'quienes_somos/index', 40, NULL, 1, 1),
(29, 28, 25, 'Misión y Visión', 'quienes_somos/mision/index', 41, NULL, 1, 0),
(30, 23, 31, 'Empleado', 'config/empleado/index', 81, NULL, 2, 1),
(31, 28, 26, 'Objetivos', 'quienes_somos/objetivos/index', 42, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE IF NOT EXISTS `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) DEFAULT NULL,
  `controlador` varchar(50) NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `recurso` varchar(200) NOT NULL,
  `descripcion` text,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

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
(20, 'config', 'municipio', 'index', 'config/municipio/index', 'menu configuracon de municipio', 1),
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
(31, 'config', 'empleado', 'index', 'config/empleado/index', 'empleado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

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

CREATE TABLE IF NOT EXISTS `roles_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `recursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`),
  KEY `recursos_id` (`recursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=695 ;

--
-- Volcado de datos para la tabla `roles_recursos`
--

INSERT INTO `roles_recursos` (`id`, `roles_id`, `recursos_id`) VALUES
(648, 1, 18),
(649, 2, 18),
(650, 4, 18),
(651, 1, 15),
(652, 2, 15),
(653, 4, 15),
(654, 1, 4),
(655, 2, 4),
(656, 4, 4),
(657, 1, 5),
(658, 2, 5),
(659, 4, 5),
(660, 1, 3),
(661, 2, 3),
(662, 4, 3),
(663, 1, 2),
(664, 2, 2),
(665, 4, 2),
(666, 1, 1),
(667, 2, 1),
(668, 4, 1),
(669, 1, 17),
(670, 2, 17),
(671, 4, 17),
(672, 1, 14),
(673, 2, 14),
(674, 4, 14),
(684, 1, 23),
(685, 2, 23),
(686, 4, 23),
(687, 2, 31),
(688, 4, 31),
(689, 1, 20),
(690, 2, 20),
(691, 4, 20),
(692, 1, 11),
(693, 2, 11),
(694, 4, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

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

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `clave`, `nombres`, `email`, `activo`) VALUES
(2, 'usuario', 'baxuN8I44GotM', 'usuario del sistema', 'asd@mail.com', 1),
(3, 'admin', 'baxuN8I44GotM', 'Administrador', 'correo@correo.com', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `auditorias_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`recursos_id`) REFERENCES `recursos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_recursos`
--
ALTER TABLE `roles_recursos`
  ADD CONSTRAINT `roles_recursos_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_recursos_ibfk_2` FOREIGN KEY (`recursos_id`) REFERENCES `recursos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `roles_usuarios_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_usuarios_ibfk_2` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
