-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: jadca1
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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `price` double unsigned NOT NULL,
  `quantity` int NOT NULL,
  `publication_date` date NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `genre_id` tinyint unsigned NOT NULL,
  `rating` double NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'No details available',
  `pic` varchar(255) DEFAULT 'No picture available',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  KEY `fk_genre_id_idx` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby','Florence Romaguera',30,10,'2008-07-04','9781234567890',1,4.5,'Description 1','No picture available'),(2,'To Kill a Mockingbird','Joanne Ferry I',20,5,'2022-02-01','9780987654321',1,3.8,'Description 2','No picture available'),(3,'1984','Berenice Bartell',25,8,'2022-03-01','9785678901234',1,4.2,'Description 3','No picture available'),(4,'Pride and Prejudice','Bella Conn',15,12,'2022-04-01','9785432109876',1,4.8,'Description 4','No picture available'),(5,'Guns and Blade','Monique NOTNicolas',40,3,'2022-05-01','9780123456789',1,3.5,'Description 5','No picture available');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 16:43:23
