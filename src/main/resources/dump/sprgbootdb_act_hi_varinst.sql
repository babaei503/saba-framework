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
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('10002','10001','10001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','6','2019-02-16 15:11:35.672','2019-02-16 15:11:35.672'),('10009','10001','10001',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-16 15:11:35.908','2019-02-16 15:11:35.908'),('10025','10001','10001',NULL,'techOk','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-16 15:11:36.309','2019-02-16 15:11:36.309'),('15002','15001','15001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','7','2019-02-16 17:58:11.587','2019-02-16 17:58:11.587'),('17502','17501','17501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','8','2019-02-17 11:08:57.138','2019-02-17 11:08:57.138'),('20001','15001','15001',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-17 14:43:44.791','2019-02-17 14:43:44.791'),('22502','22501','22501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','9','2019-02-18 09:41:32.914','2019-02-18 09:41:32.914'),('22509','17501','17501',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-18 09:42:33.136','2019-02-18 09:42:33.136'),('25002','25001','25001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','10','2019-02-18 15:47:11.161','2019-02-18 15:47:11.161'),('27502','27501','27501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','11','2019-02-18 16:51:26.213','2019-02-18 16:51:26.213'),('30002','30001','30001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','12','2019-02-18 17:02:29.873','2019-02-18 17:02:29.873'),('30010','30009','30009',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','13','2019-02-18 17:06:24.173','2019-02-18 17:06:24.173'),('30018','30017','30017',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','14','2019-02-19 09:02:52.492','2019-02-19 09:02:52.492'),('32502','32501','32501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','15','2019-02-19 09:53:17.411','2019-02-19 09:53:17.411'),('32510','32509','32509',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','16','2019-02-19 09:55:06.676','2019-02-19 09:55:06.676'),('35002','35001','35001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','17','2019-02-19 15:05:25.586','2019-02-19 15:05:25.586'),('37502','37501','37501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','18','2019-02-19 16:55:14.413','2019-02-19 16:55:14.413'),('37510','37509','37509',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','19','2019-02-23 09:07:39.396','2019-02-23 09:07:39.396'),('40002','40001','40001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','20','2019-05-06 12:45:30.548','2019-05-06 12:45:30.548'),('40010','40009','40009',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','21','2019-05-06 12:45:40.490','2019-05-06 12:45:40.490'),('40018','40017','40017',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','22','2019-05-06 12:55:43.284','2019-05-06 12:55:43.284'),('40026','40025','40025',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','23','2019-05-06 13:03:39.941','2019-05-06 13:03:39.941'),('40034','40033','40033',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','24','2019-05-07 11:21:08.705','2019-05-07 11:21:08.705'),('40042','40041','40041',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','25','2019-05-07 11:24:10.067','2019-05-07 11:24:10.067'),('45002','45001','45001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','26','2019-07-26 14:59:31.353','2019-07-26 14:59:31.353'),('45010','45009','45009',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','27','2019-07-26 15:41:36.503','2019-07-26 15:41:36.503'),('47502','47501','47501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','28','2019-07-28 12:59:27.580','2019-07-28 12:59:27.580'),('50002','50001','50001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','29','2019-07-29 10:23:30.614','2019-07-29 10:23:30.614'),('50010','50009','50009',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','30','2019-07-29 10:29:24.502','2019-07-29 10:29:24.502'),('50018','50017','50017',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','31','2019-07-29 11:14:57.362','2019-07-29 11:14:57.362'),('50026','50025','50025',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','32','2019-07-29 13:20:39.649','2019-07-29 13:20:39.649'),('7502','7501','7501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','5','2019-02-16 14:59:41.504','2019-02-16 14:59:41.504'),('7509','7501','7501',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-16 14:59:42.274','2019-02-16 14:59:42.274'),('7525','7501','7501',NULL,'techOk','boolean',0,NULL,NULL,1,NULL,NULL,'2019-02-16 14:59:42.610','2019-02-16 14:59:42.610');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-03  0:29:51
