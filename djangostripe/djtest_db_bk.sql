-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: djtest
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-11 06:39:38.791598'),(2,'auth','0001_initial','2021-03-11 06:39:39.129503'),(3,'admin','0001_initial','2021-03-11 06:39:40.354212'),(4,'admin','0002_logentry_remove_auto_add','2021-03-11 06:39:40.609756'),(5,'admin','0003_logentry_add_action_flag_choices','2021-03-11 06:39:40.629005'),(6,'contenttypes','0002_remove_content_type_name','2021-03-11 06:39:40.852720'),(7,'auth','0002_alter_permission_name_max_length','2021-03-11 06:39:41.034833'),(8,'auth','0003_alter_user_email_max_length','2021-03-11 06:39:41.088992'),(9,'auth','0004_alter_user_username_opts','2021-03-11 06:39:41.105614'),(10,'auth','0005_alter_user_last_login_null','2021-03-11 06:39:41.228591'),(11,'auth','0006_require_contenttypes_0002','2021-03-11 06:39:41.239926'),(12,'auth','0007_alter_validators_add_error_messages','2021-03-11 06:39:41.257194'),(13,'auth','0008_alter_user_username_max_length','2021-03-11 06:39:41.393336'),(14,'auth','0009_alter_user_last_name_max_length','2021-03-11 06:39:41.520316'),(15,'auth','0010_alter_group_name_max_length','2021-03-11 06:39:41.567075'),(16,'auth','0011_update_proxy_permissions','2021-03-11 06:39:41.584294'),(17,'auth','0012_alter_user_first_name_max_length','2021-03-11 06:39:41.722685');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_account`
--

DROP TABLE IF EXISTS `djstripe_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_account` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_primary_color` varchar(7) NOT NULL,
  `business_url` varchar(200) NOT NULL,
  `charges_enabled` tinyint(1) NOT NULL,
  `country` varchar(2) NOT NULL,
  `debit_negative_balances` tinyint(1) DEFAULT NULL,
  `decline_charge_on` json DEFAULT NULL,
  `default_currency` varchar(3) NOT NULL,
  `details_submitted` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `legal_entity` json DEFAULT NULL,
  `payout_schedule` json DEFAULT NULL,
  `payout_statement_descriptor` varchar(255) NOT NULL,
  `payouts_enabled` tinyint(1) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `statement_descriptor` varchar(255) NOT NULL,
  `support_email` varchar(255) NOT NULL,
  `support_phone` varchar(255) NOT NULL,
  `support_url` varchar(200) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `type` varchar(8) NOT NULL,
  `tos_acceptance` json DEFAULT NULL,
  `verification` json DEFAULT NULL,
  `business_logo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_account_business_logo_id_b3f124c3_fk_djstripe_` (`business_logo_id`),
  CONSTRAINT `djstripe_account_business_logo_id_b3f124c3_fk_djstripe_` FOREIGN KEY (`business_logo_id`) REFERENCES `djstripe_fileupload` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_account`
--

