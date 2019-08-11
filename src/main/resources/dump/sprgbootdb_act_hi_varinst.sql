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
INSERT INTO `act_hi_varinst` VALUES ('102502','102501','102501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','39','2019-08-10 16:47:33.444','2019-08-10 16:47:33.444'),('102508','97501','97501',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-10 16:50:54.779','2019-08-10 16:50:54.779'),('105005','90005','90005',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-10 17:00:53.912','2019-08-10 17:00:53.912'),('107501','102501','102501',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-10 17:09:18.035','2019-08-10 17:09:18.035'),('110003','90005','90005',NULL,'techOk','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-11 10:22:37.964','2019-08-11 10:22:37.964'),('122506','122505','122505',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','40','2019-08-11 14:48:45.048','2019-08-11 14:48:45.048'),('122513','122505','122505',NULL,'telephoneInterviewOutcome','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-11 14:56:22.700','2019-08-11 14:56:22.700'),('125005','122505','122505',NULL,'techOk','boolean',0,NULL,NULL,1,NULL,NULL,'2019-08-11 15:00:50.672','2019-08-11 15:00:50.672'),('90006','90005','90005',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','36','2019-08-06 00:47:15.171','2019-08-06 00:47:15.171'),('95002','95001','95001',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','37','2019-08-07 00:59:14.507','2019-08-07 00:59:14.507'),('97502','97501','97501',NULL,'applicant','jpa-entity',0,NULL,NULL,NULL,'ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant','38','2019-08-07 10:50:01.226','2019-08-07 10:50:01.226');
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

-- Dump completed on 2019-08-11 17:47:10
