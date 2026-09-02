-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: locadora
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Silva','ana.silva@locadora.com','0000-00-00','12345678900','F'),(2,'Bruno Oliveira','bruno.oliveira@locadora.com','0000-00-00','23456789011','M'),(3,'Carla Pereira','carla.pereira@locadora.com','0000-00-00','34567890122','F'),(4,'Daniel Costa','daniel.costa@locadora.com','0000-00-00','45678901233','M'),(5,'Eduardo Almeida','eduardo.almeida@locadora.com','0000-00-00','56789012344','M'),(6,'Fernanda Lima','fernanda.lima@locadora.com','0000-00-00','67890123455','F'),(7,'Guilherme Rocha','guilherme.rocha@locadora.com','0000-00-00','78901234566','M'),(8,'Helena Fernandes','helena.fernandes@locadora.com','0000-00-00','89012345677','F'),(9,'Igor Santos','igor.santos@locadora.com','0000-00-00','90123456788','M'),(10,'Juliana Mendes','juliana.mendes@locadora.com','0000-00-00','51234567899','F'),(11,'Leonardo Martins','leonardo.martins@locadora.com','0000-00-00','12345678901','M'),(12,'Mariana Souza','mariana.souza@locadora.com','0000-00-00','23456789012','F'),(13,'Nelson Ribeiro','nelson.ribeiro@locadora.com','0000-00-00','34567890123','M'),(14,'Olivia Azevedo','olivia.azevedo@locadora.com','0000-00-00','45678901234','F'),(15,'Paulo Batista','paulo.batista@locadora.com','0000-00-00','56789012345','M'),(16,'Renato Augusto','renato.augusto@locadora.com','1992-11-04','9876543210','M'),(17,'Camila Pitanga','camila.pitanga@locadora.com','1987-05-18','8765432109','F'),(18,'Rodrigo Faro','rodrigo.faro@locadora.com','1981-10-20','7654321098','M'),(19,'Vanessa da Mata','vanessa.mata@locadora.com','1996-02-14','6543210987','F');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor`
--

