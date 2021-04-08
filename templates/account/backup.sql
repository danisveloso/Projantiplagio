-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: systemantiplagio
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'joana@gmail.com.br',0,1,9);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'professor');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,49),(2,1,52),(6,1,57),(7,1,58),(9,1,60),(10,1,61),(11,1,62),(12,1,64),(13,1,65),(14,1,66),(15,1,67),(16,1,68),(17,1,69),(18,1,74),(19,1,75),(21,1,77),(22,1,78),(23,1,79),(25,1,81),(26,1,82),(27,1,83),(29,1,85),(30,1,86),(31,1,87),(33,1,89),(34,1,90),(35,1,91),(37,1,93);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add site',5,'add_site'),(18,'Can change site',5,'change_site'),(19,'Can delete site',5,'delete_site'),(20,'Can view site',5,'view_site'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add Categoria',13,'add_category'),(50,'Can change Categoria',13,'change_category'),(51,'Can delete Categoria',13,'delete_category'),(52,'Can view Categoria',13,'view_category'),(53,'Can add Progresso do usuário',14,'add_progress'),(54,'Can change Progresso do usuário',14,'change_progress'),(55,'Can delete Progresso do usuário',14,'delete_progress'),(56,'Can view Progresso do usuário',14,'view_progress'),(57,'Can add Questão',15,'add_question'),(58,'Can change Questão',15,'change_question'),(59,'Can delete Questão',15,'delete_question'),(60,'Can view Questão',15,'view_question'),(61,'Can add Quiz',16,'add_quiz'),(62,'Can change Quiz',16,'change_quiz'),(63,'Can delete Quiz',16,'delete_quiz'),(64,'Can view Quiz',16,'view_quiz'),(65,'Can add sitting',17,'add_sitting'),(66,'Can change sitting',17,'change_sitting'),(67,'Can delete sitting',17,'delete_sitting'),(68,'Can view sitting',17,'view_sitting'),(69,'Visualizar testes concluídos.',17,'view_sittings'),(70,'Can add Sub-Categoria',18,'add_subcategory'),(71,'Can change Sub-Categoria',18,'change_subcategory'),(72,'Can delete Sub-Categoria',18,'delete_subcategory'),(73,'Can view Sub-Categoria',18,'view_subcategory'),(74,'Can add Questão de múltipla escolha',19,'add_mcquestion'),(75,'Can change Questão de múltipla escolha',19,'change_mcquestion'),(76,'Can delete Questão de múltipla escolha',19,'delete_mcquestion'),(77,'Can view Questão de múltipla escolha',19,'view_mcquestion'),(78,'Can add Resposta',20,'add_answer'),(79,'Can change Resposta',20,'change_answer'),(80,'Can delete Resposta',20,'delete_answer'),(81,'Can view Resposta',20,'view_answer'),(82,'Can add Questão Verdadeiro/Falso',21,'add_tf_question'),(83,'Can change Questão Verdadeiro/Falso',21,'change_tf_question'),(84,'Can delete Questão Verdadeiro/Falso',21,'delete_tf_question'),(85,'Can view Questão Verdadeiro/Falso',21,'view_tf_question'),(86,'Can add referencia',22,'add_referencia'),(87,'Can change referencia',22,'change_referencia'),(88,'Can delete referencia',22,'delete_referencia'),(89,'Can view referencia',22,'view_referencia'),(90,'Can add Questão dissertativa',23,'add_essay_question'),(91,'Can change Questão dissertativa',23,'change_essay_question'),(92,'Can delete Questão dissertativa',23,'delete_essay_question'),(93,'Can view Questão dissertativa',23,'view_essay_question'),(94,'Can add contato',24,'add_contato'),(95,'Can change contato',24,'change_contato'),(96,'Can delete contato',24,'delete_contato'),(97,'Can view contato',24,'view_contato'),(98,'Can add Campus',25,'add_campus'),(99,'Can change Campus',25,'change_campus'),(100,'Can delete Campus',25,'delete_campus'),(101,'Can view Campus',25,'view_campus'),(102,'Can add curso',26,'add_curso'),(103,'Can change curso',26,'change_curso'),(104,'Can delete curso',26,'delete_curso'),(105,'Can view curso',26,'view_curso'),(106,'Can add disciplina',27,'add_disciplina'),(107,'Can change disciplina',27,'change_disciplina'),(108,'Can delete disciplina',27,'delete_disciplina'),(109,'Can view disciplina',27,'view_disciplina'),(110,'Can add Professor',28,'add_professor'),(111,'Can change Professor',28,'change_professor'),(112,'Can delete Professor',28,'delete_professor'),(113,'Can view Professor',28,'view_professor'),(114,'Can add Aluno',29,'add_aluno'),(115,'Can change Aluno',29,'change_aluno'),(116,'Can delete Aluno',29,'delete_aluno'),(117,'Can view Aluno',29,'view_aluno'),(118,'Can add turma',30,'add_turma'),(119,'Can change turma',30,'change_turma'),(120,'Can delete turma',30,'delete_turma'),(121,'Can view turma',30,'view_turma');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$HDU4Q0AvTJu0$mWzr4sa0zJHgvTNTdXLdDI+QZd0yYG4XT6ZCzI5ZTNM=','2020-09-09 15:29:17.218939',1,'admin','','','danisvcosta@gmail.com',1,1,'2020-08-23 20:57:09.050330'),(2,'pbkdf2_sha256$180000$miwWaHWM7N83$NXfPGFZGuy2J17uLzcocM6GbtkgBcF8JV0pqHFAljAc=','2020-09-01 16:42:19.844637',0,'maria','Maria','do Carmo Rosa','maria.silva@gmail.com',0,1,'2020-08-23 21:21:46.000000'),(3,'pbkdf2_sha256$180000$N7Zi659hL1AC$7RSvoMlqW6AykUoT9SEXtJWopI+l/kuapB8IQpqIjuU=','2020-08-28 14:52:38.439369',0,'professor','professor','Unifesp','teste@gmail.com.br',1,1,'2020-08-24 15:38:13.000000'),(4,'pbkdf2_sha256$180000$Txpk6y0cCFcj$lK0oYAd7EuQU6+hXM6XI8WdpaZA2UzepJoSpA8NeOX8=','2020-08-25 16:10:54.261176',0,'jose','José','Silva da Costa','jose.costa@gmail.com',0,1,'2020-08-24 16:00:37.000000'),(5,'pbkdf2_sha256$180000$P1b9LGH3rrYy$ZQw6nc50NzriApAm9a1W2/RZe1EFyyMXUZhukU4MeIc=','2020-08-25 17:55:21.316127',0,'carlos','Carlos','Antonio dos Santos','carlos@teste.com',0,1,'2020-08-24 16:01:15.000000'),(6,'pbkdf2_sha256$180000$IzBuijo9KD7Z$wS+UCIo1rodd7jFMw8pWz+EfD3oVrXjHpWo7LZbhiUI=','2020-08-26 17:30:02.348419',0,'antonia','Antonia','Siqueira da Silva','antonia@teste.com',0,1,'2020-08-24 16:02:39.000000'),(7,'pbkdf2_sha256$180000$ldUqvwrxxi0s$CK1Ecn+f0t9Yb3LP9XSFfFGWomIb+85u1llLS/tYXgo=','2020-08-24 20:18:16.681012',0,'pedro','Pedro','Luís Silva','teste@gmail.com.br',0,1,'2020-08-24 18:48:09.000000'),(8,'pbkdf2_sha256$180000$x06bUq0VhibT$qYMn6pRYoHQPIAceq7fgo1WvfkdminXpaXCvjxkx8Uw=','2020-08-24 20:10:57.359775',0,'luis','Luís','Mello','teste@gmail.com.br',0,1,'2020-08-24 18:52:41.000000'),(9,'pbkdf2_sha256$180000$dvgXvsfzde8r$VL4EqzawMScMUyPEiKrxI/L2uozpBd50n/P0UFYMuo4=',NULL,0,'joana','','','joana@gmail.com.br',0,1,'2020-08-26 10:17:08.456943');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_aluno`
--

DROP TABLE IF EXISTS `cadastro_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(255) NOT NULL,
  `anoingresso` varchar(20) NOT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `nomecompleto` varchar(255) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cadastro_aluno_campus_id_2f818245_fk_cadastro_campus_id` (`campus_id`),
  KEY `cadastro_aluno_usuario_id_68ef33fc` (`usuario_id`),
  KEY `cadastro_aluno_turma_id_fb40f567_fk_cadastro_turma_id` (`turma_id`),
  CONSTRAINT `cadastro_aluno_campus_id_2f818245_fk_cadastro_campus_id` FOREIGN KEY (`campus_id`) REFERENCES `cadastro_campus` (`id`),
  CONSTRAINT `cadastro_aluno_turma_id_fb40f567_fk_cadastro_turma_id` FOREIGN KEY (`turma_id`) REFERENCES `cadastro_turma` (`id`),
  CONSTRAINT `cadastro_aluno_usuario_id_68ef33fc_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_aluno`
--

