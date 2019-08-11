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
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('102519',1,'102514','97501','hireProcessWithJpa:2:90004','Tech interview',NULL,'Conduct a technical interview with Sarah Hakkak that applied for job title Java Developer with job code D1002. Phone number is 09135555555 and email address is Sarah.h@gmail.com .','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-08-10 12:20:54.832',NULL,NULL,1,'',NULL,NULL),('102522',1,'102517','97501','hireProcessWithJpa:2:90004','Financial negotiation',NULL,'Negotiate with Sarah Hakkak that applied for job title Java Developer with job code D1002. Phone number is 09135555555 and email address is Sarah.h@gmail.com .','sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,NULL,NULL,50,'2019-08-10 12:20:54.833',NULL,NULL,1,'',NULL,NULL),('105019',2,'105014','90005','hireProcessWithJpa:2:90004','Financial negotiation',NULL,'Negotiate with Saeid Babaei that applied for job title Software Engineering with job code E1001. Phone number is 09132376508 and email address is babaei503@gmail.com .','sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,'finance1',NULL,50,'2019-08-10 12:30:54.417',NULL,NULL,1,'',NULL,'2019-08-11 10:21:51.451'),('107512',1,'107507','102501','hireProcessWithJpa:3:100004','Tech interview',NULL,'Conduct a technical interview with Arash Rad that applied for job title Software Engineering with job code E1001. Phone number is 09189999666 and email address is Arash34@gmail.com .','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-08-10 12:39:18.483',NULL,NULL,1,'',NULL,NULL),('107515',1,'107510','102501','hireProcessWithJpa:3:100004','Financial negotiation',NULL,'Negotiate with Arash Rad that applied for job title Software Engineering with job code E1001. Phone number is 09189999666 and email address is Arash34@gmail.com .','sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,NULL,NULL,50,'2019-08-10 12:39:18.716',NULL,NULL,1,'',NULL,NULL),('122527',2,'122522','122505','hireProcessWithJpa:4:122504','Financial negotiation',NULL,'Negotiate with Saeid Babaei that applied for job title .Net Developer with job code D1001. Phone number is 09132376508 and email address is babaei503@yahoo.com .','sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,'finance1',NULL,50,'2019-08-11 10:26:22.717',NULL,NULL,1,'',NULL,'2019-08-11 15:01:07.980'),('95006',1,'95003','95001','hireProcessWithJpa:2:90004','Telephone interview',NULL,'Conduct a telephone interview with Sasan Rad that applied for job title .Net Developer with job code D1001. Phone number is 09124444444 and email address is sasanrad@gmail.com .','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-08-06 20:29:14.520',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
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
