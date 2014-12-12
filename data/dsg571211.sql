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
  `price_cost` varchar(255) DEFAULT NULL,
  `price_sale` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part`
--

LOCK TABLES `b_part` WRITE;
/*!40000 ALTER TABLE `b_part` DISABLE KEYS */;
INSERT INTO `b_part` VALUES ('pa101544120','01-AV-AA-055','46660-1100','','','N/A','Com/Nav  28V','Model : Aircraft Radio RT-385A ','','','General','','นำมาจากเครื่อง HS-BSE ซึ่งติดมากับเครือง','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1029828342','01-AV-AA-012','066-1088-00','','','','DME','Model : Bendix/king KN 64 with R&C','','','General','','Register BSH  Bennett Avionics No.19575T+freight','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1116788873','01-AV-AA-060','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1118086608','01-AV-AA-004','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','',' (ยังไม่จดทะเบียน)','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1156830401','01-AV-AA-002','069-01032-0101','','','N/A','Com/Nav  28V','Model :Bendix/King KX 155A/with Glideslope','','','General','','Register HS-BSH','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1162155826','01-AV-AA-057','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','INV.3515 DATE 30 JUN 2013','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1171533839','01-AV-AA-046','066-1055-52','','','N/A','Audio Panel','Model:King KMA 24 H','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1214606378','01-AV-AA-013','IC-A110-05B, AV1','','','N/A','Radio Icom America  IC-A110','with antenna','','','Ground','','Gulf-Coast , Aviation 2/3/10','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1239956583','01-AV-AA-024','030572','','','N/A','Cooling Fan (Comair Rotron)','Model : MC24B3 24V,28A,67W','','','General','','HS-BSL = 1','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1278700627','01-AV-AA-014','41420-1128','','','N/A',' Cooling fan 24 V','Model : Aircraft Radio RT-359A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1282746842','01-AV-AA-062','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1330791096','01-AV-AA-044','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','19-9-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1333372859','01-AV-AA-005','069-1024-05','46314','','N/A','Com/Nav  28V','Model : Bendix/King KX 155','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa136936201','01-AV-AA-059','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1386835811','01-AV-AA-026','11-07309','','','N/A','11-07309','-','','','General','','AS701577+Fright','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1492477528','01-AV-AA-035','-','','','N/A','Transponder','Model : Aircraft Radio RT-359A','','','General','','From 172P S/N.17275441Register BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1496555436','01-AV-AA-032','11922','','','N/A','Audio Panel ','Model : PM 1000 II','','','General','','14-04-13 HS-BSE คุณตุ๊','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1566491901','01-AV-AA-063','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1598925705','01-AV-AA-030','065-00180-2700','','','N/A','Trim Servo','Model : BENDIX/KING KS 272C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1642889339','01-AV-AA-036','C58911-0117','','','N/A','ELT','Model : DM ELT 6.1','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1664751412','01-AV-AA-010','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','19-9-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa170902410','01-AV-AA-027','FN-300','','','N/A','Cooling Fan (Big)','-','','','General','','28-2-13 ช่างสิทธิ์ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1746192442','01-AV-AA-047','066-1055-52','','','N/A','Audio Panel','Model:King KMA 24 H','','','General','','28-11-12 ส่งคุณธีระยุทธทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1760922094','01-AV-AA-037','066-01151-0101','','','N/A','GPS','Model : Bendix/King KLN 35A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa17735746','01-AV-AA-041','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1808077359','01-AV-AA-006','069-1025-025','','','N/A','Com/Nav  28 V','Model : Bendix/king KX165I ','','','General','','Register HS-BSK','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1822747696','01-AV-AA-011','066-1055-03','','','N/A','Audio Panel ','Model : KING KMA 24 ','','','General','','คุณนพพร','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1845821987','01-AV-H-001','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A/No Glideslope','','','General','','Register HS-BSI / AERO-SERVICE  No.Ebay-170536928480','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1848536944','01-AV-AA-045','069-01032-0201','','','N/A','Com / Nav','Model:Bendix/King KX-155A','','','General','','20-12-12 คุณตุ๊ยืมทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1857692347','01-AV-AA-054','-','','','N/A','Altitude Reporter','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa191262914','01-AV-AA-003','069-01032-0101','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa1918233670','01-AV-AA-018','069-01032-0201','','','N/A','Com/Nav  28V','Model : Bendix/King KX 155A ','','','General','','Register HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2026627528','01-AV-AA-029','065-00178-2200','','','N/A','Pitch Servo','Model : BENDIX/KING KS 270C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2035692621','01-AV-AA-033','-','','','N/A','Altitude Digitizer Encoder','Model:Altitude SSD120-XXA','','','General','','12-1-13 ส่งคุณธีรยุทธทดสอบ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa204436408','01-AV-AA-039','2000-021-009','','','N/A','Strike Finder','Model : SF200','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2057184565','01-AV-AA-058','AK-350-232-1','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2060745627','01-AV-AA-040','VR515GA','','','N/A','Voltage Regulator','Model : VR515GA','','','General','','Yingling Aviation No.822_7 June 201123-1-13 ช่างสิทธิ์ยืมทดสอบ HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2070056134','01-AV-AA-052','AT1900 REV','','','N/A','Transponder','Model : MX385','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2075097816','01-AV-AA-038','42410-512828','','','N/A','Receiver','Model : R-402A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa207862960','01-AV-AA-050','46660-10008','','','N/A','Com/Nav','Model :  Radio RT-385A','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa208736675','01-AV-AA-023','01-077006-17','','','N/A','Power Supply','Model : 7000617','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa2107709528','01-AV-AA-042','70-2400','','','N/A','Ryan TCAD Air Traffic Shield','Type : 9900B Processor','','','General','','','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa213979571','01-AV-AA-056','066-01156-0201','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa215036869','01-AV-AA-017','11-18381','','','N/A','Cyclone 21-3 Port',' Cooling fan 24 V','','','-','','AS701577+Frieght','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa261840242','01-AV-AA-051','066-01156-0101','','','N/A','Transponder','Model : Bendix/king KT 76C','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa285273245','01-AV-AA-031',' 065-00179-0100','','','N/A','Primary Servo (Roll Servo)','Model : BENDIX/KING KS 271C','','','C172','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa316171681','01-AV-AA-028','1570301-4','','','N/A','Dimmer','-','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa383121139','01-AV-AA-048','066-4009-00','','','N/A','Localizer Converter','Model:King KN72 VOR','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa442156075','01-AV-AA-009','066-1055-03','','','N/A','Audio Panel  with R&C','Model : KING KMA 24 ','','','General','','Bennett Avionics ','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa479801082','01-AV-AA-061','-','','','N/A','Altitude Encoder (Reporter)','Model: AK-350','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa526431971','01-AV-AA-025','46660-1000','','','N/A','Com/Nav','Model :  Radio RT-385A','','','General','','From 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa537316371','01-AV-AA-021','066-04035-1301','','','N/A','GPS ','Model : BENDIX/KING KMD 540 MFD','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa654384850','01-AV-AA-049','ACF328','','','N/A','SANDIA AEROSPACE พัดลม','Model: ACF 328','','','General','','ช่างสิทธิ์ 25-06-13','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa670086112','01-AV-AA-053','066-1072-14','','','N/A','ADF RECEIVER','Model : Bendix/king KR87','','','General','','ไม่มีใบแจ้งหนี้','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa73041507','01-AV-AA-016','-','','','N/A','01-AV-AA-016','-','','','General','','HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa777689678','01-AV-AA-002','069-01032-0101','','','N/A','Com/Nav  28V','Model :Bendix/King KX 155A/with Glideslope','','','General','','Register HS-BSH','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa794527804','01-AV-AA-015','066-1062-00','','','N/A','Transponder','Model : Bendix/king KT 76A','','','General','','Register BSH','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa835971953','01-AV-AA-019','069-01034-0101','','','N/A','GPS ','Model : Bendix/King KLN 94 TSO','','','General','','กทชระบุใน HS-DSG (เสีย)','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa886799184','01-AV-AA-007','46660-1100','','','N/A','Com/Nav  28V','Model : Aircraft Radio RT-385A ','','','General','','Register HS-BSF','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa91649512','01-AV-AA-043','70-2500','','','N/A','Monitor Ryan TCAD Air Traffic Shield','Type : Ryan TCAD 9990B ','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa923599812','01-AV-AA-020','41240-0001','','','N/A','ADF','Model : Aircraft Radio R-546E','','','General','','Register HS-BSKFrom 172P S/N.17275441','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa933897399','01-AV-AA-034','065-00176-7703 047-10881-0001','','','N/A','Auto Pilot(Flight Control Computer)','Model : Bendix/King KAP 140','','','C172','','Installed HS-DSG','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL),('pa967160467','01-AV-AA-022','01-077006-17','','','N/A','Power Supply','Model : 7000617','','','General','','-','','','','','','1316463529','อะไหล่เครื่องบิน','pt1729349247','Avionics','','','','1',NULL,'','','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL);
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
  `price_cost` varchar(255) DEFAULT NULL,
  `price_sale` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`part_serial_no_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_serial_no`
--

LOCK TABLES `b_part_serial_no` WRITE;
/*!40000 ALTER TABLE `b_part_serial_no` DISABLE KEYS */;
INSERT INTO `b_part_serial_no` VALUES ('ps1014057113',NULL,'H-L050004','','1','$277.49','$277.49','','','','1','1','2014-12-10 20:38:33',NULL,NULL,NULL,NULL,NULL,NULL),('ps1029073667',NULL,'33723','','1','$595.00','$595.00','','','','1','1','2014-12-10 19:59:41',NULL,NULL,NULL,NULL,NULL,NULL),('ps1035745398',NULL,'13475','','1','-','-','','','','1','1','2014-12-10 21:10:44',NULL,NULL,NULL,NULL,NULL,NULL),('ps1078280197',NULL,'43785','','1','$49.99','$49.99','','','','1','1','2014-12-10 21:12:12',NULL,NULL,NULL,NULL,NULL,NULL),('ps1086138563',NULL,'3203','','1','-','-','','','','1','1','2014-12-10 21:02:29',NULL,NULL,NULL,NULL,NULL,NULL),('ps1101982367',NULL,'24243','','1','$2,995.00','$2,995.00','','','','1','1','2014-12-10 11:18:40',NULL,NULL,NULL,NULL,NULL,NULL),('ps1165755915',NULL,'5196','','1','$1,907.00','$1,907.00','','','','1','1','2014-12-10 20:21:45',NULL,NULL,NULL,NULL,NULL,NULL),('ps1251150940',NULL,'A 40515','','1','$250.00','$250.00','','','','1','1','2014-12-10 20:26:12',NULL,NULL,NULL,NULL,NULL,NULL),('ps1253179597',NULL,'20606','','1','$3,795.00','$3,795.00','','','','1','1','2014-12-10 19:51:44',NULL,NULL,NULL,NULL,NULL,NULL),('ps1312606413',NULL,'3513947','','1','$250.00','$250.00','','','','1','1','2014-12-10 21:13:33',NULL,NULL,NULL,NULL,NULL,NULL),('ps1323462781',NULL,'46314','','1','$2,295.00','$2,295.00','','','','1','1','2014-12-10 11:34:41',NULL,NULL,NULL,NULL,NULL,NULL),('ps1328209780',NULL,'3269','','1','$3,595.00','$3,595.00','','','pa835971953','1','1','2014-12-10 19:56:51',NULL,NULL,NULL,NULL,NULL,NULL),('ps1381987758',NULL,'69514','','1','-','-','','','','1','1','2014-12-10 21:05:27',NULL,NULL,NULL,NULL,NULL,NULL),('ps1430677944',NULL,'3509243','','1','$250.00','$250.00','','','','1','1','2014-12-10 21:16:35',NULL,NULL,NULL,NULL,NULL,NULL),('ps1478463775',NULL,'28930','','1','$675.00','$675.00','','','','1','1','2014-12-10 20:30:07',NULL,NULL,NULL,NULL,NULL,NULL),('ps1491415859',NULL,'10195','','1','$716.00','$716.00','','','','1','1','2014-12-10 19:30:59',NULL,NULL,NULL,NULL,NULL,NULL),('ps1551964516',NULL,'523022/67130','','1','$961.93','$961.93','','','','1','1','2014-12-10 19:40:59',NULL,NULL,NULL,NULL,NULL,NULL),('ps1623536705',NULL,'-','','1','$600.00','$600.00','','','','1','1','2014-12-10 20:45:19',NULL,NULL,NULL,NULL,NULL,NULL),('ps1649957217',NULL,'6015714','','1','$216.00','$216.00','','','','1','1','2014-12-10 19:48:25',NULL,NULL,NULL,NULL,NULL,NULL),('ps1703918778',NULL,'51995','','1','-','-','','','','1','1','2014-12-10 20:31:42',NULL,NULL,NULL,NULL,NULL,NULL),('ps1707335033',NULL,'K13264','','1','$309.95','$309.95','','','','1','1','2014-12-10 20:24:39',NULL,NULL,NULL,NULL,NULL,NULL),('ps1731592323',NULL,'46314','','1','$2,295.00','$2,295.00','','','','1','1','2014-12-10 11:33:47',NULL,NULL,NULL,NULL,NULL,NULL),('ps1734988039',NULL,'003-009527','','1','$170.26','$170.26','','','','1','1','2014-12-10 19:50:03',NULL,NULL,NULL,NULL,NULL,NULL),('ps1745466246',NULL,'12479','','1','-','-','','','','1','1','2014-12-10 20:46:40',NULL,NULL,NULL,NULL,NULL,NULL),('ps1765286653',NULL,'5925','','1','$2,300.00','$2,300.00','','','','1','1','2014-12-10 20:28:10',NULL,NULL,NULL,NULL,NULL,NULL),('ps1767702819',NULL,'7409','','1','$1,860.00','$1,860.00','','','','1','1','2014-12-10 20:23:08',NULL,NULL,NULL,NULL,NULL,NULL),('ps1784362431',NULL,'28075','','1','$300.00','$300.00','','','','1','1','2014-12-10 21:19:12',NULL,NULL,NULL,NULL,NULL,NULL),('ps1790675634',NULL,'16127','','1','-','-','','','','1','1','2014-12-10 20:57:10',NULL,NULL,NULL,NULL,NULL,NULL),('ps1803330519',NULL,'17195','','1','$795.00','$795.00','','','','1','1','2014-12-10 19:42:40',NULL,NULL,NULL,NULL,NULL,NULL),('ps1847694671',NULL,'N/A','','1','$255.00','$255.00','','','','1','1','2014-12-10 20:16:55',NULL,NULL,NULL,NULL,NULL,NULL),('ps1863550535',NULL,'28543','','1','$595.00','$595.00','','','','1','1','2014-12-10 21:01:11',NULL,NULL,NULL,NULL,NULL,NULL),('ps1873812309',NULL,'22970','','1','$39.99','$39.99','','','','1','1','2014-12-10 20:34:57',NULL,NULL,NULL,NULL,NULL,NULL),('ps1898485838',NULL,'19553','','1','$2,875.00','$2,875.00','','','','1','1','2014-12-10 11:26:28',NULL,NULL,NULL,NULL,NULL,NULL),('ps1961910653',NULL,'6492','','1','$4,900.00','$4,900.00','','','','1','1','2014-12-10 20:01:23',NULL,NULL,NULL,NULL,NULL,NULL),('ps1978792624',NULL,'2336','','1','$1,495.00','$1,495.00','','','','1','1','2014-12-10 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL),('ps1978953152',NULL,'','','1','$300.00','$300.00','','','pa1845821987','1','1','2014-12-10 19:24:53',NULL,NULL,NULL,NULL,NULL,NULL),('ps1981299100',NULL,'971090','','1','-','-','','','','1','1','2014-12-10 20:42:27',NULL,NULL,NULL,NULL,NULL,NULL),('ps1996470758',NULL,'-','','1','$39.60','$39.60','','','','1','1','2014-12-10 20:08:42',NULL,NULL,NULL,NULL,NULL,NULL),('ps2038041281',NULL,'3508026','','1','$250.00','$250.00','','','','1','1','2014-12-10 21:06:54',NULL,NULL,NULL,NULL,NULL,NULL),('ps2048489350',NULL,'25701','','1','$1,916.00','$1,916.00','','','','1','1','2014-12-10 19:38:31',NULL,NULL,NULL,NULL,NULL,NULL),('ps2119813664',NULL,'971090','','1','$500.00','$500.00','','','','1','1','2014-12-10 20:43:52',NULL,NULL,NULL,NULL,NULL,NULL),('ps2142830679',NULL,'00650','','1','$263.95','$263.95','','','','1','1','2014-12-10 20:05:32',NULL,NULL,NULL,NULL,NULL,NULL),('ps229836133',NULL,'60724','','1','$2,095.00','$2,095.00','','','','1','1','2014-12-10 11:37:12',NULL,NULL,NULL,NULL,NULL,NULL),('ps273781940',NULL,'3834','','1','$795.00','$795.00','','','','1','1','2014-12-10 19:33:37',NULL,NULL,NULL,NULL,NULL,NULL),('ps274595483',NULL,'50671','','1','$265.70','$265.70','','','','1','1','2014-12-10 20:50:21',NULL,NULL,NULL,NULL,NULL,NULL),('ps274840897',NULL,'21782','','1','-','-','','','','1','1','2014-12-10 21:09:33',NULL,NULL,NULL,NULL,NULL,NULL),('ps389085609',NULL,'00773','','1','$263.95','$263.95','','','','1','1','2014-12-10 20:06:58',NULL,NULL,NULL,NULL,NULL,NULL),('ps415577747',NULL,'12840','','1','-','-','','','','1','1','2014-12-10 20:59:31',NULL,NULL,NULL,NULL,NULL,NULL),('ps460528712',NULL,'53785','','1','$222.87','$222.87','','','','1','1','2014-12-10 20:55:57',NULL,NULL,NULL,NULL,NULL,NULL),('ps474635738',NULL,'N/A','','1','$255.00','$255.00','','','','1','1','2014-12-10 20:16:32',NULL,NULL,NULL,NULL,NULL,NULL),('ps478648852',NULL,'X5988','','1','$2,480.00','$2,480.00','','','','1','1','2014-12-10 20:20:00',NULL,NULL,NULL,NULL,NULL,NULL),('ps506686404',NULL,'33603','','1','$950.00','$950.00','','','','1','1','2014-12-10 21:08:16',NULL,NULL,NULL,NULL,NULL,NULL),('ps548629768',NULL,'48647','','1','$1,859.00','$1,859.00','','','','1','1','2014-12-10 19:45:33',NULL,NULL,NULL,NULL,NULL,NULL),('ps566026069',NULL,'12729','','1','$950.00','$950.00','','','','1','1','2014-12-10 11:39:13',NULL,NULL,NULL,NULL,NULL,NULL),('ps646097487',NULL,'3522413','','1','$250.00','$250.00','','','','1','1','2014-12-10 21:15:20',NULL,NULL,NULL,NULL,NULL,NULL),('ps728404898',NULL,'N/A','','1','$1,150.07','$1,150.07','','','','1','1','2014-12-10 20:18:18',NULL,NULL,NULL,NULL,NULL,NULL),('ps730270762',NULL,'','','1','$2,495.00','$2,495.00','','','','1','1','2014-12-10 11:29:14',NULL,NULL,NULL,NULL,NULL,NULL),('ps731446653',NULL,'10851','','1','$1,535.00','$1,535.00','','','','1','1','2014-12-10 19:36:43',NULL,NULL,NULL,NULL,NULL,NULL),('ps766587896',NULL,'5283','','1','$2,495.00','$2,495.00','','','','1','1','2014-12-10 20:36:29',NULL,NULL,NULL,NULL,NULL,NULL),('ps826268513',NULL,'21618','','1','$595.00','$595.00','','','','1','1','2014-12-10 20:10:24',NULL,NULL,NULL,NULL,NULL,NULL),('ps841269346',NULL,'N/A','','1','$173.34','$173.34','','','','1','1','2014-12-10 20:13:28',NULL,NULL,NULL,NULL,NULL,NULL),('ps86140057',NULL,'-','','1','-','-','','','','1','1','2014-12-10 21:17:41',NULL,NULL,NULL,NULL,NULL,NULL),('ps95830488',NULL,'2888','','1','-','-','','','','1','1','2014-12-10 21:03:56',NULL,NULL,NULL,NULL,NULL,NULL),('ps968612608',NULL,'26408','','1','$1,430.00','$1,430.00','','','','1','1','2014-12-10 20:40:35',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `t_part` VALUES ('tpa101508056','','ps1478463775','','1','1','2014-12-10 20:30:07','','',NULL,NULL,NULL),('tpa1017108914','','ps1623536705','','1','1','2014-12-10 20:45:19','','',NULL,NULL,NULL),('tpa1045123411','','ps274595483','','1','1','2014-12-10 20:50:21','','',NULL,NULL,NULL),('tpa1045368825','','ps274840897','','1','1','2014-12-10 21:09:33','','',NULL,NULL,NULL),('tpa1125164532','','ps1731592323','','1','1','2014-12-10 11:33:47','','',NULL,NULL,NULL),('tpa1140043968','','ps1491415859','','1','1','2014-12-10 19:30:59','','',NULL,NULL,NULL),('tpa1186105675','','ps415577747','','1','1','2014-12-10 20:59:31','','',NULL,NULL,NULL),('tpa1200592625','','ps1551964516','','1','1','2014-12-10 19:40:59','','',NULL,NULL,NULL),('tpa123263847','','ps474635738','','1','1','2014-12-10 20:16:32','','',NULL,NULL,NULL),('tpa123842971','','ps730270762','','1','1','2014-12-10 11:29:14','','',NULL,NULL,NULL),('tpa1245424550','','ps826268513','','1','1','2014-12-10 20:10:24','','',NULL,NULL,NULL),('tpa1260425383','','ps841269346','','1','1','2014-12-10 20:13:28','','',NULL,NULL,NULL),('tpa1383616148','','ps1734988039','','1','1','2014-12-10 19:50:03','','',NULL,NULL,NULL),('tpa1416625415','','ps646097487','','1','1','2014-12-10 21:15:20','','',NULL,NULL,NULL),('tpa1439303743','','ps1790675634','','1','1','2014-12-10 20:57:10','','',NULL,NULL,NULL),('tpa144182685','','ps1101982367','','1','1','2014-12-10 11:18:40','','',NULL,NULL,NULL),('tpa1448229704','','ps1029073667','','1','1','2014-12-10 19:59:41','','',NULL,NULL,NULL),('tpa1451958628','','ps1803330519','','1','1','2014-12-10 19:42:40','','',NULL,NULL,NULL),('tpa145484699','','ps1873812309','','1','1','2014-12-10 20:34:57','','',NULL,NULL,NULL),('tpa1496322780','','ps1847694671','','1','1','2014-12-10 20:16:55','','',NULL,NULL,NULL),('tpa1498932826','','ps728404898','','1','1','2014-12-10 20:18:18','','',NULL,NULL,NULL),('tpa1501974581','','ps731446653','','1','1','2014-12-10 19:36:43','','',NULL,NULL,NULL),('tpa1537115824','','ps766587896','','1','1','2014-12-10 20:36:29','','',NULL,NULL,NULL),('tpa1610538762','','ps1961910653','','1','1','2014-12-10 20:01:23','','',NULL,NULL,NULL),('tpa1627420733','','ps1978792624','','1','1','2014-12-10 20:33:25','','',NULL,NULL,NULL),('tpa1645098867','','ps1996470758','','1','1','2014-12-10 20:08:42','','',NULL,NULL,NULL),('tpa1791458788','','ps2142830679','','1','1','2014-12-10 20:05:32','','',NULL,NULL,NULL),('tpa1801143795','','ps1381987758','','1','1','2014-12-10 21:05:27','','',NULL,NULL,NULL),('tpa1848808125','','ps1078280197','','1','1','2014-12-10 21:12:12','','',NULL,NULL,NULL),('tpa1849833981','','ps1430677944','','1','1','2014-12-10 21:16:35','','',NULL,NULL,NULL),('tpa1856666491','','ps1086138563','','1','1','2014-12-10 21:02:29','','',NULL,NULL,NULL),('tpa2021678868','','ps1251150940','','1','1','2014-12-10 20:26:12','','',NULL,NULL,NULL),('tpa2069113254','','ps1649957217','','1','1','2014-12-10 19:48:25','','',NULL,NULL,NULL),('tpa2069893696','','ps273781940','','1','1','2014-12-10 19:33:37','','',NULL,NULL,NULL),('tpa2089685624','','ps548629768','','1','1','2014-12-10 19:45:33','','',NULL,NULL,NULL),('tpa2098737708','pa835971953','ps1328209780','','1','1','2014-12-10 19:56:51','','',NULL,NULL,NULL),('tpa250625542','pa1845821987','ps1978953152','','1','1','2014-12-10 19:24:53','','',NULL,NULL,NULL),('tpa309713671','','ps2038041281','','1','1','2014-12-10 21:06:54','','',NULL,NULL,NULL),('tpa326963059','','ps1703918778','','1','1','2014-12-10 20:31:42','','',NULL,NULL,NULL),('tpa365663099','','ps1323462781','','1','1','2014-12-10 11:34:41','','',NULL,NULL,NULL),('tpa368510527','','ps1745466246','','1','1','2014-12-10 20:46:40','','',NULL,NULL,NULL),('tpa36959043','','ps1765286653','','1','1','2014-12-10 20:28:10','','',NULL,NULL,NULL),('tpa37713718','','ps389085609','','1','1','2014-12-10 20:06:58','','',NULL,NULL,NULL),('tpa390747100','','ps1767702819','','1','1','2014-12-10 20:23:08','','',NULL,NULL,NULL),('tpa391486054','','ps2119813664','','1','1','2014-12-10 20:43:52','','',NULL,NULL,NULL),('tpa429317607','','ps1035745398','','1','1','2014-12-10 21:10:44','','',NULL,NULL,NULL),('tpa478648852','','ps478648852','','1','1','2014-12-10 20:20:00','','',NULL,NULL,NULL),('tpa486594816','','ps1863550535','','1','1','2014-12-10 21:01:11','','',NULL,NULL,NULL),('tpa505296094','','ps86140057','','1','1','2014-12-10 21:17:41','','',NULL,NULL,NULL),('tpa589314265','','ps1898485838','','1','1','2014-12-10 11:26:28','','',NULL,NULL,NULL),('tpa604343381','','ps1981299100','','1','1','2014-12-10 20:42:27','','',NULL,NULL,NULL),('tpa617240717','','ps968612608','','1','1','2014-12-10 20:40:35','','',NULL,NULL,NULL),('tpa646751806','','ps1253179597','','1','1','2014-12-10 19:51:44','','',NULL,NULL,NULL),('tpa648992170','','ps229836133','','1','1','2014-12-10 11:37:12','','',NULL,NULL,NULL),('tpa662685222','','ps1014057113','','1','1','2014-12-10 20:38:33','','',NULL,NULL,NULL),('tpa671533631','','ps2048489350','','1','1','2014-12-10 19:38:31','','',NULL,NULL,NULL),('tpa706178622','','ps1312606413','','1','1','2014-12-10 21:13:33','','',NULL,NULL,NULL),('tpa707075141','','ps1784362431','','1','1','2014-12-10 21:19:12','','',NULL,NULL,NULL),('tpa749535351','','ps1707335033','','1','1','2014-12-10 20:24:39','','',NULL,NULL,NULL),('tpa814384024','','ps1165755915','','1','1','2014-12-10 20:21:45','','',NULL,NULL,NULL),('tpa866358416','','ps95830488','','1','1','2014-12-10 21:03:56','','',NULL,NULL,NULL),('tpa879684749','','ps460528712','','1','1','2014-12-10 20:55:57','','',NULL,NULL,NULL),('tpa925842441','','ps506686404','','1','1','2014-12-10 21:08:16','','',NULL,NULL,NULL),('tpa985182106','','ps566026069','','1','1','2014-12-10 11:39:13','','',NULL,NULL,NULL);
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

-- Dump completed on 2014-12-11 17:09:30
