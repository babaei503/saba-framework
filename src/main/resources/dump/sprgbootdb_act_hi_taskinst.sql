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
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('102506','hireProcessWithJpa:3:100004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','102501','102503','Telephone interview',NULL,'Conduct a telephone interview with Arash Rad that applied for job title Software Engineering with job code E1001. Phone number is 09189999666 and email address is Arash34@gmail.com .',NULL,'telephone1','2019-08-10 16:47:33.525','2019-08-10 16:56:13.874','2019-08-10 17:09:18.140',1304615,NULL,50,NULL,NULL,NULL,''),('102519','hireProcessWithJpa:2:90004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','97501','102514','Tech interview',NULL,'Conduct a technical interview with Sarah Hakkak that applied for job title Java Developer with job code D1002. Phone number is 09135555555 and email address is Sarah.h@gmail.com .',NULL,NULL,'2019-08-10 16:50:54.833',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('102522','hireProcessWithJpa:2:90004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','97501','102517','Financial negotiation',NULL,'Negotiate with Sarah Hakkak that applied for job title Java Developer with job code D1002. Phone number is 09135555555 and email address is Sarah.h@gmail.com .',NULL,NULL,'2019-08-10 16:50:54.834',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('105016','hireProcessWithJpa:2:90004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','90005','105011','Tech interview',NULL,'Conduct a technical interview with Saeid Babaei that applied for job title Software Engineering with job code E1001. Phone number is 09132376508 and email address is babaei503@gmail.com .',NULL,'tech1','2019-08-10 17:00:54.404','2019-08-11 10:22:15.512','2019-08-11 10:22:37.965',62503561,NULL,50,NULL,NULL,NULL,''),('105019','hireProcessWithJpa:2:90004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','90005','105014','Financial negotiation',NULL,'Negotiate with Saeid Babaei that applied for job title Software Engineering with job code E1001. Phone number is 09132376508 and email address is babaei503@gmail.com .',NULL,'finance1','2019-08-10 17:00:54.423','2019-08-11 10:21:51.451',NULL,NULL,NULL,50,NULL,NULL,NULL,''),('107512','hireProcessWithJpa:3:100004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','102501','107507','Tech interview',NULL,'Conduct a technical interview with Arash Rad that applied for job title Software Engineering with job code E1001. Phone number is 09189999666 and email address is Arash34@gmail.com .',NULL,NULL,'2019-08-10 17:09:18.701',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('107515','hireProcessWithJpa:3:100004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','102501','107510','Financial negotiation',NULL,'Negotiate with Arash Rad that applied for job title Software Engineering with job code E1001. Phone number is 09189999666 and email address is Arash34@gmail.com .',NULL,NULL,'2019-08-10 17:09:18.724',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('122510','hireProcessWithJpa:4:122504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','122505','122507','Telephone interview',NULL,'Conduct a telephone interview with Saeid Babaei that applied for job title .Net Developer with job code D1001. Phone number is 09132376508 and email address is babaei503@yahoo.com .',NULL,'telephone1','2019-08-11 14:48:45.060','2019-08-11 14:55:45.318','2019-08-11 14:56:22.702',457642,NULL,50,NULL,NULL,NULL,''),('122524','hireProcessWithJpa:4:122504','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','122505','122519','Tech interview',NULL,'Conduct a technical interview with Saeid Babaei that applied for job title .Net Developer with job code D1001. Phone number is 09132376508 and email address is babaei503@yahoo.com .',NULL,'tech1','2019-08-11 14:56:22.716','2019-08-11 14:57:48.473','2019-08-11 15:00:50.674',267958,NULL,50,NULL,NULL,NULL,''),('122527','hireProcessWithJpa:4:122504','sid-14429F68-4A79-47DC-A3F0-21804629FD88','122505','122522','Financial negotiation',NULL,'Negotiate with Saeid Babaei that applied for job title .Net Developer with job code D1001. Phone number is 09132376508 and email address is babaei503@yahoo.com .',NULL,'finance1','2019-08-11 14:56:22.717','2019-08-11 15:01:07.980',NULL,NULL,NULL,50,NULL,NULL,NULL,''),('90010','hireProcessWithJpa:2:90004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','90005','90007','Telephone interview',NULL,'Conduct a telephone interview with Saeid Babaei that applied for job title Software Engineering with job code E1001. Phone number is 09132376508 and email address is babaei503@gmail.com .',NULL,'telephone1','2019-08-06 00:47:15.200','2019-08-06 16:04:48.739','2019-08-10 17:00:53.993',404018793,NULL,50,NULL,NULL,NULL,''),('95006','hireProcessWithJpa:2:90004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','95001','95003','Telephone interview',NULL,'Conduct a telephone interview with Sasan Rad that applied for job title .Net Developer with job code D1001. Phone number is 09124444444 and email address is sasanrad@gmail.com .',NULL,NULL,'2019-08-07 00:59:14.540',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('97506','hireProcessWithJpa:2:90004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','97501','97503','Telephone interview',NULL,'Conduct a telephone interview with Sarah Hakkak that applied for job title Java Developer with job code D1002. Phone number is 09135555555 and email address is Sarah.h@gmail.com .',NULL,'telephone1','2019-08-07 10:50:01.260','2019-08-07 10:50:47.664','2019-08-10 16:50:54.780',280853520,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-11 17:47:03
