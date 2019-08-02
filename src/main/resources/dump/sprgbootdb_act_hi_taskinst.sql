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
INSERT INTO `act_hi_taskinst` VALUES ('10007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','10001','10003','Telephone interview',NULL,'Conduct a telephone interview with John Doe. Phone number = 12344',NULL,NULL,'2019-02-16 15:11:35.690',NULL,'2019-02-16 15:11:35.932',242,NULL,50,NULL,NULL,NULL,''),('10020','hireProcessWithJpa:2:5004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','10001','10015','Tech interview',NULL,NULL,NULL,NULL,'2019-02-16 15:11:36.059',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10023','hireProcessWithJpa:2:5004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','10001','10018','Financial negotiation',NULL,NULL,NULL,NULL,'2019-02-16 15:11:36.060',NULL,'2019-02-16 15:11:36.315',255,NULL,50,NULL,NULL,NULL,''),('15007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','15001','15003','Telephone interview',NULL,'Conduct a telephone interview with ali. Phone number = 2020',NULL,NULL,'2019-02-16 17:58:11.614',NULL,'2019-02-17 14:43:44.801',74733187,NULL,50,NULL,NULL,NULL,''),('17507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','17501','17503','Telephone interview',NULL,'Conduct a telephone interview with AHMAD. Phone number = ',NULL,NULL,'2019-02-17 11:08:57.158',NULL,'2019-02-18 09:42:33.155',81215997,NULL,50,NULL,NULL,NULL,''),('20012','hireProcessWithJpa:2:5004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','15001','20007','Tech interview',NULL,NULL,NULL,NULL,'2019-02-17 14:43:44.966',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20015','hireProcessWithJpa:2:5004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','15001','20010','Financial negotiation',NULL,NULL,NULL,NULL,'2019-02-17 14:43:44.969',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('22507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','22501','22503','Telephone interview',NULL,'Conduct a telephone interview with taghi. Phone number = 14789',NULL,NULL,'2019-02-18 09:41:32.940',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('22520','hireProcessWithJpa:2:5004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','17501','22515','Tech interview',NULL,NULL,NULL,NULL,'2019-02-18 09:42:33.241',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('22523','hireProcessWithJpa:2:5004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','17501','22518','Financial negotiation',NULL,NULL,NULL,NULL,'2019-02-18 09:42:33.242',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('25007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','25001','25003','Telephone interview',NULL,'Conduct a telephone interview with person_name. Phone number = business_gst_number',NULL,NULL,'2019-02-18 15:47:11.191',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('27507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','27501','27503','Telephone interview',NULL,'Conduct a telephone interview with retrretret. Phone number = business_gst_number',NULL,NULL,'2019-02-18 16:51:26.233',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('30007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','30001','30003','Telephone interview',NULL,'Conduct a telephone interview with oiuoioi. Phone number = business_gst_number',NULL,NULL,'2019-02-18 17:02:30.377',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('30015','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','30009','30011','Telephone interview',NULL,'Conduct a telephone interview with trtrtrtr. Phone number = business_gst_number',NULL,NULL,'2019-02-18 17:06:24.233',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('30023','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','30017','30019','Telephone interview',NULL,'Conduct a telephone interview with oooo. Phone number = business_gst_number',NULL,NULL,'2019-02-19 09:02:52.495',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('32507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','32501','32503','Telephone interview',NULL,'Conduct a telephone interview with dgf. Phone number = dfg',NULL,NULL,'2019-02-19 09:53:17.434',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('32515','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','32509','32511','Telephone interview',NULL,'Conduct a telephone interview with tyty. Phone number = tyty',NULL,NULL,'2019-02-19 09:55:06.678',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('35007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','35001','35003','Telephone interview',NULL,'Conduct a telephone interview with saeid. Phone number = 0913',NULL,NULL,'2019-02-19 15:05:25.606',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('37507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','37501','37503','Telephone interview',NULL,'Conduct a telephone interview with ssss. Phone number = 555',NULL,NULL,'2019-02-19 16:55:14.438',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('37515','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','37509','37511','Telephone interview',NULL,'Conduct a telephone interview with test. Phone number = 2222',NULL,NULL,'2019-02-23 09:07:39.400',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40007','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40001','40003','Telephone interview',NULL,'Conduct a telephone interview with test. Phone number = 14',NULL,NULL,'2019-05-06 12:45:30.584',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40015','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40009','40011','Telephone interview',NULL,'Conduct a telephone interview with 1test. Phone number = 514',NULL,NULL,'2019-05-06 12:45:40.491',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40023','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40017','40019','Telephone interview',NULL,'Conduct a telephone interview with ali. Phone number = 1485',NULL,NULL,'2019-05-06 12:55:43.286',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40031','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40025','40027','Telephone interview',NULL,'Conduct a telephone interview with reza. Phone number = 1478',NULL,NULL,'2019-05-06 13:03:39.943',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40039','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40033','40035','Telephone interview',NULL,'Conduct a telephone interview with taher. Phone number = 1478',NULL,NULL,'2019-05-07 11:21:08.709',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('40047','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','40041','40043','Telephone interview',NULL,'Conduct a telephone interview with ali. Phone number = 120',NULL,NULL,'2019-05-07 11:24:10.069',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('45007','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','45001','45003','Telephone interview',NULL,'Conduct a telephone interview with Ahmad. Phone number = 09132378888',NULL,NULL,'2019-07-26 14:59:31.398',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('45015','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','45009','45011','Telephone interview',NULL,'Conduct a telephone interview with Jon. Phone number = ',NULL,NULL,'2019-07-26 15:41:36.509',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('47507','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','47501','47503','Telephone interview',NULL,'Conduct a telephone interview with gfgfg. Phone number = ',NULL,NULL,'2019-07-28 12:59:27.638',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('50007','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','50001','50003','Telephone interview',NULL,'Conduct a telephone interview with Jack. Phone number = 09172225566',NULL,NULL,'2019-07-29 10:23:30.657',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('50015','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','50009','50011','Telephone interview',NULL,'Conduct a telephone interview with sdfd. Phone number = ',NULL,NULL,'2019-07-29 10:29:24.503',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('50023','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','50017','50019','Telephone interview',NULL,'Conduct a telephone interview with rttr. Phone number = ',NULL,NULL,'2019-07-29 11:14:57.368',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('50031','hireProcessWithJpa:3:42504','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','50025','50027','Telephone interview',NULL,'Conduct a telephone interview with ttt. Phone number = 02147777789',NULL,NULL,'2019-07-29 13:20:39.657',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7507','hireProcessWithJpa:2:5004','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39','7501','7503','Telephone interview',NULL,'Conduct a telephone interview with John Doe. Phone number = 12344',NULL,NULL,'2019-02-16 14:59:41.518',NULL,'2019-02-16 14:59:42.282',764,NULL,50,NULL,NULL,NULL,''),('7520','hireProcessWithJpa:2:5004','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E','7501','7515','Tech interview',NULL,NULL,NULL,NULL,'2019-02-16 14:59:42.421',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7523','hireProcessWithJpa:2:5004','sid-14429F68-4A79-47DC-A3F0-21804629FD88','7501','7518','Financial negotiation',NULL,NULL,NULL,NULL,'2019-02-16 14:59:42.423',NULL,'2019-02-16 14:59:42.614',191,NULL,50,NULL,NULL,NULL,'');
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

-- Dump completed on 2019-08-03  0:29:34