LOCK TABLES `djstripe_account` WRITE;
/*!40000 ALTER TABLE `djstripe_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_applicationfee`
--

DROP TABLE IF EXISTS `djstripe_applicationfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_applicationfee` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `amount_refunded` bigint NOT NULL,
  `currency` varchar(3) NOT NULL,
  `refunded` tinyint(1) NOT NULL,
  `balance_transaction_id` varchar(255) NOT NULL,
  `charge_id` varchar(255) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_applicationfee`
--

LOCK TABLES `djstripe_applicationfee` WRITE;
/*!40000 ALTER TABLE `djstripe_applicationfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_applicationfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_applicationfeerefund`
--

DROP TABLE IF EXISTS `djstripe_applicationfeerefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_applicationfeerefund` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `currency` varchar(3) NOT NULL,
  `balance_transaction_id` varchar(255) NOT NULL,
  `fee_id` varchar(255) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_applicationfeerefund`
--

LOCK TABLES `djstripe_applicationfeerefund` WRITE;
/*!40000 ALTER TABLE `djstripe_applicationfeerefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_applicationfeerefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_balancetransaction`
--

DROP TABLE IF EXISTS `djstripe_balancetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_balancetransaction` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `available_on` datetime(6) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `exchange_rate` decimal(8,6) DEFAULT NULL,
  `fee` bigint NOT NULL,
  `fee_details` json NOT NULL,
  `net` bigint NOT NULL,
  `status` varchar(9) NOT NULL,
  `type` varchar(22) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_balancetransaction`
--

LOCK TABLES `djstripe_balancetransaction` WRITE;
/*!40000 ALTER TABLE `djstripe_balancetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_balancetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_bankaccount`
--

DROP TABLE IF EXISTS `djstripe_bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_bankaccount` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `account_holder_name` longtext,
  `account_holder_type` varchar(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `default_for_currency` tinyint(1) DEFAULT NULL,
  `fingerprint` varchar(16) NOT NULL,
  `last4` varchar(4) NOT NULL,
  `routing_number` varchar(255) NOT NULL,
  `status` varchar(19) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_bankaccount_customer_id_0f696e1d_fk_djstripe_` (`customer_id`),
  CONSTRAINT `djstripe_bankaccount_customer_id_0f696e1d_fk_djstripe_` FOREIGN KEY (`customer_id`) REFERENCES `djstripe_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_bankaccount`
--

LOCK TABLES `djstripe_bankaccount` WRITE;
/*!40000 ALTER TABLE `djstripe_bankaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_card`
--

DROP TABLE IF EXISTS `djstripe_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_card` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `address_city` longtext,
  `address_country` longtext,
  `address_line1` longtext,
  `address_line1_check` varchar(11) DEFAULT NULL,
  `address_line2` longtext,
  `address_state` longtext,
  `address_zip` longtext,
  `address_zip_check` varchar(11) DEFAULT NULL,
  `brand` varchar(16) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `cvc_check` varchar(11) DEFAULT NULL,
  `dynamic_last4` varchar(4) DEFAULT NULL,
  `exp_month` int NOT NULL,
  `exp_year` int NOT NULL,
  `fingerprint` longtext,
  `funding` varchar(7) NOT NULL,
  `last4` varchar(4) NOT NULL,
  `name` longtext,
  `tokenization_method` varchar(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_card`
--

LOCK TABLES `djstripe_card` WRITE;
/*!40000 ALTER TABLE `djstripe_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_charge`
--

DROP TABLE IF EXISTS `djstripe_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_charge` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `amount_refunded` decimal(8,2) NOT NULL,
  `captured` tinyint(1) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `failure_code` varchar(20) DEFAULT NULL,
  `failure_message` longtext,
  `fraud_details` json NOT NULL,
  `outcome` json NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `receipt_email` varchar(800) DEFAULT NULL,
  `receipt_number` varchar(14) DEFAULT NULL,
  `refunded` tinyint(1) NOT NULL,
  `shipping` json DEFAULT NULL,
  `statement_descriptor` varchar(22) DEFAULT NULL,
  `status` varchar(9) NOT NULL,
  `transfer_group` varchar(255) DEFAULT NULL,
  `account_id` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `dispute_id` varchar(255) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `source_id` varchar(255) DEFAULT NULL,
  `transfer_id` varchar(255) DEFAULT NULL,
  `balance_transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_charge_customer_id_fb15eb2b_fk_djstripe_customer_id` (`customer_id`),
  KEY `djstripe_charge_dispute_id_86a03043_fk_djstripe_dispute_id` (`dispute_id`),
  KEY `djstripe_charge_invoice_id_bb36cca4_fk_djstripe_invoice_id` (`invoice_id`),
  KEY `djstripe_charge_source_id_2502db60_fk_djstripe_paymentmethod_id` (`source_id`),
  KEY `djstripe_charge_transfer_id_bbfc2bbc_fk_djstripe_transfer_id` (`transfer_id`),
  KEY `djstripe_charge_balance_transaction__2eac625e_fk_djstripe_` (`balance_transaction_id`),
  CONSTRAINT `djstripe_charge_balance_transaction__2eac625e_fk_djstripe_` FOREIGN KEY (`balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`),
  CONSTRAINT `djstripe_charge_customer_id_fb15eb2b_fk_djstripe_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `djstripe_customer` (`id`),
  CONSTRAINT `djstripe_charge_dispute_id_86a03043_fk_djstripe_dispute_id` FOREIGN KEY (`dispute_id`) REFERENCES `djstripe_dispute` (`id`),
  CONSTRAINT `djstripe_charge_invoice_id_bb36cca4_fk_djstripe_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `djstripe_invoice` (`id`),
  CONSTRAINT `djstripe_charge_source_id_2502db60_fk_djstripe_paymentmethod_id` FOREIGN KEY (`source_id`) REFERENCES `djstripe_paymentmethod` (`id`),
  CONSTRAINT `djstripe_charge_transfer_id_bbfc2bbc_fk_djstripe_transfer_id` FOREIGN KEY (`transfer_id`) REFERENCES `djstripe_transfer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_charge`
--

LOCK TABLES `djstripe_charge` WRITE;
/*!40000 ALTER TABLE `djstripe_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_countryspec`
--

DROP TABLE IF EXISTS `djstripe_countryspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_countryspec` (
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `id` varchar(2) NOT NULL,
  `default_currency` varchar(3) NOT NULL,
  `supported_bank_account_currencies` json NOT NULL,
  `supported_payment_currencies` json NOT NULL,
  `supported_payment_methods` json NOT NULL,
  `supported_transfer_countries` json NOT NULL,
  `verification_fields` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_countryspec`
--

LOCK TABLES `djstripe_countryspec` WRITE;
/*!40000 ALTER TABLE `djstripe_countryspec` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_countryspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_coupon`
--

DROP TABLE IF EXISTS `djstripe_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_coupon` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `id` varchar(500) NOT NULL,
  `amount_off` decimal(8,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `duration` varchar(9) NOT NULL,
  `duration_in_months` int unsigned DEFAULT NULL,
  `max_redemptions` int unsigned DEFAULT NULL,
  `percent_off` decimal(5,2) DEFAULT NULL,
  `redeem_by` datetime(6) DEFAULT NULL,
  `times_redeemed` int unsigned NOT NULL,
  `name` longtext NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  CONSTRAINT `djstripe_coupon_chk_1` CHECK ((`duration_in_months` >= 0)),
  CONSTRAINT `djstripe_coupon_chk_2` CHECK ((`max_redemptions` >= 0)),
  CONSTRAINT `djstripe_coupon_chk_4` CHECK ((`times_redeemed` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_coupon`
--

LOCK TABLES `djstripe_coupon` WRITE;
/*!40000 ALTER TABLE `djstripe_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_customer`
--

DROP TABLE IF EXISTS `djstripe_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_customer` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `account_balance` bigint NOT NULL,
  `business_vat_id` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `delinquent` tinyint(1) NOT NULL,
  `coupon_start` datetime(6) DEFAULT NULL,
  `coupon_end` datetime(6) DEFAULT NULL,
  `email` longtext,
  `shipping` json DEFAULT NULL,
  `date_purged` datetime(6) DEFAULT NULL,
  `coupon_id` bigint DEFAULT NULL,
  `default_source_id` varchar(255) DEFAULT NULL,
  `subscriber_id` int DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `djstripe_customer_subscriber_id_livemode_962f4a46_uniq` (`subscriber_id`,`livemode`),
  KEY `djstripe_customer_default_source_id_24020f62_fk_djstripe_` (`default_source_id`),
  CONSTRAINT `djstripe_customer_default_source_id_24020f62_fk_djstripe_` FOREIGN KEY (`default_source_id`) REFERENCES `djstripe_paymentmethod` (`id`),
  CONSTRAINT `djstripe_customer_subscriber_id_60f5c7bc_fk_auth_user_id` FOREIGN KEY (`subscriber_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_customer`
--

LOCK TABLES `djstripe_customer` WRITE;
/*!40000 ALTER TABLE `djstripe_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_dispute`
--

DROP TABLE IF EXISTS `djstripe_dispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_dispute` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `currency` varchar(3) NOT NULL,
  `evidence` json NOT NULL,
  `evidence_details` json NOT NULL,
  `is_charge_refundable` tinyint(1) NOT NULL,
  `reason` varchar(25) NOT NULL,
  `status` varchar(22) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_dispute`
--

LOCK TABLES `djstripe_dispute` WRITE;
/*!40000 ALTER TABLE `djstripe_dispute` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_dispute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_event`
--

DROP TABLE IF EXISTS `djstripe_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_event` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `api_version` varchar(15) NOT NULL,
  `data` json NOT NULL,
  `request_id` varchar(50) DEFAULT NULL,
  `idempotency_key` longtext,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_event`
--

LOCK TABLES `djstripe_event` WRITE;
/*!40000 ALTER TABLE `djstripe_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_fileupload`
--

DROP TABLE IF EXISTS `djstripe_fileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_fileupload` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `purpose` varchar(24) NOT NULL,
  `size` int NOT NULL,
  `type` varchar(4) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_fileupload`
--

LOCK TABLES `djstripe_fileupload` WRITE;
/*!40000 ALTER TABLE `djstripe_fileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_fileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_idempotencykey`
--

DROP TABLE IF EXISTS `djstripe_idempotencykey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_idempotencykey` (
  `uuid` char(32) NOT NULL,
  `action` varchar(100) NOT NULL,
  `livemode` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_idempotencykey`
--

LOCK TABLES `djstripe_idempotencykey` WRITE;
/*!40000 ALTER TABLE `djstripe_idempotencykey` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_idempotencykey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_invoice`
--

DROP TABLE IF EXISTS `djstripe_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_invoice` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount_due` decimal(8,2) NOT NULL,
  `amount_paid` decimal(8,2) DEFAULT NULL,
  `amount_remaining` decimal(8,2) DEFAULT NULL,
  `application_fee` decimal(8,2) DEFAULT NULL,
  `attempt_count` int NOT NULL,
  `attempted` tinyint(1) NOT NULL,
  `billing` varchar(20) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `ending_balance` bigint DEFAULT NULL,
  `forgiven` tinyint(1) NOT NULL,
  `hosted_invoice_url` varchar(799) DEFAULT NULL,
  `invoice_pdf` varchar(799) DEFAULT NULL,
  `next_payment_attempt` datetime(6) DEFAULT NULL,
  `number` varchar(64) DEFAULT NULL,
  `paid` tinyint(1) NOT NULL,
  `period_end` datetime(6) NOT NULL,
  `period_start` datetime(6) NOT NULL,
  `receipt_number` varchar(64) DEFAULT NULL,
  `starting_balance` bigint NOT NULL,
  `statement_descriptor` varchar(22) DEFAULT NULL,
  `subscription_proration_date` datetime(6) DEFAULT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `total` decimal(8,2) NOT NULL,
  `webhooks_delivered_at` datetime(6) DEFAULT NULL,
  `charge_id` bigint DEFAULT NULL,
  `customer_id` varchar(255) NOT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `charge_id` (`charge_id`),
  KEY `djstripe_invoice_subscription_id_2dbc2461_fk_djstripe_` (`subscription_id`),
  CONSTRAINT `djstripe_invoice_subscription_id_2dbc2461_fk_djstripe_` FOREIGN KEY (`subscription_id`) REFERENCES `djstripe_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_invoice`
--

LOCK TABLES `djstripe_invoice` WRITE;
/*!40000 ALTER TABLE `djstripe_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_invoiceitem`
--

DROP TABLE IF EXISTS `djstripe_invoiceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_invoiceitem` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `date` datetime(6) NOT NULL,
  `discountable` tinyint(1) NOT NULL,
  `period` json NOT NULL,
  `period_end` datetime(6) NOT NULL,
  `period_start` datetime(6) NOT NULL,
  `proration` tinyint(1) NOT NULL,
  `quantity` int DEFAULT NULL,
  `customer_id` varchar(255) NOT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `plan_id` bigint DEFAULT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_invoiceitem`
--

LOCK TABLES `djstripe_invoiceitem` WRITE;
/*!40000 ALTER TABLE `djstripe_invoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_invoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_paymentmethod`
--

DROP TABLE IF EXISTS `djstripe_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_paymentmethod` (
  `id` varchar(255) NOT NULL,
  `type` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_paymentmethod`
--

LOCK TABLES `djstripe_paymentmethod` WRITE;
/*!40000 ALTER TABLE `djstripe_paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_payout`
--

DROP TABLE IF EXISTS `djstripe_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_payout` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `arrival_date` datetime(6) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `failure_code` varchar(23) DEFAULT NULL,
  `failure_message` longtext,
  `method` varchar(8) NOT NULL,
  `statement_descriptor` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(12) NOT NULL,
  `destination_id` varchar(255) DEFAULT NULL,
  `balance_transaction_id` varchar(255) DEFAULT NULL,
  `failure_balance_transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_payout_balance_transaction__a9393fb6_fk_djstripe_` (`balance_transaction_id`),
  KEY `djstripe_payout_failure_balance_tran_77d442db_fk_djstripe_` (`failure_balance_transaction_id`),
  CONSTRAINT `djstripe_payout_balance_transaction__a9393fb6_fk_djstripe_` FOREIGN KEY (`balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`),
  CONSTRAINT `djstripe_payout_failure_balance_tran_77d442db_fk_djstripe_` FOREIGN KEY (`failure_balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_payout`
--

LOCK TABLES `djstripe_payout` WRITE;
/*!40000 ALTER TABLE `djstripe_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_plan`
--

DROP TABLE IF EXISTS `djstripe_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_plan` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `aggregate_usage` varchar(18) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `billing_scheme` varchar(8) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `interval` varchar(5) NOT NULL,
  `interval_count` int DEFAULT NULL,
  `nickname` varchar(5000) DEFAULT NULL,
  `tiers` json DEFAULT NULL,
  `tiers_mode` varchar(9) DEFAULT NULL,
  `transform_usage` json DEFAULT NULL,
  `trial_period_days` int DEFAULT NULL,
  `usage_type` varchar(8) NOT NULL,
  `name` longtext,
  `statement_descriptor` varchar(22) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_plan_product_id_5773384d_fk_djstripe_product_id` (`product_id`),
  CONSTRAINT `djstripe_plan_product_id_5773384d_fk_djstripe_product_id` FOREIGN KEY (`product_id`) REFERENCES `djstripe_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_plan`
--

LOCK TABLES `djstripe_plan` WRITE;
/*!40000 ALTER TABLE `djstripe_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_product`
--

DROP TABLE IF EXISTS `djstripe_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_product` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `name` varchar(5000) NOT NULL,
  `type` varchar(7) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `attributes` json DEFAULT NULL,
  `caption` varchar(5000) DEFAULT NULL,
  `deactivate_on` json DEFAULT NULL,
  `images` json DEFAULT NULL,
  `package_dimensions` json DEFAULT NULL,
  `shippable` tinyint(1) DEFAULT NULL,
  `url` varchar(799) DEFAULT NULL,
  `statement_descriptor` varchar(22) DEFAULT NULL,
  `unit_label` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_product`
--

LOCK TABLES `djstripe_product` WRITE;
/*!40000 ALTER TABLE `djstripe_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_refund`
--

DROP TABLE IF EXISTS `djstripe_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_refund` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `currency` varchar(3) NOT NULL,
  `failure_reason` varchar(24) DEFAULT NULL,
  `reason` varchar(21) DEFAULT NULL,
  `receipt_number` varchar(9) DEFAULT NULL,
  `status` varchar(24) NOT NULL,
  `charge_id` varchar(255) NOT NULL,
  `balance_transaction_id` varchar(255) DEFAULT NULL,
  `failure_balance_transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_refund_balance_transaction__dec480cf_fk_djstripe_` (`balance_transaction_id`),
  KEY `djstripe_refund_failure_balance_tran_817ae640_fk_djstripe_` (`failure_balance_transaction_id`),
  CONSTRAINT `djstripe_refund_balance_transaction__dec480cf_fk_djstripe_` FOREIGN KEY (`balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`),
  CONSTRAINT `djstripe_refund_failure_balance_tran_817ae640_fk_djstripe_` FOREIGN KEY (`failure_balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_refund`
--

LOCK TABLES `djstripe_refund` WRITE;
/*!40000 ALTER TABLE `djstripe_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_scheduledqueryrun`
--

DROP TABLE IF EXISTS `djstripe_scheduledqueryrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_scheduledqueryrun` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `data_load_time` datetime(6) NOT NULL,
  `error` json DEFAULT NULL,
  `result_available_until` datetime(6) NOT NULL,
  `sql` longtext NOT NULL,
  `status` varchar(9) NOT NULL,
  `title` longtext NOT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_scheduledqueryrun`
--

LOCK TABLES `djstripe_scheduledqueryrun` WRITE;
/*!40000 ALTER TABLE `djstripe_scheduledqueryrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_scheduledqueryrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_source`
--

DROP TABLE IF EXISTS `djstripe_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_source` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `client_secret` varchar(255) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `flow` varchar(17) NOT NULL,
  `owner` json NOT NULL,
  `statement_descriptor` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `usage` varchar(10) NOT NULL,
  `code_verification` json DEFAULT NULL,
  `receiver` json DEFAULT NULL,
  `redirect` json DEFAULT NULL,
  `source_data` json NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_source`
--

LOCK TABLES `djstripe_source` WRITE;
/*!40000 ALTER TABLE `djstripe_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_subscription`
--

DROP TABLE IF EXISTS `djstripe_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_subscription` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `application_fee_percent` decimal(5,2) DEFAULT NULL,
  `billing` varchar(20) NOT NULL,
  `billing_cycle_anchor` datetime(6) DEFAULT NULL,
  `cancel_at_period_end` tinyint(1) NOT NULL,
  `canceled_at` datetime(6) DEFAULT NULL,
  `current_period_end` datetime(6) NOT NULL,
  `current_period_start` datetime(6) NOT NULL,
  `days_until_due` int DEFAULT NULL,
  `ended_at` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `start` datetime(6) DEFAULT NULL,
  `status` varchar(8) NOT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `trial_end` datetime(6) DEFAULT NULL,
  `trial_start` datetime(6) DEFAULT NULL,
  `customer_id` varchar(255) NOT NULL,
  `plan_id` bigint NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_subscription`
--

LOCK TABLES `djstripe_subscription` WRITE;
/*!40000 ALTER TABLE `djstripe_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_subscriptionitem`
--

DROP TABLE IF EXISTS `djstripe_subscriptionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_subscriptionitem` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `plan_id` bigint NOT NULL,
  `subscription_id` varchar(255) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `djstripe_subscriptionitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_subscriptionitem`
--

LOCK TABLES `djstripe_subscriptionitem` WRITE;
/*!40000 ALTER TABLE `djstripe_subscriptionitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_subscriptionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_transfer`
--

DROP TABLE IF EXISTS `djstripe_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_transfer` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `amount_reversed` decimal(8,2) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `destination_payment` varchar(255) DEFAULT NULL,
  `reversed` tinyint(1) NOT NULL,
  `source_transaction` varchar(255) DEFAULT NULL,
  `source_type` varchar(16) NOT NULL,
  `transfer_group` varchar(255) DEFAULT NULL,
  `balance_transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  KEY `djstripe_transfer_balance_transaction__b5b00270_fk_djstripe_` (`balance_transaction_id`),
  CONSTRAINT `djstripe_transfer_balance_transaction__b5b00270_fk_djstripe_` FOREIGN KEY (`balance_transaction_id`) REFERENCES `djstripe_balancetransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_transfer`
--

LOCK TABLES `djstripe_transfer` WRITE;
/*!40000 ALTER TABLE `djstripe_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_transferreversal`
--

DROP TABLE IF EXISTS `djstripe_transferreversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_transferreversal` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `amount` bigint NOT NULL,
  `currency` varchar(3) NOT NULL,
  `balance_transaction_id` varchar(255) DEFAULT NULL,
  `transfer_id` varchar(255) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_transferreversal`
--

LOCK TABLES `djstripe_transferreversal` WRITE;
/*!40000 ALTER TABLE `djstripe_transferreversal` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_transferreversal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_upcominginvoice`
--

DROP TABLE IF EXISTS `djstripe_upcominginvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_upcominginvoice` (
  `invoice_ptr_id` bigint NOT NULL,
  PRIMARY KEY (`invoice_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_upcominginvoice`
--

LOCK TABLES `djstripe_upcominginvoice` WRITE;
/*!40000 ALTER TABLE `djstripe_upcominginvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_upcominginvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_usagerecord`
--

DROP TABLE IF EXISTS `djstripe_usagerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_usagerecord` (
  `djstripe_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `livemode` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `description` longtext,
  `djstripe_created` datetime(6) NOT NULL,
  `djstripe_updated` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `subscription_item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`djstripe_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `djstripe_usagerecord_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_usagerecord`
--

LOCK TABLES `djstripe_usagerecord` WRITE;
/*!40000 ALTER TABLE `djstripe_usagerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_usagerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djstripe_webhookeventtrigger`
--

DROP TABLE IF EXISTS `djstripe_webhookeventtrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djstripe_webhookeventtrigger` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `remote_ip` char(39) NOT NULL,
  `headers` json NOT NULL,
  `body` longtext NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `processed` tinyint(1) NOT NULL,
  `exception` varchar(128) NOT NULL,
  `traceback` longtext NOT NULL,
  `djstripe_version` varchar(32) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djstripe_webhookeventtrigger`
--

LOCK TABLES `djstripe_webhookeventtrigger` WRITE;
/*!40000 ALTER TABLE `djstripe_webhookeventtrigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `djstripe_webhookeventtrigger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-11 12:23:11
