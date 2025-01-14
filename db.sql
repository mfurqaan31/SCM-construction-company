-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: dbms_mini_project
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `Admin_id` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Middlename` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('a001','john','','doe','$argon2id$v=19$m=65536,t=3,p=4$rYAQFyeSzbMZd0PzHEW0Vw$Ikd8sUVipTKodVCBl1FbaEQWiFDCMJ3uzA0hHRdsg/c'),('a002','manu','','hegde','$argon2id$v=19$m=65536,t=3,p=4$worgQoRoq03r/vjtoqqIFA$4GjwEYGNq7nd5+9orr3qDY+Ufol9+LWQbuoi/WSYDQI'),('a003','jane','mary','doe','$argon2id$v=19$m=65536,t=3,p=4$tKbN8J0+R+IeOAlthdG1Rg$313zLWFyg9d7KzE6i9OKtBT0Qqg+wyJ9wbalbeOY1Pc'),('a004','alice','','johnson','$argon2id$v=19$m=65536,t=3,p=4$qPeAf1khWv4vOYJOGHIaMw$GY9UQ/vHOZ4lmqIb+unDgcbN7S+6m9mCt8PSrqb0zow'),('a005','mohammed','','furqaan','$argon2id$v=19$m=65536,t=3,p=4$FKbr1M/4SLbAMD1CpPlheQ$ClbwJF/Isks8SALErIegkbMoSh1O5tKhoFPy8VuclE4'),('a006','bob','','brown','$argon2id$v=19$m=65536,t=3,p=4$bXlA4Wsht4MnZFFF4TMh5w$AdbhMvP1aa4nFrXuxwJnnAYIXFXfkdJ4ihJH+wDiopg');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company_Inventory`
--

