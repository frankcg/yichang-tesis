/*
SQLyog Ultimate v10.3 
MySQL - 5.7.17-log : Database - chinex
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chinex` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;

USE `chinex`;

/*Table structure for table `dt_area` */

DROP TABLE IF EXISTS `dt_area`;

CREATE TABLE `dt_area` (
  `IDAREA` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDAREA`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_area` */

insert  into `dt_area`(`IDAREA`,`NOMBRE`,`FLAG`,`FECHAMOD`) values (01,'RRHH',1,'2018-05-01 13:04:44'),(02,'Contabilidad',1,'2018-05-01 13:04:44'),(03,'Sistemas Desarrollo',1,'2018-05-01 13:04:44'),(04,'Codistribución',1,'2018-05-01 13:04:44'),(05,'Comercial',1,'2018-05-01 13:04:44'),(06,'Facturación',1,'2018-05-01 13:04:44'),(07,'Operaciones',1,'2018-05-01 13:04:44'),(08,'Transporte',1,'2018-05-01 13:04:44'),(09,'Soporte de Ventas',1,'2018-05-01 13:04:44'),(10,'Sistemas Infraestructura',1,'2018-05-01 13:04:44'),(11,'Vendedores',1,'2018-05-01 13:04:44'),(12,'Otros',1,'2018-05-01 17:35:00');

/*Table structure for table `dt_asignacion` */

DROP TABLE IF EXISTS `dt_asignacion`;

CREATE TABLE `dt_asignacion` (
  `IDASIGNACION` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDEVALUACION` int(4) unsigned zerofill NOT NULL,
  `IDPERSONA` int(4) unsigned zerofill NOT NULL,
  `IDGERENTE` int(4) unsigned zerofill NOT NULL,
  `IDCOLEGA` int(4) unsigned zerofill NOT NULL,
  `IDCLIENTE` int(4) unsigned zerofill NOT NULL,
  `IDPROVEEDOR` int(4) unsigned zerofill NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDASIGNACION`),
  KEY `fk_idevaluacion` (`IDEVALUACION`),
  KEY `fk_idpersona` (`IDPERSONA`),
  CONSTRAINT `dt_asignacion_ibfk_1` FOREIGN KEY (`IDEVALUACION`) REFERENCES `dt_evaluacion` (`IDEVALUACION`),
  CONSTRAINT `dt_asignacion_ibfk_2` FOREIGN KEY (`IDPERSONA`) REFERENCES `dt_persona` (`IDPERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_asignacion` */

insert  into `dt_asignacion`(`IDASIGNACION`,`IDEVALUACION`,`IDPERSONA`,`IDGERENTE`,`IDCOLEGA`,`IDCLIENTE`,`IDPROVEEDOR`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (00001,0001,0115,0106,0114,0146,0190,'FLAURA','2018-05-12 15:18:52','FLAURA','2018-05-12 15:19:01'),(00002,0001,0114,0106,0115,0148,0188,'FLAURA','2018-05-12 15:18:54','FLAURA','2018-05-12 15:19:03'),(00003,0001,0117,0106,0115,0152,0190,'FLAURA','2018-05-12 15:18:55','FLAURA','2018-05-12 15:19:04'),(00004,0001,0119,0118,0120,0000,0000,'FLAURA','2018-05-12 16:10:34','','2018-05-12 16:10:34');

/*Table structure for table `dt_cargo` */

DROP TABLE IF EXISTS `dt_cargo`;

CREATE TABLE `dt_cargo` (
  `IDCARGO` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCARGO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_cargo` */

insert  into `dt_cargo`(`IDCARGO`,`NOMBRE`,`FLAG`,`FECHAMOD`) values (01,'Gerente',1,'2018-05-01 13:07:49'),(02,'Jefe',1,'2018-05-01 13:07:49'),(03,'Analista',1,'2018-05-01 13:07:49'),(04,'Asistente',1,'2018-05-01 13:07:49'),(05,'Otros',1,'2018-05-01 17:34:50');

/*Table structure for table `dt_cliente` */

DROP TABLE IF EXISTS `dt_cliente`;

CREATE TABLE `dt_cliente` (
  `IDCLIENTE` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDPERSONA` int(4) unsigned zerofill NOT NULL,
  `NOMBRE` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_cliente` */

insert  into `dt_cliente`(`IDCLIENTE`,`IDPERSONA`,`NOMBRE`,`FLAG`,`FECHAMOD`) values (01,0121,'3M',1,'2018-05-01 13:37:27'),(02,0122,'AJINOMOTO',1,'2018-05-01 13:37:27'),(03,0123,'ALTOMAYO.',1,'2018-05-01 13:37:27'),(04,0124,'BELOWSAC',1,'2018-05-01 13:37:27'),(05,0125,'BOTICAS ISAFARMA E.I.R.L',1,'2018-05-01 13:37:27'),(06,0126,'COLAGATE-PALMOLIVE',1,'2018-05-01 13:37:27'),(07,0127,'CORPORACION VEGA',1,'2018-05-01 13:37:27'),(08,0128,'DKASA',1,'2018-05-01 13:37:27'),(09,0129,'DURACEL',1,'2018-05-01 13:37:27'),(10,0130,'GLORIA.',1,'2018-05-01 13:37:27'),(11,0131,'IMEVA S.A.C.',1,'2018-05-01 13:37:27'),(12,0132,'LOREAL',1,'2018-05-01 13:37:27'),(13,0133,'MENTOS',1,'2018-05-01 13:37:27'),(14,0134,'MEZA MIRANDA BETSABE MARIA',1,'2018-05-01 13:37:27'),(15,0135,'PECSA',1,'2018-05-01 13:37:27'),(16,0136,'PEDIGRI',1,'2018-05-01 13:37:27'),(17,0137,'PLAZA VEA',1,'2018-05-01 13:37:27'),(18,0138,'PRINGLES',1,'2018-05-01 13:37:28'),(19,0139,'RIPLEY',1,'2018-05-01 13:37:28'),(20,0140,'SC JOHNSON',1,'2018-05-01 13:37:28'),(21,0141,'TICNOLOGY S.A.C.',1,'2018-05-01 13:37:28'),(22,0142,'TOTTUS',1,'2018-05-01 13:37:28'),(23,0143,'VAPE',1,'2018-05-01 13:37:28'),(24,0144,'RRHH',1,'2018-05-01 13:37:42'),(25,0145,'Contabilidad',1,'2018-05-01 13:37:42'),(26,0146,'Sistemas Desarrollo',1,'2018-05-01 13:37:42'),(27,0147,'Codistribución',1,'2018-05-01 13:37:42'),(28,0148,'Comercial',1,'2018-05-01 13:37:42'),(29,0149,'Facturación',1,'2018-05-01 13:37:42'),(30,0150,'Operaciones',1,'2018-05-01 13:37:42'),(31,0151,'Transporte',1,'2018-05-01 13:37:42'),(32,0152,'Soporte de Ventas',1,'2018-05-01 13:37:42'),(33,0153,'Sistemas Infraestructura',1,'2018-05-01 13:37:42'),(34,0154,'Vendedores',1,'2018-05-01 13:37:42');

/*Table structure for table `dt_cliente_area` */

DROP TABLE IF EXISTS `dt_cliente_area`;

CREATE TABLE `dt_cliente_area` (
  `IDCLIENTE_AREA` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDAREA` int(2) unsigned zerofill NOT NULL,
  `IDCLIENTE` int(2) unsigned zerofill NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCLIENTE_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_cliente_area` */

insert  into `dt_cliente_area`(`IDCLIENTE_AREA`,`IDAREA`,`IDCLIENTE`,`FLAG`,`FECHAMOD`) values (001,01,24,1,'2018-05-01 13:46:23'),(002,01,25,1,'2018-05-01 13:46:23'),(003,01,26,1,'2018-05-01 13:46:23'),(004,01,27,1,'2018-05-01 13:46:23'),(005,01,28,1,'2018-05-01 13:46:23'),(006,01,29,1,'2018-05-01 13:46:23'),(007,01,30,1,'2018-05-01 13:46:23'),(008,01,31,1,'2018-05-01 13:46:24'),(009,01,32,1,'2018-05-01 13:46:24'),(010,01,33,1,'2018-05-01 13:46:24'),(011,01,34,1,'2018-05-01 13:46:24'),(012,02,24,1,'2018-05-01 13:46:58'),(013,02,25,1,'2018-05-01 13:46:58'),(014,02,26,1,'2018-05-01 13:46:58'),(015,02,27,1,'2018-05-01 13:46:58'),(016,02,28,1,'2018-05-01 13:46:58'),(017,02,29,1,'2018-05-01 13:46:58'),(018,02,30,1,'2018-05-01 13:46:58'),(019,02,31,1,'2018-05-01 13:46:58'),(020,02,32,1,'2018-05-01 13:46:58'),(021,02,33,1,'2018-05-01 13:46:58'),(022,02,34,1,'2018-05-01 13:46:58'),(023,03,24,1,'2018-05-01 13:47:34'),(024,03,25,1,'2018-05-01 13:47:34'),(025,03,26,1,'2018-05-01 13:47:34'),(026,03,27,1,'2018-05-01 13:47:34'),(027,03,28,1,'2018-05-01 13:47:34'),(028,03,29,1,'2018-05-01 13:47:35'),(029,03,30,1,'2018-05-01 13:47:35'),(030,03,31,1,'2018-05-01 13:47:35'),(031,03,32,1,'2018-05-01 13:47:35'),(032,03,33,1,'2018-05-01 13:47:35'),(033,03,34,1,'2018-05-01 13:47:35'),(034,10,24,1,'2018-05-01 13:48:04'),(035,10,25,1,'2018-05-01 13:48:04'),(036,10,26,1,'2018-05-01 13:48:04'),(037,10,27,1,'2018-05-01 13:48:04'),(038,10,28,1,'2018-05-01 13:48:04'),(039,10,29,1,'2018-05-01 13:48:04'),(040,10,30,1,'2018-05-01 13:48:04'),(041,10,31,1,'2018-05-01 13:48:04'),(042,10,32,1,'2018-05-01 13:48:04'),(043,10,33,1,'2018-05-01 13:48:04'),(044,10,34,1,'2018-05-01 13:48:04'),(045,07,31,1,'2018-05-01 13:52:21'),(046,06,34,1,'2018-05-01 13:52:21'),(047,09,34,1,'2018-05-01 13:52:21'),(048,11,05,1,'2018-05-01 14:44:04'),(049,11,14,1,'2018-05-01 14:44:04'),(050,11,04,1,'2018-05-01 14:44:04'),(051,11,21,1,'2018-05-01 14:44:05'),(052,11,11,1,'2018-05-01 14:44:05'),(053,04,12,1,'2018-05-01 14:44:46'),(054,04,01,1,'2018-05-01 14:44:46'),(055,04,06,1,'2018-05-01 14:44:46'),(056,04,20,1,'2018-05-01 14:44:46'),(057,04,02,1,'2018-05-01 14:44:47'),(058,04,03,1,'2018-05-01 14:44:47'),(059,05,10,1,'2018-05-01 14:46:04'),(060,05,17,1,'2018-05-01 14:46:04'),(061,05,22,1,'2018-05-01 14:46:04'),(062,05,19,1,'2018-05-01 14:46:04'),(063,05,15,1,'2018-05-01 14:46:04'),(064,05,07,1,'2018-05-01 14:46:04'),(065,05,13,1,'2018-05-01 14:46:04'),(066,05,23,1,'2018-05-01 14:46:04'),(067,05,09,1,'2018-05-01 14:46:04'),(068,05,16,1,'2018-05-01 14:46:04'),(069,05,08,1,'2018-05-01 14:46:04'),(070,05,18,1,'2018-05-01 14:46:04');

/*Table structure for table `dt_competencia` */

DROP TABLE IF EXISTS `dt_competencia`;

CREATE TABLE `dt_competencia` (
  `IDCOMPETENCIA` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT '1',
  `OBSERVACION` mediumtext COLLATE utf8_spanish2_ci NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCOMPETENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_competencia` */

insert  into `dt_competencia`(`IDCOMPETENCIA`,`NOMBRE`,`ESTADO`,`OBSERVACION`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (001,'EFICIENCIA',1,'','SISTEMAS','2018-05-12 14:35:30','','2018-05-12 14:35:30'),(002,'COMUNICACIÓN',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(003,'COOPERACIÓN',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(004,'PROACTIVIDAD',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(005,'COMPROMISO',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(006,'LIDERAZGO',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(007,'CONOCIMIENTO DEL PUESTO',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(008,'AUTONOMÍA',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(009,'RESPONSABILIDAD',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32'),(010,'INNOVACIÓN Y CREATIVIDAD',1,'','SISTEMAS','2018-05-12 14:35:32','','2018-05-12 14:35:32');

/*Table structure for table `dt_competencia_conducta` */

DROP TABLE IF EXISTS `dt_competencia_conducta`;

CREATE TABLE `dt_competencia_conducta` (
  `IDCONDUCTA` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDCOMPETENCIA` int(3) unsigned zerofill NOT NULL,
  `NOMBRE` mediumtext COLLATE utf8_spanish2_ci NOT NULL,
  `PRIORIDAD` int(1) NOT NULL,
  `PESO` float NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCONDUCTA`),
  KEY `fk_idcompetencia` (`IDCOMPETENCIA`),
  CONSTRAINT `dt_competencia_conducta_ibfk_1` FOREIGN KEY (`IDCOMPETENCIA`) REFERENCES `dt_competencia` (`IDCOMPETENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_competencia_conducta` */

insert  into `dt_competencia_conducta`(`IDCONDUCTA`,`IDCOMPETENCIA`,`NOMBRE`,`PRIORIDAD`,`PESO`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (001,001,'Encuentra soluciones eficientes y de forma oportuna a todas y diversas situaciones que se le presentan.',4,100,'SISTEMAS','2018-05-12 14:44:44','','2018-05-12 16:25:14'),(002,001,'Da soluciones eficientes y en tiempo a las situaciones y problemas que se le presentan.',3,75,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:17'),(003,001,'Ha tomado algunas decisiones equivocadas y en destiempo a los problemas y situaciones que se presentan.',2,45,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:19'),(004,001,'La mayoria de sus decisiones dejan mucho que desear y generalmente cuando ya es tarde.',1,27,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:24'),(005,002,'Su forma de comunicarse es permanente clara y objetiva en ambos sentidos con todos.',4,80,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:30'),(006,002,'Se comunica permanentemente de forma clara y objetiva en ambos sentido pero no con todos.',3,64,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:34'),(007,002,'Se comunica muy poco de forma clara y objetiva ademas no escucha.',2,33,'SISTEMAS','2018-05-12 14:44:45','','2018-05-12 16:25:39'),(008,002,'Comunicación practicamente nul y es dificil de entender ademas de no escuchar.',1,15,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:25:41'),(009,003,'En el y otodo su equipo de trabajo se aprecia una actitud excepcional permanente de cooperacion y de servicio.',4,92,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:25:47'),(010,003,'Su equipo de trabajo y el se ven con buena actitud y cooperacion todos los dias.',3,58,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:25:52'),(011,003,'En ocasiones se aprecia falta de cooperacion entre algunos miembros de su equipo y en el mismo.',2,39,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:25:59'),(012,003,'Deficiencias notables y permanentes en cuanto a cooperacion y actitud de servicio en su equipo y en el mismo.',1,25,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:02'),(013,004,'Siempre es proactivo hacia las necesidades de su cliente.',4,98,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:04'),(014,004,'Normalmente es proactivo hacia las necesidades de su cliente.',3,78,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:05'),(015,004,'A veces espera que el cliente reclame para dar un servicio oportuno.',2,45,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:13'),(016,004,'Siempre brinda un mal servicio a sus clientes originando quejas al respecto.',1,29,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:15'),(017,005,'Siempre se compromete con las metas u objetivos planteados por la empresa.',4,88,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:21'),(018,005,'Normalmente se compromete con las metas y objetivos planteados por la empresa.',3,62,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:23'),(019,005,'A veces se compromete con las metas u objetivos planteados por la empresa.',2,41,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:25'),(020,005,'Nunca se compromete con las metas y objetivos planteados por la empresa.',1,22,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:29'),(021,006,'Ha logrado gran influencia en su equipo la gente sabe a donde va y como hacerlo. Tiene gran seguridad',4,96,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:49'),(022,006,'Ha logrado cierta influencia en su equipo la gente sabe a donde va y como hacerlo. Tiene seguridad.',3,69,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:51'),(023,006,'Poca gente le tiene confianza no ha sabido dirigir a su equipo con seguridad hay dudas de lo que quiere.',2,41,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:54'),(024,006,'Nula confianza y seguridad hacia el por parte de su equipo graves deficiencias de direccion.',1,27.5,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:26:59'),(025,007,'Tiene amplio conocimiento y dominio del puesto.',4,92.4,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:03'),(026,007,'Tiene un buen conocimiento y dominio del puesto.',3,63.7,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:09'),(027,007,'Tiene un conocimiento y dominio regular del puesto.',2,40.3,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:15'),(028,007,'Tiene un conocimiento y dominio deficiente del puesto.',1,28.9,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:19'),(029,008,'Su trabajo no requiere nunca de supervision.',4,92.9,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:26'),(030,008,'Su trabajo normalmente no requiere de supervision.',3,69.8,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:32'),(031,008,'A veces su trabajo requiere de supervision.',2,45.3,'SISTEMAS','2018-05-12 14:44:46','','2018-05-12 16:27:35'),(032,008,'Siempre requiere supervision.',1,28.3,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:27:39'),(033,009,'Siempre es responsable hacia su puesto de trabajo incluso por encima de lo esperado.',4,91,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:27:43'),(034,009,'Normalmente es responsable hacia us funciones de trabajo.',3,71,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:27:45'),(035,009,'Aveces incurre en acciones irresponsables hacia las obligaciones de su puesto de trabajo.',2,52,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:27:48'),(036,009,'Siempre demuestra irresponsabilidad hacia las obligaciones de su puesto de trabajo.',1,24,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:28:07'),(037,010,'Constantemente aporta buenas ideas y sugerencias para desarrollar nuevos procesos con interes de mejorar su trabajo.',4,95,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:28:09'),(038,010,'Normalmente aporta ideas y sugerencias positivas para mejorar su trabajo.',3,69,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:28:11'),(039,010,'Eventualmente aportas ideas y sugerencias positivas en beneficio del trabajo.',2,48,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:28:13'),(040,010,'No aporta ideas ni sugerencias para mejorar su trabajo. Se limita a recibir instrucciones detalladas y guias.',1,27,'SISTEMAS','2018-05-12 14:44:47','','2018-05-12 16:28:14');

/*Table structure for table `dt_evaluacion` */

DROP TABLE IF EXISTS `dt_evaluacion`;

CREATE TABLE `dt_evaluacion` (
  `IDEVALUACION` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHA_APERTURA` date NOT NULL,
  `FECHA_CIERRE` date NOT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT '1' COMMENT '0 INACTIVO / 1 ACTIVO / 2 CONCLUIDO',
  `OBSERVACION` mediumtext COLLATE utf8_spanish2_ci NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDEVALUACION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_evaluacion` */

insert  into `dt_evaluacion`(`IDEVALUACION`,`NOMBRE`,`FECHA_APERTURA`,`FECHA_CIERRE`,`ESTADO`,`OBSERVACION`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (0001,'EVALUACION MAYO 2018','2018-05-07','2018-05-31',1,'','FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23');

/*Table structure for table `dt_evaluacion_detalle` */

DROP TABLE IF EXISTS `dt_evaluacion_detalle`;

CREATE TABLE `dt_evaluacion_detalle` (
  `IDDETALLE` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDEVALUACION` int(4) unsigned zerofill NOT NULL,
  `IDCOMPETENCIA` int(3) unsigned zerofill NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDDETALLE`),
  KEY `FK_IDEVALUACION` (`IDEVALUACION`),
  KEY `IDCOMPETENCIA` (`IDCOMPETENCIA`),
  CONSTRAINT `dt_evaluacion_detalle_ibfk_1` FOREIGN KEY (`IDEVALUACION`) REFERENCES `dt_evaluacion` (`IDEVALUACION`),
  CONSTRAINT `dt_evaluacion_detalle_ibfk_2` FOREIGN KEY (`IDCOMPETENCIA`) REFERENCES `dt_competencia` (`IDCOMPETENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_evaluacion_detalle` */

insert  into `dt_evaluacion_detalle`(`IDDETALLE`,`IDEVALUACION`,`IDCOMPETENCIA`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (0001,0001,001,'FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23'),(0002,0001,002,'FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23'),(0003,0001,003,'FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23'),(0004,0001,004,'FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23'),(0005,0001,005,'FLAURA','2018-05-12 15:18:23','','2018-05-12 15:18:23');

/*Table structure for table `dt_persona` */

DROP TABLE IF EXISTS `dt_persona`;

CREATE TABLE `dt_persona` (
  `IDPERSONA` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `AP_PATERNO` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `AP_MATERNO` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `NUMERODOC` int(8) NOT NULL,
  `CORREO` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` int(9) NOT NULL,
  `TIPOPERSONA` char(4) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'PERS' COMMENT 'PER PERSONAL / USER USUARIO',
  `ESTADO` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1' COMMENT '1 SI / 0 NO',
  `IDAREA` int(2) unsigned zerofill NOT NULL,
  `IDCARGO` int(2) unsigned zerofill NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPERSONA`,`TIPOPERSONA`),
  KEY `FK_IDAREA` (`IDAREA`),
  KEY `FK_IDCARGO` (`IDCARGO`),
  CONSTRAINT `dt_persona_ibfk_1` FOREIGN KEY (`IDAREA`) REFERENCES `dt_area` (`IDAREA`),
  CONSTRAINT `dt_persona_ibfk_2` FOREIGN KEY (`IDCARGO`) REFERENCES `dt_cargo` (`IDCARGO`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_persona` */

insert  into `dt_persona`(`IDPERSONA`,`NOMBRE`,`AP_PATERNO`,`AP_MATERNO`,`NUMERODOC`,`CORREO`,`TELEFONO`,`TIPOPERSONA`,`ESTADO`,`IDAREA`,`IDCARGO`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (0106,'FRANK','LAURA','BORJA',73191639,'FRANK.CG9@GMAIL.COM',993690057,'USER','1',03,01,'FLAURA','2018-04-02 00:00:00','','2018-05-01 13:09:57'),(0114,'NAYSHA','AYALA','GOMERO',85957412,'NAYALA@GMAIL.COM',987654321,'USER','1',03,04,'FLAURA','2018-04-05 11:13:35','','2018-05-01 13:09:35'),(0115,'RENE','LAURA','QUISPE',25732120,'RLAURA@GMAIL.COM',956304110,'USER','1',03,03,'FLAURA','2018-04-10 16:28:00','','2018-05-01 13:08:35'),(0117,'MAGDA','BORJA','EGUILAS',25835280,'MBORJA@GMAIL.COM',997449379,'USER','1',03,02,'FLAURA','2018-04-11 17:32:42','','2018-05-01 13:09:18'),(0118,'RUBEN','GARZON','DARIO',12345678,'',0,'USER','1',01,01,'FLAURA','2018-05-01 12:27:35','','2018-05-01 13:08:46'),(0119,'CHRISTIAN','ALVAREZ','BORJA',98765432,'',0,'USER','1',01,03,'FLAURA','2018-05-01 12:28:33','','2018-05-01 13:09:03'),(0120,'ANTHONY','ORTIZ','CHAPARRO',95135785,'',0,'USER','1',01,04,'FLAURA','2018-05-01 12:30:06','','2018-05-01 13:08:54'),(0121,'3M','','',1,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0122,'AJINOMOTO','','',2,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0123,'ALTOMAYO.','','',3,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0124,'BELOWSAC','','',4,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0125,'BOTICAS ISAFARMA E.I.R.L','','',5,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0126,'COLAGATE-PALMOLIVE','','',6,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0127,'CORPORACION VEGA','','',7,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0128,'DKASA','','',8,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0129,'DURACEL','','',9,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0130,'GLORIA.','','',10,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0131,'IMEVA S.A.C.','','',11,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0132,'LOREAL','','',12,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0133,'MENTOS','','',13,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0134,'MEZA MIRANDA BETSABE MARIA','','',14,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0135,'PECSA','','',15,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0136,'PEDIGRI','','',16,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0137,'PLAZA VEA','','',17,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0138,'PRINGLES','','',18,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0139,'RIPLEY','','',19,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0140,'SC JOHNSON','','',20,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0141,'TICNOLOGY S.A.C.','','',21,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0142,'TOTTUS','','',22,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0143,'VAPE','','',23,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0144,'RRHH','','',24,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0145,'Contabilidad','','',25,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0146,'Sistemas Desarrollo','','',26,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0147,'Codistribución','','',27,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0148,'Comercial','','',28,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0149,'Facturación','','',29,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0150,'Operaciones','','',30,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0151,'Transporte','','',31,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0152,'Soporte de Ventas','','',32,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0153,'Sistemas Infraestructura','','',33,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0154,'Vendedores','','',34,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 17:49:49','','2018-05-01 17:49:49'),(0184,'Cineplanet','','',131,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0185,'Seguros pacifico','','',141,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0186,'IDAT','','',151,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0187,'Cibertec.','','',161,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0188,'IBM','','',171,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0189,'Claro','','',181,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0190,'Microsoft','','',191,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0191,'Omnia Solution','','',201,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13'),(0192,'IN HOUSE','','',211,'',0,'USER','1',12,05,'SISTEMAS','2018-05-01 18:00:13','','2018-05-01 18:00:13');

/*Table structure for table `dt_proveedor` */

DROP TABLE IF EXISTS `dt_proveedor`;

CREATE TABLE `dt_proveedor` (
  `IDPROVEEDOR` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDPERSONA` int(4) unsigned zerofill NOT NULL,
  `NOMBRE` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPROVEEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_proveedor` */

insert  into `dt_proveedor`(`IDPROVEEDOR`,`IDPERSONA`,`NOMBRE`,`FLAG`,`FECHAMOD`) values (01,0132,'LOREAL',1,'2018-05-01 14:56:59'),(02,0121,'3M',1,'2018-05-01 14:56:59'),(03,0126,'COLAGATE-PALMOLIVE',1,'2018-05-01 14:56:59'),(04,0140,'SC JOHNSON',1,'2018-05-01 14:57:00'),(05,0122,'AJINOMOTO',1,'2018-05-01 14:57:00'),(06,0000,'ALTOMAYO',1,'2018-05-01 14:57:00'),(07,0138,'PRINGLES',1,'2018-05-01 14:57:00'),(08,0128,'DKASA',1,'2018-05-01 14:57:00'),(09,0136,'PEDIGRI',1,'2018-05-01 14:57:00'),(10,0129,'DURACEL',1,'2018-05-01 14:57:00'),(11,0143,'VAPE',1,'2018-05-01 14:57:00'),(12,0133,'MENTOS',1,'2018-05-01 14:57:00'),(13,0184,'Cineplanet',1,'2018-05-01 14:57:00'),(14,0185,'Seguros pacifico',1,'2018-05-01 14:57:00'),(15,0186,'IDAT',1,'2018-05-01 14:57:00'),(16,0187,'Cibertec.',1,'2018-05-01 14:57:00'),(17,0188,'IBM',1,'2018-05-01 14:57:00'),(18,0189,'Claro',1,'2018-05-01 14:57:00'),(19,0190,'Microsoft',1,'2018-05-01 14:57:00'),(20,0191,'Omnia Solution',1,'2018-05-01 14:57:00'),(21,0192,'IN HOUSE',1,'2018-05-01 15:25:43');

/*Table structure for table `dt_proveedor_area` */

DROP TABLE IF EXISTS `dt_proveedor_area`;

CREATE TABLE `dt_proveedor_area` (
  `IDPROVEEDOR_AREA` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDPROVEEDOR` int(2) unsigned zerofill NOT NULL,
  `IDAREA` int(2) unsigned zerofill NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPROVEEDOR_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_proveedor_area` */

insert  into `dt_proveedor_area`(`IDPROVEEDOR_AREA`,`IDPROVEEDOR`,`IDAREA`,`FLAG`,`FECHAMOD`) values (001,17,04,1,'2018-05-01 15:07:42'),(002,02,04,1,'2018-05-01 15:07:42'),(003,03,04,1,'2018-05-01 15:07:42'),(004,04,04,1,'2018-05-01 15:07:42'),(005,05,04,1,'2018-05-01 15:07:42'),(006,06,04,1,'2018-05-01 15:07:43'),(007,07,05,1,'2018-05-01 15:09:21'),(008,08,05,1,'2018-05-01 15:09:21'),(009,09,05,1,'2018-05-01 15:09:22'),(010,10,05,1,'2018-05-01 15:09:22'),(011,11,05,1,'2018-05-01 15:09:22'),(012,12,05,1,'2018-05-01 15:09:22'),(013,13,01,1,'2018-05-01 15:10:51'),(014,14,01,1,'2018-05-01 15:10:51'),(015,15,01,1,'2018-05-01 15:10:51'),(016,16,01,1,'2018-05-01 15:10:51'),(017,17,02,1,'2018-05-01 15:11:17'),(018,17,03,1,'2018-05-01 15:24:25'),(019,18,03,1,'2018-05-01 15:24:25'),(020,19,03,1,'2018-05-01 15:24:25'),(021,20,03,1,'2018-05-01 15:24:25'),(022,17,10,1,'2018-05-01 15:24:47'),(023,18,10,1,'2018-05-01 15:24:47'),(024,19,10,1,'2018-05-01 15:24:47'),(025,20,10,1,'2018-05-01 15:24:47'),(026,21,06,1,'2018-05-01 15:26:38'),(027,21,07,1,'2018-05-01 15:26:38'),(028,21,08,1,'2018-05-01 15:26:38'),(029,21,09,1,'2018-05-01 15:26:38'),(030,21,11,1,'2018-05-01 15:26:38');

/*Table structure for table `dt_prueba` */

DROP TABLE IF EXISTS `dt_prueba`;

CREATE TABLE `dt_prueba` (
  `IDPRUEBA` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDASIGNACION` int(5) unsigned zerofill NOT NULL,
  `IDEVALUACION` int(4) unsigned zerofill NOT NULL,
  `IDEVALUADO` int(4) unsigned zerofill NOT NULL,
  `IDEVALUADOR` int(4) unsigned zerofill NOT NULL COMMENT 'idpersona session',
  `IDCOMPETENCIA` int(3) unsigned zerofill NOT NULL,
  `IDCONDUCTA` int(3) unsigned zerofill NOT NULL,
  `CALIFICACION` float NOT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPRUEBA`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_prueba` */

insert  into `dt_prueba`(`IDPRUEBA`,`IDASIGNACION`,`IDEVALUACION`,`IDEVALUADO`,`IDEVALUADOR`,`IDCOMPETENCIA`,`IDCONDUCTA`,`CALIFICACION`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (00001,00001,0001,0115,0106,001,001,91.6,'FLAURA','2018-05-12 16:29:10','','2018-05-12 16:29:11'),(00002,00001,0001,0115,0106,002,005,91.6,'FLAURA','2018-05-12 16:29:10','','2018-05-12 16:29:11'),(00003,00001,0001,0115,0106,003,009,91.6,'FLAURA','2018-05-12 16:29:10','','2018-05-12 16:29:11'),(00004,00001,0001,0115,0106,004,013,91.6,'FLAURA','2018-05-12 16:29:10','','2018-05-12 16:29:11'),(00005,00001,0001,0115,0106,005,017,91.6,'FLAURA','2018-05-12 16:29:11','','2018-05-12 16:29:11'),(00006,00002,0001,0114,0106,001,002,67.4,'FLAURA','2018-05-12 16:29:31','','2018-05-12 16:29:31'),(00007,00002,0001,0114,0106,002,006,67.4,'FLAURA','2018-05-12 16:29:31','','2018-05-12 16:29:31'),(00008,00002,0001,0114,0106,003,010,67.4,'FLAURA','2018-05-12 16:29:31','','2018-05-12 16:29:31'),(00009,00002,0001,0114,0106,004,014,67.4,'FLAURA','2018-05-12 16:29:31','','2018-05-12 16:29:31'),(00010,00002,0001,0114,0106,005,018,67.4,'FLAURA','2018-05-12 16:29:31','','2018-05-12 16:29:31'),(00011,00003,0001,0117,0106,001,004,23.6,'FLAURA','2018-05-12 16:29:56','','2018-05-12 16:29:56'),(00012,00003,0001,0117,0106,002,008,23.6,'FLAURA','2018-05-12 16:29:56','','2018-05-12 16:29:56'),(00013,00003,0001,0117,0106,003,012,23.6,'FLAURA','2018-05-12 16:29:56','','2018-05-12 16:29:56'),(00014,00003,0001,0117,0106,004,016,23.6,'FLAURA','2018-05-12 16:29:56','','2018-05-12 16:29:56'),(00015,00003,0001,0117,0106,005,020,23.6,'FLAURA','2018-05-12 16:29:56','','2018-05-12 16:29:56'),(00016,00002,0001,0114,0114,001,001,91.6,'NAYALA','2018-05-12 16:35:04','','2018-05-12 16:35:05'),(00017,00002,0001,0114,0114,002,005,91.6,'NAYALA','2018-05-12 16:35:04','','2018-05-12 16:35:05'),(00018,00002,0001,0114,0114,003,009,91.6,'NAYALA','2018-05-12 16:35:04','','2018-05-12 16:35:05'),(00019,00002,0001,0114,0114,004,013,91.6,'NAYALA','2018-05-12 16:35:04','','2018-05-12 16:35:05'),(00020,00002,0001,0114,0114,005,017,91.6,'NAYALA','2018-05-12 16:35:04','','2018-05-12 16:35:05'),(00021,00001,0001,0115,0115,001,004,23.6,'RLAURA','2018-05-12 17:01:28','','2018-05-12 17:01:28'),(00022,00001,0001,0115,0115,002,008,23.6,'RLAURA','2018-05-12 17:01:28','','2018-05-12 17:01:28'),(00023,00001,0001,0115,0115,003,012,23.6,'RLAURA','2018-05-12 17:01:28','','2018-05-12 17:01:28'),(00024,00001,0001,0115,0115,004,016,23.6,'RLAURA','2018-05-12 17:01:28','','2018-05-12 17:01:28'),(00025,00001,0001,0115,0115,005,020,23.6,'RLAURA','2018-05-12 17:01:28','','2018-05-12 17:01:28');

/*Table structure for table `dt_usuario` */

DROP TABLE IF EXISTS `dt_usuario`;

CREATE TABLE `dt_usuario` (
  `IDUSUARIO` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `CONTRASENIA` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT '1' COMMENT '1 ACTIVO / 0 INACTIVO',
  `IDPERSONA` int(4) unsigned zerofill NOT NULL,
  `IDPERFIL` int(2) unsigned zerofill DEFAULT NULL,
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDUSUARIO`),
  KEY `fk_idperfil` (`IDPERFIL`),
  KEY `IDPERSONA` (`IDPERSONA`),
  CONSTRAINT `dt_usuario_ibfk_1` FOREIGN KEY (`IDPERSONA`) REFERENCES `dt_persona` (`IDPERSONA`),
  CONSTRAINT `dt_usuario_ibfk_2` FOREIGN KEY (`IDPERFIL`) REFERENCES `seguridad_perfil` (`IDPERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_usuario` */

insert  into `dt_usuario`(`IDUSUARIO`,`CONTRASENIA`,`ESTADO`,`IDPERSONA`,`IDPERFIL`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values ('AORTIZ','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0120,02,'FLAURA','2018-05-01 12:30:06','FLAURA','2018-05-01 12:30:16'),('CALVAREZ','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0119,02,'FLAURA','2018-05-01 12:28:33','FLAURA','2018-05-01 12:29:02'),('CLI_3M','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0121,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_AJINOMOTO','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0122,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_ALTOMAYO.','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0123,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_BELOWSAC','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0124,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_BOTICASIS','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0125,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CIBERTEC.','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0187,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CINEPLANET','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0184,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CLARO','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0189,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CODISTRIBU','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0147,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_COLAGATE-P','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0126,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_COMERCIAL','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0148,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CONTABILID','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0145,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_CORPORACIO','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0127,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_DKASA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0128,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_DURACEL','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0129,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_FACTURACIÓ','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0149,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_GLORIA.','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0130,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_IBM','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0188,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_IDAT','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0186,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_IMEVAS.A.','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0131,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_INHOUSE','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0192,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_LOREAL','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0132,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_MENTOS','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0133,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_MEZAMIRAN','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0134,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_MICROSOFT','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0190,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_OMNIASOLU','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0191,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_OPERACIONE','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0150,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_PECSA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0135,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_PEDIGRI','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0136,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_PLAZAVEA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0137,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_PRINGLES','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0138,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_RIPLEY','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0139,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_RRHH','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0144,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_SCJOHNSON','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0140,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_SEGUROSPA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0185,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_SISTEMASD','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0146,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_SISTEMASI','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0153,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_SOPORTEDE','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0152,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_TICNOLOGY','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0141,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_TOTTUS','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0142,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_TRANSPORTE','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0151,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_VAPE','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0143,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('CLI_VENDEDORES','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0154,02,'SISTEMAS','2018-05-01 18:08:45','','2018-05-01 18:08:45'),('FLAURA','bf5155b3171915cc2cb01975405d06d2ed5b6514',1,0106,01,'FLAURA','2018-04-02 17:45:00','FLAURA','2018-04-10 14:01:52'),('MBORJA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0117,02,'FLAURA','2018-04-11 17:32:42','FLAURA','2018-05-01 19:42:52'),('NAYALA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0114,02,'FLAURA','2018-04-05 11:13:35','FLAURA','2018-05-01 19:42:38'),('RGARZON','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0118,01,'FLAURA','2018-05-01 12:27:35','FLAURA','2018-05-01 12:27:45'),('RLAURA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0115,02,'FLAURA','2018-04-10 16:28:00','FLAURA','2018-04-10 16:28:34');

/*Table structure for table `seguridad_modulo` */

DROP TABLE IF EXISTS `seguridad_modulo`;

CREATE TABLE `seguridad_modulo` (
  `IDMODULO` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE_MODULO` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `DESCRIPCION` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `TIPO` char(20) COLLATE utf8_spanish2_ci NOT NULL,
  `UBICACION` char(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1' COMMENT '1 -> ACTIVO / 0->INACTIVO',
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDMODULO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `seguridad_modulo` */

insert  into `seguridad_modulo`(`IDMODULO`,`NOMBRE_MODULO`,`DESCRIPCION`,`TIPO`,`UBICACION`,`FLAG`,`FECHAMOD`) values (01,'MENU_PANEL','Inicio','MENU_PAN','panel',1,'2018-04-03 16:59:26'),(02,'MENU_SEGURIDAD','Control de Acceso','MENU_SEG','usuario',1,'2018-04-03 16:50:55'),(03,'MENU_COMPETENCIA','Registro de Competencias','MENU_COM','competencia',1,'2018-04-12 10:59:40'),(04,'MENU_EVALUACION','Apertura','MENU_EVA','evaluacion',1,'2018-04-17 14:43:00'),(05,'MENU_ASIGNACION','Asignacion','MENU_EVA','asignacion',1,'2018-04-19 14:14:49'),(06,'MENU_PRUEBA','Pruebas','MENU_EVA','prueba',1,'2018-04-23 10:18:30'),(07,'MENU_INDICADOR_1','Grado de Cumplimiento','MENU_IND','indicador',1,'2018-05-12 17:27:31');

/*Table structure for table `seguridad_modulo_perfil` */

DROP TABLE IF EXISTS `seguridad_modulo_perfil`;

CREATE TABLE `seguridad_modulo_perfil` (
  `IDDETALLE` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IDMODULO` int(2) unsigned zerofill NOT NULL,
  `IDPERFIL` int(2) unsigned zerofill NOT NULL,
  `PERMISO` int(1) NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDDETALLE`),
  KEY `seguridad_modulo_perfil_ibfk_1` (`IDMODULO`),
  KEY `seguridad_modulo_perfil_ibfk_2` (`IDPERFIL`),
  CONSTRAINT `seguridad_modulo_perfil_ibfk_1` FOREIGN KEY (`IDMODULO`) REFERENCES `seguridad_modulo` (`IDMODULO`),
  CONSTRAINT `seguridad_modulo_perfil_ibfk_2` FOREIGN KEY (`IDPERFIL`) REFERENCES `seguridad_perfil` (`IDPERFIL`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `seguridad_modulo_perfil` */

insert  into `seguridad_modulo_perfil`(`IDDETALLE`,`IDMODULO`,`IDPERFIL`,`PERMISO`,`FECHAMOD`) values (0017,02,03,0,'2018-04-10 16:28:40'),(0042,01,02,0,'2018-05-01 12:28:47'),(0043,06,02,0,'2018-05-01 12:28:47'),(0044,01,01,0,'2018-05-12 17:28:12'),(0045,02,01,0,'2018-05-12 17:28:13'),(0046,03,01,0,'2018-05-12 17:28:13'),(0047,04,01,0,'2018-05-12 17:28:13'),(0048,05,01,0,'2018-05-12 17:28:13'),(0049,06,01,0,'2018-05-12 17:28:13'),(0050,07,01,0,'2018-05-12 17:28:13');

/*Table structure for table `seguridad_perfil` */

DROP TABLE IF EXISTS `seguridad_perfil`;

CREATE TABLE `seguridad_perfil` (
  `IDPERFIL` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `NOMBRE_PERFIL` char(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `FLAG` int(1) NOT NULL DEFAULT '1',
  `IDUSUARIOCREACION` char(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPERFIL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `seguridad_perfil` */

insert  into `seguridad_perfil`(`IDPERFIL`,`NOMBRE_PERFIL`,`FLAG`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values (01,'ADMINISTRADOR',1,'','2018-04-05 17:32:48','FLAURA','2018-04-10 14:49:05'),(02,'INVITADO',0,'','2018-04-05 18:02:27','FLAURA','2018-04-10 16:28:24'),(03,'SISTEMAS',1,'','2018-04-10 16:28:18','','2018-04-10 16:28:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
