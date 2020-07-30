CREATE DATABASE  IF NOT EXISTS `comoencasa` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `comoencasa`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: comoencasa
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `cartNumber` int(10) unsigned NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (28,16,1,800,NULL,'2020-07-21 19:04:28','2020-07-21 19:04:28');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `idCart` int(10) unsigned DEFAULT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `idProduct` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idSeller` (`idSeller`),
  KEY `idCart` (`idCart`),
  KEY `idUser` (`idUser`),
  KEY `cartitem_ibfk_1` (`idProduct`),
  CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`),
  CONSTRAINT `cartItem_ibfk_3` FOREIGN KEY (`idCart`) REFERENCES `cart` (`id`),
  CONSTRAINT `cartItem_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5073 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (5065,16,125,1,1,125,28,4,'2020-07-20 21:44:07','2020-07-20 19:17:48','2020-07-21 19:04:28',50,'Ensalada'),(5066,16,500,1,1,500,28,4,'2020-07-20 21:44:08','2020-07-20 19:17:56','2020-07-21 19:04:28',54,'Chipa'),(5067,16,120,1,1,120,28,4,'2020-07-20 21:44:10','2020-07-20 19:41:05','2020-07-21 19:04:28',62,'Tostados '),(5068,16,300,1,1,300,28,4,'2020-07-20 21:44:11','2020-07-20 19:58:37','2020-07-21 19:04:28',52,'Hamburguesas caseras'),(5069,16,250,1,1,250,28,4,'2020-07-20 21:49:32','2020-07-20 21:46:32','2020-07-21 19:04:28',51,'Tarta de pollo'),(5070,16,500,1,1,500,28,4,'2020-07-21 19:04:33','2020-07-21 19:04:01','2020-07-21 19:04:33',54,'Chipa'),(5071,16,300,1,1,300,28,4,NULL,'2020-07-21 19:04:16','2020-07-21 19:04:28',52,'Hamburguesas caseras'),(5072,16,125,1,0,125,NULL,4,'2020-07-23 21:31:26','2020-07-23 02:51:24','2020-07-23 21:31:26',50,'Ensalada');
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Desayuno',NULL,'2020-06-25 23:25:04',NULL),(2,'Almuerzo',NULL,'2020-06-25 23:28:07',NULL),(3,'Merienda',NULL,'2020-06-25 23:28:22',NULL),(4,'Cena',NULL,'2020-06-25 23:28:22',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idSeller` (`idSeller`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,16,4,NULL,'2020-07-23 19:48:11','2020-07-23 19:48:11');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcart`
--

DROP TABLE IF EXISTS `productcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcart` (
  `id` int(10) unsigned NOT NULL,
  `idProduct` int(10) unsigned NOT NULL,
  `idCartItem` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProduct` (`idProduct`),
  KEY `idCartItem` (`idCartItem`),
  CONSTRAINT `productcart_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`),
  CONSTRAINT `productcart_ibfk_2` FOREIGN KEY (`idCartItem`) REFERENCES `cartitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcart`
--

