-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: ferreteria
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.2

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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add carrito',7,'add_carrito'),(26,'Can change carrito',7,'change_carrito'),(27,'Can delete carrito',7,'delete_carrito'),(28,'Can view carrito',7,'view_carrito'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add producto',13,'add_producto'),(34,'Can change producto',13,'change_producto'),(35,'Can delete producto',13,'delete_producto'),(36,'Can view producto',13,'view_producto'),(37,'Can add orden',12,'add_orden'),(38,'Can change orden',12,'change_orden'),(39,'Can delete orden',12,'delete_orden'),(40,'Can view orden',12,'view_orden'),(41,'Can add item carrito',11,'add_itemcarrito'),(42,'Can change item carrito',11,'change_itemcarrito'),(43,'Can delete item carrito',11,'delete_itemcarrito'),(44,'Can view item carrito',11,'view_itemcarrito'),(45,'Can add interaccion',10,'add_interaccion'),(46,'Can change interaccion',10,'change_interaccion'),(47,'Can delete interaccion',10,'delete_interaccion'),(48,'Can view interaccion',10,'view_interaccion'),(49,'Can add detalle orden',9,'add_detalleorden'),(50,'Can change detalle orden',9,'change_detalleorden'),(51,'Can delete detalle orden',9,'delete_detalleorden'),(52,'Can view detalle orden',9,'view_detalleorden');
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_1','','','user1@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(2,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_2','','','user2@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(3,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_3','','','user3@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(4,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_4','','','user4@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(5,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_5','','','user5@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(6,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_6','','','user6@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(7,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_7','','','user7@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(8,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_8','','','user8@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(9,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_9','','','user9@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(10,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_10','','','user10@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(11,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_11','','','user11@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(12,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_12','','','user12@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(13,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_13','','','user13@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(14,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_14','','','user14@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(15,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_15','','','user15@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(16,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_16','','','user16@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(17,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_17','','','user17@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(18,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_18','','','user18@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(19,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_19','','','user19@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(20,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_20','','','user20@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(21,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_21','','','user21@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(22,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_22','','','user22@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(23,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_23','','','user23@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(24,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_24','','','user24@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(25,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_25','','','user25@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(26,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_26','','','user26@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(27,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_27','','','user27@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(28,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_28','','','user28@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(29,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_29','','','user29@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(30,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_30','','','user30@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(31,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_31','','','user31@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(32,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_32','','','user32@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(33,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_33','','','user33@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(34,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_34','','','user34@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(35,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_35','','','user35@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(36,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_36','','','user36@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(37,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_37','','','user37@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(38,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_38','','','user38@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(39,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_39','','','user39@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(40,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_40','','','user40@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(41,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_41','','','user41@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(42,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_42','','','user42@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(43,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_43','','','user43@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(44,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_44','','','user44@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(45,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_45','','','user45@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(46,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_46','','','user46@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(47,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_47','','','user47@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(48,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_48','','','user48@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(49,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_49','','','user49@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(50,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_50','','','user50@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(51,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_51','','','user51@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(52,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_52','','','user52@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(53,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_53','','','user53@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(54,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_54','','','user54@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(55,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_55','','','user55@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(56,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_56','','','user56@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(57,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_57','','','user57@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(58,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_58','','','user58@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(59,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_59','','','user59@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(60,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_60','','','user60@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(61,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_61','','','user61@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(62,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_62','','','user62@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(63,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_63','','','user63@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(64,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_64','','','user64@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(65,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_65','','','user65@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(66,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_66','','','user66@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(67,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_67','','','user67@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(68,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_68','','','user68@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(69,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_69','','','user69@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(70,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_70','','','user70@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(71,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_71','','','user71@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(72,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_72','','','user72@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(73,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_73','','','user73@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(74,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_74','','','user74@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(75,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_75','','','user75@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(76,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_76','','','user76@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(77,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_77','','','user77@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(78,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_78','','','user78@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(79,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_79','','','user79@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(80,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_80','','','user80@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(81,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_81','','','user81@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(82,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_82','','','user82@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(83,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_83','','','user83@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(84,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_84','','','user84@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(85,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_85','','','user85@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(86,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_86','','','user86@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(87,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_87','','','user87@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(88,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_88','','','user88@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(89,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_89','','','user89@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(90,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_90','','','user90@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(91,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_91','','','user91@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(92,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_92','','','user92@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(93,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_93','','','user93@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(94,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_94','','','user94@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(95,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_95','','','user95@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(96,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_96','','','user96@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(97,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_97','','','user97@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(98,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_98','','','user98@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(99,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_99','','','user99@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(100,'pbkdf2_sha256$260000$salt$fakehash',NULL,0,'cliente_100','','','user100@ferreteria.com',0,1,'2026-05-06 20:08:12.000000'),(101,'pbkdf2_sha256$1200000$sHWY0JPZyygrN5jbC9ZJLv$ofQ6d0/M0WwBE7oN01VPUgp2Q04rluUCH2wis2Rwoi0=','2026-05-26 20:12:24.503739',0,'heli','','','22460308@colima.tecnm.mx',0,1,'2026-05-07 02:41:02.130385'),(102,'pbkdf2_sha256$1200000$lMQJxtxNE4MC9hyWmI0gHu$ICBYeWOi52IQ97WJ1vy1/6+MM75ydaySyeSDLaI/tCQ=','2026-05-26 20:12:12.003338',0,'gabs','','','1@gmail.com',0,1,'2026-05-07 19:12:07.492380');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'tienda','carrito'),(8,'tienda','categoria'),(9,'tienda','detalleorden'),(10,'tienda','interaccion'),(11,'tienda','itemcarrito'),(12,'tienda','orden'),(13,'tienda','producto');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-05-07 02:06:45.881112'),(2,'auth','0001_initial','2026-05-07 02:06:46.434289'),(3,'admin','0001_initial','2026-05-07 02:06:46.578132'),(4,'admin','0002_logentry_remove_auto_add','2026-05-07 02:06:46.590531'),(5,'admin','0003_logentry_add_action_flag_choices','2026-05-07 02:06:46.602527'),(6,'contenttypes','0002_remove_content_type_name','2026-05-07 02:06:46.710367'),(7,'auth','0002_alter_permission_name_max_length','2026-05-07 02:06:46.775767'),(8,'auth','0003_alter_user_email_max_length','2026-05-07 02:06:46.806943'),(9,'auth','0004_alter_user_username_opts','2026-05-07 02:06:46.819584'),(10,'auth','0005_alter_user_last_login_null','2026-05-07 02:06:46.873096'),(11,'auth','0006_require_contenttypes_0002','2026-05-07 02:06:46.877192'),(12,'auth','0007_alter_validators_add_error_messages','2026-05-07 02:06:46.889527'),(13,'auth','0008_alter_user_username_max_length','2026-05-07 02:06:46.959515'),(14,'auth','0009_alter_user_last_name_max_length','2026-05-07 02:06:47.029485'),(15,'auth','0010_alter_group_name_max_length','2026-05-07 02:06:47.059289'),(16,'auth','0011_update_proxy_permissions','2026-05-07 02:06:47.071811'),(17,'auth','0012_alter_user_first_name_max_length','2026-05-07 02:06:47.139234'),(18,'sessions','0001_initial','2026-05-07 02:06:47.179128'),(19,'tienda','0001_initial','2026-05-07 02:06:47.828596'),(20,'tienda','0002_producto_cluster','2026-05-07 18:47:19.993449');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8rhwwfpm42bofhwgabdakguvn4a217rf','.eJxVjEEOgjAQRe_StWmmLaXFpXvOQIaZqUVNSSisjHcXEha6_e-9_1YDbmsetirLMLG6KgNGXX7XEekp5UD8wHKfNc1lXaZRH4o-adX9zPK6ne7fQcaa9xp8Gh1EwFaskAvWJYsxYks7CdRgiuwBjfMdRmQQS4y2azhJDJ4a9fkCME84uA:1wRy8W:Il4Iq6UaeS6WcHbOep-j-z_ClIaZzo5Qwy27zD9xvfo','2026-06-09 20:12:24.507789');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_carrito`
--

DROP TABLE IF EXISTS `tienda_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_carrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creado` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_carrito_usuario_id_488f5349_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `tienda_carrito_usuario_id_488f5349_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_carrito`
--

LOCK TABLES `tienda_carrito` WRITE;
/*!40000 ALTER TABLE `tienda_carrito` DISABLE KEYS */;
INSERT INTO `tienda_carrito` VALUES (1,'2026-05-06 20:10:15.000000',1),(2,'2026-05-06 20:10:15.000000',2),(3,'2026-05-06 20:10:15.000000',3),(4,'2026-05-06 20:10:15.000000',4),(5,'2026-05-06 20:10:15.000000',5),(6,'2026-05-06 20:10:15.000000',6),(7,'2026-05-06 20:10:15.000000',7),(8,'2026-05-06 20:10:15.000000',8),(9,'2026-05-06 20:10:15.000000',9),(10,'2026-05-06 20:10:15.000000',10),(11,'2026-05-06 20:10:15.000000',11),(12,'2026-05-06 20:10:15.000000',12),(13,'2026-05-06 20:10:15.000000',13),(14,'2026-05-06 20:10:15.000000',14),(15,'2026-05-06 20:10:15.000000',15),(16,'2026-05-06 20:10:15.000000',16),(17,'2026-05-06 20:10:15.000000',17),(18,'2026-05-06 20:10:15.000000',18),(19,'2026-05-06 20:10:15.000000',19),(20,'2026-05-06 20:10:15.000000',20),(21,'2026-05-06 20:10:15.000000',21),(22,'2026-05-06 20:10:15.000000',22),(23,'2026-05-06 20:10:15.000000',23),(24,'2026-05-06 20:10:15.000000',24),(25,'2026-05-06 20:10:15.000000',25),(26,'2026-05-06 20:10:15.000000',26),(27,'2026-05-06 20:10:15.000000',27),(28,'2026-05-06 20:10:15.000000',28),(29,'2026-05-06 20:10:15.000000',29),(30,'2026-05-06 20:10:15.000000',30),(31,'2026-05-06 20:10:15.000000',31),(32,'2026-05-06 20:10:15.000000',32),(33,'2026-05-06 20:10:15.000000',33),(34,'2026-05-06 20:10:15.000000',34),(35,'2026-05-06 20:10:15.000000',35),(36,'2026-05-06 20:10:15.000000',36),(37,'2026-05-06 20:10:15.000000',37),(38,'2026-05-06 20:10:15.000000',38),(39,'2026-05-06 20:10:15.000000',39),(40,'2026-05-06 20:10:15.000000',40),(41,'2026-05-06 20:10:15.000000',41),(42,'2026-05-06 20:10:15.000000',42),(43,'2026-05-06 20:10:15.000000',43),(44,'2026-05-06 20:10:15.000000',44),(45,'2026-05-06 20:10:15.000000',45),(46,'2026-05-06 20:10:15.000000',46),(47,'2026-05-06 20:10:15.000000',47),(48,'2026-05-06 20:10:15.000000',48),(49,'2026-05-06 20:10:15.000000',49),(50,'2026-05-06 20:10:15.000000',50),(51,'2026-05-06 20:10:15.000000',51),(52,'2026-05-06 20:10:15.000000',52),(53,'2026-05-06 20:10:15.000000',53),(54,'2026-05-06 20:10:15.000000',54),(55,'2026-05-06 20:10:15.000000',55),(56,'2026-05-06 20:10:15.000000',56),(57,'2026-05-06 20:10:15.000000',57),(58,'2026-05-06 20:10:15.000000',58),(59,'2026-05-06 20:10:15.000000',59),(60,'2026-05-06 20:10:15.000000',60),(61,'2026-05-06 20:10:15.000000',61),(62,'2026-05-06 20:10:15.000000',62),(63,'2026-05-06 20:10:15.000000',63),(64,'2026-05-06 20:10:15.000000',64),(65,'2026-05-06 20:10:15.000000',65),(66,'2026-05-06 20:10:15.000000',66),(67,'2026-05-06 20:10:15.000000',67),(68,'2026-05-06 20:10:15.000000',68),(69,'2026-05-06 20:10:15.000000',69),(70,'2026-05-06 20:10:15.000000',70),(71,'2026-05-06 20:10:15.000000',71),(72,'2026-05-06 20:10:15.000000',72),(73,'2026-05-06 20:10:15.000000',73),(74,'2026-05-06 20:10:15.000000',74),(75,'2026-05-06 20:10:15.000000',75),(76,'2026-05-06 20:10:15.000000',76),(77,'2026-05-06 20:10:15.000000',77),(78,'2026-05-06 20:10:15.000000',78),(79,'2026-05-06 20:10:15.000000',79),(80,'2026-05-06 20:10:15.000000',80),(81,'2026-05-06 20:10:15.000000',81),(82,'2026-05-06 20:10:15.000000',82),(83,'2026-05-06 20:10:15.000000',83),(84,'2026-05-06 20:10:15.000000',84),(85,'2026-05-06 20:10:15.000000',85),(86,'2026-05-06 20:10:15.000000',86),(87,'2026-05-06 20:10:15.000000',87),(88,'2026-05-06 20:10:15.000000',88),(89,'2026-05-06 20:10:15.000000',89),(90,'2026-05-06 20:10:15.000000',90),(91,'2026-05-06 20:10:15.000000',91),(92,'2026-05-06 20:10:15.000000',92),(93,'2026-05-06 20:10:15.000000',93),(94,'2026-05-06 20:10:15.000000',94),(95,'2026-05-06 20:10:15.000000',95),(96,'2026-05-06 20:10:15.000000',96),(97,'2026-05-06 20:10:15.000000',97),(98,'2026-05-06 20:10:15.000000',98),(99,'2026-05-06 20:10:15.000000',99),(100,'2026-05-06 20:10:15.000000',100),(101,'2026-05-07 02:41:07.218368',101),(102,'2026-05-07 19:12:20.848058',102);
/*!40000 ALTER TABLE `tienda_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_categoria`
--

DROP TABLE IF EXISTS `tienda_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_categoria`
--

LOCK TABLES `tienda_categoria` WRITE;
/*!40000 ALTER TABLE `tienda_categoria` DISABLE KEYS */;
INSERT INTO `tienda_categoria` VALUES (1,'Herramientas'),(2,'Electricidad'),(3,'Plomería'),(4,'Construcción'),(5,'Jardinería'),(6,'Pintura'),(7,'Seguridad'),(8,'Ferretería');
/*!40000 ALTER TABLE `tienda_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_detalleorden`
--

DROP TABLE IF EXISTS `tienda_detalleorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_detalleorden` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `orden_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_detalleorden_orden_id_18bbf19a_fk_tienda_orden_id` (`orden_id`),
  KEY `tienda_detalleorden_producto_id_39961849_fk_tienda_producto_id` (`producto_id`),
  CONSTRAINT `tienda_detalleorden_orden_id_18bbf19a_fk_tienda_orden_id` FOREIGN KEY (`orden_id`) REFERENCES `tienda_orden` (`id`),
  CONSTRAINT `tienda_detalleorden_producto_id_39961849_fk_tienda_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `tienda_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_detalleorden`
--

LOCK TABLES `tienda_detalleorden` WRITE;
/*!40000 ALTER TABLE `tienda_detalleorden` DISABLE KEYS */;
INSERT INTO `tienda_detalleorden` VALUES (1,1,83,71),(2,4,17,65),(3,3,70,31),(4,3,34,31),(5,2,70,90),(6,3,29,27),(7,5,50,9),(8,3,44,35),(9,4,21,67),(10,3,61,87),(11,4,4,58),(12,5,17,49),(13,5,18,9),(14,1,25,56),(15,2,39,90),(16,1,91,58),(17,2,9,93),(18,3,21,82),(19,5,96,35),(20,3,19,42),(21,1,31,100),(22,4,30,32),(23,3,44,15),(24,3,63,90),(25,4,25,50),(26,4,12,43),(27,4,67,94),(28,1,67,23),(29,3,4,74),(30,5,77,6),(31,1,61,19),(32,5,4,80),(33,5,12,86),(34,3,12,77),(35,1,11,10),(36,1,42,66),(37,3,13,59),(38,2,92,100),(39,3,13,98),(40,5,46,85),(41,4,81,42),(42,1,5,25),(43,2,71,29),(44,2,58,2),(45,5,80,86),(46,2,84,56),(47,5,69,60),(48,1,87,53),(49,1,58,78),(50,1,43,67),(51,3,24,5),(52,4,43,59),(53,3,46,38),(54,3,36,31),(55,2,27,3),(56,4,58,88),(57,3,60,6),(58,5,24,74),(59,2,58,100),(60,1,33,83),(61,2,36,29),(62,3,85,22),(63,2,2,48),(64,3,20,2),(65,4,31,12),(66,3,98,89),(67,2,86,76),(68,2,85,56),(69,2,55,100),(70,1,80,91),(71,4,100,54),(72,5,94,57),(73,1,27,37),(74,2,9,33),(75,4,88,26),(76,1,45,29),(77,1,67,1),(78,2,23,99),(79,4,30,73),(80,1,52,35),(81,3,93,6),(82,1,30,99),(83,3,24,5),(84,4,59,30),(85,5,67,20),(86,4,29,51),(87,2,83,15),(88,1,65,60),(89,2,30,43),(90,1,6,46),(91,5,32,19),(92,3,17,99),(93,2,27,1),(94,3,14,100),(95,1,74,6),(96,5,19,71),(97,5,70,58),(98,5,38,40),(99,5,19,30),(100,3,70,73),(101,3,48,78),(102,1,1,63),(103,5,72,23),(104,5,27,35),(105,5,69,61),(106,3,1,12),(107,2,60,23),(108,1,91,58),(109,5,17,28),(110,2,52,99),(111,4,93,50),(112,4,1,93),(113,2,30,63),(114,3,33,92),(115,4,16,4),(116,4,48,23),(117,3,82,99),(118,1,48,92),(119,4,5,77),(120,4,15,65),(121,5,99,59),(122,2,9,51),(123,1,82,30),(124,2,32,45),(125,3,14,77),(126,4,93,28),(127,4,23,30),(128,4,8,1),(129,3,92,24),(130,4,36,56),(131,1,80,90),(132,3,71,33),(133,1,42,67),(134,5,36,59),(135,1,44,68),(136,2,29,24),(137,5,84,28),(138,4,49,84),(139,1,20,74),(140,1,25,98),(141,4,66,92),(142,3,46,37),(143,4,17,45),(144,1,43,88),(145,5,78,66),(146,5,73,83),(147,2,15,95),(148,4,70,56),(149,3,77,77),(150,2,33,7),(151,2,58,81),(152,5,7,44),(153,4,61,10),(154,5,94,74),(155,4,18,25),(156,4,84,5),(157,1,45,9),(158,1,11,30),(159,3,1,50),(160,3,84,79),(161,4,73,36),(162,4,11,60),(163,5,59,92),(164,3,36,33),(165,2,81,34),(166,3,45,36),(167,5,17,49),(168,4,17,6),(169,1,78,50),(170,2,31,7),(171,1,72,44),(172,5,95,57),(173,4,25,29),(174,3,48,37),(175,1,3,85),(176,5,14,29),(177,2,15,74),(178,1,4,45),(179,4,20,68),(180,3,87,2),(181,3,19,62),(182,2,63,65),(183,2,80,94),(184,3,74,73),(185,2,5,88),(186,5,63,36),(187,1,50,73),(188,1,56,34),(189,5,10,42),(190,1,79,49),(191,5,86,12),(192,3,61,5),(193,4,90,28),(194,2,58,83),(195,3,53,43),(196,1,53,93),(197,2,45,13),(198,3,93,85),(199,5,66,96),(200,2,16,36),(201,1,101,2),(202,1,101,7),(203,1,102,3),(204,1,102,4),(205,1,103,2),(206,1,103,3),(207,2,104,6),(208,1,105,82),(209,1,106,2),(210,1,106,6),(211,1,107,1),(212,1,107,36),(213,1,108,46),(214,1,108,59),(215,1,109,20),(216,1,109,8),(217,3,109,33),(218,1,110,46),(219,1,110,59),(220,1,110,81),(221,1,111,1),(222,1,111,4),(223,1,111,15),(224,1,112,2),(225,3,113,1),(226,1,114,26),(227,2,114,81),(228,1,114,84),(229,1,114,93),(230,3,115,7),(231,1,116,10),(232,1,116,91),(233,1,117,50),(234,2,118,36),(235,1,119,2),(236,1,120,1),(237,1,121,3),(238,1,122,14),(239,30,123,1);
/*!40000 ALTER TABLE `tienda_detalleorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_interaccion`
--

DROP TABLE IF EXISTS `tienda_interaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_interaccion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `producto_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_interaccion_producto_id_eca4d9e0_fk_tienda_producto_id` (`producto_id`),
  KEY `tienda_interaccion_usuario_id_ea2af19e_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `tienda_interaccion_producto_id_eca4d9e0_fk_tienda_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `tienda_producto` (`id`),
  CONSTRAINT `tienda_interaccion_usuario_id_ea2af19e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_interaccion`
--

LOCK TABLES `tienda_interaccion` WRITE;
/*!40000 ALTER TABLE `tienda_interaccion` DISABLE KEYS */;
INSERT INTO `tienda_interaccion` VALUES (1,'VISTA',59,51),(2,'COMPRA',12,27),(3,'VISTA',56,59),(4,'VISTA',12,44),(5,'VISTA',21,1),(6,'COMPRA',71,57),(7,'VISTA',49,99),(8,'COMPRA',9,91),(9,'COMPRA',61,36),(10,'VISTA',82,94),(11,'COMPRA',67,90),(12,'VISTA',68,34),(13,'VISTA',14,86),(14,'VISTA',79,24),(15,'VISTA',6,75),(16,'COMPRA',92,1),(17,'VISTA',72,9),(18,'VISTA',51,50),(19,'VISTA',100,62),(20,'COMPRA',21,73),(21,'VISTA',13,52),(22,'VISTA',65,98),(23,'COMPRA',60,72),(24,'COMPRA',70,22),(25,'VISTA',41,97),(26,'COMPRA',77,44),(27,'COMPRA',15,35),(28,'VISTA',12,5),(29,'COMPRA',34,95),(30,'COMPRA',28,16),(31,'VISTA',31,82),(32,'VISTA',70,38),(33,'VISTA',52,73),(34,'COMPRA',68,60),(35,'COMPRA',39,5),(36,'COMPRA',44,76),(37,'COMPRA',32,21),(38,'VISTA',12,79),(39,'COMPRA',76,68),(40,'COMPRA',26,51),(41,'COMPRA',18,11),(42,'COMPRA',41,44),(43,'COMPRA',36,30),(44,'COMPRA',86,53),(45,'COMPRA',79,99),(46,'COMPRA',65,52),(47,'VISTA',62,55),(48,'VISTA',93,47),(49,'COMPRA',14,37),(50,'COMPRA',84,52),(51,'COMPRA',34,65),(52,'VISTA',1,64),(53,'COMPRA',8,48),(54,'COMPRA',7,60),(55,'COMPRA',81,49),(56,'COMPRA',62,47),(57,'COMPRA',17,43),(58,'COMPRA',47,22),(59,'COMPRA',90,99),(60,'COMPRA',89,89),(61,'COMPRA',42,14),(62,'VISTA',33,7),(63,'COMPRA',72,21),(64,'VISTA',45,67),(65,'COMPRA',95,72),(66,'COMPRA',61,7),(67,'COMPRA',19,34),(68,'COMPRA',12,97),(69,'VISTA',3,1),(70,'VISTA',67,39),(71,'COMPRA',84,88),(72,'COMPRA',54,24),(73,'COMPRA',72,34),(74,'VISTA',65,67),(75,'VISTA',42,23),(76,'COMPRA',88,83),(77,'COMPRA',47,83),(78,'COMPRA',64,84),(79,'VISTA',33,48),(80,'COMPRA',84,10),(81,'VISTA',29,100),(82,'VISTA',100,26),(83,'COMPRA',5,15),(84,'VISTA',56,79),(85,'VISTA',61,60),(86,'COMPRA',62,48),(87,'VISTA',63,31),(88,'COMPRA',50,24),(89,'COMPRA',33,32),(90,'VISTA',38,27),(91,'COMPRA',63,39),(92,'VISTA',39,85),(93,'VISTA',43,94),(94,'VISTA',83,37),(95,'VISTA',7,63),(96,'VISTA',11,10),(97,'VISTA',38,81),(98,'COMPRA',17,11),(99,'VISTA',34,20),(100,'VISTA',62,60),(101,'VISTA',96,56),(102,'COMPRA',89,64),(103,'VISTA',18,95),(104,'COMPRA',14,65),(105,'COMPRA',67,16),(106,'COMPRA',42,19),(107,'VISTA',74,48),(108,'COMPRA',34,2),(109,'VISTA',24,24),(110,'COMPRA',1,70),(111,'VISTA',9,80),(112,'COMPRA',51,93),(113,'VISTA',43,35),(114,'VISTA',89,2),(115,'COMPRA',75,40),(116,'COMPRA',40,40),(117,'VISTA',34,74),(118,'VISTA',6,29),(119,'COMPRA',75,2),(120,'VISTA',77,16),(121,'VISTA',85,37),(122,'COMPRA',81,3),(123,'VISTA',34,23),(124,'COMPRA',37,9),(125,'COMPRA',97,74),(126,'VISTA',21,22),(127,'VISTA',21,27),(128,'VISTA',71,47),(129,'COMPRA',62,39),(130,'COMPRA',97,75),(131,'COMPRA',86,14),(132,'COMPRA',16,75),(133,'VISTA',58,25),(134,'VISTA',66,2),(135,'COMPRA',86,10),(136,'VISTA',8,42),(137,'VISTA',65,41),(138,'VISTA',53,12),(139,'COMPRA',91,97),(140,'COMPRA',18,42),(141,'VISTA',94,79),(142,'VISTA',33,87),(143,'VISTA',30,7),(144,'VISTA',81,54),(145,'COMPRA',58,78),(146,'COMPRA',36,100),(147,'VISTA',18,92),(148,'COMPRA',45,18),(149,'COMPRA',88,21),(150,'COMPRA',35,35),(151,'COMPRA',51,30),(152,'COMPRA',30,64),(153,'COMPRA',91,92),(154,'VISTA',83,25),(155,'VISTA',15,46),(156,'COMPRA',8,22),(157,'VISTA',93,43),(158,'COMPRA',91,100),(159,'VISTA',24,97),(160,'COMPRA',9,57),(161,'COMPRA',74,39),(162,'COMPRA',17,34),(163,'COMPRA',33,56),(164,'COMPRA',92,98),(165,'COMPRA',93,36),(166,'COMPRA',32,100),(167,'COMPRA',17,99),(168,'VISTA',80,89),(169,'COMPRA',8,21),(170,'COMPRA',46,55),(171,'COMPRA',75,95),(172,'VISTA',86,9),(173,'COMPRA',25,46),(174,'COMPRA',75,68),(175,'VISTA',55,11),(176,'VISTA',91,44),(177,'VISTA',81,51),(178,'VISTA',71,4),(179,'VISTA',66,99),(180,'COMPRA',11,61),(181,'VISTA',54,12),(182,'VISTA',100,100),(183,'COMPRA',22,5),(184,'VISTA',55,8),(185,'VISTA',35,76),(186,'COMPRA',11,31),(187,'COMPRA',27,84),(188,'COMPRA',12,32),(189,'COMPRA',50,89),(190,'VISTA',16,51),(191,'COMPRA',3,76),(192,'COMPRA',71,27),(193,'COMPRA',96,65),(194,'COMPRA',65,45),(195,'VISTA',50,43),(196,'COMPRA',31,59),(197,'VISTA',71,79),(198,'COMPRA',23,75),(199,'COMPRA',94,72),(200,'COMPRA',89,91),(201,'COMPRA',73,99),(202,'COMPRA',33,29),(203,'VISTA',44,96),(204,'COMPRA',4,19),(205,'VISTA',27,4),(206,'VISTA',27,40),(207,'COMPRA',4,89),(208,'VISTA',74,46),(209,'VISTA',68,32),(210,'COMPRA',94,4),(211,'COMPRA',32,100),(212,'COMPRA',34,3),(213,'VISTA',21,1),(214,'COMPRA',65,55),(215,'VISTA',80,90),(216,'VISTA',5,98),(217,'VISTA',55,51),(218,'COMPRA',45,42),(219,'COMPRA',95,58),(220,'COMPRA',59,12),(221,'VISTA',63,30),(222,'VISTA',85,32),(223,'VISTA',86,95),(224,'VISTA',37,53),(225,'VISTA',35,23),(226,'COMPRA',36,9),(227,'COMPRA',5,52),(228,'VISTA',75,15),(229,'VISTA',39,26),(230,'COMPRA',51,59),(231,'VISTA',29,32),(232,'COMPRA',77,43),(233,'VISTA',72,48),(234,'VISTA',41,57),(235,'COMPRA',99,39),(236,'COMPRA',80,81),(237,'COMPRA',74,27),(238,'VISTA',80,31),(239,'VISTA',89,3),(240,'COMPRA',46,11),(241,'VISTA',54,50),(242,'VISTA',72,48),(243,'VISTA',67,63),(244,'VISTA',7,29),(245,'COMPRA',2,8),(246,'COMPRA',76,28),(247,'VISTA',99,58),(248,'COMPRA',14,94),(249,'VISTA',46,3),(250,'COMPRA',48,62),(251,'COMPRA',13,37),(252,'COMPRA',42,43),(253,'COMPRA',88,87),(254,'VISTA',36,12),(255,'COMPRA',24,11),(256,'VISTA',89,48),(257,'COMPRA',79,37),(258,'VISTA',4,93),(259,'VISTA',20,88),(260,'COMPRA',62,13),(261,'COMPRA',67,54),(262,'COMPRA',10,66),(263,'COMPRA',69,25),(264,'COMPRA',28,48),(265,'COMPRA',45,85),(266,'VISTA',87,97),(267,'COMPRA',26,51),(268,'COMPRA',45,17),(269,'COMPRA',31,30),(270,'COMPRA',53,29),(271,'COMPRA',48,14),(272,'VISTA',66,30),(273,'VISTA',45,92),(274,'VISTA',64,1),(275,'VISTA',98,90),(276,'COMPRA',57,3),(277,'COMPRA',77,100),(278,'VISTA',25,97),(279,'VISTA',82,97),(280,'VISTA',77,47),(281,'COMPRA',31,93),(282,'COMPRA',7,87),(283,'COMPRA',6,45),(284,'COMPRA',47,45),(285,'COMPRA',49,49),(286,'VISTA',36,47),(287,'COMPRA',48,94),(288,'COMPRA',37,42),(289,'VISTA',32,82),(290,'COMPRA',62,82),(291,'COMPRA',34,24),(292,'VISTA',33,85),(293,'VISTA',11,48),(294,'COMPRA',86,24),(295,'VISTA',41,22),(296,'VISTA',51,74),(297,'COMPRA',63,13),(298,'COMPRA',52,97),(299,'COMPRA',4,81),(300,'VISTA',60,56),(301,'COMPRA',2,101),(302,'COMPRA',7,101),(303,'COMPRA',3,101),(304,'COMPRA',4,101),(305,'COMPRA',2,101),(306,'COMPRA',3,101),(307,'COMPRA',6,101),(308,'COMPRA',82,101),(309,'COMPRA',2,101),(310,'COMPRA',6,101),(311,'VISTA',7,101),(312,'VISTA',36,101),(313,'COMPRA',1,101),(314,'COMPRA',36,101),(315,'VISTA',46,101),(316,'VISTA',59,101),(317,'COMPRA',46,101),(318,'COMPRA',59,101),(319,'VISTA',20,101),(320,'VISTA',8,101),(321,'VISTA',33,101),(322,'VISTA',33,101),(323,'VISTA',33,101),(324,'COMPRA',20,101),(325,'COMPRA',8,101),(326,'COMPRA',33,101),(327,'VISTA',46,101),(328,'VISTA',59,101),(329,'VISTA',81,101),(330,'COMPRA',46,101),(331,'COMPRA',59,101),(332,'COMPRA',81,101),(333,'VISTA',1,102),(334,'VISTA',1,102),(335,'VISTA',4,102),(336,'VISTA',15,102),(337,'COMPRA',1,102),(338,'COMPRA',4,102),(339,'COMPRA',15,102),(340,'VISTA',2,101),(341,'COMPRA',2,101),(342,'VISTA',1,101),(343,'VISTA',1,101),(344,'VISTA',1,101),(345,'COMPRA',1,101),(346,'VISTA',6,101),(347,'VISTA',6,101),(348,'VISTA',3,101),(349,'VISTA',17,101),(350,'VISTA',26,101),(351,'VISTA',81,101),(352,'VISTA',81,101),(353,'VISTA',84,101),(354,'VISTA',93,101),(355,'COMPRA',26,101),(356,'COMPRA',81,101),(357,'COMPRA',84,101),(358,'COMPRA',93,101),(359,'VISTA',73,101),(360,'VISTA',73,101),(361,'VISTA',7,101),(362,'VISTA',7,101),(363,'VISTA',7,101),(364,'COMPRA',7,101),(365,'VISTA',10,101),(366,'VISTA',91,101),(367,'COMPRA',10,101),(368,'COMPRA',91,101),(369,'VISTA',50,101),(370,'COMPRA',50,101),(371,'VISTA',36,101),(372,'VISTA',36,101),(373,'COMPRA',36,101),(374,'VISTA',2,101),(375,'COMPRA',2,101),(376,'VISTA',1,101),(377,'VISTA',1,101),(378,'COMPRA',1,101),(379,'VISTA',3,101),(380,'COMPRA',3,101),(381,'VISTA',14,101),(382,'COMPRA',14,101),(383,'VISTA',1,101),(384,'VISTA',1,101),(385,'VISTA',1,101),(386,'VISTA',1,101),(387,'VISTA',1,101),(388,'VISTA',1,101),(389,'VISTA',1,101),(390,'VISTA',1,101),(391,'VISTA',1,101),(392,'VISTA',1,101),(393,'VISTA',1,101),(394,'VISTA',1,101),(395,'VISTA',1,101),(396,'VISTA',1,101),(397,'VISTA',1,101),(398,'VISTA',1,101),(399,'VISTA',1,101),(400,'VISTA',1,101),(401,'VISTA',1,101),(402,'VISTA',1,101),(403,'VISTA',1,101),(404,'VISTA',1,101),(405,'VISTA',1,101),(406,'VISTA',1,101),(407,'VISTA',1,101),(408,'VISTA',1,101),(409,'VISTA',1,101),(410,'VISTA',1,101),(411,'VISTA',1,101),(412,'VISTA',1,101),(413,'VISTA',1,101),(414,'VISTA',1,101),(415,'VISTA',1,101),(416,'VISTA',1,101),(417,'VISTA',1,101),(418,'VISTA',1,101),(419,'VISTA',1,101),(420,'VISTA',1,101),(421,'VISTA',1,101),(422,'VISTA',1,101),(423,'VISTA',1,101),(424,'VISTA',1,101),(425,'VISTA',1,101),(426,'VISTA',1,101),(427,'VISTA',1,101),(428,'VISTA',1,101),(429,'VISTA',1,101),(430,'VISTA',1,101),(431,'VISTA',1,101),(432,'VISTA',1,101),(433,'VISTA',1,101),(434,'VISTA',1,101),(435,'VISTA',1,101),(436,'VISTA',1,101),(437,'VISTA',1,101),(438,'VISTA',1,101),(439,'VISTA',1,101),(440,'VISTA',1,101),(441,'VISTA',1,101),(442,'VISTA',1,101),(443,'VISTA',1,101),(444,'VISTA',1,101),(445,'VISTA',1,101),(446,'VISTA',1,101),(447,'VISTA',1,101),(448,'VISTA',1,101),(449,'VISTA',1,101),(450,'VISTA',1,101),(451,'VISTA',1,101),(452,'VISTA',1,101),(453,'VISTA',1,101),(454,'VISTA',1,101),(455,'VISTA',1,101),(456,'VISTA',1,101),(457,'VISTA',1,101),(458,'VISTA',1,101),(459,'VISTA',1,101),(460,'VISTA',1,101),(461,'VISTA',1,101),(462,'COMPRA',1,101);
/*!40000 ALTER TABLE `tienda_interaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_itemcarrito`
--

DROP TABLE IF EXISTS `tienda_itemcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_itemcarrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `carrito_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_itemcarrito_carrito_id_f9ecbcdf_fk_tienda_carrito_id` (`carrito_id`),
  KEY `tienda_itemcarrito_producto_id_607209aa_fk_tienda_producto_id` (`producto_id`),
  CONSTRAINT `tienda_itemcarrito_carrito_id_f9ecbcdf_fk_tienda_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `tienda_carrito` (`id`),
  CONSTRAINT `tienda_itemcarrito_producto_id_607209aa_fk_tienda_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `tienda_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_itemcarrito`
--

LOCK TABLES `tienda_itemcarrito` WRITE;
/*!40000 ALTER TABLE `tienda_itemcarrito` DISABLE KEYS */;
INSERT INTO `tienda_itemcarrito` VALUES (1,2,60,43),(2,5,36,79),(3,1,96,18),(4,4,54,67),(5,3,50,41),(6,3,37,31),(7,1,10,28),(8,1,62,80),(9,3,35,31),(10,1,47,89),(11,3,56,65),(12,4,93,90),(13,3,77,75),(14,5,98,55),(15,1,42,67),(16,4,25,10),(17,2,44,94),(18,3,100,91),(19,1,2,42),(20,5,4,100),(21,5,32,99),(22,3,3,13),(23,1,33,1),(24,1,33,42),(25,1,21,76),(26,1,52,12),(27,5,73,60),(28,1,24,75),(29,3,85,21),(30,1,68,2),(31,3,19,80),(32,3,67,12),(33,2,55,97),(34,2,22,40),(35,2,52,56),(36,2,49,75),(37,3,7,55),(38,4,99,35),(39,5,85,88),(40,1,74,7),(41,5,34,38),(42,1,19,34),(43,1,59,60),(44,4,21,45),(45,2,70,67),(46,4,15,3),(47,5,48,25),(48,2,29,3),(49,3,20,21),(50,4,55,46),(51,1,75,85),(52,4,55,66),(53,5,31,55),(54,5,41,61),(55,4,27,90),(56,3,66,28),(57,5,24,95),(58,4,17,83),(59,3,80,99),(60,4,77,21),(61,5,10,25),(62,3,99,10),(63,3,34,11),(64,3,24,66),(65,3,81,38),(66,1,13,30),(67,3,60,68),(68,2,87,59),(69,5,91,52),(70,4,76,21),(71,4,19,65),(72,5,42,5),(73,5,86,29),(74,5,34,17),(75,4,60,51),(76,1,30,20),(77,2,80,75),(78,1,42,9),(79,5,68,81),(80,1,55,77),(81,3,54,21),(82,5,41,83),(83,4,1,35),(84,1,44,9),(85,2,32,24),(86,2,55,97),(87,5,14,5),(88,5,92,14),(89,4,31,72),(90,4,7,40),(91,4,70,16),(92,4,6,16),(93,1,66,40),(94,2,89,40),(95,2,42,10),(96,4,87,67),(97,2,49,35),(98,3,30,69),(99,1,65,60),(100,2,36,70),(101,1,91,36),(102,1,18,74),(103,1,57,38),(104,1,65,80),(105,3,67,29),(106,2,42,73),(107,3,64,9),(108,2,43,51),(109,3,69,73),(110,2,62,43),(111,3,2,30),(112,5,35,40),(113,5,40,23),(114,1,1,24),(115,5,6,83),(116,3,37,90),(117,5,32,37),(118,4,38,18),(119,1,25,97),(120,4,55,45),(121,4,72,76),(122,5,78,5),(123,3,47,57),(124,4,36,56),(125,5,90,34),(126,3,92,65),(127,1,42,67),(128,3,40,74),(129,2,21,59),(130,3,84,22),(131,3,13,97),(132,2,32,27),(133,4,12,43),(134,5,57,51),(135,2,79,32),(136,4,30,73),(137,4,54,45),(138,2,82,17),(139,4,38,78),(140,2,39,71),(141,2,67,26),(142,2,67,47),(143,4,32,55),(144,2,28,3),(145,3,47,40),(146,1,67,61),(147,1,40,84),(148,2,57,80),(149,2,87,59),(150,3,89,44),(151,2,28,84),(152,1,19,93),(153,1,55,54),(154,4,62,93),(155,4,11,21),(156,2,85,17),(157,3,95,87),(158,4,93,10),(159,1,26,17),(160,3,85,100),(161,1,27,99),(162,2,69,6),(163,1,88,75),(164,1,25,97),(165,2,43,93),(166,4,100,93),(167,3,31,67),(168,3,13,37),(169,2,9,12),(170,4,20,4),(171,1,98,3),(172,2,87,79),(173,1,22,16),(174,1,3,84),(175,2,10,12),(176,1,11,68),(177,2,13,55),(178,1,11,47),(179,4,74,59),(180,5,96,56),(181,2,92,82),(182,1,24,18),(183,3,21,61),(184,2,20,76),(185,5,78,24),(186,3,67,68),(187,1,1,82),(188,5,81,88),(189,3,13,79),(190,4,41,37),(191,3,100,10),(192,3,29,88),(193,2,96,25),(194,1,2,4),(195,1,50,11),(196,1,90,35),(197,4,26,11),(198,5,47,5),(199,2,10,93),(200,2,93,60);
/*!40000 ALTER TABLE `tienda_itemcarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_orden`
--

DROP TABLE IF EXISTS `tienda_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_orden` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_orden_usuario_id_76c00406_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `tienda_orden_usuario_id_76c00406_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_orden`
--

LOCK TABLES `tienda_orden` WRITE;
/*!40000 ALTER TABLE `tienda_orden` DISABLE KEYS */;
INSERT INTO `tienda_orden` VALUES (1,5029.08,'2026-04-09 20:12:35.000000',34),(2,3564.09,'2026-04-25 20:12:35.000000',70),(3,4142.1,'2026-04-16 20:12:35.000000',79),(4,4937.3,'2026-04-12 20:12:35.000000',1),(5,2947.35,'2026-04-30 20:12:35.000000',21),(6,2280.81,'2026-04-09 20:12:35.000000',43),(7,2686.22,'2026-04-11 20:12:35.000000',26),(8,3115.52,'2026-05-02 20:12:35.000000',63),(9,1513.85,'2026-04-19 20:12:35.000000',95),(10,1789.07,'2026-04-17 20:12:35.000000',2),(11,2052.01,'2026-05-02 20:12:35.000000',28),(12,655.74,'2026-05-05 20:12:35.000000',51),(13,1854.75,'2026-05-05 20:12:35.000000',90),(14,475.23,'2026-04-18 20:12:35.000000',26),(15,2739.9,'2026-05-06 20:12:35.000000',88),(16,1161.1,'2026-04-15 20:12:35.000000',45),(17,3710.8,'2026-04-16 20:12:35.000000',98),(18,313.87,'2026-04-19 20:12:35.000000',22),(19,4718.42,'2026-04-23 20:12:35.000000',73),(20,3799,'2026-04-22 20:12:35.000000',41),(21,1322.42,'2026-04-12 20:12:35.000000',14),(22,3020.78,'2026-04-16 20:12:35.000000',42),(23,757.33,'2026-04-14 20:12:35.000000',64),(24,3825.29,'2026-04-21 20:12:35.000000',41),(25,375.05,'2026-04-27 20:12:35.000000',32),(26,1521.03,'2026-05-04 20:12:35.000000',46),(27,1356,'2026-04-13 20:12:35.000000',50),(28,2211.88,'2026-04-17 20:12:35.000000',16),(29,138.17,'2026-05-05 20:12:35.000000',100),(30,1132.78,'2026-04-30 20:12:35.000000',28),(31,1692.25,'2026-04-23 20:12:35.000000',39),(32,4594.54,'2026-04-14 20:12:35.000000',25),(33,1672.57,'2026-04-30 20:12:35.000000',13),(34,4553.09,'2026-05-02 20:12:35.000000',11),(35,3888.08,'2026-04-16 20:12:35.000000',4),(36,2912.68,'2026-04-23 20:12:35.000000',12),(37,2836.29,'2026-04-07 20:12:35.000000',59),(38,3060.76,'2026-05-06 20:12:35.000000',32),(39,3080.88,'2026-04-07 20:12:35.000000',34),(40,3630.07,'2026-05-02 20:12:35.000000',14),(41,2021.94,'2026-04-29 20:12:35.000000',56),(42,3543.56,'2026-05-01 20:12:35.000000',9),(43,3692.27,'2026-05-06 20:12:35.000000',86),(44,4505.67,'2026-04-24 20:12:35.000000',100),(45,562.19,'2026-05-05 20:12:35.000000',48),(46,3122.08,'2026-05-01 20:12:35.000000',95),(47,4387.26,'2026-05-05 20:12:35.000000',8),(48,1484.64,'2026-04-27 20:12:35.000000',69),(49,114.98,'2026-04-18 20:12:35.000000',80),(50,3913.43,'2026-04-24 20:12:35.000000',13),(51,4769.52,'2026-05-02 20:12:35.000000',85),(52,698.75,'2026-04-10 20:12:35.000000',91),(53,1922.77,'2026-04-11 20:12:35.000000',100),(54,4755.66,'2026-04-25 20:12:35.000000',9),(55,3337.95,'2026-04-14 20:12:35.000000',17),(56,3432.89,'2026-04-07 20:12:35.000000',79),(57,4306.97,'2026-04-27 20:12:35.000000',97),(58,1669.64,'2026-04-24 20:12:35.000000',6),(59,2082.62,'2026-04-19 20:12:35.000000',13),(60,1329.62,'2026-04-12 20:12:35.000000',81),(61,4938.9,'2026-05-06 20:12:35.000000',28),(62,4012.02,'2026-04-24 20:12:35.000000',17),(63,2411.03,'2026-05-04 20:12:35.000000',75),(64,4358.23,'2026-04-30 20:12:35.000000',2),(65,3360.67,'2026-04-09 20:12:35.000000',46),(66,981.36,'2026-05-02 20:12:35.000000',58),(67,2570.46,'2026-04-09 20:12:35.000000',19),(68,3940.11,'2026-04-21 20:12:35.000000',11),(69,606.27,'2026-04-22 20:12:35.000000',34),(70,1918.39,'2026-04-27 20:12:35.000000',17),(71,1901.95,'2026-04-24 20:12:35.000000',46),(72,159.14,'2026-04-10 20:12:35.000000',6),(73,1178.79,'2026-04-08 20:12:35.000000',38),(74,4806.51,'2026-04-30 20:12:35.000000',17),(75,2493.78,'2026-04-15 20:12:35.000000',23),(76,4526.33,'2026-04-13 20:12:35.000000',22),(77,4574.39,'2026-04-15 20:12:35.000000',25),(78,3540.29,'2026-04-21 20:12:35.000000',98),(79,4514.64,'2026-04-07 20:12:35.000000',49),(80,383.35,'2026-04-15 20:12:35.000000',20),(81,3572.85,'2026-04-25 20:12:35.000000',37),(82,277.82,'2026-04-17 20:12:35.000000',84),(83,558.27,'2026-04-12 20:12:35.000000',22),(84,1960.86,'2026-04-19 20:12:35.000000',76),(85,1595.57,'2026-05-05 20:12:35.000000',82),(86,4502.62,'2026-05-02 20:12:35.000000',42),(87,1929.36,'2026-04-27 20:12:35.000000',18),(88,2578.08,'2026-05-06 20:12:35.000000',49),(89,3953.77,'2026-05-01 20:12:35.000000',56),(90,1493.35,'2026-04-15 20:12:35.000000',57),(91,2515.96,'2026-04-29 20:12:35.000000',73),(92,756.19,'2026-04-26 20:12:35.000000',78),(93,2364.26,'2026-04-25 20:12:35.000000',30),(94,3523.83,'2026-04-15 20:12:35.000000',57),(95,2871.17,'2026-05-02 20:12:35.000000',55),(96,4350.43,'2026-05-04 20:12:35.000000',6),(97,312.77,'2026-04-17 20:12:35.000000',86),(98,2360.13,'2026-05-05 20:12:35.000000',8),(99,165.97,'2026-04-19 20:12:35.000000',83),(100,4353.99,'2026-04-22 20:12:35.000000',93),(101,2106.59,'2026-05-07 02:43:32.701495',101),(102,2678.7200000000003,'2026-05-07 02:43:48.196137',101),(103,1833.96,'2026-05-07 02:45:51.439818',101),(104,866.58,'2026-05-07 08:30:53.090064',101),(105,900.41,'2026-05-07 08:39:50.026694',101),(106,1607.77,'2026-05-07 08:49:15.197144',101),(107,919.12,'2026-05-07 18:54:06.192798',101),(108,2170.49,'2026-05-07 18:54:43.745683',101),(109,8783.64,'2026-05-07 19:05:11.778682',101),(110,3087.12,'2026-05-07 19:08:25.102035',101),(111,3082.38,'2026-05-07 19:12:43.696584',102),(112,1174.48,'2026-05-07 20:28:08.589223',101),(113,708.75,'2026-05-07 20:28:23.915031',101),(114,6603.65,'2026-05-07 20:48:55.183799',101),(115,2796.33,'2026-05-25 22:53:10.332777',101),(116,1970.09,'2026-05-25 23:16:28.602991',101),(117,1381.51,'2026-05-25 23:30:27.487359',101),(118,1365.74,'2026-05-26 05:17:37.716844',101),(119,1174.48,'2026-05-26 20:03:25.458601',101),(120,236.25,'2026-05-26 20:06:40.554780',101),(121,659.48,'2026-05-26 20:07:00.354176',101),(122,1167.54,'2026-05-26 20:07:14.163336',101),(123,7087.5,'2026-05-26 20:24:53.683988',101);
/*!40000 ALTER TABLE `tienda_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda_producto`
--

DROP TABLE IF EXISTS `tienda_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` longtext NOT NULL,
  `stock` int NOT NULL,
  `categoria_id` bigint NOT NULL,
  `cluster` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_producto_categoria_id_6dc179b4_fk_tienda_categoria_id` (`categoria_id`),
  CONSTRAINT `tienda_producto_categoria_id_6dc179b4_fk_tienda_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `tienda_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda_producto`
--

LOCK TABLES `tienda_producto` WRITE;
/*!40000 ALTER TABLE `tienda_producto` DISABLE KEYS */;
INSERT INTO `tienda_producto` VALUES (1,'Pegamento para Tubo - C34E',236.25,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',0,3,3),(2,'Casco de Seguridad - C34F',1174.48,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',10,7,4),(3,'Espátula de Acero - C34F',659.48,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',32,4,3),(4,'Codo de Cobre - C350',2019.24,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',10,3,1),(5,'Pegamento Instantáneo - C350',131.32,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',50,8,2),(6,'Casco de Seguridad - C350',433.29,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,7,2),(7,'Pegamento para Tubo - C351',932.11,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',13,3,3),(8,'Clavos de 2\" - C351',1568.66,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',6,8,0),(9,'Sierra Circular - C351',1497.63,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',37,1,1),(10,'Espátula de Acero - C351',1575.01,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',3,4,1),(11,'Taladro Percutor - C352',1869.29,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',42,1,1),(12,'Bulto de Cemento - C352',540.19,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',4,4,3),(13,'Brocha 3\" - C353',822.08,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',36,6,4),(14,'Pegamento para Tubo - C353',1167.54,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,3,1),(15,'Pegamento para Tubo - C353',826.89,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',50,3,3),(16,'Casco de Seguridad - C353',2001.33,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',32,7,0),(17,'Cable Calibre 12 - C354',429.01,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',23,2,3),(18,'Rodillo de Felpa - C354',1992.09,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',9,6,0),(19,'Candado de Acero - C354',1487.04,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',31,8,0),(20,'Bisagra de Libro - C355',1644.31,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',44,8,0),(21,'Candado de Acero - C355',499.8,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',23,8,2),(22,'Manguera 15m - C355',1192.35,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',26,5,4),(23,'Extintor 2kg - C356',1443.42,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,7,0),(24,'Charola para Pintura - C356',1463.44,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',30,6,0),(25,'Guantes de Nitrilo - C356',1992.01,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',1,7,0),(26,'Socket Cerámico - C357',1672.49,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',22,2,1),(27,'Rodillo de Felpa - C357',1259.56,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',48,6,4),(28,'Bisagra de Libro - C357',1506.14,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,8,0),(29,'Thinner 1L - C358',1532.7,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',21,6,0),(30,'Extintor 2kg - C358',669.34,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',18,7,2),(31,'Arnés de Cuerpo - C358',384.32,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',6,7,2),(32,'Martillo Galpón - C358',554.04,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',48,1,3),(33,'Clavos de 2\" - C359',1856.89,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',33,8,0),(34,'Abono Orgánico - C359',986.17,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',43,5,4),(35,'Extintor 2kg - C359',797.7,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',24,7,4),(36,'Socket Cerámico - C35A',682.87,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',6,2,3),(37,'Lentes Protectores - C35A',560.88,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',35,7,2),(38,'Pintura Blanca 19L - C35A',2018.75,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',34,6,0),(39,'Nivel de Mano - C35B',1948.64,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',32,4,1),(40,'Pegamento para Tubo - C35B',1814.04,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',10,3,1),(41,'Rodillo de Felpa - C35B',1327,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',7,6,4),(42,'Brocha 3\" - C35C',1175.06,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',21,6,4),(43,'Bulto de Cemento - C35C',508.89,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',6,4,3),(44,'Caja de Tornillos - C35C',320.08,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',9,8,2),(45,'Cinta Métrica 5m - C35C',1516.42,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',44,4,1),(46,'Multímetro Digital - C35D',1155.02,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',7,2,1),(47,'Llave Inglesa 10\" - C35D',293.53,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',37,1,3),(48,'Tubo PVC 1/2\" - C35D',75.53,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,3,3),(49,'Guantes de Nitrilo - C35D',1080.32,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',20,7,4),(50,'Bulto de Cemento - C35E',1381.51,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',1,4,1),(51,'Socket Cerámico - C35E',1301.27,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',31,2,1),(52,'Cable Calibre 12 - C35E',1384.12,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',12,2,1),(53,'Sierra Circular - C35F',299.46,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',48,1,3),(54,'Regadera Metálica - C35F',1549.7,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',43,3,1),(55,'Pegamento Instantáneo - C35F',242.09,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',12,8,2),(56,'Bisagra de Libro - C35F',462.54,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',35,8,2),(57,'Casco de Seguridad - C360',1990.5,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',29,7,0),(58,'Clavos de 2\" - C360',225.35,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',25,8,2),(59,'Cinta Aislante - C360',1015.47,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',26,2,3),(60,'Cable Calibre 12 - C361',1001.55,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',42,2,3),(61,'Brocha 3\" - C361',229.09,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',17,6,2),(62,'Regadera Metálica - C361',401.47,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',16,3,3),(63,'Taladro Percutor - C361',99.38,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',23,1,3),(64,'Interruptor Pared - C362',519.35,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',26,2,3),(65,'Lentes Protectores - C362',1035.57,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',35,7,4),(66,'Bisagra de Libro - C362',82.24,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',37,8,2),(67,'Rastrillo Jardín - C363',1278.37,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',5,5,4),(68,'Rastrillo Jardín - C363',767.85,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',48,5,4),(69,'Pintura Blanca 19L - C363',776.04,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',21,6,4),(70,'Pegamento Instantáneo - C363',934.51,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',44,8,4),(71,'Destornillador Pro - C364',629.2,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',3,1,3),(72,'Pegamento para Tubo - C364',1071.66,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',19,3,1),(73,'Codo de Cobre - C364',1563.12,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',7,3,1),(74,'Codo de Cobre - C364',294.82,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',15,3,3),(75,'Taladro Percutor - C365',1461.09,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',22,1,1),(76,'Sierra Circular - C365',222.28,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',47,1,3),(77,'Espátula de Acero - C365',844.5,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',49,4,3),(78,'Pintura Blanca 19L - C366',608.06,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',1,6,2),(79,'Cable Calibre 12 - C366',1109.06,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',28,2,1),(80,'Cable Calibre 12 - C366',104.37,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',43,2,3),(81,'Interruptor Pared - C366',916.63,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',48,2,3),(82,'Cinta Métrica 5m - C367',900.41,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',20,4,3),(83,'Brocha 3\" - C367',1543.18,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',15,6,0),(84,'Multímetro Digital - C368',1327.9,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',20,2,1),(85,'Martillo Galpón - C368',1423.43,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',45,1,1),(86,'Tubo PVC 1/2\" - C368',1627.39,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',21,3,1),(87,'Brocha 3\" - C369',1845.87,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',46,6,0),(88,'Bisagra de Libro - C369',266.29,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',13,8,2),(89,'Clavos de 2\" - C369',770.43,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',18,8,2),(90,'Brocha 3\" - C369',1638.05,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',28,6,0),(91,'Espátula de Acero - C36A',395.08,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',3,4,3),(92,'Arnés de Cuerpo - C36A',1780.82,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',38,7,0),(93,'Interruptor Pared - C36A',1770,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',47,2,1),(94,'Llave Inglesa 10\" - C36A',1814.36,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',27,1,1),(95,'Candado de Acero - C36B',1905.13,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',25,8,0),(96,'Charola para Pintura - C36B',1446.97,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',32,6,0),(97,'Destornillador Pro - C36B',944.47,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',31,1,3),(98,'Pintura Blanca 19L - C36C',1700.36,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',21,6,0),(99,'Rastrillo Jardín - C36C',1672.01,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',46,5,0),(100,'Llave Inglesa 10\" - C36C',720.64,'Herramienta de alta calidad diseñada para uso profesional y durabilidad garantizada.',27,1,3);
/*!40000 ALTER TABLE `tienda_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03 21:44:31
