-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para estudiantes_db
CREATE DATABASE IF NOT EXISTS `estudiantes_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estudiantes_db`;

-- Volcando estructura para tabla estudiantes_db.carreras
CREATE TABLE IF NOT EXISTS `carreras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `decano` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `CarreraID` int NOT NULL,
  `CreditosDisponibles` int DEFAULT '120',
  `FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Cedula` (`Cedula`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `CarreraID` (`CarreraID`),
  CONSTRAINT `estudiantes_fk_carrera` FOREIGN KEY (`CarreraID`) REFERENCES `carreras` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `Descripcion` text,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Tipo` varchar(50) DEFAULT 'Personal',
  `UsuarioID` int DEFAULT NULL,
  `Color` varchar(20) DEFAULT 'primary',
  PRIMARY KEY (`ID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `eventos_fk_usuario` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.inscripciones
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EstudianteID` int NOT NULL,
  `MateriaID` int NOT NULL,
  `FechaInscripcion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Estado` varchar(20) DEFAULT 'Activa',
  `Nota` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EstudianteID` (`EstudianteID`),
  KEY `MateriaID` (`MateriaID`),
  CONSTRAINT `inscripciones_fk_estudiante` FOREIGN KEY (`EstudianteID`) REFERENCES `estudiantes` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `inscripciones_fk_materia` FOREIGN KEY (`MateriaID`) REFERENCES `materias` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Creditos` int NOT NULL,
  `CarreraID` int DEFAULT NULL,
  `ProfesorID` int DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `CarreraID` (`CarreraID`),
  KEY `ProfesorID` (`ProfesorID`),
  CONSTRAINT `materias_fk_carrera` FOREIGN KEY (`CarreraID`) REFERENCES `carreras` (`id`) ON DELETE SET NULL,
  CONSTRAINT `materias_fk_profesor` FOREIGN KEY (`ProfesorID`) REFERENCES `profesores` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.profesores
CREATE TABLE IF NOT EXISTS `profesores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Cedula` (`Cedula`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla estudiantes_db.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Rol` varchar(50) DEFAULT 'Admin',
  `FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
