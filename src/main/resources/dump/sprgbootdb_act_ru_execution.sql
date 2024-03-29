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
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('102501',1,'102501',NULL,NULL,'hireProcessWithJpa:3:100004',NULL,'102501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-08-10 16:47:33.381',NULL,NULL,0,0,0,0,0,0,0,0,0),('102510',1,'97501',NULL,'97501','hireProcessWithJpa:2:90004',NULL,'97501','sid-304989D1-D3EC-4F89-A288-2238C7941973',1,0,1,0,0,1,NULL,'',NULL,'2019-08-10 16:50:54.786',NULL,NULL,0,0,0,0,0,0,0,0,0),('102512',1,'97501',NULL,'102510','hireProcessWithJpa:2:90004',NULL,'97501','sid-BE9CDC49-2ED2-4FEF-A7DC-564EFA71A4DE',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 16:50:54.831',NULL,NULL,0,0,0,0,0,0,0,0,0),('102514',1,'97501',NULL,'102510','hireProcessWithJpa:2:90004',NULL,'97501','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 16:50:54.831',NULL,NULL,0,0,0,0,0,0,0,0,0),('102517',1,'97501',NULL,'102510','hireProcessWithJpa:2:90004',NULL,'97501','sid-14429F68-4A79-47DC-A3F0-21804629FD88',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 16:50:54.832',NULL,NULL,0,0,0,0,0,0,0,0,0),('105007',2,'90005',NULL,'90005','hireProcessWithJpa:2:90004',NULL,'90005','sid-304989D1-D3EC-4F89-A288-2238C7941973',1,0,1,0,0,1,NULL,'',NULL,'2019-08-10 17:00:54.079',NULL,NULL,0,0,0,0,0,0,0,0,0),('105009',1,'90005',NULL,'105007','hireProcessWithJpa:2:90004',NULL,'90005','sid-BE9CDC49-2ED2-4FEF-A7DC-564EFA71A4DE',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:00:54.231',NULL,NULL,0,0,0,0,0,0,0,0,0),('105011',2,'90005',NULL,'105007','hireProcessWithJpa:2:90004',NULL,'90005','sid-E16BD1C2-F09E-4946-A65A-3D2FBF1FC62E',0,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:00:54.233',NULL,NULL,0,0,0,0,0,0,0,0,0),('105014',1,'90005',NULL,'105007','hireProcessWithJpa:2:90004',NULL,'90005','sid-14429F68-4A79-47DC-A3F0-21804629FD88',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:00:54.259',NULL,NULL,0,0,0,0,0,0,0,0,0),('107503',1,'102501',NULL,'102501','hireProcessWithJpa:3:100004',NULL,'102501','sid-304989D1-D3EC-4F89-A288-2238C7941973',1,0,1,0,0,1,NULL,'',NULL,'2019-08-10 17:09:18.250',NULL,NULL,0,0,0,0,0,0,0,0,0),('107505',1,'102501',NULL,'107503','hireProcessWithJpa:3:100004',NULL,'102501','sid-BE9CDC49-2ED2-4FEF-A7DC-564EFA71A4DE',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:09:18.447',NULL,NULL,0,0,0,0,0,0,0,0,0),('107507',1,'102501',NULL,'107503','hireProcessWithJpa:3:100004',NULL,'102501','sid-C2137C46-166B-4F9B-92A1-97BF920FCD9E',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:09:18.449',NULL,NULL,0,0,0,0,0,0,0,0,0),('107510',1,'102501',NULL,'107503','hireProcessWithJpa:3:100004',NULL,'102501','sid-14429F68-4A79-47DC-A3F0-21804629FD88',1,0,0,0,0,1,NULL,'',NULL,'2019-08-10 17:09:18.479',NULL,NULL,0,0,0,0,0,0,0,0,0),('122505',1,'122505',NULL,NULL,'hireProcessWithJpa:4:122504',NULL,'122505',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-08-11 14:48:45.045',NULL,NULL,0,0,0,0,0,0,0,0,0),('122515',2,'122505',NULL,'122505','hireProcessWithJpa:4:122504',NULL,'122505','sid-304989D1-D3EC-4F89-A288-2238C7941973',1,0,1,0,0,1,NULL,'',NULL,'2019-08-11 14:56:22.709',NULL,NULL,0,0,0,0,0,0,0,0,0),('122517',1,'122505',NULL,'122515','hireProcessWithJpa:4:122504',NULL,'122505','sid-BE9CDC49-2ED2-4FEF-A7DC-564EFA71A4DE',1,0,0,0,0,1,NULL,'',NULL,'2019-08-11 14:56:22.713',NULL,NULL,0,0,0,0,0,0,0,0,0),('122519',2,'122505',NULL,'122515','hireProcessWithJpa:4:122504',NULL,'122505','sid-E16BD1C2-F09E-4946-A65A-3D2FBF1FC62E',0,0,0,0,0,1,NULL,'',NULL,'2019-08-11 14:56:22.713',NULL,NULL,0,0,0,0,0,0,0,0,0),('122522',1,'122505',NULL,'122515','hireProcessWithJpa:4:122504',NULL,'122505','sid-14429F68-4A79-47DC-A3F0-21804629FD88',1,0,0,0,0,1,NULL,'',NULL,'2019-08-11 14:56:22.714',NULL,NULL,0,0,0,0,0,0,0,0,0),('90005',1,'90005',NULL,NULL,'hireProcessWithJpa:2:90004',NULL,'90005',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-08-06 00:47:15.167',NULL,NULL,0,0,0,0,0,0,0,0,0),('95001',1,'95001',NULL,NULL,'hireProcessWithJpa:2:90004',NULL,'95001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-08-07 00:59:14.488',NULL,NULL,0,0,0,0,0,0,0,0,0),('95003',1,'95001',NULL,'95001','hireProcessWithJpa:2:90004',NULL,'95001','sid-42BAE58A-8FFB-4B02-AAED-E0D8EA5A7E39',1,0,0,0,0,1,NULL,'',NULL,'2019-08-07 00:59:14.510',NULL,NULL,0,0,0,0,0,0,0,0,0),('97501',1,'97501',NULL,NULL,'hireProcessWithJpa:2:90004',NULL,'97501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-08-07 10:50:01.204',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-11 17:47:11
