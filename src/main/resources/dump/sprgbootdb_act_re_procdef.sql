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
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('hireProcessWithJpa:1:4',1,'http://www.activiti.org/processdef','Developer Hiring','hireProcessWithJpa',1,'1','C:\\Java\\java soft\\wildfly-15.0.1.Final\\standalone\\deployments\\wildfly-spring-boot-1.0.0.war\\WEB-INF\\classes\\processes\\Developer_Hiring_with_jpa.bpmn','C:\\Java\\java soft\\wildfly-15.0.1.Final\\standalone\\deployments\\wildfly-spring-boot-1.0.0.war\\WEB-INF\\classes\\processes\\Developer_Hiring_with_jpa.hireProcessWithJpa.png',NULL,0,1,1,'',NULL),('hireProcessWithJpa:2:5004',1,'http://www.activiti.org/processdef','Developer Hiring','hireProcessWithJpa',2,'5001','C:\\Java\\java soft\\wildfly-15.0.1.Final\\standalone\\deployments\\wildfly-spring-boot-1.0.0.war\\WEB-INF\\classes\\processes\\Developer_Hiring_with_jpa.bpmn','C:\\Java\\java soft\\wildfly-15.0.1.Final\\standalone\\deployments\\wildfly-spring-boot-1.0.0.war\\WEB-INF\\classes\\processes\\Developer_Hiring_with_jpa.hireProcessWithJpa.png',NULL,0,1,1,'',NULL),('hireProcessWithJpa:3:42504',1,'http://www.activiti.org/processdef','Applicant Hiring','hireProcessWithJpa',3,'42501','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.bpmn','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.hireProcessWithJpa.png',NULL,0,1,1,'',NULL),('hireProcessWithJpa:4:52504',1,'http://www.activiti.org/processdef','Applicant Hiring','hireProcessWithJpa',4,'52501','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.bpmn20.xml','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.hireProcessWithJpa.png',NULL,0,1,1,'',NULL),('hireProcessWithJpa:5:55004',1,'http://www.activiti.org/processdef','Applicant Hiring','hireProcessWithJpa',5,'55001','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.bpmn20.xml','H:\\Java\\Source\\BackEnd\\saba-framework\\target\\classes\\processes\\Applicant_Hiring_with_jpa.hireProcessWithJpa.png',NULL,0,1,1,'',NULL),('simple:1:2504',1,'Examples','The One Task Process','simple',1,'2501','C:\\Java\\Sample\\activiti-demo-master\\target\\classes\\processes\\simple.bpmn20.xml','C:\\Java\\Sample\\activiti-demo-master\\target\\classes\\processes\\simple.simple.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-03  0:29:50
