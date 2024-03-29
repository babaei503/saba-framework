-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sprgbootdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applicanthireinfo`
--

DROP TABLE IF EXISTS `applicanthireinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applicanthireinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` bigint(20) NOT NULL,
  `telintviwres` tinyint(4) DEFAULT NULL,
  `telintviwdesc` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `techintviwres` tinyint(4) DEFAULT NULL,
  `techintviwdesc` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finnegotres` tinyint(4) DEFAULT NULL,
  `finnegotdesc` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `creator` tinyblob,
  `modified_at` datetime DEFAULT NULL,
  `modifier` tinyblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `applicantid_UNIQUE` (`applicantid`),
  CONSTRAINT `fk_hire_applicant` FOREIGN KEY (`applicantid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicanthireinfo`
--

LOCK TABLES `applicanthireinfo` WRITE;
/*!40000 ALTER TABLE `applicanthireinfo` DISABLE KEYS */;
INSERT INTO `applicanthireinfo` VALUES (1,38,1,'I accept with hiring Sarah Hakkak as Java Developer.',0,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,36,1,'Accepted',1,'Technical is ok.',0,NULL,NULL,NULL,NULL,NULL),(9,39,1,'ok hiring.',0,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,40,1,'I accept applicant.',1,'We Accept.',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `applicanthireinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-11 17:47:07
