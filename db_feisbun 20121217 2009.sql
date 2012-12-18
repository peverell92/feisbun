-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	4.1.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema feisbun
--

CREATE DATABASE IF NOT EXISTS feisbun;
USE feisbun;

--
-- Definition of table `allows`
--

DROP TABLE IF EXISTS `allows`;
CREATE TABLE `allows` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `allows_from` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allows`
--

/*!40000 ALTER TABLE `allows` DISABLE KEYS */;
INSERT INTO `allows` (`id`,`username`,`allows_from`) VALUES 
 (5,'omar@a.com','luis.esparza@feisbun.com'),
 (6,'luis.esparza@feisbun.com','omar@a.com'),
 (7,'omar@a.com','carlos.lopez@feisbun.com'),
 (8,'carlos.lopez@feisbun.com','omar@a.com');
/*!40000 ALTER TABLE `allows` ENABLE KEYS */;


--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_from` varchar(45) NOT NULL default '',
  `user_to` varchar(45) NOT NULL default '',
  `text_content` text NOT NULL,
  `img_content` blob,
  `sent_at` date NOT NULL default '1970-01-01',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`,`user_from`,`user_to`,`text_content`,`img_content`,`sent_at`) VALUES 
 (1,'Omar Garcia','omar@a.com','Comentario de prueba',NULL,'2012-12-17'),
 (2,'Omar Garcia Perez','omar@a.com','Comentario de prueba',NULL,'2012-12-17'),
 (3,'Omar Garcia Perez','omar@a.com','Enviando un comentario de omar@b.com',NULL,'2012-12-17'),
 (4,'Omar Garcia','omar@b.com','Enviando un comentario de omar@a.com',NULL,'2012-12-17'),
 (5,'Omar Garcia Perez','omar@a.com','DATE TEST',NULL,'2012-12-17'),
 (6,'Omar Garcia','omar@a.com','Hola',NULL,'2012-12-17'),
 (7,'Omar Garcia','omar@a.com','Hola',NULL,'2012-12-17'),
 (8,'Omar Garcia','omar@a.com','Probando comentandome a mi mismo',NULL,'2012-12-17'),
 (9,'Omar Garcia','omar@a.com','Probando comentandome a mi mismo',NULL,'2012-12-17'),
 (10,'Omar Garcia','omar@a.com','Probando comentandome a mi mismo',NULL,'2012-12-17'),
 (11,'Jose Ramirez','jose.ramirez@feisbun.com','LALALA',NULL,'2012-12-17'),
 (12,'Jose Ramirez','jose.ramirez@feisbun.com','LALALA',NULL,'2012-12-17'),
 (13,'Jose Ramirez','omar@a.com','Hola Omar! Como estas?',NULL,'2012-12-17'),
 (14,'Luis Esparza','Luis Esparza','Hola! Soy gay! :D',NULL,'2012-12-17'),
 (15,'Luis Esparza','Luis Esparza','Hola! Soy gay! :D',NULL,'2012-12-17'),
 (16,'Luis Esparza','luis.esparza@feisbun.com','Hola! Soy Gay!',NULL,'2012-12-17'),
 (17,'Luis Esparza','omar@a.com','Que onda omar!',NULL,'2012-12-17'),
 (18,'Omar Garcia','carlos.lopez@feisbun.com','Hola Carlos!',NULL,'2012-12-17');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `request_from` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `password` blob NOT NULL,
  `birthday` datetime NOT NULL default '0000-00-00 00:00:00',
  `phone` varchar(45) NOT NULL default '0',
  `address_street` varchar(45) NOT NULL default '',
  `address_colony` varchar(45) NOT NULL default '',
  `address_city` varchar(45) NOT NULL default '',
  `address_state` varchar(45) NOT NULL default '',
  `school` varchar(45) NOT NULL default '',
  `school_generation` varchar(45) NOT NULL default '',
  `school_degree` varchar(45) NOT NULL default '',
  `area` varchar(45) NOT NULL default '',
  `online` tinyint(1) NOT NULL default '0',
  `administrator` tinyint(1) NOT NULL default '0',
  `email` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`password`,`birthday`,`phone`,`address_street`,`address_colony`,`address_city`,`address_state`,`school`,`school_generation`,`school_degree`,`area`,`online`,`administrator`,`email`) VALUES 
 (1,'admin',0x3231323332663239376135376135613734333839346130653461383031666333,'0000-00-00 00:00:00','0','','','','','','','','',0,1,'admin@admin.com'),
 (2,'Omar Garcia',0x3464313836333231633161376630663335346232393765383931346162323430,'3891-12-20 00:00:00','9960880','Trapiche #213','Trojes de Oriente','Aguascalientes','Aguascalientes','UAA','1950','ISC','Sistemas',0,0,'omar@a.com'),
 (3,'a',0x3063633137356239633066316236613833316333393965323639373732363631,'3870-01-01 00:00:00','a','a','a','a','a','a','1970','a','Direccion General',0,0,'a'),
 (4,'Jose Ramirez',0x3464313836333231633161376630663335346232393765383931346162323430,'3875-02-01 00:00:00','555','B','B','B','B','B','1987','Contador','Contabilidad',0,0,'jose.ramirez@feisbun.com'),
 (5,'Loli Delgado',0x3464313836333231633161376630663335346232393765383931346162323430,'3892-02-17 00:00:00','No se','No se','No se','No se','No se','UAA','2010','ISC','Sistemas',0,0,'loli.delgado@feisbun.com'),
 (6,'Luis Esparza',0x3464313836333231633161376630663335346232393765383931346162323430,'3892-05-26 00:00:00','No se','No se','No se','No se','No se','UAA','1970','Titulo','Direccion General',0,0,'luis.esparza@feisbun.com'),
 (7,'Carlos Lopez',0x3464313836333231633161376630663335346232393765383931346162323430,'3870-01-01 00:00:00','Por Ahi','ASdd','ASds','asdgij','asfnn','UAA','1982','LRI','Recursos Humanos',1,0,'carlos.lopez@feisbun.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
