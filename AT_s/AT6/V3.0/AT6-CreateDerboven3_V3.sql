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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 29
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 4
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
AUTO_INCREMENT = 45
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
AUTO_INCREMENT = 47
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

-- -----------------------------------------------------
-- procedure insert_antwoorden
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`insert_antwoorden`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_antwoorden`(IN o varchar(100), gID INT, tID INT)
BEGIN
INSERT INTO tblantwoorden (omschrijving, gebruikerID, ticketID) VALUES (o,gID,tID);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insert_tickets
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`insert_tickets`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tickets`(IN cID INT, o varchar(45), v varchar(200), gID INT)
BEGIN
INSERT INTO tbltickets (categorieID, onderwerp, vraag, gebruikerID) VALUES (cID,o,v,gID);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure read_antwoorden_ticket
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`read_antwoorden_ticket`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_antwoorden_ticket`(IN tID INT)
BEGIN
SELECT tblantwoorden.id as id, omschrijving, tblgebruikers.naam as gebruiker, dtmGemaakt as datumGemaakt FROM dbhelpdesk.tblantwoorden
inner join tblgebruikers on tblgebruikers.id = gebruikerID
WHERE ticketID = tID
ORDER BY dtmGemaakt;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure read_gebruikers
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`read_gebruikers`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruikers`()
BEGIN
SELECT tblgebruikers.id as id, naam as naam, email as email, tblgroepen.omschrijving as groep, actief as actief, dtmAangemaakt as dtmAangemaakt FROM dbhelpdesk.tblgebruikers
left join tblgroepen on groepID = tblgroepen.id
WHERE groepID=1 ORDER by dtmAangemaakt;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure read_tickets
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`read_tickets`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets`()
BEGIN
SELECT tbltickets.id as id, vraag as vraag, tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
inner join tblgebruikers on tblgebruikers.id =tbltickets.gebruikerID
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
inner join tblcategorieen on tblcategorieen.id = tbltickets.categorieID
ORDER BY dtmGemaakt desc;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure read_tickets_gebruiker
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`read_tickets_gebruiker`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets_gebruiker`(IN gebruikerID INT)
BEGIN
SELECT tbltickets.id as id, vraag as vraag, tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
inner join tblgebruikers on tblgebruikers.id =tbltickets.gebruikerID
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
inner join tblcategorieen on tblcategorieen.id = tbltickets.categorieID
where tbltickets.gebruikerID = gebruikerID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure update_antwoorden
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`update_antwoorden`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_antwoorden`(IN o varchar(100), aID INT)
BEGIN
UPDATE tblantwoorden
SET omschrijving=o
WHERE id=aID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure update_gebruikers
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`update_gebruikers`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_gebruikers`(IN n varchar(45), e varchar(100), GID INT, a tinyint, aID INT)
BEGIN
UPDATE tblgebruikers
SET naam=n, email=e, groepID=GID, actief=a
WHERE id=aID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure update_tickets
-- -----------------------------------------------------

USE `dbhelpdesk`;
DROP procedure IF EXISTS `dbhelpdesk`.`update_tickets`;

DELIMITER $$
USE `dbhelpdesk`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tickets`(IN v varchar(200), cID INT, sID INT, o varchar(200), tID INT)
BEGIN
UPDATE tbltickets
SET vraag=v, categorieID=cID, onderwerp=o, statusID=sID
WHERE id=tID;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
