CREATE DATABASE  IF NOT EXISTS `dsg` /*!40100 DEFAULT CHARACTER SET latin1 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_company`
--

LOCK TABLES `b_company` WRITE;
/*!40000 ALTER TABLE `b_company` DISABLE KEYS */;
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
  `depart_name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `depart_parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_department`
--

LOCK TABLES `b_department` WRITE;
/*!40000 ALTER TABLE `b_department` DISABLE KEYS */;
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
  `emp_ssn` varchar(50) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_name_e` varchar(255) DEFAULT NULL,
  `emp_positionp` varchar(255) DEFAULT NULL,
  `depart_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `emp_work_type` varchar(255) DEFAULT NULL,
  `emp_type` varchar(255) DEFAULT NULL,
  `emp_nickname` varchar(255) DEFAULT NULL,
  `emp_password` varchar(255) DEFAULT NULL,
  `emp_privilege` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `emp_active` varchar(255) DEFAULT NULL,
  `emp_holiday` varchar(255) DEFAULT NULL,
  `emp_realday` varchar(255) DEFAULT NULL,
  `emp_timerule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part`
--

LOCK TABLES `b_part` WRITE;
/*!40000 ALTER TABLE `b_part` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_category`
--

LOCK TABLES `b_part_category` WRITE;
/*!40000 ALTER TABLE `b_part_category` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_serial_no`
--

LOCK TABLES `b_part_serial_no` WRITE;
/*!40000 ALTER TABLE `b_part_serial_no` DISABLE KEYS */;
INSERT INTO `b_part_serial_no` VALUES ('1116459785',NULL,'5555','77878','1','22','44','','','1484610169','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'asdfasdfsf');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_type`
--

LOCK TABLES `b_part_type` WRITE;
/*!40000 ALTER TABLE `b_part_type` DISABLE KEYS */;
INSERT INTO `b_part_type` VALUES ('1729349247','01','Avionics','1','(Update 1-4-2013)','10'),('pt1474017427','06','Asset','1','','16'),('pt1502915685','05','Power Plant','1','','15'),('pt1883640598','04','Instruments','1','','14'),('pt2139968270','02','Airframe','1','(Update 1-4-2013)','11'),('pt42397006','03','Hardware','1','','13');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_part_type_sub`
--

LOCK TABLES `b_part_type_sub` WRITE;
/*!40000 ALTER TABLE `b_part_type_sub` DISABLE KEYS */;
INSERT INTO `b_part_type_sub` VALUES ('62688976','01','01-AV-AA','1729349247','1','dddd','10');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_staff`
--

LOCK TABLES `b_staff` WRITE;
/*!40000 ALTER TABLE `b_staff` DISABLE KEYS */;
INSERT INTO `b_staff` VALUES ('1572547287','11','txtStaffName',NULL,'3','',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_part`
--

LOCK TABLES `t_part` WRITE;
/*!40000 ALTER TABLE `t_part` DISABLE KEYS */;
INSERT INTO `t_part` VALUES ('ps682662392','1484610169','','','1','1','2557-08-05 21:22:23','','',NULL,NULL,NULL),('tpa166518469','1484610169','ps1595177650','','1','1','2557-08-07 16:14:13','','',NULL,NULL,NULL),('tpa178035951','271821591','ps903951350','','1','1','2557-08-08 09:21:08','','',NULL,NULL,NULL),('tpa927215977','1484610169','','','2','1','2557-08-07 09:16:26','','',NULL,NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

-- Dump completed on 2014-11-26 15:19:07
