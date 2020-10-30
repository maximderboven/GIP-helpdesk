CREATE DATABASE  IF NOT EXISTS `dbhelpdesk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbhelpdesk`;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblantwoorden`
--

LOCK TABLES `tblantwoorden` WRITE;
/*!40000 ALTER TABLE `tblantwoorden` DISABLE KEYS */;
INSERT INTO `tblantwoorden` VALUES (10,'Dit is een ticket van gebruiker2',5,9,'2020-04-15 16:58:53'),(11,'Dit is een ticket van gebruiker3',6,10,'2020-04-15 16:59:17'),(12,'Dit is een ticket van gebruiker4',7,11,'2020-04-15 16:59:51'),(13,'Klopt, <br /> Ik ben admin2.',8,11,'2020-04-15 17:03:01'),(14,'Correct, je mag deze sluiten alstublieft.',7,11,'2020-04-15 17:03:59'),(15,'x',7,12,'2020-04-15 17:21:02'),(16,'Wat is je vraag ?',2,10,'2020-04-15 17:38:21'),(17,'Ik vroeg me af of dit mogelijk is ?',6,10,'2020-04-15 17:38:57'),(18,'Tuurlijk.',2,10,'2020-04-15 17:39:39'),(20,'ja daty lukt.',2,13,'2020-04-15 20:43:34'),(22,'x',2,9,'2020-04-16 00:28:33'),(23,'x',2,12,'2020-04-16 01:07:54'),(24,'teffqezfq',9,14,'2020-04-16 14:50:15'),(25,'xxx',9,14,'2020-04-16 14:50:30'),(26,'alles komt goed\r\n',2,14,'2020-04-16 14:51:24'),(27,'bedankt',9,14,'2020-04-16 14:51:53'),(54,'zqd',2,9,'2020-04-20 13:58:04'),(58,'Hallo,\r\n\r\nIs dit mogelijk ?\r\n\r\nVriendelijke groet Maxim',2,16,'2020-04-20 16:48:26'),(60,'qzdqzdqz',4,16,'2020-04-20 22:28:59'),(61,'qzdqzdqz',4,16,'2020-04-20 22:29:02'),(62,'zqdqzd',4,16,'2020-04-20 22:29:03'),(63,'qzdqzd',4,16,'2020-04-20 22:29:04'),(64,'qzdqz',4,16,'2020-04-20 22:29:06'),(65,'zqDFGq\r\nqzdqzd\r\nqzd',4,16,'2020-04-21 01:11:38'),(66,'zqdqzdqz',4,16,'2020-04-21 18:45:08'),(67,'zdqzdqz',2,12,'2020-04-23 23:03:36'),(68,'zqdqzd',2,12,'2020-04-23 23:03:37'),(69,'qzdqzd',2,12,'2020-04-23 23:03:39'),(70,'qzdqzd',2,12,'2020-04-23 23:03:40'),(71,'zqfgzqf',2,12,'2020-04-23 23:03:42'),(72,'zqdfdsghjkl',2,12,'2020-04-23 23:03:44'),(73,'efgrh',2,12,'2020-04-23 23:03:46'),(74,'zdq',8,9,'2020-04-24 00:04:40'),(75,'zq',8,9,'2020-04-24 00:06:40'),(76,'qzdqz',4,16,'2020-04-24 00:14:31'),(77,'qzd',5,9,'2020-04-24 00:25:14'),(78,'qd',4,16,'2020-04-24 00:36:40'),(79,'d',4,16,'2020-04-24 00:36:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategorieen`
--

LOCK TABLES `tblcategorieen` WRITE;
/*!40000 ALTER TABLE `tblcategorieen` DISABLE KEYS */;
INSERT INTO `tblcategorieen` VALUES (5,'ASP.Net & C#'),(3,'Access'),(12,'Android'),(6,'CSS & HTML'),(2,'Excel'),(13,'Hardware'),(11,'IOS'),(7,'JS & JQUERY'),(9,'Linux'),(8,'MySQL'),(4,'Visual Studio'),(10,'Windows'),(1,'Word');
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
  `dtmGeregistreerd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `naam_UNIQUE` (`naam`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_tblgebruikers_tblgroepen1_idx` (`groepID`),
  CONSTRAINT `fk_tblgebruikers_tblgroepen1` FOREIGN KEY (`groepID`) REFERENCES `tblgroepen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgebruikers`
