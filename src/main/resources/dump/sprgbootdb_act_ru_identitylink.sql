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
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('10021',1,'dev-management','candidate',NULL,'10020',NULL,NULL),('20013',1,'dev-management','candidate',NULL,'20012',NULL,NULL),('20016',1,'finance','candidate',NULL,'20015',NULL,NULL),('22508',1,'dev-managers','candidate',NULL,'22507',NULL,NULL),('22521',1,'dev-management','candidate',NULL,'22520',NULL,NULL),('22524',1,'finance','candidate',NULL,'22523',NULL,NULL),('25008',1,'dev-managers','candidate',NULL,'25007',NULL,NULL),('27508',1,'dev-managers','candidate',NULL,'27507',NULL,NULL),('30008',1,'dev-managers','candidate',NULL,'30007',NULL,NULL),('30016',1,'dev-managers','candidate',NULL,'30015',NULL,NULL),('30024',1,'dev-managers','candidate',NULL,'30023',NULL,NULL),('32508',1,'dev-managers','candidate',NULL,'32507',NULL,NULL),('32516',1,'dev-managers','candidate',NULL,'32515',NULL,NULL),('35008',1,'dev-managers','candidate',NULL,'35007',NULL,NULL),('37508',1,'dev-managers','candidate',NULL,'37507',NULL,NULL),('37516',1,'dev-managers','candidate',NULL,'37515',NULL,NULL),('40008',1,'dev-managers','candidate',NULL,'40007',NULL,NULL),('40016',1,'dev-managers','candidate',NULL,'40015',NULL,NULL),('40024',1,'dev-managers','candidate',NULL,'40023',NULL,NULL),('40032',1,'dev-managers','candidate',NULL,'40031',NULL,NULL),('40040',1,'dev-managers','candidate',NULL,'40039',NULL,NULL),('40048',1,'dev-managers','candidate',NULL,'40047',NULL,NULL),('45008',1,'dev-managers','candidate',NULL,'45007',NULL,NULL),('45016',1,'dev-managers','candidate',NULL,'45015',NULL,NULL),('47508',1,'dev-managers','candidate',NULL,'47507',NULL,NULL),('50008',1,'dev-managers','candidate',NULL,'50007',NULL,NULL),('50016',1,'dev-managers','candidate',NULL,'50015',NULL,NULL),('50024',1,'dev-managers','candidate',NULL,'50023',NULL,NULL),('50032',1,'dev-managers','candidate',NULL,'50031',NULL,NULL),('7521',1,'dev-management','candidate',NULL,'7520',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
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
