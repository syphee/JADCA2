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
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id_UNIQUE` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Non-fiction'),(2,'Mystery'),(3,'Thriller'),(4,'Romance'),(5,'Science fiction'),(6,'Fantasy'),(7,'Horror'),(8,'Historical fiction'),(9,'Biography'),(10,'Autobiography'),(11,'Memoir'),(12,'Poetry'),(13,'Drama'),(14,'Action and adventure'),(15,'Comedy'),(16,'Satire'),(17,'Young adult'),(18,'Children\'s literature'),(19,'Picture books'),(20,'Graphic novels'),(21,'Crime'),(22,'Suspense'),(23,'Western'),(24,'Dystopian'),(25,'Paranormal'),(26,'Urban fantasy'),(27,'Magical realism'),(28,'Historical non-fiction'),(29,'Self-help'),(30,'Travel'),(31,'Science'),(32,'Philosophy'),(33,'Religion and spirituality'),(34,'Art and photography'),(35,'Cookbooks'),(36,'Business and finance'),(37,'Psychology'),(38,'Sociology'),(39,'Anthropology'),(40,'Political science'),(41,'Environmental and nature'),(42,'Health and wellness'),(43,'Parenting and family'),(44,'Education'),(45,'Sports and fitness'),(46,'Technology and computing'),(47,'Reference books'),(48,'True crime'),(49,'Inspirational'),(50,'African American Fiction'),(51,'Antiques'),(52,'Art'),(53,'Biography & Autobiography'),(54,'Business'),(55,'Careers'),(56,'Chick Lit Fiction'),(57,'Classic Literature'),(58,'Comic and Graphic Books'),(59,'Computer Technology'),(60,'Cooking & Food'),(61,'Crafts'),(62,'Crime'),(63,'Drama'),(64,'Economics'),(65,'Entertainment'),(66,'Essays'),(67,'Ethics'),(68,'Family & Relationships'),(69,'Finance'),(70,'Folklore'),(71,'Foreign Language'),(72,'Games'),(73,'Gender Studies'),(74,'Health & Fitness'),(75,'Historical Fiction'),(76,'History'),(77,'Humor (Fiction)'),(78,'Humor (Nonfiction)'),(79,'Juvenile Fiction'),(80,'Juvenile Literature'),(81,'Juvenile Nonfiction'),(82,'Language Arts'),(83,'Literary Anthologies'),(84,'Literary Criticism'),(85,'Literature'),(86,'Management'),(87,'Mathematics'),(88,'Media Studies'),(89,'Medical'),(90,'Military'),(91,'Multi-Cultural'),(92,'Music'),(93,'Mythology'),(94,'Nature'),(95,'New Age'),(96,'Non-English Fiction'),(97,'Non-English Nonfiction'),(98,'Outdoor Recreation'),(99,'Performing Arts'),(100,'Pets'),(101,'Philosophy'),(102,'Photography'),(103,'Poetry'),(104,'Politics'),(105,'Psychiatry & Psychology'),(106,'Psychology'),(107,'Reference'),(108,'Romance'),(109,'Science'),(110,'Science Fiction'),(111,'Science Fiction & Fantasy'),(112,'Self Help'),(113,'Self-Improvement'),(114,'Short Stories'),(115,'Sociology'),(116,'Sports & Recreation'),(117,'Study Aids & Workbooks'),(118,'Suspense'),(119,'Technology'),(120,'Thriller'),(121,'Travel'),(122,'Travel Literature'),(123,'True Crime'),(124,'Urban Fiction'),(125,'Western'),(126,'Women\'s Studies'),(127,'Young Adult Fiction'),(128,'Young Adult Literature'),(129,'Young Adult Nonfiction'),(130,'Nonfiction'),(131,'African American Nonfiction'),(132,'Analysis'),(133,'Antiquarian'),(134,'Antiques & Collectibles'),(135,'Architecture'),(136,'Biology'),(137,'Chemistry'),(138,'Child Development'),(139,'Children'),(140,'Comedy'),(141,'Criticism'),(142,'Current Events'),(143,'Education'),(144,'Engineering'),(145,'Environment'),(146,'Genealogy'),(147,'Geography'),(148,'Grammar & Language Usage'),(149,'Home Design & Décor'),(150,'Human Rights'),(151,'Journalism'),(152,'Law'),(153,'Marketing & Sales'),(154,'Media Studies'),(155,'Military'),(156,'Music-Sheet'),(157,'Nature'),(158,'Nursing'),(159,'Philosophy'),(160,'Physics'),(161,'Picture Book Nonfiction'),(162,'Political Science'),(163,'Psychiatry'),(164,'Recovery'),(165,'Report'),(166,'Research'),(167,'Sales & Marketing'),(168,'Scholarly'),(169,'Social Media'),(170,'Social Studies'),(171,'Songbook'),(172,'Sports'),(173,'Story Book Nonfiction'),(174,'Text Book'),(175,'Transportation'),(176,'Women\'s');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
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
