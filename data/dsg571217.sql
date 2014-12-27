CREATE DATABASE  IF NOT EXISTS `dsg` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dsg`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dsg
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `b_bank`
--

DROP TABLE IF EXISTS `b_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_bank` (
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_active` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_bank`
--

LOCK TABLES `b_bank` WRITE;
/*!40000 ALTER TABLE `b_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_company`
--

DROP TABLE IF EXISTS `b_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_company` (
  `company_id` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_name_e` varchar(255) DEFAULT NULL,
  `company_address_e` varchar(255) DEFAULT NULL,
  `company_tel` varchar(255) DEFAULT NULL,
  `company_Fax` varchar(255) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_company`
--

LOCK TABLES `b_company` WRITE;
/*!40000 ALTER TABLE `b_company` DISABLE KEYS */;
INSERT INTO `b_company` VALUES ('2','บริษัทของคุณ จำกัด','','','','','','','',NULL,NULL);
/*!40000 ALTER TABLE `b_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_currency`
--

DROP TABLE IF EXISTS `b_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_currency` (
  `currency_id` varchar(255) NOT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_rate` decimal(17,2) DEFAULT '0.00',
  `currency_x` decimal(17,2) DEFAULT '0.00',
  `remark` varchar(255) DEFAULT NULL,
  `currency_active` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT '0000',
  `current_default` varchar(255) DEFAULT '0',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='เก็บสกุลเงิน';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_currency`
--

LOCK TABLES `b_currency` WRITE;
/*!40000 ALTER TABLE `b_currency` DISABLE KEYS */;
INSERT INTO `b_currency` VALUES ('1075088658','MYR',9.50,1.00,'','1','1005','0'),('1300336772','SGD',25.30,1.00,'','1','1006','0'),('140173942','HKD',4.20,1.00,'','1','1004','0'),('1488102317','USD',32.00,1.00,'erq','1','0000','1'),('2038278755','EUR ',41.00,1.00,'','1','1002','0'),('2137284554','JPY',28.00,100.00,'','1','1003','0'),('645399666','CNY ',5.30,1.00,'','1','1007','0'),('930106038','GBP',51.90,1.00,'','1','1001','0');
/*!40000 ALTER TABLE `b_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_department`
--

DROP TABLE IF EXISTS `b_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_department` (
  `depart_id` varchar(255) NOT NULL,
  `Depart_Name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `depart_parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_department`
--

