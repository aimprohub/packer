-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: calibration
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(51) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ram','ramm','ram@gmail.com','user',1),(2,'ravi','ravi1','ravi@gmail.com','user',1),(3,'f','f','ravi@gmail.com','user',1),(4,'anand','anand','admin@mail.com','admin',1),(5,'tom','tom1','tom@gmail.com','user',0),(6,'sa','sa','sa@mail.com','user',1),(7,'sb','sb','sb@mail.com','user',1),(8,'sc','sc','sc@mail.com','user',1),(9,'sd','sd','sd@mail.com','user',1),(10,'se','se','se@mail.com','user',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibrate`
--

DROP TABLE IF EXISTS `calibrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calibrate` (
  `calibrate_id` int NOT NULL AUTO_INCREMENT,
  `equ_id` int DEFAULT NULL,
  `parameter_readings` varchar(550) DEFAULT NULL,
  `perform_date` date DEFAULT NULL,
  `id` int DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `digitally_signed` tinyint(1) DEFAULT NULL,
  `approvar_name` varchar(40) DEFAULT NULL,
  `approvar_email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`calibrate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibrate`
--

LOCK TABLES `calibrate` WRITE;
/*!40000 ALTER TABLE `calibrate` DISABLE KEYS */;
INSERT INTO `calibrate` VALUES (1,1,NULL,'2021-02-21',2,NULL,NULL,NULL,NULL),(2,1,'girishm32@yahoo.com|ABCD|BCDE|DEFG|SSFF|GFD||on|on|1||||','2021-03-05',2,NULL,NULL,NULL,NULL),(3,1,'abab@gmail.com|BBBB|CCCC|DDDD|EEEE|FFFF|To add remarks for the equipment and close.|on|on|1||||','2021-03-15',2,'To add remarks for the equipment and close.',NULL,NULL,NULL),(4,1,'girishm32@yahoo.com|sdfsdf|asasas|asdsf|cvccvd|sdfdsff|Ramarks herer|on|on|||1||','2021-03-19',2,'Ramarks herer',NULL,NULL,NULL),(5,2,'asdf@dd.com|bbb@ddd.com|bbbb|aaa|ggg|ttt|uuuu','2021-04-07',2,'Calibration is ok. However issue  with long run of equipment in  warm condtions. ',NULL,NULL,NULL),(6,2,'asdf@dd.com|bbb@ddd.com|bbbb|aaa|ggg|ttt|uuuu','2021-04-14',2,'',NULL,NULL,NULL),(7,2,'asdf@dd.com|bbb@ddd.com|bbbb|aaa|ggg|ttt|uuuu','2021-04-26',2,'',NULL,NULL,NULL),(8,2,'abc@ssaa.com|GG@gam.com|GHGH|FGFG|HJHJ|JUJU|BGFH','2021-04-26',2,'Remakrs',NULL,NULL,NULL),(9,2,'abc@ssaa.com|GG@gam.com|GHGH|FGFG|HJHJ|JUJU|BGFH','2021-04-26',3,'Remakss added this loc',NULL,NULL,NULL),(10,2,'abc@ssaa.com|GG@gam.com|GHGH|FGFG|HJHJ|JUJU|BGFH','2021-04-26',3,'RREEMMEEKK',NULL,NULL,'rajan22@mail.com'),(11,2,'addfasdf asd|GG@gam.com|GHGH|FGFG|HJHJ|JUJU|BGFH','2021-04-26',3,'',NULL,NULL,'addfasdf asd'),(12,2,'Nitin Gandhe|GG@gam.com|GHGH|FGFG|HJHJ|JUJU|BGFH','2021-04-26',3,'',NULL,'Nitin Gandhe',NULL),(13,3,'Sandeep1|sdsd@mail.com|djdjdj|sssssss|djdjdjdj|jjjjkkkkk|lklklklk','2021-04-27',3,'',1,'Sandeep1','sdsd@mail.com'),(14,3,'Sandeep1|sdsd@mail.com|djdjdj|sssssss|djdjdjdj|jjjjkkkkk|lklklklk','2021-04-27',3,'',1,'Sandeep1','sdsd@mail.com'),(15,3,'Mandar|sdfsd@kk.com|kk|hh|gg|bb|f','2021-04-27',3,'remakr',0,'Mandar','sdfsd@kk.com'),(16,3,'shirhs|ssss@ss.com|hshs|hghg|hfh|jdjd|dhdh|djdjdtrmsti','2021-04-27',3,'djdjdtrmsti',0,'shirhs','ssss@ss.com'),(17,3,'shirhs|ssss@ss.com|hshs|hghg|hfh|jdjd|dhdh|','2021-04-27',3,'',0,'shirhs','ssss@ss.com'),(18,3,'shirhs|ssss@ss.com|hshs|hghg|hfh|jdjd|dhdh|','2021-04-27',3,'',0,'shirhs','ssss@ss.com'),(19,3,'shirhs|ssss@ss.com|hshs|hghg|hfh|jdjd|dhdh|','2021-04-27',3,'',0,'shirhs','ssss@ss.com'),(20,3,'sachin|asdf@ddd.com|asdssd|kjlj|hh|hh|iii|uuu|on|0|||3|sachin|asdf @ddd.com|asdssd|kjlj|hh|hh|iii|uuu|on|0','2021-04-27',3,'uuu',0,'sachin','asdf@ddd.com'),(21,3,'sachin||asdssd|kjlj|hh|hh|iii|uuu','2021-04-27',3,'uuu',0,'sachin',''),(22,3,'sachin||asdssd|kjlj|hh|hh|iii|uuu','2021-04-27',3,'uuu',0,'sachin',''),(23,3,'sachin||asdssd|kjlj|hh|hh|iii|uuu','2021-04-27',3,'uuu',0,'sachin',''),(24,3,'|||||||','2021-04-27',3,'',0,'',''),(25,3,'|||||||','2021-04-27',3,'',1,'',''),(26,3,'|||||||','2021-04-27',3,'',0,'',''),(27,3,'|||||||','2021-04-27',3,'',1,'',''),(28,3,'{\'approvar_name\': \'sjsj\', \'approvar_email\': \'jsjs@ss.com\', \'Air Velocity\': \'jlkj\', \' HEPA Filter Integrity\': \'klj\', \'LUX\': \'lkj\', \'Noise Level\': \'lkj\', \'Practical count test\': \'lkj\', \'Remarks\': \'lkjlk\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(29,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'Remarks\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(30,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'Remarks\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(31,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'Remarks\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(32,3,'{\'approvar_name\': \'sdfs\', \'approvar_email\': \'sddf@ss.com\', \'Air Velocity\': \'dsfs \', \' HEPA Filter Integrity\': \'kj\', \'LUX\': \'lkj\', \'Noise Level\': \'kj\', \'Practical count test\': \'lkj\', \'Remarks\': \'lkj\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(33,3,'{\'approvar_name\': \'Girish\', \'approvar_email\': \'girishm32@yahoo.com\', \'Air Velocity\': \'PUNE\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'sdfsd\', \'Noise Level\': \'kj\', \'Practical count test\': \'lkj\', \'Remarks\': \'lkj\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(34,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'Remarks\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(35,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'Remarks\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-04-28',3,NULL,NULL,NULL,NULL),(36,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(37,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(38,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(39,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(40,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(41,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(42,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(43,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(44,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(45,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(46,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(47,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(48,1,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'ECG_Heart_rate\': \'\', \'Apmlitude\': \'\', \'All_Arthimia\': \'\', \'ECG_Wave_Performance\': \'\', \'Noise_level\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'1\', \'textall\': \'\'}','2021-05-10',3,NULL,NULL,NULL,NULL),(49,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-05-18',3,NULL,NULL,NULL,NULL),(50,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-05-18',3,NULL,NULL,NULL,NULL),(51,3,'{\'approvar_name\': \'\', \'approvar_email\': \'\', \'Air Velocity\': \'\', \' HEPA Filter Integrity\': \'\', \'LUX\': \'\', \'Noise Level\': \'\', \'Practical count test\': \'\', \'p|-para1\': \'\', \'para1\': \'\', \'p|-para2\': \'\', \'para2\': \'\', \'p|-para3\': \'\', \'para3\': \'\', \'p|-para4\': \'\', \'para4\': \'\', \'Remarks\': \'\', \'text\': \'\', \'equipmentid\': \'3\', \'textall\': \'\'}','2021-05-18',3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `calibrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'OPD1'),(2,'OPD'),(3,'Laboratory_No_1'),(4,'Xary'),(5,'ECG'),(6,'op_theator_1'),(7,'op_theator_2');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equ_parameter_reg`
--

DROP TABLE IF EXISTS `equ_parameter_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equ_parameter_reg` (
  `equ_parameter_id` int NOT NULL AUTO_INCREMENT,
  `equ_name` varchar(30) DEFAULT NULL,
  `parameter_name` varchar(230) DEFAULT NULL,
  PRIMARY KEY (`equ_parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equ_parameter_reg`
--

LOCK TABLES `equ_parameter_reg` WRITE;
/*!40000 ALTER TABLE `equ_parameter_reg` DISABLE KEYS */;
INSERT INTO `equ_parameter_reg` VALUES (1,'ecg_mc','ECG_Heart_rate,Apmlitude,All_Arthimia,ECG_Wave_Performance,Noise_level'),(2,'difibrilator','ECG_Heart_rate,Apmlitude,All_Arthimia,Energy Test,Noise_level'),(3,'Luminar Air Flow','Air Velocity, HEPA Filter Integrity,LUX,Noise Level,Practical count test'),(4,'TMT Machine','ECG, Heart rate, Amplitute, RPM, Arrythma, Perormance test'),(5,'Electrical Safty','Power Cords- visual test, Mains Socket- visual, Equipment Type(B BF CF), Equipment Class(I II III), FUNCTIONAL-Voltage betn L to N to E, Leakage Current, Load current, Patient Leakage current, Enclosure Current');
/*!40000 ALTER TABLE `equ_parameter_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equ_id` int NOT NULL AUTO_INCREMENT,
  `equ_parameter_id` int DEFAULT NULL,
  `equ_name` varchar(40) DEFAULT NULL,
  `equ_make` varchar(40) DEFAULT NULL,
  `equ_model` varchar(40) DEFAULT NULL,
  `equ_serialno` varchar(40) DEFAULT NULL,
  `equ_asset` varchar(40) DEFAULT NULL,
  `equ_range` varchar(25) DEFAULT NULL,
  `vender_id` int DEFAULT NULL,
  `department_id` varchar(40) DEFAULT NULL,
  `equ_least_c` varchar(40) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`equ_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,1,'ECG','Philips','MP-H/30','Ksi901',NULL,NULL,2,'3',NULL,NULL,NULL),(2,2,'Xray','Simense','OLK-N/1331','semen3320',NULL,NULL,2,'2',NULL,NULL,NULL),(3,3,'TMT Machine','GE Healthcare','ENG-049/1331','GE0020-8',NULL,NULL,1,'2',NULL,NULL,NULL),(4,5,'Auto Refracto Meter','Semainse','ODP-1021/538','SE0013-8',NULL,NULL,1,'2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospital_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `contact_no` int DEFAULT NULL,
  `authorised_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Syadri Hospital','32 Karve Road, near Garaware college','Pune','411002',NULL,'Shankar Satpute'),(2,'Kamala Hospital','10 Aunthd Road, near Fergusson School','Pune','411002',NULL,'Shri Ghatge'),(3,'Krishna Clinic','2 Kothurd, near Poona Backery','Pune','411031',NULL,'Hemant K'),(4,'Poona Hospital','2 Deccon, New bridge opp Garaware School','Pune','411031',NULL,'Ajit Deore');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator` (
  `operator_id` int NOT NULL AUTO_INCREMENT,
  `op_name` varchar(40) DEFAULT NULL,
  `phone_no` varchar(12) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator`
--

LOCK TABLES `operator` WRITE;
/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
INSERT INTO `operator` VALUES (1,'Anand Choudhary','7864564734',NULL,'anandchou@gmail.com'),(2,'Satish Gune','9844683748',NULL,'satishg@hotmaiool.com'),(3,'Nandan Bhade','9378468372',NULL,'mandar@gmai.com');
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `psw` varchar(16) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'anandk','Ananad','Chougule','1234',1,'operator'),(2,'kunals','Kunal','Shinde','kunal1',1,'admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vender`
--

DROP TABLE IF EXISTS `vender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vender` (
  `vender_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  `authorised_name` varchar(40) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vender`
--

LOCK TABLES `vender` WRITE;
/*!40000 ALTER TABLE `vender` DISABLE KEYS */;
INSERT INTO `vender` VALUES (1,'Sahyadri Hospital','32 Karve Road, near Garaware college','Pune','411002',NULL,'Shankar Satpute',NULL),(2,'Kamala Hospital','10 Aunthd Road, near Fergusson School','Pune','411002',NULL,'Shrikant Ghatge',NULL),(3,'Krishna Clinic','2 Kothurd, near Poona Backery','Pune','411031',NULL,'Hemant K',NULL),(4,'Poona Hospital','2 Deccon, New bridge opp Garaware School','Pune','411031','206539846','Ajit Deore',NULL),(5,'Shri Children Hospital','23/4 Kondhwa, Hadpsar Ind Area, above Relience mart','Pune','411089','9878678756','Sanjay Kulkarni',NULL),(6,'Chaitnya Clinik Hospital','Sr No 213, Upper Shivane, Warje Malwadi, Next to Bank of India','Pune','411034','8779672736','Sameer Kokate',NULL);
/*!40000 ALTER TABLE `vender` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 16:30:13
