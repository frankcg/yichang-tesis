/*
SQLyog Ultimate v12.5.0 (64 bit)
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
  `IDUSUARIOCREACION` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHACREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOMOD` char(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHAMOD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDPERSONA`,`TIPOPERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dt_persona` */

insert  into `dt_persona`(`IDPERSONA`,`NOMBRE`,`AP_PATERNO`,`AP_MATERNO`,`NUMERODOC`,`CORREO`,`TELEFONO`,`TIPOPERSONA`,`ESTADO`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values 
(0106,'FRANK','LAURA','BORJA',73191639,'FRANK.CG9@GMAIL.COM',993690057,'USER','1','FLAURA','2018-04-02 00:00:00','','2018-04-05 10:51:02'),
(0114,'NAYSHA','AYALA','GOMERO',85957412,'NAYALA@GMAIL.COM',987654321,'USER','1','FLAURA','2018-04-05 11:13:35','','2018-04-05 11:13:35');

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

insert  into `dt_usuario`(`IDUSUARIO`,`CONTRASENIA`,`ESTADO`,`IDPERSONA`,`IDPERFIL`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values 
('FLAURA','bf5155b3171915cc2cb01975405d06d2ed5b6514',1,0106,NULL,'FLAURA','2018-04-02 17:45:00','FLAURA','2018-04-05 17:30:58'),
('NAYALA','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,0114,NULL,'FLAURA','2018-04-05 11:13:35','FLAURA','2018-04-05 11:19:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `seguridad_modulo` */

insert  into `seguridad_modulo`(`IDMODULO`,`NOMBRE_MODULO`,`DESCRIPCION`,`TIPO`,`UBICACION`,`FLAG`,`FECHAMOD`) values 
(01,'MENU_PANEL','Inicio','MENU_PAN','panel',1,'2018-04-03 16:59:26'),
(02,'MENU_SEGURIDAD','Control de Acceso','MENU_SEG','usuario',1,'2018-04-03 16:50:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `seguridad_modulo_perfil` */

insert  into `seguridad_modulo_perfil`(`IDDETALLE`,`IDMODULO`,`IDPERFIL`,`PERMISO`,`FECHAMOD`) values 
(0007,01,02,0,'2018-04-05 18:02:28'),
(0008,01,01,0,'2018-04-05 18:02:31'),
(0009,02,01,0,'2018-04-05 18:02:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `seguridad_perfil` */

insert  into `seguridad_perfil`(`IDPERFIL`,`NOMBRE_PERFIL`,`FLAG`,`IDUSUARIOCREACION`,`FECHACREACION`,`IDUSUARIOMOD`,`FECHAMOD`) values 
(01,'ADMINISTRADOR',1,'','2018-04-05 17:32:48','','2018-04-05 17:32:48'),
(02,'INVITADO',1,'','2018-04-05 18:02:27','','2018-04-05 18:02:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
