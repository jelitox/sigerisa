SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `sigerisa` ;
CREATE SCHEMA IF NOT EXISTS `sigerisa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sigerisa` ;

-- -----------------------------------------------------
-- Table `sigerisa`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`persona` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cedula` VARCHAR(11) NOT NULL ,
  `nombre1` VARCHAR(45) NULL ,
  `nombre2` VARCHAR(45) NULL ,
  `apellido1` VARCHAR(45) NULL ,
  `apellido2` VARCHAR(45) NULL ,
  `fecha_nacimiento` DATE NULL ,
  `direccion` VARCHAR(45) NULL ,
  `telefono_movil` INT(10) NULL ,
  `telefono_local` INT(10) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rif_UNIQUE` (`cedula` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`cargo` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`cargo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `observacion` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`empleado` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`empleado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` INT NOT NULL ,
  `cargo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_empleado_persona` (`persona_id` ASC) ,
  INDEX `fk_empleado_cargo` (`cargo_id` ASC) ,
  CONSTRAINT `fk_empleado_persona`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado_cargo`
    FOREIGN KEY (`cargo_id` )
    REFERENCES `sigerisa`.`cargo` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`municipio` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`municipio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`parroquia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`parroquia` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`parroquia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `municipio_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_parroquia_1` (`municipio_id` ASC) ,
  CONSTRAINT `fk_parroquia_1`
    FOREIGN KEY (`municipio_id` )
    REFERENCES `sigerisa`.`municipio` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`tipo_solicitud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`tipo_solicitud` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`tipo_solicitud` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `observacion` TEXT NULL ,
  PRIMARY KEY (`id`) )
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
  INDEX `fk_solicitud_agua_urbanismo_municipio1_idx` (`parroquia_id` ASC) ,
  INDEX `fk_solicitud_agua_urbanismo_persona1_idx` (`persona_id` ASC) ,
  INDEX `fk_solicitud_empleado1_idx` (`empleado_id` ASC) ,
  INDEX `fk_solicitud_tipo_solicitud` (`tipo_solicitud_id` ASC) ,
  CONSTRAINT `fk_solicitud_agua_urbanismo_municipio1`
    FOREIGN KEY (`parroquia_id` )
    REFERENCES `sigerisa`.`parroquia` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_agua_urbanismo_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_empleado1`
    FOREIGN KEY (`empleado_id` )
    REFERENCES `sigerisa`.`empleado` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_tipo_solicitud`
    FOREIGN KEY (`tipo_solicitud_id` )
    REFERENCES `sigerisa`.`tipo_solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tiposolicitud_caracteristica_caracteristica`
    FOREIGN KEY (`caracteristica_id` )
    REFERENCES `sigerisa`.`caracteristica` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_solicitud_tiposolicitud_caracteristica`
    FOREIGN KEY (`tiposolicitud_caracteristica_id` )
    REFERENCES `sigerisa`.`tiposolicitud_caracteristica` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`observacion_funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`observacion_funcionario` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`observacion_funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `solicitud_id` INT NOT NULL ,
  `empleado_id` INT NOT NULL ,
  `observacion` TEXT NULL ,
  `fecha_inspeccion` DATE NULL ,
  `fecha_revision` DATETIME NULL ,
  INDEX `fk_observacion_funcionario_solicitud1_idx` (`solicitud_id` ASC) ,
  INDEX `fk_observacion_funcionario_empleado1_idx` (`empleado_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_observacion_funcionario_solicitud1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_observacion_funcionario_empleado1`
    FOREIGN KEY (`empleado_id` )
    REFERENCES `sigerisa`.`empleado` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`constancia_inspeccion_sanitaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`constancia_inspeccion_sanitaria` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`constancia_inspeccion_sanitaria` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `solicitud_id` INT NOT NULL ,
  `persona_id` INT NOT NULL ,
  INDEX `fk_constancia_inspeccion_sanitaria_solicitud1_idx` (`solicitud_id` ASC) ,
  INDEX `fk_constancia_inspeccion_sanitaria_persona1_idx` (`persona_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_constancia_inspeccion_sanitaria_solicitud1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_constancia_inspeccion_sanitaria_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`denuncia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`denuncia` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`denuncia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` INT NOT NULL ,
  `fecha_denuncia` DATE NULL ,
  `datos_denunciado` TEXT NULL ,
  `direccion_denunciado` TEXT NULL ,
  `planteamiento_problema` TEXT NULL ,
  `estatus` VARCHAR(1) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_denuncia_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_denuncia_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`detalle_denuncia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`detalle_denuncia` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`detalle_denuncia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `empleado_id` INT NOT NULL ,
  `denuncia_id` INT NOT NULL ,
  `fecha_asignacion` DATE NULL ,
  `fecha_inspeccion` DATE NULL ,
  `observaciones` TEXT NULL ,
  INDEX `fk_detalle_denuncia_denuncia1_idx` (`denuncia_id` ASC) ,
  INDEX `fk_detalle_denuncia_empleado1_idx` (`empleado_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_detalle_denuncia_denuncia1`
    FOREIGN KEY (`denuncia_id` )
    REFERENCES `sigerisa`.`denuncia` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_denuncia_empleado1`
    FOREIGN KEY (`empleado_id` )
    REFERENCES `sigerisa`.`empleado` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`roles` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `rol` VARCHAR(50) NOT NULL ,
  `plantilla` VARCHAR(50) NULL DEFAULT NULL ,
  `activo` INT(11) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rol` (`rol` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`usuarios` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(50) NOT NULL ,
  `clave` VARCHAR(40) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `activo` INT(11) NOT NULL DEFAULT '1' ,
  `persona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login` (`login` ASC) ,
  INDEX `fk_usuarios_persona1` (`persona_id` ASC) ,
  UNIQUE INDEX `persona_id_UNIQUE` (`persona_id` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  CONSTRAINT `fk_usuarios_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`roles_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`roles_usuarios` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`roles_usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `roles_id` INT(11) NOT NULL ,
  `usuarios_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `roles_id` (`roles_id` ASC) ,
  INDEX `usuarios_id` (`usuarios_id` ASC) ,
  CONSTRAINT `roles_usuarios_ibfk_20`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `sigerisa`.`usuarios` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `roles_usuarios_ibfk_10`
    FOREIGN KEY (`roles_id` )
    REFERENCES `sigerisa`.`roles` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`recursos` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`recursos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `modulo` VARCHAR(50) NULL DEFAULT NULL ,
  `controlador` VARCHAR(50) NOT NULL ,
  `accion` VARCHAR(50) NULL DEFAULT NULL ,
  `recurso` VARCHAR(200) NOT NULL ,
  `descripcion` TEXT NULL DEFAULT NULL ,
  `activo` INT(11) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`menus` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`menus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `menus_id` INT(11) NULL DEFAULT NULL ,
  `recursos_id` INT(11) NOT NULL ,
  `nombre` VARCHAR(100) NOT NULL ,
  `url` VARCHAR(100) NOT NULL ,
  `posicion` INT(11) NOT NULL DEFAULT '100' ,
  `clases` VARCHAR(50) NULL DEFAULT NULL ,
  `visible_en` INT(11) NOT NULL DEFAULT '1' ,
  `activo` INT(11) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`) ,
  INDEX `menus_id` (`menus_id` ASC) ,
  INDEX `recursos_id` (`recursos_id` ASC) ,
  CONSTRAINT `menus_ibfk_20`
    FOREIGN KEY (`recursos_id` )
    REFERENCES `sigerisa`.`recursos` (`id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `menus_ibfk_10`
    FOREIGN KEY (`menus_id` )
    REFERENCES `sigerisa`.`menus` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`auditorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`auditorias` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`auditorias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `usuarios_id` INT(11) NOT NULL ,
  `fecha_at` DATETIME NOT NULL ,
  `accion_realizada` TEXT NOT NULL ,
  `tabla_afectada` VARCHAR(150) NULL DEFAULT NULL ,
  `ip` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`, `fecha_at`) ,
  INDEX `usuarios_id` (`usuarios_id` ASC) ,
  CONSTRAINT `auditorias_ibfk_10`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `sigerisa`.`usuarios` (`id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`roles_recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`roles_recursos` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`roles_recursos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `roles_id` INT(11) NOT NULL ,
  `recursos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `roles_id` (`roles_id` ASC) ,
  INDEX `recursos_id` (`recursos_id` ASC) ,
  CONSTRAINT `roles_recursos_ibfk_20`
    FOREIGN KEY (`recursos_id` )
    REFERENCES `sigerisa`.`recursos` (`id` )
    ON UPDATE CASCADE,
  CONSTRAINT `roles_recursos_ibfk_10`
    FOREIGN KEY (`roles_id` )
    REFERENCES `sigerisa`.`roles` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 648
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`organizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`organizacion` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`organizacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `observacion` VARCHAR(250) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigerisa`.`persona_organizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigerisa`.`persona_organizacion` ;

CREATE  TABLE IF NOT EXISTS `sigerisa`.`persona_organizacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` INT NOT NULL ,
  `organizacion_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_persona_organizacion_persona` (`persona_id` ASC) ,
  INDEX `fk_persona_organizacion_organizacion` (`organizacion_id` ASC) ,
  CONSTRAINT `fk_persona_organizacion_persona`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_persona_organizacion_organizacion`
    FOREIGN KEY (`organizacion_id` )
    REFERENCES `sigerisa`.`organizacion` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
