# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (Arch Linux 11.7.2)
# Database: BaseDeDatosFeb26
# Generation time: 2025-02-26T19:52:10-05:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table alquiler_elementos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alquiler_elementos`;

CREATE TABLE `alquiler_elementos` (
  `id_alquiler` char(10) NOT NULL,
  `nombre_elemento` varchar(50) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `fecha_devolucion` datetime NOT NULL,
  `Registrado_por` varchar(50) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `Identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_alquiler`),
  KEY `Fk_IdentificacionAlqEl` (`Identificacion`),
  CONSTRAINT `Fk_IdentificacionAlqEl` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table RelAsistencia_Ludicas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelAsistencia_Ludicas`;

CREATE TABLE `RelAsistencia_Ludicas` (
  `AsiId` char(10) NOT NULL,
  `IdLudica` varchar(50) NOT NULL,
  KEY `Fk_AsiID` (`AsiId`),
  KEY `Fk_IdLudicasa` (`IdLudica`),
  CONSTRAINT `Fk_AsiID` FOREIGN KEY (`AsiId`) REFERENCES `TablaAsistencia` (`AsiId`),
  CONSTRAINT `Fk_IdLudicasa` FOREIGN KEY (`IdLudica`) REFERENCES `TablaLudicas` (`IdLudica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table RelUsuariosFeedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelUsuariosFeedback`;

CREATE TABLE `RelUsuariosFeedback` (
  `Identificacion` varchar(50) NOT NULL,
  `IdFeedback` varchar(50) NOT NULL,
  KEY `Fk_IdentificacionO` (`Identificacion`),
  KEY `Fk_IdFeedback` (`IdFeedback`),
  CONSTRAINT `Fk_IdFeedback` FOREIGN KEY (`IdFeedback`) REFERENCES `TablaFeedback` (`IdFeedback`),
  CONSTRAINT `Fk_IdentificacionO` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table RelUsuario_Eventos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelUsuario_Eventos`;

CREATE TABLE `RelUsuario_Eventos` (
  `Identificacion` varchar(50) NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  KEY `Fk_Identificacione` (`Identificacion`),
  KEY `Fk_IdEventosoo` (`IdEventos`),
  CONSTRAINT `Fk_IdEventosoo` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`),
  CONSTRAINT `Fk_Identificacione` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaActividades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaActividades`;

CREATE TABLE `TablaActividades` (
  `IdActividades` varchar(50) NOT NULL,
  `NombreActi` varchar(150) NOT NULL,
  `FechaActividad` date NOT NULL,
  `Identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdActividades`),
  KEY `Fk_IdentificacionS` (`Identificacion`),
  CONSTRAINT `Fk_IdentificacionS` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaAsistencia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaAsistencia`;

CREATE TABLE `TablaAsistencia` (
  `AsiId` char(10) NOT NULL,
  `AsiFecha` date DEFAULT NULL,
  `AsiHorasAsistidas` int(11) DEFAULT NULL,
  `Identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`AsiId`),
  KEY `Fk_Identificacion` (`Identificacion`),
  CONSTRAINT `Fk_Identificacion` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaCalendario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaCalendario`;

CREATE TABLE `TablaCalendario` (
  `IdCalendario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCalendario`),
  KEY `Fk_IdEventosA` (`IdEventos`),
  CONSTRAINT `Fk_IdEventosA` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaCertificado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaCertificado`;

