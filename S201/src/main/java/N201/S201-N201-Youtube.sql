-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema s201-n201-youtube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `s201-n201-youtube` ;

-- -----------------------------------------------------
-- Schema s201-n201-youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s201-n201-youtube` DEFAULT CHARACTER SET utf8mb4 ;
USE `s201-n201-youtube` ;

-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`canals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`canals` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`canals` (
  `idCanal` INT(11) NOT NULL AUTO_INCREMENT,
  `nomCanal` VARCHAR(50) NOT NULL DEFAULT 'canal',
  `descripcioCanal` VARCHAR(300) NULL DEFAULT NULL,
  `dataCanal` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`idCanal`),
  UNIQUE INDEX `idCanal_UNIQUE` (`idCanal` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`usuaris`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`usuaris` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`usuaris` (
  `idUsuari` INT(11) NOT NULL AUTO_INCREMENT,
  `nomUsuari` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `naixement` DATE NOT NULL,
  `sexe` VARCHAR(1) NOT NULL,
  `codiPostal` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idUsuari`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`comentar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`comentar` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`comentar` (
  `idComentari` INT(11) NOT NULL AUTO_INCREMENT,
  `comentari` VARCHAR(300) NOT NULL,
  `dataComentari` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `usuaris_idUsuari` INT(11) NOT NULL,
  PRIMARY KEY (`idComentari`),
  UNIQUE INDEX `idComentari_UNIQUE` (`idComentari` ASC) ,
  INDEX `fk_comentar_usuaris1_idx` (`usuaris_idUsuari` ASC) ,
  CONSTRAINT `fk_comentar_usuaris1`
    FOREIGN KEY (`usuaris_idUsuari`)
    REFERENCES `s201-n201-youtube`.`usuaris` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`estats_video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`estats_video` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`estats_video` (
  `id_estat_video` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_estat_video` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_estat_video`),
  UNIQUE INDEX `id_estat_video_UNIQUE` (`id_estat_video` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`etiquetes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`etiquetes` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`etiquetes` (
  `idEtiqueta` INT(11) NOT NULL AUTO_INCREMENT,
  `nomEtiqueta` VARCHAR(15) NOT NULL DEFAULT 'etiqueta',
  PRIMARY KEY (`idEtiqueta`, `nomEtiqueta`),
  UNIQUE INDEX `idEtiqueta_UNIQUE` (`idEtiqueta` ASC) ,
  UNIQUE INDEX `nomEtiqueta_UNIQUE` (`nomEtiqueta` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`videos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`videos` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`videos` (
  `idVideo` INT(11) NOT NULL,
  `titolVideo` VARCHAR(100) NOT NULL DEFAULT 'video_001',
  `descripcioVideo` VARCHAR(300) NULL DEFAULT NULL,
  `tamanyVideo` INT(11) NOT NULL,
  `nomArxiu` VARCHAR(45) NOT NULL,
  `duradaVideo` INT(11) NOT NULL,
  `thumbnail` VARCHAR(45) NULL DEFAULT NULL,
  `visionatsVideo` INT(11) NOT NULL DEFAULT 0,
  `likes` INT(11) NOT NULL DEFAULT 0,
  `dislikes` INT(11) NOT NULL DEFAULT 0,
  `dataVideo` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `estats_video_id_estat_video` INT(11) NOT NULL,
  `canals_idCanal` INT(11) NOT NULL,
  PRIMARY KEY (`idVideo`),
  UNIQUE INDEX `idVideo_UNIQUE` (`idVideo` ASC) ,
  INDEX `fk_videos_estats_video1_idx` (`estats_video_id_estat_video` ASC) ,
  INDEX `fk_videos_canals1_idx` (`canals_idCanal` ASC) ,
  CONSTRAINT `fk_videos_estats_video1`
    FOREIGN KEY (`estats_video_id_estat_video`)
    REFERENCES `s201-n201-youtube`.`estats_video` (`id_estat_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_canals1`
    FOREIGN KEY (`canals_idCanal`)
    REFERENCES `s201-n201-youtube`.`canals` (`idCanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`interaccions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`interaccions` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`interaccions` (
  `idInteraccio` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuari` INT(11) NOT NULL,
  `idVideo` INT(11) NOT NULL,
  `like` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idInteraccio`),
  UNIQUE INDEX `idInteraccio_UNIQUE` (`idInteraccio` ASC) ,
  INDEX `idUsuari_idx` (`idUsuari` ASC) ,
  INDEX `idVideo_idx` (`idVideo` ASC) ,
  CONSTRAINT `idUsuari`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `s201-n201-youtube`.`usuaris` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVideo`
    FOREIGN KEY (`idVideo`)
    REFERENCES `s201-n201-youtube`.`videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`like_comentaris`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`like_comentaris` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`like_comentaris` (
  `idLikeComentari` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuari` INT(11) NOT NULL,
  `idComentari` INT(11) NOT NULL,
  `likeComentari` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idLikeComentari`),
  UNIQUE INDEX `idLikeComentari_UNIQUE` (`idLikeComentari` ASC) ,
  INDEX `idUsuari_idx` (`idUsuari` ASC) ,
  INDEX `idComentari_idx` (`idComentari` ASC) ,
  CONSTRAINT `fk2_idUsuari`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `s201-n201-youtube`.`usuaris` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idComentari`
    FOREIGN KEY (`idComentari`)
    REFERENCES `s201-n201-youtube`.`comentar` (`idComentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`playlists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`playlists` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`playlists` (
  `idPlaylist` INT(11) NOT NULL AUTO_INCREMENT,
  `nomPlaylist` VARCHAR(45) NOT NULL,
  `playlistPublica` TINYINT(4) NOT NULL DEFAULT 1,
  `dataPlaylist` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`idPlaylist`),
  UNIQUE INDEX `idPlaylist_UNIQUE` (`idPlaylist` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`subscripcions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`subscripcions` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`subscripcions` (
  `idSubscripcio` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuari` INT(11) NOT NULL,
  `idCanal` INT(11) NOT NULL,
  PRIMARY KEY (`idSubscripcio`),
  INDEX `fk_idUsuari` (`idUsuari` ASC) ,
  INDEX `fk_idCanal` (`idCanal` ASC) ,
  CONSTRAINT `fk_idCanal`
    FOREIGN KEY (`idCanal`)
    REFERENCES `s201-n201-youtube`.`canals` (`idCanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuari`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `s201-n201-youtube`.`usuaris` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`videos_has_etiquetes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`videos_has_etiquetes` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`videos_has_etiquetes` (
  `videos_idVideo` INT(11) NOT NULL,
  `etiquetes_idEtiqueta` INT(11) NOT NULL,
  `etiquetes_nomEtiqueta` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`videos_idVideo`, `etiquetes_idEtiqueta`, `etiquetes_nomEtiqueta`),
  INDEX `fk_videos_has_etiquetes_etiquetes1_idx` (`etiquetes_idEtiqueta` ASC, `etiquetes_nomEtiqueta` ASC) ,
  INDEX `fk_videos_has_etiquetes_videos1_idx` (`videos_idVideo` ASC) ,
  CONSTRAINT `fk_videos_has_etiquetes_videos1`
    FOREIGN KEY (`videos_idVideo`)
    REFERENCES `s201-n201-youtube`.`videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_has_etiquetes_etiquetes1`
    FOREIGN KEY (`etiquetes_idEtiqueta` , `etiquetes_nomEtiqueta`)
    REFERENCES `s201-n201-youtube`.`etiquetes` (`idEtiqueta` , `nomEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`usuaris_has_playlists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`usuaris_has_playlists` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`usuaris_has_playlists` (
  `usuaris_idUsuari` INT(11) NOT NULL,
  `playlists_idPlaylist` INT(11) NOT NULL,
  PRIMARY KEY (`usuaris_idUsuari`, `playlists_idPlaylist`),
  INDEX `fk_usuaris_has_playlists_playlists1_idx` (`playlists_idPlaylist` ASC) ,
  INDEX `fk_usuaris_has_playlists_usuaris1_idx` (`usuaris_idUsuari` ASC) ,
  CONSTRAINT `fk_usuaris_has_playlists_usuaris1`
    FOREIGN KEY (`usuaris_idUsuari`)
    REFERENCES `s201-n201-youtube`.`usuaris` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuaris_has_playlists_playlists1`
    FOREIGN KEY (`playlists_idPlaylist`)
    REFERENCES `s201-n201-youtube`.`playlists` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s201-n201-youtube`.`videos_has_playlists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s201-n201-youtube`.`videos_has_playlists` ;

CREATE TABLE IF NOT EXISTS `s201-n201-youtube`.`videos_has_playlists` (
  `videos_idVideo` INT(11) NOT NULL,
  `playlists_idPlaylist` INT(11) NOT NULL,
  PRIMARY KEY (`videos_idVideo`, `playlists_idPlaylist`),
  INDEX `fk_videos_has_playlists_playlists1_idx` (`playlists_idPlaylist` ASC) ,
  INDEX `fk_videos_has_playlists_videos1_idx` (`videos_idVideo` ASC) ,
  CONSTRAINT `fk_videos_has_playlists_videos1`
    FOREIGN KEY (`videos_idVideo`)
    REFERENCES `s201-n201-youtube`.`videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_has_playlists_playlists1`
    FOREIGN KEY (`playlists_idPlaylist`)
    REFERENCES `s201-n201-youtube`.`playlists` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
