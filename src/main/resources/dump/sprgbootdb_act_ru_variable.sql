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
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('10002',1,'jpa-entity','applicant','10001','10001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','6'),('10009',1,'boolean','telephoneInterviewOutcome','10001','10001',NULL,NULL,NULL,1,NULL,NULL),('10025',1,'boolean','techOk','10001','10001',NULL,NULL,NULL,1,NULL,NULL),('15002',1,'jpa-entity','applicant','15001','15001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','7'),('17502',1,'jpa-entity','applicant','17501','17501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','8'),('20001',1,'boolean','telephoneInterviewOutcome','15001','15001',NULL,NULL,NULL,1,NULL,NULL),('22502',1,'jpa-entity','applicant','22501','22501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','9'),('22509',1,'boolean','telephoneInterviewOutcome','17501','17501',NULL,NULL,NULL,1,NULL,NULL),('25002',1,'jpa-entity','applicant','25001','25001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','10'),('27502',1,'jpa-entity','applicant','27501','27501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','11'),('30002',1,'jpa-entity','applicant','30001','30001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','12'),('30010',1,'jpa-entity','applicant','30009','30009',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','13'),('30018',1,'jpa-entity','applicant','30017','30017',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','14'),('32502',1,'jpa-entity','applicant','32501','32501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','15'),('32510',1,'jpa-entity','applicant','32509','32509',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','16'),('35002',1,'jpa-entity','applicant','35001','35001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','17'),('37502',1,'jpa-entity','applicant','37501','37501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','18'),('37510',1,'jpa-entity','applicant','37509','37509',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','19'),('40002',1,'jpa-entity','applicant','40001','40001',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','20'),('40010',1,'jpa-entity','applicant','40009','40009',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','21'),('40018',1,'jpa-entity','applicant','40017','40017',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','22'),('40026',1,'jpa-entity','applicant','40025','40025',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','23'),('40034',1,'jpa-entity','applicant','40033','40033',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','24'),('40042',1,'jpa-entity','applicant','40041','40041',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','25'),('45002',1,'jpa-entity','applicant','45001','45001',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','26'),('45010',1,'jpa-entity','applicant','45009','45009',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','27'),('47502',1,'jpa-entity','applicant','47501','47501',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','28'),('50002',1,'jpa-entity','applicant','50001','50001',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','29'),('50010',1,'jpa-entity','applicant','50009','50009',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','30'),('50018',1,'jpa-entity','applicant','50017','50017',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','31'),('50026',1,'jpa-entity','applicant','50025','50025',NULL,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','32'),('7502',1,'jpa-entity','applicant','7501','7501',NULL,NULL,NULL,NULL,'ir.nioc.wildfly_springboot.activiti.Applicant','5'),('7509',1,'boolean','telephoneInterviewOutcome','7501','7501',NULL,NULL,NULL,1,NULL,NULL),('7525',1,'boolean','techOk','7501','7501',NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-03  0:29:45
