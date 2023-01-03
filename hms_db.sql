-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hms_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admitpatient_room`
--

DROP TABLE IF EXISTS `admitpatient_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitpatient_room` (
  `AdmitID` int NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(50) NOT NULL,
  `Disease` text NOT NULL,
  `RoomNo` varchar(50) NOT NULL,
  `AdmitDate` text NOT NULL,
  `DoctorID` varchar(50) NOT NULL,
  `AP_Remarks` text NOT NULL,
  PRIMARY KEY (`AdmitID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `DoctorID_2` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  KEY `RoomNo` (`RoomNo`),
  CONSTRAINT `admitpatient_room_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patientregistration` (`PatientID`),
  CONSTRAINT `admitpatient_room_ibfk_2` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`),
  CONSTRAINT `admitpatient_room_ibfk_3` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitpatient_room`
--

LOCK TABLES `admitpatient_room` WRITE;
/*!40000 ALTER TABLE `admitpatient_room` DISABLE KEYS */;
INSERT INTO `admitpatient_room` VALUES (1,'P-1','Malariya','101','22/02/2022','1',''),(2,'P-3','Heart Diseases','103','12/03/2022','2',''),(3,'P-2','Small Problem','101','06/04/2022','2',''),(4,'P-4','Kichuina','104','06/04/2022','D-3','No');
/*!40000 ALTER TABLE `admitpatient_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admitpatient_ward`
--

DROP TABLE IF EXISTS `admitpatient_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitpatient_ward` (
  `AdmitID` int NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(50) NOT NULL,
  `Disease` text NOT NULL,
  `Wardname` varchar(100) NOT NULL,
  `AdmitDate` text NOT NULL,
  `DoctorID` varchar(50) NOT NULL,
  `AP_Remarks` text NOT NULL,
  PRIMARY KEY (`AdmitID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  KEY `Wardname` (`Wardname`),
  CONSTRAINT `admitpatient_ward_ibfk_1` FOREIGN KEY (`Wardname`) REFERENCES `ward` (`wardname`),
  CONSTRAINT `admitpatient_ward_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patientregistration` (`PatientID`),
  CONSTRAINT `admitpatient_ward_ibfk_3` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitpatient_ward`
--

LOCK TABLES `admitpatient_ward` WRITE;
/*!40000 ALTER TABLE `admitpatient_ward` DISABLE KEYS */;
INSERT INTO `admitpatient_ward` VALUES (1,'P-2','Belly Pain','F','25/02/2022','1','');
/*!40000 ALTER TABLE `admitpatient_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_room`
--

DROP TABLE IF EXISTS `bill_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_room` (
  `BillNo` int NOT NULL AUTO_INCREMENT,
  `DischargeID` int NOT NULL,
  `BillingDate` text NOT NULL,
  `NoOfDays` int NOT NULL,
  `RoomCharges` double NOT NULL,
  `TotalRoomCharges` double NOT NULL,
  `ServiceCharges` double NOT NULL,
  `TotalCharges` double NOT NULL,
  `PaymentMode` text NOT NULL,
  `PaymentModeDetails` text NOT NULL,
  `ChargesPaid` double NOT NULL,
  `DueCharges` double NOT NULL,
  PRIMARY KEY (`BillNo`),
  KEY `DischargeID` (`DischargeID`),
  KEY `DischargeID_2` (`DischargeID`),
  CONSTRAINT `bill_room_ibfk_1` FOREIGN KEY (`DischargeID`) REFERENCES `dischargepatient_room` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_room`
--

LOCK TABLES `bill_room` WRITE;
/*!40000 ALTER TABLE `bill_room` DISABLE KEYS */;
INSERT INTO `bill_room` VALUES (1,1,'24/02/2022',2,1200,2400,2300,4700,'by Cash','',4700,0);
/*!40000 ALTER TABLE `bill_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dischargepatient_room`
--

DROP TABLE IF EXISTS `dischargepatient_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dischargepatient_room` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AdmitID` int NOT NULL,
  `DischargeDate` text NOT NULL,
  `DP_Remarks` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdmitID` (`AdmitID`),
  CONSTRAINT `dischargepatient_room_ibfk_1` FOREIGN KEY (`AdmitID`) REFERENCES `admitpatient_room` (`AdmitID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dischargepatient_room`
--

LOCK TABLES `dischargepatient_room` WRITE;
/*!40000 ALTER TABLE `dischargepatient_room` DISABLE KEYS */;
INSERT INTO `dischargepatient_room` VALUES (1,1,'24/02/2022',''),(2,2,'16/03/2022',''),(3,3,'08/04/2022',''),(4,4,'06/02/2022','');
/*!40000 ALTER TABLE `dischargepatient_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dischargepatient_ward`
--

DROP TABLE IF EXISTS `dischargepatient_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dischargepatient_ward` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AdmitID` int NOT NULL,
  `DischargeDate` text NOT NULL,
  `DP_Remarks` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdmitID` (`AdmitID`),
  CONSTRAINT `dischargepatient_ward_ibfk_1` FOREIGN KEY (`AdmitID`) REFERENCES `admitpatient_ward` (`AdmitID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dischargepatient_ward`
--

LOCK TABLES `dischargepatient_ward` WRITE;
/*!40000 ALTER TABLE `dischargepatient_ward` DISABLE KEYS */;
INSERT INTO `dischargepatient_ward` VALUES (1,1,'28/02/2018','');
/*!40000 ALTER TABLE `dischargepatient_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorID` varchar(50) NOT NULL,
  `DoctorName` text NOT NULL,
  `FatherName` text NOT NULL,
  `Address` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Email` text NOT NULL,
  `Qualifications` text NOT NULL,
  `Specialization` text NOT NULL,
  `Gender` text NOT NULL,
  `Bloodgroup` text NOT NULL,
  `DateOfJoining` text NOT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('1','Dr.Sandeep Thakur','Mahindra Thakur','Solapur','01830730994','sandeep@gmail.com','MBBS','Heart','M','O+','01/01/2022'),('2','Dr.Shrikant Patil','Ganesh Thakur','Mumbai','01672580748','shrikant@gmail.com','BMBS','Surgery','M','B+','03/06/2022'),('D-3','Md.Keshav Mhatre','Hareshwar Mhatre','Rasayani','019652356','keshav@gmail.com','FCPS','Diabetes','M','O+','06/11/2022');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientregistration`
--

DROP TABLE IF EXISTS `patientregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientregistration` (
  `PatientID` varchar(50) NOT NULL,
  `Patientname` text NOT NULL,
  `Fathername` text NOT NULL,
  `Address` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Email` text NOT NULL,
  `Age` int NOT NULL,
  `Gen` text NOT NULL,
  `BG` text NOT NULL,
  `Remarks` text NOT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientregistration`
--

LOCK TABLES `patientregistration` WRITE;
/*!40000 ALTER TABLE `patientregistration` DISABLE KEYS */;
INSERT INTO `patientregistration` VALUES ('P-1','kedar jadhav','maharaj jadhav','Pune','01521420385','kedar@gmail.com',21,'M','A+',''),('P-2','Raj Bhoir','Kailash Bhoir','Solapur','0167458','raj@gmail.com',20,'M','A+',''),('P-3','Chetan Bhagat','Jagadish Bhagat','Satara','017842666','chetan@gmail.com',22,'M','O-',''),('P-4','Karan Patil','Suresh Patil','Panvel','01611556561','karan@gmail.com',21,'M','O+','');
/*!40000 ALTER TABLE `patientregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `NameOfUser` varchar(250) NOT NULL,
  `ContactNo` varchar(15) NOT NULL,
  `Email` varchar(250) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('admin','admin','admin','1234567890','admin@123gmail.com');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomNo` varchar(50) NOT NULL,
  `RoomType` varchar(100) NOT NULL,
  `RoomCharges` int NOT NULL,
  `RoomStatus` varchar(100) NOT NULL,
  PRIMARY KEY (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('101','General',1200,'Vacant'),('102','Private',2200,'Vacant'),('103','Private',1800,'Booked'),('104','General',1000,'Vacant');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(250) NOT NULL,
  `ServiceDate` varchar(50) NOT NULL,
  `PatientID` varchar(50) NOT NULL,
  `ServiceCharges` int NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'X-ray Test','15/01/2023','P-1',2300),(2,'Ultra','15/01/2023','P-2',1200),(3,'Echocardiography','12/01/2023','P-3',2500),(4,'Arthroscopy','12/01/2023','P-4',1000);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward` (
  `wardname` varchar(100) NOT NULL,
  `wardtype` varchar(50) NOT NULL,
  `NoOfBeds` int NOT NULL,
  `Charges` int NOT NULL,
  PRIMARY KEY (`wardname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward`
--

LOCK TABLES `ward` WRITE;
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
INSERT INTO `ward` VALUES ('A','General',4,1300),('B','Private',4,3400),('C','General',6,1200),('D','General',6,2100),('F','Private',4,2000);
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01 17:29:25
