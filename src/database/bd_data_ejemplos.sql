-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: vspolci
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodega` (
  `id_bodega` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `zona` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_bodega`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1,'Ambato-sucursal','Amabto','zona 3'),(2,'Quito sucursal centro','Quito','Zona 2'),(6,'El Salto','Latacunga','Zona 6'),(9,'Vergeles','Guayaquil','zona 4');
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_solicitud`
--

DROP TABLE IF EXISTS `detalle_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_solicitud` (
  `id_detalle_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_solicitud_per` int DEFAULT NULL,
  `id_producto_per` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `detalle_solicitudcol` varchar(255) DEFAULT NULL,
  `cantidad_enviada` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_solicitud`),
  KEY `fk_id_solicitud_detalle_idx` (`id_solicitud_per`),
  KEY `fk_id_producto_detalle_idx` (`id_producto_per`),
  CONSTRAINT `fk_id_producto_detalle` FOREIGN KEY (`id_producto_per`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_id_solicitud_detalle` FOREIGN KEY (`id_solicitud_per`) REFERENCES `solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_solicitud`
--

LOCK TABLES `detalle_solicitud` WRITE;
/*!40000 ALTER TABLE `detalle_solicitud` DISABLE KEYS */;
INSERT INTO `detalle_solicitud` VALUES (3,4,2,10,'Uso interno','Detalles extra',10),(4,4,12,5,'Mantenimiento','Repuesto urgente',3),(5,5,1,12,'motivo uno','detalle sol',2),(6,5,2,8,'motivo dos','detalle__',4),(7,6,12,19,'mot ejem','',0),(8,6,2,4,'moti','',4),(9,7,1,1,'mot','',0),(10,8,12,1,'motivo pedido','',0),(11,9,12,3,'motivo opcion','',0),(12,10,12,3,'motivo','',0),(13,11,2,5,'inventario vacio','',10),(14,12,1,10,'sin inventario por ahora','',10),(15,13,2,15,'por algun motivo','',15),(16,13,1,5,'cinco mas','',5),(17,14,2,7,'intento','',7),(18,15,2,7,'intentar','',7),(19,15,1,4,'asdasd','',4),(20,16,2,4,'pñpl','',4),(21,16,1,2,'qqqq','',2),(22,17,2,2,'lolol','',2),(23,17,1,2,'zzzz','',2),(24,18,2,2,'mmmm','',2),(25,18,1,2,'jjjj','',2),(26,19,2,2,'ffff','',2),(27,20,2,3,'lllll','',3),(28,20,1,2,'vvvvv','',2),(29,21,2,2,'qqqq','',2),(30,21,1,3,'wwwww','',3),(31,22,2,1,'qqqwww','',1),(32,23,2,2,'jh','',2),(33,24,2,1,'ss','',1),(34,25,2,5,'zzzxxxx','',5),(35,26,1,1,'nnnnn','',1),(36,26,12,4,'aaa','',0),(37,27,1,5,'kikki','',5),(38,27,2,3,'dfdfdf','',3),(39,27,12,2,'xccx','',0),(40,28,2,3,'bodega 6','',3),(41,29,16,4,'kjhkjh','',0),(42,30,19,5,'Inexistencia de insumo','',5),(43,31,19,10,'Agregar Insumo','',10);
/*!40000 ALTER TABLE `detalle_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `id_kardex_per` int DEFAULT NULL,
  `numero_oficio` varchar(45) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `nombre_entrada` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `fk_kardex_entrada_idx` (`id_kardex_per`),
  CONSTRAINT `fk_kardex_entrada` FOREIGN KEY (`id_kardex_per`) REFERENCES `kardex` (`id_kardex`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,'OFI001',500,'2024-12-11','2030-12-11',455,'Luis Fernando'),(2,2,'OFI002',500,'2024-12-11','2040-12-11',434,'Luis Zerna'),(3,2,'OFICIO 6',4,'2025-06-09','2040-12-11',4,'Transferido desde solicitud 6'),(4,3,'OFICIO 12',10,'2025-06-10','2030-12-11',0,'transferido por: Quito sucursal centro'),(5,3,'OFICIO 13',5,'2025-06-10','2030-12-11',3,'transferido por: Quito sucursal centro'),(6,3,'OFICIO 15',4,'2025-06-10','2030-12-11',4,'transferido por: Quito sucursal centro'),(7,3,'OFICIO 16',1,'2025-06-10','2030-12-11',1,'transferido por: Quito sucursal centro'),(8,3,'OFICIO 16',1,'2025-06-10','2030-12-11',1,'transferido por: Quito sucursal centro'),(9,4,'OFICIO 17',2,'2025-06-10','2040-12-11',0,'transferido por: Quito sucursal centro'),(10,3,'OFICIO 17',2,'2025-06-10','2030-12-11',2,'transferido por: Quito sucursal centro'),(11,4,'OFICIO 18',2,'2025-06-10','2040-12-11',0,'transferido por: Quito sucursal centro'),(12,3,'OFICIO 18',2,'2025-06-10','2030-12-11',2,'transferido por: Quito sucursal centro'),(13,4,'OFICIO 19',2,'2025-06-10','2040-12-11',2,'transferido por: Quito sucursal centro'),(14,4,'OFICIO 20',3,'2025-06-10','2040-12-11',3,'transferido por: Quito sucursal centro'),(15,3,'OFICIO 20',2,'2025-06-10','2030-12-11',2,'transferido por: Quito sucursal centro'),(16,4,'OFICIO 21',2,'2025-06-10','2040-12-11',2,'transferido por: Quito sucursal centro'),(17,3,'OFICIO 21',3,'2025-06-10','2030-12-11',3,'transferido por: Quito sucursal centro'),(18,4,'OFICIO 22',1,'2025-06-10','2040-12-11',1,'transferido por: Quito sucursal centro'),(19,4,'OFICIO 23',2,'2025-06-10','2040-12-11',2,'transferido por: Quito sucursal centro'),(20,4,'OFICIO 24',1,'2025-06-10','2040-12-11',1,'transferido por: Quito sucursal centro'),(21,4,'OFICIO 25',5,'2025-06-10','2040-12-11',5,'transferido por: Quito sucursal centro'),(29,3,'OFICIO 26',1,'2025-06-10','2030-12-11',1,'transferido por: Quito sucursal centro'),(30,3,'OFICIO 27',5,'2025-06-10','2030-12-11',5,'transferido por: Quito sucursal centro'),(31,4,'OFICIO 27',3,'2025-06-10','2040-12-11',3,'transferido por: Quito sucursal centro'),(32,5,'OFICIO 28',3,'2025-06-11','2040-12-11',3,'transferido por: Quito sucursal centro'),(33,5,'OFICIO 11',10,'2025-06-17','2040-12-11',10,'transferido por: Quito sucursal centro'),(34,6,'OFICIO 29',50,'2025-05-18','2035-12-21',40,'transferido por: DINITEC'),(35,9,'OFICIO 31',10,'2025-06-18','2035-12-21',9,'transferido por: Vergeles'),(36,7,'OFICIO 45',100,'2025-05-18','2030-12-11',100,'transferido por: Quito sucursal centro'),(37,8,'OFICIO 46',250,'2025-06-17','2040-12-11',250,'transferido por: DINITEC'),(38,10,'OFICIO 47',20,'2025-05-18','2035-12-21',20,'transferido por: DINITEC');
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex` (
  `id_kardex` int NOT NULL AUTO_INCREMENT,
  `id_producto_per` int DEFAULT NULL,
  `id_bodega_per` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `estante` varchar(20) DEFAULT NULL,
  `fila` int DEFAULT NULL,
  PRIMARY KEY (`id_kardex`),
  KEY `fk_id_producto_kardex_idx` (`id_producto_per`),
  KEY `fk_id_bodega_kardex_idx` (`id_bodega_per`),
  CONSTRAINT `fk_id_bodega_kardex` FOREIGN KEY (`id_bodega_per`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_id_producto_kardex` FOREIGN KEY (`id_producto_per`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (1,1,2,455,'C',4),(2,2,2,438,'A',2),(3,1,1,24,'B',2),(4,2,1,19,'S/E',1),(5,2,6,13,'S/E',1),(6,19,9,40,'S/E',1),(7,1,9,100,'S/E',1),(8,2,9,250,'S/E',1),(9,19,2,9,'S/E',1),(10,12,9,20,'S/E',1);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `id_usuario_per` int DEFAULT NULL,
  `id_bodega_per` int DEFAULT NULL,
  `permiso` int DEFAULT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `fk_id_bodega_personal_idx` (`id_bodega_per`),
  KEY `fk_id_usuario_personal_idx` (`id_usuario_per`),
  CONSTRAINT `fk_id_bodega_personal` FOREIGN KEY (`id_bodega_per`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_id_usuario_personal` FOREIGN KEY (`id_usuario_per`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,1,2,0),(2,3,1,1),(3,4,1,0),(6,24,6,0),(7,25,9,0);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad_paquete` int DEFAULT NULL,
  `nombre_medida` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `activo` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Hojas papel A4','Hojas de papel A4 para impresiones',100,'unidad','Oficina','A010001',1),(2,'Hojas papel A1','Hojas de papel A3 para impresiones',50,'unidad','Oficina','A020001',1),(12,'Almohadillas para Tinta','Sin Descripcion',1,'unidad','Oficina','B010001',1),(13,'Agusador Electrico','Sin Descripcion',1,'unidad','Oficina','B030001',0),(16,'Borrador de Pizarron','Sin Descripcion',1,'unidad','Oficina','C010002',1),(19,'Cartulina A4','Sin Descripcion',1,'unidad','Oficina','C010003',1),(20,'Cera para dedos crema','Cera mediana de 30gr',1,'unidad','Oficina','AB0002',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida` (
  `id_salida` int NOT NULL AUTO_INCREMENT,
  `id_kardex_per` int DEFAULT NULL,
  `numero_informe` varchar(45) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `id_entrada_per` int DEFAULT NULL,
  `nombre_solicitante` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `disposicion_entrega` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_salida`),
  KEY `fk_kardex_salida_idx` (`id_kardex_per`),
  KEY `fk_entrada_salida_idx` (`id_entrada_per`),
  CONSTRAINT `fk_entrada_salida` FOREIGN KEY (`id_entrada_per`) REFERENCES `entrada` (`id_entrada`),
  CONSTRAINT `fk_kardex_salida` FOREIGN KEY (`id_kardex_per`) REFERENCES `kardex` (`id_kardex`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
INSERT INTO `salida` VALUES (1,1,'001',20,'2025-05-24',1,'Solicitud ejemplo','contabilidad','dispo ejemplo'),(2,2,'002',25,'2025-05-24',2,'Solicita ejemplo','TI','Luis Fernando Zerna Ramos'),(3,2,'003',1,'2025-06-06',2,'Quito','salida','Luis Fernando Zerna Ramos'),(5,2,'APROB-6',4,'2025-06-09',2,'Aprobación de solicitud','Sistema','Transferencia'),(7,1,'OFICIO-12',10,'2025-06-10',1,NULL,NULL,NULL),(8,3,'OFICIO-13',5,'2025-06-10',4,'Quito sucursal centro','Quito','Zona 3'),(9,3,'OFICIO-15',4,'2025-06-10',4,'Quito sucursal centro','Quito','Zona 3'),(10,3,'OFICIO-16',1,'2025-06-10',4,'Quito sucursal centro','Quito','Zona 3'),(11,3,'OFICIO-16',1,'2025-06-10',5,'Quito sucursal centro','Quito','Zona 3'),(12,2,'OFICIO-17',2,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(13,1,'OFICIO-17',2,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(14,2,'OFICIO-18',2,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(15,1,'OFICIO-18',2,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(16,2,'OFICIO-19',2,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(17,2,'OFICIO-20',3,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(18,1,'OFICIO-20',2,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(19,2,'OFICIO-21',2,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(20,1,'OFICIO-21',3,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(21,2,'OFICIO-22',1,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(22,2,'OFICIO-23',2,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(23,2,'OFICIO-24',1,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(24,2,'OFICIO-25',5,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(32,1,'OFICIO-26',1,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(33,1,'OFICIO-27',5,'2025-06-10',1,'Quito sucursal centro','Quito','Zona 3'),(34,2,'OFICIO-27',3,'2025-06-10',2,'Quito sucursal centro','Quito','Zona 3'),(35,2,'OFICIO-28',3,'2025-06-11',2,'Quito sucursal centro','Quito','Zona 3'),(36,2,'OFICIO-11',10,'2025-06-17',2,'Quito sucursal centro','Quito','Zona 3'),(37,3,'OFICIO030',1,'2025-06-18',5,'Teniente Gallo','Contabilidad','Franco Endara'),(38,4,'OFICIO031',2,'2025-06-18',9,'Luis Ramos','Ventas','Franco Endara'),(39,4,'OFICIO033',2,'2025-06-18',11,'Fernando Zerna','Contabilidad','Franco Endara'),(40,6,'OFICIO-31',10,'2025-06-18',34,'Vergeles','Guayaquil','zona 4'),(41,9,'OFICIO 22',1,'2025-06-18',35,'Coronel','Ventas','Luis Fernando Zerna Ramos');
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_bodega_per` int DEFAULT NULL,
  `id_bodega_sol` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_aprobado` date DEFAULT NULL,
  `aprobado` tinyint DEFAULT NULL,
  `id_usuario_sol` int DEFAULT NULL,
  `id_usuario_aprueba` int DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_id_bodega_per_solicitud_idx` (`id_bodega_per`,`id_bodega_sol`),
  KEY `fk_id_usuario_solicitud_idx` (`id_usuario_sol`,`id_usuario_aprueba`),
  KEY `fk_id_bodega_sol_solicitud_idx` (`id_bodega_sol`),
  KEY `fk_id_usuario_apr_solicitud_idx` (`id_usuario_aprueba`),
  CONSTRAINT `fk_id_bodega_per_solicitud` FOREIGN KEY (`id_bodega_per`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_id_bodega_sol_solicitud` FOREIGN KEY (`id_bodega_sol`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_id_usuario_apr_solicitud` FOREIGN KEY (`id_usuario_aprueba`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_sol_solicitud` FOREIGN KEY (`id_usuario_sol`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (4,2,1,'2025-05-27','2025-06-04',1,1,3),(5,2,2,'2025-05-28','2025-05-05',1,1,1),(6,2,2,'2025-05-29','2025-06-09',1,1,1),(7,2,6,'2025-05-29',NULL,0,1,NULL),(8,2,6,'2025-06-05',NULL,0,1,NULL),(9,2,1,'2025-06-06','2025-06-10',1,1,4),(10,2,2,'2025-06-06','2025-06-18',1,1,1),(11,6,2,'2025-06-10','2025-06-17',1,24,1),(12,1,2,'2025-06-10','2025-06-10',1,4,1),(13,1,2,'2025-06-10','2025-06-10',1,4,1),(14,1,2,'2025-06-10','2025-06-10',1,4,1),(15,1,2,'2025-06-10','2025-06-10',1,4,1),(16,1,2,'2025-06-10','2025-06-10',1,4,1),(17,1,2,'2025-06-10','2025-06-10',1,4,1),(18,1,2,'2025-06-10','2025-06-10',1,4,1),(19,1,2,'2025-06-10','2025-06-10',1,4,1),(20,1,2,'2025-06-10','2025-06-10',1,4,1),(21,1,2,'2025-06-10','2025-06-10',1,4,1),(22,1,2,'2025-06-10','2025-06-10',1,4,1),(23,1,2,'2025-06-10','2025-06-10',1,4,1),(24,1,2,'2025-06-10','2025-06-10',1,4,1),(25,1,2,'2025-06-10','2025-06-10',1,4,1),(26,1,2,'2025-06-10','2025-06-10',1,4,1),(27,1,2,'2025-06-10','2025-06-10',1,4,1),(28,6,2,'2025-06-11','2025-06-11',1,24,1),(29,2,1,'2025-06-17',NULL,0,1,NULL),(30,2,9,'2025-06-18','2025-06-18',1,1,25),(31,2,9,'2025-06-18','2025-06-18',1,1,25);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(60) DEFAULT NULL,
  `activo` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Fernando','Zerna Ramos','lzerna1972@uta.edu.ec','123456789',1),(3,'Fernando','Ramos','lzerna19725@uta.edu.ec','987654321',1),(4,'Franco','Endara','lzerna@uta.edu.ec','123456789',1),(24,'Cristian','Lopez','luis@hotmail.com','123456789',0),(25,'Mateo','Medina','mateo@hotmail.com','123456789',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vspolci'
--
/*!50003 DROP PROCEDURE IF EXISTS `crear_asignar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_asignar_usuario`(
	IN p_nombres VARCHAR(50),
    IN p_apellidos VARCHAR (50),
    IN p_correo VARCHAR (50),
    IN p_contrasenia VARCHAR (60),
    IN p_activo BOOLEAN,
    IN p_id_bodega_per INT,
    IN p_permiso INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la inserción de datos.';
    END;

    -- Inicia la transacción
    START TRANSACTION;

    -- Primer INSERT en la tabla usuario
    INSERT INTO usuario (nombres, apellidos, correo, contrasenia, activo)
    VALUES (p_nombres, p_apellidos, p_correo, p_contrasenia, p_activo);

    -- Obtenemos el id del usuario insertado
    SET @new_id_usuario = LAST_INSERT_ID();

    -- Segundo INSERT en la tabla personal
    INSERT INTO personal (id_usuario_per, id_bodega_per, permiso)
    VALUES (@new_id_usuario, p_id_bodega_per, p_permiso);

    -- Confirma la transacción si ambos inserts fueron exitosos
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_bodega`(
	IN p_nombre VARCHAR (100),
    IN p_ciudad VARCHAR (100),
    IN P_zona VARCHAR (100)
)
BEGIN
	INSERT INTO bodega (nombre, ciudad, zona) VALUES (p_nombre, p_ciudad, p_zona);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_insumo`(
	IN p_nombre VARCHAR (255),
    IN p_descripcion VARCHAR (255),
    IN p_cantidad_paquete INT,
    IN p_nombre_medida VARCHAR (100),
    IN p_categoria VARCHAR (100),
    IN p_codigo VARCHAR (100),
    IN p_activo INT
)
BEGIN
	INSERT INTO producto (nombre, descripcion, cantidad_paquete, nombre_medida, categoria, codigo, activo) 
    VALUES (p_nombre, p_descripcion, p_cantidad_paquete, p_nombre_medida, p_categoria, p_codigo, p_activo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editar_bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_bodega`(
	IN p_id_bodega INT,
    IN p_nombre VARCHAR (100),
    IN p_ciudad VARCHAR (100),
    IN p_zona VARCHAR (100)
)
BEGIN
	DECLARE bodega_exists INT DEFAULT 0;
    DECLARE texto_error VARCHAR(100) DEFAULT "Error en la actualización de bodega." ;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = textoError;
    END;
    
    -- Verificar si la bodega existe en la tabla bodega
    SELECT COUNT(*) INTO bodega_exists FROM bodega WHERE id_bodega = p_id_bodega;
    
    IF bodega_exists = 0 THEN
		SET texto_error = 'La bodega especificada no existe en la tabla bodega.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END IF;
    
    START TRANSACTION;

    -- Actualiza los datos en la tabla bodega
    UPDATE bodega
    SET nombre = p_nombre,
        ciudad = p_ciudad,
        zona = p_zona
    WHERE id_bodega = p_id_bodega;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editar_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_insumo`(
	IN p_id_insumo INT,
    IN p_nombre VARCHAR (255),
    IN p_descripcion VARCHAR (255),
    IN p_cantidad_paquete INT,
    IN p_nombre_medida VARCHAR (100),
    IN p_categoria VARCHAR (100),
    IN p_codigo VARCHAR (100),
    IN p_activo INT
)
BEGIN
	DECLARE insumo_exists INT DEFAULT 0;
    DECLARE texto_error VARCHAR(100) DEFAULT "Error en la actualización de insumo." ;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = textoError;
    END;
    
    -- Verificar si la bodega existe en la tabla bodega
    SELECT COUNT(*) INTO insumo_exists FROM producto WHERE id_producto= p_id_insumo;
    
    IF insumo_exists = 0 THEN
		SET texto_error = 'El insumo especificada no existe en la tabla bodega.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END IF;
    
    START TRANSACTION;

    -- Actualiza los datos en la tabla bodega
    UPDATE producto
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        cantidad_paquete = p_cantidad_paquete,
        nombre_medida = p_nombre_medida,
        categoria = p_categoria,
        codigo = p_codigo,
        activo = p_activo
    WHERE id_producto = p_id_insumo;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_usuario`(
	IN p_id_usuario INT,
    IN p_nombres VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_contrasenia VARCHAR(100),
    IN p_activo BOOLEAN,
    IN p_id_bodega_per INT,
    IN p_permiso INT
)
BEGIN
    DECLARE userExists INT DEFAULT 0;
    DECLARE personalExists INT DEFAULT 0;
    DECLARE textoError VARCHAR(100) DEFAULT "Error en la actualización de datos." ;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = textoError;
    END;

    -- Verificar si el usuario existe en la tabla usuario
    SELECT COUNT(*) INTO userExists FROM usuario WHERE id_usuario = p_id_usuario;

    -- Verificar si el usuario tiene un registro en la tabla personal
    SELECT COUNT(*) INTO personalExists FROM personal WHERE id_usuario_per = p_id_usuario;

    -- Si el usuario o su registro en personal no existen, lanzamos un error y finalizamos
    IF userExists = 0 THEN
		SET textoError = 'El usuario especificado no existe en la tabla usuario.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario especificado no existe en la tabla usuario.';
    END IF;

    IF personalExists = 0 THEN
		SET textoError = 'El registro especificado no existe en la tabla personal.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro especificado no existe en la tabla personal.';
    END IF;

    -- Inicia la transacción
    START TRANSACTION;

    -- Actualiza los datos en la tabla usuario
    UPDATE usuario
    SET nombres = p_nombres,
        apellidos = p_apellidos,
        correo = p_correo,
        contrasenia = p_contrasenia,
        activo = p_activo
    WHERE id_usuario = p_id_usuario;

    -- Actualiza los datos en la tabla personal
    UPDATE personal
    SET id_bodega_per = p_id_bodega_per,
        permiso = p_permiso
    WHERE id_usuario_per = p_id_usuario;

    -- Confirma la transacción si ambos updates fueron exitosos
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_bodega`(
	IN p_id_bodega INT
)
BEGIN
	DECLARE bodega_exists INT DEFAULT 0;
    DECLARE texto_error VARCHAR(100) DEFAULT 'Error al intentar eliminar la bodega.' ;

    -- Manejo de errores con una transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END;

    -- Verificar si el usuario existe en la tabla usuario
    SELECT COUNT(*) INTO bodega_exists FROM bodega WHERE id_bodega = p_id_bodega;

    -- Si la bodega no existe, lanzamos un error y terminamos
    IF bodega_exists = 0 THEN
		SET texto_error = 'La bodega especificada no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END IF;


    START TRANSACTION;

    DELETE FROM bodega WHERE id_bodega = p_id_bodega;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_insumo`(
	IN p_id_insumo INT
)
BEGIN
    DECLARE insumo_exists INT DEFAULT 0;
    DECLARE insumo_associated INT DEFAULT 0;
    DECLARE texto_error VARCHAR(100) DEFAULT 'Error al intentar eliminar el insumo.';

    -- Manejo de errores con una transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END;

    -- Verificar si el insumo existe en la tabla `producto`
    SELECT COUNT(*) INTO insumo_exists 
    FROM producto 
    WHERE id_producto = p_id_insumo;

    -- Si el insumo no existe, lanzamos un error y terminamos
    IF insumo_exists = 0 THEN
        SET texto_error = 'El insumo especificado no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = texto_error;
    END IF;

    -- Verificar si el insumo está asociado con otras tablas (por ejemplo, `ordenes`)
    SELECT COUNT(*) INTO insumo_associated
    FROM kardex 
    WHERE id_producto_per = p_id_insumo;

    START TRANSACTION;

    -- Si el insumo está asociado, solo actualizamos el campo `activo` a 0
    IF insumo_associated > 0 THEN
        UPDATE producto
        SET activo = 0
        WHERE id_producto = p_id_insumo;
    ELSE
        -- Si no está asociado, eliminamos el insumo
        DELETE FROM producto 
        WHERE id_producto = p_id_insumo;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario`(
	IN p_id_usuario INT
)
BEGIN
	DECLARE userExists INT DEFAULT 0;
    DECLARE textoError VARCHAR(100) DEFAULT 'Error al intentar eliminar el usuario.' ;

    -- Manejo de errores con una transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revertimos la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = textoError;
    END;

    -- Verificar si el usuario existe en la tabla usuario
    SELECT COUNT(*) INTO userExists FROM usuario WHERE id_usuario = p_id_usuario;

    -- Si el usuario no existe, lanzamos un error y terminamos
    IF userExists = 0 THEN
		SET textoError = 'El usuario especificado no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario especificado no existe.';
    END IF;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Eliminar el registro en la tabla personal primero, si existe
    DELETE FROM personal WHERE id_usuario_per = p_id_usuario;

    -- Eliminar el registro en la tabla usuario
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;

    -- Confirmar la transacción si ambos DELETE fueron exitosos
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enviar_solicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enviar_solicitud`(
	IN p_id_bodega_per INT,
    IN p_id_bodega_sol INT,
    IN p_fecha_emision DATE,
    IN p_id_usuario_sol INT,
    IN p_pedido_json JSON
)
BEGIN
  DECLARE v_id_solicitud INT;
  DECLARE i INT DEFAULT 0;
  DECLARE total_items INT;

  -- Manejo de errores
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    -- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al registrar la solicitud.';
  END;

  START TRANSACTION;

  -- 1. Crear cabecera solicitud
  INSERT INTO solicitud (
    id_bodega_per,
    id_bodega_sol,
    fecha_emision,
    fecha_aprobado,
    aprovado,
    id_usuario_sol,
    id_usuario_aprueba
  ) VALUES (
    p_id_bodega_per,
    p_id_bodega_sol,
    p_fecha_emision,
    NULL,
    0,
    p_id_usuario_sol,
    NULL
  );

  SET v_id_solicitud = LAST_INSERT_ID();
  SET total_items = JSON_LENGTH(p_pedido_json);

  -- 2. Insertar detalles
  WHILE i < total_items DO
    INSERT INTO detalle_solicitud (
      id_solicitud_per,
      id_producto_per,
      cantidad,
      motivo,
      detalle_solicitudcol,
      cantidad_enviada
    ) VALUES (
      v_id_solicitud,
      CAST(JSON_UNQUOTE(JSON_EXTRACT(p_pedido_json, CONCAT('$[', i, '].id_producto_per'))) AS UNSIGNED),
      CAST(JSON_UNQUOTE(JSON_EXTRACT(p_pedido_json, CONCAT('$[', i, '].cantidad'))) AS UNSIGNED),
      JSON_UNQUOTE(JSON_EXTRACT(p_pedido_json, CONCAT('$[', i, '].motivo'))),
      JSON_UNQUOTE(JSON_EXTRACT(p_pedido_json, CONCAT('$[', i, '].detalle_solicitud'))),
      0
    );

    SET i = i + 1;
  END WHILE;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listado_de_estados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_de_estados`(
	IN p_id_bodega INT
)
BEGIN
SELECT
    s.id_solicitud,
    b.nombre AS nombre_bodega,
    s.fecha_emision,
    s.fecha_aprobado,
    CONCAT(u1.nombres, ' ', u1.apellidos) AS usuario_solicitante,
    CONCAT(u2.nombres, ' ', u2.apellidos) AS usuario_aprobador,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id_producto_per', ds.id_producto_per,
            'nombre_producto', p.nombre,
            'cantidad', ds.cantidad,
            'cantidad_enviada', ds.cantidad_enviada
        )
    ) AS productos
FROM solicitud s
JOIN bodega b ON b.id_bodega = s.id_bodega_sol
LEFT JOIN usuario u1 ON u1.id_usuario = s.id_usuario_sol
LEFT JOIN usuario u2 ON u2.id_usuario = s.id_usuario_aprueba
JOIN detalle_solicitud ds ON ds.id_solicitud_per = s.id_solicitud
JOIN producto p ON p.id_producto = ds.id_producto_per
WHERE s.id_bodega_per = p_id_bodega
GROUP BY s.id_solicitud, b.nombre, s.fecha_emision, s.fecha_aprobado, u1.nombres, u1.apellidos, u2.nombres, u2.apellidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listado_de_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_de_pedidos`(
IN p_id_bodega INT
)
BEGIN
SELECT
    s.id_solicitud,
    b.nombre AS nombre_bodega,
    s.fecha_emision,
    s.fecha_aprobado,
    CONCAT(u1.nombres, ' ', u1.apellidos) AS usuario_solicitante,
    CONCAT(u2.nombres, ' ', u2.apellidos) AS usuario_aprobador,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id_producto_per', ds.id_producto_per,
            'nombre_producto', p.nombre,
            'cantidad', ds.cantidad,
            'cantidad_enviada', ds.cantidad_enviada,
            'id_kardex', (select id_kardex from kardex k where k.id_producto_per = ds.id_producto_per AND k.id_bodega_per = s.id_bodega_sol),
            'id_detalle_solicitud', ds.id_detalle_solicitud
        )
    ) AS productos
FROM solicitud s
JOIN bodega b ON b.id_bodega = s.id_bodega_per
LEFT JOIN usuario u1 ON u1.id_usuario = s.id_usuario_sol
LEFT JOIN usuario u2 ON u2.id_usuario = s.id_usuario_aprueba
JOIN detalle_solicitud ds ON ds.id_solicitud_per = s.id_solicitud
JOIN producto p ON p.id_producto = ds.id_producto_per
WHERE s.id_bodega_sol = p_id_bodega
GROUP BY s.id_solicitud, b.nombre, s.fecha_emision, s.fecha_aprobado, u1.nombres, u1.apellidos, u2.nombres, u2.apellidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
	IN p_correo VARCHAR (100),
    IN p_contrasenia VARCHAR (100)
)
BEGIN
	SELECT 
        u.id_usuario, 
        u.nombres, 
        u.apellidos, 
        u.contrasenia, 
        u.correo, 
        u.activo, 
        p.id_bodega_per, 
        p.permiso 
    FROM 
        usuario u
    INNER JOIN 
        personal p ON u.id_usuario = p.id_usuario_per
    WHERE 
        u.correo = p_correo AND u.contrasenia = p_contrasenia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_salida_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_salida_insumo`(
	IN p_id_kardex INT,
    IN p_cantidad INT,
    IN p_numero_informe VARCHAR(45),
    IN p_nombre_solicitante VARCHAR(255),
    IN p_area VARCHAR(255),
    IN p_disposicion_entrega VARCHAR(255)
)
BEGIN
	DECLARE v_restante INT;
    DECLARE v_entrada_id INT;
    DECLARE v_existencia INT;
    DECLARE v_consumir INT;
    DECLARE done INT DEFAULT FALSE;

    -- Cursor para recorrer entradas disponibles
    DECLARE cur CURSOR FOR
        SELECT id_entrada, existencia
        FROM entrada
        WHERE id_kardex_per = p_id_kardex AND existencia > 0
        ORDER BY id_entrada ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    START TRANSACTION;

    SET v_restante = p_cantidad;

    OPEN cur;

    leer_loop: LOOP
        FETCH cur INTO v_entrada_id, v_existencia;
        IF done THEN
            LEAVE leer_loop;
        END IF;

        IF v_restante <= 0 THEN
            LEAVE leer_loop;
        END IF;

        -- Determinar cuánto consumir de esta entrada
        SET v_consumir = LEAST(v_restante, v_existencia);

        -- Insertar en salida
        INSERT INTO salida (
            id_kardex_per,
            numero_informe,
            cantidad,
            fecha_salida,
            id_entrada_per,
            nombre_solicitante,
            area,
            disposicion_entrega
        )
        VALUES (
            p_id_kardex,
            p_numero_informe,
            v_consumir,
            CURRENT_DATE,
            v_entrada_id,
            p_nombre_solicitante,
            p_area,
            p_disposicion_entrega
        );

        -- Actualizar existencia en entrada
        UPDATE entrada
        SET existencia = existencia - v_consumir
        WHERE id_entrada = v_entrada_id;

        -- Restar del restante
        SET v_restante = v_restante - v_consumir;
    END LOOP;

    CLOSE cur;

    -- Recalcular y actualizar cantidad total en kardex
    UPDATE kardex
    SET cantidad = (
        SELECT IFNULL(SUM(existencia), 0)
        FROM entrada
        WHERE id_kardex_per = p_id_kardex
    )
    WHERE id_kardex = p_id_kardex;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_bodega_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_bodega_id`(
	IN p_id_bodega INT
)
BEGIN
	SELECT * FROM bodega WHERE id_bodega = p_id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_insumo_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_insumo_id`(
	IN p_id_insumo INT
)
BEGIN
	SELECT * FROM producto p WHERE p.id_producto = p_id_insumo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_todas_bodegas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_todas_bodegas`()
BEGIN
	SELECT * FROM bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_todoas_bodegas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_todoas_bodegas`()
BEGIN
	SELECT * FROM bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_todos_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_todos_insumos`()
BEGIN
	SELECT * FROM producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_todos_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_todos_usuarios`()
BEGIN
	SELECT u.id_usuario, u.nombres, u.apellidos, u.contrasenia, u.correo, u.activo, p.permiso, p.id_bodega_per, b.nombre as nombre_bodega
    FROM usuario u, personal p, bodega b 
    WHERE u.id_usuario = p.id_usuario_per AND b.id_bodega = p.id_bodega_per;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_todo_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_todo_inventario`(
	IN p_id_bodega INT
)
BEGIN
	SELECT 
		k.id_kardex, 
		p.nombre, 
		p.descripcion, 
		k.cantidad, 
		p.cantidad_paquete, 
		p.nombre_medida, 
		p.categoria, 
		p.codigo,
        k.estante,
        k.fila,
        p.id_producto
    FROM 
		kardex k, 
		producto p 
    WHERE 
		k.id_producto_per = p.id_producto 
        AND k.id_bodega_per = p_id_bodega ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_usuario_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_usuario_id`(
	IN p_id_usuario INT
)
BEGIN
	SELECT 
        u.id_usuario, 
        u.nombres, 
        u.apellidos, 
        u.contrasenia, 
        u.correo, 
        u.activo, 
        p.id_bodega_per, 
        p.permiso 
    FROM 
        usuario u
    INNER JOIN 
        personal p ON u.id_usuario = p.id_usuario_per
    WHERE 
        u.id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-18 13:42:35
