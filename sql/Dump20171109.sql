-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: DontWorry
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Complain`
--

DROP TABLE IF EXISTS `Complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complain` (
  `idComplain` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `TransactionId` varchar(45) DEFAULT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Gateway` varchar(45) DEFAULT NULL,
  `ErrorCode` varchar(45) DEFAULT NULL,
  `ErrorText` varchar(45) DEFAULT NULL,
  `isResolved` tinyint(4) NOT NULL DEFAULT '0',
  `TimeStamp` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  PRIMARY KEY (`idComplain`),
  KEY `fk_Complain_1_idx` (`UserId`),
  KEY `fk_Complain_4_idx` (`Destination`),
  KEY `fk_Complain_3_idx` (`Source`),
  CONSTRAINT `fk_Complain_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Complain_3` FOREIGN KEY (`Source`) REFERENCES `Entity` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Complain_4` FOREIGN KEY (`Destination`) REFERENCES `Entity` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complain`
--

LOCK TABLES `Complain` WRITE;
/*!40000 ALTER TABLE `Complain` DISABLE KEYS */;
INSERT INTO `Complain` VALUES (1,1,'OFNDSKLF','ICIC','AMZN','payu','21','KCNLXKC ',0,'0000-00-00',NULL),(2,1,'kjfkasdmc','ICIC','AMZN','payu','21','ifndlskcd',0,'0000-00-00',NULL),(3,1,'jknladskcm','ICIC','AMZN','payu','32','weelkc sa;c',0,'0000-00-00',NULL);
/*!40000 ALTER TABLE `Complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entity`
--

DROP TABLE IF EXISTS `Entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entity` (
  `Code` varchar(4) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `ContactUs` varchar(100) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  `Care_Phone_Number` varchar(45) DEFAULT NULL COMMENT '	',
  `Care_Email` varchar(45) DEFAULT NULL,
  `Liason_Phone` varchar(45) DEFAULT NULL,
  `Liason_Email` varchar(45) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity`
--

LOCK TABLES `Entity` WRITE;
/*!40000 ALTER TABLE `Entity` DISABLE KEYS */;
INSERT INTO `Entity` VALUES ('ALDB','Allahabad Bank','contactus','bank.com','9969602752\n\n9969630749','pankaj.tripathi@Allahabadbank.in','Mr.Pankaj Tripathi  \n\nMr.Asish R Mahana','email@gmail.com',100),('AMZN','Amazon','amazon','amazon.in','1800 3000 9009','n/a','n/a','email@gmail.com',97.8),('ANB','Andhra Bank','contactus','bank.com','(040) 23122293','cbs-ebanking@andhrabank.co.in.','Mr. Danish \nMr. Vivek \nMs. Prasanna','email@gmail.com',100),('asdf','lj','j','l','jli','jli','jl','jli',NULL),('AXIS','AXIS BANK LTD.','contactus','bank.com','022- 22154196','ibrm@axisbank.com','Mr. Ashutosh Shirbhate','email@gmail.com',100),('BOB','Bank of Baroda','contactus','bank.com','0265—2225209','etax.ho@bankofbaroda.com','Mr. Mithil K Mehta','email@gmail.com',100),('BOI','Bank of India','contactus','bank.com','022- 40919191','boi.starconnect@bankofindia.co.in','Call Centre','email@gmail.com',100),('BOM','Bank of Maharashtra','contactus','bank.com','020-25536051; 020-25521568','shirish.salway@mahabank.co.in','Mr.Shirish Salway','email@gmail.com',100),('CAN','Canara Bank','contactus','bank.com','080-25587437','hogb@canbank.co.in','Mr Adarsh M S','email@gmail.com',100),('COB','Corporation Bank','contactus','bank.com','022-22020172/73','hogovt@corpbank.co.in','Ms. Seema / Mr. Vishwanath','email@gmail.com',100),('FLKT','Flipkart','flipkart','flipkart.com','1800 208 9898','cs@flipkart.com','n/a','email@gmail.com',100),('ICIC','ICICI BANK LTD','contactus','bank.com','022-67576604\n022-67574987\n','onlinetax@icicibank.com','Ms. Shiji Pravin \nMs. Tejakshi Amin','email@gmail.com',93.8),('IDBI','IDBI Bank Ltd.','contactus','bank.com','022-66194055','gbg.product@idbi.co.in','Helpdesk','email@gmail.com',100),('IOB','Indian Overseas Bank','contactus','bank.com','044-28519460,044-28889350','arundubey@iobnet.co.in','Mr. Arun Kumar','email@gmail.com',100),('PSB','Punjab and Sind Bank','contactus','bank.com','8882199125/9650399295\n0712-2737550','rahul.savant@psb.co.in\nn0283@psb.co.in','Mr. Rahul Savant\nMr. Ambika Bhardwaj','email@gmail.com',100),('SBIN','State Bank of India','contactus','sbi.co.in','1800112211','inb.customer@sbi.co.in','Customer Support Cell','email@gmail.com',100),('UBI','Union Bank of India','contactus','bank.com','25710 - 201/202/245/246/247','etax@unionbankofindia.com','E-Banking Team','email@gmail.com',100),('UCO','UCO Bank','contactus','bank.com','033-2337 9507\n9433566683','hoe_banking.calcutta@ucobank.co.in','Mr. K. Ramchandran','email@gmail.com',100);
/*!40000 ALTER TABLE `Entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorLog`
--

DROP TABLE IF EXISTS `ErrorLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ErrorLog` (
  `entity` varchar(4) NOT NULL,
  `time` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`entity`,`time`,`message`),
  CONSTRAINT `fk_ErrorLog_1` FOREIGN KEY (`entity`) REFERENCES `Entity` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ErrorLog`
--

LOCK TABLES `ErrorLog` WRITE;
/*!40000 ALTER TABLE `ErrorLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ErrorLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GateWay`
--

DROP TABLE IF EXISTS `GateWay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GateWay` (
  `Code` varchar(4) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Care_Phone_Number` varchar(45) DEFAULT NULL,
  `Care_Email` varchar(45) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  `ContactUs` varchar(150) DEFAULT NULL,
  `Liason_Phone` varchar(45) DEFAULT NULL,
  `Liason_Email` varchar(45) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GateWay`
--

LOCK TABLES `GateWay` WRITE;
/*!40000 ALTER TABLE `GateWay` DISABLE KEYS */;
INSERT INTO `GateWay` VALUES ('ATOM','atomtech','022 66864095','helpdesk@atomtech.in','atomtech.in','atomtech.in/contact-us','022 66864095','admin@gmail.com',100),('BILL','billdesk','n/a','billpay@billdesk.com','billdesk.com','billdesk.com/contact-us','n/a','admin@gmail.com',100),('CCA','ccavenue',' +91 22 67425555','accounts@ccavenue.com','ccavenue.com','ccavenue.com/contact-us',' +91 22 67425555','admin@gmail.com',100),('CIT','citruspay',' 020-67314141','n/a','citruspay.com','citruspay.com/contact-us',' 020-67314141','admin@gmail.com',100),('DIR','direcpay','9619712858',' contact@direcpay.com','direcpay.com','direcpay.com/contact-us','9619712858','admin@gmail.com',100),('EBS','ebs',' +91-22-6652 8600','n/a','ebs.in','ebs.in/contact-us',' +91-22-6652 8600','admin@gmail.com',100),('HDFC','hdfcbank','1800 22 4060','n/a','hdfcbank.com','hdfcbank.com/contact-us','1800 22 4060','admin@gmail.com',100),('MOBI','mobikwik','094664-46644 ','n/a','mobikwik.com','mobikwik.com/contact-us','094664-46644 ','admin@gmail.com',100),('PAYB','payubiz','0124-6624801','compliance@payu.in','payubiz.in','payubiz.in/contact-us','0124-6624801','admin@gmail.com',100);
/*!40000 ALTER TABLE `GateWay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `aadhaarID` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aadhaarID_UNIQUE` (`aadhaarID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'myname',12,'339292','myuid','asd@vd.c'),(2,'jbvodsfvj ',34,'435u09','989485','lkv dsl;c,'),(3,'fnldjkf ',237,'347536983','82734328743','skjfbadsjkcadsc'),(4,'kjvbsdkjc',345,'39485y32094','9834532589','ldsknclaskc');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 19:06:47
