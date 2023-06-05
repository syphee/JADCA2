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
  `genre` varchar(45) NOT NULL,
  `rating` double NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'No details available',
  `pic` varchar(255) DEFAULT 'No picture available',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  CONSTRAINT `genreCheck` CHECK (((`genre` like _utf8mb4'Non-fiction') or (`genre` like _utf8mb4'Mystery') or (`genre` like _utf8mb4'Thriller') or (`genre` like _utf8mb4'Romance') or (`genre` like _utf8mb4'Science fiction') or (`genre` like _utf8mb4'Fantasy') or (`genre` like _utf8mb4'Horror') or (`genre` like _utf8mb4'Historical fiction') or (`genre` like _utf8mb4'Biography') or (`genre` like _utf8mb4'Autobiography') or (`genre` like _utf8mb4'Memoir') or (`genre` like _utf8mb4'Poetry') or (`genre` like _utf8mb4'Drama') or (`genre` like _utf8mb4'Action and adventure') or (`genre` like _utf8mb4'Comedy') or (`genre` like _utf8mb4'Satire') or (`genre` like _utf8mb4'Young adult') or (`genre` like _utf8mb4'Children\'s literature') or (`genre` like _utf8mb4'Picture books') or (`genre` like _utf8mb4'Graphic novels') or (`genre` like _utf8mb4'Crime') or (`genre` like _utf8mb4'Suspense') or (`genre` like _utf8mb4'Western') or (`genre` like _utf8mb4'Dystopian') or (`genre` like _utf8mb4'Paranormal') or (`genre` like _utf8mb4'Urban fantasy') or (`genre` like _utf8mb4'Magical realism') or (`genre` like _utf8mb4'Historical non-fiction') or (`genre` like _utf8mb4'Self-help') or (`genre` like _utf8mb4'Travel') or (`genre` like _utf8mb4'Science') or (`genre` like _utf8mb4'Philosophy') or (`genre` like _utf8mb4'Religion and spirituality') or (`genre` like _utf8mb4'Art and photography') or (`genre` like _utf8mb4'Cookbooks') or (`genre` like _utf8mb4'Business and finance') or (`genre` like _utf8mb4'Psychology') or (`genre` like _utf8mb4'Sociology') or (`genre` like _utf8mb4'Anthropology') or (`genre` like _utf8mb4'Political science') or (`genre` like _utf8mb4'Environmental and nature') or (`genre` like _utf8mb4'Health and wellness') or (`genre` like _utf8mb4'Parenting and family') or (`genre` like _utf8mb4'Education') or (`genre` like _utf8mb4'Sports and fitness') or (`genre` like _utf8mb4'Technology and computing') or (`genre` like _utf8mb4'Reference books') or (`genre` like _utf8mb4'True crime') or (`genre` like _utf8mb4'Inspirational') or (`genre` like _utf8mb4'Fiction') or (`genre` like _utf8mb4'African American Fiction') or (`genre` like _utf8mb4'Antiques') or (`genre` like _utf8mb4'Art') or (`genre` like _utf8mb4'Biography & Autobiography') or (`genre` like _utf8mb4'Business') or (`genre` like _utf8mb4'Careers') or (`genre` like _utf8mb4'Chick Lit Fiction') or (`genre` like _utf8mb4'Classic Literature') or (`genre` like _utf8mb4'Comic and Graphic Books') or (`genre` like _utf8mb4'Computer Technology') or (`genre` like _utf8mb4'Cooking & Food') or (`genre` like _utf8mb4'Crafts') or (`genre` like _utf8mb4'Crime') or (`genre` like _utf8mb4'Drama') or (`genre` like _utf8mb4'Economics') or (`genre` like _utf8mb4'Entertainment') or (`genre` like _utf8mb4'Essays') or (`genre` like _utf8mb4'Ethics') or (`genre` like _utf8mb4'Family & Relationships') or (`genre` like _utf8mb4'Fantasy') or (`genre` like _utf8mb4'Finance') or (`genre` like _utf8mb4'Folklore') or (`genre` like _utf8mb4'Foreign Language') or (`genre` like _utf8mb4'Games') or (`genre` like _utf8mb4'Gender Studies') or (`genre` like _utf8mb4'Health & Fitness') or (`genre` like _utf8mb4'Historical Fiction') or (`genre` like _utf8mb4'History') or (`genre` like _utf8mb4'Horror') or (`genre` like _utf8mb4'Humor (Fiction)') or (`genre` like _utf8mb4'Humor (Nonfiction)') or (`genre` like _utf8mb4'Juvenile Fiction') or (`genre` like _utf8mb4'Juvenile Literature') or (`genre` like _utf8mb4'Juvenile Nonfiction') or (`genre` like _utf8mb4'Language Arts') or (`genre` like _utf8mb4'Literary Anthologies') or (`genre` like _utf8mb4'Literary Criticism') or (`genre` like _utf8mb4'Literature') or (`genre` like _utf8mb4'Management') or (`genre` like _utf8mb4'Mathematics') or (`genre` like _utf8mb4'Media Studies') or (`genre` like _utf8mb4'Medical') or (`genre` like _utf8mb4'Military') or (`genre` like _utf8mb4'Multi-Cultural') or (`genre` like _utf8mb4'Music') or (`genre` like _utf8mb4'Mystery') or (`genre` like _utf8mb4'Mythology') or (`genre` like _utf8mb4'Nature') or (`genre` like _utf8mb4'New Age') or (`genre` like _utf8mb4'Non-English Fiction') or (`genre` like _utf8mb4'Non-English Nonfiction') or (`genre` like _utf8mb4'Outdoor Recreation') or (`genre` like _utf8mb4'Performing Arts') or (`genre` like _utf8mb4'Pets') or (`genre` like _utf8mb4'Philosophy') or (`genre` like _utf8mb4'Photography') or (`genre` like _utf8mb4'Poetry') or (`genre` like _utf8mb4'Politics') or (`genre` like _utf8mb4'Psychiatry & Psychology') or (`genre` like _utf8mb4'Psychology') or (`genre` like _utf8mb4'Reference') or (`genre` like _utf8mb4'Romance') or (`genre` like _utf8mb4'Science') or (`genre` like _utf8mb4'Science Fiction') or (`genre` like _utf8mb4'Science Fiction & Fantasy') or (`genre` like _utf8mb4'Self Help') or (`genre` like _utf8mb4'Self-Improvement') or (`genre` like _utf8mb4'Short Stories') or (`genre` like _utf8mb4'Sociology') or (`genre` like _utf8mb4'Sports & Recreation') or (`genre` like _utf8mb4'Study Aids & Workbooks') or (`genre` like _utf8mb4'Suspense') or (`genre` like _utf8mb4'Technology') or (`genre` like _utf8mb4'Thriller') or (`genre` like _utf8mb4'Travel') or (`genre` like _utf8mb4'Travel Literature') or (`genre` like _utf8mb4'True Crime') or (`genre` like _utf8mb4'Urban Fiction') or (`genre` like _utf8mb4'Western') or (`genre` like _utf8mb4'Women\'s Studies') or (`genre` like _utf8mb4'Young Adult Fiction') or (`genre` like _utf8mb4'Young Adult Literature') or (`genre` like _utf8mb4'Young Adult Nonfiction') or (`genre` like _utf8mb4'Nonfiction') or (`genre` like _utf8mb4'African American Nonfiction') or (`genre` like _utf8mb4'Analysis') or (`genre` like _utf8mb4'Antiquarian') or (`genre` like _utf8mb4'Antiques & Collectibles') or (`genre` like _utf8mb4'Architecture') or (`genre` like _utf8mb4'Biology') or (`genre` like _utf8mb4'Chemistry') or (`genre` like _utf8mb4'Child Development') or (`genre` like _utf8mb4'Children') or (`genre` like _utf8mb4'Comedy') or (`genre` like _utf8mb4'Criticism') or (`genre` like _utf8mb4'Current Events') or (`genre` like _utf8mb4'Education') or (`genre` like _utf8mb4'Engineering') or (`genre` like _utf8mb4'Environment') or (`genre` like _utf8mb4'Genealogy') or (`genre` like _utf8mb4'Geography') or (`genre` like _utf8mb4'Grammar & Language Usage') or (`genre` like _utf8mb4'Home Design & Décor') or (`genre` like _utf8mb4'Human Rights') or (`genre` like _utf8mb4'Journalism') or (`genre` like _utf8mb4'Law') or (`genre` like _utf8mb4'Marketing & Sales') or (`genre` like _utf8mb4'Media Studies') or (`genre` like _utf8mb4'Military') or (`genre` like _utf8mb4'Music-Sheet') or (`genre` like _utf8mb4'Nature') or (`genre` like _utf8mb4'Nursing') or (`genre` like _utf8mb4'Philosophy') or (`genre` like _utf8mb4'Physics') or (`genre` like _utf8mb4'Picture Book Nonfiction') or (`genre` like _utf8mb4'Political Science') or (`genre` like _utf8mb4'Psychiatry') or (`genre` like _utf8mb4'Recovery') or (`genre` like _utf8mb4'Report') or (`genre` like _utf8mb4'Research') or (`genre` like _utf8mb4'Sales & Marketing') or (`genre` like _utf8mb4'Scholarly') or (`genre` like _utf8mb4'Social Media') or (`genre` like _utf8mb4'Social Studies') or (`genre` like _utf8mb4'Songbook') or (`genre` like _utf8mb4'Sports') or (`genre` like _utf8mb4'Story Book Nonfiction') or (`genre` like _utf8mb4'Text Book') or (`genre` like _utf8mb4'Transportation') or (`genre` like _utf8mb4'Women\'s')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby','Florence Romaguera',30,10,'2008-07-04','9781234567890','Fiction',4.5,'Description 1','No picture available'),(2,'To Kill a Mockingbird','Joanne Ferry I',20,5,'2022-02-01','9780987654321','Mystery',3.8,'Description 2','No picture available'),(3,'1984','Berenice Bartell',25,8,'2022-03-01','9785678901234','Fantasy',4.2,'Description 3','No picture available'),(4,'Pride and Prejudice','Bella Conn',15,12,'2022-04-01','9785432109876','Science Fiction',4.8,'Description 4','No picture available'),(5,'Guns and Blade','Monique NOTNicolas',40,3,'2022-05-01','9780123456789','Thriller',3.5,'Description 5','No picture available');
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

-- Dump completed on 2023-06-05 22:55:09