CREATE TABLE `TablaCertificado` (
  `CertificadoId` char(12) NOT NULL,
  `CertificadoHorasCert` int(11) DEFAULT NULL,
  `CertificadoEstado` varchar(50) NOT NULL,
  `CertificadoFecha` datetime DEFAULT NULL,
  `Identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`CertificadoId`),
  KEY `Fk_IdentificacionU` (`Identificacion`),
  CONSTRAINT `Fk_IdentificacionU` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaCodigosQR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaCodigosQR`;

CREATE TABLE `TablaCodigosQR` (
  `IdCodigoQr` varchar(50) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `IdLudica` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCodigoQr`),
  KEY `Fk_IdLudicaS` (`IdLudica`),
  CONSTRAINT `Fk_IdLudicaS` FOREIGN KEY (`IdLudica`) REFERENCES `TablaLudicas` (`IdLudica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaConsultaIA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaConsultaIA`;

CREATE TABLE `TablaConsultaIA` (
  `IdConsultaIa` varchar(50) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `Identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdConsultaIa`),
  KEY `Fk_IdentificacionA` (`Identificacion`),
  CONSTRAINT `Fk_IdentificacionA` FOREIGN KEY (`Identificacion`) REFERENCES `TablaUsuarios` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaEventos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaEventos`;

CREATE TABLE `TablaEventos` (
  `IdEventos` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`IdEventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaFeedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaFeedback`;

CREATE TABLE `TablaFeedback` (
  `IdFeedback` varchar(50) NOT NULL,
  `ComentarioFeedback` text NOT NULL,
  `FechaEnvio` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdFeedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaGestionE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaGestionE`;

CREATE TABLE `TablaGestionE` (
  `IdGestionE` varchar(50) NOT NULL,
  `Aprobar` text NOT NULL,
  PRIMARY KEY (`IdGestionE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaHorarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaHorarios`;

CREATE TABLE `TablaHorarios` (
  `IdHorarios` varchar(50) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  PRIMARY KEY (`IdHorarios`),
  KEY `Fk_IdEventosE` (`IdEventos`),
  CONSTRAINT `Fk_IdEventosE` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaLudicas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaLudicas`;

CREATE TABLE `TablaLudicas` (
  `IdLudica` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  PRIMARY KEY (`IdLudica`),
  KEY `Fk_IdEventosN` (`IdEventos`),
  CONSTRAINT `Fk_IdEventosN` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaNotificaciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaNotificaciones`;

CREATE TABLE `TablaNotificaciones` (
  `IdNotificaciones` varchar(50) NOT NULL,
  `mensaje` text NOT NULL,
  `Tipos_Notificaciones` int(11) DEFAULT NULL,
  `fecha_de_envio` date NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  PRIMARY KEY (`IdNotificaciones`),
  KEY `Fk_IdEventos` (`IdEventos`),
  CONSTRAINT `Fk_IdEventos` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaPlanificacionE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaPlanificacionE`;

CREATE TABLE `TablaPlanificacionE` (
  `IdPlanificarE` varchar(50) NOT NULL,
  `NombreEvento` varchar(150) NOT NULL,
  `FechaEvento` datetime NOT NULL,
  `IdEventos` varchar(50) NOT NULL,
  `IdGestionE` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPlanificarE`),
  KEY `Fk_IdEventosS` (`IdEventos`),
  KEY `Fk_IdGestionE` (`IdGestionE`),
  CONSTRAINT `Fk_IdEventosS` FOREIGN KEY (`IdEventos`) REFERENCES `TablaEventos` (`IdEventos`),
  CONSTRAINT `Fk_IdGestionE` FOREIGN KEY (`IdGestionE`) REFERENCES `TablaGestionE` (`IdGestionE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaRoles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaRoles`;

CREATE TABLE `TablaRoles` (
  `IdRoles` varchar(50) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`IdRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of table TablaUsuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TablaUsuarios`;

CREATE TABLE `TablaUsuarios` (
  `Identificacion` varchar(50) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `FechaRegistro` date NOT NULL,
  `IdRoles` varchar(50) NOT NULL,
  PRIMARY KEY (`Identificacion`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `Fk_IdRoles` (`IdRoles`),
  CONSTRAINT `Fk_IdRoles` FOREIGN KEY (`IdRoles`) REFERENCES `TablaRoles` (`IdRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2025-02-26T19:52:10-05:00