DROP TABLE IF EXISTS `diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor` (
  `id_diretor` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_diretor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor`
--

LOCK TABLES `diretor` WRITE;
/*!40000 ALTER TABLE `diretor` DISABLE KEYS */;
INSERT INTO `diretor` VALUES (1,'Steven Spielberg'),(2,'Martin Scorsese'),(3,'Quentin Tarantino'),(4,'Christopher Nolan'),(5,'James Cameron'),(6,'Ridley Scott'),(7,'Alfred Hitchcock'),(8,'Stanley Kubrick'),(9,'Peter Jackson'),(10,'Francis Ford Coppola');
/*!40000 ALTER TABLE `diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id_filme` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `diretor` int(11) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `ano_lancamento` int(11) NOT NULL,
  `classificacao_indicativa` enum('L','6+','10+','12+','14+','16+','18+') NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `diretor` (`diretor`),
  CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`diretor`) REFERENCES `diretor` (`id_diretor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Jurassic Park',1,'Aventura',1993,''),(2,'E.T. the Extra-Terrestrial',1,'Ficção Científica',1982,''),(3,'Taxi Driver',2,'Drama',1976,''),(4,'Goodfellas',2,'Crime',1990,''),(5,'Pulp Fiction',3,'Crime',1994,''),(6,'Django Unchained',3,'Western',2012,''),(7,'Inception',4,'Ficção Científica',2010,''),(8,'The Dark Knight',4,'Ação',2008,''),(9,'Titanic',5,'Romance',1997,''),(10,'Avatar',5,'Ficção Científica',2009,''),(11,'Gladiator',6,'Ação',2000,''),(12,'Blade Runner',6,'Ficção Científica',1982,''),(13,'Psycho',7,'Terror',1960,''),(14,'Vertigo',7,'Suspense',1958,''),(15,'2001: A Space Odyssey',8,'Ficção Científica',1968,''),(16,'The Shining',8,'Terror',1980,''),(17,'The Lord of the Rings: The Fellowship of the Ring',9,'Fantasia',2001,''),(18,'The Lord of the Rings: The Return of the King',9,'Fantasia',2003,''),(19,'The Godfather',10,'Crime',1972,''),(20,'Apocalypse Now',10,'Guerra',1979,''),(21,'Schindler\'s List',1,'Drama',1993,''),(22,'Jaws',1,'Terror',1975,''),(23,'Raging Bull',2,'Drama',1980,''),(24,'The Departed',2,'Crime',2006,''),(25,'Kill Bill: Vol. 1',3,'Ação',2003,''),(26,'Inglourious Basterds',3,'Guerra',2009,''),(27,'Interstellar',4,'Ficção Científica',2014,''),(28,'Memento',4,'Mistério',2000,''),(29,'Aliens',5,'Ficção Científica',1986,''),(30,'True Lies',5,'Ação',1994,''),(31,'Duna: Parte Dois',4,'Ficção Científica',2024,''),(32,'Oppenheimer',4,'Drama',2023,''),(33,'Everything Everywhere All at Once',1,'Aventura',2022,''),(34,'Spider-Man: Into the Spider-Verse',2,'Animação',2018,'L');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `id_locacao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao_prevista` date DEFAULT NULL,
  `data_baixa_devolucao` date DEFAULT NULL,
  PRIMARY KEY (`id_locacao`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_filme` (`id_filme`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1,1,'2024-01-01','2024-01-08','2024-01-08'),(2,2,2,'2024-01-02','2024-01-09','2024-01-09'),(3,3,3,'2024-01-03','2024-01-10','2024-01-11'),(4,4,4,'2024-01-04','2024-01-11','2024-01-11'),(5,5,5,'2024-01-05','2024-01-12','2024-01-12'),(6,6,6,'2024-01-06','2024-01-13','2024-01-13'),(7,7,7,'2024-01-07','2024-01-14','2024-01-15'),(8,8,8,'2024-01-08','2024-01-15','2024-01-15'),(9,9,9,'2024-01-09','2024-01-16','2024-01-17'),(10,10,10,'2024-01-10','2024-01-17','2024-01-17'),(11,11,11,'2024-01-11','2024-01-18','2024-01-18'),(12,12,12,'2024-01-12','2024-01-19','2024-01-19'),(13,13,13,'2024-01-13','2024-01-20','2024-01-21'),(14,14,14,'2024-01-14','2024-01-21','2024-01-21'),(15,15,15,'2024-01-15','2024-01-22','2024-01-22'),(16,1,16,'2024-01-16','2024-01-23','2024-01-24'),(17,2,17,'2024-01-17','2024-01-24','2024-01-24'),(18,3,18,'2024-01-18','2024-01-25','2024-01-26'),(19,4,19,'2024-01-19','2024-01-26','2024-01-26'),(20,5,20,'2024-01-20','2024-01-27','2024-01-27'),(21,6,21,'2024-01-21','2024-01-28','2024-01-28'),(22,7,22,'2024-01-22','2024-01-29','2024-01-30'),(23,8,23,'2024-01-23','2024-01-30','2024-01-30'),(24,9,24,'2024-01-24','2024-01-31','2024-02-01'),(25,10,25,'2024-01-25','2024-02-01','2024-02-01'),(26,11,26,'2024-01-26','2024-02-02','2024-02-02'),(27,12,27,'2024-01-27','2024-02-03','2024-02-03'),(28,13,28,'2024-01-28','2024-02-04','2024-02-05'),(29,14,29,'2024-01-29','2024-02-05','2024-02-05'),(30,15,30,'2024-01-30','2024-02-06','2024-02-06'),(31,1,1,'2024-01-31','2024-02-07','2024-02-08'),(32,2,2,'2024-02-01','2024-02-08','2024-02-08'),(33,3,3,'2024-02-02','2024-02-09','2024-02-10'),(34,4,4,'2024-02-03','2024-02-10','2024-02-10'),(35,5,5,'2024-02-04','2024-02-11','2024-02-11'),(36,6,6,'2024-02-05','2024-02-12','2024-02-12'),(37,7,7,'2024-02-06','2024-02-13','2024-02-14'),(38,8,8,'2024-02-07','2024-02-14','2024-02-14'),(39,9,9,'2024-02-08','2024-02-15','2024-02-16'),(40,10,10,'2024-02-09','2024-02-16','2024-02-16'),(41,11,11,'2024-02-10','2024-02-17','2024-02-17'),(42,12,12,'2024-02-11','2024-02-18','2024-02-18'),(43,13,13,'2024-02-12','2024-02-19','2024-02-20'),(44,14,14,'2024-02-13','2024-02-20','2024-02-20'),(45,15,15,'2024-02-14','2024-02-21','2024-02-21'),(46,1,16,'2024-02-15','2024-02-22','2024-02-23'),(47,2,17,'2024-02-16','2024-02-23','2024-02-23'),(48,3,18,'2024-02-17','2024-02-24','2024-02-25'),(49,4,19,'2024-02-18','2024-02-25','2024-02-25'),(50,5,20,'2024-02-19','2024-02-26','2024-02-26'),(51,6,21,'2024-02-20','2024-02-27','2024-02-27'),(52,7,22,'2024-02-21','2024-02-28','2024-02-29'),(53,8,23,'2024-02-22','2024-02-29','2024-02-29'),(54,9,24,'2024-02-23','2024-03-01','2024-03-02'),(55,10,25,'2024-02-24','2024-03-02','2024-03-02'),(56,11,26,'2024-02-25','2024-03-03','2024-03-03'),(57,12,27,'2024-02-26','2024-03-04','2024-03-04'),(58,13,28,'2024-02-27','2024-03-05','2024-03-06'),(59,14,29,'2024-02-28','2024-03-06','2024-03-06'),(60,15,30,'2024-02-29','2024-03-07','2024-03-07'),(61,1,1,'2024-03-01','2024-03-08','2024-03-09'),(62,2,2,'2024-03-02','2024-03-09','2024-03-09'),(63,3,3,'2024-03-03','2024-03-10','2024-03-11'),(64,4,4,'2024-03-04','2024-03-11','2024-03-11'),(65,5,5,'2024-03-05','2024-03-12','2024-03-12'),(66,6,6,'2024-03-06','2024-03-13','2024-03-13'),(67,7,7,'2024-03-07','2024-03-14','2024-03-15'),(68,8,8,'2024-03-08','2024-03-15','2024-03-15'),(69,9,9,'2024-03-09','2024-03-16','2024-03-17'),(70,10,10,'2024-03-10','2024-03-17','2024-03-17'),(71,11,11,'2024-03-11','2024-03-18','2024-03-18'),(72,12,12,'2024-03-12','2024-03-19','2024-03-19'),(73,13,13,'2024-03-13','2024-03-20','2024-03-21'),(74,14,14,'2024-03-14','2024-03-21','2024-03-21'),(75,15,15,'2024-03-15','2024-03-22','2024-03-22'),(76,1,16,'2024-03-16','2024-03-23','2024-03-24'),(77,2,17,'2024-03-17','2024-03-24','2024-03-24'),(78,3,18,'2024-03-18','2024-03-25','2024-03-26'),(79,4,19,'2024-03-19','2024-03-26','2024-03-26'),(80,5,20,'2024-03-20','2024-03-27','2024-03-27'),(81,6,21,'2024-03-21','2024-03-28','2024-03-28'),(82,7,22,'2024-03-22','2024-03-29','2024-03-30'),(83,8,23,'2024-03-23','2024-03-30','2024-03-30'),(84,9,24,'2024-03-24','2024-03-31','2024-04-01'),(85,10,25,'2024-03-25','2024-04-01','2024-04-01'),(86,11,26,'2024-03-26','2024-04-02','2024-04-02'),(87,12,27,'2024-03-27','2024-04-03','2024-04-03'),(88,13,28,'2024-03-28','2024-04-04','2024-04-05'),(89,14,29,'2024-03-29','2024-04-05','2024-04-05'),(90,15,30,'2024-03-30','2024-04-06','2024-04-06'),(91,1,1,'2024-03-31','2024-04-07','2024-04-08'),(92,2,2,'2024-04-01','2024-04-08','2024-04-08'),(93,3,3,'2024-04-02','2024-04-09','2024-04-10'),(94,4,4,'2024-04-03','2024-04-10','2024-04-10'),(95,5,5,'2024-04-04','2024-04-11','2024-04-11'),(96,6,6,'2024-04-05','2024-04-12','2024-04-12'),(97,7,7,'2024-04-06','2024-04-13','2024-04-14'),(98,8,8,'2024-04-07','2024-04-14','2024-04-14'),(99,9,9,'2024-04-08','2024-04-15','2024-04-16'),(100,10,10,'2024-04-09','2024-04-16','2024-04-16'),(101,16,31,'2026-06-20',NULL,NULL),(102,17,32,'2026-06-20',NULL,NULL),(103,18,33,'2026-06-20',NULL,NULL),(104,19,34,'2026-06-20',NULL,NULL);
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20 15:56:52
