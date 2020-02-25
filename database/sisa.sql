-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: yabo_bank
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.16.04.1

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
-- Table structure for table `cash_flows`
--

DROP TABLE IF EXISTS `cash_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_flows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `nominal` double NOT NULL,
  `resource_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_flows`
--

LOCK TABLES `cash_flows` WRITE;
/*!40000 ALTER TABLE `cash_flows` DISABLE KEYS */;
INSERT INTO `cash_flows` VALUES (71,'2020-02-04','withdrawal to customer Customer_1580777465',1,5000,'MUTATION_02202000005','App\\Model\\Mutation',5,NULL,NULL),(72,'2020-02-04','withdrawal to customer Customer_1580777465',1,200000,'MUTATION_02202000010','App\\Model\\Mutation',10,NULL,NULL),(73,'2020-02-08','Penarikan ',1,1000000,'MUTATION_02202000017','App\\Model\\Mutation',17,NULL,NULL),(74,'2020-02-09','Penarikan ',1,1000,'MUTATION_02202000022','App\\Model\\Mutation',22,NULL,NULL),(75,'2020-02-10','Penarikan ',1,1500000,'MUTATION_02202000027','App\\Model\\Mutation',27,NULL,NULL),(76,'2020-02-24','Penarikan ',1,50000,'MUTATION_02202000050','App\\Model\\Mutation',50,NULL,NULL),(77,'2020-02-04','payment from KARYA AGUNG REALITI',2,35000000,'PAYMENT_02202000001','App\\Model\\Payment',1,NULL,NULL),(78,'2020-02-06','payment from KARYA AGUNG REALITI',2,7742035,'PAYMENT_02202000002','App\\Model\\Payment',2,NULL,NULL),(79,'2020-02-12','payment from KARYA AGUNG REALITI',2,35000000,'PAYMENT_02202000003','App\\Model\\Payment',3,NULL,NULL),(80,'2020-02-07','payment from KARYA AGUNG REALITI',2,3000000,'PAYMENT_02202000004','App\\Model\\Payment',4,NULL,NULL),(81,'2020-02-09','payment from KARYA AGUNG REALITI',2,935035,'PAYMENT_02202000005','App\\Model\\Payment',5,NULL,NULL),(82,'2020-02-06','Biaya Ekspedisi 682378(9)4561 / 8762 MJ',1,10500000,'','App\\Model\\CashOut',1,NULL,NULL),(83,'2020-02-06','Biaya Ekspedisi 682378(9)4561 / 8762 MJ',1,10500000,'CASH_OUT_02202000002','App\\Model\\CashOut',2,NULL,NULL);
/*!40000 ALTER TABLE `cash_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_outs`
--

DROP TABLE IF EXISTS `cash_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_outs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_outs`
--

LOCK TABLES `cash_outs` WRITE;
/*!40000 ALTER TABLE `cash_outs` DISABLE KEYS */;
INSERT INTO `cash_outs` VALUES (1,'','Biaya Ekspedisi 682378(9)4561 / 8762 MJ',10500000,'2020-02-06','2020-02-06 06:16:30','2020-02-06 06:16:30'),(2,'CASH_OUT_02202000002','Biaya Ekspedisi 682378(9)4561 / 8762 MJ',10500000,'2020-02-06','2020-02-06 15:55:47','2020-02-06 15:55:47');
/*!40000 ALTER TABLE `cash_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_photo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (17,'Customer_1580777465','IDENTITY_1580778104.JPG',1,'2020-02-04 00:51:19','2020-02-13 13:18:04'),(18,'Customer_1581146345','default.jpg',0,'2020-02-08 07:19:05','2020-02-08 07:19:05'),(19,'Customer_1581146506','IDENTITY_1582290296.png',1,'2020-02-08 07:21:46','2020-02-21 14:55:19'),(20,'Customer_1581146746','default.jpg',1,'2020-02-08 07:25:46','2020-02-13 16:07:08'),(21,'Customer_1581146791','default.jpg',1,'2020-02-08 07:26:31','2020-02-13 16:36:30'),(22,'Customer_1581225253','IDENTITY_1581226022.png',0,'2020-02-09 05:14:13','2020-02-09 05:27:02'),(23,'Customer_1581335128','IDENTITY_1582627705.png',1,'2020-02-10 11:45:28','2020-02-25 10:48:25'),(24,'Customer_1581344286','IDENTITY_1581344358.png',0,'2020-02-10 14:18:06','2020-02-10 14:19:18'),(25,'Customer_1581512016','IDENTITY_1581522839.png',1,'2020-02-12 12:53:36','2020-02-15 08:19:34'),(26,'Customer_1581754179','default.jpg',1,'2020-02-15 08:09:39','2020-02-15 08:12:40'),(27,'Customer_1581756025','default.jpg',0,'2020-02-15 08:40:25','2020-02-15 08:40:25'),(28,'Customer_1581758928','IDENTITY_1582040166.png',1,'2020-02-15 09:28:48','2020-02-18 15:36:06'),(29,'Customer_1581762023','IDENTITY_1581762217.png',1,'2020-02-15 10:20:23','2020-02-15 10:23:37'),(30,'Customer_1582535974','default.jpg',0,'2020-02-24 09:19:34','2020-02-24 09:19:34'),(31,'Customer_1582559213','IDENTITY_1582601331.png',1,'2020-02-24 15:46:53','2020-02-25 05:47:30'),(32,'Customer_1582559441','default.jpg',0,'2020-02-24 15:50:41','2020-02-24 15:50:41'),(33,'Customer_1582587586','default.jpg',0,'2020-02-24 23:39:46','2020-02-24 23:39:46'),(34,'Customer_1582588760','IDENTITY_1582589160.png',1,'2020-02-24 23:59:20','2020-02-25 05:48:04'),(35,'Customer_1582588978','default.jpg',0,'2020-02-25 00:02:58','2020-02-25 00:02:58'),(36,'Customer_1582589714','IDENTITY_1582590059.png',1,'2020-02-25 00:15:14','2020-02-25 05:48:39'),(37,'Customer_1582589938','default.jpg',0,'2020-02-25 00:18:58','2020-02-25 00:18:58'),(38,'Customer_1582590484','default.jpg',0,'2020-02-25 00:28:04','2020-02-25 00:28:04'),(39,'Customer_1582591317','default.jpg',0,'2020-02-25 00:41:57','2020-02-25 00:41:57'),(40,'Customer_1582597587','default.jpg',0,'2020-02-25 02:26:27','2020-02-25 02:26:27'),(41,'Customer_1582599618','default.jpg',0,'2020-02-25 03:00:18','2020-02-25 03:00:18'),(42,'Customer_1582608587','IDENTITY_1582608774.png',1,'2020-02-25 05:29:47','2020-02-25 05:40:55'),(43,'Customer_1582609643','IDENTITY_1582609936.png',1,'2020-02-25 05:47:23','2020-02-25 05:53:42'),(44,'Customer_1582610654','default.jpg',0,'2020-02-25 06:04:14','2020-02-25 06:04:14'),(45,'Customer_1582611516','IDENTITY_1582612714.png',1,'2020-02-25 06:18:36','2020-02-25 07:03:58'),(46,'Customer_1582612341','IDENTITY_1582612416.png',1,'2020-02-25 06:32:21','2020-02-25 06:56:07'),(47,'Customer_1582613543','default.jpg',0,'2020-02-25 06:52:23','2020-02-25 06:52:23'),(48,'Customer_1582614348','IDENTITY_1582634211.png',1,'2020-02-25 07:05:48','2020-02-25 12:36:51'),(49,'Customer_1582616525','default.jpg',0,'2020-02-25 07:42:05','2020-02-25 07:42:05'),(50,'Customer_1582618431','default.jpg',0,'2020-02-25 08:13:51','2020-02-25 08:13:51'),(51,'Customer_1582618832','default.jpg',0,'2020-02-25 08:20:32','2020-02-25 08:20:32'),(52,'Customer_1582618998','IDENTITY_1582619275.png',1,'2020-02-25 08:23:18','2020-02-25 08:27:55'),(53,'Customer_1582619800','default.jpg',0,'2020-02-25 08:36:40','2020-02-25 08:36:40'),(54,'Customer_1582624391','default.jpg',0,'2020-02-25 09:53:11','2020-02-25 09:53:11'),(55,'Customer_1582626037','default.jpg',0,'2020-02-25 10:20:37','2020-02-25 10:20:37'),(56,'Customer_1582628627','default.jpg',0,'2020-02-25 11:03:47','2020-02-25 11:03:47'),(57,'Customer_1582629893','IDENTITY_1582630013.png',1,'2020-02-25 11:24:53','2020-02-25 11:26:53'),(58,'Customer_1582631875','default.jpg',0,'2020-02-25 11:57:55','2020-02-25 11:57:55'),(59,'Customer_1582633004','IDENTITY_1582633358.png',1,'2020-02-25 12:16:44','2020-02-25 12:22:38'),(60,'Customer_1582633057','IDENTITY_1582633452.png',1,'2020-02-25 12:17:37','2020-02-25 12:24:12'),(61,'Customer_1582633142','default.jpg',0,'2020-02-25 12:19:02','2020-02-25 12:19:02'),(62,'Customer_1582633951','default.jpg',0,'2020-02-25 12:32:31','2020-02-25 12:32:31'),(63,'Customer_1582633976','IDENTITY_1582634143.png',0,'2020-02-25 12:32:56','2020-02-25 13:57:14'),(64,'Customer_1582634262','IDENTITY_1582638167.png',1,'2020-02-25 12:37:42','2020-02-25 13:42:47'),(65,'Customer_1582634727','IDENTITY_1582635286.png',1,'2020-02-25 12:45:27','2020-02-25 12:54:46'),(66,'Customer_1582635864','default.jpg',0,'2020-02-25 13:04:24','2020-02-25 13:04:24'),(67,'Customer_1582636606','default.jpg',0,'2020-02-25 13:16:46','2020-02-25 13:16:46'),(68,'Customer_1582638861','default.jpg',0,'2020-02-25 13:54:21','2020-02-25 13:54:21'),(69,'Customer_1582639828','default.jpg',0,'2020-02-25 14:10:28','2020-02-25 14:10:28'),(70,'Customer_1582640070','IDENTITY_1582640355.png',0,'2020-02-25 14:14:30','2020-02-25 14:19:15');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Driver_1580778321','2020-02-04 01:05:32','2020-02-04 01:05:32');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `selling_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,2,'INVOICE_02202000001','2020-02-04','2020-02-05','2020-02-04 05:53:06','2020-02-04 05:53:06'),(2,3,'INVOICE_02202000002','2020-02-04','2020-02-05','2020-02-04 08:49:34','2020-02-04 08:49:34');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `list_id` varchar(200) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(4) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (16,1,'Beranda','s-admin','s-admin','home',1,1,'-'),(21,1,'Menus','menus','menus','bars',1,1,'-'),(22,1,'Role','roles','roles','user',1,1,'-'),(23,1,'Users','users','users','users',1,1,'-'),(24,2,'Beranda','home','home','home',1,0,'Beranda'),(25,2,'Users','users','users','users',0,100,'users'),(26,2,'Price List','pricelists','pricelists','credit-card',1,0,'pricelist'),(27,2,'Customer','customers','customers','users',1,1,'customers'),(28,2,'Driver','drivers','drivers','users',1,1,'drivers'),(29,2,'LAPORAN','header','home','home',1,1,'LAPORAN'),(30,2,'Kas Keluar','cash_outs','cash_outs','share-square',1,3,'outcome'),(31,2,'Penjualan','sellings','sellings','shopping-cart',1,1,'selling'),(32,2,'Daftar Pembayaran','payments','payments','file',1,1,'invoice'),(33,14,'Beranda','home','home','home',1,1,'home'),(34,14,'Penjemputan','requests','requests','truck',0,1,'requests'),(35,14,'Penjemputan Sampah','pickups','pickups','truck',1,1,'pickups'),(36,13,'Beranda','home','home','home',1,1,'home'),(37,13,'Request Penjemputan','requests','requests','truck',1,1,'requests'),(38,13,'Penjemputan di Terima','pickups','pickups','truck',1,1,'pickups'),(39,13,'Mutasi','mutations','mutations','credit-card',1,1,'mutations'),(40,14,'Transaksi','transactions','transactions','credit-card',1,1,'transactions'),(41,2,'Penjemputan','requests','reque','truck',1,0,'truck'),(42,41,'Request Masuk','requests','requests','truck',1,1,'requests'),(43,41,'Request Diproses','pickups','pickups','truck',1,1,'-'),(44,2,'Proses Data','reports','reports','file-excel',1,4,'reports');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (61,'2014_10_12_000000_create_users_table',1),(62,'2014_10_12_100000_create_password_resets_table',1),(63,'2020_01_07_171747_create_roles_table',1),(64,'2020_01_07_171850_create_user_roles_table',1),(65,'2020_01_09_025853_create_menus_table',2),(66,'2020_01_11_160655_create_price_lists_table',2),(67,'2020_01_14_055213_create_pick_ups_table',3),(68,'2020_01_14_122148_create_customers_table',3),(69,'2020_01_14_122335_create_drivers_table',3),(70,'2020_01_14_130918_create_requests_table',3),(71,'2020_01_17_054513_create_transactions_table',4),(72,'2020_01_17_055152_create_mutations_table',4),(73,'2016_06_01_000001_create_oauth_auth_codes_table',5),(74,'2016_06_01_000002_create_oauth_access_tokens_table',5),(75,'2016_06_01_000003_create_oauth_refresh_tokens_table',5),(76,'2016_06_01_000004_create_oauth_clients_table',5),(77,'2016_06_01_000005_create_oauth_personal_access_clients_table',5),(78,'2020_02_02_185310_create_sellings_table',6),(79,'2020_02_03_110012_create_cash_outs_table',7),(80,'2020_02_04_124806_create_invoices_table',8),(81,'2020_02_04_144516_create_payments_table',9),(82,'2020_02_06_230009_create_cash_flows_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutations`
--

DROP TABLE IF EXISTS `mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned DEFAULT NULL,
  `nominal` double NOT NULL,
  `position` tinyint(4) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutations`
--

LOCK TABLES `mutations` WRITE;
/*!40000 ALTER TABLE `mutations` DISABLE KEYS */;
INSERT INTO `mutations` VALUES (1,'',17,0,0,2,'initial','2020-02-04 00:51:19','2020-02-04 00:51:19'),(4,'MUTATION_02202000002',17,2,10000,2,'transaction to customer Customer_1580777465: plastik,1000,kg,qty:10driver:c','2020-02-04 02:45:27','2020-02-04 02:45:27'),(5,'MUTATION_02202000005',17,0,5000,1,'withdrawal to customer Customer_1580777465','2020-02-04 02:47:48','2020-02-04 02:47:48'),(6,'MUTATION_02202000006',17,3,2000,2,'transaction to customer Customer_1580777465: plastik,1000,kg,qty:2driver:c','2020-02-04 09:37:34','2020-02-04 09:37:34'),(7,'MUTATION_02202000007',17,4,170000,2,'transaction to customer Customer_1580777465: Besi,5000,kg,qty:34driver:c','2020-02-04 09:37:34','2020-02-04 09:37:34'),(8,'MUTATION_02202000007',17,5,28000,2,'transaction to customer Customer_1580777465: Kardus,4000,kg,qty:7driver:c','2020-02-04 09:37:34','2020-02-04 09:37:34'),(9,'MUTATION_02202000007',17,6,20000,2,'transaction to customer Customer_1580777465: plastik,1000,kg,qty:20driver:c','2020-02-04 13:18:49','2020-02-04 13:18:49'),(10,'MUTATION_02202000010',17,0,200000,1,'withdrawal to customer Customer_1580777465','2020-02-04 13:19:34','2020-02-04 13:19:34'),(11,'MUTATION_02202000011',17,7,500000,2,'direct transaction to customer Customer_1580777465: plastik,1000,kg,qty:500','2020-02-08 06:41:24','2020-02-08 06:41:24'),(12,'MUTATION_02202000012',20,0,0,2,'initial','2020-02-08 07:25:46','2020-02-08 07:25:46'),(13,'MUTATION_02202000013',21,0,0,2,'initial','2020-02-08 07:26:31','2020-02-08 07:26:31'),(14,'MUTATION_02202000014',21,8,1000000,2,'direct transaction to customer Customer_1581146791: plastik,1000,kg,qty:1000','2020-02-08 07:29:00','2020-02-08 07:29:00'),(15,'MUTATION_02202000015',21,9,5000000,2,'transaction to customer Customer_1581146791: plastik,1000,kg,qty:5000driver:Caca Handika','2020-02-08 08:35:24','2020-02-08 08:35:24'),(16,'MUTATION_02202000016',21,10,100000,2,'direct transaction to customer Customer_1581146791: plastik,1000,kg,qty:100','2020-02-08 08:37:21','2020-02-08 08:37:21'),(17,'MUTATION_02202000017',21,0,1000000,1,'Penarikan ','2020-02-08 08:41:43','2020-02-08 08:41:43'),(18,'MUTATION_02202000018',21,11,1000,2,'Transaksi Langsung plastik (1000 / kg) , qty:1','2020-02-08 08:44:16','2020-02-08 08:44:16'),(19,'MUTATION_02202000019',21,12,5000,2,'Transaksi : plastik (1000 / kg) , qty:5, Driver : Caca Handika','2020-02-08 08:45:15','2020-02-08 08:45:15'),(20,'MUTATION_02202000020',19,13,10000,2,'Transaksi : Besi (5000 / kg) , qty:2, Driver : Caca Handika','2020-02-09 03:58:34','2020-02-09 03:58:34'),(21,'MUTATION_02202000021',20,14,150000,2,'Transaksi : Besi (5000 / kg) , qty:30, Driver : Caca Handika','2020-02-09 04:29:00','2020-02-09 04:29:00'),(22,'MUTATION_02202000022',19,0,1000,1,'Penarikan ','2020-02-09 04:44:12','2020-02-09 04:44:12'),(23,'MUTATION_02202000023',19,15,399000,2,'Transaksi : plastik (1000 / kg) , qty:399, Driver : Caca Handika','2020-02-09 05:06:55','2020-02-09 05:06:55'),(24,'MUTATION_02202000024',22,0,0,2,'initial','2020-02-09 05:14:13','2020-02-09 05:14:13'),(25,'MUTATION_02202000025',22,16,2500000,2,'Transaksi : Besi (5000 / kg) , qty:500, Driver : Caca Handika','2020-02-09 05:17:36','2020-02-09 05:17:36'),(26,'MUTATION_02202000026',22,17,500000,2,'Transaksi : Besi (5000 / kg) , qty:100, Driver : Caca Handika','2020-02-10 09:13:20','2020-02-10 09:13:20'),(27,'MUTATION_02202000027',22,0,1500000,1,'Penarikan ','2020-02-10 09:14:12','2020-02-10 09:14:12'),(28,'MUTATION_02202000028',23,0,0,2,'initial','2020-02-10 11:45:28','2020-02-10 11:45:28'),(29,'MUTATION_02202000029',24,0,0,2,'initial','2020-02-10 14:18:06','2020-02-10 14:18:06'),(30,'MUTATION_02202000030',25,0,0,2,'initial','2020-02-12 12:53:36','2020-02-12 12:53:36'),(31,'MUTATION_02202000031',19,18,6000,2,'Transaksi : plastik (1000 / kg) , qty:6, Driver : Caca Handika','2020-02-12 14:20:04','2020-02-12 14:20:04'),(32,'MUTATION_02202000032',26,0,0,2,'initial','2020-02-15 08:09:39','2020-02-15 08:09:39'),(33,'MUTATION_02202000033',27,0,0,2,'initial','2020-02-15 08:40:25','2020-02-15 08:40:25'),(34,'MUTATION_02202000034',28,0,0,2,'initial','2020-02-15 09:28:48','2020-02-15 09:28:48'),(35,'MUTATION_02202000035',29,0,0,2,'initial','2020-02-15 10:20:23','2020-02-15 10:20:23'),(36,'MUTATION_02202000036',28,19,5000000,2,'Transaksi : plastik (1000 / kg) , qty:5000, Driver : Caca Handika','2020-02-22 06:52:42','2020-02-22 06:52:42'),(37,'MUTATION_02202000037',28,20,4000,2,'Transaksi : PLASTIK (1000 / kg) , 4 kg, Driver : Caca Handika','2020-02-22 06:55:18','2020-02-22 06:55:18'),(38,'MUTATION_02202000038',28,21,4000,2,'Transaksi : PLASTIK (1000 / kg) , 4 kg, Driver : Caca Handika','2020-02-22 06:56:13','2020-02-22 06:56:13'),(39,'MUTATION_02202000039',25,22,3000,2,'Transaksi : PLASTIK (1000 / kg) , 3 kg, Driver : Caca Handika','2020-02-22 07:02:10','2020-02-22 07:02:10'),(40,'MUTATION_02202000040',23,23,3000,2,'Transaksi : PLASTIK (1000 / kg) , 3 kg, Driver : Caca Handika','2020-02-22 07:07:08','2020-02-22 07:07:08'),(41,'MUTATION_02202000041',25,24,5000,2,'Transaksi : PLASTIK (1000 / kg) , 5 kg, Driver : Caca Handika','2020-02-22 07:08:51','2020-02-22 07:08:51'),(42,'MUTATION_02202000042',19,25,1000,2,'Transaksi : PLASTIK (1000 / kg) , 1 kg, Driver : Caca Handika','2020-02-22 07:08:59','2020-02-22 07:08:59'),(43,'MUTATION_02202000043',19,26,2000,2,'Transaksi : PLASTIK (1000 / kg) , 2 kg, Driver : Caca Handika','2020-02-22 07:09:07','2020-02-22 07:09:07'),(44,'MUTATION_02202000044',19,27,3000,2,'Transaksi : PLASTIK (1000 / kg) , 3 kg, Driver : Caca Handika','2020-02-22 07:09:27','2020-02-22 07:09:27'),(45,'MUTATION_02202000045',19,28,15000,2,'Transaksi : BESI (5000 / kg) , 3 kg, Driver : Caca Handika','2020-02-22 07:09:38','2020-02-22 07:09:38'),(46,'MUTATION_02202000046',19,29,15000,2,'Transaksi : Elektronik (5000 / kg) , 3 kg, Driver : Caca Handika','2020-02-23 07:07:18','2020-02-23 07:07:18'),(47,'MUTATION_02202000047',19,30,5000,2,'Transaksi : Plastik (1000 / kg) , 5 kg, Driver : Caca Handika','2020-02-23 13:35:01','2020-02-23 13:35:01'),(48,'MUTATION_02202000048',30,0,0,2,'Pendaftaran','2020-02-24 09:19:34','2020-02-24 09:19:34'),(49,'MUTATION_02202000049',19,31,5000,2,'Transaksi : Plastik (1000 / kg) , 5 kg, Driver : Caca Handika','2020-02-24 09:55:35','2020-02-24 09:55:35'),(50,'MUTATION_02202000050',19,0,50000,1,'Penarikan ','2020-02-24 09:59:00','2020-02-24 09:59:00'),(51,'MUTATION_02202000051',31,0,0,2,'Pendaftaran','2020-02-24 15:46:54','2020-02-24 15:46:54'),(52,'MUTATION_02202000052',32,0,0,2,'Pendaftaran','2020-02-24 15:50:41','2020-02-24 15:50:41'),(53,'MUTATION_02202000053',33,0,0,2,'Pendaftaran','2020-02-24 23:39:46','2020-02-24 23:39:46'),(54,'MUTATION_02202000054',34,0,0,2,'Pendaftaran','2020-02-24 23:59:20','2020-02-24 23:59:20'),(55,'MUTATION_02202000055',35,0,0,2,'Pendaftaran','2020-02-25 00:02:58','2020-02-25 00:02:58'),(56,'MUTATION_02202000056',36,0,0,2,'Pendaftaran','2020-02-25 00:15:14','2020-02-25 00:15:14'),(57,'MUTATION_02202000057',37,0,0,2,'Pendaftaran','2020-02-25 00:18:58','2020-02-25 00:18:58'),(58,'MUTATION_02202000058',38,0,0,2,'Pendaftaran','2020-02-25 00:28:04','2020-02-25 00:28:04'),(59,'MUTATION_02202000059',39,0,0,2,'Pendaftaran','2020-02-25 00:41:57','2020-02-25 00:41:57'),(60,'MUTATION_02202000060',40,0,0,2,'Pendaftaran','2020-02-25 02:26:27','2020-02-25 02:26:27'),(61,'MUTATION_02202000061',41,0,0,2,'Pendaftaran','2020-02-25 03:00:18','2020-02-25 03:00:18'),(62,'MUTATION_02202000062',42,0,0,2,'Pendaftaran','2020-02-25 05:29:47','2020-02-25 05:29:47'),(63,'MUTATION_02202000063',43,0,0,2,'Pendaftaran','2020-02-25 05:47:23','2020-02-25 05:47:23'),(64,'MUTATION_02202000064',19,32,6000,2,'Transaksi : Plastik (1000 / kg) , 6 kg, Driver : Caca Handika','2020-02-25 06:01:38','2020-02-25 06:01:38'),(65,'MUTATION_02202000065',44,0,0,2,'Pendaftaran','2020-02-25 06:04:14','2020-02-25 06:04:14'),(66,'MUTATION_02202000066',45,0,0,2,'Pendaftaran','2020-02-25 06:18:36','2020-02-25 06:18:36'),(67,'MUTATION_02202000067',46,0,0,2,'Pendaftaran','2020-02-25 06:32:21','2020-02-25 06:32:21'),(68,'MUTATION_02202000068',47,0,0,2,'Pendaftaran','2020-02-25 06:52:23','2020-02-25 06:52:23'),(69,'MUTATION_02202000069',48,0,0,2,'Pendaftaran','2020-02-25 07:05:49','2020-02-25 07:05:49'),(70,'MUTATION_02202000070',49,0,0,2,'Pendaftaran','2020-02-25 07:42:05','2020-02-25 07:42:05'),(71,'MUTATION_02202000071',50,0,0,2,'Pendaftaran','2020-02-25 08:13:51','2020-02-25 08:13:51'),(72,'MUTATION_02202000072',51,0,0,2,'Pendaftaran','2020-02-25 08:20:32','2020-02-25 08:20:32'),(73,'MUTATION_02202000073',52,0,0,2,'Pendaftaran','2020-02-25 08:23:18','2020-02-25 08:23:18'),(74,'MUTATION_02202000074',53,0,0,2,'Pendaftaran','2020-02-25 08:36:40','2020-02-25 08:36:40'),(75,'MUTATION_02202000075',54,0,0,2,'Pendaftaran','2020-02-25 09:53:11','2020-02-25 09:53:11'),(76,'MUTATION_02202000076',55,0,0,2,'Pendaftaran','2020-02-25 10:20:37','2020-02-25 10:20:37'),(77,'MUTATION_02202000077',56,0,0,2,'Pendaftaran','2020-02-25 11:03:47','2020-02-25 11:03:47'),(78,'MUTATION_02202000078',57,0,0,2,'Pendaftaran','2020-02-25 11:24:53','2020-02-25 11:24:53'),(79,'MUTATION_02202000079',58,0,0,2,'Pendaftaran','2020-02-25 11:57:55','2020-02-25 11:57:55'),(80,'MUTATION_02202000080',59,0,0,2,'Pendaftaran','2020-02-25 12:16:44','2020-02-25 12:16:44'),(81,'MUTATION_02202000081',60,0,0,2,'Pendaftaran','2020-02-25 12:17:37','2020-02-25 12:17:37'),(82,'MUTATION_02202000082',61,0,0,2,'Pendaftaran','2020-02-25 12:19:02','2020-02-25 12:19:02'),(83,'MUTATION_02202000083',62,0,0,2,'Pendaftaran','2020-02-25 12:32:31','2020-02-25 12:32:31'),(84,'MUTATION_02202000084',63,0,0,2,'Pendaftaran','2020-02-25 12:32:56','2020-02-25 12:32:56'),(85,'MUTATION_02202000085',64,0,0,2,'Pendaftaran','2020-02-25 12:37:42','2020-02-25 12:37:42'),(86,'MUTATION_02202000086',65,0,0,2,'Pendaftaran','2020-02-25 12:45:27','2020-02-25 12:45:27'),(87,'MUTATION_02202000087',66,0,0,2,'Pendaftaran','2020-02-25 13:04:24','2020-02-25 13:04:24'),(88,'MUTATION_02202000088',67,0,0,2,'Pendaftaran','2020-02-25 13:16:46','2020-02-25 13:16:46'),(89,'MUTATION_02202000089',68,0,0,2,'Pendaftaran','2020-02-25 13:54:21','2020-02-25 13:54:21'),(90,'MUTATION_02202000090',69,0,0,2,'Pendaftaran','2020-02-25 14:10:28','2020-02-25 14:10:28'),(91,'MUTATION_02202000091',70,0,0,2,'Pendaftaran','2020-02-25 14:14:30','2020-02-25 14:14:30');
/*!40000 ALTER TABLE `mutations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('016201246b203b0b4ff56bb726ee28b2531205984109c4922c5acf36d9ef0dd7901209a80144d5ee',49,9,'YABO_BANK','[]',1,'2020-02-25 02:26:35','2020-02-25 02:26:35','2021-02-25 10:26:35'),('01676efa76d4cbd5cc896e13e1b9bb6991aa4b85c63b761bb7a8e7eff44d145dc0979d4b9fa4f7ed',94,9,'YABO_BANK','[]',0,'2020-02-25 11:57:55','2020-02-25 11:57:55','2021-02-25 19:57:55'),('06c428488a658c89140b098663fe1c4082acf78b6ae24ecf14f8b7f71f9912f075847a1a37b0f76c',34,1,'YABO_BANK','[]',0,'2020-01-30 09:18:25','2020-01-30 09:18:25','2021-01-30 17:18:25'),('081f86630aa326ecd3c899e9d9d9f6f3ff8dfdfa2c7adf64e94662bcf0c9ff151ac9a3ecdf1139d5',43,1,'YABO_BANK','[]',1,'2020-01-29 21:53:45','2020-01-29 21:53:45','2021-01-30 05:53:45'),('08297a2a9e29cc1eaefb11db76b7f1a876138515010989ce1803dca7d4912762d062ea0c39a80fe5',77,9,'YABO_BANK','[]',0,'2020-02-25 03:00:18','2020-02-25 03:00:18','2021-02-25 11:00:18'),('086e9be785c2120f7906c4a24e2dcd20126819d0f6166e71e31306d9f9da04d31dd020534dbc46ee',31,1,'YABO_BANK','[]',1,'2020-01-26 00:20:35','2020-01-26 00:20:35','2021-01-26 08:20:35'),('09911078b13c471faf0537e3cfc7cf53e007bc0e6d25344b16f454ec09b179723324848e9c6574de',53,9,'YABO_BANK','[]',1,'2020-02-15 07:31:51','2020-02-15 07:31:51','2021-02-15 15:31:51'),('09bde23622cdc04f8515686d58d472f55a0b8c1ce43c0c2d686aa34abdf1873ed97bb23b931d0531',31,1,'YABO_BANK','[]',0,'2020-01-25 05:13:27','2020-01-25 05:13:27','2021-01-25 13:13:27'),('0e6aab4c9de512aad1fa890afcf21f61db3df91975f5e0c17487e8ebac4863e697b50cc8b571c938',64,9,'YABO_BANK','[]',1,'2020-02-18 15:24:11','2020-02-18 15:24:11','2021-02-18 23:24:11'),('10a5b4e59b9979aa0d5eeb0cd58aeefdf386ccbf839f69b50ee9ac8e8b5a8701d77fafd709d18e20',101,9,'YABO_BANK','[]',0,'2020-02-25 12:45:27','2020-02-25 12:45:27','2021-02-25 20:45:27'),('1134bcc7004876227639e882c9a0f90d10135c5ab9de9e60521407510231271828976eb6c3fc0ce9',47,9,'YABO_BANK','[]',0,'2020-02-22 11:46:19','2020-02-22 11:46:19','2021-02-22 19:46:19'),('13a4ee657cbae9ba247f93633a5a8df2b50db6596e7c04b9639334382e6c287680ce33f8fc82170b',55,9,'YABO_BANK','[]',0,'2020-02-18 10:33:03','2020-02-18 10:33:03','2021-02-18 18:33:03'),('14362357742075bcf0b434d5054040ff8c7f2ca6aa4a21ca6960f1b9c24a2d4d4d388e8c5c24f62e',31,1,'YABO_BANK','[]',0,'2020-01-25 10:07:27','2020-01-25 10:07:27','2021-01-25 18:07:27'),('145bd21923ff351a57759bd17898d7211716bb0b14b6fe5f191553ffae69409f1f846caa79592ad5',49,9,'YABO_BANK','[]',1,'2020-02-25 02:27:27','2020-02-25 02:27:27','2021-02-25 10:27:27'),('1492299dbe9a47503c99ba3fa89c00ca81c337fc2d7136f7e8c18b646064fa82ea0a824012fcfcf3',31,1,'YABO_BANK','[]',1,'2020-01-27 06:33:44','2020-01-27 06:33:44','2021-01-27 14:33:44'),('159322b8232cdb5409cc53c0563089324e5b2a52cbb3b2cfbe95d34c6db245215be43c2b4fc3b174',47,9,'YABO_BANK','[]',1,'2020-02-13 16:40:01','2020-02-13 16:40:01','2021-02-14 00:40:01'),('16662620af8d0038aaee2730a791ce653c18df84e05ad289d6defeb1654c99668caf90c09ff87284',31,1,'YABO_BANK','[]',0,'2020-01-28 03:14:45','2020-01-28 03:14:45','2021-01-28 11:14:45'),('16afc5b7f1d11e50f40d6d7e39801dacb7344a396b00341ffc29394454584eb50996d1490f94cab0',62,9,'YABO_BANK','[]',1,'2020-02-15 08:09:39','2020-02-15 08:09:39','2021-02-15 16:09:39'),('1a2cfd8c6a68f9781702eacb7da48f964146547205d0c85a089a5e5c3c5f296d65ef12a7494965db',47,9,'YABO_BANK','[]',1,'2020-02-22 12:55:02','2020-02-22 12:55:02','2021-02-22 20:55:02'),('1b217045c590367a4f56154cbfc00545ec7e48c5d85c1f16c62d693bcb62aa3dcee8ecdde72142d5',34,1,'YABO_BANK','[]',0,'2020-01-23 07:25:29','2020-01-23 07:25:29','2021-01-23 15:25:29'),('1c39494c8dcf1c716e8ec751c024d00582721b5992fd2b4aed01c8450546f978f71011d520d5f675',49,3,'YABO_BANK','[]',1,'2020-02-09 03:08:30','2020-02-09 03:08:30','2021-02-09 11:08:30'),('1c62cc1e46b8bbedd4ea35cfc00081ac267100cf25d26885044af5a8a1ccc9b92d6b59d7281ec558',49,9,'YABO_BANK','[]',1,'2020-02-16 10:04:54','2020-02-16 10:04:54','2021-02-16 18:04:54'),('1db55bbacc76e4373971196bee450db6e4002af7b12ee10b90772a0cdba9210d648f3dcdcca6943d',64,9,'YABO_BANK','[]',0,'2020-02-22 12:27:28','2020-02-22 12:27:28','2021-02-22 20:27:28'),('1dc9cfdbfbd1d3949f325204c36c60ce36903f9875e28edf07d8115b37d8505f76c7578474b50f26',89,9,'YABO_BANK','[]',0,'2020-02-25 08:36:40','2020-02-25 08:36:40','2021-02-25 16:36:40'),('1fe8f3ea79f50fc5147049077a05d676488411808338a9fa67acb277a47a6030a573735fb9a38284',34,1,'YABO_BANK','[]',0,'2020-01-25 04:19:21','2020-01-25 04:19:21','2021-01-25 12:19:21'),('20696d709c020a6dc31e4bf5dc07e6e7d6cbd565d69323e3af2f3b2fb540d9657a087ea39ba2fcf4',31,1,'YABO_BANK','[]',0,'2020-01-25 23:50:42','2020-01-25 23:50:42','2021-01-26 07:50:42'),('21aa9ed1e7e75ce0e8a81c4b1f10dd6fefab7603fdb62465cbcfbf4149ca0855d6757fbabaf8ba63',102,9,'YABO_BANK','[]',0,'2020-02-25 13:04:24','2020-02-25 13:04:24','2021-02-25 21:04:24'),('232573ff6824b4326f25f96d89ce6a8f7c7c3d1fdd0e59f418c4237aaad752b7ac6c931562bce17c',80,9,'YABO_BANK','[]',0,'2020-02-25 06:04:14','2020-02-25 06:04:14','2021-02-25 14:04:14'),('23f15d6c158c13d02b96941dec8b3024cc6ca42d372c99aa260a8bec2811a667d33a4fcda3a5076f',34,1,'YABO_BANK','[]',0,'2020-01-31 04:49:13','2020-01-31 04:49:13','2021-01-31 12:49:13'),('27882074645779f1e5ead6f29b0efb15dfc3c77318b3e01465f81d82ddad60319472f9f34af4183f',31,1,'YABO_BANK','[]',1,'2020-01-23 00:37:41','2020-01-23 00:37:41','2021-01-23 08:37:41'),('27ec4083676b85fe2f21030be6f560e4acc60aef543d126788d151b74aac268971077895b0679c91',51,3,'YABO_BANK','[]',1,'2020-02-08 07:29:17','2020-02-08 07:29:17','2021-02-08 15:29:17'),('27fabc5dc4e7be1701e1562b325995b161e690052f42fc29dfdb7453f337837140902be9cde2fe24',31,1,'YABO_BANK','[]',1,'2020-01-29 21:04:43','2020-01-29 21:04:43','2021-01-30 05:04:43'),('2888ad550d0b76b3b3c93e8650a2f656683e86f7b9ba4db723a8ab28fb0af1dd0166cf466c49ee10',47,9,'YABO_BANK','[]',0,'2020-02-23 15:22:36','2020-02-23 15:22:36','2021-02-23 23:22:36'),('290522d40908b01f15729ac9bf460ee760aa95ffffc8e915557f55de296b424d56bae99235303d21',67,9,'YABO_BANK','[]',1,'2020-02-24 15:46:54','2020-02-24 15:46:54','2021-02-24 23:46:54'),('2b025be5ae8f30268208ff5e792f18fc75d96bcb25786965980ab3a63df62ecfed02df2e2fae4f09',31,1,'YABO_BANK','[]',1,'2020-01-27 06:14:39','2020-01-27 06:14:39','2021-01-27 14:14:39'),('2c2209ff32914085284d7282772120c5308cf20aaee9d475f39c1dd161dd4403c4096fb64b31a948',31,1,'YABO_BANK','[]',0,'2020-01-31 07:16:00','2020-01-31 07:16:00','2021-01-31 15:16:00'),('2c7591e5333b6eb49d09eea85cac6c9b0ee265fbc9b89998bc292bb8e68a468f3c8ea23ea17c3f98',90,9,'YABO_BANK','[]',0,'2020-02-25 09:53:11','2020-02-25 09:53:11','2021-02-25 17:53:11'),('2ce48e7938af84895e28e7bf240f4f4af5868198cc483c864cd35d07a14013ff72654341a2fb25a5',31,1,'YABO_BANK','[]',0,'2020-01-29 22:50:58','2020-01-29 22:50:58','2021-01-30 06:50:58'),('2d52d7c3801f888fc35ccc21955beaa4cd2c5f7f754ede524ff514aa810d59938a917a6a79e80f3c',60,9,'YABO_BANK','[]',0,'2020-02-15 09:09:25','2020-02-15 09:09:25','2021-02-15 17:09:25'),('309b7f649f8cfe5a6b0f7651b8c4adf45a2f98ea1ad18ac39bbdc33ad2b73f1a9fc00a83d226d66e',31,1,'YABO_BANK','[]',1,'2020-01-30 00:04:29','2020-01-30 00:04:29','2021-01-30 08:04:29'),('30f3252d5e477b42202008431d62f48a0366bcfc2b9abc4c1ada35e4b3c6181df7aa117a02e9010a',82,9,'YABO_BANK','[]',0,'2020-02-25 06:36:49','2020-02-25 06:36:49','2021-02-25 14:36:49'),('31aef09992243492a95c30e7f50b4f3c79ebc64118c619e8931d72463b0da0e3f194767937dfb984',64,9,'YABO_BANK','[]',0,'2020-02-16 05:35:10','2020-02-16 05:35:10','2021-02-16 13:35:10'),('3228bf1acb80c9efe600ef0ea27231890cbb6a14a5694912c8f6337b5e95fc8a336a8e86bdb02b68',97,9,'YABO_BANK','[]',0,'2020-02-25 12:19:02','2020-02-25 12:19:02','2021-02-25 20:19:02'),('32391219e8b8ad646cc4b0df1b2305de3e091ea799cd8a7648a7313baaa97860dd476d36807910f1',47,9,'YABO_BANK','[]',1,'2020-02-22 15:17:41','2020-02-22 15:17:41','2021-02-22 23:17:41'),('3248a97ad04da9f27daa5e4128cb8219496fb389b2fc853beb560fa048bec6e13bde4b1015a26b39',31,1,'YABO_BANK','[]',1,'2020-01-29 04:02:57','2020-01-29 04:02:57','2021-01-29 12:02:57'),('32b2127a96c077989abfe3f2b089a99814c102a8e10851c7ed79d95095c798d6b3080fd4cefa1084',42,1,'YABO_BANK','[]',0,'2020-01-25 23:45:18','2020-01-25 23:45:18','2021-01-26 07:45:18'),('339eb4c44e7878e6cc0bad8201825a30df63f2e3e676a984ee2a121ecade319d97981a645d82c17f',49,9,'YABO_BANK','[]',1,'2020-02-13 16:47:55','2020-02-13 16:47:55','2021-02-14 00:47:55'),('34e54fab5364e7eb3730a78011dc5fb0c48f0194b5249b4ac924570d4125e898881dac6c133d1797',60,9,'YABO_BANK','[]',0,'2020-02-15 09:09:44','2020-02-15 09:09:44','2021-02-15 17:09:44'),('356c2b3382f4764003f34f531daa9b9a0ad6dc215983461d4f7fce4c19eaa1d495ec32596302be70',49,9,'YABO_BANK','[]',0,'2020-02-21 12:07:29','2020-02-21 12:07:29','2021-02-21 20:07:29'),('36e6ddb1db1ee03eea6c36a4355ea9b5e64d6e6e4678e71f205144d2e0fff7b848a723a0c47091cd',60,9,'YABO_BANK','[]',0,'2020-02-15 09:02:18','2020-02-15 09:02:18','2021-02-15 17:02:18'),('3716e8737aefe8fa20c617e5aec8f927c01731ddfb31a509b887b6c5654291541008dffa0a2e38c3',82,9,'YABO_BANK','[]',1,'2020-02-25 06:32:21','2020-02-25 06:32:21','2021-02-25 14:32:21'),('3891d17bbc8350a36536ca9549b7b24c945ad2f87902fcc154c7344e9a5c2f12777ca68de70ccc9f',45,1,'YABO_BANK','[]',0,'2020-01-30 00:05:16','2020-01-30 00:05:16','2021-01-30 08:05:16'),('3a5892679f85fffa17c425317856982b4933b41d2810b09e21b9fdeb7de64f3e9bb4892d68dd3c20',43,1,'YABO_BANK','[]',1,'2020-01-25 23:59:40','2020-01-25 23:59:40','2021-01-26 07:59:40'),('3a5a37224f724d04bcb8f4536ec36161949c0def9727d02d941ebc01a6f8458d2f975c1f2043fd6c',49,9,'YABO_BANK','[]',1,'2020-02-15 12:59:11','2020-02-15 12:59:11','2021-02-15 20:59:11'),('3c3ab8f9cf049019f1352a74e371a908e0c72c8001318bf0d69c810e2f0cf1ceafe671bd2eef1abd',49,3,'YABO_BANK','[]',1,'2020-02-08 13:49:37','2020-02-08 13:49:37','2021-02-08 21:49:37'),('3d476ee37287fd9e3b8486b1784f7b538a660f7b90b05d663df9b1f56e7a239ae9cb1affd0f759b3',103,9,'YABO_BANK','[]',0,'2020-02-25 13:16:46','2020-02-25 13:16:46','2021-02-25 21:16:46'),('438a341c5aa54bfb899dc37329148948edb26467b4dcfaf489ec1151fcd71d929661ecb215362b01',60,9,'YABO_BANK','[]',0,'2020-02-15 09:01:54','2020-02-15 09:01:54','2021-02-15 17:01:54'),('47b82f89c2cb3c052bb144482ff7dc7d7307d48be486f46cee2397180a73105401531a4429ff23a0',47,3,'YABO_BANK','[]',0,'2020-02-10 14:31:45','2020-02-10 14:31:45','2021-02-10 22:31:45'),('48554e57646985bf782da90473d3a4ec7b2ffef97abeb51719f1ce8d0882ce967b9505998254d5d1',55,9,'YABO_BANK','[]',0,'2020-02-15 09:28:20','2020-02-15 09:28:20','2021-02-15 17:28:20'),('48681cbc7214874c3e85975a139301373e60b8703eadc377ac9a6e574ae8e4d31c3084fa4d46710d',81,9,'YABO_BANK','[]',0,'2020-02-25 06:18:36','2020-02-25 06:18:36','2021-02-25 14:18:36'),('48eff2c1f5fff8edcf2632ff3efabe1fcc5cf089f0efb7a16908f0c06e7f490ea46bae5e680d5bc6',52,3,'YABO_BANK','[]',0,'2020-02-09 05:14:13','2020-02-09 05:14:13','2021-02-09 13:14:13'),('49914c1967fdc8ef26de9b3d181d739dba73c561b688087db73d1da6d8b1a727eb89d79d1735a151',31,1,'YABO_BANK','[]',1,'2020-01-23 00:22:50','2020-01-23 00:22:50','2021-01-23 08:22:50'),('4a8d5292f3e1af9a3aa93eef70c83a4457dd2f0900a0d935148d749b9235b319f789e3d7baf14270',47,9,'YABO_BANK','[]',0,'2020-02-22 11:46:22','2020-02-22 11:46:22','2021-02-22 19:46:22'),('4aab3760d4cdc6016940c66163cddd565aa2bd9cc823bc0203b78c3cba21297af480a0af4533b1b6',53,9,'YABO_BANK','[]',1,'2020-02-15 07:57:33','2020-02-15 07:57:33','2021-02-15 15:57:33'),('4bafef83df70dd4028082a746b4c51a9def52aa49f1c8c09ac6c3b36f981271046b0f8085e81ff0e',106,9,'YABO_BANK','[]',0,'2020-02-25 14:14:30','2020-02-25 14:14:30','2021-02-25 22:14:30'),('4cdc0e89718c50621dad8cd99ba9172bc5fd4a7a0aaa677986bd7c9ac1ea29d1ddd6e50cbe827dda',58,9,'YABO_BANK','[]',0,'2020-02-15 07:41:24','2020-02-15 07:41:24','2021-02-15 15:41:24'),('4febf89380e9cde9f9d4a47300ec727f8427fca4fcb9ef1da1cf9d71e5e0c70622a5fb9f38302931',70,9,'YABO_BANK','[]',0,'2020-02-24 23:59:20','2020-02-24 23:59:20','2021-02-25 07:59:20'),('5045649b2f1194061d956b951fc0e6f72b5e17d73318238d5cdcd4d69b2462eb79e12902740dcdf3',51,3,'YABO_BANK','[]',1,'2020-02-08 07:26:31','2020-02-08 07:26:31','2021-02-08 15:26:31'),('5067781a622d7b3c0f7f58195ef09694fab7735cee327247bee0c38a6aa53f04c791c0aa32fd7d20',34,1,'YABO_BANK','[]',0,'2020-01-31 04:06:21','2020-01-31 04:06:21','2021-01-31 12:06:21'),('5128ca8e9f8687378ceb4158b4ce56a28af38651360b18bc8ec20665bdbb5f9477847cd3920d9a5c',49,3,'YABO_BANK','[]',1,'2020-02-09 05:09:40','2020-02-09 05:09:40','2021-02-09 13:09:40'),('5170095207304a9f2ffe45ecdd6fa94ec2fc3bdec97accc3cbad64f1e4d6dc02b4d4b568e51d7414',96,9,'YABO_BANK','[]',0,'2020-02-25 12:17:37','2020-02-25 12:17:37','2021-02-25 20:17:37'),('5250a63c65ae9374c793469326c0b84722f4a1d23d6ba613ace1b3b88bb72106614087e08521586d',47,9,'YABO_BANK','[]',1,'2020-02-23 07:08:05','2020-02-23 07:08:05','2021-02-23 15:08:05'),('52ea1d91d0fc8a24d4b9df54b4acae987dcc7c5d1f7ff7aae3a3c471d5818fd59efcdb2b73ab268f',76,9,'YABO_BANK','[]',0,'2020-02-25 02:26:27','2020-02-25 02:26:27','2021-02-25 10:26:27'),('53031d190041a265eea084791553fcca793cebe66b74875e12b60cdcb839fed74c7912a1ceb9a5a5',58,9,'YABO_BANK','[]',0,'2020-02-15 07:42:25','2020-02-15 07:42:25','2021-02-15 15:42:25'),('53ab6dd0bdfcc01f12344bd565fb0ef5e5a3354ed6065eedf47d992a101953395cac997529dea8db',49,9,'YABO_BANK','[]',1,'2020-02-15 09:01:54','2020-02-15 09:01:54','2021-02-15 17:01:54'),('5498b09f8057c9a26376f58ceb98265b01f36d36a463e7679bea54722afc8b212d2e2adacf0a7b65',63,9,'YABO_BANK','[]',1,'2020-02-15 08:40:25','2020-02-15 08:40:25','2021-02-15 16:40:25'),('54fec35e40721157419e8ae8aade395119bf23d4ef81685588eaab790164235d2c0d4462995dd2f5',49,9,'YABO_BANK','[]',1,'2020-02-22 15:19:25','2020-02-22 15:19:25','2021-02-22 23:19:25'),('55c07a487fa634f40c84820976a09f85314f3cad57d71d90c61d6a1f994b0ae38b3320bbe18e888a',31,1,'YABO_BANK','[]',0,'2020-01-29 20:04:10','2020-01-29 20:04:10','2021-01-30 04:04:10'),('586ca2ca8f3b702803cca3f2d5c357f289ca1d10e3034b8c54447c232261d474db42659a13dcf4f5',44,1,'YABO_BANK','[]',0,'2020-01-26 00:00:03','2020-01-26 00:00:03','2021-01-26 08:00:03'),('589423bc3b0ec39fa0d4fcea6e461a5d87f502de2be37eb8e8ade064a52da63397b146f614345dd4',49,9,'YABO_BANK','[]',1,'2020-02-24 14:47:47','2020-02-24 14:47:47','2021-02-24 22:47:47'),('58c00bf743cbb457e63056a15e43abeaa0bdd5778fc9119fde5bb57fb3812be2ed9e572244934d1b',31,1,'YABO_BANK','[]',0,'2020-01-23 06:55:23','2020-01-23 06:55:23','2021-01-23 14:55:23'),('59460d72e2a7bb4bedd8da6bf340f1a585b8e4781e8119b0849e4bbf8d944a72a179cfc53a09aade',49,9,'YABO_BANK','[]',0,'2020-02-23 12:24:29','2020-02-23 12:24:29','2021-02-23 20:24:29'),('59c1b047ac43fc3d13f3e8393f5d522d7c567472d296745aac27dd03940ab8eefc4cc8d68a01e59d',49,3,'YABO_BANK','[]',0,'2020-02-10 09:55:22','2020-02-10 09:55:22','2021-02-10 17:55:22'),('5ced80668e7f93bd7e6818b27c4f2169debb8e70c397ab004937078cc21a442fd3c2d891eb5f55cf',31,1,'YABO_BANK','[]',1,'2020-01-29 05:30:50','2020-01-29 05:30:50','2021-01-29 13:30:50'),('5d7c5aa05b6c676f4bbb0d2512f1ccbce631dce5fe36ff714ac7f0a78cadd78bde4e3198b571d32a',43,1,'YABO_BANK','[]',1,'2020-01-29 21:04:24','2020-01-29 21:04:24','2021-01-30 05:04:24'),('5dbd4dd219bc5836ab4abe3dcd2a1b69f5e2ae51311032408fb2ec10263d27724df3fcc964c9cc54',49,9,'YABO_BANK','[]',1,'2020-02-14 14:12:55','2020-02-14 14:12:55','2021-02-14 22:12:55'),('5e804ff9c5c184afb77eb8398e38ab1daf98c6e0169857dea7ecef1d86d079970a29bfe9c6e5abd5',66,9,'YABO_BANK','[]',0,'2020-02-24 09:19:34','2020-02-24 09:19:34','2021-02-24 17:19:34'),('5e81f433223758e08e072613e115fd8449ce4a1c5034c7e064a55a2d126344849c8f99700745015d',34,1,'YABO_BANK','[]',0,'2020-01-30 08:38:54','2020-01-30 08:38:54','2021-01-30 16:38:54'),('6004f4412e119c516165a992e59662fd0c50ba8effa2539f7bf354bd96ac1d8e5cb59be7c26ee9a7',53,3,'YABO_BANK','[]',1,'2020-02-10 11:45:28','2020-02-10 11:45:28','2021-02-10 19:45:28'),('61512dfa20624b7fff21dc30f2a1dfb1587db71632da30cf10c04302a16931fddb173feb6fd896f8',49,9,'YABO_BANK','[]',1,'2020-02-18 13:58:21','2020-02-18 13:58:21','2021-02-18 21:58:21'),('61be405f50c246aeac5196f0c4b7816a69f83f9102a01f7c060e775c994f32a5e9fc2938a17d85d6',83,9,'YABO_BANK','[]',1,'2020-02-25 07:53:49','2020-02-25 07:53:49','2021-02-25 15:53:49'),('6588478869941d23d4374cbc6782af91a3118f059520f88b932f8971c45147ce48884d976ca27464',31,1,'YABO_BANK','[]',1,'2020-01-29 23:59:53','2020-01-29 23:59:53','2021-01-30 07:59:53'),('6a61c487a05954d4e0c6848b04d54b20599c4e2d56b8c030d35f356f526d811acacf37625352f5eb',83,9,'YABO_BANK','[]',1,'2020-02-25 06:52:23','2020-02-25 06:52:23','2021-02-25 14:52:23'),('6a9a11a7792154947b379df7457a7f58cf0c850fb0ffd2660c4b0c992f5d12492cec5b00452914da',54,3,'YABO_BANK','[]',1,'2020-02-10 14:18:06','2020-02-10 14:18:06','2021-02-10 22:18:06'),('6b751e768274ffd212bf3875884eee2c21fdcbf31fdfe34e4f1738078294ee0fdc8d6035e3525de4',43,1,'YABO_BANK','[]',0,'2020-01-29 23:40:15','2020-01-29 23:40:15','2021-01-30 07:40:15'),('6d08587e11c296a2e001e2b90a97756b3ea101cb253fb2dede6da05e09058c5f0907d37f8ada86db',43,1,'YABO_BANK','[]',1,'2020-01-29 21:41:53','2020-01-29 21:41:53','2021-01-30 05:41:53'),('6e79a1ee38d82f755e4a6f16a2dcb0d75047194fdfda6fb0dfdf0faffef93dd62970b7204c851a6e',55,9,'YABO_BANK','[]',0,'2020-02-24 12:54:05','2020-02-24 12:54:05','2021-02-24 20:54:05'),('6fe06c26450aef356a3c1849edcf5f62cf9459d00a8e997a5634ef692b7ab2b52117808ccf6bbfd4',49,9,'YABO_BANK','[]',1,'2020-02-17 14:07:20','2020-02-17 14:07:20','2021-02-17 22:07:20'),('725217c5113086f9498383ee1a87c254638adbea8ee2a2b7e889e55d53ed434cd49c7f3c6e28dcac',49,9,'YABO_BANK','[]',0,'2020-02-25 10:04:55','2020-02-25 10:04:55','2021-02-25 18:04:55'),('72bd6bf14e7cb9bfcb55b7b89cdf7bf23e2ecc0e02bbd5c38475463bc7f2e6861491b05ce27e0bee',31,1,'YABO_BANK','[]',1,'2020-01-25 10:17:02','2020-01-25 10:17:02','2021-01-25 18:17:02'),('73072aae62463982bf6c2b000cbcebd0617988fb13a52448e2ec3db5789ef8f49d44e2df2bdca437',49,9,'YABO_BANK','[]',1,'2020-02-16 09:16:45','2020-02-16 09:16:45','2021-02-16 17:16:45'),('749d8ec961cadf57c660037fe6bc4e9651ec9ba8d84fb4ae8046dbe27ec3ae250e1a5ffc01f3b1cf',58,9,'YABO_BANK','[]',0,'2020-02-15 07:56:22','2020-02-15 07:56:22','2021-02-15 15:56:22'),('75583c235ea48f9497f178a82574bf0ec2892f4d53f6e93c45c9f76f731da63943e02da46d1b1854',49,3,'YABO_BANK','[]',1,'2020-02-12 06:02:41','2020-02-12 06:02:41','2021-02-12 14:02:41'),('771ad907e916b63b3e910c9044cfba78d390fae26f7071e6126231050aec51358fba01a6f92e01e0',47,3,'YABO_BANK','[]',0,'2020-02-09 05:17:14','2020-02-09 05:17:14','2021-02-09 13:17:14'),('7745cdb3fd04e1bd83617909fee64f025ad5a9cb66c8205b0157d635c7ca99174fe7fef4d2656378',47,9,'YABO_BANK','[]',0,'2020-02-22 11:40:48','2020-02-22 11:40:48','2021-02-22 19:40:48'),('775a2ea8bd236d4a459e63776420712c139a70181d5104d977ba82532eb647104c4352f193594b17',47,9,'YABO_BANK','[]',1,'2020-02-23 07:59:34','2020-02-23 07:59:34','2021-02-23 15:59:34'),('7764b5ef7253dab8a67258b587ea333413d38025295292e5e94099d49d8c9a5c0411eb406bbcbfec',60,9,'YABO_BANK','[]',0,'2020-02-15 09:11:55','2020-02-15 09:11:55','2021-02-15 17:11:55'),('779ac2ec951e0584fbd5bbbd62d1e588ad2ca5776f877a2e81a70eb3c770d7d1fdcf287cb16431d2',105,9,'YABO_BANK','[]',0,'2020-02-25 14:10:28','2020-02-25 14:10:28','2021-02-25 22:10:28'),('77f637aa96a41bb22f8b4d28c7d3802d64a51ec64a7c104888a45e079886aacde248a9178e8e73df',84,9,'YABO_BANK','[]',1,'2020-02-25 12:35:02','2020-02-25 12:35:02','2021-02-25 20:35:02'),('789e4c774cf343bf4c0899d183bc993652f4a8c534eaf85f09592fedf365c3a1568e4fb5833fcfcf',53,3,'YABO_BANK','[]',0,'2020-02-12 14:17:19','2020-02-12 14:17:19','2021-02-12 22:17:19'),('78a02a47ff6c33067d61623643c1ee4e1a6eeddfd866a7ca43e6f08cf072a0e06c93c4c16bfd4c95',49,3,'YABO_BANK','[]',0,'2020-02-10 14:24:30','2020-02-10 14:24:30','2021-02-10 22:24:30'),('78cc901daa511e8927f476eeb3aad72347280df5d9b6e15462e74f61ca4b5e40fd5ff60832d74515',31,1,'YABO_BANK','[]',1,'2020-01-27 06:15:52','2020-01-27 06:15:52','2021-01-27 14:15:52'),('78fd9761a3a54ba5e431e4bc64e1c7050c47816da9a93e0c0a37cce7f4d5689f0b70c1895ef7d6aa',79,9,'YABO_BANK','[]',0,'2020-02-25 05:47:23','2020-02-25 05:47:23','2021-02-25 13:47:23'),('7987df1764d18c2611958f6421232b3cc1295765a4e0580468f000cb37a4dc83547e1308766f0793',49,9,'YABO_BANK','[]',1,'2020-02-22 11:46:59','2020-02-22 11:46:59','2021-02-22 19:46:59'),('7999735490d10fe3829a9e1db8caf17b9147431879ccd01161c87244d8c413a7e435298cd67058d8',49,9,'YABO_BANK','[]',1,'2020-02-21 14:54:46','2020-02-21 14:54:46','2021-02-21 22:54:46'),('7a5f2a7ae1607a19ebcdfc265959ac6202a58d0be70d979cfb1a51ef4f0b5a90711c1c46c94f5833',49,9,'YABO_BANK','[]',1,'2020-02-25 05:59:09','2020-02-25 05:59:09','2021-02-25 13:59:09'),('7c7f94e271069dd7869dbd88ad55394724af173eb0f39cdc0a62101440048f6a959665991618de99',46,3,'YABO_BANK','[]',1,'2020-02-08 07:17:50','2020-02-08 07:17:50','2021-02-08 15:17:50'),('7dc54baac141358aeb3c4cd3f744cee0f3621e16261f70f4250872876711c3b96deb260175d1be03',76,9,'YABO_BANK','[]',0,'2020-02-25 14:12:55','2020-02-25 14:12:55','2021-02-25 22:12:55'),('7eb81b20854c1159b8434c7c028bfdf43bbf77c26ea71747555e59a4b9df021f97ed69b41ffc9dd7',53,9,'YABO_BANK','[]',0,'2020-02-24 19:35:29','2020-02-24 19:35:29','2021-02-25 03:35:29'),('7f1550baabee3228ab0c418485993be0759b57bb205b613c135b8d274a338a50cf0147dbdfaa0690',34,1,'YABO_BANK','[]',0,'2020-01-25 04:14:06','2020-01-25 04:14:06','2021-01-25 12:14:06'),('8032cc0e10c4d2b90b0a6cc9604aea93b779c0ca87aa6ec7ee43a7b6874d477f2df4830732c72731',100,9,'YABO_BANK','[]',0,'2020-02-25 12:37:42','2020-02-25 12:37:42','2021-02-25 20:37:42'),('80ab7a9e4a0fb75c78353a7e72b22c102a3c8bf53a445d989a16931783e3a3108978086cdc46af15',74,9,'YABO_BANK','[]',0,'2020-02-25 00:28:04','2020-02-25 00:28:04','2021-02-25 08:28:04'),('84647e62f01f9cf35311a284aecfb671e8612c3cdd4bddd0a7e30260d13cc93123cc3f0390d31545',34,1,'YABO_BANK','[]',0,'2020-01-25 03:28:59','2020-01-25 03:28:59','2021-01-25 11:28:59'),('84df74a4f5acaffbcc8237f7d7e063be5353d051fe7722b55b265613ed2ae2fea000f5b1e1cf6789',31,1,'YABO_BANK','[]',0,'2020-01-29 03:23:48','2020-01-29 03:23:48','2021-01-29 11:23:48'),('85ecd0a7448c583cdf9dae9cdebc9b9d0dbfff9b4deebf96912a37888658362d32b2f9870fda44c7',49,9,'YABO_BANK','[]',1,'2020-02-16 04:44:21','2020-02-16 04:44:21','2021-02-16 12:44:21'),('8614e84cbfbeeb640a97c7ffc88c3f29256f4477f47e3140b5a01b66082978025a214a14b055af2f',64,9,'YABO_BANK','[]',1,'2020-02-22 11:01:49','2020-02-22 11:01:49','2021-02-22 19:01:49'),('876e4b5dc318e2d1281abfdbd83ee4180c7423b173da424948ba78abcffc73be665cd7c955f27fa3',34,1,'YABO_BANK','[]',0,'2020-01-23 05:09:54','2020-01-23 05:09:54','2021-01-23 13:09:54'),('87c6b5c942c9ccc07ef8e4b6a8d75ac71eb56821458807e29dce789d94814868c0b7dd87283cc322',104,9,'YABO_BANK','[]',0,'2020-02-25 13:54:21','2020-02-25 13:54:21','2021-02-25 21:54:21'),('87d807a3f533f399d46d333f15a46c46a11f096453018279b9b687548d09d9cbcfa0ddb919fb11fe',64,9,'YABO_BANK','[]',0,'2020-02-15 09:28:48','2020-02-15 09:28:48','2021-02-15 17:28:48'),('8adf8cc1bf5b67270bc960fd29f415f38c1ee10b15a3e25ac6a5fc6ac18fa06c26d60fe0dde27096',49,9,'YABO_BANK','[]',1,'2020-02-16 11:34:17','2020-02-16 11:34:17','2021-02-16 19:34:17'),('8b41c8f4fb352f26944d9122250205c97d8288338529b6e64cdcd9e79ed9bf15dc6854951657d7a9',47,9,'YABO_BANK','[]',1,'2020-02-15 09:20:23','2020-02-15 09:20:23','2021-02-15 17:20:23'),('8bff8c0d86fd984aed6bf462b8745fa3e9b361e2671a0380d72f89cb7b8f66efc291b648d4868d28',34,1,'YABO_BANK','[]',0,'2020-01-25 04:11:22','2020-01-25 04:11:22','2021-01-25 12:11:22'),('8f0348636941d9c6097a09cf9ece311cd95f3e360cb4cce9b33861d2d7137daf9a5f5d018334e9eb',98,9,'YABO_BANK','[]',0,'2020-02-25 12:32:31','2020-02-25 12:32:31','2021-02-25 20:32:31'),('8fd3641a9d2089ffa97e81b29cb65d2dc39b36c656dba08a9f21d1899b3a4dcde31fd9a617b3b4f7',31,1,'YABO_BANK','[]',0,'2020-01-25 05:40:07','2020-01-25 05:40:07','2021-01-25 13:40:07'),('90b8a62a57d7ae3572751fae715d2f687d8267aed8f951f1029d69d297215b4ceddffec40e69e168',64,9,'YABO_BANK','[]',1,'2020-02-15 16:26:02','2020-02-15 16:26:02','2021-02-16 00:26:02'),('90e32d80f40fdbe0b615aa10bad9cfeecc9a544654904a3124e2f77572ffee41fe3f247897369254',34,1,'YABO_BANK','[]',0,'2020-01-25 04:22:34','2020-01-25 04:22:34','2021-01-25 12:22:34'),('912cd54c9e9739c52b28060e45713363f8d7dbd5746981d3e6705ceb10cff17585d887774732cb10',95,9,'YABO_BANK','[]',0,'2020-02-25 12:16:44','2020-02-25 12:16:44','2021-02-25 20:16:44'),('9217a63ae4f2a730d4e48a7c80912b3c675db055bada4c5315ffdacc7ed7901d350c30c6e9584a17',91,9,'YABO_BANK','[]',0,'2020-02-25 10:22:05','2020-02-25 10:22:05','2021-02-25 18:22:05'),('944192e8054ed09b3e07cc7be9b34c18e7f1105406f0fe101f6e74caaa6b0adbc36218f443d45ed1',53,3,'YABO_BANK','[]',0,'2020-02-13 11:51:43','2020-02-13 11:51:43','2021-02-13 19:51:43'),('95431d7dfa8cb82f3903947857a0d9781b62b210e00a2f78dd3d606c233468cc2828fee078106387',31,1,'YABO_BANK','[]',1,'2020-01-25 10:18:03','2020-01-25 10:18:03','2021-01-25 18:18:03'),('95ee65619a3c6a33d259a30ac88e66377e2b7a6ab5f04cb5022039e07dd0a82ad0b16a591e17ac5a',49,9,'YABO_BANK','[]',1,'2020-02-15 16:03:11','2020-02-15 16:03:11','2021-02-16 00:03:11'),('969a872d1f24dc0fc590b323c2022225ab4b48a474e88019b66ab5ed57493da46b9a12eee8b8c63d',43,1,'YABO_BANK','[]',1,'2020-01-26 06:09:20','2020-01-26 06:09:20','2021-01-26 14:09:20'),('96e5c035d72db86d133fa807874c660944f1739a2c9d2892e40738e9b37521a2d3ada35826e0b5d1',91,9,'YABO_BANK','[]',0,'2020-02-25 10:20:37','2020-02-25 10:20:37','2021-02-25 18:20:37'),('98b647c9890eba7011e0adbc052f9a2264d5283594368a33ed5a35d38220869a8c7fe91125dee100',51,9,'YABO_BANK','[]',1,'2020-02-25 05:59:55','2020-02-25 05:59:55','2021-02-25 13:59:55'),('98bb56a7a6150473ed79a3ed5b793315e5d924fc10168b758ac4b04c083b48f32768fb2809a86ecd',49,9,'YABO_BANK','[]',0,'2020-02-23 07:08:21','2020-02-23 07:08:21','2021-02-23 15:08:21'),('99d01696318c43924c7d34f7ad2ba8eb2795cb26b19a49f393aafecf3bce68382b974f06f34b0cb1',78,9,'YABO_BANK','[]',0,'2020-02-25 05:29:47','2020-02-25 05:29:47','2021-02-25 13:29:47'),('9a5ea65540aff00f90150a295e2de86c0ee11529d20fd41e1dd1893670ebaaa5fc9b2a68e5ed5bd7',34,1,'YABO_BANK','[]',0,'2020-01-25 04:31:15','2020-01-25 04:31:15','2021-01-25 12:31:15'),('9b38b6fed0f657d9a820011b3e38e3c6b38e09c148ff26142f486ed34acfae96283edc005ccff2c0',43,1,'YABO_BANK','[]',0,'2020-01-26 00:26:38','2020-01-26 00:26:38','2021-01-26 08:26:38'),('9b48c3ee0ea4fcdc9ae54f8766489c445d809eab0fee2c231be58a3fd23b32fa581e961560d55c52',88,9,'YABO_BANK','[]',0,'2020-02-25 08:23:18','2020-02-25 08:23:18','2021-02-25 16:23:18'),('9ca79b18e2154031051f67651bb0bb86b998c332a97bc4631300ced6734a33a11167d440cd8f5e24',64,9,'YABO_BANK','[]',0,'2020-02-22 06:45:15','2020-02-22 06:45:15','2021-02-22 14:45:15'),('9d3a5c105ccd9b91605b363115c73791f08b6fc464357b028b95dc9c06522e5fd0c1c5641f409648',86,9,'YABO_BANK','[]',1,'2020-02-25 08:13:51','2020-02-25 08:13:51','2021-02-25 16:13:51'),('9debab4f97497cbcec163624dc760a00ed85263714fd9d11df58b502cfc9603011ef3fb43fd548cb',46,1,'YABO_BANK','[]',0,'2020-02-04 09:29:35','2020-02-04 09:29:35','2021-02-04 17:29:35'),('9dedd360ba2399104a99538978338ce4430f28fbec308e01ad6c44a65417dbf2a4cf64bd7f6a67aa',47,9,'YABO_BANK','[]',0,'2020-02-22 11:40:05','2020-02-22 11:40:05','2021-02-22 19:40:05'),('9fab4fb0995a7ca4e36cdb3ff280f8320c7df29397d20472b559e70fc538d89100c4113fdb0ca1f5',50,9,'YABO_BANK','[]',1,'2020-02-25 05:58:11','2020-02-25 05:58:11','2021-02-25 13:58:11'),('a03a9f4b92f37716095ea70b60f695bc923865d451b3a61f461b0bbdab56455de54cc54b70abf25f',65,9,'YABO_BANK','[]',0,'2020-02-15 10:20:23','2020-02-15 10:20:23','2021-02-15 18:20:23'),('a0f03a5eb22c70517094c6eb3e3f7d15fd1d5f228eeecf31cbe93cdc29e6afe41a26d72c42db9526',51,3,'YABO_BANK','[]',1,'2020-02-08 07:31:26','2020-02-08 07:31:26','2021-02-08 15:31:26'),('a0faf9ad455326ac9d1518f22ee1ab4bfb27eceb4b6eaebf7dca5689c48da08f22c54fc262f98745',49,9,'YABO_BANK','[]',0,'2020-02-13 16:56:14','2020-02-13 16:56:14','2021-02-14 00:56:14'),('a1f847c8c8b8b3a06ffdac16e5b686706fe4c81aae94957b520ec81f840d412a77ba4ed4770efd17',53,3,'YABO_BANK','[]',0,'2020-02-10 16:14:44','2020-02-10 16:14:44','2021-02-11 00:14:44'),('a5d7672431920921a25fdfd9313da42eacdc6a872228f9fc3a58cdc870e5b805f97c7dfefd9f0656',43,1,'YABO_BANK','[]',1,'2020-01-29 23:54:57','2020-01-29 23:54:57','2021-01-30 07:54:57'),('a5d7d9d897c9fa8a5863b41e825deceb09200b7f0342e12a83e831cbbe2eb0682fdd88dc8e547990',41,1,'YABO_BANK','[]',0,'2020-01-25 23:31:43','2020-01-25 23:31:43','2021-01-26 07:31:43'),('a647dd70b4257171c599e609e6459090a6eff02aca98ad9df26da87a1689de0d5ef4613b4dbf1665',55,9,'YABO_BANK','[]',0,'2020-02-22 12:18:42','2020-02-22 12:18:42','2021-02-22 20:18:42'),('a64b21c5c273c07944bc8aee48994592850105317dde1452717ffdf66facf4f4b44518a2fff8dbfb',55,9,'YABO_BANK','[]',1,'2020-02-18 23:03:07','2020-02-18 23:03:07','2021-02-19 07:03:07'),('a67cabd9127019b4ec17edb2d1b41b696a87e1bfbdc26153be25fcaf7770f52f8ff5caac5dceaf4e',64,9,'YABO_BANK','[]',1,'2020-02-24 19:34:34','2020-02-24 19:34:34','2021-02-25 03:34:34'),('a68913158daa191497aef79e0cd4f081c91471267b9ff2f2ca2a42e9efef1956f55b929de42c7ff0',49,9,'YABO_BANK','[]',1,'2020-02-21 12:34:25','2020-02-21 12:34:25','2021-02-21 20:34:25'),('a7eecabec60163b455e1b9adb095293403671c9eaa07119dedb9edb5287d1f814e983c308c41533e',43,1,'YABO_BANK','[]',1,'2020-01-26 00:23:11','2020-01-26 00:23:11','2021-01-26 08:23:11'),('a89a13bfb12c9b13840aea60aacc7fe33915dc2e234898e1c3f97dcdf6c81b8633435caa6f1bc4bd',31,1,'YABO_BANK','[]',1,'2020-01-27 06:04:00','2020-01-27 06:04:00','2021-01-27 14:04:00'),('a8c4cc6b46fe221b261896110e4953f1e5a15bf25291bf7753741c1bacb4cd0d09fc9923c4eb05f5',99,9,'YABO_BANK','[]',0,'2020-02-25 12:32:56','2020-02-25 12:32:56','2021-02-25 20:32:56'),('a9aa9d54915db956a4e192027d6f4aca52f89474848a94036382b6ddc7cf16f14bd3593af8ca9047',47,9,'YABO_BANK','[]',1,'2020-02-22 11:54:53','2020-02-22 11:54:53','2021-02-22 19:54:53'),('ac8083d1f90359cad006d1c7844327f7e55d110012b5e66d6fb73511e5cddc252737564e8ce70818',49,9,'YABO_BANK','[]',1,'2020-02-16 09:37:51','2020-02-16 09:37:51','2021-02-16 17:37:51'),('ae91288d36cac67f39ef399d5a477301a90478b0d3bb02475d8518e6aac62bb2ea52c807ac1fe511',47,3,'YABO_BANK','[]',1,'2020-02-09 03:32:31','2020-02-09 03:32:31','2021-02-09 11:32:31'),('af03d59afdaa81ad2a0c59def720ff199c60b8cf155526048ccec097bec35f7363c8ff9abe4aaaab',49,3,'YABO_BANK','[]',1,'2020-02-08 13:54:41','2020-02-08 13:54:41','2021-02-08 21:54:41'),('af6b629fa23d5c188811b8fd7ee65f1744ac2853aae2a301f5387c431a3285d0de479d774766eb79',31,1,'YABO_BANK','[]',0,'2020-01-26 05:31:43','2020-01-26 05:31:43','2021-01-26 13:31:43'),('af8253624d5dd138aa3e5114943fc7d7033f5512a107c24d1a59e5c28dc45d29bae8c2433871b3a8',31,1,'YABO_BANK','[]',0,'2020-01-23 01:10:53','2020-01-23 01:10:53','2021-01-23 09:10:53'),('b068b96046ed1978a6aa45f84a497268bfeeb42d0fda14aecdaed8f5747486042859de05e598ff78',45,1,'YABO_BANK','[]',1,'2020-01-29 23:56:20','2020-01-29 23:56:20','2021-01-30 07:56:20'),('b0e6a7585ae1fb284b77fc5fd7de0576b8a4335b3de5117c314dd6cae61041a3c37c16398ba3405f',84,9,'YABO_BANK','[]',0,'2020-02-25 12:40:58','2020-02-25 12:40:58','2021-02-25 20:40:58'),('b134d79c150104368520fe3a41c84469e8aeccd6fc5858d645d6e0ff2f21366579928b41bf7e85c5',85,9,'YABO_BANK','[]',0,'2020-02-25 07:42:05','2020-02-25 07:42:05','2021-02-25 15:42:05'),('b2a17d112c88d047d4e0013b167ddf12e81b2a703ce692de5e345c824b10a31b9abdab84f9cdec55',34,1,'YABO_BANK','[]',0,'2020-01-25 04:24:04','2020-01-25 04:24:04','2021-01-25 12:24:04'),('b327c4eb76ce78b2ecfb9dd9fdcfa105346ee406766290dfb3d716d1106c3cdafc37c7dab562cfb6',64,9,'YABO_BANK','[]',1,'2020-02-22 11:55:54','2020-02-22 11:55:54','2021-02-22 19:55:54'),('b4c29a4bafb14f4a3b96a78ab239250a00fb3f2b067fd8b57234b13edc167e1ca426d18000e90696',31,1,'YABO_BANK','[]',1,'2020-01-25 23:45:02','2020-01-25 23:45:02','2021-01-26 07:45:02'),('b51011d763c489e167e5599b1d0d229dd48d3e16de9c7d808b9959a931c03ff0a9ed54f82a540fd4',31,1,'YABO_BANK','[]',1,'2020-01-29 05:24:41','2020-01-29 05:24:41','2021-01-29 13:24:41'),('b534f3fadc4a2f6848dc306d668f33ae5fc4ef949d68a1a13eef9d7139bf3beed0d8e635af719652',49,9,'YABO_BANK','[]',1,'2020-02-16 05:30:15','2020-02-16 05:30:15','2021-02-16 13:30:15'),('b5babc6cf50e31b89ff0bfca51509c84ce3c81d9b127adde1756330abf3661169c174d0e83885ade',62,9,'YABO_BANK','[]',1,'2020-02-25 06:00:49','2020-02-25 06:00:49','2021-02-25 14:00:49'),('b663588c5e275845880bdd9e854d180cb7fb4eb3cdea4f275d44fe92d41de78461291424c4276c1d',34,1,'YABO_BANK','[]',0,'2020-01-25 04:34:04','2020-01-25 04:34:04','2021-01-25 12:34:04'),('b6e7e1fed25536b3f7346ded414d151fba16bd0b277fccf5b2fe76188e694c5b16db6f8bdc413584',47,9,'YABO_BANK','[]',0,'2020-02-23 15:13:49','2020-02-23 15:13:49','2021-02-23 23:13:49'),('b7ad08a24f28e6dc0303b4d659d771e0774c093523da7df0008cbfea11eecca0933f1b2a87d52d7e',60,9,'YABO_BANK','[]',0,'2020-02-15 07:57:12','2020-02-15 07:57:12','2021-02-15 15:57:12'),('b7c621f35ad0e749f93498ce73634fd39e9850c844da849fa775a653d884e4880f76327657066965',92,9,'YABO_BANK','[]',0,'2020-02-25 11:03:47','2020-02-25 11:03:47','2021-02-25 19:03:47'),('b87d5f655355548741ede2cf430456d5f5de1258fd192271f96d11e23b1329ac566966d52297a64e',49,9,'YABO_BANK','[]',1,'2020-02-16 05:52:15','2020-02-16 05:52:15','2021-02-16 13:52:15'),('bacdf8781eca4e37bbb3b92c0a7361c244d289cb5cc63c9ec97a01ba23fc0e3f558d20b297f967d2',83,9,'YABO_BANK','[]',0,'2020-02-25 07:54:42','2020-02-25 07:54:42','2021-02-25 15:54:42'),('bb4977d75b5180969ffd7cc903860c6382343d9cbfcc94168dbd47777af8ad3bc652fb08b30714dd',34,1,'YABO_BANK','[]',0,'2020-01-25 04:12:31','2020-01-25 04:12:31','2021-01-25 12:12:31'),('bce51abe0dc2dc4062c6938666a7c00361d7df364f18ddcf6a9fd4b59bd1dc4042e5f2101b992d0e',53,9,'YABO_BANK','[]',1,'2020-02-15 10:36:31','2020-02-15 10:36:31','2021-02-15 18:36:31'),('bd8d51d08093c9682fa811943ded74e396df59220cf00feea7a16be88d731fd73f5f87d2c568afb7',8,3,'YABO_BANK','[]',0,'2020-02-10 16:10:18','2020-02-10 16:10:18','2021-02-11 00:10:18'),('bde8f69a53875ed145a0ead26c817222326b935973558d2d2fadcd932eed4bf15037291c2b625408',34,1,'YABO_BANK','[]',0,'2020-01-30 21:12:40','2020-01-30 21:12:40','2021-01-31 05:12:40'),('be16de60eb912ec954376b3de77c4691e72dc462d91e29c8d28b9926ede047d9ab6753a530ff41ac',60,9,'YABO_BANK','[]',0,'2020-02-15 08:22:29','2020-02-15 08:22:29','2021-02-15 16:22:29'),('bfa26f5a32b9ebc13c6adcfc0e908c0368f846b56696de7b40abbe21d175e0362f19fb0c872b814c',55,3,'YABO_BANK','[]',0,'2020-02-12 12:53:36','2020-02-12 12:53:36','2021-02-12 20:53:36'),('c20f1251777276d8ac841285dd14b91111b6882310345db543790b3143e2db12106b43c60b5229e4',47,9,'YABO_BANK','[]',1,'2020-02-22 12:42:00','2020-02-22 12:42:00','2021-02-22 20:42:00'),('c25fac14b78f77fed2350d0a458b7276b49bad24fb7437ff0f9ccd72445fffc2a18ff3c4c06c157d',31,1,'YABO_BANK','[]',1,'2020-01-29 05:18:14','2020-01-29 05:18:14','2021-01-29 13:18:14'),('c2c7890395b6e67314fdb27f83cbebba0c4f80b9a8f65c8194ca5b37ac0056279552f6e9cc6d6752',31,1,'YABO_BANK','[]',1,'2020-01-25 10:21:09','2020-01-25 10:21:09','2021-01-25 18:21:09'),('c337628dd95eee39a305b460e98bb9670f866bdc0de16d2c52136ce2e82e5e9f6f0f24e227022fa0',31,1,'YABO_BANK','[]',0,'2020-01-23 01:05:53','2020-01-23 01:05:53','2021-01-23 09:05:53'),('c340e99610350e25c4c799beafe8a7d8ee6c51b35710c156c49f88b35889b940fcfd744fd0bc0c96',49,9,'YABO_BANK','[]',0,'2020-02-22 11:55:21','2020-02-22 11:55:21','2021-02-22 19:55:21'),('c94b446dc5a15e184956ae0d3f8ef35f57bf59563934830e2684262d6a80830e0da45ca00c70921c',49,9,'YABO_BANK','[]',1,'2020-02-16 09:06:18','2020-02-16 09:06:18','2021-02-16 17:06:18'),('c958700d1e30a0b737fbec14978447411d0702067c64547fb6121bdba54d46841764dd932a332049',31,1,'YABO_BANK','[]',0,'2020-01-23 01:10:12','2020-01-23 01:10:12','2021-01-23 09:10:12'),('ca5dd491efada444beae8296426422060bd72f2b2f4f21bee23c62bc2a0bf2d208ac3c1ccbe8de7b',47,9,'YABO_BANK','[]',0,'2020-02-24 09:51:40','2020-02-24 09:51:40','2021-02-24 17:51:40'),('cc5077fd7893cf57591f08394d2750be50b755fe80d90bd2a78ff690b1d15eb0f45f366c3669ede9',53,3,'YABO_BANK','[]',1,'2020-02-12 12:52:49','2020-02-12 12:52:49','2021-02-12 20:52:49'),('ccb23c212f859c7722bd443252a8f39855bc329f851a2c5c29cc5e2d471491499b747bcbedf74511',47,9,'YABO_BANK','[]',0,'2020-02-22 15:19:08','2020-02-22 15:19:08','2021-02-22 23:19:08'),('ce85027d63744887879ccf5238ef0b7419b7cc1d2c71287b2521973933d4bc2aa24f28c25cf92324',31,1,'YABO_BANK','[]',0,'2020-01-27 06:24:20','2020-01-27 06:24:20','2021-01-27 14:24:20'),('cf86f6a97ac1ddac105d7a2c03ecf828092ed839a32cfe091b97deec58fbd22a0250574c8eeecc13',67,9,'YABO_BANK','[]',0,'2020-02-25 03:23:24','2020-02-25 03:23:24','2021-02-25 11:23:24'),('d0402d3d21f0ffc40c52462a9719413f74d2e726b8f254221fdaf8f70d9db4d3b2736bfaf1ad9c2e',58,9,'YABO_BANK','[]',0,'2020-02-15 07:47:49','2020-02-15 07:47:49','2021-02-15 15:47:49'),('d5e63b38b851860a8f702e21df341fed2bc3f267f91b47a45e10fe9ecf7298976628bd6da976a2f0',47,1,'YABO_BANK','[]',0,'2020-02-04 09:37:07','2020-02-04 09:37:07','2021-02-04 17:37:07'),('d6dc0b81ced0157796607e17edd2bf1e7375997f9fd2df34aa827a8939d22e743bd6ee7362eb3ee5',31,1,'YABO_BANK','[]',0,'2020-01-23 01:00:36','2020-01-23 01:00:36','2021-01-23 09:00:36'),('d7199a5e2598d7939a442c31a4c4598b2b0b4e6587dbb570cfac34420a578d0c167098d92e9c0136',34,1,'YABO_BANK','[]',0,'2020-01-25 04:09:05','2020-01-25 04:09:05','2021-01-25 12:09:05'),('d75ad61b6fc4719dda257165f4a813f6edabc2628a13d9e31f760d3e4dace8df0b8f8c0f921c7f10',47,9,'YABO_BANK','[]',1,'2020-02-22 12:51:02','2020-02-22 12:51:02','2021-02-22 20:51:02'),('d792998564a51231cc116b7acd2433831054fc2542fb4dc7cb8c1e19447a161c52d0cbb150d46af1',49,9,'YABO_BANK','[]',1,'2020-02-22 14:55:23','2020-02-22 14:55:23','2021-02-22 22:55:23'),('d7b9c99de45dfa2133dec5886948bcd9f6e5ce0ce49f2a973aadf5e0290412593b30683f181630ca',49,9,'YABO_BANK','[]',1,'2020-02-22 11:40:28','2020-02-22 11:40:28','2021-02-22 19:40:28'),('d8e80682a379969640e83871a444b680abc383a6b9f4a6adb7f3453cb2f22a2f2ade776a7e5d9f2b',75,9,'YABO_BANK','[]',0,'2020-02-25 00:41:57','2020-02-25 00:41:57','2021-02-25 08:41:57'),('d9618285ab7b0b50c9f7d5bded9526d6bf40b5e641c6d50131eff61e07ad3958c81bd55a4dbb5cd4',49,3,'YABO_BANK','[]',1,'2020-02-10 13:41:46','2020-02-10 13:41:46','2021-02-10 21:41:46'),('d9be99deb4f0a33c1e3be27f095b7babf38c60acb38eda23c090f4af8e98fe3f3ea4f69be02782a1',41,1,'YABO_BANK','[]',1,'2020-01-25 23:36:43','2020-01-25 23:36:43','2021-01-26 07:36:43'),('dbfa28ecda4bd7bd4e456f3bd21155b80a5e108c0032cdadb2d84702551dfb2168419170b6661044',53,9,'YABO_BANK','[]',1,'2020-02-15 07:41:59','2020-02-15 07:41:59','2021-02-15 15:41:59'),('dc9bcfe27508401863c80dc6a807e3ffd390de11e55b8b8970af6db7e6bd8fe2cece6ef41b529499',49,9,'YABO_BANK','[]',1,'2020-02-16 04:57:24','2020-02-16 04:57:24','2021-02-16 12:57:24'),('e0a60196d9696571d64943f72126b17a71b4131b299b5976728487d6779623b33a2241cd0188e870',34,1,'YABO_BANK','[]',0,'2020-01-25 03:00:01','2020-01-25 03:00:01','2021-01-25 11:00:01'),('e0da549ff2ab7514c657e2d79a28e4c4a7c850b2cbe568438e3dee39db23f72f3d6a388c076758be',84,9,'YABO_BANK','[]',1,'2020-02-25 07:05:49','2020-02-25 07:05:49','2021-02-25 15:05:49'),('e278660ca1b8e2da774d4595e2c90c14b34a67dc99b4a0baec009a1b01e1231bf03b6a9530ba057c',47,9,'YABO_BANK','[]',1,'2020-02-22 05:38:36','2020-02-22 05:38:36','2021-02-22 13:38:36'),('e29938697d34f316c569cc5b34617db359d85ef9f7cb7c8e8a669d42ca81b5ef8680c31ac3db61d8',68,9,'YABO_BANK','[]',0,'2020-02-24 15:50:41','2020-02-24 15:50:41','2021-02-24 23:50:41'),('e4b408431666a0b519758b39e7fd6cb529a28142e00df7802bb997dfe3c4befc2e8e25c144b5cf17',53,3,'YABO_BANK','[]',0,'2020-02-10 11:55:14','2020-02-10 11:55:14','2021-02-10 19:55:14'),('e51d0305c54637e3a94f3fb131fe07be5aee2551585b6dfb39bd8af5537ca814c60f1ef7f8408363',34,1,'YABO_BANK','[]',0,'2020-01-25 04:28:44','2020-01-25 04:28:44','2021-01-25 12:28:44'),('e5d04370b901a4a91e324ac5d0668895d770efeb4f96e7e25e7302cbe97af4391e2a5afac4417a25',49,9,'YABO_BANK','[]',1,'2020-02-15 07:56:43','2020-02-15 07:56:43','2021-02-15 15:56:43'),('e6dab196afeea04ac6ed50ba0da1399a7ed7a555622a48532c0f270772893e838bbf463e4f68889b',49,9,'YABO_BANK','[]',1,'2020-02-25 06:22:50','2020-02-25 06:22:50','2021-02-25 14:22:50'),('e9fe3baea1f2ddcc88b141e7ac240036b6b4ff253899c892f3019e8c31ee0e2b5e1f0cbcb4d93f4c',93,9,'YABO_BANK','[]',0,'2020-02-25 11:24:53','2020-02-25 11:24:53','2021-02-25 19:24:53'),('ea3ddc441b87fe309b91ea80591e5553aa6b317774ad461ac11c19dd4fb6ed0304052f7099a2bbe3',34,1,'YABO_BANK','[]',0,'2020-01-25 05:26:12','2020-01-25 05:26:12','2021-01-25 13:26:12'),('eaaa460156c0ca33a6c1ff9773f63dca5feaf38af7638ed5060e831e10dbe3dbc4089f3f57b2b949',50,3,'YABO_BANK','[]',0,'2020-02-08 07:25:46','2020-02-08 07:25:46','2021-02-08 15:25:46'),('eafa2684d34dacdb567066d3b0d753f5f8c5e65a00b08e9efbbbed485a3454fce0fbcb152af1cac6',34,1,'YABO_BANK','[]',0,'2020-01-25 04:33:07','2020-01-25 04:33:07','2021-01-25 12:33:07'),('eddb252c17e6a3ea6206fc484fbac4cfe8121ef1d460caca23a85cd981a1d9a091bc8f8cf9e6acfd',49,9,'YABO_BANK','[]',1,'2020-02-18 13:30:58','2020-02-18 13:30:58','2021-02-18 21:30:58'),('ef96e37e34e8fe5dad6b1460e1e0cbb32d4ab11a34851f443f55560bc15470d37febf3fb1a53fb9a',65,9,'YABO_BANK','[]',1,'2020-02-25 05:56:59','2020-02-25 05:56:59','2021-02-25 13:56:59'),('efe54c9d89cee1cec5dd45f65d26766721263500c85d7f6b1849a9ebf512e4db443d2762b9c62cfc',72,9,'YABO_BANK','[]',0,'2020-02-25 00:15:14','2020-02-25 00:15:14','2021-02-25 08:15:14'),('f134caa5979d8c984cf4c96b39d2a55cd7941ee8d2c5e2f3bc3b46d84444ef4dc0bcea5f6e61c01f',31,1,'YABO_BANK','[]',0,'2020-01-30 08:35:59','2020-01-30 08:35:59','2021-01-30 16:35:59'),('f20cf687e17090f80b16b851b709b59efda5fd2ffb96a668bb54b1dd6f14057f5b1dcdc07b2fccfb',71,9,'YABO_BANK','[]',0,'2020-02-25 00:02:58','2020-02-25 00:02:58','2021-02-25 08:02:58'),('f2774875b5467067c92e6d57e8d54b0b6ac02883d4fd556df0602d799dd8fadbe59845641bd76729',87,9,'YABO_BANK','[]',0,'2020-02-25 08:20:32','2020-02-25 08:20:32','2021-02-25 16:20:32'),('f2783c418cf7c06a5534f6c21e87349843f725a26305413ef4dcd5aedbd9654c09bba0b43b2d63c6',64,9,'YABO_BANK','[]',1,'2020-02-22 11:55:16','2020-02-22 11:55:16','2021-02-22 19:55:16'),('f41ad480b00c188369851b3b039bc0ef45a409404f4e0fc16973610a3b22f647cf4ba3a04983c710',53,3,'YABO_BANK','[]',1,'2020-02-12 12:42:11','2020-02-12 12:42:11','2021-02-12 20:42:11'),('f56ea78df833dbd2fc8ed2754b8a1c4bc45e455b0499f6b46dee510d537887127ecaae3f01b69b80',43,1,'YABO_BANK','[]',1,'2020-01-30 08:17:19','2020-01-30 08:17:19','2021-01-30 16:17:19'),('f5d1413c636033eecf9e7c5cfe428525770125f40ca3305446bfbb84fe15faa8d8b1df8cb32ff686',69,9,'YABO_BANK','[]',0,'2020-02-24 23:39:46','2020-02-24 23:39:46','2021-02-25 07:39:46'),('f5ea34314e7395996db926ce2f6634f774b0778c80eef7ec7be696445a7df70400987cb1a6c978df',31,1,'YABO_BANK','[]',0,'2020-01-25 10:15:24','2020-01-25 10:15:24','2021-01-25 18:15:24'),('f6b8dffbdab174f3f894745f044f87999f18c65396ab8bab3ca383f5a84743659c9afea7c072e59b',49,9,'YABO_BANK','[]',1,'2020-02-25 01:54:15','2020-02-25 01:54:15','2021-02-25 09:54:15'),('f7787bb7e4d429d7488a50bf78a11b4b9360f4e91efe95dc7386cd84783c87572a390918f4518b9f',43,1,'YABO_BANK','[]',1,'2020-01-29 21:42:17','2020-01-29 21:42:17','2021-01-30 05:42:17'),('f7d96ea9fce5d5b2e7d9ab46351d27a5a9ffe17d1dc85427f0f022af5db618ab0ad33ed86d6e814d',34,1,'YABO_BANK','[]',0,'2020-01-25 04:15:04','2020-01-25 04:15:04','2021-01-25 12:15:04'),('f927961d080954980138d0ec52820bed35cbb5987444f995a611816fede5c1cdc4293f05d4d43fca',31,1,'YABO_BANK','[]',0,'2020-01-30 06:58:52','2020-01-30 06:58:52','2021-01-30 14:58:52'),('f95f0379fac6e1692a9bdc41f9e0fc2f85f226f916a0506da515ab2303e2435912ef1dfaa393b702',31,1,'YABO_BANK','[]',0,'2020-01-25 05:26:20','2020-01-25 05:26:20','2021-01-25 13:26:20'),('fa2ef208746781a565826993e60cc21e34a5c22e73cb09064a23a2501b1c3f47da09ee0a3bfe2aba',64,9,'YABO_BANK','[]',0,'2020-02-22 14:37:19','2020-02-22 14:37:19','2021-02-22 22:37:19'),('fb19231db279f020a1f3d7cfcc9372adfd6c945ba319813a7d561e8706ddcbc289c71be75b131adb',31,1,'YABO_BANK','[]',1,'2020-01-29 20:56:14','2020-01-29 20:56:14','2021-01-30 04:56:14'),('fb19aa2a1697fb446dfe187835050c479aa5ad7aa1742b00d72ef164864861e98efca068d9fc879c',43,1,'YABO_BANK','[]',1,'2020-01-26 05:56:59','2020-01-26 05:56:59','2021-01-26 13:56:59'),('fcda86ad96beca4f9192d161fc291a8ee64257117d9821882164e5b8719094490510ccf2624c7843',31,1,'YABO_BANK','[]',0,'2020-01-29 23:02:49','2020-01-29 23:02:49','2021-01-30 07:02:49'),('fdbea296014648f0a78c08939b65d7ea3b9e225bf4070461b0abea4dbd82a06cb68c586c48ce274d',73,9,'YABO_BANK','[]',0,'2020-02-25 00:18:58','2020-02-25 00:18:58','2021-02-25 08:18:58'),('ffcc02210fb97fd20392bb06e5687e0b5b6bc6fc846299ff9576aaa7ca7adad9d17a9d5708a8b472',47,9,'YABO_BANK','[]',0,'2020-02-22 11:45:09','2020-02-22 11:45:09','2021-02-22 19:45:09');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'YABO_BANK Personal Access Client','4oBU2PEUIL3xHBN7mzNzejlWGMytVmP6yY3doTPu','http://localhost',1,0,0,'2020-01-21 22:51:30','2020-01-21 22:51:30'),(2,NULL,'YABO_BANK Password Grant Client','dK1Y5kbInrzK6S3TRgu9qNS23b49oKmUoLNkGz0F','http://localhost',0,1,0,'2020-01-21 22:51:30','2020-01-21 22:51:30'),(3,NULL,'SISA Personal Access Client','L5wvt82SPeat3aU08MWEguIi7SV9dpmLxVN3JYv1','http://localhost',1,0,0,'2020-02-08 07:13:33','2020-02-08 07:13:33'),(4,NULL,'SISA Password Grant Client','cInRcbEfWJyWin7bFnWB87NxStd6KyFrKSZ6yy2z','http://localhost',0,1,0,'2020-02-08 07:13:33','2020-02-08 07:13:33'),(5,NULL,'SISA Personal Access Client','MYcCuc5xoUY7qhMSn89I6gw54xZWr36ZTPqG3fe0','http://localhost',1,0,0,'2020-02-13 12:46:17','2020-02-13 12:46:17'),(6,NULL,'SISA Password Grant Client','dDWhwJStMSkP56ynhxTaSleLicHzdvYmgRYgAnop','http://localhost',0,1,0,'2020-02-13 12:46:18','2020-02-13 12:46:18'),(7,NULL,'SISA Personal Access Client','Y7C54M2H3WEYjCz8351l92O51Lgrw3WL5HfBDakM','http://localhost',1,0,0,'2020-02-13 12:46:29','2020-02-13 12:46:29'),(8,NULL,'SISA Password Grant Client','Tu3FndlR8vFtIyjV0SwU4aHdmgwdpj3q7pubUp84','http://localhost',0,1,0,'2020-02-13 12:46:29','2020-02-13 12:46:29'),(9,NULL,'SISA Personal Access Client','z2COiZxKjqADSFgIa4Wd3BtbK2RdasX0FbAZh49d','http://localhost',1,0,0,'2020-02-13 16:34:05','2020-02-13 16:34:05'),(10,NULL,'SISA Password Grant Client','QyLxWLBa1yYpSKRSsypKS0Ln6lRQ2ZQ3lBnq0FPO','http://localhost',0,1,0,'2020-02-13 16:34:05','2020-02-13 16:34:05');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-01-21 22:51:30','2020-01-21 22:51:30'),(2,3,'2020-02-08 07:13:33','2020-02-08 07:13:33'),(3,5,'2020-02-13 12:46:18','2020-02-13 12:46:18'),(4,7,'2020-02-13 12:46:29','2020-02-13 12:46:29'),(5,9,'2020-02-13 16:34:05','2020-02-13 16:34:05');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'PAYMENT_02202000001',1,'2020-02-04',35000000,'2020-02-04 08:16:24','2020-02-04 08:16:24'),(2,'PAYMENT_02202000002',1,'2020-02-06',7742035,'2020-02-04 08:47:24','2020-02-04 08:47:24'),(3,'PAYMENT_02202000003',2,'2020-02-12',35000000,'2020-02-04 08:50:39','2020-02-04 08:50:39'),(4,'PAYMENT_02202000004',2,'2020-02-07',3000000,'2020-02-07 14:38:28','2020-02-07 14:38:28'),(5,'PAYMENT_02202000005',2,'2020-02-09',935035,'2020-02-09 05:23:08','2020-02-09 05:23:08');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pick_ups`
--

