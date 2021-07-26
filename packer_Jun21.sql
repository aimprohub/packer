-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: packer
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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `article_name` varchar(25) DEFAULT NULL,
  `base_material` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_list`
--

DROP TABLE IF EXISTS `article_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_list` (
  `article_list_id` int NOT NULL AUTO_INCREMENT,
  `enquiry_id` int DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  `drawing_room` varchar(100) DEFAULT NULL,
  `center_room` varchar(100) DEFAULT NULL,
  `bed_room` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`article_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_list`
--

LOCK TABLES `article_list` WRITE;
/*!40000 ALTER TABLE `article_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry` (
  `enquiry_id` int NOT NULL AUTO_INCREMENT,
  `enquiry_mode` varchar(25) DEFAULT NULL,
  `enq_date` datetime DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  `date_tentative` date DEFAULT NULL,
  `address_load` varchar(100) DEFAULT NULL,
  `address_unload` varchar(100) DEFAULT NULL,
  `house_size_load` int DEFAULT NULL,
  `house_area_unload` int DEFAULT NULL,
  `floor_no_load` int DEFAULT NULL,
  `floor_no_unload` int DEFAULT NULL,
  `lift_available_load` tinyint(1) DEFAULT NULL,
  `lift_available_unload` tinyint(1) DEFAULT NULL,
  `visit_req` tinyint(1) DEFAULT NULL,
  `inv_req` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`enquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry`
--

LOCK TABLES `enquiry` WRITE;
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` VALUES (1,'phone','2021-03-12 02:10:00','Shiva Kulkarni',90494909421,'mandar@gmail.com','2021-03-29','21','42/',NULL,NULL,5,9,0,0,NULL,NULL),(2,'person','2021-03-03 12:50:00','Shastri Sawan',7287986111,'shivak@gmail.com/','2021-03-21','2','40///',NULL,NULL,3,16,0,0,NULL,NULL),(3,'Mobile','2021-01-10 00:00:00','Mandar Kandilal',90494909421,'mandar@gmail.com',NULL,'2/7 Karve Nagar Pune','43 Wadagaon 3rd Lane Katraj',NULL,NULL,2,16,1,1,NULL,NULL),(4,'email','2021-01-21 00:00:00','Bharat Kumar',7475647654,'kumanbh@yahoo.com',NULL,'21','None///',NULL,NULL,11,13,0,0,NULL,NULL),(5,'SMS','2021-02-12 00:00:00','Subhash Jadhav',7809867871,'sarvbah@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Phone','2021-04-01 00:00:00','Ashis Shanrma',7878989876767,'ashish@hotmail.cm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'mode','2021-03-11 00:00:00','Sagar.',67677767,'eMail id...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'mode','2021-04-06 00:00:00','Enter Name ...',56576879,'eMail@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Phone','2021-04-12 00:00:00','aab',7676767,'eMail@mail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'phone','2021-04-08 00:00:00','kjetan d',6767676767,'eMail@mail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'eMail','2021-04-12 00:00:00','Satish Dighe',675867587,'satish@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry1`
--

DROP TABLE IF EXISTS `enquiry1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry1` (
  `enquiry_no_id` int NOT NULL AUTO_INCREMENT,
  `date_of_enquiry` date DEFAULT NULL,
  `party_name` varchar(50) DEFAULT NULL,
  `party_mobile_no` varchar(11) DEFAULT NULL,
  `party_mail_id` varchar(40) DEFAULT NULL,
  `tentative_shifting_date` date DEFAULT NULL,
  `address_loading` varchar(100) DEFAULT NULL,
  `city_loading` varchar(25) DEFAULT NULL,
  `address_unloading` varchar(100) DEFAULT NULL,
  `city_unloading` varchar(25) DEFAULT NULL,
  `household_size` int DEFAULT NULL,
  `lift_availability_loading` tinyint(1) DEFAULT NULL,
  `lift_availability_unloading` tinyint(1) DEFAULT NULL,
  `floor_no_loading` int DEFAULT NULL,
  `floor_no_unloading` int DEFAULT NULL,
  `preferred_visit_date` date DEFAULT NULL,
  `insurance_required` tinyint(1) DEFAULT NULL,
  `package` varchar(10) DEFAULT NULL,
  `memo_id` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`enquiry_no_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry1`
--

LOCK TABLES `enquiry1` WRITE;
/*!40000 ALTER TABLE `enquiry1` DISABLE KEYS */;
INSERT INTO `enquiry1` VALUES (1,'2021-03-12','Shushurut hospital 1st floor, Kothrud','3232848438',NULL,NULL,'Shushurt building kothrud','Pune',NULL,'Pune',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2021-04-10','Shativardhar Scoicty 2nd floor, Erandawane','9262548118',NULL,NULL,'Shantiwardhan erandawane','Pune',NULL,'Ahmadnagar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2022-09-02','Nalini Apt, Knodhwa','7362551152',NULL,NULL,'Nalini apt','Pune',NULL,'Nahik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'ZAD`','3332222','ok@ok.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'hkjhkhk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'tototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'ABVCD','98765432','gghh@ddss.com','2021-03-10',NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'ABVCD','98765432','gghh@ddss.com',NULL,NULL,NULL,'totototo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'aAAA','7654','CCCC','2021-09-10','HHHH',NULL,'RRRR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'aAAA','7654','CCCC','2021-08-06','HHHH',NULL,'RRRR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,'AAA','BBB','CCC','2021-05-10','DDD',NULL,'YYY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'AAA','BBB','CCC','2021-05-10','DDD',NULL,'TTTT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'AAA','BBB','CCC','2021-05-10','DDD',NULL,'EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'AAA','BBB','CCC','2021-05-10','DDD','FFFF','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'AAA','BBB','CCC','2021-05-10','DDD','FFFF','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'AAA','BBB','CCC','2021-05-10','DDD','FFFF','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'AAA','BBB','CCC','2021-05-10','DDD','FFFF','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'AAA','BBB','CCC','2021-05-10','DDD','FFFF','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,'AAA','BBB','CCC','2021-05-17','DDD','GGG','EEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'AAA','BBB','CCC','2021-05-17','DDD','ggg','EEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'aaa','bbb','ccc','2021-05-10','ddd','ggg','fff','hhh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,'AAA','BBB','CCC','2021-05-12','DDD','GGG','EEE','HHH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,'aaaa','','','2021-05-12','','','','ddd',345,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,'aaa','bbb','ccc','2021-05-12','ddd','','fff','',1399,NULL,NULL,NULL,NULL,'2021-05-20',NULL,NULL,NULL,NULL),(30,NULL,'Jaggu Mahan','99339943','mahan@email.com','2021-05-19','Pune','','pune','mumbai8',NULL,NULL,NULL,6,7,'2021-05-19',NULL,NULL,NULL,1),(31,NULL,'Praj System and Services','7685940329','praj@gmail.com','2021-05-20','Karve Road','Erandawana, Pune 411004','21 D Floraris Apt No 7','Satara',NULL,NULL,NULL,3,7,'2021-05-21',NULL,NULL,NULL,1),(32,'2021-05-19','asas','3232','sdds@mail.com','2021-05-28','fsdfsd','sdfsdf','sdfsdf','sdfsdfsdfsdf',NULL,NULL,NULL,2,2,'2021-05-20',NULL,NULL,NULL,1),(33,'2021-05-19','Govind Trading Co.','65484834','sak@mail.com','2021-05-21','Warje Naka above Dentist.','Pune','Jaktnaka, near Khed Shivapur, Pune','Khed shivapur',NULL,NULL,NULL,1,1,'2021-05-19',NULL,NULL,NULL,1),(34,'2021-05-19','Gangadhar Udpi','202887654','gnaga@hotmail.com','2021-05-24','Pune north near Viman Nagar','Nagar Road','Khadakwasla, near water lake','Khadakwasla',546,NULL,NULL,1,1,'2021-05-19',NULL,NULL,NULL,1),(35,'2021-05-19','Ashwin','987654','assss@eha.com','2021-05-19','ssafawe','PUNE','destination','PUNE',1230,NULL,NULL,4,21,'2021-05-19',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `enquiry1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executive`
--

DROP TABLE IF EXISTS `executive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executive` (
  `executive_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`executive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executive`
--

LOCK TABLES `executive` WRITE;
/*!40000 ALTER TABLE `executive` DISABLE KEYS */;
INSERT INTO `executive` VALUES (1,'Nitin','Bendre','bendren@gmail.com','8756877567'),(2,'Sameer','Brhmhe','smeerb@gmail.com','2766574517'),(3,'Sundar','Kumar','sundarkumar@gmail.com','9136514231');
/*!40000 ALTER TABLE `executive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fright`
--

DROP TABLE IF EXISTS `fright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fright` (
  `fright_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(20) DEFAULT NULL,
  `covered` tinyint(1) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `registration_No` varchar(20) DEFAULT NULL,
  `base_rate` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `length` int DEFAULT NULL,
  `rto_compliant` tinyint(1) DEFAULT NULL,
  `driver_caretaker` varchar(15) DEFAULT NULL,
  `driver_mob` int DEFAULT NULL,
  PRIMARY KEY (`fright_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fright`
--

LOCK TABLES `fright` WRITE;
/*!40000 ALTER TABLE `fright` DISABLE KEYS */;
/*!40000 ALTER TABLE `fright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_size`
--

DROP TABLE IF EXISTS `house_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_size` (
  `house_size_id` int NOT NULL AUTO_INCREMENT,
  `article_name` varchar(25) DEFAULT NULL,
  `base_material` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`house_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_size`
--

LOCK TABLES `house_size` WRITE;
/*!40000 ALTER TABLE `house_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labour_master`
--

DROP TABLE IF EXISTS `labour_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labour_master` (
  `labour_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `adhar_card_no` varchar(12) DEFAULT NULL,
  `phone_no` varchar(12) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `wage_p_day` int DEFAULT NULL,
  `referred_by` varchar(40) DEFAULT NULL,
  `police_verification` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`labour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labour_master`
--

LOCK TABLES `labour_master` WRITE;
/*!40000 ALTER TABLE `labour_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `labour_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(40) DEFAULT NULL,
  `purchse_UM` int DEFAULT NULL,
  `consumption_UM` int DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `dep_percen_per_usage` int DEFAULT NULL,
  `op_stk_at_inception` int DEFAULT NULL,
  `stock_UM` int DEFAULT NULL,
  `op_stk_rate` int DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

insert into material (material_name, returnable, dep_percen_per_usage, op_stk_at_inception, stock_UM, op_stk_rate) VALUES ('Plast Box', 1, 5,60,24,14);
insert into material (material_name, returnable, dep_percen_per_usage, op_stk_at_inception, stock_UM, op_stk_rate) VALUES ('Returnable Plast Box', 1, 5,40,4,5);
insert into material (material_name, returnable, dep_percen_per_usage, op_stk_at_inception, stock_UM, op_stk_rate) VALUES ('Crg Box', 1, 2,34,14,8);

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memo` (
  `memo_id` int NOT NULL AUTO_INCREMENT,
  `memo_date` date DEFAULT NULL,
  `visit_no_id` int DEFAULT NULL,
  `enquiry_no_id` int DEFAULT NULL,
  `consignor` varchar(40) DEFAULT NULL,
  `consignor_address` varchar(100) DEFAULT NULL,
  `consignee` varchar(40) DEFAULT NULL,
  `consingnee_address` varchar(100) DEFAULT NULL,
  `driver_name` varchar(40) DEFAULT NULL,
  `driver_allowance` int DEFAULT NULL,
  `superviser_name` varchar(40) DEFAULT NULL,
  `superviser_amt` int DEFAULT NULL,
  `good_description` varchar(500) DEFAULT NULL,
  `truck_no` varchar(12) DEFAULT NULL,
  `truck_owner` varchar(40) DEFAULT NULL,
  `labour_name` varchar(100) DEFAULT NULL,
  `labour_charges` int DEFAULT NULL,
  `fright_charges` int DEFAULT NULL,
  PRIMARY KEY (`memo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` VALUES (1,'2021-02-01',2,1,'SG transoport',NULL,'AAA services',NULL,'Santosh Marne',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2021-01-11',3,2,'HH movers',NULL,'AAA services',NULL,'Dinesh Kaka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2021-01-11',1,18,'HH movers',NULL,'AAA services',NULL,'Dinesh Kolaskar',NULL,'Suresh Kamat',334,NULL,'MH48 4536','Pune transports',NULL,NULL,NULL),(4,'2021-05-10',NULL,NULL,'AA consignor','None',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'2021-05-04',NULL,NULL,'NA consignpr','None Pune kondhava',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'2021-05-04',NULL,NULL,'NA consignpr','None',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2021-05-04',NULL,NULL,'NA consignpr','None',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'2021-05-04',NULL,NULL,'NA consignpr','None',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2021-05-01',NULL,NULL,'A M Ananand','Anand ent near bhudhwar peth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'2021-05-01',NULL,NULL,'None','Anand ent near bhudhwar peth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'2021-05-01',NULL,NULL,'None','Anand ent near bhudhwar peth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2021-05-01',NULL,NULL,'None','Anand ent near bhudhwar peth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2021-05-19',NULL,30,'consignor','pune',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2021-05-19',NULL,30,'consignor','pune',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2021-05-19',NULL,21,'consignor','EEEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2021-05-19',NULL,21,'consignor-Name','EEEE-eeee-Address','Consignee1-111-Name','EEEE-eeee Address','Abbas Alli',2377,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2021-05-20',NULL,21,'consignor','EEEE','Consignee1','EEEE','Mandar',3322,NULL,NULL,'a,b,c,d,e','MH12-HN3324',NULL,NULL,NULL,NULL),(19,'2021-05-13',NULL,21,'consignor','EEEE','Consignee1','EEEE','Sasana',221,NULL,NULL,'a,c,s,d,b,g','MH24 NA 2949','HA Sons','Pushkar',NULL,543),(20,'2021-05-20',NULL,21,'consignor','EEEE','Consignee1','EEEE','Khapana',333,NULL,NULL,'a,b,c,d,e,','MH24 AA 3243','Kanda','Jadhav',332,112),(21,'2021-05-16',4,21,'consignor','EEEE','Consignee1','EEEE','Khapana',333,NULL,NULL,'a,b,c,d,e,','MH24 AA 3243','Kanda','Jadhav',3321,876),(22,'2021-05-16',4,21,'consignor','EEEE','Consignee1','EEEE','Khapana',333,NULL,NULL,'a,b,c,d,e,','MH24 AA 3243','Kanda','Jadhav',7,876),(23,'2021-05-04',4,21,'consignor','EEEE','Consignee1','EEEE','Khapana',333,NULL,NULL,'a,b,c,d,e,','MH24 AA 3243','Kanda','Jadhav',7,876),(24,'2021-05-19',4,21,'consignor','EEEE','Consignee1','EEEE','Mehur',200,NULL,NULL,'a,b,c,d','MH21','N.J Mvers','Kaslekar',0,0),(25,'2021-05-19',4,21,'consignor','EEEE','Consignee1','EEEE','Mehur',200,NULL,NULL,'a,b,c,d','MH21','N.J Mvers','',0,0),(26,'2021-05-19',6,31,'Praj Systems','21 Floraris ','Consignee-name','21-to corrnct this ','Ameet sing',4200,NULL,NULL,'aa,bb,cc,dd,ee','MH12 EN-3420','Narayan Gavali','Sopan, Kadam',2400,5400),(27,'2021-05-19',11,35,'consignor','destination','Consignee1','destination','hajjkjs',0,NULL,NULL,'sjhkjs','iwhsa','shjaa','qowjs',0,0);
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation` (
  `quotation_no_id` int NOT NULL AUTO_INCREMENT,
  `enquiry_no_id` int DEFAULT NULL,
  `party_name` varchar(40) DEFAULT NULL,
  `visit_no_id` int DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `charges_type` varchar(15) DEFAULT NULL,
  `details` varchar(600) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `tax` int DEFAULT NULL,
  PRIMARY KEY (`quotation_no_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation`
--

LOCK TABLES `quotation` WRITE;
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
INSERT INTO `quotation` VALUES (1,18,'Shushurut hospital',2,'2021-03-12','Type 1',NULL,3521,NULL),(2,2,'Shativardhar Scoicty',3,'2021-01-22','Type 1',NULL,4531,NULL),(3,1,'Nalini Apt',2,'2020-02-02','Type 2',NULL,25901,NULL),(4,21,'Nalini Apt',1,'2020-02-02','Type 2',NULL,25901,NULL),(5,30,NULL,5,'2021-05-18','Type 2','',657,65),(6,31,NULL,6,'2021-05-19','Type 3','',2100,210),(7,32,NULL,7,'2021-05-11','Type 1','',232,121),(8,35,NULL,11,'2021-05-20','Type 1','hgj',12000,18);
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom` (
  `uom_id` int NOT NULL AUTO_INCREMENT,
  `UM_code` int DEFAULT NULL,
  `UM_description` varchar(100) DEFAULT NULL,
  `alt_UM_code` varchar(15) DEFAULT NULL,
  `alt_UM_description` varchar(80) DEFAULT NULL,
  `base_UM_qty` int DEFAULT NULL,
  `alt_uom_qty` int DEFAULT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `visit_no_id` int NOT NULL AUTO_INCREMENT,
  `preferred_visit_date` date DEFAULT NULL,
  `enquiry_no_id` int DEFAULT NULL,
  `visit_Executor_name` varchar(25) DEFAULT NULL,
  `article_list` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`visit_no_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,NULL,1,'Sharma',NULL),(2,NULL,2,'Suyash',NULL),(3,NULL,18,'Shashank',NULL),(4,NULL,21,'Shahakar',NULL),(5,'2021-05-18',30,'1',''),(6,'2021-05-19',31,'2','a,b,c,d,e,f,g,h,'),(7,'2021-05-24',32,'1','a,c,s,d'),(8,'2021-05-21',20,'1',''),(9,'2021-05-21',20,'1',''),(10,'2021-05-21',20,'1',''),(11,'2021-07-05',35,'1','gjjggj');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_customer`
--

DROP TABLE IF EXISTS `visit_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_customer` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `enquiry_id` int DEFAULT NULL,
  `scheduled_visit_dt` date DEFAULT NULL,
  `visit_dt` date DEFAULT NULL,
  `executive_name` varchar(30) DEFAULT NULL,
  `article_list_id` int DEFAULT NULL,
  `sp_notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_customer`
--

LOCK TABLES `visit_customer` WRITE;
/*!40000 ALTER TABLE `visit_customer` DISABLE KEYS */;
INSERT INTO `visit_customer` VALUES (1,1,'2021-01-11','2021-01-13','Manish Sontakke',NULL,NULL),(2,3,'2021-02-01','2021-02-02','Milind Konkane',NULL,NULL),(3,2,'2021-02-11','2021-02-15','Manish Sontakke',NULL,NULL);
/*!40000 ALTER TABLE `visit_customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 16:32:19
