-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ticket_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `busname` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `distination` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `numTicket` int NOT NULL,
  `km` double NOT NULL,
  `totalprice` double NOT NULL,
  `seatsAvailable` int NOT NULL,
  `DATE_OF_BOOKING` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-31',3,250,7500,62,'2024-12-24 08:52:27','ABRAHAM_WORKU'),(2,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-31',3,250,7500,62,'2024-12-24 08:54:44','MATIYOS_YABIBAL'),(3,'ZEMEN BUS','DEJEN','AMANUEL','2024-12-29',1,350,3500,64,'2024-12-24 08:55:44','GECH_ALEMAYEHU'),(4,'ZEMEN BUS','DEJEN','AMANUEL','2024-12-29',3,350,10500,62,'2024-12-24 08:56:21','da'),(5,'ZEMEN BUS','DEJEN','AMANUEL','2024-12-29',3,350,10500,62,'2024-12-24 08:56:43','DANIEL ALEMAYEHU'),(6,'ETHIO','DEBRE_ELIYAS','DEJEN','2025-01-02',4,420,16800,61,'2024-12-24 08:57:40','EYOB_SELEMON'),(7,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',9,250,22500,56,'2024-12-24 09:05:25','ETO'),(8,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-02',2,250,5000,63,'2024-12-24 09:06:28','DAGIM_YEWALAWEK'),(9,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-18',2,250,5000,63,'2024-12-24 09:07:10','ABRAHAM_abebaw'),(10,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-03',2,250,5000,60,'2024-12-24 09:12:14','YONI_KASSAHU'),(11,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',3,250,7500,59,'2024-12-24 09:12:36','GERMA'),(12,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',2,250,5000,60,'2024-12-24 13:16:06','ETO'),(13,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-26',4,250,10000,58,'2024-12-24 14:17:25','ABRA_WORKU'),(14,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-10',2,250,5000,60,'2024-12-24 14:29:52','SD'),(15,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-08',3,250,7500,59,'2024-12-24 14:41:28','DSD'),(16,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-09',4,250,10000,58,'2024-12-24 15:39:58','er'),(17,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-08',2,250,5000,60,'2024-12-26 13:56:48','ty'),(18,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-31',3,250,7500,59,'2024-12-26 14:12:22','ii'),(19,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',2,250,5000,60,'2024-12-26 15:14:01','yy'),(20,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',2,250,5000,60,'2024-12-26 15:14:15','yy'),(21,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',2,250,1500,60,'2024-12-26 15:15:20','tt'),(22,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-24',2,250,500,60,'2024-12-26 18:05:19','ABRAHAM_WORKU'),(23,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',7,250,1750,55,'2024-12-26 18:05:36','ETO'),(24,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-08',4,250,1000,58,'2024-12-26 18:06:13','XDASD'),(25,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2025-01-01',8,250,2000,54,'2024-12-26 18:06:34','ABRAHAM_WORKU'),(26,'FM BUS','DEGA_DAMOT','DEBRE_MARKOS','2024-12-25',2,250,500,60,'2024-12-26 18:06:55','ABRAHAM_WORKU'),(27,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-25',3,70,420,59,'2024-12-26 19:29:54','YTUTYU'),(28,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-07',2,70,280,58,'2024-12-27 05:15:19','lk'),(29,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-31',4,70,560,55,'2024-12-27 05:17:47','ujhn'),(30,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-01',2,70,280,56,'2024-12-27 05:18:07','nj '),(31,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-18',3,70,420,52,'2024-12-27 05:19:54','lo'),(32,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-23',2,70,280,54,'2024-12-27 05:22:19','v'),(33,'FM BUS','DEBRE_MARKOS','AMANUEAL','2025-01-01',3,0,0,49,'2024-12-27 05:29:59','hh'),(34,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-09',2,70,280,52,'2024-12-27 05:46:18','cbgfdcd'),(35,'FM BUS','DEBRE_MARKOS','DEGEN','2024-12-11',2,70,280,47,'2024-12-27 05:49:27','kj.n'),(36,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-01',3,70,420,53,'2024-12-27 06:24:59','dsa'),(37,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',5,70,700,51,'2024-12-27 06:25:34','rry'),(38,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',5,70,700,46,'2024-12-27 06:26:32','rry'),(39,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-01',4,70,560,47,'2024-12-27 06:27:30','tthy'),(40,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',3,70,420,48,'2024-12-27 06:28:18','ttu'),(41,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',2,70,280,46,'2024-12-27 06:28:57','d'),(42,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',4,70,560,42,'2024-12-27 06:29:47','yy'),(43,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',2,70,280,40,'2024-12-27 11:35:52','fdf'),(44,'FM BUS','DEBRE_MARKOS','DEGEN','2025-01-03',3,70,420,37,'2024-12-27 12:30:29','ree');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `busname` varchar(250) NOT NULL,
  `available_seats` int NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'ABAY BUS',45),(2,'FM BUS',65),(3,'ZEMEN BUS',30),(4,'ETHIO',55),(5,'habesha',50);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_tarif`
--

DROP TABLE IF EXISTS `bus_tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_tarif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `tarif` double NOT NULL,
  `currency` varchar(45) DEFAULT 'birr',
  `effective_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bus_tarif_ibfk_1_idx` (`route_id`),
  CONSTRAINT `bus_tarif_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_tarif`