LOCK TABLES `cadastro_aluno` WRITE;
/*!40000 ALTER TABLE `cadastro_aluno` DISABLE KEYS */;
INSERT INTO `cadastro_aluno` VALUES (1,'789456','2020',1,2,'Maria do Carmo Rosa',1),(2,'142536','2020',1,6,'Antonia Siqueira da Silva',2),(3,'965874','2020',1,5,'Carlos Antônio dos Santos',3),(4,'123654','2020',1,4,'José Silva da Costa',1),(5,'654917','2020',1,7,'Pedro Luis Silva',2),(6,'147852','2020',1,8,'Luís Mello',3);
/*!40000 ALTER TABLE `cadastro_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_aluno_disciplina`
--

DROP TABLE IF EXISTS `cadastro_aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_aluno_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cadastro_aluno_disciplina_aluno_id_disciplina_id_e7026d72_uniq` (`aluno_id`,`disciplina_id`),
  KEY `cadastro_aluno_disci_disciplina_id_0ae7e4b4_fk_cadastro_` (`disciplina_id`),
  CONSTRAINT `cadastro_aluno_disci_disciplina_id_0ae7e4b4_fk_cadastro_` FOREIGN KEY (`disciplina_id`) REFERENCES `cadastro_disciplina` (`id`),
  CONSTRAINT `cadastro_aluno_disciplina_aluno_id_66377bbf_fk_cadastro_aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `cadastro_aluno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_aluno_disciplina`
--

LOCK TABLES `cadastro_aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `cadastro_aluno_disciplina` DISABLE KEYS */;
INSERT INTO `cadastro_aluno_disciplina` VALUES (1,2,2),(2,2,3),(3,2,4),(4,3,1),(5,4,3),(6,4,4),(9,5,1),(7,5,2),(10,5,3),(11,5,4),(12,6,2),(13,6,5),(14,6,6);
/*!40000 ALTER TABLE `cadastro_aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_campus`
--

DROP TABLE IF EXISTS `cadastro_campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campus` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_campus`
--

LOCK TABLES `cadastro_campus` WRITE;
/*!40000 ALTER TABLE `cadastro_campus` DISABLE KEYS */;
INSERT INTO `cadastro_campus` VALUES (1,'São José dos Campos');
/*!40000 ALTER TABLE `cadastro_campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_curso`
--

DROP TABLE IF EXISTS `cadastro_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_curso`
--

LOCK TABLES `cadastro_curso` WRITE;
/*!40000 ALTER TABLE `cadastro_curso` DISABLE KEYS */;
INSERT INTO `cadastro_curso` VALUES (1,'Interdisciplinar em Ciência e Tecnologia'),(2,'Engenharia da Computação'),(3,'Engenharia de Materiais');
/*!40000 ALTER TABLE `cadastro_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_disciplina`
--

DROP TABLE IF EXISTS `cadastro_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disciplina` varchar(70) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_disciplina`
--

LOCK TABLES `cadastro_disciplina` WRITE;
/*!40000 ALTER TABLE `cadastro_disciplina` DISABLE KEYS */;
INSERT INTO `cadastro_disciplina` VALUES (1,'Circuitos digitais','2020156098'),(2,'Álgebra Linear','2020152475'),(3,'Algoritmos em Bioinformática','2020155414'),(4,'Fenômenos do Contínuo','2020154348'),(5,'Circuitos Elétricos','2020155903'),(6,'Análise de Sinais','2020155132');
/*!40000 ALTER TABLE `cadastro_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_professor`
--

DROP TABLE IF EXISTS `cadastro_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cracha` varchar(255) NOT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `nomecompleto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cadastro_professor_campus_id_79356c5f_fk_cadastro_campus_id` (`campus_id`),
  KEY `cadastro_professor_usuario_id_098cfe9c` (`usuario_id`),
  CONSTRAINT `cadastro_professor_campus_id_79356c5f_fk_cadastro_campus_id` FOREIGN KEY (`campus_id`) REFERENCES `cadastro_campus` (`id`),
  CONSTRAINT `cadastro_professor_usuario_id_098cfe9c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_professor`
--

LOCK TABLES `cadastro_professor` WRITE;
/*!40000 ALTER TABLE `cadastro_professor` DISABLE KEYS */;
INSERT INTO `cadastro_professor` VALUES (1,'1234567',1,3,'Professor Unifesp');
/*!40000 ALTER TABLE `cadastro_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_professor_disciplina`
--

DROP TABLE IF EXISTS `cadastro_professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_professor_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cadastro_professor_disci_professor_id_disciplina__e0560272_uniq` (`professor_id`,`disciplina_id`),
  KEY `cadastro_professor_d_disciplina_id_d8d0819e_fk_cadastro_` (`disciplina_id`),
  CONSTRAINT `cadastro_professor_d_disciplina_id_d8d0819e_fk_cadastro_` FOREIGN KEY (`disciplina_id`) REFERENCES `cadastro_disciplina` (`id`),
  CONSTRAINT `cadastro_professor_d_professor_id_0f38a1d6_fk_cadastro_` FOREIGN KEY (`professor_id`) REFERENCES `cadastro_professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_professor_disciplina`
--

LOCK TABLES `cadastro_professor_disciplina` WRITE;
/*!40000 ALTER TABLE `cadastro_professor_disciplina` DISABLE KEYS */;
INSERT INTO `cadastro_professor_disciplina` VALUES (1,1,1);
/*!40000 ALTER TABLE `cadastro_professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_turma`
--

DROP TABLE IF EXISTS `cadastro_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastro_turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma` varchar(70) NOT NULL,
  `periodo` varchar(50) NOT NULL,
  `ano` varchar(50) NOT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cadastro_turma_campus_id_7ad21e84_fk_cadastro_campus_id` (`campus_id`),
  KEY `cadastro_turma_curso_id_2bb22b55_fk_cadastro_curso_id` (`curso_id`),
  CONSTRAINT `cadastro_turma_campus_id_7ad21e84_fk_cadastro_campus_id` FOREIGN KEY (`campus_id`) REFERENCES `cadastro_campus` (`id`),
  CONSTRAINT `cadastro_turma_curso_id_2bb22b55_fk_cadastro_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cadastro_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_turma`
--

LOCK TABLES `cadastro_turma` WRITE;
/*!40000 ALTER TABLE `cadastro_turma` DISABLE KEYS */;
INSERT INTO `cadastro_turma` VALUES (1,'IA','Integral','2020',1,1),(2,'IB','Integral','2020',1,1),(3,'I','Integral','2020',1,2);
/*!40000 ALTER TABLE `cadastro_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-08-23 20:57:59.371734','3','tutorplagio.unifesp.br/',1,'[{\"added\": {}}]',5,1),(2,'2020-08-23 20:58:01.534354','1','Google',1,'[{\"added\": {}}]',11,1),(3,'2020-08-23 20:59:43.978539','1','Google',2,'[]',11,1),(4,'2020-08-23 21:01:54.092178','1','Google',2,'[]',11,1),(5,'2020-08-23 21:16:08.514385','3','tutorplagio.unifesp.br',2,'[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]',5,1),(6,'2020-08-23 21:16:29.177264','1','Google',2,'[]',11,1),(7,'2020-08-23 21:18:55.085242','1','google',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(8,'2020-08-23 21:21:47.447786','2','maria',1,'[{\"added\": {}}]',4,1),(9,'2020-08-23 21:22:06.705456','2','maria',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(10,'2020-08-23 21:23:37.159805','1','Interdisciplinar em Ciência e Tecnologia',1,'[{\"added\": {}}]',26,1),(11,'2020-08-23 21:23:45.033212','1','São José dos Campos',1,'[{\"added\": {}}]',25,1),(12,'2020-08-23 21:23:46.971584','1','IA',1,'[{\"added\": {}}]',30,1),(13,'2020-08-23 21:24:02.888992','1','maria, 789456',1,'[{\"added\": {}}]',29,1),(14,'2020-08-23 21:24:08.407703','1','maria, 789456',2,'[{\"changed\": {\"fields\": [\"Campus\"]}}]',29,1),(15,'2020-08-23 21:24:56.074585','1','google',2,'[]',11,1),(16,'2020-08-23 21:27:26.562800','1','Ética',1,'[{\"added\": {}}]',13,1),(17,'2020-08-23 21:28:05.730268','1','Digamos que você tenha encontrado dois artigos sobre a mesma pesquisa: o artigo A é a descoberta original; O artigo B é uma análise que faz referência ao artigo A. Você usa uma seção da análise do art',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Artigo A\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Artigo B\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Os dois artigos A e B\"}}]',19,1),(18,'2020-08-23 21:28:33.346622','1','PLONSKI, Guilherme Ary. Bases para um movimento pela inovação tecnológica no Brasil. São Paulo em perspectiva, v. 19, n. 1, p. 25-33, 2005.',1,'[{\"added\": {}}]',22,1),(19,'2020-08-23 21:28:57.387443','2','Paráfrase',1,'[{\"added\": {}}]',13,1),(20,'2020-08-23 21:29:44.615536','2','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(21,'2020-08-23 21:30:40.481743','1','Qual o seu nível de conhecimento sobre plágio?',1,'[{\"added\": {}}]',16,1),(22,'2020-08-23 21:36:46.961161','1','Google',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(23,'2020-08-24 14:07:11.268077','3','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(24,'2020-08-24 14:08:20.889167','4','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(25,'2020-08-24 14:09:26.928519','2','MATIAS-PEREIRA, J.; KRUGLIANSKAS, I. Innovation management: the law of technological innovation as a tool to support industrial and technological policies in Brazil. RAE eletrônica, v. 4, 2005.',1,'[{\"added\": {}}]',22,1),(26,'2020-08-24 14:10:07.668037','5','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(27,'2020-08-24 14:11:33.040079','6','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(28,'2020-08-24 14:12:27.006506','3','BESSANT, John; TIDD, Joe. Inovação e empreendedorismo. Bookman Editora, 2009.',1,'[{\"added\": {}}]',22,1),(29,'2020-08-24 14:13:23.286880','7','Reescreva o texto utilizando a citação indireta.',1,'[{\"added\": {}}]',23,1),(30,'2020-08-24 14:15:57.932326','1','Digamos que você tenha encontrado dois artigos sobre a mesma pesquisa: o artigo A é a descoberta original; O artigo B é uma análise que faz referência ao artigo A. Você usa uma seção da análise do art',2,'[{\"changed\": {\"fields\": [\"Explica\\u00e7\\u00e3o\", \"Ordem da resposta\"]}}]',19,1),(31,'2020-08-24 14:19:37.399093','3','Cópia',1,'[{\"added\": {}}]',13,1),(32,'2020-08-24 14:20:20.309532','8','Ao fazer uma checagem de plágio com um programa detector de similaridade, importa a porcentagem de cópia encontrada no documento?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Sim\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"N\\u00e3o\"}}]',19,1),(33,'2020-08-24 14:21:20.337733','9','É aceitável copiar e colar uma frase escrita por outra pessoa em seu artigo e simplesmente adicionar aspas ao redor dela.',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Sim\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"N\\u00e3o\"}}]',19,1),(34,'2020-08-24 14:22:08.141795','4','Colaboração inapropriada',1,'[{\"added\": {}}]',13,1),(35,'2020-08-24 14:30:24.015137','10','Para um trabalho de uma disciplina que os alunos devem realizar individualmente, dois alunos decidem trabalhar juntos. Um compila notas de pesquisa enquanto o outro identifica as principais descoberta',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Colabora\\u00e7\\u00e3o anti\\u00e9tica\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Pl\\u00e1gio\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Colabora\\u00e7\\u00e3o anti\\u00e9tica e pl\\u00e1gio\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Colabora\\u00e7\\u00e3o aceit\\u00e1vel\"}}]',19,1),(36,'2020-08-24 14:31:11.392703','5','Consequências',1,'[{\"added\": {}}]',13,1),(37,'2020-08-24 14:33:07.539106','11','Quais das seguintes opções são consequências reais do plágio?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Reputa\\u00e7\\u00e3o arruinada\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Ser suspenso ou expulso da escola\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Perder o emprego\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Ser processado\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"Todas as alternativas\"}}]',19,1),(38,'2020-08-24 14:35:17.590235','6','Autoplágio',1,'[{\"added\": {}}]',13,1),(39,'2020-08-24 14:35:57.037548','12','Eu posso entregar um trabalho que foi feito originalmente para outra disciplina, desde que eu tenha escrito.',1,'[{\"added\": {}}]',21,1),(40,'2020-08-24 14:36:49.696612','13','Tenho muito pouco tempo para escrever um trabalho para uma disciplina. Escrevi um trabalho sobre um tópico semelhante no ano passado. Posso usar parte dele para minha nova tarefa.',1,'[{\"added\": {}}]',21,1),(41,'2020-08-24 14:37:28.100267','7','Conhecimento Comum',1,'[{\"added\": {}}]',13,1),(42,'2020-08-24 14:38:10.410996','14','Fatos como: Getúlio Vargas foi presidente do Brasil, não precisa ser citado.',1,'[{\"added\": {}}]',21,1),(43,'2020-08-24 14:38:17.960605','14','Fatos como: Getúlio Vargas foi presidente do Brasil, não precisa ser citado.',2,'[{\"changed\": {\"fields\": [\"Correta\"]}}]',21,1),(44,'2020-08-24 14:42:26.973619','15','Informações na web são de conhecimento comum, então posso usá-las sem citá-las.',1,'[{\"added\": {}}]',21,1),(45,'2020-08-24 14:44:20.236337','8','Referência',1,'[{\"added\": {}}]',13,1),(46,'2020-08-24 14:44:51.227804','16','Preciso continuar citando o autor em todo o meu artigo sempre que uso suas ideias.',1,'[{\"added\": {}}]',21,1),(47,'2020-08-24 14:45:55.414987','17','Imagens, gráficos, tabelas e estatísticas de outro autor precisam ser citados.',1,'[{\"added\": {}}]',21,1),(48,'2020-08-24 14:47:17.946207','18','Quero usar uma imagem criada por outra pessoa no meu projeto. Se eu usar um programa gráfico para alterar a imagem, não preciso pedir permissão ao criador original.',1,'[{\"added\": {}}]',21,1),(49,'2020-08-24 14:48:00.390438','18','Quero usar uma imagem criada por outra pessoa no meu projeto. Se eu usar um programa gráfico para alterar a imagem, não preciso pedir permissão ao criador original.',2,'[{\"changed\": {\"fields\": [\"Explica\\u00e7\\u00e3o\"]}}]',21,1),(50,'2020-08-24 14:49:44.880864','19','Quando eu parafrasear o que outra pessoa escreveu, não tenho que inserir uma citação no texto e incluir a citação na minha lista de referências.',1,'[{\"added\": {}}]',21,1),(51,'2020-08-24 14:59:31.903563','1','Qual o seu nível de conhecimento sobre plágio?',2,'[{\"changed\": {\"fields\": [\"Descri\\u00e7\\u00e3o\", \"Marca de aprova\\u00e7\\u00e3o\"]}}]',16,1),(52,'2020-08-24 15:36:25.349930','1','Qual o seu nível de conhecimento sobre plágio?',2,'[]',16,1),(53,'2020-08-24 15:38:13.909107','3','professor',1,'[{\"added\": {}}]',4,1),(54,'2020-08-24 15:38:30.868486','3','professor',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(55,'2020-08-24 15:40:35.487601','1','professor',1,'[{\"added\": {}}]',3,1),(56,'2020-08-24 15:41:36.124784','3','professor',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(57,'2020-08-24 15:43:58.422871','3','professor',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(58,'2020-08-24 15:46:23.726281','1','Circuitos digitais',1,'[{\"added\": {}}]',27,1),(59,'2020-08-24 15:46:27.957256','1','1234567, professor',1,'[{\"added\": {}}]',28,1),(60,'2020-08-24 15:46:58.573149','2','Engenharia da Computação',1,'[{\"added\": {}}]',26,1),(61,'2020-08-24 15:47:19.103813','3','Engenharia de Materiais',1,'[{\"added\": {}}]',26,1),(62,'2020-08-24 16:00:37.556309','4','jose',1,'[{\"added\": {}}]',4,1),(63,'2020-08-24 16:00:53.723460','4','jose',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(64,'2020-08-24 16:01:15.684941','5','carlos',1,'[{\"added\": {}}]',4,1),(65,'2020-08-24 16:02:12.092122','5','carlos',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(66,'2020-08-24 16:02:40.003858','6','antonia',1,'[{\"added\": {}}]',4,1),(67,'2020-08-24 16:03:10.590966','6','antonia',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(68,'2020-08-24 18:39:55.988246','2','IB',1,'[{\"added\": {}}]',30,1),(69,'2020-08-24 18:41:55.566154','2','Álgebra Linear',1,'[{\"added\": {}}]',27,1),(70,'2020-08-24 18:42:36.255046','3','Algoritmos em Bioinformática',1,'[{\"added\": {}}]',27,1),(71,'2020-08-24 18:43:08.771229','4','Fenômenos do Contínuo',1,'[{\"added\": {}}]',27,1),(72,'2020-08-24 18:43:13.478200','2','antonia, 142536',1,'[{\"added\": {}}]',29,1),(73,'2020-08-24 18:44:31.863913','3','I',1,'[{\"added\": {}}]',30,1),(74,'2020-08-24 18:45:04.004275','3','carlos, 965874',1,'[{\"added\": {}}]',29,1),(75,'2020-08-24 18:45:51.656319','4','jose, 123654',1,'[{\"added\": {}}]',29,1),(76,'2020-08-24 18:48:10.324616','7','pedro',1,'[{\"added\": {}}]',4,1),(77,'2020-08-24 18:49:29.469584','5','Circuitos Elétricos',1,'[{\"added\": {}}]',27,1),(78,'2020-08-24 18:50:23.136191','6','Análise de Sinais',1,'[{\"added\": {}}]',27,1),(79,'2020-08-24 18:50:26.593319','5','pedro, 654917',1,'[{\"added\": {}}]',29,1),(80,'2020-08-24 18:50:43.528281','5','pedro, 654917',2,'[{\"changed\": {\"fields\": [\"Disciplina\"]}}]',29,1),(81,'2020-08-24 18:52:42.138637','8','luis',1,'[{\"added\": {}}]',4,1),(82,'2020-08-24 18:53:23.443473','6','luis, 147852',1,'[{\"added\": {}}]',29,1),(83,'2020-08-24 18:54:26.283362','8','luis',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(84,'2020-08-24 18:55:20.726820','7','pedro',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(85,'2020-08-24 19:00:00.802756','1','Qual o seu nível de conhecimento sobre plágio?',2,'[{\"changed\": {\"fields\": [\"Quest\\u00f5es Max\"]}}]',16,1),(86,'2020-08-24 20:34:53.098118','20','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno \\u00e9 pl\\u00e1gio.\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno n\\u00e3o \\u00e9 pl\\u00e1gio.\"}}]',19,1),(87,'2020-08-24 20:35:16.741263','20','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',2,'[{\"changed\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno \\u00e9 pl\\u00e1gio.\", \"fields\": [\"Correta\"]}}, {\"changed\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno n\\u00e3o \\u00e9 pl\\u00e1gio.\", \"fields\": [\"Correta\"]}}]',19,1),(88,'2020-08-24 20:37:40.084785','21','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno n\\u00e3o \\u00e9 pl\\u00e1gio.\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno \\u00e9 pl\\u00e1gio.\"}}]',19,1),(89,'2020-08-24 20:39:26.672405','22','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno n\\u00e3o \\u00e9 pl\\u00e1gio.\"}}, {\"added\": {\"name\": \"Resposta\", \"object\": \"O texto do aluno \\u00e9 plagio.\"}}]',19,1),(90,'2020-08-24 20:39:38.224744','20','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',2,'[]',19,1),(91,'2020-08-24 20:39:45.208627','21','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',2,'[]',19,1),(92,'2020-08-24 20:39:52.655884','22','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?',2,'[{\"changed\": {\"fields\": [\"Ordem da resposta\"]}}]',19,1),(93,'2020-08-24 20:40:08.476814','1','Qual o seu nível de conhecimento sobre plágio?',2,'[]',16,1),(94,'2020-08-25 14:36:37.261547','1','professor',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(95,'2020-08-25 14:39:15.038197','1','Qual o seu nível de conhecimento sobre plágio?',2,'[]',16,3),(96,'2020-08-25 17:32:27.957336','1','Google',2,'[]',11,1),(97,'2020-08-25 17:36:50.900477','1','Google',2,'[]',11,1),(98,'2020-08-25 17:44:12.835555','1','Google',2,'[]',11,1),(99,'2020-08-25 17:44:27.407221','3','tutorplagio.unifesp.br/',2,'[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]',5,1),(100,'2020-08-25 17:44:38.853264','1','Google',2,'[]',11,1),(101,'2020-08-26 10:30:18.572962','1','Google',2,'[]',11,1),(102,'2020-08-26 10:34:49.320020','3','tutorplagio.unifesp.br',2,'[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]',5,1),(103,'2020-08-26 10:35:08.817688','1','Google',2,'[]',11,1),(104,'2020-08-26 10:46:57.123183','3','tutorplagio.unifesp.br',3,'',5,1),(105,'2020-08-26 10:47:26.563634','2','tutorplagio.unifesp.br',2,'[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]',5,1),(106,'2020-08-26 10:48:47.982877','2','tutorplagio.unifesp.br',2,'[]',5,1),(107,'2020-08-26 10:49:05.358244','1','Google',2,'[{\"changed\": {\"fields\": [\"Sites\"]}}]',11,1),(108,'2020-08-26 10:56:06.960975','1','Google',2,'[]',11,1),(109,'2020-08-26 13:28:20.328161','1','Google',2,'[{\"changed\": {\"fields\": [\"Secret key\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(29,'cadastro','aluno'),(25,'cadastro','campus'),(26,'cadastro','curso'),(27,'cadastro','disciplina'),(28,'cadastro','professor'),(30,'cadastro','turma'),(6,'contenttypes','contenttype'),(23,'essay','essay_question'),(22,'essay','referencia'),(20,'multichoice','answer'),(19,'multichoice','mcquestion'),(13,'quiz','category'),(14,'quiz','progress'),(15,'quiz','question'),(16,'quiz','quiz'),(17,'quiz','sitting'),(18,'quiz','subcategory'),(7,'sessions','session'),(5,'sites','site'),(24,'siteTutorial','contato'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken'),(21,'true_false','tf_question');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-23 20:55:02.579708'),(2,'auth','0001_initial','2020-08-23 20:55:03.087339'),(3,'account','0001_initial','2020-08-23 20:55:04.691160'),(4,'account','0002_email_max_length','2020-08-23 20:55:05.181125'),(5,'admin','0001_initial','2020-08-23 20:55:05.270235'),(6,'admin','0002_logentry_remove_auto_add','2020-08-23 20:55:05.583861'),(7,'admin','0003_logentry_add_action_flag_choices','2020-08-23 20:55:05.611964'),(8,'contenttypes','0002_remove_content_type_name','2020-08-23 20:55:05.861290'),(9,'auth','0002_alter_permission_name_max_length','2020-08-23 20:55:06.014239'),(10,'auth','0003_alter_user_email_max_length','2020-08-23 20:55:06.183860'),(11,'auth','0004_alter_user_username_opts','2020-08-23 20:55:06.216706'),(12,'auth','0005_alter_user_last_login_null','2020-08-23 20:55:06.343646'),(13,'auth','0006_require_contenttypes_0002','2020-08-23 20:55:06.350294'),(14,'auth','0007_alter_validators_add_error_messages','2020-08-23 20:55:06.381957'),(15,'auth','0008_alter_user_username_max_length','2020-08-23 20:55:06.547940'),(16,'auth','0009_alter_user_last_name_max_length','2020-08-23 20:55:06.720134'),(17,'auth','0010_alter_group_name_max_length','2020-08-23 20:55:06.910756'),(18,'auth','0011_update_proxy_permissions','2020-08-23 20:55:06.944144'),(19,'cadastro','0001_initial','2020-08-23 20:55:07.633695'),(20,'cadastro','0002_auto_20200821_1836','2020-08-23 20:55:10.519366'),(21,'quiz','0001_initial','2020-08-23 20:55:11.818546'),(22,'essay','0001_initial','2020-08-23 20:55:13.369114'),(23,'multichoice','0001_initial','2020-08-23 20:55:13.938555'),(24,'quiz','0002_auto_20200823_1948','2020-08-23 20:55:16.941254'),(25,'sessions','0001_initial','2020-08-23 20:55:17.026795'),(26,'siteTutorial','0001_initial','2020-08-23 20:55:17.150178'),(27,'sites','0001_initial','2020-08-23 20:55:17.234261'),(28,'sites','0002_alter_domain_unique','2020-08-23 20:55:17.279997'),(29,'socialaccount','0001_initial','2020-08-23 20:55:17.852870'),(30,'socialaccount','0002_token_max_lengths','2020-08-23 20:55:18.838992'),(31,'socialaccount','0003_extra_data_default_dict','2020-08-23 20:55:18.870446'),(32,'true_false','0001_initial','2020-08-23 20:55:19.017168'),(33,'quiz','0002_auto_20200823_2104','2020-08-23 21:04:46.367176'),(34,'quiz','0002_auto_20200826_1339','2020-08-26 13:40:16.726859');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('33c86cyo8nchr43vdl20jo36hjs9p61b','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-07 16:10:58.394085'),('671xjitulgqcw7a7v7eepqrka4y7fjyz','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-09 17:34:26.901607'),('951uupr1wem5atfjejzvydhryve78sjz','NGYyNDY0ZTkzYThlZjNiMzg3MDJhM2YwYjY3NmJmY2YzOGVmZjdlNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiU244RWlyTXRFRDNmIl19','2020-09-09 11:34:07.444609'),('a3xclmtw1lh5ox4f1g247wxwi03q1f3g','MzkxMTk2YjdlNGUwNWJmNjU5ZWQ5ODEwMDViYTAwMTU1ZmY2MTEzZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiSE84M0hDVVNSbk1nIl19','2020-09-09 11:22:20.227057'),('c5ys0y3mape5onwob33ov6mds6wnwsaa','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-11 14:06:41.791990'),('dwge308tt2a1gl06xqo2eoj8czwsml67','MTk2ZjNmYjAxYzhiZmYyZDZkYTZlNmI1MDhjYTM1NzdhNTIzMTFlOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMzZjMzM5ZjRmYmEwZDY1MzMyMDk4NTk0NWRhZWYxMmU4ZmYzMDgzIn0=','2020-09-06 21:15:32.433175'),('faj9b6soppwf9c58plobiq5v5az3zgt0','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-11 14:52:38.451982'),('gh0e5d4ur0x3z1c71mqjzev1raye7f04','MTk2ZjNmYjAxYzhiZmYyZDZkYTZlNmI1MDhjYTM1NzdhNTIzMTFlOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMzZjMzM5ZjRmYmEwZDY1MzMyMDk4NTk0NWRhZWYxMmU4ZmYzMDgzIn0=','2020-09-07 20:04:41.279344'),('iv9wp0mfmcqfs9jh4fgw6pbcvwnydxmd','MzlmNWNmODg3NzY3ZjIyZmM2MTRiODNmYTU2ZjMxYjFiMTBkYzUwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMmI5ZjZlYTI0ZDc1MzdiZDBlMmU3Njc4ZGFmNTZiMzE4MDJhMmNmIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-15 16:42:19.415519'),('mg56joq55y0dasv3szctu9x866pwm201','YWExOTUyOGYyZDc5MmFjODQyMDZkZTU0YWIxMGYzMWUyNGExODI3Mzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWnlDVThIc1R3UWtoIl19','2020-09-09 11:22:45.564675'),('n7xjp1t1sphx0vdyeh808ekiu9p57uk6','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-07 15:42:12.106251'),('sbvua669hrl9vpacag755mlgjhwlhwzi','MDk0ZmU1NzYyY2UxY2I4MDUxMTJjYjE1OWFjMDhmZDcyMzRiZDRjMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZHYyOHlVMmk3ZkFnIl0sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMzZjMzM5ZjRmYmEwZDY1MzMyMDk4NTk0NWRhZWYxMmU4ZmYzMDgzIn0=','2020-09-23 15:29:17.224089'),('t7z52z1vcx2j12jpc0krbvbgpercppcm','NzlhZTYzNDE2MmNlMzk2MzU5MDFhMThjYzRjOGI3OGVlZWIwZGFiYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NGE3OWY3NzAyZGYxNGM1NjlhYjA4ZjNmMGU5M2VkYzMxMjVlYmUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2020-09-08 14:37:03.112979'),('vmt5uolnpfibbi9cubo9hgwnxahhr8j7','MWNiNTllMWQ0MmE0MGUxOTI4NGQ0ZGI4ZDlmY2RmMWY5MmZiZjIwNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiV1RLNjdJYjF6N05TIl19','2020-09-09 10:49:17.252611'),('x2od9z94frm7309z5fy50ay9me53qgle','OTU2MzA4ZDQ5NjA2YjU1ZTY2MzE2ZDM1ZjMxY2VmMGJlNmU1ZWQzNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvdG9waWNvMSIsInByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTVJIMW9qTktSQzB5Il19','2020-09-08 17:30:46.743915'),('xcqij1orfl1vri1zz54z4sakpv0ovsyq','ZTRjM2JhYTY0ZmE2MzEwNGI1N2JiNDdiZTkxOTgwYWQ0YWE3ZWRjMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7Im5leHQiOiIvdG9waWNvMSIsInByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMEh5WHBiSUFhY3B3Il19','2020-09-08 11:49:28.812537');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'tutorplagio.unifesp.br','tutorplagio.unifesp.br');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay_essay_question`
--

DROP TABLE IF EXISTS `essay_essay_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_essay_question` (
  `question_ptr_id` int(11) NOT NULL,
  `tipo_citacao` varchar(30) DEFAULT NULL,
  `original_text` longtext,
  `citacao1` varchar(1000) DEFAULT NULL,
  `citacao2` varchar(1000) DEFAULT NULL,
  `referencia_id` int(11) NOT NULL,
  PRIMARY KEY (`question_ptr_id`),
  KEY `essay_essay_question_referencia_id_d9686aa0_fk_essay_ref` (`referencia_id`),
  CONSTRAINT `essay_essay_question_question_ptr_id_380e7c9a_fk_quiz_ques` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`),
  CONSTRAINT `essay_essay_question_referencia_id_d9686aa0_fk_essay_ref` FOREIGN KEY (`referencia_id`) REFERENCES `essay_referencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_essay_question`
--

LOCK TABLES `essay_essay_question` WRITE;
/*!40000 ALTER TABLE `essay_essay_question` DISABLE KEYS */;
INSERT INTO `essay_essay_question` VALUES (2,'indireta','Toda inovação envolve mudanças. A inovação tecnológica é caracterizada pela presença de mudanças\r\ntecnológicas em produtos (bens ou serviços) oferecidos à sociedade, ou na forma pela qual produtos são criados e oferecidos (que é usualmente denominada de inovação no processo).','Plonski (2005)','(PLONSKI, 2005)',1),(3,'indireta','Uma outra classificação, de interesse para as políticas públicas – incluindo as de fomento à inovação – e para a gestão, busca lidar com o espectro de inovações tecnológicas no que se refere ao grau da mudança envolvida. Essa grande variedade leva à conhecida categorização das inovações em incrementais, radicais ou transformadoras (também chamadas de revolucionárias).','Plonski (2005)','(PLONSKI, 2005)',1),(4,'indireta','Originário dos anos 50, mas ainda em voga, o número de patentes é um indicador problemático da inovação, mesmo para a de base tecnológica. Ao focalizar a invenção, contempla apenas uma etapa de um longo e complexo caminho de trazer uma boa ideia a uma condição de utilização extensiva pela sociedade, que é a essência do conceito de inovação. No mundo real, aliás, parcela expressiva das patentes é depositada justamente para inibir a inovação (por parte de concorrentes) ou para confundir\r\nos trabalhos de inteligência competitiva feitos por rivais.','Plonski (2005)','(PLONSKI, 2005)',1),(5,'indireta','Em primeiro lugar, a Lei de Inovação Tecnológica, ao buscar estabelecer um diálogo cada vez mais intenso entre as instituições produtoras de bens de conhecimento e as produtoras de bens e serviços, surge como mais um instrumento para facilitar a criação de uma cultura de inovação no País. Sua aprovação, entretanto, não é suficiente para mudar a realidade atual existente nesse campo. Observa-se que os instrumentos estão sendo disponibilizados, mas é preciso um maior envolvimento e compromisso por parte dos atores envolvidos no assunto. Inúmeras questões complexas não foram tratadas nesta lei, como a criação de mecanismos que permitam sua efetiva conexão com as políticas industrial e tecnológica, bem como a falta de flexibilidade de gestão das instituições de pesquisa, ou seja, a excessiva rigidez que prevalece na gestão de recursos humanos, financeiros e materiais.','Matias-Pereira e Kruglianskas (2005)','(MATIAS-PEREIRA; KRUGLIANSKAS, 2005)',2),(6,'indireta','Concluímos, assim, que cabe ao Estado orientar, apoiar e estimular o processo de inovação tecnológica no País, sem desconsiderar que a transformação da indústria é responsabilidade dela própria. Nesse contexto, a Lei de Inovação Tecnológica surge como um instrumento institucional relevante para apoiar as políticas industrial e tecnológica no Brasil.','Matias-Pereira e Kruglianskas (2005)','(MATIAS-PEREIRA; KRUGLIANSKAS, 2005)',2),(7,'indireta','Os contextos nacionais, regionais e setoriais podem influenciar significativamente na velocidade e na direção da inovação e do empreendedorismo em razão de disponibilidade ou escassez de recursos, talento, oportunidades, infraestrutura e suporte. Contudo, apesar do contexto influenciar a velocidade e a direção, ele não determina os resultados. A educação, capacitação, experiência e aptidão dos indivíduos também têm um efeito profundo nos objetivos e resultados da inovação e do empreendedorismo.','Bessant e Tidd (2009)','(BESSANT; TIDD, 2009)',3);
/*!40000 ALTER TABLE `essay_essay_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay_referencia`
--

DROP TABLE IF EXISTS `essay_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_referencia`
--

LOCK TABLES `essay_referencia` WRITE;
/*!40000 ALTER TABLE `essay_referencia` DISABLE KEYS */;
INSERT INTO `essay_referencia` VALUES (1,'PLONSKI, Guilherme Ary. Bases para um movimento pela inovação tecnológica no Brasil. São Paulo em perspectiva, v. 19, n. 1, p. 25-33, 2005.'),(2,'MATIAS-PEREIRA, J.; KRUGLIANSKAS, I. Innovation management: the law of technological innovation as a tool to support industrial and technological policies in Brazil. RAE eletrônica, v. 4, 2005.'),(3,'BESSANT, John; TIDD, Joe. Inovação e empreendedorismo. Bookman Editora, 2009.');
/*!40000 ALTER TABLE `essay_referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multichoice_answer`
--

DROP TABLE IF EXISTS `multichoice_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multichoice_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `multichoice_answer_question_id_59e030d4_fk_multichoi` (`question_id`),
  CONSTRAINT `multichoice_answer_question_id_59e030d4_fk_multichoi` FOREIGN KEY (`question_id`) REFERENCES `multichoice_mcquestion` (`question_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multichoice_answer`
--

LOCK TABLES `multichoice_answer` WRITE;
/*!40000 ALTER TABLE `multichoice_answer` DISABLE KEYS */;
INSERT INTO `multichoice_answer` VALUES (1,'Artigo A',0,1),(2,'Artigo B',0,1),(3,'Os dois artigos A e B',1,1),(4,'Sim',0,8),(5,'Não',1,8),(6,'Sim',0,9),(7,'Não',1,9),(8,'Colaboração antiética',0,10),(9,'Plágio',0,10),(10,'Colaboração antiética e plágio',1,10),(11,'Colaboração aceitável',0,10),(12,'Reputação arruinada',0,11),(13,'Ser suspenso ou expulso da escola',0,11),(14,'Perder o emprego',0,11),(15,'Ser processado',0,11),(16,'Todas as alternativas',1,11),(17,'O texto do aluno é plágio.',1,20),(18,'O texto do aluno não é plágio.',0,20),(19,'O texto do aluno não é plágio.',1,21),(20,'O texto do aluno é plágio.',0,21),(21,'O texto do aluno não é plágio.',1,22),(22,'O texto do aluno é plagio.',0,22);
/*!40000 ALTER TABLE `multichoice_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multichoice_mcquestion`
--

DROP TABLE IF EXISTS `multichoice_mcquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multichoice_mcquestion` (
  `question_ptr_id` int(11) NOT NULL,
  `answer_order` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`question_ptr_id`),
  CONSTRAINT `multichoice_mcquesti_question_ptr_id_bfc85403_fk_quiz_ques` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multichoice_mcquestion`
--

LOCK TABLES `multichoice_mcquestion` WRITE;
/*!40000 ALTER TABLE `multichoice_mcquestion` DISABLE KEYS */;
INSERT INTO `multichoice_mcquestion` VALUES (1,'random'),(8,NULL),(9,'random'),(10,'random'),(11,'random'),(20,'random'),(21,'random'),(22,'random');
/*!40000 ALTER TABLE `multichoice_mcquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_category`
--

DROP TABLE IF EXISTS `quiz_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_category`
--

LOCK TABLES `quiz_category` WRITE;
/*!40000 ALTER TABLE `quiz_category` DISABLE KEYS */;
INSERT INTO `quiz_category` VALUES (6,'Autoplágio'),(4,'Colaboração inapropriada'),(7,'Conhecimento Comum'),(5,'Consequências'),(3,'Cópia'),(1,'Ética'),(2,'Paráfrase'),(8,'Referência');
/*!40000 ALTER TABLE `quiz_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_progress`
--

DROP TABLE IF EXISTS `quiz_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(1024) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `quiz_progress_user_id_af390dea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_progress`
--

LOCK TABLES `quiz_progress` WRITE;
/*!40000 ALTER TABLE `quiz_progress` DISABLE KEYS */;
INSERT INTO `quiz_progress` VALUES (1,'Paráfrase,5,22,Ética,6,6,Autoplágio,4,6,Colaboração inapropriada,1,3,Conhecimento Comum,6,9,Consequências,1,1,Cópia,6,12,Referência,1,7,',2),(2,'Ética,1,1,',1),(3,'Autoplágio,0,0,Colaboração inapropriada,0,0,Conhecimento Comum,0,0,Consequências,0,0,Cópia,0,0,Ética,0,0,Paráfrase,0,0,Referência,0,0,',3),(4,'Paráfrase,6,12,Cópia,9,11,Colaboração inapropriada,2,3,Consequências,1,2,Conhecimento Comum,5,5,Autoplágio,2,4,Ética,0,0,Referência,1,3,',5),(5,'Paráfrase,5,10,Cópia,4,6,Referência,1,4,Colaboração inapropriada,2,2,Autoplágio,6,6,Conhecimento Comum,0,0,Consequências,1,1,Ética,1,1,',6),(6,'Cópia,4,4,Paráfrase,5,7,Referência,1,2,Autoplágio,2,2,Conhecimento Comum,2,2,Consequências,1,1,Colaboração inapropriada,1,1,Ética,1,1,',8),(7,'Conhecimento Comum,2,3,Cópia,3,4,Autoplágio,2,3,Paráfrase,5,6,Referência,1,2,Ética,2,2,Colaboração inapropriada,0,0,Consequências,0,0,',7),(8,'Autoplágio,1,1,Colaboração inapropriada,1,1,Conhecimento Comum,1,1,Consequências,2,2,Cópia,6,7,Ética,1,1,Paráfrase,3,5,Referência,0,2,',4);
/*!40000 ALTER TABLE `quiz_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `figure` varchar(100) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `explanation` longtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_category_id_eeff11ec_fk_quiz_category_id` (`category_id`),
  KEY `quiz_question_sub_category_id_dd7303cb_fk_quiz_subcategory_id` (`sub_category_id`),
  CONSTRAINT `quiz_question_category_id_eeff11ec_fk_quiz_category_id` FOREIGN KEY (`category_id`) REFERENCES `quiz_category` (`id`),
  CONSTRAINT `quiz_question_sub_category_id_dd7303cb_fk_quiz_subcategory_id` FOREIGN KEY (`sub_category_id`) REFERENCES `quiz_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question` VALUES (1,'','Digamos que você tenha encontrado dois artigos sobre a mesma pesquisa: o artigo A é a descoberta original; O artigo B é uma análise que faz referência ao artigo A. Você usa uma seção da análise do artigo B. Qual artigo você cita?','O Artigol B nesta situação é chamado de \"fonte secundária\". As fontes secundárias devem ser usadas com moderação e principalmente em situações onde a fonte original é inacessível. Em sua citação, você fará referência ao Artigo A, seguido de “conforme citado no Artigo B”, fornecendo a atribuição adequada a ambas as fontes. No entanto, se você usar apenas informações do Artigo A, precisará apenas citar essa fonte.',1,NULL),(2,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(3,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(4,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(5,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(6,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(7,'','Reescreva o texto utilizando a citação indireta.','Para uma boa paráfrase você deve usar sinônimos para todas as palavras que não são genéricas, alterar a estrutura da frase, alterar a voz de ativa para passiva e vice-versa e alterar partes do texto mantendo o sentido do texto original.',2,NULL),(8,'','Ao fazer uma checagem de plágio com um programa detector de similaridade, importa a porcentagem de cópia encontrada no documento?','Mesmo algumas palavras ou parágrafos com citação imprópria podem ser considerados um ato de plágio, mas as consequências do plágio podem mudar em resposta à quantidade copiada.',3,NULL),(9,'','É aceitável copiar e colar uma frase escrita por outra pessoa em seu artigo e simplesmente adicionar aspas ao redor dela.','Para mostrar a atribuição adequada, um escritor deve colocar aspas ao redor da passagem citada e adicionar uma referência correspondente. Apenas adicionar aspas ao redor de um parágrafo NÃO é suficiente.',3,NULL),(10,'','Para um trabalho de uma disciplina que os alunos devem realizar individualmente, dois alunos decidem trabalhar juntos. Um compila notas de pesquisa enquanto o outro identifica as principais descobertas e ambos escrevem seus próprios artigos de pesquisa originais. Isto é:','Este é um exemplo de colaboração antiética e plágio. As tarefas individuais não envolvem colaboração, a menos que seja autorizado pelo professor. Uma pergunta que qualquer aluno deve se perguntar é: “Estou tentando passar o trabalho dos outros e assumir o crédito por ele como meu?” Essa situação fica clara a esse respeito. No caso , os alunos estão transmitindo a ideia de que as descobertas da pesquisa são seus próprios trabalhos originais, sem fornecer atribuição ao outro.',4,NULL),(11,'','Quais das seguintes opções são consequências reais do plágio?','Essas consequências demonstram que o plágio é um crime grave e deve ser evitado a todo custo. Existem vários casos na história recente de pessoas que plagiaram e tiveram suas reputações arruinadas porque roubaram o trabalho de outros. Este ato de roubo faz com que eles não pareçam confiáveis, uma vez que parece que eles não podem fazer seu próprio trabalho. Na educação, o trabalho original é de grande valor e, como o plágio e a trapaça dão àqueles que o praticam uma vantagem injusta sobre os outros alunos, as suspensões e expulsões são consequências comuns. O plágio pode levar empresas e outras organizações a tomar decisões erradas, o que pode resultar em perda de dinheiro ou prejuízo para os indivíduos que cometem o plágio. Portanto, essas organizações geralmente têm uma reclamação válida para processar ou apresentar queixa contra os plagiadores.',5,NULL),(12,'','Eu posso entregar um trabalho que foi feito originalmente para outra disciplina, desde que eu tenha escrito.','Não reutilize suas tarefas antigas. Você pode receber um trabalho parecido sobre um tema que você já escreveu anteriormente. Nunca envie o mesmo documento novamente, mesmo em um curso completamente diferente. Se você quiser abordar algumas das mesmas ideias em seu novo trabalho, então ... Fale com seu professor ou orientador. Seu professor pode dizer se é aceitável reutilizar ou retrabalhar partes de trabalhos antigos.',6,NULL),(13,'','Tenho muito pouco tempo para escrever um trabalho para uma disciplina. Escrevi um trabalho sobre um tópico semelhante no ano passado. Posso usar parte dele para minha nova tarefa.','Não reutilize suas tarefas antigas. Você pode receber um trabalho parecido sobre um tema que você já escreveu anteriormente. Nunca envie o mesmo documento novamente, mesmo em um curso completamente diferente. Se você quiser abordar algumas das mesmas ideias em seu novo trabalho, então ... Fale com seu professor ou orientador. Seu professor pode dizer se é aceitável reutilizar ou retrabalhar partes de trabalhos antigos',6,NULL),(14,'','Fatos como: Getúlio Vargas foi presidente do Brasil, não precisa ser citado.','Nomes de heróis ou eventos famosos da história da nação que são lembrados ou comemorados não precisam ser citados.',7,NULL),(15,'','Informações na web são de conhecimento comum, então posso usá-las sem citá-las.','Copiar e colar conteúdo encontrado na web em um trabalho que você produziu sem receber a devida permissão ou fornecer a citação apropriada é plágio. Essas atividades são muito comuns atualmente na sociedade, apesar de sua popularidade, são consideradas plágio.',7,NULL),(16,'','Preciso continuar citando o autor em todo o meu artigo sempre que uso suas ideias.','É necessário citar o autor sempre que usar suas ideias.',8,NULL),(17,'','Imagens, gráficos, tabelas e estatísticas de outro autor precisam ser citados.','Usar imagens, tabelas, vídeos, músicas, código-fonte de computador, expressões matemáticas e obras artísticas em um trabalho que você produziu sem receber a devida permissão ou fornecer a citação apropriada é plágio.',8,NULL),(18,'','Quero usar uma imagem criada por outra pessoa no meu projeto. Se eu usar um programa gráfico para alterar a imagem, não preciso pedir permissão ao criador original.','Imagens mesmo que editadas e outros tipos de mídia encontradas na internet precisam ser citadas assim como textos. Mesmo que estejam disponíveis de graça ou de fácil download, você ainda precisa citar. Verifique as permissões de direitos autorais quando for usar este tipo de mídia para mais instruções.',3,NULL),(19,'','Quando eu parafrasear o que outra pessoa escreveu, não tenho que inserir uma citação no texto e incluir a citação na minha lista de referências.','Para parafrasear, você deve reescrever ou resumir as palavras ou ideias de outras pessoas em suas próprias palavras e dar crédito citando e referênciando a fonte original.',3,NULL),(20,'uploads/2020/08/24/q1.png','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?','A versão do aluno é plágio. Embora o aluno tenha citado e referenciado o autor ele não parafraseou ou forneceu aspas ao redor das palavras copiadas.',3,NULL),(21,'uploads/2020/08/24/q2.png','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?','A versão do aluno não é plágio. O aluno parafraseou citou e referenciou o texto.',3,NULL),(22,'uploads/2020/08/24/q3.png','Qual das opções a seguir é verdadeira para a versão do estudante abaixo?','A versão do aluno não é plágio. O aluno parafraseou citou e referenciou o texto.',3,NULL);
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_quiz`
--

DROP TABLE IF EXISTS `quiz_question_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_question_quiz_question_id_quiz_id_3414207a_uniq` (`question_id`,`quiz_id`),
  KEY `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_question_quiz_question_id_2b2637b3_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`),
  CONSTRAINT `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_quiz`
--

LOCK TABLES `quiz_question_quiz` WRITE;
/*!40000 ALTER TABLE `quiz_question_quiz` DISABLE KEYS */;
INSERT INTO `quiz_question_quiz` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1);
/*!40000 ALTER TABLE `quiz_question_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quiz`
--

DROP TABLE IF EXISTS `quiz_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(60) NOT NULL,
  `random_order` tinyint(1) NOT NULL,
  `max_questions` int(10) unsigned DEFAULT NULL,
  `answers_at_end` tinyint(1) NOT NULL,
  `exam_paper` tinyint(1) NOT NULL,
  `single_attempt` tinyint(1) NOT NULL,
  `pass_mark` smallint(6) NOT NULL,
  `success_text` longtext NOT NULL,
  `fail_text` longtext NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_quiz_url_aa508dbd` (`url`),
  KEY `quiz_quiz_category_id_568a4c23_fk_quiz_category_id` (`category_id`),
  CONSTRAINT `quiz_quiz_category_id_568a4c23_fk_quiz_category_id` FOREIGN KEY (`category_id`) REFERENCES `quiz_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_quiz`
--

LOCK TABLES `quiz_quiz` WRITE;
/*!40000 ALTER TABLE `quiz_quiz` DISABLE KEYS */;
INSERT INTO `quiz_quiz` VALUES (1,'Qual o seu nível de conhecimento sobre plágio?','Veja se você sabe como evitar o plágio, descubra em qual nível você está, acompanhe o seu progresso e veja o que você precisa melhorar.\r\n\r\nFaça este teste e proteja-se contra o plágio!','quizplagio',1,10,0,1,0,80,'Parabéns','Continue tentando!',0,NULL);
/*!40000 ALTER TABLE `quiz_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_sitting`
--

DROP TABLE IF EXISTS `quiz_sitting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_sitting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_order` varchar(1024) NOT NULL,
  `question_list` varchar(1024) NOT NULL,
  `incorrect_questions` varchar(1024) NOT NULL,
  `current_score` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `user_answers` longtext NOT NULL,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) DEFAULT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id` (`quiz_id`),
  KEY `quiz_sitting_user_id_cfb694f3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_sitting_user_id_cfb694f3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_sitting`
--

LOCK TABLES `quiz_sitting` WRITE;
/*!40000 ALTER TABLE `quiz_sitting` DISABLE KEYS */;
INSERT INTO `quiz_sitting` VALUES (1,'2,1,','','2,',1,1,'{\"2\": \"oda inova\\u00e7\\u00e3o envolve mudan\\u00e7as. A inova\\u00e7\\u00e3o tecnol\\u00f3gica \\u00e9 caracterizada pela presen\\u00e7a de mudan\\u00e7as tecnol\\u00f3gicas em produtos (bens ou servi\\u00e7os) oferecidos \\u00e0 sociedade, ou na forma pela qual produtos s\\u00e3o cri\", \"1\": \"3\"}','2020-08-23 21:31:02.472581','2020-08-23 21:31:18.902039',1,2),(2,'2,1,','','2,',1,1,'{\"2\": \"\\u00e9 caracterizada pela presen\\u00e7a de mudan\\u00e7as tecnol\\u00f3gicas em produtos (bens ou servi\\u00e7os) oferecidos \\u00e0 sociedade, ou na forma pela qual produtos s\\u00e3o criados e oferecidos (que \\u00e9 usualmente denominada de inova\\u00e7\\u00e3o no processo).\", \"1\": \"3\"}','2020-08-23 22:27:40.732618','2020-08-23 22:28:00.646838',1,2),(3,'1,2,','2,','',1,0,'{\"1\": \"3\"}','2020-08-23 22:34:13.233980',NULL,1,1),(4,'15,10,','','10,',1,1,'{\"15\": \"False\", \"10\": \"9\"}','2020-08-24 18:56:16.316606','2020-08-24 18:57:27.001859',1,2),(5,'18,15,17,13,10,8,2,7,4,6,','','15,,17,,10,,8,,2,,7,,4,',3,1,'{\"18\": \"False\", \"15\": \"True\", \"17\": \"True\", \"13\": \"False\", \"10\": \"8\", \"8\": \"4\", \"2\": \"Toda inova\\u00e7\\u00e3o envolve mudan\\u00e7as. A inova\\u00e7\\u00e3o tecnol\\u00f3gica \\u00e9 caracterizada pela presen\\u00e7a de mudan\\u00e7as tecnol\\u00f3gicas em produtos (bens ou servi\\u00e7os) oferecidos \\u00e0 sociedade, ou na forma pela qual produtos s\\u00e3o criados e oferecidos (que \\u00e9 usualmente denominada de inova\\u00e7\\u00e3o no processo).\", \"7\": \"teste testes tests tests tstse (BESSANT; TIDD, 2009).\", \"4\": \"No mundo real, ali\\u00e1s, parcela expressiva das patentes \\u00e9 depositada justamente para inibir a inova\\u00e7\\u00e3o (por parte de concorrentes) ou para confundir os trabalhos de intelig\\u00eancia competitiva feitos por rivais.\", \"6\": \"O Estado tem a fun\\u00e7\\u00e3o de incentivar a inova\\u00e7\\u00e3o tecnol\\u00f3gica no Brasil. Desta forma, como aux\\u00edlio as pol\\u00edticas industrial e tecnol\\u00f3gica surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica (MATIAS-PEREIRA; KRUGLIANSKAS, 2005).\"}','2020-08-24 19:00:57.825269','2020-08-24 19:10:43.452715',1,2),(6,'3,7,8,12,15,19,5,6,1,16,','','12,,5,',8,1,'{\"3\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influencia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\", \"8\": \"5\", \"12\": \"True\", \"15\": \"False\", \"19\": \"False\", \"5\": \"teste  Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica, ao buscar estabelecer um di\\u00e1logo cada vez mais intenso entre as institui\\u00e7\\u00f5es produtoras de bens de conhecimento testststs\\r\\ntests tsts t tsst (MATIAS-PEREIRA; KRUGLIANSKAS, 2005).\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"1\": \"3\", \"16\": \"True\"}','2020-08-24 19:12:25.861555','2020-08-24 19:36:19.124656',1,2),(7,'12,13,5,1,17,8,11,10,14,7,','','5,,17,,14,',7,1,'{\"12\": \"False\", \"13\": \"False\", \"5\": \"In\\u00fameras quest\\u00f5es complexas n\\u00e3o foram tratadas nesta lei, como a cria\\u00e7\\u00e3o de mecanismos que permitam sua efetiva conex\\u00e3o com as pol\\u00edticas industrial e tecnol\\u00f3gica, bem como a falta de flexibilidade de gest\\u00e3o das institui\\u00e7\\u00f5es de pesquisa, ou seja, a excessiva rigidez que prevalece na gest\\u00e3o de recursos humanos, financeiros e materiais.\", \"1\": \"3\", \"17\": \"True\", \"8\": \"5\", \"11\": \"16\", \"10\": \"10\", \"14\": \"False\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\"}','2020-08-24 19:38:45.902877','2020-08-24 19:41:25.791662',1,2),(8,'7,6,9,10,19,8,11,15,18,13,','','7,,10,,18,,13,',6,1,'{\"7\": \"teste\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"9\": \"7\", \"10\": \"9\", \"19\": \"False\", \"8\": \"5\", \"11\": \"16\", \"15\": \"False\", \"18\": \"True\", \"13\": \"True\"}','2020-08-24 19:42:25.311409','2020-08-24 19:44:27.574041',1,5),(9,'8,5,10,11,14,4,18,19,17,12,','','5,,11,,17,',7,1,'{\"8\": \"5\", \"5\": \"Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica deixa algumas quest\\u00f5es complexas,  como a cria\\u00e7\\u00e3o de mecanismos que permitam sua efetiva conex\\u00e3o com as pol\\u00edticas industrial e tecnol\\u00f3gica, bem como a falta de flexibilidade de gest\\u00e3o das institui\\u00e7\\u00f5es de pesquisa, ou seja, a excessiva rigidez que prevalece na gest\\u00e3o de recursos humanos, financeiros e materiais.\", \"10\": \"10\", \"11\": \"13\", \"14\": \"True\", \"4\": \"O autor Plonski (2005)  argumenta sobre o indicador da inova\\u00e7\\u00e3o baseado em n\\u00famero de patentes, justificando que boa parte das patentes \\u00e9 aplicada para inibir a inova\\u00e7\\u00e3o ou confundir as pesquisas de intelig\\u00eancia competitiva feita pela concorr\\u00eancia.\", \"18\": \"False\", \"19\": \"False\", \"17\": \"True\", \"12\": \"False\"}','2020-08-24 19:45:07.449380','2020-08-24 19:53:20.577967',1,5),(10,'16,6,3,15,7,10,12,5,2,17,','','5,,17,',8,1,'{\"16\": \"True\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"3\": \"Para Plonski (2005) as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"15\": \"False\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\", \"10\": \"10\", \"12\": \"False\", \"5\": \"Tecnol\\u00f3gica, ao buscar estabelecer um di\\u00e1logo cada vez mais intenso entre as institui\\u00e7\\u00f5es produtoras de bens de conhecimento e as produtoras de bens e servi\\u00e7os, surge como mais um instrumento para facilitar a cria\\u00e7\\u00e3o de uma cultura de inova\\u00e7\\u00e3o no Pa\\u00eds. Sua aprova\\u00e7\\u00e3o, entretanto, n\\u00e3o \\u00e9 suficiente para mudar a realidade atual existente nesse campo. Observa-se que os instrumentos est\\u00e3o sendo disponibilizados, mas \\u00e9 preciso um maior envolvimento e compromisso por parte dos atores envolvidos no assunto.\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"17\": \"True\"}','2020-08-24 19:54:16.547830','2020-08-24 19:57:58.274564',1,5),(11,'7,8,3,5,18,17,10,12,2,13,','','7,,8,,5,,17,',6,1,'{\"7\": \"bblaballbalballa\", \"8\": \"4\", \"3\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"5\": \"Observa-se que os instrumentos est\\u00e3o sendo disponibilizados, mas \\u00e9 preciso um maior envolvimento e compromisso por parte dos atores envolvidos no assunto. In\\u00fameras quest\\u00f5es complexas n\\u00e3o foram tratadas nesta lei, como a cria\\u00e7\\u00e3o de mecanismos que permitam sua efetiva conex\\u00e3o com as pol\\u00edticas industrial e tecnol\\u00f3gica, bem como a falta de flexibilidade de gest\\u00e3o das institui\\u00e7\\u00f5es de pesquisa, ou seja, a excessiva rigidez que prevalece na gest\\u00e3o de recursos humanos, financeiros e materiais.\", \"18\": \"False\", \"17\": \"True\", \"10\": \"10\", \"12\": \"False\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"13\": \"False\"}','2020-08-24 19:59:04.472743','2020-08-24 20:03:10.296489',1,6),(12,'17,12,11,3,7,9,16,13,2,5,','','17,,9,,5,',7,1,'{\"17\": \"True\", \"12\": \"False\", \"11\": \"16\", \"3\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\", \"9\": \"6\", \"16\": \"True\", \"13\": \"False\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"5\": \"blblblblbl\"}','2020-08-24 20:05:38.081267','2020-08-24 20:08:59.822952',1,6),(13,'8,3,18,16,6,4,12,14,11,13,','','',10,1,'{\"8\": \"5\", \"3\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"18\": \"False\", \"16\": \"True\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"4\": \"O autor Plonski (2005) argumenta sobre o indicador da inova\\u00e7\\u00e3o baseado em n\\u00famero de patentes, justificando que boa parte das patentes \\u00e9 aplicada para inibir a inova\\u00e7\\u00e3o ou confundir as pesquisas de intelig\\u00eancia competitiva feita pela concorr\\u00eancia.\", \"12\": \"False\", \"14\": \"True\", \"11\": \"16\", \"13\": \"False\"}','2020-08-24 20:11:05.690548','2020-08-24 20:14:14.342180',1,8),(14,'6,1,2,9,8,3,14,10,17,5,','','3,,17,,5,',7,1,'{\"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"1\": \"3\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"9\": \"7\", \"8\": \"5\", \"3\": \"testes\", \"14\": \"True\", \"10\": \"10\", \"17\": \"True\", \"5\": \"tste\"}','2020-08-24 20:14:45.087235','2020-08-24 20:17:06.790821',1,8),(15,'15,8,12,2,17,19,16,4,6,1,','','15,,8,,12,,17,',6,1,'{\"15\": \"True\", \"8\": \"4\", \"12\": \"True\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"17\": \"True\", \"19\": \"False\", \"16\": \"True\", \"4\": \"O autor Plonski (2005), argumenta sobre o indicador da inova\\u00e7\\u00e3o baseado em n\\u00famero de patentes, justificando que boa parte das patentes \\u00e9 aplicada para inibir a inova\\u00e7\\u00e3o ou confundir as pesquisas de intelig\\u00eancia competitiva feita pela concorr\\u00eancia.\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"1\": \"3\"}','2020-08-24 20:18:21.299849','2020-08-24 20:22:24.166692',1,7),(16,'12,19,1,15,13,21,14,5,2,7,','','',10,1,'{\"12\": \"False\", \"19\": \"False\", \"1\": \"3\", \"15\": \"False\", \"13\": \"False\", \"21\": \"19\", \"14\": \"True\", \"5\": \"In\\u00fameras quest\\u00f5es complexas n\\u00e3o foram tratadas nesta lei, como a cria\\u00e7\\u00e3o de mecanismos que permitam sua efetiva conex\\u00e3o com as pol\\u00edticas industrial e tecnol\\u00f3gica, bem como a falta de flexibilidade de gest\\u00e3o das institui\\u00e7\\u00f5es de pesquisa, ou seja, a excessiva rigidez que prevalece na gest\\u00e3o de recursos humanos, financeiros e materiais.\", \"2\": \"Para Plonski (2005), as inova\\u00e7\\u00f5es tecnol\\u00f3gicas s\\u00e3o classificadas com base no grau da mudan\\u00e7a envolvida. Portanto s\\u00e3o categorizadas em inova\\u00e7\\u00f5es incrementais e radicais.\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\"}','2020-08-24 20:40:52.079118','2020-08-24 20:42:44.624444',1,7),(17,'18,10,15,17,8,6,22,7,11,3,','','17,,8,,3,,6,',6,1,'{\"18\": \"False\", \"10\": \"10\", \"15\": \"False\", \"17\": \"True\", \"8\": \"4\", \"6\": \"Segundo Matias-Pereira e Kruglianskas (2005), o Estado brasileiro tem a fun\\u00e7\\u00e3o de incentivar o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica. Desta maneira,  com a fun\\u00e7\\u00e3o de fundamentar surge a Lei de Inova\\u00e7\\u00e3o Tecnol\\u00f3gica.\", \"22\": \"21\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\", \"11\": \"16\", \"3\": \"glalsslsls\"}','2020-08-24 20:45:03.293671','2020-08-24 20:47:19.440496',1,4),(18,'20,2,12,1,17,18,8,7,11,9,','','2,,17,',8,1,'{\"20\": \"17\", \"2\": \"Toda inova\\u00e7\\u00e3o envolve mudan\\u00e7as. A inova\\u00e7\\u00e3o tecnol\\u00f3gica \\u00e9 caracterizada pela presen\\u00e7a de mudan\\u00e7as tecnol\\u00f3gicas em produtos (bens ou servi\\u00e7os) oferecidos \\u00e0 sociedade, ou na forma pela qual produtos s\\u00e3o criados e oferecidos (que \\u00e9 usualmente denominada de inova\\u00e7\\u00e3o no processo).\", \"12\": \"False\", \"1\": \"3\", \"17\": \"True\", \"18\": \"False\", \"8\": \"5\", \"7\": \"Para Bessant e Tidd (2009), existem v\\u00e1rios fatores que atuam na agilidade e na  orienta\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do  empreendedorismo. Os autores citam como fatores de influ\\u00eancia, a infraestrutura, suporte e  escassez de recursos, e influ\\u00eancias ligadas aos indiv\\u00edduos como  talento, oportunidades, educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o.\", \"11\": \"16\", \"9\": \"7\"}','2020-08-24 20:47:50.837111','2020-08-24 20:50:50.819086',1,4),(19,'20,15,19,18,6,7,12,2,14,22,','','19,,6,,7,,12,,2,',5,1,'{\"20\": \"17\", \"15\": \"False\", \"19\": \"True\", \"18\": \"False\", \"6\": \"teste\", \"7\": \"este\", \"12\": \"True\", \"2\": \"inova\\u00e7\\u00e3o tecnol\\u00f3gica\", \"14\": \"True\", \"22\": \"21\"}','2020-08-25 17:55:27.516897','2020-08-25 17:56:32.195829',1,5),(20,'1,13,18,9,10,7,21,5,12,17,','','7,,5,,17,',7,1,'{\"1\": \"3\", \"13\": \"False\", \"18\": \"False\", \"9\": \"7\", \"10\": \"10\", \"7\": \"teste\", \"21\": \"19\", \"5\": \"nto. In\\u00fameras quest\\u00f5es complexas n\\u00e3o foram tratadas nesta lei, como a cria\\u00e7\\u00e3o de mecanismos que permitam sua efetiva conex\\u00e3o com as pol\\u00edticas industrial e tecnol\\u00f3gica, bem como a falta de\", \"12\": \"False\", \"17\": \"True\"}','2020-08-26 10:58:02.893219','2020-08-26 10:59:27.392135',1,6),(21,'15,14,13,7,4,1,3,17,5,2,','','14,,13,,7,,4,,3,,17,,5,,2,',2,1,'{\"15\": \"False\", \"14\": \"False\", \"13\": \"True\", \"7\": \"Os contextos nacionais, regionais e setoriais influenciam na velocidade e na dire\\u00e7\\u00e3o da inova\\u00e7\\u00e3o e do empreendedorismo em raz\\u00e3o de disponibilidade ou escassez de recursos, talento, oportunidades, infraestrutura e suporte. Contudo, o n\\u00e3o determina os resultados. A educa\\u00e7\\u00e3o, capacita\\u00e7\\u00e3o, experi\\u00eancia e aptid\\u00e3o dos indiv\\u00edduos tamb\\u00e9m t\\u00eam um efeito profundo.\", \"4\": \"Origin\\u00e1rio dos anos 50, mas ainda em voga, o n\\u00famero de patentes \\u00e9 um indicador problem\\u00e1tico da inova\\u00e7\\u00e3o, mesmo para a de base tecnol\\u00f3gica. Ao focalizar a inven\\u00e7\\u00e3o, contempla apenas uma etapa de um longo e complexo caminho de trazer uma boa ideia a uma condi\\u00e7\\u00e3o de utiliza\\u00e7\\u00e3o extensiva pela sociedade, que \\u00e9 a ess\\u00eancia do conceito de inova\\u00e7\\u00e3o. No mundo real, ali\\u00e1s, parcela expressiva das patentes \\u00e9 depositada justamente para inibir a inova\\u00e7\\u00e3o (por parte de concorrentes) ou para confundir os trabalhos de intelig\\u00eancia competitiva feitos por rivais.\", \"1\": \"3\", \"3\": \"nada\", \"17\": \"True\", \"5\": \"n\\u00e3o\", \"2\": \"Inovar \\u00e9 mudar, sejam produtos oferecidos ou a forma como s\\u00e3o criados e oferecidos (PLONKSKI, 2005).\"}','2020-08-28 13:52:10.439060','2020-08-28 13:59:33.701200',1,2),(22,'18,21,1,17,2,6,22,12,15,8,','','18,,21,,17,,2,,6,,8,',4,1,'{\"18\": \"True\", \"21\": \"20\", \"1\": \"3\", \"17\": \"True\", \"2\": \"Toda inova\\u00e7\\u00e3o envolve mudan\\u00e7as. A inova\\u00e7\\u00e3o tecnol\\u00f3gica \\u00e9 caracterizada pela presen\\u00e7a de mudan\\u00e7as tecnol\\u00f3gicas em produtos (bens ou servi\\u00e7os) oferecidos \\u00e0 sociedade, ou na forma pela qual produtos s\\u00e3o criados e oferecidos (que \\u00e9 usualmente denominada\", \"6\": \"Conclu\\u00edmos, assim, que cabe ao Estado orientar, apoiar e estimular o processo de inova\\u00e7\\u00e3o tecnol\\u00f3gica no Pa\\u00eds, sem desconsiderar que a transforma\\u00e7\\u00e3o da ind\\u00fastria \\u00e9 responsabilidade dela pr\\u00f3pria. Nesse contexto, a Lei\", \"22\": \"21\", \"12\": \"False\", \"15\": \"False\", \"8\": \"4\"}','2020-08-28 14:49:00.627290','2020-08-28 14:51:08.231627',1,2),(23,'6,3,21,14,19,16,17,4,15,8,','','6,,3,,21,,16,,17,,4,,8,',3,1,'{\"6\": \"teste\", \"3\": \"no que se refere ao grau da mudan\\u00e7a envolvida. Essa grande variedade leva \\u00e0 conhecida categoriza\\u00e7\\u00e3o das inova\\u00e7\\u00f5es em incrementais, radicais ou transformadoras (tamb\\u00e9m chamadas de revolucion\\u00e1rias).\", \"21\": \"20\", \"14\": \"True\", \"19\": \"False\", \"16\": \"False\", \"17\": \"True\", \"4\": \"Origin\\u00e1rio dos anos 50, mas ainda em voga, o n\\u00famero de patentes \\u00e9 um indicador problem\\u00e1tico da inova\\u00e7\\u00e3o, mesmo para a de base tecnol\\u00f3gica. Ao focalizar a inven\\u00e7\\u00e3o, contempla apenas uma etapa de um longo e complexo caminho de trazer uma boa ideia a uma condi\\u00e7\\u00e3o de utiliza\\u00e7\\u00e3o extensiva pela sociedade, que \\u00e9 a ess\\u00eancia do conceito de inova\\u00e7\\u00e3o. No mundo real, ali\\u00e1s, parcela expressiva das patentes \\u00e9 depositada justamente para inibir a inova\\u00e7\\u00e3o (por parte de concorrentes) ou para confundir os trabalhos de intelig\\u00eancia competitiva feitos por rivais.\", \"15\": \"False\", \"8\": \"4\"}','2020-09-01 17:18:12.279966','2020-09-01 17:21:19.033313',1,2);
/*!40000 ALTER TABLE `quiz_sitting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_subcategory`
--

DROP TABLE IF EXISTS `quiz_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category` varchar(250) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_subcategory_category_id_aa7a410e_fk_quiz_category_id` (`category_id`),
  CONSTRAINT `quiz_subcategory_category_id_aa7a410e_fk_quiz_category_id` FOREIGN KEY (`category_id`) REFERENCES `quiz_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_subcategory`
--

LOCK TABLES `quiz_subcategory` WRITE;
/*!40000 ALTER TABLE `quiz_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteTutorial_contato`
--

DROP TABLE IF EXISTS `siteTutorial_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteTutorial_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `mensagem` longtext NOT NULL,
  `data` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteTutorial_contato`
--

LOCK TABLES `siteTutorial_contato` WRITE;
/*!40000 ALTER TABLE `siteTutorial_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteTutorial_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','Google','126763512-js00acldo5v0imfs97umt2fjffj5obhi.apps.googleusercontent.com','dj_eLjNHV3YZNqlWpLGHQGlT','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (2,1,2);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `true_false_tf_question`
--

DROP TABLE IF EXISTS `true_false_tf_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `true_false_tf_question` (
  `question_ptr_id` int(11) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`question_ptr_id`),
  CONSTRAINT `true_false_tf_questi_question_ptr_id_11230c0e_fk_quiz_ques` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `true_false_tf_question`
--

LOCK TABLES `true_false_tf_question` WRITE;
/*!40000 ALTER TABLE `true_false_tf_question` DISABLE KEYS */;
INSERT INTO `true_false_tf_question` VALUES (12,0),(13,0),(14,1),(15,0),(16,1),(17,0),(18,0),(19,0);
/*!40000 ALTER TABLE `true_false_tf_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 15:35:56
