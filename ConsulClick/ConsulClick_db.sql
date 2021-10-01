-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ConsulClick
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ConsulClick
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ConsulClick` DEFAULT CHARACTER SET utf8 ;
USE `ConsulClick` ;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(25) NULL,
  `Apellido` VARCHAR(25) NULL,
  `Cedula` VARCHAR(10) NULL,
  `Edad` INT NULL,
  `Sexo` VARCHAR(1) NULL,
  `FechaNacimiento` DATE NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(10) NULL,
  `Email` VARCHAR(30) NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Perfil` (
  `idPerfil` INT NOT NULL,
  `Atributos` VARCHAR(15) NULL,
  `PerfilUsuario` VARCHAR(15) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(25) NULL,
  `Contraseña` VARCHAR(25) NULL,
  `Persona_idPersona` INT NOT NULL,
  `Perfil_idPerfil` INT NOT NULL,
  FOREIGN KEY (`Persona_idPersona`) REFERENCES persona(`idPersona`),
  FOREIGN KEY (`Perfil_idPerfil`) REFERENCES perfil(`idPerfil`),
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsulClick`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Medico` (
  `idMedico` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  FOREIGN KEY (`Usuario_idUsuario`) REFERENCES usuario(`idUsuario`),
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Paciente` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  FOREIGN KEY (`Usuario_idUsuario`) REFERENCES usuario(`idUsuario`),
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Especialidad` (
  `idEspecialidad` INT NOT NULL AUTO_INCREMENT,
  `NombreEspecialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidad`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Servicio` (
  `idServicio` INT NOT NULL AUTO_INCREMENT,
  `Medico_idMedico` INT NOT NULL,
  `Especialidad_idEspecialidad` INT NOT NULL,
  FOREIGN KEY (`Medico_idMedico`) REFERENCES medico(`idMedico`),
  FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES especialidad(`idEspecialidad`),
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`Horario` (
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `Hora` TIME NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsulClick`.`CitaMedica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ConsulClick`.`CitaMedica` (
  `idCitaMedica` INT NOT NULL AUTO_INCREMENT,
  `Servicio_idServicio` INT NOT NULL,
  `Horario_idHorario` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  FOREIGN KEY (`Servicio_idServicio`) REFERENCES servicio(`idservicio`),
  FOREIGN KEY (`Horario_idHorario`) REFERENCES horario(`idHorario`),
  FOREIGN KEY (`Paciente_idPaciente`) REFERENCES paciente(`idPaciente`),
  PRIMARY KEY (`idCitaMedica`))
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