DROP TABLE IF EXISTS `pick_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pick_ups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pick_ups`
--

LOCK TABLES `pick_ups` WRITE;
/*!40000 ALTER TABLE `pick_ups` DISABLE KEYS */;
INSERT INTO `pick_ups` VALUES (1,1,1,1,'2020-02-04 02:35:01','2020-02-04 02:45:27'),(2,2,1,1,'2020-02-04 09:30:24','2020-02-04 09:37:34'),(3,3,1,1,'2020-02-04 13:16:31','2020-02-04 13:18:49'),(4,5,1,1,'2020-02-08 08:30:51','2020-02-08 08:35:24'),(5,6,1,1,'2020-02-08 08:45:01','2020-02-08 08:45:15'),(6,4,1,1,'2020-02-08 13:51:46','2020-02-09 04:29:00'),(7,7,1,1,'2020-02-08 13:56:22','2020-02-09 03:58:34'),(8,9,1,1,'2020-02-09 04:52:29','2020-02-09 05:06:55'),(9,11,1,1,'2020-02-09 05:16:40','2020-02-09 05:17:36'),(10,12,1,1,'2020-02-10 09:12:04','2020-02-10 09:13:20'),(11,13,1,1,'2020-02-12 12:59:20','2020-02-22 07:02:10'),(12,14,1,1,'2020-02-12 12:59:43','2020-02-22 07:07:08'),(13,15,1,1,'2020-02-12 13:42:57','2020-02-12 14:20:04'),(14,16,1,1,'2020-02-15 08:08:18','2020-02-22 07:08:51'),(15,17,1,1,'2020-02-15 08:08:18','2020-02-22 07:08:59'),(16,18,1,1,'2020-02-15 08:08:18','2020-02-22 07:09:27'),(17,23,1,1,'2020-02-16 11:30:13','2020-02-22 07:09:07'),(18,25,1,1,'2020-02-16 11:30:13','2020-02-22 07:09:38'),(19,29,1,1,'2020-02-18 15:28:09','2020-02-22 06:52:42'),(20,30,1,1,'2020-02-22 06:37:43','2020-02-22 06:55:18'),(21,31,1,1,'2020-02-22 06:37:43','2020-02-22 06:56:13'),(22,34,1,1,'2020-02-22 15:46:11','2020-02-23 07:07:18'),(23,35,1,1,'2020-02-23 12:25:51','2020-02-23 13:35:01'),(24,36,1,1,'2020-02-23 13:33:25','2020-02-25 06:01:38'),(25,37,1,1,'2020-02-24 09:50:49','2020-02-24 09:55:35');
/*!40000 ALTER TABLE `pick_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_lists`
--

DROP TABLE IF EXISTS `price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_lists`
--

LOCK TABLES `price_lists` WRITE;
/*!40000 ALTER TABLE `price_lists` DISABLE KEYS */;
INSERT INTO `price_lists` VALUES (2,'Plastik',1000,'kg','2020-01-11 08:41:22','2020-02-22 15:44:06'),(3,'Besi',1000,'kg','2020-01-11 08:42:09','2020-02-25 14:00:52'),(4,'Kardus',1000,'kg','2020-01-19 22:35:00','2020-02-25 14:01:00'),(6,'Organik',800,'kg','2020-02-22 15:49:30','2020-02-25 06:25:00');
/*!40000 ALTER TABLE `price_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,17,'Request_1580783541',2,'tes plastic 10 kg','REQUEST_1580783559.JPG',0,0,'2020-02-04 02:32:39','2020-02-04 02:45:27'),(2,17,'Request_1580808608',2,'tes 10 plastik','REQUEST_1580808608.png',0,0,'2020-02-04 09:30:08','2020-02-04 09:37:34'),(3,17,'Request_1580822153',2,'tes plastik 20 kg','REQUEST_1580822153.png',0,0,'2020-02-04 13:15:53','2020-02-04 13:18:49'),(4,20,'Request_1581150475',2,'plastik 2','REQUEST_1581150475.png',0,0,'2020-02-08 08:27:55','2020-02-09 04:29:00'),(5,21,'Request_1581150484',2,'aa','REQUEST_1581150484.png',0,0,'2020-02-08 08:28:04','2020-02-08 08:35:24'),(6,21,'Request_1581151495',2,'aa','REQUEST_1581151495.png',0,0,'2020-02-08 08:44:55','2020-02-08 08:45:15'),(7,19,'Request_1581170140',2,'tes 20 kg','REQUEST_1581170140.png',0,0,'2020-02-08 13:55:40','2020-02-09 03:58:34'),(9,19,'Request_1581223854',2,'vgh','REQUEST_1581223854.png',0,0,'2020-02-09 04:50:54','2020-02-09 05:06:55'),(11,22,'Request_1581225357',2,'hahah','REQUEST_1581225357.png',0,0,'2020-02-09 05:15:57','2020-02-09 05:17:36'),(12,22,'Request_1581325897',2,'tes 100 kg besi','REQUEST_1581325897.png',0,0,'2020-02-10 09:11:37','2020-02-10 09:13:20'),(13,25,'Request_1581512262',2,'hhhu','REQUEST_1581512262.png',0,0,'2020-02-12 12:57:42','2020-02-22 07:02:10'),(14,23,'Request_1581512278',2,'Sampah Plastik 5 Kg\nSampah Kardus 10 Kg','REQUEST_1581512278.png',0,0,'2020-02-12 12:57:58','2020-02-22 07:07:08'),(15,19,'Request_1581514953',2,'ff','REQUEST_1581514953.png',0,0,'2020-02-12 13:42:33','2020-02-12 14:20:04'),(16,25,'Request_1581588989',2,'ini bavab','REQUEST_1581588989.png',0,0,'2020-02-13 10:16:29','2020-02-22 07:08:51'),(17,19,'Request_1581754038',2,'plastik 1 kg','REQUEST_1581754038.png',0,0,'2020-02-15 08:07:18','2020-02-22 07:08:59'),(18,19,'Request_1581754061',2,'Besi 6 kg, Kardus 6 kg','REQUEST_1581754061.png',0,0,'2020-02-15 08:07:41','2020-02-22 07:09:27'),(23,19,'Request_1581851878',2,'plastik 8 kg, Kardus 12 kg','REQUEST_1581851878.png',0,0,'2020-02-16 11:17:58','2020-02-22 07:09:07'),(25,19,'Request_1581852477',2,'plastik 3 kg','REQUEST_1581852477.png',0,0,'2020-02-16 11:27:57','2020-02-22 07:09:38'),(29,28,'Request_1582039670',2,'plastik 5 kg, Besi 5 kg, Kardus 5 kg','REQUEST_1582039670.png',-3.9697499942619214,122.52279214560986,'2020-02-18 15:27:50','2020-02-22 06:52:42'),(30,28,'Request_1582039744',2,'plastik 3 kg, Besi 3 kg, Kardus 3 kg','REQUEST_1582039744.png',-3.9691017878291093,122.52488795667887,'2020-02-18 15:29:04','2020-02-22 06:55:18'),(31,28,'Request_1582039852',2,'plastik 4 kg','REQUEST_1582039852.png',-3.9654426563197482,122.51668810844421,'2020-02-18 15:30:52','2020-02-22 06:56:13'),(34,19,'Request_1582386356',2,'Elektronik 3 kg','REQUEST_1582386356.png',-3.9622043,122.51305250000001,'2020-02-22 15:45:56','2020-02-23 07:07:18'),(35,19,'Request_1582460709',2,'Plastik 5 kg','REQUEST_1582460709.png',-4.0116704,122.5176045,'2020-02-23 12:25:09','2020-02-23 13:35:01'),(36,19,'Request_1582464758',2,'Plastik 6 kg','REQUEST_1582464758.png',-3.9720955,122.52107139999998,'2020-02-23 13:32:38','2020-02-25 06:01:38'),(37,19,'Request_1582537547',2,'Plastik 5 kg','REQUEST_1582537547.png',-3.9809323112199753,122.60173089802265,'2020-02-24 09:45:47','2020-02-24 09:55:35'),(38,25,'Request_1582559009',0,'Plastik 10 kg','REQUEST_1582559009.png',-3.9769871,122.52629530000002,'2020-02-24 15:43:29','2020-02-24 15:43:29');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (6,1),(8,2),(14,13),(15,13),(16,13),(17,13),(18,13),(19,13),(20,13),(25,13),(26,13),(29,14),(31,13),(32,13),(33,13),(34,14),(35,14),(40,13),(43,13),(44,13),(45,13),(46,13),(47,14),(49,13),(50,13),(51,13),(52,13),(53,13),(54,13),(55,13),(62,13),(64,13),(65,13),(66,13),(67,13),(68,13),(69,13),(70,13),(71,13),(72,13),(73,13),(74,13),(75,13),(76,13),(77,13),(78,13),(79,13),(80,13),(81,13),(82,13),(83,13),(84,13),(85,13),(86,13),(87,13),(88,13),(89,13),(90,13),(91,13),(92,13),(93,13),(94,13),(95,13),(96,13),(97,13),(98,13),(99,13),(100,13),(101,13),(102,13),(103,13),(104,13),(105,13),(106,13);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',NULL,NULL),(2,'uadmin',NULL,NULL),(13,'customer',NULL,NULL),(14,'driver',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellings`
--

DROP TABLE IF EXISTS `sellings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `container_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_date` date NOT NULL,
  `unloading_date` date NOT NULL,
  `gross` double NOT NULL,
  `cut_off` double NOT NULL,
  `selling_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellings`
--

LOCK TABLES `sellings` WRITE;
/*!40000 ALTER TABLE `sellings` DISABLE KEYS */;
INSERT INTO `sellings` VALUES (2,'SO_02202000001','KARYA AGUNG REALITI','TEGU 682378(9)4561','8762 MJ','2020-02-04','2020-02-06',20409,200,2115,'2020-02-04 02:59:47','2020-02-04 03:29:01'),(3,'SO_02202000003','KARYA AGUNG REALITI','TEGU 682378(9)4561','8762 MJ','2020-02-04','2020-02-13',20409,2000,2115,'2020-02-04 05:54:25','2020-02-04 09:18:51');
/*!40000 ALTER TABLE `sellings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (2,'TRANSACTION_02202000002',17,1,'plastik','kg','10',1000,'2020-02-04 02:45:27','2020-02-04 02:45:27'),(3,'TRANSACTION_02202000003',17,1,'plastik','kg','2',1000,'2020-02-04 09:37:34','2020-02-04 09:37:34'),(4,'TRANSACTION_02202000004',17,1,'Besi','kg','34',5000,'2020-02-04 09:37:34','2020-02-04 09:37:34'),(5,'TRANSACTION_02202000004',17,1,'Kardus','kg','7',4000,'2020-02-04 09:37:34','2020-02-04 09:37:34'),(6,'TRANSACTION_02202000004',17,1,'plastik','kg','20',1000,'2020-02-04 13:18:49','2020-02-04 13:18:49'),(7,'TRANSACTION_02202000007',17,0,'plastik','kg','500',1000,'2020-02-08 06:41:24','2020-02-08 06:41:24'),(8,'TRANSACTION_02202000008',21,0,'plastik','kg','1000',1000,'2020-02-08 07:29:00','2020-02-08 07:29:00'),(9,'TRANSACTION_02202000009',21,1,'plastik','kg','5000',1000,'2020-02-08 08:35:23','2020-02-08 08:35:23'),(10,'TRANSACTION_02202000010',21,0,'plastik','kg','100',1000,'2020-02-08 08:37:21','2020-02-08 08:37:21'),(11,'TRANSACTION_02202000011',21,0,'plastik','kg','1',1000,'2020-02-08 08:44:16','2020-02-08 08:44:16'),(12,'TRANSACTION_02202000012',21,1,'plastik','kg','5',1000,'2020-02-08 08:45:15','2020-02-08 08:45:15'),(13,'TRANSACTION_02202000013',19,1,'Besi','kg','2',5000,'2020-02-09 03:58:34','2020-02-09 03:58:34'),(14,'TRANSACTION_02202000014',20,1,'Besi','kg','30',5000,'2020-02-09 04:29:00','2020-02-09 04:29:00'),(15,'TRANSACTION_02202000015',19,1,'plastik','kg','399',1000,'2020-02-09 05:06:54','2020-02-09 05:06:54'),(16,'TRANSACTION_02202000016',22,1,'Besi','kg','500',5000,'2020-02-09 05:17:36','2020-02-09 05:17:36'),(17,'TRANSACTION_02202000017',22,1,'Besi','kg','100',5000,'2020-02-10 09:13:20','2020-02-10 09:13:20'),(18,'TRANSACTION_02202000018',19,1,'plastik','kg','6',1000,'2020-02-12 14:20:04','2020-02-12 14:20:04'),(19,'TRANSACTION_02202000019',28,1,'plastik','kg','5000',1000,'2020-02-22 06:52:42','2020-02-22 06:52:42'),(20,'TRANSACTION_02202000020',28,1,'plastik','kg','4',1000,'2020-02-22 06:55:18','2020-02-22 06:55:18'),(21,'TRANSACTION_02202000021',28,1,'plastik','kg','4',1000,'2020-02-22 06:56:13','2020-02-22 06:56:13'),(22,'TRANSACTION_02202000022',25,1,'plastik','kg','3',1000,'2020-02-22 07:02:10','2020-02-22 07:02:10'),(23,'TRANSACTION_02202000023',23,1,'plastik','kg','3',1000,'2020-02-22 07:07:08','2020-02-22 07:07:08'),(24,'TRANSACTION_02202000024',25,1,'plastik','kg','5',1000,'2020-02-22 07:08:51','2020-02-22 07:08:51'),(25,'TRANSACTION_02202000025',19,1,'plastik','kg','1',1000,'2020-02-22 07:08:59','2020-02-22 07:08:59'),(26,'TRANSACTION_02202000026',19,1,'plastik','kg','2',1000,'2020-02-22 07:09:07','2020-02-22 07:09:07'),(27,'TRANSACTION_02202000027',19,1,'plastik','kg','3',1000,'2020-02-22 07:09:27','2020-02-22 07:09:27'),(28,'TRANSACTION_02202000028',19,1,'Besi','kg','3',5000,'2020-02-22 07:09:38','2020-02-22 07:09:38'),(29,'TRANSACTION_02202000029',19,1,'Elektronik','kg','3',5000,'2020-02-23 07:07:18','2020-02-23 07:07:18'),(30,'TRANSACTION_02202000030',19,1,'Plastik','kg','5',1000,'2020-02-23 13:35:01','2020-02-23 13:35:01'),(31,'TRANSACTION_02202000031',19,1,'Plastik','kg','5',1000,'2020-02-24 09:55:34','2020-02-24 09:55:34'),(32,'TRANSACTION_02202000032',19,1,'Plastik','kg','6',1000,'2020-02-25 06:01:38','2020-02-25 06:01:38');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_point` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userable_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'muhammad Alfalah','alan@alan.com','alan@alan.com',NULL,'$2y$10$uyaV09dX4tnt/4SY36twW.FACqQdaOcXjCxiGJUt337gZT9FWTAei','','','','','',NULL,'2020-01-07 11:46:43','2020-01-11 07:24:11','a',1),(8,'admin','alin@alin.com','admin@admin.com',NULL,'$2y$10$bWIIGWwYtkviir7xjD/.K.sw55Tskuyazdfl4mlTaawjvZ7Cl6HsC','PROFILE_1580182493.png','default.jpg','0','jalan jalan','',NULL,'2020-01-11 05:25:50','2020-02-25 14:17:12','',NULL),(46,'Aslia Rande','a@a.com','aslia@gmail.com',NULL,'$2y$10$OFwFJ6zbSd8d34i3Tiq6iO5oEaCYLEXF8889Yx8rnkDX5d4eIHHre','default.jpg','default.jpg','084011223344','Jl. MT Haryono','0,0',NULL,'2020-02-04 00:51:19','2020-02-15 09:17:30','App\\Model\\Customer',17),(47,'Caca Handika','c@c.com','caca@sisa.com',NULL,'$2y$10$qVZJ4y5ll7BB7wYpoI8eaeStVn5KsuPPP740OZGZG8huOXhemTPHm','PROFILE_1581219196.png','default.jpg','08234444000','Jl. Kendari','0,0',NULL,'2020-02-04 01:05:32','2020-02-22 11:46:13','App\\Model\\Driver',1),(49,'alan','x','x@x.com',NULL,'$2y$10$eQB3i.eYAYUS2sHEBZ3cC.7vIMzb3iswWdrmRDrPy2gL.X/IPtEF2','PROFILE_1582296973.png','default.jpg','00213645980','x','0,0',NULL,'2020-02-08 07:21:46','2020-02-21 14:56:13','App\\Model\\Customer',19),(50,'tes','x','x1@x1.com',NULL,'$2y$10$i10xBMoq2qMwb1IEGCUGFevtKbkmZgTRn.mPus22y6eCWNycR3NT2','default.jpg','default.jpg','000','tes','0,0',NULL,'2020-02-08 07:25:46','2020-02-25 05:57:45','App\\Model\\Customer',20),(51,'alan','alan','tes@tes.com',NULL,'$2y$10$na6VSAymvI5Muu.5eUgNUeySNUUxNpBqNaxkzZoyuy.T3XvXaQEFq','default.jpg','default.jpg','084698137643','jln mutiara','0,0',NULL,'2020-02-08 07:26:31','2020-02-25 05:59:37','App\\Model\\Customer',21),(52,'abdul','abdul','abdul@gmail.com',NULL,'$2y$10$wxA81wS1HrRKvTn6AFAmMet38UIWWGH7fAqXUVfn5AhdgqLGrBE9W','PROFILE_1581225732.png','default.jpg','085','kambu','0,0',NULL,'2020-02-09 05:14:13','2020-02-09 05:22:12','App\\Model\\Customer',22),(53,'Fachmi Ma\'asy','Fachmi Ma\'asy','fachmi.maasy@gmail.com',NULL,'$2y$10$KdE4CtlZU26sVr9HmhIceuQ8BukWrC/6sU7Jp1AtE3uN6uSpF8Vxa','PROFILE_1581335159.png','default.jpg','082349452345','Jl. Ahmad Yani Komp. BTN II BLOK E NO. 1','0,0',NULL,'2020-02-10 11:45:28','2020-02-10 11:45:59','App\\Model\\Customer',23),(54,'z','z','z@z.com',NULL,'$2y$10$36uK3DM0.gh9WnN6AUgt3emjJhsB1hUFDTiKhTBTJ6aQk4w.gE0Pu','PROFILE_1581344314.png','default.jpg','084631259874','alamat','0,0',NULL,'2020-02-10 14:18:06','2020-02-10 14:18:34','App\\Model\\Customer',24),(55,'SC','SC','synergy_creative@yahoo.com',NULL,'$2y$10$ki63sRzFTF9ghrZcL3fztODwtfIgzwUygUhxCCse8z4TZA2J8Gthi','PROFILE_1581522814.png','default.jpg','0811406164','made sabara','0,0',NULL,'2020-02-12 12:53:36','2020-02-15 08:19:07','App\\Model\\Customer',25),(62,'alan','z','as@as.com',NULL,'$2y$10$3LgylhqJFHpJDO4LbZTdG.dtUB0EHOBKcufpxcVh4hqJMqzR18ul.','default.jpg','default.jpg','1','tes','0,0',NULL,'2020-02-15 08:09:39','2020-02-25 06:00:37','App\\Model\\Customer',26),(64,'Fio','Fio','fachmi.maasy@outlook.com',NULL,'$2y$10$.lj6bPJuQe1no0RNvfg7uOZbgJPnixgjAQUeYAk8fEkn54AW8.fj6','PROFILE_1582040077.png','default.jpg','08114033990','Jl. Malik No. 33E','0,0',NULL,'2020-02-15 09:28:48','2020-02-18 15:34:37','App\\Model\\Customer',28),(65,'safril','safril','safril@gmail.com',NULL,'$2y$10$X/wk1qe2VwUNvNjZl2.OsenoS5qDFMNaCn.MTQ9oJM8GcLY9RaW/y','default.jpg','default.jpg','085340181074','kambu','0,0',NULL,'2020-02-15 10:20:23','2020-02-25 05:56:41','App\\Model\\Customer',29),(66,'JOHN DOE','JOHN DOE','babelklmy@gmail.com',NULL,'$2y$10$Nv78KQdjMq7r1wip79tuIeFYVj5g7clRLmOqG/pYANy/Z.w1lc/He','default.jpg','default.jpg','082136704408','AMPHITHEATER PKWY','0,0',NULL,'2020-02-24 09:19:34','2020-02-24 09:19:34','App\\Model\\Customer',30),(67,'andi idsan ilyas','andi idsan ilyas','andiidsanilyas@gmail.com',NULL,'$2y$10$Xgydf/Ln2yewZXJ58TLIwurgkqT4EOOMOm7fsDUwgcvjW/sCKmrsy','PROFILE_1582601089.png','default.jpg','081355380372','jl.alpokat perum pelangi residance blok c no 13','0,0','W4IerdM6G6IxNyE0ccr8D0mo9LZUl8xdnfZFRZiaYiEonFdLjethNNuRzdyc','2020-02-24 15:46:53','2020-02-25 03:24:49','App\\Model\\Customer',31),(68,'suardi arifin','suardi arifin','suardibusiness79@gmail.com',NULL,'$2y$10$Oo1/NI4dN6ECAgpY/6mDb.KVD0mbi8tJaKvoNl1Sh53dBwM747Wfm','default.jpg','default.jpg','085345425005','BTN MEKAR ASRİ KENDARI','0,0',NULL,'2020-02-24 15:50:41','2020-02-24 15:50:41','App\\Model\\Customer',32),(69,'riasartika','riasartika','riasartika1810@yahoo.com',NULL,'$2y$10$N5aLl/iT8pCZ94vP8B4is.IkxehySNPtbgkaKEsmbydYM3D3U5IjS','default.jpg','default.jpg','0811406161','kendari','0,0',NULL,'2020-02-24 23:39:46','2020-02-24 23:39:46','App\\Model\\Customer',33),(70,'adhitya','adhitya','adhitya.claser@gmail.com',NULL,'$2y$10$hsCc0yRnwZpkTRj5WyGYEuhtFeiVENxVhuQL4U.6EPdf7680d30g6','default.jpg','default.jpg','082290171233','Kel.abele','0,0',NULL,'2020-02-24 23:59:20','2020-02-24 23:59:20','App\\Model\\Customer',34),(71,'cahyo ramdhan p','cahyo ramdhan p','cahyoramdhan18@gmail.com',NULL,'$2y$10$vojvIm7lTNLGv0ETHTvjt.5xXun3cSeyVizrdf.vn3mjc4JJqqso.','default.jpg','default.jpg','085399060350','lepo lepo','0,0',NULL,'2020-02-25 00:02:58','2020-02-25 00:02:58','App\\Model\\Customer',35),(72,'Patman','Patman','Patman.nna@gmail.com',NULL,'$2y$10$adAlJsdXrpSMr0slP48n.OFh9BqFW6SzemUnh5aqa3MeiwIqYjYWm','PROFILE_1582589809.png','default.jpg','085241025226','jl.chairil anwar','0,0',NULL,'2020-02-25 00:15:14','2020-02-25 00:16:49','App\\Model\\Customer',36),(73,'izal','izal','izalkay3@yahoo.com',NULL,'$2y$10$Iv0LoeTltOwqYke7Y5Arq.3h5pHgFaAVP6EcwptZVrg7A7nARFaIy','default.jpg','default.jpg','081390351391','Abeli','0,0',NULL,'2020-02-25 00:18:58','2020-02-25 00:18:58','App\\Model\\Customer',37),(74,'Muhammad Reza Haryanto','Muhammad Reza Haryanto','rezaharyanto24@gmail.com',NULL,'$2y$10$JQPwlLUQqHGb4p/D6fs1oOpK58Tr8tC9XxYRoIXmnXlxpN4p3BvYW','default.jpg','default.jpg','082234312311','jln.ahmad yani lrng.benteng','0,0',NULL,'2020-02-25 00:28:04','2020-02-25 00:28:04','App\\Model\\Customer',38),(75,'Zeptian Elia Nugraha','Zeptian Elia Nugraha','zeptianelian@gmail.com',NULL,'$2y$10$Lr9lVsHHyi05lDZfZA0oSeMfF97NixELD2BZvB1JQ/hs7JYHSNcyO','default.jpg','default.jpg','082187731404','Ahmad yani','0,0',NULL,'2020-02-25 00:41:57','2020-02-25 00:41:57','App\\Model\\Customer',39),(76,'liana','liana','annayuanfhe@gmail.com',NULL,'$2y$10$gnzZ9jIWBsMfB2OnwblHaOsH3e1aY3VZp94XmH/pnAm10xxXgd5ue','default.jpg','default.jpg','085236113077','Baruga','0,0',NULL,'2020-02-25 02:26:27','2020-02-25 02:26:27','App\\Model\\Customer',40),(77,'kumbohu','kumbohu','kumbohu07@gmail.com',NULL,'$2y$10$UWThFPU2LzI0c71hMQ/wf.1LSyRhlRjbCpCPpPEKcHLPZ3OyQv.36','default.jpg','default.jpg','085298994987','Pencucian Kumbohu','0,0',NULL,'2020-02-25 03:00:18','2020-02-25 03:00:18','App\\Model\\Customer',41),(78,'irvan eka hadianto maasy, se','irvan','irvaneazy@gmail.com',NULL,'$2y$10$wgksUr4NMlxsQh0sEy29r.cJhwnExtfL5mzO00sq0oIFos1ga21rm','PROFILE_1582609015.png','default.jpg','08114050883','Perum. Permata Anawai Blok B7 No.4','0,0',NULL,'2020-02-25 05:29:47','2020-02-25 05:36:55','App\\Model\\Customer',42),(79,'riski saputry','riski saputry','riskii.saputrii@gmail.com',NULL,'$2y$10$F5DL8iVbzasNSB.eZf.kO.88FA2mV6PLJIJuM6LQyZEALnhi3Po3C','default.jpg','default.jpg','08114004415','jl. ahmad yani btn 2 blok e no 1','0,0',NULL,'2020-02-25 05:47:23','2020-02-25 05:47:23','App\\Model\\Customer',43),(80,'baso affandi','baso affandi','basoafandi@yahoo.com',NULL,'$2y$10$b.0DP3L9BCSMKntYqNhxeONafMga.KlKhyduenslVJe.8F.mJufuu','default.jpg','default.jpg','08114308450','manado','0,0',NULL,'2020-02-25 06:04:14','2020-02-25 06:04:14','App\\Model\\Customer',44),(81,'Dedi aswar','Dedi aswar','dedyfold07@gmail.com',NULL,'$2y$10$5KhOviRDeYMJKdJJ2LoE4uS7HZMuOa8IZp06ymIIU8iU7ZNkdsRjC','PROFILE_1582611622.png','default.jpg','085265550203','konda','0,0',NULL,'2020-02-25 06:18:36','2020-02-25 06:20:22','App\\Model\\Customer',45),(82,'Rachmat pahlawan','Rachmat pahlawan','rahmatpahlawan277@gmail.com',NULL,'$2y$10$n8oLTOdEk1TKnboNK3Ah8eDuqrF84vkvkK7lKhSsc8gHZJl5evoci','PROFILE_1582612451.png','default.jpg','085241847456','jl prof muh yamin','0,0',NULL,'2020-02-25 06:32:21','2020-02-25 06:34:11','App\\Model\\Customer',46),(83,'Muazharin Alfan','Muazharin Alfan','alfanmuazharin@gmail.com',NULL,'$2y$10$QoM345aCBcqu.9wKFh5pm.vaScdUJFbPJhG5jtVIunj4YsDShb8n6','PROFILE_1582613612.png','default.jpg','082243309590','Kendari','0,0',NULL,'2020-02-25 06:52:23','2020-02-25 06:53:32','App\\Model\\Customer',47),(84,'Fadli finalessa','Fadli finalessa','finalessafadli@gmail.com',NULL,'$2y$10$1untmAlcoQ7p.e2gJd6zw.G59VxR5PGINzN0LJndOQPBPDFrJy9TC','PROFILE_1582614410.png','default.jpg','082291695374','jl kakatua','0,0',NULL,'2020-02-25 07:05:48','2020-02-25 07:06:50','App\\Model\\Customer',48),(85,'novia hadriana kurais','novia hadriana kurais','novia.hadriana.k@gmail.com',NULL,'$2y$10$cDqQSggIlhbeA07p8UShk.DVO6rD7eFZLRSBXloO0IpTExJIQSA4C','default.jpg','default.jpg','082293243103','jl.r suprapto','0,0',NULL,'2020-02-25 07:42:05','2020-02-25 07:42:05','App\\Model\\Customer',49),(86,'fadli wijaya','fadli wijaya','olingwijaya@gmail.com',NULL,'$2y$10$GkHI14iFYwLEwv3NZFF31OkcGNqprtIJcZ1MRNEFWSL7riDSxZvOm','default.jpg','default.jpg','081355743641','jl.merdeka','0,0',NULL,'2020-02-25 08:13:51','2020-02-25 08:13:51','App\\Model\\Customer',50),(87,'heriyadi','heriyadi','adi.hery87@yahoo.com',NULL,'$2y$10$MYpF8gK.yFcCxaQ2AdyBjOO4j12AH.k2r.1oB1LVQOdewM/VYcuxu','default.jpg','default.jpg','081241937012','jl MT Haryono no 47','0,0',NULL,'2020-02-25 08:20:32','2020-02-25 08:20:32','App\\Model\\Customer',51),(88,'hamka','hamka','hamka1282@gmail.com',NULL,'$2y$10$agAY9r8aNcs3.Hn41iKECO17z/TpHGTUOPhI86X7UzF/2CqONwmka','default.jpg','default.jpg','081543325000','BTN baruga griya indah blok e no.6','0,0',NULL,'2020-02-25 08:23:18','2020-02-25 08:23:18','App\\Model\\Customer',52),(89,'meicank','meicank','meicankminang@gmail.com',NULL,'$2y$10$GRQqnLW4KlBFKEGcDTENCOI424k0UcWfGy0ZSZzlFdd5tUuqz3cRW','default.jpg','default.jpg','085381584417','jalan supu yusuf','0,0',NULL,'2020-02-25 08:36:40','2020-02-25 08:36:40','App\\Model\\Customer',53),(90,'Aminuddin','Aminuddin','omes.aminuddin@gmail.com',NULL,'$2y$10$NkMA63vbAop3REkZmbuCL.cghd.1o2gjCUNOPSgezfRPS16CWH3i.','default.jpg','default.jpg','08114032101','Kendari','0,0',NULL,'2020-02-25 09:53:11','2020-02-25 09:53:11','App\\Model\\Customer',54),(91,'shasi aprilia widiyani','shasi aprilia widiyani','lia24.aprilia@gmail.com',NULL,'$2y$10$/z59BI3KAfOP5/PyKVksceyJoJC7hXG83ZQYoEsNrTx9jPigHHBMG','default.jpg','default.jpg','082291329324','ranomeeto','0,0',NULL,'2020-02-25 10:20:37','2020-02-25 10:20:37','App\\Model\\Customer',55),(92,'Alim Bahrin','Alim Bahrin','alimbahrin@gmail.com',NULL,'$2y$10$o6/qJElwYTMhdm854BwjWunAws3WhbVl3Jx6vRgbc72CyLDwBUBam','PROFILE_1582628752.png','default.jpg','082395315211','jl. tunggala dalam, BTN TRILOKA blok J No 4. Kendari','0,0',NULL,'2020-02-25 11:03:47','2020-02-25 11:05:52','App\\Model\\Customer',56),(93,'Arif Budiono','Arif Budiono','ariftkjsmk@gmail.com',NULL,'$2y$10$qb48lRxn9DUgIC23f.ozd.QdkeUKoMJ9oow15EqmIozlQlB7J3MGu','PROFILE_1582629966.png','default.jpg','082346736635','Jl. HEA Mokodompit, Samping Lorong Kusuma. Kantor Wahdah Inspirasi Zakat Sultra. Kendari','0,0',NULL,'2020-02-25 11:24:53','2020-02-25 11:26:06','App\\Model\\Customer',57),(94,'Muhammad Hasyim','Muhammad Hasyim','hasyim.soska@gmail.com',NULL,'$2y$10$wA.9uFNGZmEYJjkJD.JDfuW4SGBO6PsfoHJD0VAJr3VOgF4.ZkINu','default.jpg','default.jpg','085240022181','JL Dr Sam Ratulangi No 130','0,0',NULL,'2020-02-25 11:57:55','2020-02-25 11:57:55','App\\Model\\Customer',58),(95,'sawal riyaman','sawal riyaman','sawalriyaman25@gmail.com',NULL,'$2y$10$yBTtdR5c8Yd7ulOZxR9FeeuHXmJVb18IE6VwwHt.4bpkaM6VlMu.S','PROFILE_1582633272.png','default.jpg','082199454774','Jl. La Ode Hadi','0,0',NULL,'2020-02-25 12:16:44','2020-02-25 12:21:12','App\\Model\\Customer',59),(96,'Rizky Laili Azwindah','anggun','inaikukukendari@gmail.com',NULL,'$2y$10$AMahmyl2iFtt1HcFJs3wWe1px8un7Et4Ayn5BUT/1Udifn2DFYvxy','PROFILE_1582633396.png','default.jpg','082176137015','jln.lumba-lumba','0,0',NULL,'2020-02-25 12:17:37','2020-02-25 12:23:16','App\\Model\\Customer',60),(97,'Muhammad Asad','Muhammad Asad','muhammadasadsalihi@gmail.com',NULL,'$2y$10$j9SeRZrdsPhfSStN1iV4IeGyDOl//A76kPFf66MkcKONB.BHaNB/y','default.jpg','default.jpg','081230081144','BTN Citra Anugrah, Blok B No. 3. Jl. Ruruhi, Anggoeya. Poasia. Kendari.','0,0',NULL,'2020-02-25 12:19:02','2020-02-25 12:19:02','App\\Model\\Customer',61),(98,'andi ikha','andi ikha','ikhaadjis2018@gmail.com',NULL,'$2y$10$rHO06QyKaVnIRQVjZ8AtVeKk85uDO3ZNZ5QdRTrIjzIB7a2xDXKkG','default.jpg','default.jpg','085241678977','jl.kakatua no.48c','0,0',NULL,'2020-02-25 12:32:31','2020-02-25 12:32:31','App\\Model\\Customer',62),(99,'Harvey','Harvey','harveydinkeskolut@gmail.com',NULL,'$2y$10$6qhoq8qgKFnO0vsfUsB2WeuH0V374vhsocZOEEXEkoq7EMdhh.lQ2','PROFILE_1582634014.png','default.jpg','082129018485','Lasusua','0,0',NULL,'2020-02-25 12:32:56','2020-02-25 12:33:34','App\\Model\\Customer',63),(100,'Agoes Malhadi','Agoes Malhadi','agoesmalhadi@gmail.com',NULL,'$2y$10$RgRNvfwQwUMWpIoJW/vYA.8aFSBrW.j6X2rH2I78b3KZdM6cdrLwC','default.jpg','default.jpg','085107392811','Jl.lumba-lumba','0,0',NULL,'2020-02-25 12:37:42','2020-02-25 12:37:42','App\\Model\\Customer',64),(101,'Wisnu Setyo Pamuji','Wisnu Setyo Pamuji','wisnu.setyo@gmail.com',NULL,'$2y$10$Ca7IO.NPkbmIz5WhljFbC.zBijcH3LA4A4tvHHfnN4tH5hDYa/eI.','PROFILE_1582635359.png','default.jpg','08114090764','BTN LEPO-LEPO INDAH BLOK A2 NO. 5','0,0',NULL,'2020-02-25 12:45:27','2020-02-25 12:55:59','App\\Model\\Customer',65),(102,'syafryanto Lami,ST','syafryanto Lami,ST','syafryantolami@yahoo.co.id',NULL,'$2y$10$v4nDVay5IDRM5DC190EPHu5Ek3y95zrYYDAfFVReEyMx49oCuxrM6','default.jpg','default.jpg','085299790008','jl. haeba No 15 C','0,0',NULL,'2020-02-25 13:04:24','2020-02-25 13:04:24','App\\Model\\Customer',66),(103,'Muh.dedy arsyad','Muh.dedy arsyad','dedyarsyad23@gmail.com',NULL,'$2y$10$KqSBQiCuLeAwnl0FhMSom.UYmJxws0.whQMsyhgbUFVYZT.rbV5Te','default.jpg','default.jpg','082152127860','JL.IMAM BONJOL','0,0',NULL,'2020-02-25 13:16:46','2020-02-25 13:16:46','App\\Model\\Customer',67),(104,'fathan el haziq','fathan el haziq','fathan@gmail.com',NULL,'$2y$10$.3yLJuJBcDe4Fyd7KGN6EOxvYsZaorQVhkOXvf8OLfz2.OSRftMoC','default.jpg','default.jpg','081252525345','kendari','0,0',NULL,'2020-02-25 13:54:21','2020-02-25 13:54:21','App\\Model\\Customer',68),(105,'sugiarto','sugiarto','zigit.gameml@gmail.com',NULL,'$2y$10$U9OrREP/5VL2P4n9WlkmIuGVLmZ.JEX9xg8XLydlBypAMYGs.Z4Ki','default.jpg','default.jpg','082393284666','andunohu','0,0',NULL,'2020-02-25 14:10:28','2020-02-25 14:10:28','App\\Model\\Customer',69),(106,'yustani','yustani','yustani83@gmail.com',NULL,'$2y$10$YEPLcA6fVo4sI5ONnP3ZlO2mSxIyVFSDOay/UFgi4as7CP.DL9Or.','PROFILE_1582640233.png','default.jpg','081341568796','baruga','0,0',NULL,'2020-02-25 14:14:30','2020-02-25 14:17:13','App\\Model\\Customer',70);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-25 22:19:28
