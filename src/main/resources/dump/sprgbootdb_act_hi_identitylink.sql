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
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('10008','dev-managers','candidate',NULL,'10007',NULL),('10021','dev-management','candidate',NULL,'10020',NULL),('10024','finance','candidate',NULL,'10023',NULL),('15008','dev-managers','candidate',NULL,'15007',NULL),('17508','dev-managers','candidate',NULL,'17507',NULL),('20013','dev-management','candidate',NULL,'20012',NULL),('20016','finance','candidate',NULL,'20015',NULL),('22508','dev-managers','candidate',NULL,'22507',NULL),('22521','dev-management','candidate',NULL,'22520',NULL),('22524','finance','candidate',NULL,'22523',NULL),('25008','dev-managers','candidate',NULL,'25007',NULL),('27508','dev-managers','candidate',NULL,'27507',NULL),('30008','dev-managers','candidate',NULL,'30007',NULL),('30016','dev-managers','candidate',NULL,'30015',NULL),('30024','dev-managers','candidate',NULL,'30023',NULL),('32508','dev-managers','candidate',NULL,'32507',NULL),('32516','dev-managers','candidate',NULL,'32515',NULL),('35008','dev-managers','candidate',NULL,'35007',NULL),('37508','dev-managers','candidate',NULL,'37507',NULL),('37516','dev-managers','candidate',NULL,'37515',NULL),('40008','dev-managers','candidate',NULL,'40007',NULL),('40016','dev-managers','candidate',NULL,'40015',NULL),('40024','dev-managers','candidate',NULL,'40023',NULL),('40032','dev-managers','candidate',NULL,'40031',NULL),('40040','dev-managers','candidate',NULL,'40039',NULL),('40048','dev-managers','candidate',NULL,'40047',NULL),('45008','dev-managers','candidate',NULL,'45007',NULL),('45016','dev-managers','candidate',NULL,'45015',NULL),('47508','dev-managers','candidate',NULL,'47507',NULL),('50008','dev-managers','candidate',NULL,'50007',NULL),('50016','dev-managers','candidate',NULL,'50015',NULL),('50024','dev-managers','candidate',NULL,'50023',NULL),('50032','dev-managers','candidate',NULL,'50031',NULL),('7508','dev-managers','candidate',NULL,'7507',NULL),('7521','dev-management','candidate',NULL,'7520',NULL),('7524','finance','candidate',NULL,'7523',NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-03  0:29:47
