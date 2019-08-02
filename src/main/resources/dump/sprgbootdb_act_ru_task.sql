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
INSERT INTO `act_ru_task` VALUES ('10020',1,'10015','10001','hireProcessWithJpa:2:5004','Tech interview',NULL,NULL,'sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-02-16 11:41:36.059',NULL,NULL,1,'',NULL,NULL),('20012',1,'20007','15001','hireProcessWithJpa:2:5004','Tech interview',NULL,NULL,'sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-02-17 11:13:44.966',NULL,NULL,1,'',NULL,NULL),('20015',1,'20010','15001','hireProcessWithJpa:2:5004','Financial negotiation',NULL,NULL,'sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,NULL,NULL,50,'2019-02-17 11:13:44.968',NULL,NULL,1,'',NULL,NULL),('22507',1,'22503','22501','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with taghi. Phone number = 14789','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-18 06:11:32.932',NULL,NULL,1,'',NULL,NULL),('22520',1,'22515','17501','hireProcessWithJpa:2:5004','Tech interview',NULL,NULL,'sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-02-18 06:12:33.240',NULL,NULL,1,'',NULL,NULL),('22523',1,'22518','17501','hireProcessWithJpa:2:5004','Financial negotiation',NULL,NULL,'sid-14429F68-4A79-47DC-A3F0-21804629FD88',NULL,NULL,NULL,50,'2019-02-18 06:12:33.242',NULL,NULL,1,'',NULL,NULL),('25007',1,'25003','25001','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with person_name. Phone number = business_gst_number','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-18 12:17:11.183',NULL,NULL,1,'',NULL,NULL),('27507',1,'27503','27501','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with retrretret. Phone number = business_gst_number','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-18 13:21:26.226',NULL,NULL,1,'',NULL,NULL),('30007',1,'30003','30001','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with oiuoioi. Phone number = business_gst_number','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-18 13:32:30.138',NULL,NULL,1,'',NULL,NULL),('30015',1,'30011','30009','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with trtrtrtr. Phone number = business_gst_number','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-18 13:36:24.224',NULL,NULL,1,'',NULL,NULL),('30023',1,'30019','30017','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with oooo. Phone number = business_gst_number','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-19 05:32:52.494',NULL,NULL,1,'',NULL,NULL),('32507',1,'32503','32501','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with dgf. Phone number = dfg','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-19 06:23:17.425',NULL,NULL,1,'',NULL,NULL),('32515',1,'32511','32509','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with tyty. Phone number = tyty','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-19 06:25:06.677',NULL,NULL,1,'',NULL,NULL),('35007',1,'35003','35001','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with saeid. Phone number = 0913','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-19 11:35:25.601',NULL,NULL,1,'',NULL,NULL),('37507',1,'37503','37501','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with ssss. Phone number = 555','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-19 13:25:14.433',NULL,NULL,1,'',NULL,NULL),('37515',1,'37511','37509','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with test. Phone number = 2222','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-02-23 05:37:39.397',NULL,NULL,1,'',NULL,NULL),('40007',1,'40003','40001','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with test. Phone number = 14','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-06 08:15:30.579',NULL,NULL,1,'',NULL,NULL),('40015',1,'40011','40009','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with 1test. Phone number = 514','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-06 08:15:40.491',NULL,NULL,1,'',NULL,NULL),('40023',1,'40019','40017','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with ali. Phone number = 1485','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-06 08:25:43.285',NULL,NULL,1,'',NULL,NULL),('40031',1,'40027','40025','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with reza. Phone number = 1478','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-06 08:33:39.942',NULL,NULL,1,'',NULL,NULL),('40039',1,'40035','40033','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with taher. Phone number = 1478','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-07 06:51:08.707',NULL,NULL,1,'',NULL,NULL),('40047',1,'40043','40041','hireProcessWithJpa:2:5004','Telephone interview',NULL,'Conduct a telephone interview with ali. Phone number = 120','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-05-07 06:54:10.068',NULL,NULL,1,'',NULL,NULL),('45007',1,'45003','45001','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with Ahmad. Phone number = 09132378888','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-26 10:29:31.390',NULL,NULL,1,'',NULL,NULL),('45015',1,'45011','45009','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with Jon. Phone number = ','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-26 11:11:36.508',NULL,NULL,1,'',NULL,NULL),('47507',1,'47503','47501','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with gfgfg. Phone number = ','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-28 08:29:27.624',NULL,NULL,1,'',NULL,NULL),('50007',1,'50003','50001','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with Jack. Phone number = 09172225566','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-29 05:53:30.644',NULL,NULL,1,'',NULL,NULL),('50015',1,'50011','50009','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with sdfd. Phone number = ','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-29 05:59:24.503',NULL,NULL,1,'',NULL,NULL),('50023',1,'50019','50017','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with rttr. Phone number = ','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-29 06:44:57.367',NULL,NULL,1,'',NULL,NULL),('50031',1,'50027','50025','hireProcessWithJpa:3:42504','Telephone interview',NULL,'Conduct a telephone interview with ttt. Phone number = 02147777789','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',NULL,NULL,NULL,50,'2019-07-29 08:50:39.652',NULL,NULL,1,'',NULL,NULL),('7520',1,'7515','7501','hireProcessWithJpa:2:5004','Tech interview',NULL,NULL,'sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',NULL,NULL,NULL,50,'2019-02-16 11:29:42.420',NULL,NULL,1,'',NULL,NULL);
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

-- Dump completed on 2019-08-03  0:29:42
