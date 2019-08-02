-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: sprgbootdb
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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `employment` varchar(45) NOT NULL,
  `industry` varchar(45) NOT NULL,
  `jobfunction` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `creator` tinyblob,
  `modified_at` datetime DEFAULT NULL,
  `modifier` tinyblob,
  `open` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='jobs table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'D1001','.Net Developer','Avanade','For one of our clients we are looking for a .NET/Angular Developer','Contract','Computer Software','Engineering, Information Technology','Tehran',NULL,NULL,NULL,NULL,_binary ''),(2,'D1002','Java Developer','NIOC','We are looking for a senior JAVA Developer with experience in building quality, high-performing, scalable, enterprise-grade applications.','Full-time','Computer Software','Engineering, Information Technology','Tehran',NULL,NULL,NULL,NULL,_binary ''),(3,'E1001','Software Engineering','NIOC','Conception and development of a web-based application with Visual Studio / TFS and underlying SQL Server database to create and maintain data level permissions. Related target is to create an authorization assignment tool for Microsoft BI technologies and Microstrategy front-end in the cloud (Microsoft Azure) and on-premise.','Full-time','Computer Software','Engineering, Information Technology','Esfahan',NULL,NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-03  0:29:43
