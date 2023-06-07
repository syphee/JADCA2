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
-- Dumping routines for database 'jadca1'
--
/*!50003 DROP PROCEDURE IF EXISTS `addBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBook`(IN inputTitle VARCHAR(255),
IN inputAuthor VARCHAR(255),IN inputPrice double,
IN inputQuantity int,IN inputPub_date DATE,IN inputISBN VARCHAR(13),
IN inputGenre VARCHAR(45),IN inputRating double,IN inputDescription VARCHAR(255),
IN inputPicture VARCHAR(255))
BEGIN
	INSERT INTO books(title,author,price,quantity,publication_date,ISBN,genre,rating,description,pic) VALUES(inputTitle,inputAuthor,inputPrice,inputQuantity,inputPub_date,inputISBN,inputGenre,inputRating,inputDescription,inputPicture);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBook`(IN inputISBN VARCHAR(13))
BEGIN
	DELETE from books WHERE ISBN = inputISBN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectBookByAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectBookByAuthor`(IN inputString VARCHAR(255))
BEGIN
SELECT books.*, genres.name as genre
FROM books
right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and books.author like CONCAT('%', inputString , '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectBookByGenre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectBookByGenre`(IN inputString VARCHAR(255))
BEGIN
SELECT books.*, genres.name as genre
FROM books
right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and genres.name = inputString;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectBookByTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectBookByTitle`(IN inputString VARCHAR(255))
BEGIN
SELECT books.*, genres.name as genre
FROM books
right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and books.title like CONCAT('%', inputString , '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 22:08:11
