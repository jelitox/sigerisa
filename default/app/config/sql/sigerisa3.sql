SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sigerisa` DEFAULT CHARACTER SET utf8 ;
USE `sigerisa` ;

-- -----------------------------------------------------
-- Table `sigerisa`.`organizacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`organizacion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `observacion` VARCHAR(250) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`persona` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cedula` VARCHAR(11) NOT NULL ,
  `nombre1` VARCHAR(45) NULL DEFAULT NULL ,
  `nombre2` VARCHAR(45) NULL DEFAULT NULL ,
  `apellido1` VARCHAR(45) NULL DEFAULT NULL ,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL ,
  `fecha_nacimiento` DATE NULL DEFAULT NULL ,
  `direccion` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono_movil` INT(10) NULL DEFAULT NULL ,
  `telefono_local` INT(10) NULL DEFAULT NULL ,
  `organizacion_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rif_UNIQUE` (`cedula` ASC) ,
  INDEX `fk_persona_organizacion` (`organizacion_id` ASC) ,
  CONSTRAINT `fk_persona_organizacion`
    FOREIGN KEY (`organizacion_id` )
    REFERENCES `sigerisa`.`organizacion` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(50) NOT NULL ,
  `clave` VARCHAR(40) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `activo` INT(11) NOT NULL DEFAULT '1' ,
  `persona_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login` (`login` ASC) ,
  UNIQUE INDEX `persona_id_UNIQUE` (`persona_id` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_usuarios_persona1` (`persona_id` ASC) ,
  CONSTRAINT `fk_usuarios_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`auditorias`
-- -----------------------------------------------------
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
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 71
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`cargo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`cargo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `observacion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`tipo_solicitud`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`tipo_solicitud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`categoria_solicitud`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`categoria_solicitud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `tipo_solicitud_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_categoria_solicitud_tipo_solicitud1_idx` (`tipo_solicitud_id` ASC) ,
  CONSTRAINT `fk_categoria_solicitud_tipo_solicitud1`
    FOREIGN KEY (`tipo_solicitud_id` )
    REFERENCES `sigerisa`.`tipo_solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`municipio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`municipio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`parroquia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`parroquia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `municipio_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_parroquia_1` (`municipio_id` ASC) ,
  CONSTRAINT `fk_parroquia_1`
    FOREIGN KEY (`municipio_id` )
    REFERENCES `sigerisa`.`municipio` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`empleado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`empleado` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `persona_id` INT(11) NOT NULL ,
  `cargo_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_empleado_persona` (`persona_id` ASC) ,
  INDEX `fk_empleado_cargo` (`cargo_id` ASC) ,
  CONSTRAINT `fk_empleado_cargo`
    FOREIGN KEY (`cargo_id` )
    REFERENCES `sigerisa`.`cargo` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado_persona`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`solicitud`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`solicitud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `persona_id` INT(11) NOT NULL ,
  `parroquia_id` INT(11) NOT NULL ,
  `denominado` VARCHAR(45) NULL DEFAULT NULL ,
  `direccion` VARCHAR(45) NULL DEFAULT NULL ,
  `propietario` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `fecha_recibido` DATE NULL DEFAULT NULL ,
  `fecha_solicitud` DATE NULL DEFAULT NULL ,
  `fecha_comision` DATE NULL DEFAULT NULL ,
  `fecha_para` DATE NULL DEFAULT NULL ,
  `empleado_id` INT(11) NOT NULL ,
  `observaciones_generales` TEXT NULL DEFAULT NULL ,
  `estatus` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_solicitud_agua_urbanismo_municipio1_idx` (`parroquia_id` ASC) ,
  INDEX `fk_solicitud_agua_urbanismo_persona1_idx` (`persona_id` ASC) ,
  INDEX `fk_solicitud_empleado1_idx` (`empleado_id` ASC) ,
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
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`constancia_inspeccion_sanitaria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`constancia_inspeccion_sanitaria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `solicitud_id` INT(11) NOT NULL ,
  `persona_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_constancia_inspeccion_sanitaria_solicitud1_idx` (`solicitud_id` ASC) ,
  INDEX `fk_constancia_inspeccion_sanitaria_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_constancia_inspeccion_sanitaria_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_constancia_inspeccion_sanitaria_solicitud1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`denuncia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`denuncia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `persona_id` INT(11) NOT NULL ,
  `fecha_denuncia` DATE NULL DEFAULT NULL ,
  `datos_denunciado` TEXT NULL DEFAULT NULL ,
  `direccion_denunciado` TEXT NULL DEFAULT NULL ,
  `planteamiento_problema` TEXT NULL DEFAULT NULL ,
  `estatus` VARCHAR(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_denuncia_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_denuncia_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sigerisa`.`persona` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`detalle_denuncia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`detalle_denuncia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `empleado_id` INT(11) NOT NULL ,
  `denuncia_id` INT(11) NOT NULL ,
  `fecha_asignacion` DATE NULL DEFAULT NULL ,
  `fecha_inspeccion` DATE NULL DEFAULT NULL ,
  `observaciones` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_detalle_denuncia_denuncia1_idx` (`denuncia_id` ASC) ,
  INDEX `fk_detalle_denuncia_empleado1_idx` (`empleado_id` ASC) ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`sub_categoria_solicitud`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`sub_categoria_solicitud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `categoria_solicitud_id` INT(11) NOT NULL ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_sub_categoria_sol_agua_categoria_sol_agua1_idx` (`categoria_solicitud_id` ASC) ,
  CONSTRAINT `fk_sub_categoria_sol_agua_categoria_sol_agua1`
    FOREIGN KEY (`categoria_solicitud_id` )
    REFERENCES `sigerisa`.`categoria_solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`detalle_solicitud`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`detalle_solicitud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `sub_categoria_solicitud_id` INT(11) NOT NULL ,
  `solicitud_id` INT(11) NOT NULL ,
  `resultado` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_detalle_sol_agua_sub_categoria_sol_agua1_idx` (`sub_categoria_solicitud_id` ASC) ,
  INDEX `fk_detalle_solicitud_solicitudes1_idx` (`solicitud_id` ASC) ,
  CONSTRAINT `fk_detalle_solicitud_solicitudes1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_sol_agua_sub_categoria_sol_agua1`
    FOREIGN KEY (`sub_categoria_solicitud_id` )
    REFERENCES `sigerisa`.`sub_categoria_solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`recursos`
-- -----------------------------------------------------
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
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`menus`
-- -----------------------------------------------------
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
  CONSTRAINT `menus_ibfk_10`
    FOREIGN KEY (`menus_id` )
    REFERENCES `sigerisa`.`menus` (`id` )
    ON UPDATE CASCADE,
  CONSTRAINT `menus_ibfk_20`
    FOREIGN KEY (`recursos_id` )
    REFERENCES `sigerisa`.`recursos` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`observacion_funcionario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`observacion_funcionario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `solicitud_id` INT(11) NOT NULL ,
  `empleado_id` INT(11) NOT NULL ,
  `observacion` TEXT NULL DEFAULT NULL ,
  `fecha_inspeccion` DATE NULL DEFAULT NULL ,
  `fecha_revision` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_observacion_funcionario_solicitud1_idx` (`solicitud_id` ASC) ,
  INDEX `fk_observacion_funcionario_empleado1_idx` (`empleado_id` ASC) ,
  CONSTRAINT `fk_observacion_funcionario_empleado1`
    FOREIGN KEY (`empleado_id` )
    REFERENCES `sigerisa`.`empleado` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_observacion_funcionario_solicitud1`
    FOREIGN KEY (`solicitud_id` )
    REFERENCES `sigerisa`.`solicitud` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`roles`
-- -----------------------------------------------------
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
-- Table `sigerisa`.`roles_recursos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`roles_recursos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `roles_id` INT(11) NOT NULL ,
  `recursos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `roles_id` (`roles_id` ASC) ,
  INDEX `recursos_id` (`recursos_id` ASC) ,
  CONSTRAINT `roles_recursos_ibfk_10`
    FOREIGN KEY (`roles_id` )
    REFERENCES `sigerisa`.`roles` (`id` )
    ON UPDATE CASCADE,
  CONSTRAINT `roles_recursos_ibfk_20`
    FOREIGN KEY (`recursos_id` )
    REFERENCES `sigerisa`.`recursos` (`id` )
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1121
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigerisa`.`roles_usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sigerisa`.`roles_usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `roles_id` INT(11) NOT NULL ,
  `usuarios_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `roles_id` (`roles_id` ASC) ,
  INDEX `usuarios_id` (`usuarios_id` ASC) ,
  CONSTRAINT `roles_usuarios_ibfk_10`
    FOREIGN KEY (`roles_id` )
    REFERENCES `sigerisa`.`roles` (`id` )
    ON UPDATE CASCADE,
  CONSTRAINT `roles_usuarios_ibfk_20`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `sigerisa`.`usuarios` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
