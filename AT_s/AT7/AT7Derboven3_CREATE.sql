-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: dbhelpdesk
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP DATABASE if exists dbhelpdesk;
create DATABASE dbhelpdesk;
use dbhelpdesk;

--
-- Table structure for table `tblantwoorden`
--

DROP TABLE IF EXISTS `tblantwoorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblantwoorden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `omschrijving` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gebruikerID` int(10) unsigned NOT NULL,
  `ticketID` int(10) unsigned NOT NULL,
  `dtmGemaakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tblantwoorden_tblgebruikers1_idx` (`gebruikerID`),
  KEY `fk_tblantwoorden_tbltickets1_idx` (`ticketID`),
  CONSTRAINT `fk_tblantwoorden_tblgebruikers1` FOREIGN KEY (`gebruikerID`) REFERENCES `tblgebruikers` (`id`),
  CONSTRAINT `fk_tblantwoorden_tbltickets1` FOREIGN KEY (`ticketID`) REFERENCES `tbltickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblantwoorden`
--

LOCK TABLES `tblantwoorden` WRITE;
/*!40000 ALTER TABLE `tblantwoorden` DISABLE KEYS */;
INSERT INTO `tblantwoorden` VALUES (49,'x',29,45,'2020-05-05 10:54:54'),(50,'x',18,45,'2020-05-05 10:55:13');
/*!40000 ALTER TABLE `tblantwoorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcategorieen`
--

DROP TABLE IF EXISTS `tblcategorieen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcategorieen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `omschrijving` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `omschrijving_UNIQUE` (`omschrijving`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategorieen`
--

LOCK TABLES `tblcategorieen` WRITE;
/*!40000 ALTER TABLE `tblcategorieen` DISABLE KEYS */;
INSERT INTO `tblcategorieen` VALUES (2,'Excel'),(1,'Word');
/*!40000 ALTER TABLE `tblcategorieen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgebruikers`
--

DROP TABLE IF EXISTS `tblgebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblgebruikers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `groepID` int(10) unsigned NOT NULL DEFAULT '1',
  `actief` tinyint(4) NOT NULL DEFAULT '1',
  `dtmAangemaakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `naam_UNIQUE` (`naam`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_tblgebruikers_tblgroepen1_idx` (`groepID`),
  CONSTRAINT `fk_tblgebruikers_tblgroepen1` FOREIGN KEY (`groepID`) REFERENCES `tblgroepen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgebruikers`
--

LOCK TABLES `tblgebruikers` WRITE;
/*!40000 ALTER TABLE `tblgebruikers` DISABLE KEYS */;
INSERT INTO `tblgebruikers` VALUES (17,'gebruiker','gebruiker@gmail.com','A94A8FE5CCB19BA61C4C0873D391E987982FBBD3',2,1,'2020-04-02 20:12:00'),(18,'admin','admin@gmail.com','D033E22AE348AEB5660FC2140AEC35850C4DA997',2,1,'2020-04-02 20:12:52'),(19,'test123','test','A94A8FE5CCB19BA61C4C0873D391E987982FBBD3',2,1,'2020-04-02 20:22:40'),(20,'test','dqzd','A94A8FE5CCB19BA61C4C0873D391E987982FBBD3',2,1,'2020-04-02 21:12:52'),(21,'s','x@','11F6AD8EC52A2984ABAAFD7C3B516503785C2072',2,0,'2020-04-02 21:40:41'),(27,'Menua2','menua@','11F3F90BF2CB5536EEC0A336769EE86B98856B74',2,0,'2020-04-03 16:57:18'),(28,'Simons','simon@','088E16A1019277B15D58FAF0541E11910EB756F6',2,1,'2020-04-03 16:57:31'),(29,'test1233','test12@','3C363836CF4E16666669A25DA280A1865C2D2874',1,1,'2020-05-05 10:54:10');
/*!40000 ALTER TABLE `tblgebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgroepen`
--

DROP TABLE IF EXISTS `tblgroepen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblgroepen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `omschrijving` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `omschrijving_UNIQUE` (`omschrijving`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgroepen`
--

LOCK TABLES `tblgroepen` WRITE;
/*!40000 ALTER TABLE `tblgroepen` DISABLE KEYS */;
INSERT INTO `tblgroepen` VALUES (2,'admin'),(1,'gebruiker');
/*!40000 ALTER TABLE `tblgroepen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstatussen`
--

DROP TABLE IF EXISTS `tblstatussen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblstatussen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `omschrijving` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `omschrijving_UNIQUE` (`omschrijving`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstatussen`
--

LOCK TABLES `tblstatussen` WRITE;
/*!40000 ALTER TABLE `tblstatussen` DISABLE KEYS */;
INSERT INTO `tblstatussen` VALUES (2,'actief'),(3,'afgerond'),(1,'onbekend');
/*!40000 ALTER TABLE `tblstatussen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets`
--

DROP TABLE IF EXISTS `tbltickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id voor tickets',
  `categorieID` int(10) unsigned NOT NULL,
  `onderwerp` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vraag` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `statusID` int(10) unsigned NOT NULL DEFAULT '1',
  `dtmGemaakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmOpgelost` datetime DEFAULT NULL,
  `gebruikerID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tbltickets_tblstatussen1_idx` (`statusID`),
  KEY `fk_tbltickets_tblcategorieen1_idx` (`categorieID`),
  KEY `fk_tbltickets_tblgebruikers1_idx` (`gebruikerID`),
  CONSTRAINT `fk_tbltickets_tblcategorieen1` FOREIGN KEY (`categorieID`) REFERENCES `tblcategorieen` (`id`),
  CONSTRAINT `fk_tbltickets_tblgebruikers1` FOREIGN KEY (`gebruikerID`) REFERENCES `tblgebruikers` (`id`),
  CONSTRAINT `fk_tbltickets_tblstatussen1` FOREIGN KEY (`statusID`) REFERENCES `tblstatussen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
INSERT INTO `tbltickets` VALUES (44,1,'dsz','dzq',3,'2020-04-03 22:03:04',NULL,18),(45,1,'xx','xx',1,'2020-05-05 10:54:32',NULL,29);
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbhelpdesk'
--

--
-- Dumping routines for database 'dbhelpdesk'
--
/*!50003 DROP PROCEDURE IF EXISTS `count_tickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_tickets`()
BEGIN
select Count(*) from tbltickets;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_tickets_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_tickets_gebruiker`(IN gID INT)
BEGIN
select count(*) from tbltickets where gebruikerID = gID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_tickets_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_tickets_status`(IN s varchar(50))
BEGIN
SELECT Count(tbltickets.id) as "Aantal gesloten" FROM dbhelpdesk.tbltickets
inner join tblstatussen on tblstatussen.id = statusID
WHERE tblstatussen.omschrijving = s;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_antwoorden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_antwoorden`(IN o varchar(100), gID INT, tID INT)
BEGIN
INSERT INTO tblantwoorden (omschrijving, gebruikerID, ticketID) VALUES (o,gID,tID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_tickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tickets`(IN cID INT, o varchar(45), v varchar(200), gID INT)
BEGIN
INSERT INTO tbltickets (categorieID, onderwerp, vraag, gebruikerID) VALUES (cID,o,v,gID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_antwoorden_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_antwoorden_ticket`(IN tID INT)
BEGIN
SELECT tblantwoorden.id as id, omschrijving, tblgebruikers.naam as gebruiker, dtmGemaakt as datumGemaakt FROM dbhelpdesk.tblantwoorden
inner join tblgebruikers on tblgebruikers.id = gebruikerID
WHERE ticketID = tID
ORDER BY tblantwoorden.id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gebruikers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruikers`()
BEGIN
SELECT tblgebruikers.id as id, naam as naam, email as email, tblgroepen.omschrijving as groep, actief as actief, dtmAangemaakt as dtmAangemaakt FROM dbhelpdesk.tblgebruikers
left join tblgroepen on groepID = tblgroepen.id
WHERE groepID=1 ORDER by dtmAangemaakt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_tickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets`()
BEGIN
SELECT tbltickets.id as id, vraag as vraag, tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
inner join tblgebruikers on tblgebruikers.id =tbltickets.gebruikerID
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
inner join tblcategorieen on tblcategorieen.id = tbltickets.categorieID
ORDER BY dtmGemaakt desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_tickets_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets_gebruiker`(IN gebruikerID INT)
BEGIN
SELECT tbltickets.id as id, vraag as vraag, tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
inner join tblgebruikers on tblgebruikers.id =tbltickets.gebruikerID
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
inner join tblcategorieen on tblcategorieen.id = tbltickets.categorieID
where tbltickets.gebruikerID = gebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_tickets_ticketID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets_ticketID`(IN ticketID INT)
BEGIN
SELECT tbltickets.id as id, vraag as vraag, tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
inner join tblgebruikers on tblgebruikers.id =tbltickets.gebruikerID
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
inner join tblcategorieen on tblcategorieen.id = tbltickets.categorieID
where tbltickets.id = ticketID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_antwoorden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_antwoorden`(IN o varchar(100), aID INT)
BEGIN
UPDATE tblantwoorden
SET omschrijving=o
WHERE id=aID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_gebruikers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_gebruikers`(IN n varchar(45), e varchar(100), GID INT, a tinyint, aID INT)
BEGIN
UPDATE tblgebruikers
SET naam=n, email=e, groepID=GID, actief=a
WHERE id=aID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_tickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tickets`(IN cID INT, sID INT, o varchar(200), tID INT)
BEGIN
UPDATE tbltickets
SET categorieID=cID, onderwerp=o, statusID=sID
WHERE id=tID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05 10:57:09