--

LOCK TABLES `bus_tarif` WRITE;
/*!40000 ALTER TABLE `bus_tarif` DISABLE KEYS */;
INSERT INTO `bus_tarif` VALUES (1,1,2.5,'birr','2024-12-26 19:17:10','FROM DEBREMARKOS TO DEGA_DAMOT'),(2,2,2.5,'birr','2024-12-26 19:18:09','yhy6h'),(3,3,2.1,'birr','2024-12-26 19:19:14','FROM GOZMAEN TO AMANUEAL'),(4,4,2.2,'birr','2024-12-26 19:25:56','FROM DEBREMARKOS TO DEGEN'),(5,5,3.9,'birr','2024-12-27 04:28:55','from enarj to \'DEGA_DAMOT\'');
/*!40000 ALTER TABLE `bus_tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `bid` int NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `bid_idx` (`bid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `booking` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,12,'telebirr','5000','2024-12-24 13:16:49'),(2,26,'nib','500','2024-12-26 18:07:10'),(3,27,'nib','420','2024-12-26 19:30:14'),(4,44,'telebirr','420','2024-12-27 12:31:15');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `distance` int NOT NULL,
  `DATE_OF_adding` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,' DEBRE_MARKOS  ','DEGA_DAMOT',120,NULL),(2,' DEJEN','AMANUEAL',170,NULL),(3,'Gozamn','DEBRE_MARKOS',80,NULL),(4,'DEBRE_MARKOS','DEGEN',70,NULL),(5,'Enarj Enawga','DEGA_DAMOT',80,'2024-12-27 04:27:20'),(6,'ADDIS','AA',120,'2024-12-27 12:34:20');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_request`
--

DROP TABLE IF EXISTS `support_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `response` text,
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `response_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_request`
--

LOCK TABLES `support_request` WRITE;
/*!40000 ALTER TABLE `support_request` DISABLE KEYS */;
INSERT INTO `support_request` VALUES (1,'BEREKET','abrahamworku10a@gmail.com','payment','how much is the price from Debre maroks to Dega damot','ok sir','2024-12-24 07:25:53','2024-12-27 12:27:31'),(2,'RTYR','Y@GMAIL.COM','payment','how much is the price from Debre maroks to Dega damot',NULL,'2024-12-26 19:31:07','2024-12-26 19:31:07');
/*!40000 ALTER TABLE `support_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  `User_Type` varchar(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'BEREKET','NFONT9nMLCiwGRndLHbYqgbrIdKswGfmfNc0X0z/ctg=','0900878787','Active','user'),(2,'Abraham','oz0I0mxMdYuLfU2rheICrrNXaYl2G0yT6Pb85s1zOAo=','0900101010','Active','Admin'),(3,'EYOB','l5m//QALeqW6ASdmPujOEVZMRoXflbxbTubHAVaQ3xk=','0900202020','Active','support'),(4,'abb','4SdYLNlS1pchmGX/n1Jyuh86hJn1ohOJgTFWLxeRG7A=','0988888877','Active','support'),(5,'abb','BHJuIJlVaKStCnQX8X/3wIrcTqKpuG7aXsoXoZteeyg=','0988888877','Active','support');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 15:58:23
