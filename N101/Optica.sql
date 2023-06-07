-- MySQL Workbench Synchronization
-- Generated: 2023-06-07 12:01
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Joan Carles

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `s201-n101-optica`.`clients` 
ADD COLUMN `clients_idClient` INT(11) NOT NULL AFTER `atesPerEmpleat`,
ADD INDEX `fk_clients_clients1_idx` (`clients_idClient` ASC);
;

ALTER TABLE `s201-n101-optica`.`ulleres` 
ADD COLUMN `proveidor_idproveidor` INT(11) NOT NULL AFTER `idMarca`,
ADD COLUMN `clients_idClient` INT(11) NOT NULL AFTER `proveidor_idproveidor`,
ADD INDEX `fk_ulleres_proveidor_idx` (`proveidor_idproveidor` ASC) ,
ADD INDEX `fk_ulleres_clients1_idx` (`clients_idClient` ASC);
;

ALTER TABLE `s201-n101-optica`.`clients` 
ADD CONSTRAINT `fk_clients_clients1`
  FOREIGN KEY (`clients_idClient`)
  REFERENCES `s201-n101-optica`.`clients` (`idClient`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `s201-n101-optica`.`ulleres` 
ADD CONSTRAINT `fk_ulleres_proveidor`
  FOREIGN KEY (`proveidor_idproveidor`)
  REFERENCES `s201-n101-optica`.`proveidor` (`idproveidor`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_ulleres_clients1`
  FOREIGN KEY (`clients_idClient`)
  REFERENCES `s201-n101-optica`.`clients` (`idClient`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
