-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: academia
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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'João Silva','12345678901','2000-05-15','11987654321','joao.silva@email.com'),(2,'Maria Oliveira','23456789012','1998-08-22','11976543210','maria.oliveira@email.com'),(3,'Carlos Santos','34567890123','2001-03-10','11965432109','carlos.santos@email.com'),(4,'Ana Souza','45678901234','1999-11-05','11954321098','ana.souza@email.com'),(5,'Pedro Lima','56789012345','2002-07-18','11943210987','pedro.lima@email.com'),(6,'Juliana Costa','67890123456','2000-09-30','11932109876','juliana.costa@email.com'),(7,'Lucas Pereira','78901234567','1997-12-12','11921098765','lucas.pereira@email.com'),(8,'Fernanda Rocha','89012345678','2001-06-25','11910987654','fernanda.rocha@email.com'),(9,'Rafael Almeida','90123456789','1998-04-08','11999887766','rafael.almeida@email.com'),(10,'Camila Martins','01234567890','2002-01-20','11988776655','camila.martins@email.com');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` int(11) NOT NULL,
  `data_matricula` date NOT NULL,
  `status` enum('Ativa','Trancada','Cancelada') NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_modalidade` int(11) NOT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_modalidade` (`id_modalidade`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidade` (`id_modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,'2025-01-10','Ativa',1,1),(2,'2025-02-15','Ativa',3,7),(3,'2025-03-20','Trancada',5,10),(4,'2025-04-05','Ativa',8,2),(5,'2025-05-12','Cancelada',10,4);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidade`
--

DROP TABLE IF EXISTS `modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidade` (
  `id_modalidade` int(11) NOT NULL,
  `nome_modalidade` varchar(100) NOT NULL,
  `valor_mensal` double NOT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade`
--

LOCK TABLES `modalidade` WRITE;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
INSERT INTO `modalidade` VALUES (1,'Musculação',89.9),(2,'CrossFit',149.9),(3,'Pilates',129.9),(4,'Yoga',99.9),(5,'Spinning',109.9),(6,'Zumba',79.9),(7,'Jiu-Jitsu',139.9),(8,'Muay Thai',149.9),(9,'Boxe',119.9),(10,'Natação',159.9),(11,'Hidroginástica',119.9),(12,'Funcional',99.9),(13,'Dança',89.9),(14,'Alongamento',69.9),(15,'Treinamento Personalizado',249.9);
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 21:02:25
