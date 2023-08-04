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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT 'default_profile_pic.png',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_id_UNIQUE` (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `chk_role` CHECK ((`role` in (_utf8mb4'user',_utf8mb4'admin')))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Will only accept either "admin", or "user" explicitly.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SkyeRyan.21@gmail.com','Skye123','admin','20221202_214226.jpg','asd','asd','asd','aaaaaaa'),(2,'JamesEvans@gmail.com','James123','admin','default_profile_pic.png',NULL,NULL,NULL,NULL),(3,'CustomerTest@example.com','Customer123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(4,'testing123','abc123','admin','default_profile_pic.png',NULL,NULL,NULL,NULL),(5,'oogabooga@gmail.com','urmom','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(8,'a@a','test123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(9,'a2@a','test123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(10,'a@e','tester123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(11,'e@e','testmouse','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(12,'r@r','test123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(14,'P@p','ppp123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(15,'l@l','lll123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(16,'k@kkk','kek123','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(18,'u1@gmail.com','p1','user','default_profile_pic.png',NULL,NULL,NULL,NULL),(20,'at@at.com','at123','user','default_profile_pic.png',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2023-08-04 14:05:52
