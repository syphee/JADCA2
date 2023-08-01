CREATE DATABASE  IF NOT EXISTS `jadca1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jadca1`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: jadca1
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby','Florence Romaguera',30,10,'2008-07-04','9781234567890',1,4.5,'Description 1','default_cover.png'),(2,'To Kill a Mockingbird','Joanne Ferry I',20,5,'2022-02-01','9780987654321',3,3.8,'Description 2','default_cover.png'),(3,'1984','Berenice Bartell',25,8,'2022-03-01','9785678901234',3,4.2,'Description 3','default_cover.png'),(4,'Pride and Prejudice','Bella Conn',15,12,'2022-04-01','9785432109876',1,4.8,'Description 4','default_cover.png'),(5,'Guns and Blade','Monique NOTNicolas',40,3,'2022-05-01','9780123456789',3,3.5,'Description 5','default_cover.png'),(6,'light fury','yejiii',13,1,'2023-06-08','1231231231231',10,0,'yes','0ce30986c02dd3c35b31cf1d50aa1c6a.png'),(7,'light furry','yejii',13,1,'2023-06-08','1231231231232',15,0,'poo','6c8a88cfcd299f25598e1329be664168.png'),(8,'The Secret Garden','Frances Hodgson',15,10,'2005-09-20','9785734902348',1,4.2,'A timeless classic about a young girl who discovers a hidden magical garden','default_cover.png'),(9,'I Love you','Matthew bittens',22,4,'2007-03-20','9785452342344',2,4.7,'A story about a boy trying to find true love','default_cover.png'),(10,'500 days of summer','Marc Webb',19,2,'2009-10-08','9784346433333',2,4.4,'Tom revisits the approximate one year he shared with a girl named summer','default_cover.png'),(11,'Bladerunner 2049','Ridley Scott',22,5,'1982-06-25','9783473453590',3,4.9,'Officer K a blade runner unearths a long-burried secret that has the potential to plunge society to chaos','default_cover.png'),(12,'How to train your dragon','Cressida Cowell',24,9,'2010-12-01','9783434582422',1,4.2,'A young viking befriends a dragon and tries to prove that both species can live to coexist','default_cover.png'),(69,'The Hidden Treasure','John Smith',10,5,'2022-01-01','9781234567124',92,4.5,'A thrilling adventure to uncover a long-lost treasure.','default_cover.png'),(70,'Whispers in the Wind','Emily Johnson',15,3,'2022-02-01','9782345678901',125,4,'A tale of mystery and romance set in a picturesque countryside.','default_cover.png'),(71,'Beyond the Stars','Michael Anderson',20,8,'2022-03-01','9783456789012',172,3.8,'A science fiction epic that takes readers on an intergalactic journey.','default_cover.png'),(72,'Real Dumpster','Sarah Williams',12,2,'2022-04-01','9784567890123',133,4.2,'A heartwarming story about the magic of nature and the power of friendship.','default_cover.png'),(73,'Dreams of Tomorrow','Christopher Taylor',18,6,'2022-05-01','9785678901235',149,4.7,'An enchanting tale where dreams hold the key to a magical destiny.','default_cover.png'),(74,'Shadows of the Past','Jessica Roberts',25,4,'2022-06-01','9786789012345',169,4.9,'A gripping mystery that unravels the secrets of a haunted mansion.','default_cover.png'),(75,'Legends of the Lost Realm','Daniel Thompson',30,7,'2022-07-01','9787890123456',47,3.5,'An epic fantasy saga filled with mythical creatures and epic battles.','default_cover.png'),(76,'A Dance with Destiny','Olivia Davis',22,9,'2022-08-01','9788901234567',78,4.3,'A captivating love story set against the backdrop of a grand ballroom.','default_cover.png'),(77,'The Forgotten City','Matthew Wilson',16,1,'2022-09-01','9789012345678',75,4.6,'A suspenseful thriller that uncovers the dark secrets of an abandoned city.','default_cover.png'),(78,'Echoes of Eternity','Sophia Thompson',14,10,'2022-10-01','9780123456788',137,4.8,'A time-travel adventure that spans across centuries and tests the limits of destiny.','default_cover.png'),(89,'The Enigma Code','David Johnson',12,4,'2022-11-01','9781234567892',29,4.1,'A thrilling spy novel set during World War II, where codebreakers race against time to crack an encrypted message.','default_cover.png'),(90,'Whispering Shadows','Sophie Anderson',18,6,'2022-12-01','9782345678903',157,3.7,'A haunting tale of a ghostly presence that lurks in the shadows of an old mansion.','default_cover.png'),(91,'The Stellar Odyssey','Jonathan Miller',25,3,'2023-01-01','9783456789013',169,4.4,'An epic space opera that follows the journey of a young pilot through a vast and dangerous galaxy.','default_cover.png'),(92,'Lost in Paradise','Isabella Roberts',15,8,'2023-02-01','9784567890124',21,4.6,'A romantic novel set on a tropical island, where two strangers find love and solace amidst paradise.','default_cover.png'),(93,'The Mind Eye','Alexander Davis',20,5,'2023-03-01','9785678901236',128,3.9,'A psychological thriller that explores the depths of the human mind and the haunting consequences of a troubled past.','default_cover.png'),(94,'The Forgotten Chronicles','Emma Thompson',28,2,'2023-04-01','9786789012346',48,4.3,'A fantasy adventure where an unlikely group of heroes embarks on a quest to recover lost artifacts and restore balance to the world.','default_cover.png'),(95,'Whispers of the Forest','Nathan Wilson',16,9,'2023-05-01','9787890123457',32,4.7,'A magical tale set in an enchanted forest, where mystical creatures and ancient spirits come to life.','default_cover.png'),(96,'A Symphony of Love','Olivia Adams',22,7,'2023-06-01','9788901234568',16,4.2,'A heartwarming romance that intertwines the lives of two musicians as they strive to create the perfect symphony of love.','default_cover.png'),(97,'The Haunted Manor','Benjamin Wilson',14,3,'2023-07-01','9789012345679',160,4.9,'A spine-chilling horror story that unravels the mysteries of a haunted manor and the malevolent spirits that reside within.','default_cover.png'),(98,'Journey to Infinity','Emily Thompson',30,1,'2023-08-01','9780123456784',49,4.5,'A mind-bending science fiction journey through time and space, where the boundaries of reality are pushed to their limits.','default_cover.png'),(99,'The Crimson Legacy','Robert Harris',18,5,'2023-09-01','9781234567895',113,4.3,'A gripping historical fiction novel set in the aftermath of a brutal war, where a young soldier seeks redemption and uncovers a hidden conspiracy.','default_cover.png'),(100,'The Whirlwind Affair','Sophia Roberts',14,3,'2023-10-01','9782345678904',67,4.7,'A whirlwind romance filled with passion and intrigue, as two strangers embark on a thrilling adventure across exotic locations.','default_cover.png'),(101,'Echoes from the Past','Daniel Anderson',22,6,'2023-11-01','9783456789014',173,4,'A captivating tale of love and loss, where a mysterious artifact unlocks the secrets of a forgotten civilization.','default_cover.png'),(102,'The Serendipity Factor','Olivia Wilson',16,2,'2023-12-01','9784567890125',133,4.5,'A heartwarming story of unexpected connections and serendipitous encounters, where fate weaves its magical threads.','default_cover.png'),(103,'The Quantum Paradox','Matthew Davis',25,4,'2024-01-01','9785678901237',146,3.8,'A mind-bending exploration of quantum physics and the mysteries of the universe, where reality and perception collide.','default_cover.png'),(104,'The Forbidden Island','Emily Thompson',30,7,'2024-02-01','9786789012347',155,4.6,'An exhilarating adventure to a remote island shrouded in myth and danger, where a group of explorers uncovers ancient secrets.','default_cover.png'),(105,'Enigma of the Shadows','Michael Johnson',12,9,'2024-03-01','9787890123458',161,4.2,'A thrilling mystery that delves into the dark underbelly of a city, where shadows hold secrets and danger lurks at every corner.','default_cover.png'),(106,'Whispers of Destiny','Sarah Davis',20,1,'2024-04-01','9788901234569',164,4.9,'A mesmerizing tale of fate and destiny, where a chance encounter leads to a journey of self-discovery and profound revelations.','default_cover.png'),(107,'The Forgotten Prophecy','Christopher Roberts',15,8,'2024-05-01','9789012345670',161,4.4,'An epic fantasy saga that follows a group of unlikely heroes as they race against time to fulfill an ancient prophecy and save the world.','default_cover.png'),(108,'Infinite Echoes','Jessica Thompson',28,3,'2024-06-01','9780123456785',136,4.7,'A thought-provoking exploration of parallel universes and alternate realities, where echoes of our choices reverberate across infinite dimensions.','default_cover.png'),(239,'The Crimson Dagger','Jessica Davis',15,5,'2023-09-01','9781234567893',84,4.2,'A gripping fantasy adventure where a young warrior must retrieve a powerful artifact to save her kingdom.','default_cover.png'),(240,'Midnight Whispers','Daniel Wilson',20,3,'2023-10-01','9782345678900',112,4,'A suspenseful thriller set in a small town, haunted by a series of unexplained whispers in the night.','default_cover.png'),(241,'The Galactic Chronicles','Sophia Anderson',25,7,'2023-11-01','9783456789011',131,3.8,'An expansive science fiction saga that follows the struggles and triumphs of a diverse group of characters across multiple star systems.','default_cover.png'),(242,'Echoes of the Past','Jacob Thompson',18,2,'2023-12-01','9784567890120',145,4.5,'A captivating historical fiction novel that unravels the secrets of a forgotten era, connecting the lives of past and present.','default_cover.png'),(243,'The Serpent\'s Bite','Olivia Roberts',12,6,'2024-01-01','9785678901232',154,4.3,'A thrilling mystery where a detective delves into a web of deceit and betrayal, with a cunning killer known as \"The Serpent.\"','default_cover.png'),(244,'The Enchanted Forest','Matthew Davis',22,4,'2024-02-01','9786789012341',159,4.7,'A whimsical tale set in a magical forest inhabited by talking animals, mischievous fairies, and enchanted creatures.','default_cover.png'),(245,'The Melody of Memories','Emily Adams',16,9,'2024-03-01','9787890123450',157,4.1,'A poignant story of love, loss, and the power of music, as a pianist embarks on a journey to rediscover her passion and unlock the melody of her memories.','default_cover.png'),(246,'The Ghostly Manor','Benjamin Johnson',30,1,'2024-04-01','9788901234560',131,4.6,'A spine-chilling supernatural tale that follows a group of investigators as they uncover the dark secrets lurking within an abandoned manor.','default_cover.png'),(247,'Secrets of the Cosmos','Sophie Wilson',14,3,'2024-05-01','9789012345672',8,4.9,'A mind-bending exploration of the universe, revealing the secrets of black holes, parallel dimensions, and the mysteries that lie beyond.','default_cover.png'),(248,'Whispers in the Mist','David Thompson',26,5,'2024-06-01','9780123456780',176,4.4,'A haunting tale of love and tragedy, where the boundary between the living and the dead blurs within a mist-shrouded town.','default_cover.png'),(309,'The Forbidden Artifact','Sophia Thompson',18,4,'2024-07-01','9781234567894',81,4.2,'A thrilling adventure where a group of explorers races against time to find a powerful artifact before it falls into the wrong hands.','default_cover.png'),(310,'Whispers of Betrayal','Michael Johnson',16,6,'2024-08-01','9782345678909',87,4.1,'A gripping tale of deception and loyalty, as a protagonist navigates a world where trust is shattered and whispers of betrayal fill the air.','default_cover.png'),(311,'The Quantum theory','Emma Wilson',22,3,'2024-09-01','9783456789018',14,4.5,'A mind-bending science fiction novel that explores the mysteries of quantum physics and the consequences of altering the fabric of reality.','default_cover.png'),(312,'Lost in Time','Alexander Roberts',14,8,'2024-10-01','9784567890121',160,4,'A captivating time-travel adventure where a protagonist finds themselves stranded in a different era and must unravel the secrets of the past to find a way back home.','default_cover.png'),(313,'The Haunting Melody','Olivia Davis',20,5,'2024-11-01','9785678901233',53,4.3,'A haunting tale of music and mystery, as a musician discovers a hidden melody that unlocks a dark secret from the past.','default_cover.png'),(314,'Whispers from the Beyond','Nathan Thompson',16,9,'2024-12-01','9786789012342',137,4.7,'A supernatural thriller where a protagonist is plagued by whispers from the beyond, leading them to uncover a chilling truth.','default_cover.png'),(315,'The Art of Silence','Olivia Wilson',24,2,'2025-01-01','9787890123451',172,4.6,'A captivating tale of a mute artist who expresses their deepest emotions through their art, transcending the boundaries of words.','default_cover.png'),(316,'The Forgotten Land','Benjamin Adams',18,7,'2025-02-01','9788901234561',96,4,'An epic fantasy journey to a forgotten land, where ancient prophecies and mythical creatures shape the destiny of a young hero.','default_cover.png'),(317,'Forsaken Time','Emily Johnson',22,3,'2025-03-01','9789012345673',142,4.4,'A gripping tale of fate and choices, as the protagonist navigates a world where whispers of destiny guide their every move.','default_cover.png'),(318,'The Crystal Labyrinth','Jacob Wilson',16,5,'2025-04-01','9780123456781',68,4.1,'A fantastical adventure through a labyrinth of crystal, where danger lurks at every turn and only the brave can find their way out.','default_cover.png');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `loaned`
--

