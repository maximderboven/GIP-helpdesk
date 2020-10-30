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

--
-- Dumping data for table `tblantwoorden`
--

LOCK TABLES `tblantwoorden` WRITE;
/*!40000 ALTER TABLE `tblantwoorden` DISABLE KEYS */;
INSERT INTO `tblantwoorden` VALUES (1,'Excel werkt gewoon niet meer.',4,7,'2020-04-06 13:32:16'),(2,'Word werkt niet meer',3,8,'2020-04-06 13:32:16');
/*!40000 ALTER TABLE `tblantwoorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tblcategorieen`
--

LOCK TABLES `tblcategorieen` WRITE;
/*!40000 ALTER TABLE `tblcategorieen` DISABLE KEYS */;
INSERT INTO `tblcategorieen` VALUES (5,'ASP.Net & C#'),(3,'Access'),(12,'Android'),(6,'CSS & HTML'),(2,'Excel'),(13,'Hardware'),(11,'IOS'),(7,'JS & JQUERY'),(9,'Linux'),(8,'MySQL'),(4,'Visual Studio'),(10,'Windows'),(1,'Word');
/*!40000 ALTER TABLE `tblcategorieen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tblgebruikers`
--

LOCK TABLES `tblgebruikers` WRITE;
/*!40000 ALTER TABLE `tblgebruikers` DISABLE KEYS */;
INSERT INTO `tblgebruikers` VALUES (3,'Simon','simon@gmail.com','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3',1,1,'2020-04-06 13:26:09'),(4,'Menua','menua@gmail.com','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3',1,1,'2020-04-06 13:26:09'),(6,'admin','admin@gmail.com','D033E22AE348AEB5660FC2140AEC35850C4DA997',1,1,'2020-04-06 13:34:28');
/*!40000 ALTER TABLE `tblgebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tblgroepen`
--

LOCK TABLES `tblgroepen` WRITE;
/*!40000 ALTER TABLE `tblgroepen` DISABLE KEYS */;
INSERT INTO `tblgroepen` VALUES (2,'Admin'),(1,'Gebruiker'),(3,'Super User');
/*!40000 ALTER TABLE `tblgroepen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tblstatussen`
--

LOCK TABLES `tblstatussen` WRITE;
/*!40000 ALTER TABLE `tblstatussen` DISABLE KEYS */;
INSERT INTO `tblstatussen` VALUES (3,'Gesloten'),(1,'Onbekend'),(2,'Open');
/*!40000 ALTER TABLE `tblstatussen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
INSERT INTO `tbltickets` VALUES (7,1,'Word probleem',1,'2020-04-06 13:28:09','1001-01-01 00:00:00',3),(8,2,'Excel probleem',1,'2020-04-06 13:28:09','1001-01-01 00:00:00',4),(9,5,'Null exeption range',1,'2020-04-06 14:15:22',NULL,6),(10,5,'null exception range',1,'2020-04-06 14:16:13',NULL,6);
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tickets`(IN cID INT, o varchar(45), gID INT)
BEGIN
INSERT INTO tbltickets (categorieID, onderwerp, gebruikerID) VALUES (cID,o,gID); SELECT LAST_INSERT_ID();
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
SELECT tblgebruikers.id as id, naam as naam, email as email, tblgroepen.omschrijving as groep, actief as actief, dtmGeregistreerd as dtmGeregistreerd FROM dbhelpdesk.tblgebruikers
left join tblgroepen on groepID = tblgroepen.id
WHERE groepID=1 ORDER by dtmGeregistreerd;
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
SELECT tbltickets.id as id,tblgebruikers.naam as gebruiker, tblcategorieen.omschrijving as categorie, onderwerp as onderwerp, tblstatussen.omschrijving as status, tbltickets.dtmgemaakt as datumgemaakt, COALESCE(dtmopgelost,"2020-01-01 00:00:00") as datumopgelost FROM dbhelpdesk.tbltickets
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

-- Dump completed on 2020-04-06 14:17:33