DROP TABLE IF EXISTS `Company_Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company_Inventory` (
  `Construction_Company_Id` varchar(50) NOT NULL,
  `Product_name` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  KEY `Construction_Company_Id` (`Construction_Company_Id`),
  CONSTRAINT `Company_Inventory_ibfk_1` FOREIGN KEY (`Construction_Company_Id`) REFERENCES `Construction_Company` (`Construction_Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company_Inventory`
--

LOCK TABLES `Company_Inventory` WRITE;
/*!40000 ALTER TABLE `Company_Inventory` DISABLE KEYS */;
INSERT INTO `Company_Inventory` VALUES ('c001','BRICKS',500),('c002','CEMENT',1000),('c001','CEMENT',20),('c005','IRON',50),('c001','STEEL',100);
/*!40000 ALTER TABLE `Company_Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Construction_Company`
--

DROP TABLE IF EXISTS `Construction_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Construction_Company` (
  `Construction_Company_id` varchar(50) NOT NULL,
  `Construction_Company_name` varchar(100) NOT NULL,
  `Cash_Balance` decimal(20,2) DEFAULT '10000000.00',
  `Admin_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Construction_Company_id`),
  UNIQUE KEY `Construction_Company_name` (`Construction_Company_name`),
  KEY `Admin_id` (`Admin_id`),
  CONSTRAINT `Construction_Company_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `Admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Construction_Company`
--

LOCK TABLES `Construction_Company` WRITE;
/*!40000 ALTER TABLE `Construction_Company` DISABLE KEYS */;
INSERT INTO `Construction_Company` VALUES ('c001','buildcorp',14830000.00,'a001'),('c002','ABC Constructions',10500000.00,'a002'),('c003','XYZ Builders',10000000.00,'a003'),('c004','summit builders',10000000.00,'a004'),('c005','peaky blinders',89985000.00,'a005'),('c006','beta builders',10000000.00,'a006');
/*!40000 ALTER TABLE `Construction_Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_info`
--

DROP TABLE IF EXISTS `Order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_info` (
  `Order_id` varchar(50) NOT NULL,
  `Product_id` varchar(50) DEFAULT NULL,
  `Construction_Company_Id` varchar(50) DEFAULT NULL,
  `Supplier_Company_Id` varchar(50) DEFAULT NULL,
  `Shipment_Company_Id` varchar(50) DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Status` enum('Pending','Accepted','Rejected') DEFAULT 'Pending',
  PRIMARY KEY (`Order_id`),
  KEY `Product_id` (`Product_id`),
  KEY `Construction_Company_Id` (`Construction_Company_Id`),
  KEY `Supplier_Company_Id` (`Supplier_Company_Id`),
  KEY `Shipment_Company_Id` (`Shipment_Company_Id`),
  CONSTRAINT `Order_info_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Product_info` (`Product_id`),
  CONSTRAINT `Order_info_ibfk_2` FOREIGN KEY (`Construction_Company_Id`) REFERENCES `Construction_Company` (`Construction_Company_id`),
  CONSTRAINT `Order_info_ibfk_3` FOREIGN KEY (`Supplier_Company_Id`) REFERENCES `Supplier_Company` (`Supplier_Company_id`),
  CONSTRAINT `Order_info_ibfk_4` FOREIGN KEY (`Shipment_Company_Id`) REFERENCES `Shipment_Company` (`Shipment_Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_info`
--

LOCK TABLES `Order_info` WRITE;
/*!40000 ALTER TABLE `Order_info` DISABLE KEYS */;
INSERT INTO `Order_info` VALUES ('OR0754','p008','c001','s004','EMS',100,35000.00,'Accepted'),('OR1c7b','p003','c005','s002','TNT',50,15000.00,'Accepted'),('OR60af','p001','c002','s001','FDX',1000,500000.00,'Accepted'),('OR914b','p006','c004','s003',NULL,1000,400000.00,'Pending'),('ORbd4c','p001','c001','s001','FDX',20,10000.00,'Accepted'),('ORc062','p004','c002','s002',NULL,10,10000.00,'Rejected'),('ORcd3c','p002','c001','s001','DHL',500,125000.00,'Accepted'),('ORe9ee','p005','c001','s003',NULL,500,50000.00,'Pending'),('ORf79e','p007','c005','s004',NULL,100,15000.00,'Rejected');
/*!40000 ALTER TABLE `Order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_info`
--

DROP TABLE IF EXISTS `Product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_info` (
  `Product_id` varchar(50) NOT NULL,
  `Product_name` varchar(100) NOT NULL,
  `Product_price` decimal(10,2) NOT NULL,
  `Supplier_Company_id` varchar(50) DEFAULT NULL,
  `Stock` int DEFAULT '10000',
  PRIMARY KEY (`Product_id`),
  KEY `Supplier_Company_id` (`Supplier_Company_id`),
  CONSTRAINT `Product_info_ibfk_1` FOREIGN KEY (`Supplier_Company_id`) REFERENCES `Supplier_Company` (`Supplier_Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_info`
--

LOCK TABLES `Product_info` WRITE;
/*!40000 ALTER TABLE `Product_info` DISABLE KEYS */;
INSERT INTO `Product_info` VALUES ('p001','CEMENT',500.00,'s001',8980),('p002','BRICKS',250.00,'s001',9500),('p003','IRON',300.00,'s002',9950),('p004','GOLD',1000.00,'s002',10000),('p005','BRONZE',100.00,'s003',10000),('p006','SILVER',400.00,'s003',10000),('p007','COPPER',150.00,'s004',10000),('p008','STEEL',350.00,'s004',9900);
/*!40000 ALTER TABLE `Product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipment_Company`
--

DROP TABLE IF EXISTS `Shipment_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipment_Company` (
  `Shipment_Company_id` varchar(50) NOT NULL,
  `Shipment_Company_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Shipment_Company_id`),
  UNIQUE KEY `Shipment_Company_name` (`Shipment_Company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipment_Company`
--

LOCK TABLES `Shipment_Company` WRITE;
/*!40000 ALTER TABLE `Shipment_Company` DISABLE KEYS */;
INSERT INTO `Shipment_Company` VALUES ('DHL','DHL Group'),('EMS','Express Mail Service'),('FDX','FedEx Corp'),('TNT','TNT Express'),('UPS','United Parcel Service');
/*!40000 ALTER TABLE `Shipment_Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Company`
--

DROP TABLE IF EXISTS `Supplier_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier_Company` (
  `Supplier_Company_id` varchar(50) NOT NULL,
  `Supplier_Company_name` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Supplier_Company_id`),
  UNIQUE KEY `Supplier_Company_name` (`Supplier_Company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Company`
--

LOCK TABLES `Supplier_Company` WRITE;
/*!40000 ALTER TABLE `Supplier_Company` DISABLE KEYS */;
INSERT INTO `Supplier_Company` VALUES ('s001','Alpha Supplies','$argon2id$v=19$m=65536,t=3,p=4$YaYhWNR/TK6gXKN7BlQeZQ$A3OLkpsd34pmXdyvkds57KaF5dIIi8NGNFrbsycnC34'),('s002','Beta Suppliers','$argon2id$v=19$m=65536,t=3,p=4$s+9XWSI0uWu3lfJeJfCMmg$H+bw1rv45+HrVaCRLdslaEK9xtxZ7rJ4hkP0W7O3AC4'),('s003','Gamma Suppliers','$argon2id$v=19$m=65536,t=3,p=4$ZR2vsC3YBOf2ZZdhq6OY6w$FYAiLMD262alXnUbTnt+qV8iZpUVIbMjXfL0IY3J9iI'),('s004','Epsilon Suppliers','$argon2id$v=19$m=65536,t=3,p=4$JaySU/C8McO1M6R0B2iDow$DUawvxL7eMW8oEDug27ZnOYcBsremlckIC8MbH7bSlQ'),('s005','Delta Suppliers','$argon2id$v=19$m=65536,t=3,p=4$BPVr3FEVxaHMdZEeeaI0Iw$N6ObVtJWL7DRa4oeTfGbZCOfvJ5PwM1gHdfitBuu+JM');
/*!40000 ALTER TABLE `Supplier_Company` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 14:54:40