LOCK TABLES `productcart` WRITE;
/*!40000 ALTER TABLE `productcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,0) NOT NULL,
  `img` varchar(255) NOT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `idCategory` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idCategory` (`idCategory`),
  KEY `idUser` (`idSeller`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (50,'Ensalada','Lechugas frescas del himalaya con tomates en conserva ',125,'undefined-1594413377673.jpg',4,2,'2020-07-23 21:34:24','2020-06-28 18:55:36','2020-07-23 21:34:24'),(51,'Tarta de pollo','Tarta hojaldrada de pollo condimentado con chorizo colorado y azafrán',250,'undefined-1594345965798.png',4,4,'2020-07-23 21:34:27','2020-06-28 21:36:00','2020-07-23 21:34:27'),(52,'Hamburguesas caseras','Hamburguesa de rost beef de 150g con queso chedar, panceta, cebolla morada, salsa mil islas y pepinos frescos',300,'undefined-1594413419572.jpeg',4,2,'2020-07-23 21:34:32','2020-06-28 21:37:40','2020-07-23 21:34:32'),(53,'Torta de Chocolate','Torta de mouse de chocolate',1000,'undefined-1594413440107.jpg',4,3,'2020-07-23 21:34:36','2020-06-28 21:39:07','2020-07-23 21:34:36'),(54,'Chipa','Chipas correntinos con mucho queso',500,'undefined-1594413465270.jpg',4,1,'2020-07-23 21:34:40','2020-06-28 21:41:12','2020-07-23 21:34:40'),(62,'Tostados ','Tostado de Jamon y queso con pan artesano',120,'undefined-1594413483345.jpg',4,1,'2020-07-23 21:34:43','2020-07-10 01:58:35','2020-07-23 21:34:43'),(63,'Budín de banana','Budin de 300g',250,'undefined-1594348643605.jpg',4,3,'2020-07-23 21:34:46','2020-07-10 02:37:23','2020-07-23 21:34:46'),(65,'Cangreburger','Rica',100000,'undefined-1595118316966.jpeg',1,4,'2020-07-23 22:45:53','2020-07-19 00:25:17','2020-07-23 22:45:53'),(66,'Risotto funghi','Con piñones y ciboullette',600,'undefined-1595532359007.jpg',16,4,NULL,'2020-07-23 19:25:59','2020-07-23 20:06:10'),(67,'Bruschetta de Salmon ','Ahumado con queso crema, alcaparras y perejil',345,'undefined-1595533021016.jpg',16,2,NULL,'2020-07-23 19:37:01','2020-07-23 19:37:01'),(68,'Tagliattelle al funghi\'','Caseros con champignones y perejil',850,'undefined-1595534319127.jpg',16,4,NULL,'2020-07-23 19:58:39','2020-07-23 19:58:39'),(69,'Tostada agridulce','Cerdo grillado, batata al horno y miel.',348,'undefined-1595534558503.jpg',16,3,NULL,'2020-07-23 20:02:38','2020-07-23 22:45:12'),(70,'Bowl mediterraneo','Frutillas, banana, flores silvestres, arándanos y yogourt',122,'undefined-1595534987936.jpg',16,3,NULL,'2020-07-23 20:09:47','2020-07-23 20:09:47'),(71,'Tarteletas de arándanos','Caseras y sanas.',250,'undefined-1595535158060.jpg',16,1,NULL,'2020-07-23 20:12:38','2020-07-23 20:12:38'),(72,'Waffle','Bananas, nueces, moras.',123,'undefined-1595542989757.jpg',4,1,NULL,'2020-07-23 22:23:09','2020-07-23 22:23:09'),(73,'Tacos','Palta, choclo, queso crema.',120,'undefined-1595543070044.jpg',4,2,NULL,'2020-07-23 22:24:30','2020-07-23 22:24:30'),(74,'Cookies','Con chocolate.',150,'undefined-1595543239286.jpg',4,3,NULL,'2020-07-23 22:27:19','2020-07-23 22:27:19'),(75,'Avocado toast','Saludables',200,'undefined-1595543387063.jpg',4,1,NULL,'2020-07-23 22:29:47','2020-07-23 22:29:47'),(76,'Camarones','',600,'undefined-1595544099838.jpg',4,4,NULL,'2020-07-23 22:41:39','2020-07-23 22:41:39'),(77,'Ensalada ','Albahaca, frutillas, moras y palta.',123,'undefined-1595544212985.jpg',4,2,NULL,'2020-07-23 22:43:33','2020-07-23 22:43:33');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart` (
  `id` int(10) unsigned NOT NULL,
  `idUser` int(10) unsigned NOT NULL,
  `idCartItem` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idCartItem` (`idCartItem`),
  CONSTRAINT `usercart_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `usercart_ibfk_2` FOREIGN KEY (`idCartItem`) REFERENCES `cartitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` tinyint(4) DEFAULT '0',
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `img` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jere@gmail.com','$2a$10$GUKtoj6a8YpuYAD6k5ba5uM3r6pTRIw0zAJs.BuV0FCZ7BF6DIts.',0,NULL,'2020-06-24 00:59:06','2020-06-24 00:59:06','Jeremias',''),(2,'lmarelli17@gmail.com','$2a$10$RqfKPq9GC4Untf37LFgPRuUg114WZL07njQjht0MQETzbkPrcySDK',0,NULL,'2020-06-24 17:40:15','2020-06-24 17:40:15','Leandro',''),(4,'lma@gmail.com','$2a$10$1JJ72i.ybyjuo6fgcW2eE.iorfeU8akDgXkIUxSylRA2CMFFdc2sm',0,NULL,'2020-06-25 02:58:29','2020-06-25 02:58:29','Leandro',''),(16,'clarabenadiba@gmail.com','$2a$10$MQNfahpUpVMqFSjEHXxTde8ioEsyyUZfUwpHGbVh5/tBE5.Bo.HSC',0,NULL,'2020-07-20 19:16:09','2020-07-23 19:47:02','Clara',NULL);
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

-- Dump completed on 2020-07-23 20:00:43
