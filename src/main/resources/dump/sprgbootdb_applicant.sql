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
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applicant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `jobid` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `creator` tinyblob,
  `modified_at` datetime DEFAULT NULL,
  `modifier` tinyblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`,`jobid`),
  KEY `id_idx` (`jobid`),
  CONSTRAINT `jobid` FOREIGN KEY (`jobid`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (17,'babaei@gmail.com','Saeid','09132376508',2,NULL,NULL,NULL,NULL),(22,'rad@gmail.com','Sasan','09145556666',3,NULL,NULL,NULL,NULL),(23,'ahmadi@gmail.com','Reza','09789996666',1,NULL,NULL,NULL,NULL),(25,'alavi@gmail.com','Ali','09132224445',2,NULL,NULL,NULL,NULL),(26,'ahmad@gmail.com','Ahmad','09132378888',1,NULL,NULL,NULL,NULL),(29,'jack@gmail.com','Jack','09172225566',3,NULL,NULL,NULL,NULL),(33,'reza@gmail.com','reza','09139999999',1,NULL,NULL,NULL,NULL),(34,'ahmadi@yahoo.com','ahmad','09124444444',3,NULL,NULL,NULL,NULL),(35,'sasan@gmail.com','sasan','',1,NULL,NULL,NULL,NULL),(36,'babaei503@gmail.com','Saeid Babaei','09132376508',3,NULL,NULL,NULL,NULL),(37,'sasanrad@gmail.com','Sasan Rad','09124444444',1,NULL,NULL,NULL,NULL),(38,'Sarah.h@gmail.com','Sarah Hakkak','09135555555',2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-09 23:32:37
