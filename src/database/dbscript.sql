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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1,'Ambato-sucursal','Amabto','zona 3'),(2,'Quito sucursal centro','Quito','Zona 3'),(6,'Bodega Ejemplo','Salcedo','Zona 6');
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
  `detalle_solicitudcol` varchar(45) DEFAULT NULL,
  `cantidad_enviada` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_solicitud`),
  KEY `fk_id_solicitud_detalle_idx` (`id_solicitud_per`),
  KEY `fk_id_producto_detalle_idx` (`id_producto_per`),
  CONSTRAINT `fk_id_producto_detalle` FOREIGN KEY (`id_producto_per`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_id_solicitud_detalle` FOREIGN KEY (`id_solicitud_per`) REFERENCES `solicitud` (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_solicitud`
--

LOCK TABLES `detalle_solicitud` WRITE;
/*!40000 ALTER TABLE `detalle_solicitud` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,'OFI001',500,'2024-12-11','2030-12-11',500,'Luis Fernando'),(2,2,'OFI002',500,'2024-12-11','2040-12-11',500,'Luis Zerna');
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
  `estante` varchar(1) DEFAULT NULL,
  `fila` int DEFAULT NULL,
  PRIMARY KEY (`id_kardex`),
  KEY `fk_id_producto_kardex_idx` (`id_producto_per`),
  KEY `fk_id_bodega_kardex_idx` (`id_bodega_per`),
  CONSTRAINT `fk_id_bodega_kardex` FOREIGN KEY (`id_bodega_per`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_id_producto_kardex` FOREIGN KEY (`id_producto_per`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (1,1,2,500,'A',1),(2,2,2,500,'A',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,1,2,0),(2,3,1,1),(3,4,2,1),(6,24,6,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Hojas papel A4','Hojas de papel A4 para impresiones',100,'unidad','Oficina','A010001',1),(2,'Hojas papel A1','Hojas de papel A3 para impresiones',50,'unidad','Oficina','A020001',1),(12,'ejemp','asd',10,'unidad','oficina','b002',1),(13,'eje alert','alertass',50,'unidad','oficina','a002',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Fernando','Zerna Ramos','lzerna1972@uta.edu.ec','123456789',1),(3,'Fernando','Ramosss','lzerna19725@uta.edu.ec','987654321',1),(4,'LuFer','ZerRa','lzerna@uta.edu.ec','123456789',1),(24,'luxor','zerna','luxZerna@hotmail.com','123456789',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vspolci'
--

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

-- Dump completed on 2025-05-14 21:29:05
