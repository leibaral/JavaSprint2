-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema s201-n102-pizzeria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `s201-n102-pizzeria` ;

-- -----------------------------------------------------
-- Schema s201-n102-pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s201-n102-pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `s201-n102-pizzeria` ;

-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`provincies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`provincies` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`provincies` (
  `idProvincia` INT(11) NOT NULL,
  `nomProvincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`localitats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`localitats` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`localitats` (
  `idLocalitat` INT(11) NOT NULL AUTO_INCREMENT,
  `nomLocalitat` VARCHAR(20) NOT NULL,
  `provincies_idProvincia` INT(11) NOT NULL,
  PRIMARY KEY (`idLocalitat`),
  CONSTRAINT `fk_localitats_provincies1`
    FOREIGN KEY (`provincies_idProvincia`)
    REFERENCES `s201-n102-pizzeria`.`provincies` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_localitats_provincies1_idx` ON `s201-n102-pizzeria`.`localitats` (`provincies_idProvincia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`botigues`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`botigues` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`botigues` (
  `idBotiga` INT(11) NOT NULL AUTO_INCREMENT,
  `adreçaBotiga` VARCHAR(45) NOT NULL,
  `codipostalBotiga` VARCHAR(5) NOT NULL,
  `idLocalitat` INT(11) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  `localitats_idLocalitat` INT(11) NOT NULL,
  PRIMARY KEY (`idBotiga`),
  CONSTRAINT `fk_botigues_localitats1`
    FOREIGN KEY (`localitats_idLocalitat`)
    REFERENCES `s201-n102-pizzeria`.`localitats` (`idLocalitat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_botigues_localitats1_idx` ON `s201-n102-pizzeria`.`botigues` (`localitats_idLocalitat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`categories_prod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`categories_prod` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`categories_prod` (
  `idcategoria_prod` INT(11) NOT NULL AUTO_INCREMENT,
  `nomCategoriaProd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria_prod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Categories de productes. Poden anar canviant.';


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`clients` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`clients` (
  `idClient` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(10) NOT NULL,
  `cognoms` VARCHAR(10) NOT NULL,
  `adreça` VARCHAR(60) NOT NULL,
  `codiPostal` VARCHAR(5) NOT NULL,
  `telefon` VARCHAR(11) NOT NULL,
  `localitats_idLocalitat` INT(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  CONSTRAINT `fk_clients_localitats1`
    FOREIGN KEY (`localitats_idLocalitat`)
    REFERENCES `s201-n102-pizzeria`.`localitats` (`idLocalitat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_clients_localitats1_idx` ON `s201-n102-pizzeria`.`clients` (`localitats_idLocalitat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`empleats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`empleats` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`empleats` (
  `idEmpleat` INT(11) NOT NULL AUTO_INCREMENT,
  `NomEmpleat` VARCHAR(20) NULL DEFAULT NULL,
  `CognomsEmpleat` VARCHAR(45) NOT NULL,
  `NifEmpleat` VARCHAR(9) NOT NULL,
  `telefonEmpleat` VARCHAR(11) NOT NULL,
  `idCarrecEmpleat` INT(11) NOT NULL,
  `botigues_idBotiga` INT(11) NOT NULL,
  PRIMARY KEY (`idEmpleat`),
  CONSTRAINT `fk_empleats_botigues1`
    FOREIGN KEY (`botigues_idBotiga`)
    REFERENCES `s201-n102-pizzeria`.`botigues` (`idBotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_empleats_botigues1_idx` ON `s201-n102-pizzeria`.`empleats` (`botigues_idBotiga` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`comandes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`comandes` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`comandes` (
  `idComanda` INT(11) NOT NULL AUTO_INCREMENT,
  `dataComanda` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `recollirBotiga` TINYINT(4) NOT NULL DEFAULT 0,
  `preuTotal` FLOAT GENERATED ALWAYS AS ((SELECT comandes_idComanda, SUM(linees_de_comanda_totalImportLinia) AS preuTotal GROUP BY comandes_idComanda)) VIRTUAL,
  `clients_idClient` INT(11) NOT NULL,
  `botigues_idBotiga` INT(11) NOT NULL,
  `empleats_idEmpleat` INT(11) NOT NULL,
  PRIMARY KEY (`idComanda`),
  CONSTRAINT `fk_comandes_clients1`
    FOREIGN KEY (`clients_idClient`)
    REFERENCES `s201-n102-pizzeria`.`clients` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandes_botigues1`
    FOREIGN KEY (`botigues_idBotiga`)
    REFERENCES `s201-n102-pizzeria`.`botigues` (`idBotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandes_empleats1`
    FOREIGN KEY (`empleats_idEmpleat`)
    REFERENCES `s201-n102-pizzeria`.`empleats` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_comandes_clients1_idx` ON `s201-n102-pizzeria`.`comandes` (`clients_idClient` ASC) VISIBLE;

CREATE INDEX `fk_comandes_botigues1_idx` ON `s201-n102-pizzeria`.`comandes` (`botigues_idBotiga` ASC) VISIBLE;

CREATE INDEX `fk_comandes_empleats1_idx` ON `s201-n102-pizzeria`.`comandes` (`empleats_idEmpleat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`productes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`productes` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`productes` (
  `idProducte` INT(11) NOT NULL AUTO_INCREMENT,
  `nomProducte` VARCHAR(45) NOT NULL,
  `descripcioProducte` VARCHAR(80) NULL DEFAULT NULL,
  `imatgeProducte` VARCHAR(80) NULL DEFAULT NULL,
  `preuUnitariProducte` DECIMAL(10,0) NOT NULL DEFAULT 0,
  `categories_prod_idcategoria_prod` INT(11) NOT NULL,
  PRIMARY KEY (`idProducte`),
  CONSTRAINT `fk_productes_categories_prod1`
    FOREIGN KEY (`categories_prod_idcategoria_prod`)
    REFERENCES `s201-n102-pizzeria`.`categories_prod` (`idcategoria_prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_productes_categories_prod1_idx` ON `s201-n102-pizzeria`.`productes` (`categories_prod_idcategoria_prod` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`subcategories_pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`subcategories_pizza` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`subcategories_pizza` (
  `idsubcategoria_pizza` INT(11) NOT NULL AUTO_INCREMENT,
  `tipus_de_pizza` VARCHAR(45) NOT NULL,
  `idCategories_Prod` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idsubcategoria_pizza`),
  CONSTRAINT `idCategories_Prod`
    FOREIGN KEY (`idCategories_Prod`)
    REFERENCES `s201-n102-pizzeria`.`categories_prod` (`idcategoria_prod`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Subcategories de producte que agrupen diferents tipus de pizzes. Poden anar canviant.';

CREATE INDEX `idCategories_Prod_idx` ON `s201-n102-pizzeria`.`subcategories_pizza` (`idCategories_Prod` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`relacionsProdLin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`relacionsProdLin` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`relacionsProdLin` (
  `idRelacioPL` INT NOT NULL AUTO_INCREMENT,
  `idProducte` INT NOT NULL,
  `idLiniaCda` INT NOT NULL,
  `productes_idProducte` INT(11) NOT NULL,
  PRIMARY KEY (`idRelacioPL`),
  CONSTRAINT `fk_relacionsProdLin_productes1`
    FOREIGN KEY (`productes_idProducte`)
    REFERENCES `s201-n102-pizzeria`.`productes` (`idProducte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_relacionsProdLin_productes1_idx` ON `s201-n102-pizzeria`.`relacionsProdLin` (`productes_idProducte` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `s201-n102-pizzeria`.`linees_de_comanda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n102-pizzeria`.`linees_de_comanda` ;

CREATE TABLE IF NOT EXISTS `s201-n102-pizzeria`.`linees_de_comanda` (
  `idLinia` INT NOT NULL DEFAULT '1',
  `totalQuantitatProd` INT NOT NULL,
  `totalImportLinia` DECIMAL GENERATED ALWAYS AS (totalQuantProd * productes_preuUnitariProducte) VIRTUAL,
  `relacionsProdLin_idRelacioPL` INT NOT NULL,
  `comandes_idComanda` INT(11) NOT NULL,
  PRIMARY KEY (`idLinia`),
  CONSTRAINT `fk_linees_de_comanda_relacionsProdLin1`
    FOREIGN KEY (`relacionsProdLin_idRelacioPL`)
    REFERENCES `s201-n102-pizzeria`.`relacionsProdLin` (`idRelacioPL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_linees_de_comanda_comandes1`
    FOREIGN KEY (`comandes_idComanda`)
    REFERENCES `s201-n102-pizzeria`.`comandes` (`idComanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_linees_de_comanda_relacionsProdLin1_idx` ON `s201-n102-pizzeria`.`linees_de_comanda` (`relacionsProdLin_idRelacioPL` ASC) VISIBLE;

CREATE INDEX `fk_linees_de_comanda_comandes1_idx` ON `s201-n102-pizzeria`.`linees_de_comanda` (`comandes_idComanda` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