DROP TABLE IF EXISTS `loaned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaned` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` date NOT NULL,
  `return_date` date NOT NULL,
  `userid_fk` int NOT NULL,
  `bookid_fk` int NOT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `bookid_fk_idx` (`bookid_fk`),
  KEY `userid_fk_idx` (`userid_fk`),
  CONSTRAINT `bookid_fk` FOREIGN KEY (`bookid_fk`) REFERENCES `books` (`book_id`),
  CONSTRAINT `userid_fk` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaned`
--

LOCK TABLES `loaned` WRITE;
/*!40000 ALTER TABLE `loaned` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remember_me`
--

DROP TABLE IF EXISTS `remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remember_me` (
  `idremember_me` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT 'null',
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`idremember_me`),
  UNIQUE KEY `session_id_UNIQUE` (`session_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remember_me`
--

LOCK TABLES `remember_me` WRITE;
/*!40000 ALTER TABLE `remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `selectbookbylatest`
--

DROP TABLE IF EXISTS `selectbookbylatest`;
/*!50001 DROP VIEW IF EXISTS `selectbookbylatest`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `selectbookbylatest` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `author`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `publication_date`,
 1 AS `ISBN`,
 1 AS `genre_id`,
 1 AS `rating`,
 1 AS `description`,
 1 AS `pic`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `selectbookbyrating`
--

DROP TABLE IF EXISTS `selectbookbyrating`;
/*!50001 DROP VIEW IF EXISTS `selectbookbyrating`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `selectbookbyrating` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `author`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `publication_date`,
 1 AS `ISBN`,
 1 AS `genre_id`,
 1 AS `rating`,
 1 AS `description`,
 1 AS `pic`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showallbooks`
--

DROP TABLE IF EXISTS `showallbooks`;
/*!50001 DROP VIEW IF EXISTS `showallbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showallbooks` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `author`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `publication_date`,
 1 AS `ISBN`,
 1 AS `genre_id`,
 1 AS `rating`,
 1 AS `description`,
 1 AS `pic`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

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
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_id_UNIQUE` (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `chk_role` CHECK ((`role` in (_utf8mb4'user',_utf8mb4'admin')))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Will only accept either "admin", or "user" explicitly.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SkyeRyan.21@gmail.com','Skye123','admin','default_profile_pic.png'),(2,'JamesEvans@gmail.com','James123','user','default_profile_pic.png'),(3,'CustomerTest@example.com','Customer123','user','default_profile_pic.png'),(4,'testing123','abc123','admin','default_profile_pic.png'),(5,'oogabooga@gmail.com','urmom','user','default_profile_pic.png'),(8,'a@a','test123','user','default_profile_pic.png'),(9,'a2@a','test123','user','default_profile_pic.png'),(10,'a@e','tester123','user','default_profile_pic.png'),(11,'e@e','testmouse','user','default_profile_pic.png'),(12,'r@r','test123','user','default_profile_pic.png'),(14,'P@p','ppp123','user','default_profile_pic.png'),(15,'l@l','lll123','user','default_profile_pic.png'),(16,'k@kkk','kek123','user','default_profile_pic.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `selectbookbylatest`
--

/*!50001 DROP VIEW IF EXISTS `selectbookbylatest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `selectbookbylatest` AS select `books`.`book_id` AS `book_id`,`books`.`title` AS `title`,`books`.`author` AS `author`,`books`.`price` AS `price`,`books`.`quantity` AS `quantity`,`books`.`publication_date` AS `publication_date`,`books`.`ISBN` AS `ISBN`,`books`.`genre_id` AS `genre_id`,`books`.`rating` AS `rating`,`books`.`description` AS `description`,`books`.`pic` AS `pic`,`genres`.`name` AS `genre` from (`genres` left join `books` on((`genres`.`genre_id` = `books`.`genre_id`))) where (`books`.`book_id` is not null) order by `books`.`publication_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `selectbookbyrating`
--

/*!50001 DROP VIEW IF EXISTS `selectbookbyrating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `selectbookbyrating` AS select `books`.`book_id` AS `book_id`,`books`.`title` AS `title`,`books`.`author` AS `author`,`books`.`price` AS `price`,`books`.`quantity` AS `quantity`,`books`.`publication_date` AS `publication_date`,`books`.`ISBN` AS `ISBN`,`books`.`genre_id` AS `genre_id`,`books`.`rating` AS `rating`,`books`.`description` AS `description`,`books`.`pic` AS `pic`,`genres`.`name` AS `genre` from (`genres` left join `books` on((`genres`.`genre_id` = `books`.`genre_id`))) where (`books`.`book_id` is not null) order by `books`.`rating` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showallbooks`
--

/*!50001 DROP VIEW IF EXISTS `showallbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showallbooks` AS select `books`.`book_id` AS `book_id`,`books`.`title` AS `title`,`books`.`author` AS `author`,`books`.`price` AS `price`,`books`.`quantity` AS `quantity`,`books`.`publication_date` AS `publication_date`,`books`.`ISBN` AS `ISBN`,`books`.`genre_id` AS `genre_id`,`books`.`rating` AS `rating`,`books`.`description` AS `description`,`books`.`pic` AS `pic`,`genres`.`name` AS `genre` from (`genres` left join `books` on((`genres`.`genre_id` = `books`.`genre_id`))) where (`books`.`book_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 22:08:50
