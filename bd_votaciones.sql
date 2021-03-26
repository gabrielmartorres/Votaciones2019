-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_votaciones
DROP DATABASE IF EXISTS `bd_votaciones`;
CREATE DATABASE IF NOT EXISTS `bd_votaciones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_votaciones`;

-- Volcando estructura para tabla bd_votaciones.candidatos
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE IF NOT EXISTS `candidatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_apellidos` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `id_partido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__partido` (`id_partido`),
  CONSTRAINT `FK__partido` FOREIGN KEY (`id_partido`) REFERENCES `partido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.candidatos: ~20 rows (aproximadamente)
DELETE FROM `candidatos`;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` (`id`, `nombre_apellidos`, `orden`, `id_partido`) VALUES
	(1, 'María Pérez Segoia', 1, 1),
	(2, 'Emilio Zamora', 2, 1),
	(3, 'Darcy Gioconda Cárdenas', 3, 1),
	(4, 'Sergio León', 4, 1),
	(5, ' Manuel González Ramos', 1, 2),
	(6, ' Lisa Vilches', 2, 2),
	(7, 'José Carlos Díaz ', 3, 2),
	(8, 'Estefanía Escribano', 4, 2),
	(9, 'María Dolores Arteaga', 1, 3),
	(10, 'Hugo Guillén', 2, 3),
	(11, 'Ana Isabel Martínez', 3, 3),
	(12, 'Cristian Cuerda', 4, 3),
	(13, 'Carmen Navarro', 1, 4),
	(14, 'Manuel Serrano', 2, 4),
	(15, 'Manuel Serena', 3, 4),
	(16, 'Cristina García', 4, 4),
	(17, 'Rafa Fernández-Lomana', 1, 5),
	(18, 'Juan Francisco Robles', 2, 5),
	(19, 'Remedios Gil', 3, 5),
	(20, 'María Teresa Fernández Lara', 4, 5);
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;

-- Volcando estructura para tabla bd_votaciones.parametros
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE IF NOT EXISTS `parametros` (
  `id` int(11) NOT NULL,
  `circuscripcion` varchar(50) DEFAULT NULL,
  `candidatos_elegir` int(11) DEFAULT NULL,
  `tipo_consulta` enum('Generales','Locales','Autonómicas','Europeas') DEFAULT NULL,
  `fecha_consulta` date DEFAULT NULL,
  `estado_escrutinio` enum('cerrado','abierto','finalizado') DEFAULT NULL,
  `frase` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.parametros: ~1 rows (aproximadamente)
DELETE FROM `parametros`;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` (`id`, `circuscripcion`, `candidatos_elegir`, `tipo_consulta`, `fecha_consulta`, `estado_escrutinio`, `frase`) VALUES
	(1, 'Albacete', 4, 'Generales', '2019-11-10', 'finalizado', NULL);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;

-- Volcando estructura para tabla bd_votaciones.partido
DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(50) NOT NULL,
  `siglas` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `votos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.partido: ~5 rows (aproximadamente)
DELETE FROM `partido`;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` (`id`, `denominacion`, `siglas`, `logo`, `votos`) VALUES
	(1, 'Partido Popular', 'PP', '../img/pp.png', 26588),
	(2, 'Partido Socialista Obrero Español', 'PSOE', '../img/psoe.png', 27074),
	(3, 'Unidas Podemos', 'UP', '../img/podemos.png', 10218),
	(4, 'Ciudadanos', 'CS', '../img/ciudadanos.png', 8711),
	(5, 'VOX', 'VOX', '../img/vox.png', 20478);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;

-- Volcando estructura para tabla bd_votaciones.votante
DROP TABLE IF EXISTS `votante`;
CREATE TABLE IF NOT EXISTS `votante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `fecha_nac` date NOT NULL,
  `password` varbinary(200) NOT NULL,
  `votado` enum('S','N') NOT NULL DEFAULT 'N',
  `rol` enum('Votante','Administrador') NOT NULL DEFAULT 'Votante',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.votante: ~2 rows (aproximadamente)
DELETE FROM `votante`;
/*!40000 ALTER TABLE `votante` DISABLE KEYS */;
INSERT INTO `votante` (`id`, `nif`, `nombre`, `apellidos`, `domicilio`, `fecha_nac`, `password`, `votado`, `rol`) VALUES
	(15, '47088380C', 'Gabriel', 'mt', 'calle g', '2019-12-02', _binary 0xEDBE8673BB486CB8115AEFFF4D5CA163, 'N', 'Administrador'),
	(20, '1', 'Pepe', 'López Nuñez', 'La paz 2', '2019-11-25', _binary 0x7774DCAE788D0DB12B83FD1BBFF34815, 'N', 'Votante');
/*!40000 ALTER TABLE `votante` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