--

LOCK TABLES `tblgebruikers` WRITE;
/*!40000 ALTER TABLE `tblgebruikers` DISABLE KEYS */;
INSERT INTO `tblgebruikers` VALUES (2,'admin','admin@','D033E22AE348AEB5660FC2140AEC35850C4DA997',2,1,'2020-04-14 18:09:40'),(3,'root','root@','DC76E9F0C0006E8F919E0C515C66DBBA3982F785',3,1,'2020-04-14 18:10:03'),(4,'gebruiker','gebruiker@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-14 18:31:03'),(5,'gebruiker2','gebruiker2@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-15 16:58:37'),(6,'gebruiker3','gebruiker3@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-15 16:59:08'),(7,'gebruiker4','gebruiker4@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-15 16:59:36'),(8,'admin2','admin2@','D033E22AE348AEB5660FC2140AEC35850C4DA997',2,1,'2020-04-15 17:00:52'),(9,'kobe','kobe@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-16 14:49:50'),(10,'gebruiker10','gebruiker10@','40632E6CD8A65C1A329D17285C1DEF26A822016D',1,1,'2020-04-20 00:47:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgroepen`
--

LOCK TABLES `tblgroepen` WRITE;
/*!40000 ALTER TABLE `tblgroepen` DISABLE KEYS */;
INSERT INTO `tblgroepen` VALUES (2,'Admin'),(1,'Gebruiker'),(3,'Super User');
/*!40000 ALTER TABLE `tblgroepen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmeldingen`
--

DROP TABLE IF EXISTS `tblmeldingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmeldingen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gebruikerID` int(10) unsigned NOT NULL,
  `gelezen` tinyint(4) NOT NULL DEFAULT '0',
  `omschrijving` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dtmGemaakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tblmeldingen_tblgebruikers1_idx` (`gebruikerID`),
  CONSTRAINT `fk_tblmeldingen_tblgebruikers1` FOREIGN KEY (`gebruikerID`) REFERENCES `tblgebruikers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmeldingen`
--

LOCK TABLES `tblmeldingen` WRITE;
/*!40000 ALTER TABLE `tblmeldingen` DISABLE KEYS */;
INSERT INTO `tblmeldingen` VALUES (3,2,1,'xxxx','2020-04-14 20:57:45',''),(4,2,1,'love yu','2020-04-14 20:57:58',''),(11,7,1,'Een admin heeft je ticket aangepast.','2020-04-15 17:11:05',''),(12,6,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-15 17:38:21',''),(13,6,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-15 17:39:39',''),(14,6,1,'Een admin heeft je ticket aangepast.','2020-04-15 17:39:46',''),(16,5,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-16 00:28:33',''),(17,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-16 01:07:54',''),(18,9,1,'Een admin heeft je ticket aangepast.','2020-04-16 14:50:23',''),(19,9,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-16 14:51:24',''),(20,9,1,'Een admin heeft je ticket aangepast.','2020-04-16 14:52:44',''),(23,2,1,'Er is een nieuw ticket aangemaakt.','2020-04-19 22:24:39',''),(24,8,1,'Er is een nieuw ticket aangemaakt.','2020-04-19 22:24:39',''),(26,2,1,'Er is een nieuw ticket aangemaakt.','2020-04-20 00:47:45','ticket-beheer.aspx'),(27,8,1,'Er is een nieuw ticket aangemaakt.','2020-04-20 00:47:45','ticket-beheer.aspx'),(29,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 00:57:34','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(32,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:03:47','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(33,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:03:47','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(34,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:03:47','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(38,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:06:55','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(39,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:07:00','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(40,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:07:01','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(41,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:07:06','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(42,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:07:11','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(43,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:07:12','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(44,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:09:34','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(45,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:09:54','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(46,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:09:56','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(47,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:10:01','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(48,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:10:02','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(49,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:10:03','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(50,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(51,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(52,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(53,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(54,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(55,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:12:05','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(56,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(57,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(58,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(59,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(60,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(61,8,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(62,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(63,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(64,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(65,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(66,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(67,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 01:27:53','/ticket-details.aspx?id=v6ldHt62IJM%3d&o=ZLYNagakCAw%3d&s=H4eNFhqDrHI%3d'),(68,2,1,'Er is een nieuw ticket aangemaakt.','2020-04-20 12:32:27','ticket-beheer.aspx'),(69,8,1,'Er is een nieuw ticket aangemaakt.','2020-04-20 12:32:28','ticket-beheer.aspx'),(71,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 12:33:07','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=ALRHo7haY6nhHduPWU3q8A%3d%3d'),(73,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 12:33:47','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=ALRHo7haY6nhHduPWU3q8A%3d%3d'),(74,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 12:33:47','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=ALRHo7haY6nhHduPWU3q8A%3d%3d'),(76,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 13:27:33','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=H4eNFhqDrHI%3d'),(77,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 13:27:33','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=H4eNFhqDrHI%3d'),(78,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 13:27:33','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=H4eNFhqDrHI%3d'),(79,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 13:30:42','/ticket-details.aspx?id=bJv4nqmZcOA%3d&o=FlyHuIgt3Xwm1zRds7%2f1tg%3d%3d&s=H4eNFhqDrHI%3d'),(80,5,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-20 13:58:04','/ticket-details.aspx?id=6Ce77FQvzME%3d&o=fW4BIrDwdY074GdQkkSpWOpUzo68b0BeudgBtfyx6Z5PQ+1HvMghXg%3d%3d&s=H4eNFhqDrHI%3d'),(81,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 14:03:28','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(86,2,1,'Je antwoord is verwijderd.','2020-04-20 16:49:39','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(87,2,1,'Je antwoord is verwijderd.','2020-04-20 16:49:43','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(88,2,1,'Je antwoord is verwijderd.','2020-04-20 16:49:43','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(90,2,1,'Je antwoord is verwijderd.','2020-04-20 16:49:44','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(91,10,0,'Je ticket is verwijderd.','2020-04-20 18:21:05','ticket-beheer.aspx'),(93,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 22:28:59','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(94,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 22:29:02','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(95,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 22:29:03','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(96,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 22:29:04','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(97,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-20 22:29:06','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(98,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-21 01:11:38','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(99,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-21 18:45:08','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(100,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:36','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(101,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:37','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(102,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:39','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(103,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:40','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(104,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:42','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(105,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:44','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(106,7,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-23 23:03:46','/ticket-details.aspx?id=FrbcUtkV45A%3d&o=FlyHuIgt3Xyeknw11pYgBSES%2fhhmq3y00jgX3ro49zI%3d&s=H4eNFhqDrHI%3d'),(107,5,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-24 00:04:40','/ticket-details.aspx?id=6Ce77FQvzME%3d&o=fW4BIrDwdY074GdQkkSpWOpUzo68b0BeudgBtfyx6Z5PQ+1HvMghXg%3d%3d&s=H4eNFhqDrHI%3d'),(108,5,1,'Je hebt een nieuwe reactie op je ticket.','2020-04-24 00:06:40','/ticket-details.aspx?id=6Ce77FQvzME%3d&o=fW4BIrDwdY074GdQkkSpWOpUzo68b0BeudgBtfyx6Z5PQ+1HvMghXg%3d%3d&s=H4eNFhqDrHI%3d'),(109,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-24 00:14:31','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(110,8,0,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-24 00:25:14','/ticket-details.aspx?id=6Ce77FQvzME%3d&o=fW4BIrDwdY074GdQkkSpWOpUzo68b0BeudgBtfyx6Z5PQ+1HvMghXg%3d%3d&s=H4eNFhqDrHI%3d'),(111,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-24 00:25:14','/ticket-details.aspx?id=6Ce77FQvzME%3d&o=fW4BIrDwdY074GdQkkSpWOpUzo68b0BeudgBtfyx6Z5PQ+1HvMghXg%3d%3d&s=H4eNFhqDrHI%3d'),(112,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-24 00:36:40','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d'),(113,2,1,'Je hebt een nieuw antwoord op een van je ticketten.','2020-04-24 00:36:41','/ticket-details.aspx?id=YjbS%2fryli3c%3d&o=Fxo%2f1mb9qBDVH+c+676Xa%2f3Fxh0eYgLh&s=H4eNFhqDrHI%3d');
/*!40000 ALTER TABLE `tblmeldingen` ENABLE KEYS */;
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
INSERT INTO `tblstatussen` VALUES (3,'Gesloten'),(1,'Onbekend'),(2,'Open');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
INSERT INTO `tbltickets` VALUES (9,5,'Dit is een ticket van gebruiker2',2,'2020-04-15 16:58:53',NULL,5),(10,3,'Dit is een ticket van gebruiker3',3,'2020-04-15 16:59:17','2020-04-15 17:39:46',6),(11,13,'Dit is een ticket van gebruiker4',3,'2020-04-15 16:59:51','2020-04-15 17:11:05',7),(12,7,'gebruiker 4 tweede ticket.',2,'2020-04-15 17:21:02',NULL,7),(13,9,'LMAOAOAOA',3,'2020-04-15 20:42:51','2020-04-19 22:23:53',4),(14,11,'Test',3,'2020-04-16 14:50:15','2020-04-16 14:52:44',9),(16,10,'windows server 2016',2,'2020-04-19 22:24:39',NULL,4);
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbhelpdesk'
--

--
-- Dumping routines for database 'dbhelpdesk'
--
/*!50003 DROP PROCEDURE IF EXISTS `aantal_status_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aantal_status_gebruiker`(IN pGebruikerID INT, pStatus varchar(45))
BEGIN
Select Count(*) from tbltickets
inner join tblstatussen on tbltickets.statusID = tblstatussen.id
where tblstatussen.omschrijving = pStatus and tbltickets.gebruikerID = pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AvailableEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AvailableEmail`(IN  pEmail varchar(45))
BEGIN
SELECT * from tblgebruikers where (email=pEmail);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AvailableNaam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AvailableNaam`(IN pNaam varchar(45))
BEGIN
SELECT * from tblgebruikers where (naam=pNaam);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_gebruikers_soort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_gebruikers_soort`(In pSoort varchar(45))
BEGIN
SELECT Count(*) from tblgebruikers 
inner join tblgroepen on tblgroepen.id = tblgebruikers.groepID
where tblgroepen.omschrijving = pSoort;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_meldingen_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_meldingen_gebruiker`(IN pGebruikerID INT)
BEGIN
SELECT Count(*) from tblmeldingen where gebruikerID = pGebruikerID and gelezen = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
Select Count(*) from tbltickets;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_tickets_gebruiker`(IN pGebruikerID INT)
BEGIN
Select Count(*) from tbltickets where gebruikerID = pGebruikerID;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_tickets_status`(IN pStatus varchar(45))
BEGIN
SELECT Count(*) from tbltickets
inner join tblstatussen on tblstatussen.id = tbltickets.statusID
where tblstatussen.omschrijving = pStatus;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_antwoorden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_antwoorden`(IN pAntwoordID INT)
BEGIN
DELETE FROM dbhelpdesk.tblantwoorden WHERE id=pAntwoordID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_gebruiker`(IN pGebruikerID INT)
BEGIN
-- eerst alle meldingen
delete from tblmeldingen where gebruikerID = pGebruikerID;
-- nadien de antwoorden
delete FROM dbhelpdesk.tblantwoorden where gebruikerID = pGebruikerID;
-- en alle antwoorden van dit ticketten
delete from tblantwoorden where (select id from tbltickets where gebruikerID = pGebruikerID);
-- dan de ticketten
delete FROM dbhelpdesk.tbltickets where gebruikerID = pGebruikerID;

-- en als laatste de gebruiker
DELETE FROM dbhelpdesk.tblgebruikers WHERE id=pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_melding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_melding`(IN pMeldingID INT)
BEGIN
Delete from tblmeldingen where id=pMeldingID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_ticket`(In pTicketID INT)
BEGIN
DELETE FROM dbhelpdesk.tblantwoorden WHERE ticketID=pTicketID; 
DELETE FROM dbhelpdesk.tbltickets WHERE id=pTicketID;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_antwoorden`(IN pGebruikerID INT, pTicketID INT,pOmschrijving varchar(100))
BEGIN
Insert into tblantwoorden (gebruikerID, ticketID, omschrijving) values (pGebruikerID,pTicketID,pOmschrijving); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_melding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_melding`(IN pGebruikerID INT, pOmschrijving varchar(100),pUrl varchar(150))
BEGIN
Insert into tblmeldingen (gebruikerID,omschrijving,url) values (pGebruikerID,pOmschrijving,pUrl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ticket`(IN pGebruikerID INT, pCategorieID INT, pOnderwerp varchar(100))
BEGIN
insert into tbltickets (gebruikerID,categorieID,onderwerp) values (pGebruikerID,pCategorieID,pOnderwerp); SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN pNaam varchar(45), pPasswoord Varchar(90))
BEGIN
SELECT * FROM dbhelpdesk.tblgebruikers where naam=pNaam and password=pPasswoord and actief=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_admins`()
BEGIN
Select g.id as id, g.naam as naam, g.email as email, gr.omschrijving as groep, g.actief as actief, g.dtmGeregistreerd as dtmGeregistreerd 
from tblgebruikers as g
inner join tblgroepen as gr on gr.id = g.groepID
where gr.omschrijving = "Admin";
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_antwoorden_ticket`(IN pTicketID INT)
BEGIN
SELECT tblantwoorden.id, omschrijving, g.naam as gebruiker, dtmgemaakt as datumgemaakt from tblantwoorden 
inner join tblgebruikers as g on g.id = tblantwoorden.gebruikerID
where ticketID=pTicketID
order by dtmGemaakt DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_categorieen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_categorieen`()
BEGIN
SELECT * FROM dbhelpdesk.tblcategorieen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gebruikerID_naam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruikerID_naam`(IN pNaam varchar(45))
BEGIN
SELECT id from tblgebruikers where naam=pNaam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gebruikerID_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruikerID_ticket`(IN pTicketID INT)
BEGIN
SELECT gebruikerID from tbltickets where id=pTicketID;
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
Select g.id as id, g.naam as naam, g.email as email, gr.omschrijving as groep, g.actief as actief, g.dtmGeregistreerd as dtmGeregistreerd 
from tblgebruikers as g
inner join tblgroepen as gr on gr.id = g.groepID
where gr.omschrijving = "Gebruiker";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gebruikers_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruikers_admin`()
BEGIN
Select g.id as id, g.naam as naam, g.email as email, gr.omschrijving as groep, g.actief as actief, g.dtmGeregistreerd as dtmGeregistreerd 
from tblgebruikers as g
inner join tblgroepen as gr on gr.id = g.groepID
where gr.omschrijving = "Admin" or gr.omschrijving = "Gebruiker";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gebruiker_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gebruiker_id`(IN pGebruikerID INT)
BEGIN
Select g.id as id, g.naam as naam, g.email as email, gr.omschrijving as groep, g.actief as actief, g.dtmGeregistreerd as dtmGeregistreerd 
from tblgebruikers as g
inner join tblgroepen as gr on gr.id = g.groepID
where g.id = pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_groepen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_groepen`()
BEGIN
SELECT * FROM dbhelpdesk.tblgroepen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_meldingen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_meldingen`(IN pGebruikerID INT)
BEGIN
Select * from tblmeldingen where gebruikerID = pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_meldingen_gebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_meldingen_gebruiker`(IN pGebruikerID INT)
BEGIN
SELECT id, omschrijving, dtmGemaakt, url FROM dbhelpdesk.tblmeldingen where (gelezen = 0) and (gebruikerID=pGebruikerID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_statussen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_statussen`()
BEGIN
SELECT * FROM dbhelpdesk.tblstatussen;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets`()
BEGIN
SELECT 
t.id as id, 
g.naam as gebruiker,
c.omschrijving as categorie, 
t.onderwerp as onderwerp, 
s.omschrijving as status, 
t.dtmGemaakt as datumgemaakt, 
COALESCE(t.dtmOpgelost,'1001-01-01 00:00') as datumopgelost 
FROM dbhelpdesk.tbltickets as t
inner join tblgebruikers as g on t.gebruikerID = g.id
inner join tblcategorieen as c on t.categorieID = c.id
inner join tblstatussen as s on t.statusID = s.id;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_tickets_gebruiker`(IN pGebruikerID INT)
BEGIN
SELECT 
t.id as id, 
g.naam as gebruiker,
c.omschrijving as categorie, 
t.onderwerp as onderwerp, 
s.omschrijving as status, 
t.dtmGemaakt as datumgemaakt, 
COALESCE(t.dtmOpgelost,'1001-01-01 00:00') as datumopgelost 
FROM dbhelpdesk.tbltickets as t
inner join tblgebruikers as g on t.gebruikerID = g.id
inner join tblcategorieen as c on t.categorieID = c.id
inner join tblstatussen as s on t.statusID = s.id
Where (t.gebruikerID = pGebruikerID)
order by dtmGemaakt DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(IN pNaam varchar(45), pEmail varchar(45), pPasswoord varchar(90))
BEGIN
INSERT INTO tblgebruikers (naam,email,password) VALUES (pNaam,pEmail,pPasswoord);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_admin`(IN pAdminID INT, pTicketID INT)
BEGIN
Update tbltickets set adminID=pAdminID where id=pTicketID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_dtmOpgelost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_dtmOpgelost`(IN pTicketID INT)
BEGIN
Update tbltickets set dtmOpgelost=current_timestamp() where id=pTicketID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_gelezen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_gelezen`(IN pMeldingID INT)
BEGIN
update tblmeldingen set gelezen=1 where (id=pMeldingID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SoortGebruiker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SoortGebruiker`(IN pGebruikerID INT)
BEGIN
SELECT tblgroepen.omschrijving FROM dbhelpdesk.tblgebruikers inner join tblgroepen on groepID = tblgroepen.id where (tblgebruikers.id=pGebruikerID);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_antwoorden`(In pAntwoordID INT, pOmschrijving varchar(100))
BEGIN
Update tblantwoorden set omschrijving=pOmschrijving where id=pAntwoordID;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_gebruikers`(IN pNaam varchar(45), pEmail varchar(45), pGroepID INT, pActief tinyint, pGebruikerID INT)
BEGIN
UPDATE tblgebruikers set naam=pNaam,email=pEmail,groepID=pGroepID,actief=pActief where id= pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_passwoord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_passwoord`(IN pGebruikerID INT, pPasswoord varchar(90))
BEGIN
UPDATE tblgebruikers SET password=pPasswoord WHERE id=pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_profiel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_profiel`(IN pNaam varchar(45), pEmail varchar(45), pGebruikerID INT)
BEGIN
UPDATE tblgebruikers set naam=pNaam, email=pEmail where id=pGebruikerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_status_ticket_open` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_ticket_open`(IN pTicketID INT)
BEGIN
update tbltickets set statusid=2 where id=pTicketID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ticket`(IN pCategorieID INT, pStatusID INT, pOnderwerp varchar(100), pTicketID INT)
BEGIN
UPDATE tbltickets as t set t.categorieID = pCategorieID, t.statusID = pStatusID, t.onderwerp = pOnderwerp
where t.id = pTicketID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ticket_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ticket_status`(IN pCategorieID INT, pOnderwerp varchar(100), pTicketID INT)
BEGIN
UPDATE tbltickets as t set t.categorieID = pCategorieID, t.onderwerp = pOnderwerp
where t.id = pTicketID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verify_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_user`(IN pPasswoord varchar(90), pGebruikerID INT)
BEGIN
SELECT * from tblgebruikers where (id=pGebruikerID) and (password = pPasswoord);
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

-- Dump completed on 2020-04-24 11:37:45
