-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: sqlalchemy
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `birthDate` varchar(10) DEFAULT NULL,
  `mark_1` int(11) DEFAULT NULL,
  `mark_2` int(11) DEFAULT NULL,
  `mark_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'maro','benm','31/08/1994',12,13,14),(2,'maro','benm','31/08/1994',12,13,14),(3,'maro','benm','31/08/1994',12,13,14),(4,'maro','benm','31/08/1994',12,13,14),(5,'maro','benm','31/08/1994',12,13,14),(6,'maro','benm','31/08/1994',12,13,14),(7,'maro','benm','31/08/1994',12,13,14),(8,'maro','benm','31/08/1994',12,13,14),(9,'maro','benm','31/08/1994',12,13,14),(10,'maro','benm','31/08/1994',12,13,14),(11,'maro','benm','31/08/1994',12,13,14),(12,'maro','benm','31/08/1994',12,13,14),(13,'maro','benm','31/08/1994',12,13,14),(14,'maro','benm','31/08/1994',12,13,14),(15,'maro','benm','31/08/1994',12,13,14),(16,'maro','benm','31/08/1994',12,13,14),(17,'maro','benm','31/08/1994',12,13,14),(18,'maro','benm','31/08/1994',12,13,14),(19,'maro','benm','31/08/1994',12,13,14),(20,'maro','benm','31/08/1994',12,13,14),(21,'maro','benm','31/08/1994',12,13,14),(22,'maro','benm','31/08/1994',12,13,14),(23,'maro','benm','31/08/1994',12,13,14),(24,'maro','benm','31/08/1994',12,13,14),(25,'maro','benm','31/08/1994',12,13,14),(26,'maro','benm','31/08/1994',12,13,14),(27,'maro','benm','31/08/1994',12,13,14);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 18:18:58