LOCK TABLES `b_department` WRITE;
/*!40000 ALTER TABLE `b_department` DISABLE KEYS */;
INSERT INTO `b_department` VALUES ('3','พนักงานทั้งหมด','2','0'),('5','พนักงานใหม่','2','0');
/*!40000 ALTER TABLE `b_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_employee`
--

DROP TABLE IF EXISTS `b_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_employee` (
  `emp_id` varchar(255) NOT NULL,
  `emp_username` varchar(255) DEFAULT NULL,
  `emp_ssn` varchar(255) DEFAULT NULL,
  `Emp_Name` varchar(255) DEFAULT NULL,
  `emp_name_e` varchar(255) DEFAULT NULL,
  `emp_position` varchar(255) DEFAULT NULL,
  `depart_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `emp_work_type` varchar(255) DEFAULT NULL,
  `emp_type` varchar(255) DEFAULT NULL,
  `emp_nickname` varchar(255) DEFAULT NULL,
  `Emp_Password` varchar(255) DEFAULT NULL,
  `emp_privilege` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `emp_active` varchar(255) DEFAULT NULL,
  `emp_holiday` varchar(255) DEFAULT NULL,
  `emp_realday` varchar(255) DEFAULT NULL,
  `emp_timerule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_employee`
--

LOCK TABLES `b_employee` WRITE;
/*!40000 ALTER TABLE `b_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part`
--

DROP TABLE IF EXISTS `b_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part` (
  `part_id` varchar(255) NOT NULL,
  `part_code` varchar(255) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `certify` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `part_model` varchar(255) DEFAULT NULL,
  `date_receive` varchar(255) DEFAULT NULL,
  `date_draw` varchar(255) DEFAULT NULL,
  `acft_model` varchar(255) DEFAULT NULL,
  `date_inv` varchar(255) DEFAULT NULL,
  `part_remark` varchar(255) DEFAULT NULL,
  `stock_loca1` varchar(255) DEFAULT NULL,
  `stock_loca2` varchar(255) DEFAULT NULL,
  `stock_loca3` varchar(255) DEFAULT NULL,
  `stock_loca4` varchar(255) DEFAULT NULL,
  `stock_loca5` varchar(255) DEFAULT NULL,
  `part_cate_id` varchar(255) DEFAULT NULL,
  `part_cate_name` varchar(255) DEFAULT NULL,
  `part_type_id` varchar(255) DEFAULT NULL,
  `part_type_name` varchar(255) DEFAULT NULL,
  `path_pic_certify` varchar(255) DEFAULT NULL,
  `part_active` varchar(255) DEFAULT NULL,
  `inv_number` varchar(255) DEFAULT NULL,
  `date_create` varchar(255) DEFAULT NULL,
  `date_modi` varchar(255) DEFAULT NULL,
  `date_cancel` varchar(255) DEFAULT NULL,
  `user_create` varchar(255) DEFAULT NULL,
  `user_modi` varchar(255) DEFAULT NULL,
  `user_cancel` varchar(255) DEFAULT NULL,
  `part_type_sub_id` varchar(255) DEFAULT NULL,
  `part_type_sub_name` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT NULL,
  `path_pic1` varchar(255) DEFAULT NULL,
  `path_pic2` varchar(255) DEFAULT NULL,
  `path_pic3` varchar(255) DEFAULT NULL,
  `path_pic4` varchar(255) DEFAULT NULL,
  `path_pic5` varchar(255) DEFAULT NULL,
  `current_name_price_cost` varchar(255) DEFAULT NULL,
  `current_name_price_sale` varchar(255) DEFAULT NULL,
  `current_rate_price_cost` decimal(17,2) DEFAULT '0.00',
  `current_rate_price_sale` decimal(17,2) DEFAULT '0.00',
  `current_x_price_cost` decimal(17,2) DEFAULT '0.00',
  `current_x_price_sale` decimal(17,2) DEFAULT '0.00',
  `price_cost_current` decimal(17,2) DEFAULT '0.00',
  `price_sale_current` decimal(17,2) DEFAULT '0.00',
  `price_cost` decimal(17,2) DEFAULT '0.00',
  `price_sale` decimal(17,2) DEFAULT '0.00',
  `path_pic_part` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part`
--

LOCK TABLES `b_part` WRITE;
/*!40000 ALTER TABLE `b_part` DISABLE KEYS */;
INSERT INTO `b_part` VALUES ('1','01-AV-AA-001','069-01032-0201','','','N/A','Com/Nav  28V','Model :Bendix/King KX 155A/with Glideslope','','','General','','Register HS-BSI / AERO-SERVICE  No.Ebay-170536928480','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','D:dsgpicpart1.jpg','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,9600.00,9600.00,300.00,300.00,'D:@dsg@pic@part@1.jpg'),('pa101544120','01-AV-AA-055','46660-1100','','','N/A','Com/Nav  28V','Model : Aircraft Radio RT-385A ','','','General','','นำมาจากเครื่อง HS-BSE ซึ่งติดมากับเครือง','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,30400.00,30400.00,950.00,950.00,'D:@dsg@pic@part@pa101544120.jpg'),('pa1029828342','01-AV-AA-012','066-1088-00','','','','DME','Model : Bendix/king KN 64 with R&C','','','General','','Register BSH  Bennett Avionics No.19575T+freight','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,61312.00,61312.00,1916.00,1916.00,'D:@dsg@pic@part@pa1029828342.jpg'),('pa1031252873','04-IN-028','3010-00180','','','N/A','Ampmeter','-','','','General','','From 172P S/N.17275441เบิกไป BSF 9/5/13','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,445.00,445.00,NULL),('pa1062386677','04-IN-012','S3318-3EG2950-04008','','','N/A','Dual TIT/CHT','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1626.76,1626.76,NULL),('pa1098701546','04-IN-003','S3327-1 7000','','','N/A','Vertical Speed','United Instruments CODE C.186','','','General','',' คุณตุ๊นำไปศรีราชา ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1100.00,1100.00,NULL),('pa1116788873','01-AV-AA-060','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8000.00,8000.00,250.00,250.00,'D:@dsg@pic@part@pa1116788873.jpg'),('pa1118086608','01-AV-AA-004','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','',' (ยังไม่จดทะเบียน)','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,79840.00,79840.00,2495.00,2495.00,'D:@dsg@pic@part@pa1118086608.jpg'),('pa1156830401','01-AV-AA-001','069-01032-0201','','','N/A','Com/Nav  28V','Model :Bendix/King KX 155A/with Glideslope','','','General','','Register HS-BSI / AERO-SERVICE  No.Ebay-170536928480','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,9600.00,9600.00,300.00,300.00,'D:@dsg@pic@part@pa1156830401.jpg'),('pa1162155826','01-AV-AA-057','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','INV.3515 DATE 30 JUN 2013','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa1162155826.jpg'),('pa1171533839','01-AV-AA-046','066-1055-52','','','N/A','Audio Panel','Model:King KMA 24 H','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8502.40,8502.40,265.70,265.70,'D:@dsg@pic@part@pa1171533839.jpg'),('pa1193620444','02-AF-A-007','70-2040','','','N/A','XPDR CouplerRyan TCAD Air Traffic Shield','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,450.00,450.00,NULL),('pa1214606378','01-AV-AA-013','IC-A110-05B, AV1','','','N/A','Radio Icom America  IC-A110','with antenna','','','Ground','','Gulf-Coast , Aviation 2/3/10','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,30781.76,30781.76,961.93,961.93,'D:@dsg@pic@part@pa1214606378.jpg'),('pa1239956583','01-AV-AA-024','030572','','','N/A','Cooling Fan (Comair Rotron)','Model : MC24B3 24V,28A,67W','','','General','','HS-BSL = 1','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,1267.20,1267.20,39.60,39.60,'D:@dsg@pic@part@pa1239956583.jpg'),('pa1263572881','02-AF-A-005','-','','','N/A','Antenna DME 172SP','-','','','172SP','','ถอดจาก HS-BSI','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,70.00,70.00,NULL),('pa1271805747','03-HW-C-008','-','','','N/A','Universal Pitot Tube Cover','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,13.95,13.95,NULL),('pa1278700627','01-AV-AA-014','41420-1128','','','N/A',' Cooling fan 24 V','Model : Aircraft Radio RT-359A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,25440.00,25440.00,795.00,795.00,'D:@dsg@pic@part@pa1278700627.jpg'),('pa1281947177','04-IN-004','066-3034-07','','','N/A','VOR Indicator/NAV','Model : Bendix/King KI-202 /NAV','','','General','','','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,941.00,941.00,NULL),('pa1282746842','01-AV-AA-062','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa1282746842.jpg'),('pa1310601325','03-HW-C-002','11-03941 (W58XC4C12A5)','','','N/A','\" (5 Amp.)','-','','','General','','AS701577+Frieght','','','','','','pc1422322536','อะไหล่อื่นๆ','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.39,5.39,NULL),('pa1330791096','01-AV-AA-044','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','19-9-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,19200.00,19200.00,600.00,600.00,'D:@dsg@pic@part@pa1330791096.jpg'),('pa1333372859','01-AV-AA-005','069-1024-05','46314','','N/A','Com/Nav  28V','Model : Bendix/King KX 155','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,73440.00,73440.00,2295.00,2295.00,'D:@dsg@pic@part@pa1333372859.jpg'),('pa136936201','01-AV-AA-059','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8000.00,8000.00,250.00,250.00,NULL),('pa1376497856','04-IN-008','C669562-0108','','','N/A','Fuel Quanlity','Model : 6247-00137 28V','','','General','','ถอดจาก HS-BSD','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1682.60,1682.60,NULL),('pa1386835811','01-AV-AA-026','11-07309','','','N/A','11-07309','-','','','General','','AS701577+Fright','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,5546.88,5546.88,173.34,173.34,'D:@dsg@pic@part@pa1386835811.jpg'),('pa1396940889','04-IN-007','707-938-2121','','','N/A','Fuel QuanlityWESTACH Model : 2DA4V','-','','','General','',' ยังไม่พบ ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,129.10,129.10,NULL),('pa1428698623','03-HW-C-006','11-02191 (1648-009-060)','','','N/A','\" (60 Amp.)','-','','','General','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,15.30,15.30,NULL),('pa1461799859','04-IN-021','S3329-5SL1010-005-1-1','','','N/A','Techometer','-','','','General','','AS595398+Freight30-10-11 HS-BSK','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,416.10,416.10,NULL),('pa1492477528','01-AV-AA-035','-','','','N/A','Transponder','Model : Aircraft Radio RT-359A','','','General','','From 172P S/N.17275441Register BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,21600.00,21600.00,675.00,675.00,'D:@dsg@pic@part@pa1492477528.jpg'),('pa1496555436','01-AV-AA-032','11922','','','N/A','Audio Panel ','Model : PM 1000 II','','','General','','14-04-13 HS-BSE คุณตุ๊','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,9918.40,9918.40,309.95,309.95,'D:@dsg@pic@part@pa1496555436.jpg'),('pa153641384','04-IN-018','46860-2000','','','N/A','VOR Converter Indicator','Model : Aircraft Radio IN-386A','','','General','',' From 172P S/N.17275441  20-9-12 คุณตุ๊ ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,495.00,495.00,NULL),('pa1564092576','04-IN-019','40980-1001','','','N/A','ADF Indictor','Model :Aircraft Radio IN-346A','','','General','',' From 172P S/N.17275441 ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,225.00,225.00,NULL),('pa1566491901','01-AV-AA-063','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,9600.00,9600.00,300.00,300.00,'D:@dsg@pic@part@pa1566491901.jpg'),('pa1579432096','04-IN-011','EGT-701-[6]C','','','N/A',' Temperature Indicator','Model: EDM-700/800','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,2195.00,2195.00,NULL),('pa1598925705','01-AV-AA-030','065-00180-2700','','','N/A','Trim Servo','Model : BENDIX/KING KS 272C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,61024.00,61024.00,1907.00,1907.00,'D:@dsg@pic@part@pa1598925705.jpg'),('pa1627990233','04-IN-033','S3280-1EG2707-06014','','','N/A','Dual Vacuum/AmpROCHSTER GAUGES ','','','','General','','From 172R HS-BSK','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,459.99,459.99,NULL),('pa164062027','03-HW-C-005','11-04270 (W58XC4C12A20)','','','N/A','\" (20 Amp.)','-','','','General','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.39,5.39,NULL),('pa1642889339','01-AV-AA-036','C58911-0117','','','N/A','ELT','Model : DM ELT 6.1','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa1642889339.jpg'),('pa1660005086','04-IN-031','AT420100','','','N/A','Digital Clock','Model : ASTROTECH LC-2','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,329.97,329.97,NULL),('pa1664751412','01-AV-AA-010','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','19-9-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,25440.00,25440.00,795.00,795.00,'D:@dsg@pic@part@pa1664751412.jpg'),('pa1688205878','04-IN-005','066-3056-01','','','N/A','VOR Indicator','Model : Bendix/King KI-209 ','','','General','','Bennett No.19575T+freight25-11-11 Installed HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1016.00,1016.00,NULL),('pa170902410','01-AV-AA-027','FN-300','','','N/A','Cooling Fan (Big)','-','','','General','','28-2-13 ช่างสิทธิ์ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8160.00,8160.00,255.00,255.00,'D:@dsg@pic@part@pa170902410.jpg'),('pa1733557361','04-IN-015','S3280-1EG2707-08023','','','N/A','Dual Vacuum/AmpROCHSTER GAUGES ','-','','','General','',' 30-10-11 HS-BSK ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1144.30,1144.30,NULL),('pa1746192442','01-AV-AA-047','066-1055-52','','','N/A','Audio Panel','Model:King KMA 24 H','','','General','','28-11-12 ส่งคุณธีระยุทธทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,7131.84,7131.84,222.87,222.87,'D:@dsg@pic@part@pa1746192442.jpg'),('pa1760922094','01-AV-AA-037','066-01151-0101','','','N/A','GPS','Model : Bendix/King KLN 35A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,47840.00,47840.00,1495.00,1495.00,'D:@dsg@pic@part@pa1760922094.jpg'),('pa17735746','01-AV-AA-041','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,45760.00,45760.00,1430.00,1430.00,'D:@dsg@pic@part@pa17735746.jpg'),('pa1808077359','01-AV-AA-006','069-1025-025','','','N/A','Com/Nav  28 V','Model : Bendix/king KX165I ','','','General','','Register HS-BSK','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,67040.00,67040.00,2095.00,2095.00,'D:@dsg@pic@part@pa1808077359.jpg'),('pa1822747696','01-AV-AA-011','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','คุณนพพร','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,49120.00,49120.00,1535.00,1535.00,'D:@dsg@pic@part@pa1822747696.jpg'),('pa1823775725','03-HW-C-004','11-04126 (W58XC4C12A15)','','','N/A','\" (15 Amp.)','-','','','General','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.39,5.39,NULL),('pa1845821987','01-AV-H-001','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','','Register HS-BSI / AERO-SERVICE  No.Ebay-170536928480','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL),('pa1848536944','01-AV-AA-045','069-01032-0201','','','N/A','Com / Nav','Model:Bendix/King KX-155A','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa1848536944.jpg'),('pa1848615616','04-IN-022','10-16100','','','N/A','Techometer Cable 37\"','-','','','General','','AS188558+Tax5-10-12 HS-BSK','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,46.60,46.60,NULL),('pa1857692347','01-AV-AA-054','-','','','N/A','Altitude Reporter','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8000.00,8000.00,250.00,250.00,'D:@dsg@pic@part@pa1857692347.jpg'),('pa1869187735','04-IN-029','C669562-0108','','','N/A','Dual Fuel Quantity','Model : 6247-00137','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,500.00,500.00,NULL),('pa1901415954','03-HW-C-007','12-01689','','','N/A','FC-2000W Can Cutter Wheel Only','-','','','General','','AS701577+Frieghtหาไม่เจอ','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.08,5.08,NULL),('pa191262914','01-AV-AA-003','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,92000.00,92000.00,2875.00,2875.00,'D:@dsg@pic@part@pa191262914.jpg'),('pa1918233670','01-AV-AA-018','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,121440.00,121440.00,3795.00,3795.00,'D:@dsg@pic@part@pa1918233670.jpg'),('pa1925906861','04-IN-020','-','','','N/A','EGT/CHT Engine Analyzer','Model : UB9-16','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1215.00,1215.00,NULL),('pa2026627528','01-AV-AA-029','065-00178-2200','','','N/A','Pitch Servo','Model : BENDIX/KING KS 270C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,79360.00,79360.00,2480.00,2480.00,'D:@dsg@pic@part@pa2026627528.jpg'),('pa2035692621','01-AV-AA-033','-','','','N/A','Altitude Digitizer Encoder','Model:Altitude SSD120-XXA','','','General','','12-1-13 ส่งคุณธีรยุทธทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8000.00,8000.00,250.00,250.00,'D:@dsg@pic@part@pa2035692621.jpg'),('pa204436408','01-AV-AA-039','2000-021-009','','','N/A','Strike Finder','Model : SF200','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,79840.00,79840.00,2495.00,2495.00,'D:@dsg@pic@part@pa204436408.jpg'),('pa2047718574','1','1','1','','1','1','Model :  Radio RT-385A','','','C152','','','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,3200.00,3200.00,100.00,100.00,NULL),('pa2054604369','04-IN-010','-','','','N/A','EGT/CHT','Model : 2DA1','','','General','',' ยังไม่พบ ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,158.50,158.50,NULL),('pa2057184565','01-AV-AA-058','AK-350-232-1','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,1599.68,1599.68,49.99,49.99,'D:@dsg@pic@part@pa2057184565.jpg'),('pa2060745627','01-AV-AA-040','VR515GA','','','N/A','Voltage Regulator','Model : VR515GA','','','General','','Yingling Aviation No.822_7 June 201123-1-13 ช่างสิทธิ์ยืมทดสอบ HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8879.68,8879.68,277.49,277.49,'D:@dsg@pic@part@pa2060745627.jpg'),('pa2070056134','01-AV-AA-052','AT1900 REV','','','N/A','Transponder','Model : MX385','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa2070056134.jpg'),('pa2075097816','01-AV-AA-038','42410-512828','','','N/A','Receiver','Model : R-402A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,1279.68,1279.68,39.99,39.99,'D:@dsg@pic@part@pa2075097816.jpg'),('pa207862960','01-AV-AA-050','46660-10008','','','N/A','Com/Nav','Model :  Radio RT-385A','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,19040.00,19040.00,595.00,595.00,'D:@dsg@pic@part@pa207862960.jpg'),('pa208736675','01-AV-AA-023','01-077006-17','','','N/A','Power Supply','Model : 7000617','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8446.40,8446.40,263.95,263.95,'D:@dsg@pic@part@pa208736675.jpg'),('pa2107709528','01-AV-AA-042','70-2400','','','N/A','Ryan TCAD Air Traffic Shield','Type : 9900B Processor','','','General','','','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa2107709528.jpg'),('pa213979571','01-AV-AA-056','066-01156-0201','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa213979571.jpg'),('pa215036869','01-AV-AA-017','11-18381','','','N/A','Cyclone 21-3 Port',' Cooling fan 24 V','','','-','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,5448.32,5448.32,170.26,170.26,'D:@dsg@pic@part@pa215036869.jpg'),('pa252192168','04-IN-026','C661065-0107EA-5174-14-CES','','','N/A','Airspeed','Model : EA-5174','','','General','','From 172P S/N.17275441                  19-11-11             Use in Pitot Static test','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,225.00,225.00,NULL),('pa261840242','01-AV-AA-051','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa261840242.jpg'),('pa274693892','02-AF-A-002','11-06819','','','N/A','Antenna DME (CI 105-16)','-','','','C152','','AS701577+Freight9-8-12 ช่างสิทธิ์เบิกใช้กับ HS-BSL','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,164.11,164.11,NULL),('pa285273245','01-AV-AA-031',' 065-00179-0100','','','N/A','Primary Servo (Roll Servo)','Model : BENDIX/KING KS 271C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,59520.00,59520.00,1860.00,1860.00,'D:@dsg@pic@part@pa285273245.jpg'),('pa316171681','01-AV-AA-028','1570301-4','','','N/A','Dimmer','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,36802.24,36802.24,1150.07,1150.07,'D:@dsg@pic@part@pa316171681.jpg'),('pa358782440','04-IN-027','C661003-0507','','','N/A','Turn Coordinator','Model : RCA82A-4','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,325.00,325.00,NULL),('pa383121139','01-AV-AA-048','066-4009-00','','','N/A','Localizer Converter','Model:King KN72 VOR','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa383121139.jpg'),('pa402332798','04-IN-014','S3828-1 5934PAD-3D','','','N/A','AttimeterUnited Instruments CODE A.657','-','','','General','',' คุณตุ๊นำไปศรีราชา ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,3013.12,3013.12,NULL),('pa414715963','11111','222','','','dfff','333','4444','','','General','','000000','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','3',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'GBP','JPY',51.90,28.00,1.00,100.00,5138.10,519000.00,99.00,10000.00,NULL),('pa428318638','04-IN-032','-','','','N/A','EGT Gauges','-','','','General','','From 172P S/N.17275441หาไม่เจอ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL),('pa442156075','01-AV-AA-009','066-1055-03','','','N/A','Audio Panel  with R&C','Model : KING KMA 24 ','','','General','','Bennett Avionics ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,22912.00,22912.00,716.00,716.00,'D:@dsg@pic@part@pa442156075.jpg'),('pa479801082','01-AV-AA-061','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8000.00,8000.00,250.00,250.00,'D:@dsg@pic@part@pa479801082.jpg'),('pa491989314','04-IN-001','S3327-17000','','','N/A','Vertical Speed','','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1125.00,1125.00,NULL),('pa526431971','01-AV-AA-025','46660-1000','','','N/A','Com/Nav','Model :  Radio RT-385A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,19040.00,19040.00,595.00,595.00,'D:@dsg@pic@part@pa526431971.jpg'),('pa537316371','01-AV-AA-021','066-04035-1301','','','N/A','GPS ','Model : BENDIX/KING KMD 540 MFD','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,156800.00,156800.00,4900.00,4900.00,'D:@dsg@pic@part@pa537316371.jpg'),('pa545727910','02-AF-A-001','11-17921','','','N/A','Antenna Com/Nav CI-121','-','','','C152','','AS701577+Freight9-8-12 ช่างสิทธิ์เบิกใช้กับ HS-BSL','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,152.82,152.82,NULL),('pa550554818','02-AF-A-004','CI 128A','','','N/A','Antenna 172R','-','','','172R','','','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,400.00,400.00,NULL),('pa569491213','02-AF-A-006','S72-1750-31L','','','N/A','L-Band Antenna Ryan TCAD Air Traffic Shield','','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,350.00,350.00,NULL),('pa611213075','04-IN-030','C669564-0101','','','N/A','Dual Oil Press/Oil Temp','Model : 6247-00164','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL),('pa629190869','04-IN-016','-','','','N/A','Turn Coordinator','Model : 1394T100-7z','','','General','','ถอดจาก HS-BSD','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,775.00,775.00,NULL),('pa650401586','04-IN-002','S3329-5SL1010-005-1-1','','','-','04-IN-002','-','','','-','','Beegles Aircraft / ยังไม่พบNo.Ebay ID 27063260137','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,228.50,228.50,NULL),('pa654384850','01-AV-AA-049','ACF328','','','N/A','SANDIA AEROSPACE พัดลม','Model: ACF 328','','','General','','ช่างสิทธิ์ 25-06-13','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa654384850.jpg'),('pa670086112','01-AV-AA-053','066-1072-14','','','N/A','ADF RECEIVER','Model : Bendix/king KR87','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'D:@dsg@pic@part@pa670086112.jpg'),('pa73041507','01-AV-AA-016','-','','','N/A','01-AV-AA-016','-','','','General','','HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,6912.00,6912.00,216.00,216.00,'D:@dsg@pic@part@pa73041507.jpg'),('pa734306998','02-AF-A-003','11-03777','','','N/A','Diplaxer-Antenna CI-1125','-','','','C152','','AS701577+Freight','','','','','','1316463529','อะไหล่เครื่องบิน','pt2139968270','Airframe','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,162.06,162.06,NULL),('pa777689678','01-AV-AA-002','069-01032-0101','','','N/A','Com/Nav  28V','Model :Bendix/King KX 155A/with Glideslope','','','General','','Register HS-BSH','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,95840.00,95840.00,2995.00,2995.00,'D:@dsg@pic@part@pa777689678.jpg'),('pa794527804','01-AV-AA-015','066-1062-00','','','N/A','Transponder','Model : Bendix/king KT 76A','','','General','','Register BSH','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,59488.00,59488.00,1859.00,1859.00,'D:@dsg@pic@part@pa794527804.jpg'),('pa811278846','04-IN-025','C661071-01015934P-1','','','N/A','Altimeter','-','','','General','','From 172P S/N.17275441 คุณตุ๊เบิกไปศรีราชา 16-05-15','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,225.00,225.00,NULL),('pa82109024','03-HW-C-003','11-03938 (W58XC4C12A10)','','','N/A','\" (10 Amp.)','-','','','General','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.39,5.39,NULL),('pa835971953','01-AV-AA-019','069-01034-0101','','','N/A','GPS ','Model : Bendix/King KLN 94 TSO','','','General','','กทชระบุใน HS-DSG (เสีย)','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,115040.00,115040.00,3595.00,3595.00,'D:@dsg@pic@part@pa835971953.jpg'),('pa864426864','04-IN-009','-','','','N/A','Model : 6247-00387 28V','Model : 6247-00387 28V','','','General','','ถอดจาก HS-BSD','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,2547.00,2547.00,NULL),('pa886799184','01-AV-AA-007','46660-1100','','','N/A','Com/Nav  28V','Model : Aircraft Radio RT-385A ','','','General','','Register HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,30400.00,30400.00,950.00,950.00,'D:@dsg@pic@part@pa886799184.jpg'),('pa897141895','04-IN-017','-','','','N/A','Dual Digital Clock/VoltmeterAVTRON Model : 803','-','','','General','',' 20-9-12 คุณตุ๊ ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,527.00,527.00,NULL),('pa91649512','01-AV-AA-043','70-2500','','','N/A','Monitor Ryan TCAD Air Traffic Shield','Type : Ryan TCAD 9990B ','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,16000.00,16000.00,500.00,500.00,'D:@dsg@pic@part@pa91649512.jpg'),('pa921039959','04-IN-013','S3326-11U149-015-9','','','N/A','Attitude GyroSIGMA TEK 5000B-67','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,1229.95,1229.95,NULL),('pa923599812','01-AV-AA-020','41240-0001','','','N/A','ADF','Model : Aircraft Radio R-546E','','','General','','Register HS-BSKFrom 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,19040.00,19040.00,595.00,595.00,'D:@dsg@pic@part@pa923599812.jpg'),('pa933897399','01-AV-AA-034','065-00176-7703 047-10881-0001','','','N/A','Auto Pilot(Flight Control Computer)','Model : Bendix/King KAP 140','','','C172','','Installed HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,73600.00,73600.00,2300.00,2300.00,'D:@dsg@pic@part@pa933897399.jpg'),('pa955196834','04-IN-023','C661075-0101200-5C','','','N/A','Directional Gyro','-','','','General','','From 172P S/N.172754411-2-13 HS-BSD','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,765.00,765.00,NULL),('pa958449243','03-HW-C-001','11-03940 (W58XC4C12A3)','','','N/A','(W58XC4C12A3)(3 Amp.)','-','','','General','','$5.90AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt42397006','Hardware','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,5.75,5.75,NULL),('pa967160467','01-AV-AA-022','01-077006-17','','','N/A','Power Supply','Model : 7000617','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'USD','USD',32.00,32.00,1.00,1.00,8446.40,8446.40,263.95,263.95,'D:@dsg@pic@part@pa967160467.jpg'),('pa969745615','04-IN-006','066-3056-02','','','N/A','VOR/LOC Converter/Indicator','Model : Bendix/King KI-208','','','General','','ส่งไปติดตั้งระบบกับ คุณธีรยุทธ นาโนเทค (16-05-13)','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,695.00,695.00,NULL),('pa983756656','04-IN-024','C661080-01017000','','','N/A','Vertical Speed','','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1883640598','Instruments','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'','',0.00,0.00,0.00,0.00,0.00,0.00,300.00,300.00,NULL),('ps1879234998','11111','222','','','dfff','333','4444','','','General','','000000','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','3',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL);
/*!40000 ALTER TABLE `b_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part_category`
--

DROP TABLE IF EXISTS `b_part_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part_category` (
  `part_cate_id` varchar(255) NOT NULL,
  `part_cate_code` varchar(255) DEFAULT NULL,
  `part_cate_name` varchar(255) DEFAULT NULL,
  `part_cate_active` varchar(255) DEFAULT NULL,
  `part_cate_reamark` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`part_cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_category`
--

LOCK TABLES `b_part_category` WRITE;
/*!40000 ALTER TABLE `b_part_category` DISABLE KEYS */;
INSERT INTO `b_part_category` VALUES ('1316463529','aa','อะไหล่เครื่องบิน','1','','10'),('pc1422322536','bb','อะไหล่อื่นๆ','1','','11');
/*!40000 ALTER TABLE `b_part_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part_location`
--

DROP TABLE IF EXISTS `b_part_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part_location` (
  `loca_id` varchar(255) NOT NULL,
  `loca_name` varchar(255) DEFAULT NULL,
  `loca_active` varchar(255) DEFAULT NULL,
  `loca_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_location`
--

LOCK TABLES `b_part_location` WRITE;
/*!40000 ALTER TABLE `b_part_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_part_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part_serial_no`
--

DROP TABLE IF EXISTS `b_part_serial_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part_serial_no` (
  `part_serial_no_id` varchar(255) NOT NULL,
  `row_number` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `part_serial_no_remark` varchar(255) DEFAULT NULL,
  `loca_id` varchar(255) DEFAULT NULL,
  `date_inv` varchar(255) DEFAULT NULL,
  `date_receive` varchar(255) DEFAULT NULL,
  `part_id` varchar(255) DEFAULT NULL,
  `part_serial_no_active` varchar(255) DEFAULT NULL,
  `status_tran` varchar(255) DEFAULT NULL,
  `date_create` varchar(255) DEFAULT NULL,
  `date_modi` varchar(255) DEFAULT NULL,
  `date_cancel` varchar(255) DEFAULT NULL,
  `user_create` varchar(255) DEFAULT NULL,
  `user_modi` varchar(255) DEFAULT NULL,
  `user_cancel` varchar(255) DEFAULT NULL,
  `remark_draw` varchar(255) DEFAULT NULL,
  `price_cost` decimal(17,2) DEFAULT '0.00',
  `price_sale` decimal(17,2) DEFAULT '0.00',
  `current_name_price_cost` varchar(255) DEFAULT NULL,
  `current_name_price_sale` varchar(255) DEFAULT NULL,
  `current_rate_price_cost` decimal(17,2) DEFAULT '0.00',
  `current_rate_price_sale` decimal(17,2) DEFAULT '0.00',
  `current_x_price_cost` decimal(17,2) DEFAULT '0.00',
  `current_x_price_sale` decimal(17,2) DEFAULT '0.00',
  `price_cost_current` decimal(17,2) DEFAULT '0.00',
  `price_sale_current` decimal(17,2) DEFAULT '0.00',
  PRIMARY KEY (`part_serial_no_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_serial_no`
--

LOCK TABLES `b_part_serial_no` WRITE;
/*!40000 ALTER TABLE `b_part_serial_no` DISABLE KEYS */;
INSERT INTO `b_part_serial_no` VALUES ('ps1014057113',NULL,'H-L050004','','2','','','pa2060745627','1','1','2014-12-10 20:38:33','2014-12-14 11:24:09',NULL,NULL,NULL,NULL,NULL,277.49,277.49,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1019310569',NULL,'N/A','','1','','','pa958449243','1','1','2014-12-14 17:18:43',NULL,NULL,NULL,NULL,NULL,NULL,5.75,5.75,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps102106035',NULL,'3701','','1','','','pa153641384','1','1','2014-12-14 21:57:35',NULL,NULL,NULL,NULL,NULL,NULL,495.00,495.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1029073667',NULL,'33723','From 172P S/N.17275441','2','','','pa923599812','1','1','2014-12-10 19:59:41','2014-12-14 11:46:19',NULL,NULL,NULL,NULL,NULL,595.00,595.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1035745398',NULL,'13475','','1','','','','1','1','2014-12-10 21:10:44',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1078280197',NULL,'43785','','1','','','pa2057184565','1','1','2014-12-10 21:12:12','2014-12-14 11:33:05',NULL,NULL,NULL,NULL,NULL,49.99,49.99,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1086138563',NULL,'3203','','1','','','','1','1','2014-12-10 21:02:29',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1101982367',NULL,'24243','','1','','','','1','1','2014-12-10 11:18:40',NULL,NULL,NULL,NULL,NULL,NULL,2995.00,2995.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1121325377',NULL,'424352','','1','','','pa402332798','1','1','2014-12-14 21:50:13',NULL,NULL,NULL,NULL,NULL,NULL,3013.12,3013.12,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1145727278',NULL,'7541','','1','','','pa358782440','1','1','2014-12-14 22:16:07',NULL,NULL,NULL,NULL,NULL,NULL,325.00,325.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1158133786',NULL,'2260','','1','','','pa1396940889','1','1','2014-12-14 21:35:52',NULL,NULL,NULL,NULL,NULL,NULL,129.10,129.10,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1159562872',NULL,'299125','','1','','','pa1098701546','1','1','2014-12-14 21:27:45',NULL,NULL,NULL,NULL,NULL,NULL,1100.00,1100.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1165755915',NULL,'5196','','2','','','pa1598925705','1','1','2014-12-10 20:21:45','2014-12-14 11:09:00',NULL,NULL,NULL,NULL,NULL,1907.00,1907.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1194820443',NULL,'268','','1','','','pa1627990233','1','1','2014-12-14 22:31:21',NULL,NULL,NULL,NULL,NULL,NULL,459.99,459.99,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1201627186',NULL,'21914','','1','','','pa983756656','1','1','2014-12-14 22:10:52',NULL,NULL,NULL,NULL,NULL,NULL,300.00,300.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1251150940',NULL,'A 40515','','2','','','pa2035692621','1','1','2014-12-10 20:26:12','2014-12-14 11:09:44',NULL,NULL,NULL,NULL,NULL,250.00,250.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1253179597',NULL,'20606','19-9-12 คุณตุ๊ยืมทดสอบ16-5ธีร','2','','','pa1918233670','1','1','2014-12-10 19:51:44','2014-12-14 11:45:24',NULL,NULL,NULL,NULL,NULL,3795.00,3795.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1312606413',NULL,'3513947','','1','','','pa136936201','1','1','2014-12-10 21:13:33','2014-12-14 11:33:23',NULL,NULL,NULL,NULL,NULL,250.00,250.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1320392614',NULL,'N/A','','1','','','','1','1','2014-12-14 17:35:55',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1323462781',NULL,'46314','Installation HS-BSF','2','','','pa1333372859','1','1','2014-12-10 11:34:41','2014-12-14 11:40:30',NULL,NULL,NULL,NULL,NULL,2295.00,2295.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1328209780',NULL,'3269','กทชระบุใน HS-DSG (เสีย)','2','','','pa835971953','1','1','2014-12-10 19:56:51','2014-12-14 11:45:43',NULL,NULL,NULL,NULL,NULL,3595.00,3595.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1369046736',NULL,'N/A','','1','','','pa1263572881','1','1','2014-12-14 17:08:57',NULL,NULL,NULL,NULL,NULL,NULL,70.00,70.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1381987758',NULL,'69514','','1','','','','1','1','2014-12-10 21:05:27',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1423633635',NULL,'N/A','','1','','','pa1901415954','1','1','2014-12-14 17:32:17',NULL,NULL,NULL,NULL,NULL,NULL,5.08,5.08,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1430677944',NULL,'3509243','','1','','','pa479801082','1','1','2014-12-10 21:16:35','2014-12-14 11:34:00',NULL,NULL,NULL,NULL,NULL,250.00,250.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps144048952',NULL,'N/A','','2','','','pa1386835811','1','1','2014-12-14 11:50:23',NULL,NULL,NULL,NULL,NULL,NULL,172.33,172.33,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps145705466',NULL,'0917','','1','','','pa1461799859','1','1','2014-12-14 22:04:42',NULL,NULL,NULL,NULL,NULL,NULL,416.10,416.10,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1478463775',NULL,'28930','','2','','','pa1492477528','1','1','2014-12-10 20:30:07','2014-12-14 11:10:17',NULL,NULL,NULL,NULL,NULL,675.00,675.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1491415859',NULL,'10195','No.19575T+freight  (HS-BSF)','2','','','pa442156075','1','1','2014-12-10 19:30:59','2014-12-14 11:41:58',NULL,NULL,NULL,NULL,NULL,716.00,716.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1510093543',NULL,'N/A','','1','','','pa1823775725','1','1','2014-12-14 17:25:47',NULL,NULL,NULL,NULL,NULL,NULL,5.39,5.39,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1551964516',NULL,'523022/67130','2-11-12 คุณตุ๊ยืมใช้งาน ','2','','','pa1214606378','1','1','2014-12-10 19:40:59','2014-12-14 11:43:56',NULL,NULL,NULL,NULL,NULL,961.93,961.93,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1613828355',NULL,'N/A','','1','','','pa550554818','1','1','2014-12-14 17:07:05',NULL,NULL,NULL,NULL,NULL,NULL,400.00,400.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1623536705',NULL,'-','','2','','','pa1330791096','1','1','2014-12-10 20:45:19','2014-12-14 11:26:40',NULL,NULL,NULL,NULL,NULL,600.00,600.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1632490857',NULL,'N/A','','1','','','pa82109024','1','1','2014-12-14 17:22:18',NULL,NULL,NULL,NULL,NULL,NULL,5.39,5.39,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1649957217',NULL,'6015714','HS-BSF','2','','','pa73041507','1','1','2014-12-10 19:48:25','2014-12-14 11:44:52',NULL,NULL,NULL,NULL,NULL,216.00,216.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1684038964',NULL,'N/A','','1','','','pa1271805747','1','1','2014-12-14 17:33:46',NULL,NULL,NULL,NULL,NULL,NULL,13.95,13.95,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1684905951',NULL,'16640','','1','','','pa1579432096','1','1','2014-12-14 21:42:07',NULL,NULL,NULL,NULL,NULL,NULL,2195.00,2195.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1703918778',NULL,'51995','','1','','','','1','1','2014-12-10 20:31:42',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1707335033',NULL,'K13264','','2','','','pa1496555436','1','1','2014-12-10 20:24:39','2014-12-14 11:09:30',NULL,NULL,NULL,NULL,NULL,309.95,309.95,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1720866412',NULL,'35444','','1','','','pa1660005086','1','1','2014-12-14 22:28:21',NULL,NULL,NULL,NULL,NULL,NULL,329.97,329.97,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1731592323',NULL,'46314','','1','','','','1','1','2014-12-10 11:33:47',NULL,NULL,NULL,NULL,NULL,NULL,2295.00,2295.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1734988039',NULL,'003-009527','19-9-12 คุณตุ๊ยืมทดสอบ','2','','','pa215036869','1','1','2014-12-10 19:50:03','2014-12-14 11:45:06',NULL,NULL,NULL,NULL,NULL,170.26,170.26,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1745466246',NULL,'12479','','1','','','','1','1','2014-12-10 20:46:40',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1765286653',NULL,'5925','','2','','','pa933897399','1','1','2014-12-10 20:28:10','2014-12-14 11:09:58',NULL,NULL,NULL,NULL,NULL,2300.00,2300.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1765979209',NULL,'N/A','','1','','','pa164062027','1','1','2014-12-14 17:27:22',NULL,NULL,NULL,NULL,NULL,NULL,5.39,5.39,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1767702819',NULL,'7409','','2','','','pa285273245','1','1','2014-12-10 20:23:08','2014-12-14 11:09:15',NULL,NULL,NULL,NULL,NULL,1860.00,1860.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1786586088',NULL,'4912','','1','','','pa955196834','1','1','2014-12-14 22:08:06',NULL,NULL,NULL,NULL,NULL,NULL,765.00,765.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1790675634',NULL,'16127','','1','','','','1','1','2014-12-10 20:57:10',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1803330519',NULL,'17195','Register HS-DSG','2','','','pa1278700627','1','1','2014-12-10 19:42:40','2014-12-14 11:44:11',NULL,NULL,NULL,NULL,NULL,795.00,795.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1815303726',NULL,'97','','1','','','pa864426864','1','1','2014-12-14 21:39:10',NULL,NULL,NULL,NULL,NULL,NULL,2547.00,2547.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1847694671',NULL,'N/A','','2','','','pa170902410','1','1','2014-12-10 20:16:55','2014-12-14 11:07:12',NULL,NULL,NULL,NULL,NULL,255.00,255.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1863550535',NULL,'28543','','2','','','pa207862960','1','1','2014-12-10 21:01:11','2014-12-14 11:29:53',NULL,NULL,NULL,NULL,NULL,595.00,595.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1873812309',NULL,'22970','','2','','','pa2075097816','1','1','2014-12-10 20:34:57','2014-12-14 11:23:11',NULL,NULL,NULL,NULL,NULL,39.99,39.99,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1879234998',NULL,'5555555','','2','','','','1','0','2014-12-12 09:08:16','2014-12-12 09:09:51',NULL,NULL,NULL,NULL,NULL,900.00,900.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1898485838',NULL,'19553','Installed HS-BSI','2','','','pa191262914','1','1','2014-12-10 11:26:28','2014-12-14 11:39:55',NULL,NULL,NULL,NULL,NULL,2875.00,2875.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps192294867',NULL,'69343','','1','','','pa969745615','1','1','2014-12-14 21:34:04',NULL,NULL,NULL,NULL,NULL,NULL,695.00,695.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1961910653',NULL,'6492','','2','','','pa537316371','1','1','2014-12-10 20:01:23','2014-12-14 11:05:15',NULL,NULL,NULL,NULL,NULL,4900.00,4900.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1978792624',NULL,'2336','','2','','','pa1760922094','1','1','2014-12-10 20:33:25','2014-12-14 11:22:19',NULL,NULL,NULL,NULL,NULL,1495.00,1495.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1978953152',NULL,'7757','12-1-13 ส่งคุณธีรยุทธทดสอบ','2','','','1','1','1','2014-12-10 19:24:53','2014-12-14 11:39:15',NULL,NULL,NULL,NULL,NULL,300.00,300.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1981299100',NULL,'971090','','1','','','','1','1','2014-12-10 20:42:27',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps1996470758',NULL,'-','','2','','','pa1239956583','1','1','2014-12-10 20:08:42','2014-12-14 11:06:00',NULL,NULL,NULL,NULL,NULL,39.60,39.60,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2019651331',NULL,'-','','1','','','pa1031252873','1','1','2014-12-14 22:17:36',NULL,NULL,NULL,NULL,NULL,NULL,445.00,445.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2038041281',NULL,'3508026','','2','','','pa1857692347','1','1','2014-12-10 21:06:54','2014-12-14 11:31:43',NULL,NULL,NULL,NULL,NULL,250.00,250.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2040590616',NULL,'24581','','1','','','pa2054604369','1','1','2014-12-14 21:40:43',NULL,NULL,NULL,NULL,NULL,NULL,158.50,158.50,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2048489350',NULL,'25701','19-9-12 คุณตุ๊ยืมทดสอบ','2','','','pa1029828342','1','1','2014-12-10 19:38:31','2014-12-14 11:43:25',NULL,NULL,NULL,NULL,NULL,1916.00,1916.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2079143045',NULL,'00650','','2','','','pa967160467','1','1','2014-12-14 11:46:58',NULL,NULL,NULL,NULL,NULL,NULL,1.00,1.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2095813401',NULL,'36370','','1','','','pa1564092576','1','1','2014-12-14 21:59:14',NULL,NULL,NULL,NULL,NULL,NULL,225.00,225.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2119813664',NULL,'971090','','2','','','pa91649512','1','1','2014-12-10 20:43:52','2014-12-14 11:26:04',NULL,NULL,NULL,NULL,NULL,500.00,500.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2124337159',NULL,'308188','','1','','','pa491989314','1','1','2014-12-14 21:23:53',NULL,NULL,NULL,NULL,NULL,NULL,1125.00,1125.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps2142830679',NULL,'00773','','2','','','pa208736675','1','1','2014-12-10 20:05:32','2014-12-14 11:48:02',NULL,NULL,NULL,NULL,NULL,263.95,263.95,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps224996889',NULL,'06443','','1','','','pa897141895','1','1','2014-12-14 21:55:38',NULL,NULL,NULL,NULL,NULL,NULL,527.00,527.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps229836133',NULL,'60724','','2','','','pa1808077359','1','1','2014-12-10 11:37:12','2014-12-14 11:01:02',NULL,NULL,NULL,NULL,NULL,2095.00,2095.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps256192524',NULL,'N/A','','1','','','pa1848615616','1','1','2014-12-14 22:06:11',NULL,NULL,NULL,NULL,NULL,NULL,46.60,46.60,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps273781940',NULL,'3834','19-9-12 คุณตุ๊ยืมทดสอบ','2','','','pa1664751412','1','1','2014-12-10 19:33:37','2014-12-14 11:42:41',NULL,NULL,NULL,NULL,NULL,795.00,795.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps274595483',NULL,'50671','','2','','','pa1171533839','1','1','2014-12-10 20:50:21','2014-12-14 11:27:46',NULL,NULL,NULL,NULL,NULL,265.70,265.70,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps274840897',NULL,'21782','','1','','','','1','1','2014-12-10 21:09:33',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps292106875',NULL,'-','','1','','','pa650401586','1','1','2014-12-14 21:25:58',NULL,NULL,NULL,NULL,NULL,NULL,228.50,228.50,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps389085609',NULL,'00773','','1','','','','1','1','2014-12-10 20:06:58',NULL,NULL,NULL,NULL,NULL,NULL,263.95,263.95,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps395260010',NULL,'55555','44444','2','','','ps1879234998','1','1','2014-12-12 09:12:13',NULL,NULL,NULL,NULL,NULL,NULL,900.00,900.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps415577747',NULL,'12840','','1','','','','1','1','2014-12-10 20:59:31',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps436712283',NULL,'26514','','1','','','pa1281947177','1','1','2014-12-14 21:29:23',NULL,NULL,NULL,NULL,NULL,NULL,941.00,941.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps460528712',NULL,'53785','','2','','','pa1746192442','1','1','2014-12-10 20:55:57','2014-12-14 11:28:02',NULL,NULL,NULL,NULL,NULL,222.87,222.87,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps472207683',NULL,'124','','1','','','pa1062386677','1','1','2014-12-14 21:43:38',NULL,NULL,NULL,NULL,NULL,NULL,1626.76,1626.76,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps474635738',NULL,'N/A','','1','','','','1','1','2014-12-10 20:16:32',NULL,NULL,NULL,NULL,NULL,NULL,255.00,255.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps477153631',NULL,'24155','','1','','','pa252192168','1','1','2014-12-14 22:14:15',NULL,NULL,NULL,NULL,NULL,NULL,225.00,225.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps478648852',NULL,'X5988','','2','','','1','1','1','2014-12-10 20:20:00','2014-12-14 11:08:21',NULL,NULL,NULL,NULL,NULL,2480.00,2480.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps492564422',NULL,'23769','','1','','','pa274693892','1','1','2014-12-14 17:02:15',NULL,NULL,NULL,NULL,NULL,NULL,164.11,164.11,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps506686404',NULL,'33603','','2','','','pa101544120','1','1','2014-12-10 21:08:16','2014-12-14 11:31:59',NULL,NULL,NULL,NULL,NULL,950.00,950.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps534937389',NULL,'005441','','1','','','pa1925906861','1','1','2014-12-14 22:01:08',NULL,NULL,NULL,NULL,NULL,NULL,1215.00,1215.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps548629768',NULL,'48647','Installed HS-BSE','2','','','pa794527804','1','1','2014-12-10 19:45:33','2014-12-14 11:44:31',NULL,NULL,NULL,NULL,NULL,1859.00,1859.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps562568393',NULL,'203','','1','','','pa569491213','1','1','2014-12-14 17:11:02',NULL,NULL,NULL,NULL,NULL,NULL,350.00,350.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps562745248',NULL,'T80338Q','','1','','','pa921039959','1','1','2014-12-14 21:48:16',NULL,NULL,NULL,NULL,NULL,NULL,1229.95,1229.95,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps566026069',NULL,'12729','8-8-12  คุณตุ๊เบิก','2','','','pa886799184','1','1','2014-12-10 11:39:13','2014-12-14 11:41:25',NULL,NULL,NULL,NULL,NULL,950.00,950.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps58555677',NULL,'704','','1','','','pa611213075','1','1','2014-12-14 22:23:28',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps646097487',NULL,'3522413','','1','','','pa1116788873','1','1','2014-12-10 21:15:20','2014-12-14 11:33:42',NULL,NULL,NULL,NULL,NULL,250.00,250.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps660720122',NULL,'24243','19-9-12 คุณตุ๊ยืมทดสอบ 16-5 ธีรย','2','','','pa777689678','1','1','2014-12-14 10:57:44','2014-12-14 11:39:38',NULL,NULL,NULL,NULL,NULL,2995.00,2995.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps672580950',NULL,'468','','1','','','pa1869187735','1','1','2014-12-14 22:19:54',NULL,NULL,NULL,NULL,NULL,NULL,500.00,500.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps684868418',NULL,'5A708','','1','','','pa811278846','1','1','2014-12-14 22:12:38',NULL,NULL,NULL,NULL,NULL,NULL,225.00,225.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps712213732',NULL,'N/A','','2','','','pa1386835811','1','1','2014-12-14 11:49:52',NULL,NULL,NULL,NULL,NULL,NULL,182.89,182.89,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps723483376',NULL,'18476','','1','','','pa1688205878','1','1','2014-12-14 21:31:15',NULL,NULL,NULL,NULL,NULL,NULL,1016.00,1016.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps728404898',NULL,'N/A','','2','','','pa316171681','1','1','2014-12-10 20:18:18','2014-12-14 11:07:26',NULL,NULL,NULL,NULL,NULL,1150.07,1150.07,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps730270762',NULL,'18330','19-9-12 คุณตุ๊ยืมทดสอบ16-5ธีร','2','','','pa1118086608','1','1','2014-12-10 11:29:14','2014-12-14 11:40:16',NULL,NULL,NULL,NULL,NULL,2495.00,2495.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps731446653',NULL,'10851','คุณนพพร','2','','','pa1822747696','1','1','2014-12-10 19:36:43','2014-12-14 11:43:08',NULL,NULL,NULL,NULL,NULL,1535.00,1535.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps756056312',NULL,'312','','1','','','pa1376497856','1','1','2014-12-14 21:37:29',NULL,NULL,NULL,NULL,NULL,NULL,1682.60,1682.60,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps766587896',NULL,'5283','','2','','','pa204436408','1','1','2014-12-10 20:36:29','2014-12-14 11:23:30',NULL,NULL,NULL,NULL,NULL,2495.00,2495.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps772186320',NULL,'8911-199','','1','','','pa629190869','1','1','2014-12-14 21:53:53',NULL,NULL,NULL,NULL,NULL,NULL,775.00,775.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps778296650',NULL,'314530','','1','','','','1','1','2014-12-14 17:04:51',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps785010120',NULL,'N/A','','1','','','','1','1','2014-12-14 17:23:45',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps826268513',NULL,'21618','','2','','','pa526431971','1','1','2014-12-10 20:10:24','2014-12-14 11:48:48',NULL,NULL,NULL,NULL,NULL,595.00,595.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps841269346',NULL,'N/A','','2','','','pa1386835811','1','1','2014-12-10 20:13:28','2014-12-14 11:49:26',NULL,NULL,NULL,NULL,NULL,173.34,173.34,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps86140057',NULL,'-','','1','','','','1','1','2014-12-10 21:17:41',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps879938262',NULL,'001210','','1','','','pa1193620444','1','1','2014-12-14 17:12:56',NULL,NULL,NULL,NULL,NULL,NULL,450.00,450.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps883132158',NULL,'N/A','','1','','','pa1428698623','1','1','2014-12-14 17:29:56',NULL,NULL,NULL,NULL,NULL,NULL,15.30,15.30,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps891075318',NULL,'','','2','','','pa2047718574','1','1','2014-12-14 16:47:46','2014-12-16 13:50:59',NULL,NULL,NULL,NULL,NULL,100.00,100.00,'GBP','EUR ',51.90,41.00,1.00,1.00,5190.00,4100.00),('ps949015680',NULL,'4291','','1','','','pa1733557361','1','1','2014-12-14 21:52:00',NULL,NULL,NULL,NULL,NULL,NULL,1144.30,1144.30,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps952948530',NULL,'-','','1','','','pa428318638','1','1','2014-12-14 22:29:44',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps95830488',NULL,'2888','','1','','','','1','1','2014-12-10 21:03:56',NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps968612608',NULL,'26408','','1','','','pa17735746','1','1','2014-12-10 20:40:35','2014-12-14 11:24:31',NULL,NULL,NULL,NULL,NULL,1430.00,1430.00,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00),('ps996919143',NULL,'N/A','','1','','','pa1310601325','1','1','2014-12-14 17:20:31',NULL,NULL,NULL,NULL,NULL,NULL,5.39,5.39,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `b_part_serial_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part_type`
--

DROP TABLE IF EXISTS `b_part_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part_type` (
  `part_type_id` varchar(255) NOT NULL,
  `part_type_code` varchar(255) DEFAULT NULL,
  `part_type_name` varchar(255) DEFAULT NULL,
  `part_type_active` varchar(255) DEFAULT NULL,
  `part_type_remark` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`part_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_type`
--

LOCK TABLES `b_part_type` WRITE;
/*!40000 ALTER TABLE `b_part_type` DISABLE KEYS */;
INSERT INTO `b_part_type` VALUES ('pt1474017427','06','Asset','1','','16'),('pt1502915685','05','Power Plant','1','','15'),('pt1729349247','01','Avionics','1','(Update 1-4-2013)','10'),('pt1883640598','04','Instruments','1','','14'),('pt2139968270','02','Airframe','1','(Update 1-4-2013)','11'),('pt42397006','03','Hardware','1','','13');
/*!40000 ALTER TABLE `b_part_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_part_type_sub`
--

DROP TABLE IF EXISTS `b_part_type_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_part_type_sub` (
  `part_type_sub_id` varchar(255) NOT NULL,
  `part_type_sub_code` varchar(255) DEFAULT NULL,
  `part_type_sub_name` varchar(255) DEFAULT NULL,
  `part_type_id` varchar(255) DEFAULT NULL,
  `part_type_sub_active` varchar(255) DEFAULT NULL,
  `part_type_sub_remark` varchar(255) DEFAULT NULL,
  `sort1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`part_type_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_type_sub`
--

LOCK TABLES `b_part_type_sub` WRITE;
/*!40000 ALTER TABLE `b_part_type_sub` DISABLE KEYS */;
INSERT INTO `b_part_type_sub` VALUES ('62688976','01','01-AV-AA','1729349247','1','dddd','10'),('pts1060192105','23','02-AF-L','pt2139968270','1','','14'),('pts1080715653','03','ST-FM-02','1729349247','1','','12'),('pts1092422589','40','04-Instruments','pt1883640598','1','','40'),('pts1112943174','51','05-PP-F','pt1502915685','1','','51'),('pts114634638','56','ST-FM-02','pt1502915685','1','','56'),('pts1158310127','307','03-HW-S','pt42397006','1','','100'),('pts1158387679','310','Consumtion','pt42397006','1','','310'),('pts116673592','311','ST-FM-02 (Consumtion)','pt42397006','1','','311'),('pts1271948987','02','01-AV-H','1729349247','1','','11'),('pts1488993320','306','03-HW-O','pt42397006','1','','100'),('pts1564646380','50','05-PP-C','pt1502915685','1','','50'),('pts1589505757','26','Histories','pt2139968270','1','','26'),('pts1631963004','25','ST-FM-02','pt2139968270','1','','25'),('pts1641521637','309','ST-FM-02','pt42397006','1','','100'),('pts1646067067','60','Tool (DA 42)','pt1474017427','1','','60'),('pts1741691818','05','อะไหล่รอช่อม','1729349247','1','','15'),('pts1848630572','22','02-AF-K','pt2139968270','1','','13'),('pts2024804811','54','05-PP-S','pt1502915685','1','','54'),('pts2066587647','24','02-AF-T','pt2139968270','1','','24'),('pts207549593','41','ST-FM-02','pt1883640598','1','','41'),('pts263591596','61','Tool','pt1474017427','1','','61'),('pts296944974','308','03-HW-V','pt42397006','1','','100'),('pts308919773','312','Histories','pt42397006','1','','312'),('pts315439614','305','03-HW-N','pt42397006','1','','100'),('pts329024370','53','05-PP-O','pt1502915685','1','','53'),('pts333350153','303','03-HW-F','pt42397006','1','','100'),('pts436446618','52','05-PP-G','pt1502915685','1','','52'),('pts525764447','304','03-HW-M','pt42397006','1','','100'),('pts58124862','55','05-PP-V','pt1502915685','1','','55'),('pts594326574','42','Histories','pt1883640598','1','','42'),('pts602943380','20','02-AF-A','pt2139968270','1','','11'),('pts680163605','301','03-HW-BB','pt42397006','1','','100'),('pts683825274','64','Des','pt1474017427','1','','64'),('pts700684190','302','03-HW-C','pt42397006','1','','100'),('pts739257409','62','Office','pt1474017427','1','','62'),('pts751900338','21','02-AF-F','pt2139968270','1','','12'),('pts883046060','57','ST-FM-02_Oil','pt1502915685','1','','57'),('pts93191516','63','Histories','pt1474017427','1','','63'),('pts956240609','04','Histories','1729349247','1','','14'),('pts96452667','300','03-HW-B','pt42397006','1','','100');
/*!40000 ALTER TABLE `b_part_type_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sale_cust`
--

DROP TABLE IF EXISTS `b_sale_cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sale_cust` (
  `cust_id` varchar(255) NOT NULL,
  `sale_id` varchar(255) DEFAULT NULL,
  `thoo_id` varchar(255) DEFAULT NULL,
  `cust_active` varchar(255) DEFAULT NULL,
  `cust_name` varchar(255) DEFAULT NULL,
  `sale_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sale_cust`
--

LOCK TABLES `b_sale_cust` WRITE;
/*!40000 ALTER TABLE `b_sale_cust` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sale_cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_staff`
--

DROP TABLE IF EXISTS `b_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_staff` (
  `staff_id` varchar(255) NOT NULL,
  `staff_code` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_password` varchar(255) DEFAULT NULL,
  `staff_active` varchar(255) DEFAULT NULL,
  `staff_remark` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_staff`
--

LOCK TABLES `b_staff` WRITE;
/*!40000 ALTER TABLE `b_staff` DISABLE KEYS */;
INSERT INTO `b_staff` VALUES ('1341642395','666','นายบี',NULL,'3','ใหม่',NULL),('1572547287','11','txtStaffName',NULL,'3','',NULL),('1586664359','344','',NULL,'3','',NULL),('1889410607','44','adfasdf',NULL,'3','',NULL),('435879291','33','asdfsadf',NULL,'3','',NULL),('636800595','22','นางสาวบี','22','1','','3'),('67713278','555','fasdf',NULL,'3','',NULL),('896776927','235423','asdfsfd',NULL,'3','',NULL),('IM0346733007','33','33','33','1','','3'),('WU0907721459','901','นางสาวซี','901','1','','1');
/*!40000 ALTER TABLE `b_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_banks`
--

DROP TABLE IF EXISTS `book_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_banks` (
  `book_id` varchar(255) NOT NULL,
  `bank_id` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_active` varchar(255) DEFAULT NULL,
  `book_number` varchar(255) DEFAULT NULL,
  `book_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_banks`
--

LOCK TABLES `book_banks` WRITE;
/*!40000 ALTER TABLE `book_banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_lock`
--

DROP TABLE IF EXISTS `f_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_lock` (
  `flock` varchar(255) NOT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `date_start` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_lock`
--

LOCK TABLES `f_lock` WRITE;
/*!40000 ALTER TABLE `f_lock` DISABLE KEYS */;
INSERT INTO `f_lock` VALUES ('0','636800595','2557-05-11 10:01:343434',NULL);
/*!40000 ALTER TABLE `f_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_part`
--

DROP TABLE IF EXISTS `t_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_part` (
  `t_part_id` varchar(255) NOT NULL,
  `part_id` varchar(255) DEFAULT NULL,
  `part_serial_no_id` varchar(255) DEFAULT NULL,
  `date_tran` varchar(255) DEFAULT NULL,
  `status_tran` varchar(255) DEFAULT NULL,
  `t_part_active` varchar(255) DEFAULT NULL,
  `date_create` varchar(255) DEFAULT NULL,
  `date_modi` varchar(255) DEFAULT NULL,
  `date_cancel` varchar(255) DEFAULT NULL,
  `user_create` varchar(255) DEFAULT NULL,
  `user_modi` varchar(255) DEFAULT NULL,
  `user_cancel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_part`
--

LOCK TABLES `t_part` WRITE;
/*!40000 ALTER TABLE `t_part` DISABLE KEYS */;
INSERT INTO `t_part` VALUES ('tpa101508056','','ps1478463775','','1','1','2014-12-10 20:30:07','','',NULL,NULL,NULL),('tpa1017108914','','ps1623536705','','1','1','2014-12-10 20:45:19','','',NULL,NULL,NULL),('tpa1038599872','1','1','','1','1','2014-12-14 11:08:21','','',NULL,NULL,NULL),('tpa1041587130','pa316171681','1','','1','1','2014-12-14 11:07:26','','',NULL,NULL,NULL),('tpa1045123411','','ps274595483','','1','1','2014-12-10 20:50:21','','',NULL,NULL,NULL),('tpa1045368825','','ps274840897','','1','1','2014-12-10 21:09:33','','',NULL,NULL,NULL),('tpa1052471530','pa777689678','1','','1','1','2014-12-14 10:58:05','','',NULL,NULL,NULL),('tpa1065355857','pa886799184','1','','1','1','2014-12-14 11:01:19','','',NULL,NULL,NULL),('tpa1065459176','pa1492477528','1','','1','1','2014-12-14 11:10:17','','',NULL,NULL,NULL),('tpa1077405496','pa1029828342','1','','1','1','2014-12-14 11:43:25','','',NULL,NULL,NULL),('tpa1079876159','pa777689678','ps660720122','','1','1','2014-12-14 10:57:44','','',NULL,NULL,NULL),('tpa1088680117','pa1330791096','1','','1','1','2014-12-14 11:26:40','','',NULL,NULL,NULL),('tpa1091589823','pa2075097816','1','','1','1','2014-12-14 11:23:11','','',NULL,NULL,NULL),('tpa110569200','pa1386835811','1','','1','1','2014-12-14 11:06:48','','',NULL,NULL,NULL),('tpa1125164532','','ps1731592323','','1','1','2014-12-10 11:33:47','','',NULL,NULL,NULL),('tpa1131369769','pa1386835811','ps712213732','','1','1','2014-12-14 11:49:52','','',NULL,NULL,NULL),('tpa1140043968','','ps1491415859','','1','1','2014-12-10 19:30:59','','',NULL,NULL,NULL),('tpa1142639413','pa1688205878','ps723483376','','1','1','2014-12-14 21:31:15','','',NULL,NULL,NULL),('tpa115634188','pa1918233670','1','','1','1','2014-12-14 11:04:25','','',NULL,NULL,NULL),('tpa1156658143','pa2057184565','1','','1','1','2014-12-14 11:33:05','','',NULL,NULL,NULL),('tpa1158721652','pa1823775725','ps1510093543','','1','1','2014-12-14 17:25:47','','',NULL,NULL,NULL),('tpa1164384711','pa73041507','1','','1','1','2014-12-14 11:44:52','','',NULL,NULL,NULL),('tpa1164477984','pa967160467','1','','1','1','2014-12-14 11:05:29','','',NULL,NULL,NULL),('tpa1186105675','','ps415577747','','1','1','2014-12-10 20:59:31','','',NULL,NULL,NULL),('tpa1197452687','','ps778296650','','1','1','2014-12-14 17:04:51','','',NULL,NULL,NULL),('tpa1200592625','','ps1551964516','','1','1','2014-12-10 19:40:59','','',NULL,NULL,NULL),('tpa1208092885','1','1','','1','1','2014-12-14 10:47:17','','',NULL,NULL,NULL),('tpa1215338671','pa1598925705','1','','1','1','2014-12-14 11:09:00','','',NULL,NULL,NULL),('tpa1215351680','pa73041507','1','','1','1','2014-12-14 11:03:54','','',NULL,NULL,NULL),('tpa123263847','','ps474635738','','1','1','2014-12-10 20:16:32','','',NULL,NULL,NULL),('tpa123842971','','ps730270762','','1','1','2014-12-10 11:29:14','','',NULL,NULL,NULL),('tpa1238947096','pa2047718574','1','','1','1','2014-12-16 13:50:59','','',NULL,NULL,NULL),('tpa1242735611','pa1062386677','ps472207683','','1','1','2014-12-14 21:43:38','','',NULL,NULL,NULL),('tpa1245424550','','ps826268513','','1','1','2014-12-10 20:10:24','','',NULL,NULL,NULL),('tpa1260425383','','ps841269346','','1','1','2014-12-10 20:13:28','','',NULL,NULL,NULL),('tpa1291790000','pa153641384','ps102106035','','1','1','2014-12-14 21:57:35','','',NULL,NULL,NULL),('tpa1299094299','pa1193620444','ps879938262','','1','1','2014-12-14 17:12:56','','',NULL,NULL,NULL),('tpa1305465317','pa1925906861','ps534937389','','1','1','2014-12-14 22:01:08','','',NULL,NULL,NULL),('tpa1305524791','pa1760922094','1','','1','1','2014-12-14 11:22:20','','',NULL,NULL,NULL),('tpa1310160531','pa1664751412','1','','1','1','2014-12-14 11:42:41','','',NULL,NULL,NULL),('tpa1310231355','pa2047718574','ps891075318','','1','1','2014-12-14 16:47:46','','',NULL,NULL,NULL),('tpa1333096321','pa569491213','ps562568393','','1','1','2014-12-14 17:11:02','','',NULL,NULL,NULL),('tpa1333273176','pa921039959','ps562745248','','1','1','2014-12-14 21:48:16','','',NULL,NULL,NULL),('tpa134387000','pa1116788873','1','','1','1','2014-12-14 11:33:42','','',NULL,NULL,NULL),('tpa1362205141','pa1664751412','1','','1','1','2014-12-14 11:02:16','','',NULL,NULL,NULL),('tpa1368171717','pa1733557361','ps949015680','','1','1','2014-12-14 21:52:00','','',NULL,NULL,NULL),('tpa1383616148','','ps1734988039','','1','1','2014-12-10 19:50:03','','',NULL,NULL,NULL),('tpa1392142264','pa1333372859','1','','1','1','2014-12-14 11:00:44','','',NULL,NULL,NULL),('tpa1403646578','pa215036869','1','','1','1','2014-12-14 11:45:07','','',NULL,NULL,NULL),('tpa1411621272','1','1','','1','1','2014-12-14 11:39:15','','',NULL,NULL,NULL),('tpa1414607318','pa164062027','ps1765979209','','1','1','2014-12-14 17:27:22','','',NULL,NULL,NULL),('tpa1416075180','pa1310601325','ps996919143','','1','1','2014-12-14 17:20:31','','',NULL,NULL,NULL),('tpa1416582690','pa794527804','1','','1','1','2014-12-14 11:44:31','','',NULL,NULL,NULL),('tpa1416625415','','ps646097487','','1','1','2014-12-10 21:15:20','','',NULL,NULL,NULL),('tpa1422128209','pa526431971','1','','1','1','2014-12-14 11:48:48','','',NULL,NULL,NULL),('tpa1432144569','pa1278700627','1','','1','1','2014-12-14 11:03:23','','',NULL,NULL,NULL),('tpa1436830882','pa1263572881','ps1369046736','','1','1','2014-12-14 17:08:57','','',NULL,NULL,NULL),('tpa1438466606','pa958449243','ps1019310569','','1','1','2014-12-14 17:18:43','','',NULL,NULL,NULL),('tpa1439303743','','ps1790675634','','1','1','2014-12-10 20:57:10','','',NULL,NULL,NULL),('tpa144103449','pa2035692621','1','','1','1','2014-12-14 11:09:44','','',NULL,NULL,NULL),('tpa144182685','','ps1101982367','','1','1','2014-12-10 11:18:40','','',NULL,NULL,NULL),('tpa1448229704','','ps1029073667','','1','1','2014-12-10 19:59:41','','',NULL,NULL,NULL),('tpa1451958628','','ps1803330519','','1','1','2014-12-10 19:42:40','','',NULL,NULL,NULL),('tpa145484699','','ps1873812309','','1','1','2014-12-10 20:34:57','','',NULL,NULL,NULL),('tpa1472715254','pa967160467','ps2079143045','','1','1','2014-12-14 11:46:58','','',NULL,NULL,NULL),('tpa1488599848','pa1278700627','1','','1','1','2014-12-14 11:44:11','','',NULL,NULL,NULL),('tpa1496322780','','ps1847694671','','1','1','2014-12-10 20:16:55','','',NULL,NULL,NULL),('tpa1498932826','','ps728404898','','1','1','2014-12-10 20:18:18','','',NULL,NULL,NULL),('tpa1501974581','','ps731446653','','1','1','2014-12-10 19:36:43','','',NULL,NULL,NULL),('tpa1513562544','pa1664751412','1','','1','1','2014-12-14 11:42:28','','',NULL,NULL,NULL),('tpa1537115824','','ps766587896','','1','1','2014-12-10 20:36:29','','',NULL,NULL,NULL),('tpa1542714248','pa629190869','ps772186320','','1','1','2014-12-14 21:53:53','','',NULL,NULL,NULL),('tpa1564883315','pa358782440','ps1145727278','','1','1','2014-12-14 22:16:07','','',NULL,NULL,NULL),('tpa1569165504','pa537316371','1','','1','1','2014-12-14 11:05:15','','',NULL,NULL,NULL),('tpa1578718909','pa1098701546','ps1159562872','','1','1','2014-12-14 21:27:45','','',NULL,NULL,NULL),('tpa1580140214','pa933897399','1','','1','1','2014-12-14 11:09:58','','',NULL,NULL,NULL),('tpa1598477038','pa1118086608','1','','1','1','2014-12-14 11:40:16','','',NULL,NULL,NULL),('tpa1610538762','','ps1961910653','','1','1','2014-12-10 20:01:23','','',NULL,NULL,NULL),('tpa1613976480','pa1627990233','ps1194820443','','1','1','2014-12-14 22:31:21','','',NULL,NULL,NULL),('tpa1620783223','pa983756656','ps1201627186','','1','1','2014-12-14 22:10:52','','',NULL,NULL,NULL),('tpa1627420733','','ps1978792624','','1','1','2014-12-10 20:33:25','','',NULL,NULL,NULL),('tpa1632517836','pa777689678','1','','1','1','2014-12-14 11:39:38','','',NULL,NULL,NULL),('tpa1636988426','pa526431971','1','','1','1','2014-12-14 11:06:32','','',NULL,NULL,NULL),('tpa1645098867','','ps1996470758','','1','1','2014-12-10 20:08:42','','',NULL,NULL,NULL),('tpa1698834371','pa207862960','1','','1','1','2014-12-14 11:29:53','','',NULL,NULL,NULL),('tpa1723476458','pa428318638','ps952948530','','1','1','2014-12-14 22:29:44','','',NULL,NULL,NULL),('tpa1742004805','pa1822747696','1','','1','1','2014-12-14 11:43:08','','',NULL,NULL,NULL),('tpa1774280542','pa479801082','1','','1','1','2014-12-14 11:34:00','','',NULL,NULL,NULL),('tpa1791458788','','ps2142830679','','1','1','2014-12-10 20:05:32','','',NULL,NULL,NULL),('tpa1801143795','','ps1381987758','','1','1','2014-12-10 21:05:27','','',NULL,NULL,NULL),('tpa1804191898','pa91649512','1','','1','1','2014-12-14 11:26:04','','',NULL,NULL,NULL),('tpa1833162731','pa650401586','ps292106875','','1','1','2014-12-14 21:25:58','','',NULL,NULL,NULL),('tpa1848808125','','ps1078280197','','1','1','2014-12-10 21:12:12','','',NULL,NULL,NULL),('tpa1849833981','','ps1430677944','','1','1','2014-12-10 21:16:35','','',NULL,NULL,NULL),('tpa1856666491','','ps1086138563','','1','1','2014-12-10 21:02:29','','',NULL,NULL,NULL),('tpa1882744367','1','1','','1','1','2014-12-14 10:56:16','','',NULL,NULL,NULL),('tpa1884796079','pa923599812','1','','1','1','2014-12-14 11:05:02','','',NULL,NULL,NULL),('tpa189467690','pa442156075','1','','1','1','2014-12-14 11:41:58','','',NULL,NULL,NULL),('tpa1896468506','pa1386835811','1','','1','1','2014-12-14 11:49:26','','',NULL,NULL,NULL),('tpa1904590719','1','1','','1','1','2014-12-14 10:40:09','','',NULL,NULL,NULL),('tpa1917226920','pa1808077359','1','','1','1','2014-12-14 11:01:02','','',NULL,NULL,NULL),('tpa1919704917','pa1333372859','1','','1','1','2014-12-14 11:40:30','','',NULL,NULL,NULL),('tpa1928661714','pa1396940889','ps1158133786','','1','1','2014-12-14 21:35:53','','',NULL,NULL,NULL),('tpa1936315866','ps1879234998','ps395260010','','1','1','2014-12-12 09:12:13','','',NULL,NULL,NULL),('tpa1961330188','pa886799184','1','','1','1','2014-12-14 11:41:25','','',NULL,NULL,NULL),('tpa1974694085','','ps785010120','','1','1','2014-12-14 17:23:45','','',NULL,NULL,NULL),('tpa1978333911','pa794527804','1','','1','1','2014-12-14 11:03:38','','',NULL,NULL,NULL),('tpa1995035011','pa2060745627','1','','1','1','2014-12-14 11:24:09','','',NULL,NULL,NULL),('tpa2008258025','pa170902410','1','','1','1','2014-12-14 11:07:12','','',NULL,NULL,NULL),('tpa2021678868','','ps1251150940','','1','1','2014-12-10 20:26:12','','',NULL,NULL,NULL),('tpa2032984392','pa550554818','ps1613828355','','1','1','2014-12-14 17:07:05','','',NULL,NULL,NULL),('tpa2051646894','pa82109024','ps1632490857','','1','1','2014-12-14 17:22:18','','',NULL,NULL,NULL),('tpa2069113254','','ps1649957217','','1','1','2014-12-10 19:48:25','','',NULL,NULL,NULL),('tpa2069893696','','ps273781940','','1','1','2014-12-10 19:33:37','','',NULL,NULL,NULL),('tpa2082585226','ps1879234998','1','','1','1','2014-12-12 09:11:35','','',NULL,NULL,NULL),('tpa2089685624','','ps548629768','','1','1','2014-12-10 19:45:33','','',NULL,NULL,NULL),('tpa2098737708','pa835971953','ps1328209780','','1','1','2014-12-10 19:56:51','','',NULL,NULL,NULL),('tpa2103195001','pa1271805747','ps1684038964','','1','1','2014-12-14 17:33:46','','',NULL,NULL,NULL),('tpa2104061988','pa1579432096','ps1684905951','','1','1','2014-12-14 21:42:07','','',NULL,NULL,NULL),('tpa2140022449','pa1660005086','ps1720866412','','1','1','2014-12-14 22:28:21','','',NULL,NULL,NULL),('tpa2143136687','pa1029828342','1','','1','1','2014-12-14 11:02:52','','',NULL,NULL,NULL),('tpa22132420','pa1214606378','1','','1','1','2014-12-14 11:43:56','','',NULL,NULL,NULL),('tpa245016153','pa1918233670','1','','1','1','2014-12-14 11:45:24','','',NULL,NULL,NULL),('tpa250625542','pa1845821987','ps1978953152','','1','1','2014-12-10 19:24:53','','',NULL,NULL,NULL),('tpa252355212','pa1171533839','1','','1','1','2014-12-14 11:27:46','','',NULL,NULL,NULL),('tpa258500302','pa208736675','1','','1','1','2014-12-14 11:05:43','','',NULL,NULL,NULL),('tpa291323721','pa1031252873','ps2019651331','','1','1','2014-12-14 22:17:37','','',NULL,NULL,NULL),('tpa309713671','','ps2038041281','','1','1','2014-12-10 21:06:54','','',NULL,NULL,NULL),('tpa31094194','pa886799184','1','','1','1','2014-12-14 11:41:10','','',NULL,NULL,NULL),('tpa312867805','pa191262914','1','','1','1','2014-12-14 10:59:39','','',NULL,NULL,NULL),('tpa321209059','pa1869187735','ps672580950','','1','1','2014-12-14 22:19:54','','',NULL,NULL,NULL),('tpa326963059','','ps1703918778','','1','1','2014-12-10 20:31:42','','',NULL,NULL,NULL),('tpa365663099','','ps1323462781','','1','1','2014-12-10 11:34:41','','',NULL,NULL,NULL),('tpa367485791','pa1564092576','ps2095813401','','1','1','2014-12-14 21:59:14','','',NULL,NULL,NULL),('tpa368510527','','ps1745466246','','1','1','2014-12-10 20:46:40','','',NULL,NULL,NULL),('tpa36959043','','ps1765286653','','1','1','2014-12-10 20:28:10','','',NULL,NULL,NULL),('tpa37713718','','ps389085609','','1','1','2014-12-10 20:06:58','','',NULL,NULL,NULL),('tpa390747100','','ps1767702819','','1','1','2014-12-10 20:23:08','','',NULL,NULL,NULL),('tpa391486054','','ps2119813664','','1','1','2014-12-10 20:43:52','','',NULL,NULL,NULL),('tpa404684421','pa1376497856','ps756056312','','1','1','2014-12-14 21:37:29','','',NULL,NULL,NULL),('tpa405960919','pa923599812','1','','1','1','2014-12-14 11:46:19','','',NULL,NULL,NULL),('tpa409630369','pa955196834','ps1786586088','','1','1','2014-12-14 22:08:06','','',NULL,NULL,NULL),('tpa421925777','pa285273245','1','','1','1','2014-12-14 11:09:15','','',NULL,NULL,NULL),('tpa429317607','','ps1035745398','','1','1','2014-12-10 21:10:44','','',NULL,NULL,NULL),('tpa46677916','pa1901415954','ps1423633635','','1','1','2014-12-14 17:32:17','','',NULL,NULL,NULL),('tpa477711714','pa611213075','ps58555677','','1','1','2014-12-14 22:23:28','','',NULL,NULL,NULL),('tpa478648852','','ps478648852','','1','1','2014-12-10 20:20:00','','',NULL,NULL,NULL),('tpa486594816','','ps1863550535','','1','1','2014-12-10 21:01:11','','',NULL,NULL,NULL),('tpa493772110','pa835971953','1','','1','1','2014-12-14 11:45:43','','',NULL,NULL,NULL),('tpa505296094','','ps86140057','','1','1','2014-12-10 21:17:41','','',NULL,NULL,NULL),('tpa514897586','pa402332798','ps1121325377','','1','1','2014-12-14 21:50:13','','',NULL,NULL,NULL),('tpa515941403','pa2047718574','1','','1','1','2014-12-16 13:47:30','','',NULL,NULL,NULL),('tpa54759853','pa1496555436','1','','1','1','2014-12-14 11:09:30','','',NULL,NULL,NULL),('tpa553207313','pa1118086608','1','','1','1','2014-12-14 11:00:26','','',NULL,NULL,NULL),('tpa564861503','pa1461799859','ps145705466','','1','1','2014-12-14 22:04:42','','',NULL,NULL,NULL),('tpa589314265','','ps1898485838','','1','1','2014-12-10 11:26:28','','',NULL,NULL,NULL),('tpa604343381','','ps1981299100','','1','1','2014-12-10 20:42:27','','',NULL,NULL,NULL),('tpa617240717','','ps968612608','','1','1','2014-12-10 20:40:35','','',NULL,NULL,NULL),('tpa640757620','pa1239956583','1','','1','1','2014-12-14 11:06:00','','',NULL,NULL,NULL),('tpa646751806','','ps1253179597','','1','1','2014-12-10 19:51:44','','',NULL,NULL,NULL),('tpa648992170','','ps229836133','','1','1','2014-12-10 11:37:12','','',NULL,NULL,NULL),('tpa662685222','','ps1014057113','','1','1','2014-12-10 20:38:33','','',NULL,NULL,NULL),('tpa663634897','pa2054604369','ps2040590616','','1','1','2014-12-14 21:40:43','','',NULL,NULL,NULL),('tpa671533631','','ps2048489350','','1','1','2014-12-10 19:38:31','','',NULL,NULL,NULL),('tpa675348561','pa1848615616','ps256192524','','1','1','2014-12-14 22:06:11','','',NULL,NULL,NULL),('tpa697993341','pa101544120','1','','1','1','2014-12-14 11:31:59','','',NULL,NULL,NULL),('tpa705603581','pa191262914','1','','1','1','2014-12-14 11:39:55','','',NULL,NULL,NULL),('tpa706178622','','ps1312606413','','1','1','2014-12-10 21:13:33','','',NULL,NULL,NULL),('tpa707075141','','ps1784362431','','1','1','2014-12-10 21:19:12','','',NULL,NULL,NULL),('tpa714668674','pa923599812','1','','1','1','2014-12-14 11:46:07','','',NULL,NULL,NULL),('tpa721113675','pa1822747696','1','','1','1','2014-12-14 11:02:36','','',NULL,NULL,NULL),('tpa721607215','pa215036869','1','','1','1','2014-12-14 11:04:09','','',NULL,NULL,NULL),('tpa726827056','pa204436408','1','','1','1','2014-12-14 11:23:30','','',NULL,NULL,NULL),('tpa747381440','pa491989314','ps2124337159','','1','1','2014-12-14 21:23:53','','',NULL,NULL,NULL),('tpa749535351','','ps1707335033','','1','1','2014-12-10 20:24:39','','',NULL,NULL,NULL),('tpa761464713','pa136936201','1','','1','1','2014-12-14 11:33:23','','',NULL,NULL,NULL),('tpa762077293','pa442156075','1','','1','1','2014-12-14 11:01:57','','',NULL,NULL,NULL),('tpa779504589','pa1857692347','1','','1','1','2014-12-14 11:31:43','','',NULL,NULL,NULL),('tpa78440627','pa811278846','ps684868418','','1','1','2014-12-14 22:12:38','','',NULL,NULL,NULL),('tpa814384024','','ps1165755915','','1','1','2014-12-10 20:21:45','','',NULL,NULL,NULL),('tpa851666554','pa835971953','1','','1','1','2014-12-14 11:04:46','','',NULL,NULL,NULL),('tpa855868320','pa1281947177','ps436712283','','1','1','2014-12-14 21:29:23','','',NULL,NULL,NULL),('tpa862615497','pa1214606378','1','','1','1','2014-12-14 11:03:06','','',NULL,NULL,NULL),('tpa866358416','','ps95830488','','1','1','2014-12-10 21:03:56','','',NULL,NULL,NULL),('tpa86976116','pa864426864','ps1815303726','','1','1','2014-12-14 21:39:10','','',NULL,NULL,NULL),('tpa879684749','','ps460528712','','1','1','2014-12-10 20:55:57','','',NULL,NULL,NULL),('tpa896309668','pa252192168','ps477153631','','1','1','2014-12-14 22:14:15','','',NULL,NULL,NULL),('tpa896759363','pa1746192442','1','','1','1','2014-12-14 11:28:02','','',NULL,NULL,NULL),('tpa911720459','pa274693892','ps492564422','','1','1','2014-12-14 17:02:15','','',NULL,NULL,NULL),('tpa914576880','pa1386835811','ps144048952','','1','1','2014-12-14 11:50:23','','',NULL,NULL,NULL),('tpa925842441','','ps506686404','','1','1','2014-12-10 21:08:16','','',NULL,NULL,NULL),('tpa950916304','pa1428698623','ps883132158','','1','1','2014-12-14 17:29:56','','',NULL,NULL,NULL),('tpa958295351','pa17735746','1','','1','1','2014-12-14 11:24:31','','',NULL,NULL,NULL),('tpa962822795','pa969745615','ps192294867','','1','1','2014-12-14 21:34:04','','',NULL,NULL,NULL),('tpa969020723','','ps1320392614','','1','1','2014-12-14 17:35:55','','',NULL,NULL,NULL),('tpa985182106','','ps566026069','','1','1','2014-12-10 11:39:13','','',NULL,NULL,NULL),('tpa987594127','pa208736675','1','','1','1','2014-12-14 11:48:02','','',NULL,NULL,NULL),('tpa995524817','pa897141895','ps224996889','','1','1','2014-12-14 21:55:38','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_part_receive_item`
--

DROP TABLE IF EXISTS `t_part_receive_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_part_receive_item` (
  `rec_item_id` varchar(255) NOT NULL,
  `rec_id` varchar(255) DEFAULT NULL,
  `part_id` varchar(255) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `rec_item_active` varchar(255) DEFAULT NULL,
  `rec_item_remark` varchar(255) DEFAULT NULL,
  `price_sale` int(11) DEFAULT NULL,
  `price_cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_part_receive_item`
--

LOCK TABLES `t_part_receive_item` WRITE;
/*!40000 ALTER TABLE `t_part_receive_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_part_receive_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-17 17:20:53
