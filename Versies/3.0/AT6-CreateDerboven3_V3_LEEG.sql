-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbhelpdesk
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbhelpdesk` ;

-- -----------------------------------------------------
-- Schema dbhelpdesk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbhelpdesk` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `dbhelpdesk` ;

-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblgroepen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblgroepen` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblgroepen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `omschrijving` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `omschrijving_UNIQUE` (`omschrijving` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblgebruikers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblgebruikers` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblgebruikers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `groepID` INT UNSIGNED NOT NULL DEFAULT '1',
  `actief` TINYINT NOT NULL DEFAULT '1',
  `dtmGeregistreerd` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `naam_UNIQUE` (`naam` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_tblgebruikers_tblgroepen1_idx` (`groepID` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tblgebruikers_tblgroepen1`
    FOREIGN KEY (`groepID`)
    REFERENCES `dbhelpdesk`.`tblgroepen` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblcategorieen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblcategorieen` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblcategorieen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `omschrijving` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `omschrijving_UNIQUE` (`omschrijving` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblstatussen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblstatussen` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblstatussen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `omschrijving` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `omschrijving_UNIQUE` (`omschrijving` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tbltickets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tbltickets` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tbltickets` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id voor tickets',
  `categorieID` INT UNSIGNED NOT NULL,
  `onderwerp` VARCHAR(45) NOT NULL,
  `statusID` INT UNSIGNED NOT NULL DEFAULT '1',
  `dtmGemaakt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmOpgelost` DATETIME NULL DEFAULT NULL,
  `gebruikerID` INT UNSIGNED NOT NULL,
  `adminID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tbltickets_tblstatussen1_idx` (`statusID` ASC) VISIBLE,
  INDEX `fk_tbltickets_tblcategorieen1_idx` (`categorieID` ASC) VISIBLE,
  INDEX `fk_tbltickets_tblgebruikers1_idx` (`gebruikerID` ASC) VISIBLE,
  INDEX `fk_tbltickets_tblgebruikers2_idx` (`adminID` ASC) VISIBLE,
  CONSTRAINT `fk_tbltickets_tblcategorieen1`
    FOREIGN KEY (`categorieID`)
    REFERENCES `dbhelpdesk`.`tblcategorieen` (`id`),
  CONSTRAINT `fk_tbltickets_tblgebruikers1`
    FOREIGN KEY (`gebruikerID`)
    REFERENCES `dbhelpdesk`.`tblgebruikers` (`id`),
  CONSTRAINT `fk_tbltickets_tblstatussen1`
    FOREIGN KEY (`statusID`)
    REFERENCES `dbhelpdesk`.`tblstatussen` (`id`),
  CONSTRAINT `fk_tbltickets_tblgebruikers2`
    FOREIGN KEY (`adminID`)
    REFERENCES `dbhelpdesk`.`tblgebruikers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblantwoorden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblantwoorden` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblantwoorden` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `omschrijving` VARCHAR(100) NOT NULL,
  `gebruikerID` INT UNSIGNED NOT NULL,
  `ticketID` INT UNSIGNED NOT NULL,
  `dtmGemaakt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tblantwoorden_tblgebruikers1_idx` (`gebruikerID` ASC) VISIBLE,
  INDEX `fk_tblantwoorden_tbltickets1_idx` (`ticketID` ASC) VISIBLE,
  CONSTRAINT `fk_tblantwoorden_tblgebruikers1`
    FOREIGN KEY (`gebruikerID`)
    REFERENCES `dbhelpdesk`.`tblgebruikers` (`id`),
  CONSTRAINT `fk_tblantwoorden_tbltickets1`
    FOREIGN KEY (`ticketID`)
    REFERENCES `dbhelpdesk`.`tbltickets` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `dbhelpdesk`.`tblmeldingen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhelpdesk`.`tblmeldingen` ;

CREATE TABLE IF NOT EXISTS `dbhelpdesk`.`tblmeldingen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `gebruikerID` INT UNSIGNED NOT NULL,
  `gelezen` TINYINT NOT NULL,
  `omschrijving` VARCHAR(100) NOT NULL,
  `dtmGemaakt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tblmeldingen_tblgebruikers1_idx` (`gebruikerID` ASC) VISIBLE,
  CONSTRAINT `fk_tblmeldingen_tblgebruikers1`
    FOREIGN KEY (`gebruikerID`)
    REFERENCES `dbhelpdesk`.`tblgebruikers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `dbhelpdesk` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
