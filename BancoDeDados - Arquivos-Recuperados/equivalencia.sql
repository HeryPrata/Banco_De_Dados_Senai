-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: equivalencia
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB
-- create database equivalencia;
use <nome da sua base de dados>;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_area_tecnologica`
--

DROP TABLE IF EXISTS `tb_area_tecnologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_area_tecnologica` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `nome_area` varchar(100) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area_tecnologica`
--

LOCK TABLES `tb_area_tecnologica` WRITE;
/*!40000 ALTER TABLE `tb_area_tecnologica` DISABLE KEYS */;
INSERT INTO `tb_area_tecnologica` VALUES (1,'TECNOLOGIA DA INFORMAÇÃO'),(2,'MATALMECÂNICA'),(3,'ELETROTÉCNICA'),(4,'AUTOMAÇÃO'),(5,'AUTOMOTIVA');
/*!40000 ALTER TABLE `tb_area_tecnologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cursos`
--

DROP TABLE IF EXISTS `tb_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) NOT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk_tb_cursos_tb_area_tecnologica_idx` (`id_area`),
  CONSTRAINT `fk_tb_cursos_tb_area_tecnologica` FOREIGN KEY (`id_area`) REFERENCES `tb_area_tecnologica` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cursos`
--

LOCK TABLES `tb_cursos` WRITE;
/*!40000 ALTER TABLE `tb_cursos` DISABLE KEYS */;
INSERT INTO `tb_cursos` VALUES (1,'TÉC. DESENVOLVIMENTO DE SISTEMAS',1),(2,'TÉC. REDES DE COMPUTADORES',1),(3,'TÉC. ELETROTÉCNICA',3),(4,'TÉC. MECÂNICA INDUSTRIAL',2),(5,'TÉC. AUTOMAÇÃO INDUSTRIAL',4),(6,'TÉC. CIBERSEGURANÇA',1);
/*!40000 ALTER TABLE `tb_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplinas`
--

DROP TABLE IF EXISTS `tb_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplinas` (
  `id_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(100) NOT NULL,
  `ch_disciplina` int(11) NOT NULL,
  `ch_presencial` int(10) unsigned NOT NULL,
  `ch_ead` int(10) unsigned NOT NULL,
  `id_grupo_equivalencia` int(11) NOT NULL,
  `id_ppc` int(11) NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  KEY `fk_tb_disciplinas_tb_grupo_equivalencia1_idx` (`id_grupo_equivalencia`),
  KEY `fk_tb_disciplinas_tb_ppc1_idx` (`id_ppc`),
  CONSTRAINT `fk_tb_disciplinas_tb_grupo_equivalencia1` FOREIGN KEY (`id_grupo_equivalencia`) REFERENCES `tb_grupo_equivalencia` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_disciplinas_tb_ppc1` FOREIGN KEY (`id_ppc`) REFERENCES `tb_ppc` (`id_ppc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplinas`
--

LOCK TABLES `tb_disciplinas` WRITE;
/*!40000 ALTER TABLE `tb_disciplinas` DISABLE KEYS */;
INSERT INTO `tb_disciplinas` VALUES (1,'Introdução a Qualidade e Produtividade',16,0,16,1,1),(2,'Saúde e Segurança no Trabalho',12,0,12,15,1),(3,'Introdução a Indústria 4.0',24,0,24,14,1),(4,'Introdução ao desenvolvimento de Projetos',12,0,12,18,1),(5,'Introdução a Tecnologia da Informação e Comunicação',40,0,40,22,1),(6,'Sustentabilidade nos Processos Industriais',8,0,8,19,1),(7,'Lógica de Programação',220,44,176,13,1),(8,'Fundamentos da Eletrônica Aplicada',100,16,84,12,1),(9,'Internet das coisas',120,24,96,11,1),(10,'Programação de Aplicativos',120,24,96,3,1),(11,'Banco de Dados',120,28,92,4,1),(12,'Pré projeto',20,20,0,17,1),(13,'Desenvolvimento de Sistemas',200,40,160,6,1),(14,'Modelagem de Sistemas',88,72,16,10,1),(15,'Manutenção de Sistemas ',30,6,24,8,1),(16,'Implantação de Sistemas',30,6,24,7,1),(17,'Teste de Sistemas ',60,12,48,5,1),(19,'Fundamentos de Informática',80,80,0,2,2),(20,'Documentação Técnica',40,40,0,21,2),(21,'Fundamentos de Tecnologia da Informação',40,0,40,22,2),(22,'Arquitetura de Redes de Computadores',80,80,0,23,2),(23,'Sistemas Operacionais Cliente',80,80,0,24,2),(24,'Cabeamento Estruturado',120,120,0,25,2),(25,'Servidores de Redes',40,40,0,26,2),(26,'Comutação e Interconexão de Redes',160,160,0,27,2),(27,'Projeto Técnico',20,20,0,28,2),(28,'Redes Convergentes',40,40,0,29,2),(29,'Segurança de Redes',60,60,0,30,2),(30,'Monitoramento e Gerenciamento de Rede',40,40,0,31,2),(31,'Serviços de Rede',120,120,0,32,2),(32,'Trabalho de Conclusão de Curso',80,80,0,33,2),(33,'Introdução à Tecnologia da Informação e Comunicação',40,0,40,22,4),(34,'Introdução ao Desenvolvimento de Projetos',12,0,12,18,4),(35,'Introdução a Qualidade e Produtividade',16,0,16,34,4),(36,'Lógica de Programação',220,220,0,13,4),(37,'Fundamentos de Eletroeletrônica Aplicada',60,60,0,12,4),(38,'Projeto Integrador I: Ideação',20,12,8,35,4),(39,'Projeto Integrador II - Metodologias Ágeis',20,12,8,36,4),(40,'Introdução a Indústria 4.0',24,0,24,14,4),(41,'Saúde e Segurança no Trabalho',12,0,12,15,4),(42,'Modelagem de Sistemas',80,72,8,10,4),(43,'Banco de Dados',120,100,20,4,4),(44,'Programação de Aplicativos',120,120,0,3,4),(45,'Implantação de Sistemas',30,24,6,7,4),(46,'Projeto Integrador III: Grand Prix',20,12,8,37,4),(47,'Sustentabilidade nos processos industriais',8,0,8,19,4),(48,'Desenvolvimento de Sistemas',188,164,24,6,4),(49,'Teste de Sistemas',60,40,20,5,4),(50,'Manutenção de Sistemas',30,24,6,8,4),(51,'Internet das Coisas',100,80,20,11,4),(52,'Projeto Integrador IV: Trabalho de Conclusão de Curso',20,20,0,38,4),(53,'Introdução ao Desenvolvimento  de Projetos',12,0,12,18,5),(54,'Fundamentos de Governança de  TI',60,40,20,40,5),(55,'Fundamentos de  Cibersegurança e Redes',60,60,0,41,5),(56,'Informática Aplicada a Cibersegurança',68,68,0,42,5),(57,'Protocolos e Serviços de Redes',100,100,0,23,5),(58,'Saúde e Segurança no Trabalho',12,0,12,15,5),(59,'Projeto Integrador I: Ideação',20,12,8,35,5),(60,'Introdução a Indústria 4.0',24,0,24,14,5),(61,'Sistemas Operacionais de  Código Aberto e Fechado',100,76,24,24,5),(62,'Criatividade e Ideação em  Projetos de Inovação',16,16,0,35,5),(63,'Projeto Integrador II:  Metodologias Ágeis',20,12,8,36,5);
/*!40000 ALTER TABLE `tb_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grupo_equivalencia`
--

DROP TABLE IF EXISTS `tb_grupo_equivalencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_grupo_equivalencia` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `desc_grupo` varchar(45) NOT NULL,
  `ch_minima` varchar(5) NOT NULL,
  `ch_maxima` varchar(5) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo_equivalencia`
--

LOCK TABLES `tb_grupo_equivalencia` WRITE;
/*!40000 ALTER TABLE `tb_grupo_equivalencia` DISABLE KEYS */;
INSERT INTO `tb_grupo_equivalencia` VALUES (1,'COMUNICAÇÃO','10','20'),(2,'INFORMÁTICA APLICADA','10','16'),(3,'PROG. APLICATIVOS','100','120'),(4,'BANCO DADOS','100','120'),(5,'TESTES SISTEMAS','40','60'),(6,'DESENVOLV. DE SISTEMAS','160','200'),(7,'IMPLANTAÇÃO SISTEMAS','30','40'),(8,'MANUTENÇÃO SISTEMAS','30','40'),(9,'METOD. DESENVOLVIMENTO PROJETOS','',''),(10,'MODELAGEM DE SISTEMAS','80','100'),(11,'IOT - INTERNET DAS COISAS','80','100'),(12,'ELETRÔNICA APLICADA','',''),(13,'LÓGICA PROGRAMAÇÃO','180','220'),(14,'INDÚSTRIA 4.0','20','30'),(15,'SMS - SAÚDE E SEG. NO TRABALHO','10','16'),(16,'PRÉ PROJETO T.I. SOFTWARE','',''),(17,'PROJETO INTEGRADOR T.I.','',''),(18,'INT. DESENVOLV. PROJETOS T.I.','10','16'),(19,'SUSTENTAB. PROCESSOS INDUSTRIAIS','8','12'),(21,'DOCUMENTAÇÃO TÉCNICA','',''),(22,'FUNDAMENTOS DE T.I.','40','60'),(23,'ARQUITETURA DE REDES','90','110'),(24,'SISTEMAS OPERACIONAIS CLIENTE','90','110'),(25,'CABEAMENTO ESTRUTURADO','',''),(26,'SERVIDORES DE REDE','',''),(27,'COMUTAÇÃO E INTERCONEXÃO DE REDES','',''),(28,'PROJETO TÉCNICO T.I. HARDWARE','',''),(29,'REDES CONVERGENTES','',''),(30,'SEGURANÇA DE REDE','',''),(31,'MONITORAMENTO E GERENCIAMENTO DE REDES','',''),(32,'SERVIÇOS DE REDE','',''),(33,'TCC - TRAB. DE CONCLUSÃO DE CURSO','',''),(34,'INTRODUÇÃO A QUALIDADE E PRODUTIVIDADE','16','20'),(35,'PROJETO INTEGRADOR I - IDEAÇÃO','16','24'),(36,'PROJETO INTEGRADOR II - METODOLOGIAS ÁGEIS','16','24'),(37,'PROJETO INTEGRADOR III - GRAND PRIX','16','24'),(38,'PROJETO INTEGRADOR IV - TRAB. CONCLUSÃO CURSO','16','24'),(39,'TESTE','100','120'),(40,'GOVERNANÇA EM T.I.','50','70'),(41,'FUNDAMENTOS DE CIBERSEGURANÇA','50','70'),(42,'INFORMÁTICA APLICADA','60','80');
/*!40000 ALTER TABLE `tb_grupo_equivalencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ppc`
--

DROP TABLE IF EXISTS `tb_ppc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ppc` (
  `id_ppc` int(11) NOT NULL AUTO_INCREMENT,
  `desc_ano` varchar(20) NOT NULL,
  `ch_curso` int(11) NOT NULL,
  `modalidade` varchar(45) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_ppc`),
  KEY `fk_tb_ppc_tb_cursos1_idx` (`id_curso`),
  CONSTRAINT `fk_tb_ppc_tb_cursos1` FOREIGN KEY (`id_curso`) REFERENCES `tb_cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ppc`
--

LOCK TABLES `tb_ppc` WRITE;
/*!40000 ALTER TABLE `tb_ppc` DISABLE KEYS */;
INSERT INTO `tb_ppc` VALUES (1,'2021 (80X20)',1280,'80X20',1),(2,'2018',1000,'Presencial',2),(4,'2021 (20X80)',1200,'20X80',1),(5,'2022 (20X80)',1200,'20X80',6);
/*!40000 ALTER TABLE `tb_ppc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'Admin','27 99999-9999','admin','admin','admin'),(2,'Mauricio Davel','27 99822-4697','mdavel','123*abc','admin'),(3,'Teste','27 99999-9999','teste','teste','user'),(4,'Mirele Alves','27 99999-9999','malves','malves','user'),(5,'Mirele Alves','27 99889-0000','malves','malves','user'),(6,'Nikolas Davel','27 99999-9999','ndavel','ndavel','admin');
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_disciplina_grupo_ppc`
--

DROP TABLE IF EXISTS `vw_disciplina_grupo_ppc`;
/*!50001 DROP VIEW IF EXISTS `vw_disciplina_grupo_ppc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_disciplina_grupo_ppc` AS SELECT
 1 AS `id_disciplina`,
  1 AS `nome_disciplina`,
  1 AS `ch_disciplina`,
  1 AS `id_grupo_equivalencia`,
  1 AS `desc_grupo`,
  1 AS `id_ppc`,
  1 AS `desc_ano`,
  1 AS `ch_curso`,
  1 AS `modalidade`,
  1 AS `id_curso` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_disciplina_grupo_ppc`
--

/*!50001 DROP VIEW IF EXISTS `vw_disciplina_grupo_ppc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_disciplina_grupo_ppc` AS select `d`.`id_disciplina` AS `id_disciplina`,`d`.`nome_disciplina` AS `nome_disciplina`,`d`.`ch_disciplina` AS `ch_disciplina`,`d`.`id_grupo_equivalencia` AS `id_grupo_equivalencia`,`g`.`desc_grupo` AS `desc_grupo`,`p`.`id_ppc` AS `id_ppc`,`p`.`desc_ano` AS `desc_ano`,`p`.`ch_curso` AS `ch_curso`,`p`.`modalidade` AS `modalidade`,`p`.`id_curso` AS `id_curso` from ((`tb_disciplinas` `d` join `tb_grupo_equivalencia` `g` on(`d`.`id_grupo_equivalencia` = `g`.`id_grupo`)) join `tb_ppc` `p` on(`d`.`id_ppc` = `p`.`id_ppc`)) */;
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

-- Dump completed on 2023-04-06  7:57:01
