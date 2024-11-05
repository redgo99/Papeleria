-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: proyecto_mp4_db2
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `factura_pedido`
--

DROP TABLE IF EXISTS `factura_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_pedido` (
  `ID_factura_pedido` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_factura_pedido`),
  KEY `cedula` (`cedula`),
  CONSTRAINT `factura_pedido_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_pedido`
--

LOCK TABLES `factura_pedido` WRITE;
/*!40000 ALTER TABLE `factura_pedido` DISABLE KEYS */;
INSERT INTO `factura_pedido` VALUES (1,'2024-11-01','camilo.reyes@gmail.com','Tarjeta de Crédito',100000.00,19000.00,10000.00,109000.00,'123456789'),(2,'2024-11-02','sofia.martinez@hotmail.com','Efectivo',200000.00,38000.00,20000.00,218000.00,'987654321'),(3,'2024-11-03','juan.perez@yahoo.com','PayPal',150000.00,28500.00,15000.00,163500.00,'111222333'),(4,'2024-11-04','laura.gutierrez@outlook.com','Transferencia',250000.00,47500.00,25000.00,272500.00,'444555666'),(5,'2024-11-05','david.lopez@gmail.com','Efectivo',80000.00,15200.00,5000.00,90200.00,'777888999'),(6,'2024-11-06','veronica.sanchez@correo.com','Tarjeta de Crédito',300000.00,57000.00,30000.00,327000.00,'000111222'),(7,'2024-11-07','alejandro.castillo@protonmail.com','PayPal',120000.00,22800.00,12000.00,130800.00,'333444555'),(8,'2024-11-08','jessica.narvaez@gmail.com','Transferencia',40000.00,7600.00,4000.00,43600.00,'666777888'),(9,'2024-11-09','santiago.munoz@hotmail.com','Efectivo',220000.00,41800.00,22000.00,239800.00,'999000111'),(10,'2024-11-10','catalina.ramirez@yahoo.com','Tarjeta de Crédito',180000.00,34200.00,18000.00,196200.00,'222333444');
/*!40000 ALTER TABLE `factura_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insert_factura_pedido

AFTER INSERT ON factura_pedido

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_nuevo, usuario)

    VALUES ('factura_pedido', 'INSERT', NEW.ID_factura_pedido, CONCAT('Costo: ', NEW.costo, ', Impuesto: ', NEW.impuesto, ', Total: ', NEW.costo_total), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_update_factura_pedido

AFTER UPDATE ON factura_pedido

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, valor_nuevo, usuario)

    VALUES ('factura_pedido', 'UPDATE', OLD.ID_factura_pedido, CONCAT('Costo: ', OLD.costo, ', Impuesto: ', OLD.impuesto, ', Total: ', OLD.costo_total), CONCAT('Costo: ', NEW.costo, ', Impuesto: ', NEW.impuesto, ', Total: ', NEW.costo_total), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delete_factura_pedido

AFTER DELETE ON factura_pedido

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, usuario)

    VALUES ('factura_pedido', 'DELETE', OLD.ID_factura_pedido, CONCAT('Costo: ', OLD.costo, ', Impuesto: ', OLD.impuesto, ', Total: ', OLD.costo_total), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_papeleria`
--

DROP TABLE IF EXISTS `log_papeleria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_papeleria` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `operacion` varchar(10) DEFAULT NULL,
  `id_registro` int(11) DEFAULT NULL,
  `valor_anterior` text DEFAULT NULL,
  `valor_nuevo` text DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_papeleria`
--

LOCK TABLES `log_papeleria` WRITE;
/*!40000 ALTER TABLE `log_papeleria` DISABLE KEYS */;
INSERT INTO `log_papeleria` VALUES (1,'usuario','INSERT',1004776193,NULL,'Nombre: Alejandro Díaz, Correo: alejandro.diaz@ucp.edu.co, Rol: Admin','root@localhost','2024-10-30 22:54:23'),(2,'producto','INSERT',100001,NULL,'Nombre: Cuaderno, Precio: 15000.00','root@localhost','2024-11-03 04:03:52'),(3,'producto','INSERT',100002,NULL,'Nombre: Bolígrafo, Precio: 2000.00','root@localhost','2024-11-03 04:03:52'),(4,'producto','INSERT',100003,NULL,'Nombre: Lápiz, Precio: 800.00','root@localhost','2024-11-03 04:03:52'),(5,'producto','INSERT',100004,NULL,'Nombre: Goma, Precio: 1200.00','root@localhost','2024-11-03 04:03:52'),(6,'producto','INSERT',100005,NULL,'Nombre: Marcador, Precio: 3000.00','root@localhost','2024-11-03 04:03:52'),(7,'producto','INSERT',100006,NULL,'Nombre: Resma de papel, Precio: 25000.00','root@localhost','2024-11-03 04:03:52'),(8,'producto','INSERT',100007,NULL,'Nombre: Tijeras, Precio: 10000.00','root@localhost','2024-11-03 04:03:52'),(9,'producto','INSERT',100008,NULL,'Nombre: Carpeta, Precio: 5000.00','root@localhost','2024-11-03 04:03:52'),(10,'producto','INSERT',100009,NULL,'Nombre: Pegamento, Precio: 2500.00','root@localhost','2024-11-03 04:03:52'),(11,'producto','INSERT',100010,NULL,'Nombre: Papel para fotocopia, Precio: 15000.00','root@localhost','2024-11-03 04:03:52'),(12,'usuario','INSERT',123456789,NULL,'Nombre: Camilo Reyes, Correo: camilo.reyes@gmail.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(13,'usuario','INSERT',987654321,NULL,'Nombre: Sofía Martínez, Correo: sofia.martinez@hotmail.com, Rol: Administrador','root@localhost','2024-11-03 04:03:52'),(14,'usuario','INSERT',111222333,NULL,'Nombre: Juan Pérez, Correo: juan.perez@yahoo.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(15,'usuario','INSERT',444555666,NULL,'Nombre: Laura Gutiérrez, Correo: laura.gutierrez@outlook.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(16,'usuario','INSERT',777888999,NULL,'Nombre: David López, Correo: david.lopez@gmail.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(17,'usuario','INSERT',111222,NULL,'Nombre: Verónica Sánchez, Correo: veronica.sanchez@correo.com, Rol: Administrador','root@localhost','2024-11-03 04:03:52'),(18,'usuario','INSERT',333444555,NULL,'Nombre: Alejandro Castillo, Correo: alejandro.castillo@protonmail.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(19,'usuario','INSERT',666777888,NULL,'Nombre: Jessica Narváez, Correo: jessica.narvaez@gmail.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(20,'usuario','INSERT',999000111,NULL,'Nombre: Santiago Muñoz, Correo: santiago.munoz@hotmail.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(21,'usuario','INSERT',222333444,NULL,'Nombre: Catalina Ramírez, Correo: catalina.ramirez@yahoo.com, Rol: Cliente','root@localhost','2024-11-03 04:03:52'),(22,'factura_pedido','INSERT',1,NULL,'Costo: 100000.00, Impuesto: 19000.00, Total: 109000.00','root@localhost','2024-11-03 04:03:52'),(23,'factura_pedido','INSERT',2,NULL,'Costo: 200000.00, Impuesto: 38000.00, Total: 218000.00','root@localhost','2024-11-03 04:03:52'),(24,'factura_pedido','INSERT',3,NULL,'Costo: 150000.00, Impuesto: 28500.00, Total: 163500.00','root@localhost','2024-11-03 04:03:52'),(25,'factura_pedido','INSERT',4,NULL,'Costo: 250000.00, Impuesto: 47500.00, Total: 272500.00','root@localhost','2024-11-03 04:03:52'),(26,'factura_pedido','INSERT',5,NULL,'Costo: 80000.00, Impuesto: 15200.00, Total: 90200.00','root@localhost','2024-11-03 04:03:52'),(27,'factura_pedido','INSERT',6,NULL,'Costo: 300000.00, Impuesto: 57000.00, Total: 327000.00','root@localhost','2024-11-03 04:03:52'),(28,'factura_pedido','INSERT',7,NULL,'Costo: 120000.00, Impuesto: 22800.00, Total: 130800.00','root@localhost','2024-11-03 04:03:52'),(29,'factura_pedido','INSERT',8,NULL,'Costo: 40000.00, Impuesto: 7600.00, Total: 43600.00','root@localhost','2024-11-03 04:03:52'),(30,'factura_pedido','INSERT',9,NULL,'Costo: 220000.00, Impuesto: 41800.00, Total: 239800.00','root@localhost','2024-11-03 04:03:52'),(31,'factura_pedido','INSERT',10,NULL,'Costo: 180000.00, Impuesto: 34200.00, Total: 196200.00','root@localhost','2024-11-03 04:03:52'),(32,'pedidos_producto','INSERT',1,NULL,'Cantidad: 2, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(33,'pedidos_producto','INSERT',2,NULL,'Cantidad: 1, Estado: En proceso','root@localhost','2024-11-03 04:03:52'),(34,'pedidos_producto','INSERT',3,NULL,'Cantidad: 3, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(35,'pedidos_producto','INSERT',4,NULL,'Cantidad: 1, Estado: En proceso','root@localhost','2024-11-03 04:03:52'),(36,'pedidos_producto','INSERT',5,NULL,'Cantidad: 4, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(37,'pedidos_producto','INSERT',6,NULL,'Cantidad: 2, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(38,'pedidos_producto','INSERT',7,NULL,'Cantidad: 5, Estado: En proceso','root@localhost','2024-11-03 04:03:52'),(39,'pedidos_producto','INSERT',8,NULL,'Cantidad: 3, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(40,'pedidos_producto','INSERT',9,NULL,'Cantidad: 2, Estado: En proceso','root@localhost','2024-11-03 04:03:52'),(41,'pedidos_producto','INSERT',10,NULL,'Cantidad: 4, Estado: Entregado','root@localhost','2024-11-03 04:03:52'),(42,'producto','DELETE',100001,'Nombre: Cuaderno, Precio: 15000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(43,'producto','DELETE',100002,'Nombre: Bolígrafo, Precio: 2000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(44,'producto','DELETE',100003,'Nombre: Lápiz, Precio: 800.00',NULL,'root@localhost','2024-11-04 17:58:43'),(45,'producto','DELETE',100004,'Nombre: Goma, Precio: 1200.00',NULL,'root@localhost','2024-11-04 17:58:43'),(46,'producto','DELETE',100005,'Nombre: Marcador, Precio: 3000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(47,'producto','DELETE',100006,'Nombre: Resma de papel, Precio: 25000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(48,'producto','DELETE',100007,'Nombre: Tijeras, Precio: 10000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(49,'producto','DELETE',100008,'Nombre: Carpeta, Precio: 5000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(50,'producto','DELETE',100009,'Nombre: Pegamento, Precio: 2500.00',NULL,'root@localhost','2024-11-04 17:58:43'),(51,'producto','DELETE',100010,'Nombre: Papel para fotocopia, Precio: 15000.00',NULL,'root@localhost','2024-11-04 17:58:43'),(52,'producto','INSERT',2147483647,NULL,'Nombre: Lápiz, Precio: 500.00','root@localhost','2024-11-04 18:05:59'),(53,'producto','INSERT',2147483647,NULL,'Nombre: Bolígrafo, Precio: 800.00','root@localhost','2024-11-04 18:05:59'),(54,'producto','INSERT',2147483647,NULL,'Nombre: Cuaderno, Precio: 3500.00','root@localhost','2024-11-04 18:05:59'),(55,'producto','INSERT',2147483647,NULL,'Nombre: Hoja Carta, Precio: 12000.00','root@localhost','2024-11-04 18:05:59'),(56,'producto','INSERT',2147483647,NULL,'Nombre: Carpeta, Precio: 2500.00','root@localhost','2024-11-04 18:05:59'),(57,'producto','INSERT',2147483647,NULL,'Nombre: Goma de borrar, Precio: 300.00','root@localhost','2024-11-04 18:05:59'),(58,'producto','INSERT',2147483647,NULL,'Nombre: Tijeras, Precio: 2500.00','root@localhost','2024-11-04 18:05:59'),(59,'producto','INSERT',2147483647,NULL,'Nombre: Pegamento, Precio: 1500.00','root@localhost','2024-11-04 18:05:59'),(60,'producto','INSERT',2147483647,NULL,'Nombre: Marcador, Precio: 2000.00','root@localhost','2024-11-04 18:05:59'),(61,'producto','INSERT',2147483647,NULL,'Nombre: Corrector, Precio: 2500.00','root@localhost','2024-11-04 18:05:59'),(62,'producto','INSERT',2147483647,NULL,'Nombre: Regla, Precio: 1200.00','root@localhost','2024-11-04 18:05:59'),(63,'producto','INSERT',2147483647,NULL,'Nombre: Sacapuntas, Precio: 600.00','root@localhost','2024-11-04 18:05:59'),(64,'producto','INSERT',2147483647,NULL,'Nombre: Cartulina, Precio: 1000.00','root@localhost','2024-11-04 18:05:59'),(65,'producto','INSERT',2147483647,NULL,'Nombre: Colores, Precio: 5000.00','root@localhost','2024-11-04 18:05:59'),(66,'producto','INSERT',2147483647,NULL,'Nombre: Resaltador, Precio: 1500.00','root@localhost','2024-11-04 18:05:59'),(67,'producto','INSERT',2147483647,NULL,'Nombre: Engrapadora, Precio: 4500.00','root@localhost','2024-11-04 18:05:59'),(68,'producto','INSERT',2147483647,NULL,'Nombre: Cinta adhesiva, Precio: 1200.00','root@localhost','2024-11-04 18:05:59'),(69,'producto','INSERT',2147483647,NULL,'Nombre: Post-it, Precio: 3000.00','root@localhost','2024-11-04 18:05:59'),(70,'producto','INSERT',2147483647,NULL,'Nombre: Clips, Precio: 800.00','root@localhost','2024-11-04 18:05:59'),(71,'producto','INSERT',2147483647,NULL,'Nombre: Papel adhesivo, Precio: 8500.00','root@localhost','2024-11-04 18:05:59'),(72,'producto','DELETE',2147483647,'Nombre: Regla, Precio: 1200.00',NULL,'root@localhost','2024-11-04 19:58:29'),(73,'producto','DELETE',2147483647,'Nombre: Sacapuntas, Precio: 600.00',NULL,'root@localhost','2024-11-04 19:58:29'),(74,'producto','DELETE',2147483647,'Nombre: Cartulina, Precio: 1000.00',NULL,'root@localhost','2024-11-04 19:58:29'),(75,'producto','DELETE',2147483647,'Nombre: Colores, Precio: 5000.00',NULL,'root@localhost','2024-11-04 19:58:29'),(76,'producto','DELETE',2147483647,'Nombre: Resaltador, Precio: 1500.00',NULL,'root@localhost','2024-11-04 19:58:29'),(77,'producto','DELETE',2147483647,'Nombre: Engrapadora, Precio: 4500.00',NULL,'root@localhost','2024-11-04 19:58:29'),(78,'producto','DELETE',2147483647,'Nombre: Cinta adhesiva, Precio: 1200.00',NULL,'root@localhost','2024-11-04 19:58:29'),(79,'producto','DELETE',2147483647,'Nombre: Post-it, Precio: 3000.00',NULL,'root@localhost','2024-11-04 19:58:29'),(80,'producto','DELETE',2147483647,'Nombre: Clips, Precio: 800.00',NULL,'root@localhost','2024-11-04 19:58:29'),(81,'producto','DELETE',2147483647,'Nombre: Papel adhesivo, Precio: 8500.00',NULL,'root@localhost','2024-11-04 19:58:29'),(82,'producto','INSERT',0,NULL,'Nombre: s, Precio: 123.00','root@localhost','2024-11-04 20:39:41'),(83,'producto','INSERT',123,NULL,'Nombre: wrghj, Precio: 15000.00','root@localhost','2024-11-04 20:42:06'),(84,'producto','INSERT',1952,NULL,'Nombre: Test, Precio: 15000.00','root@localhost','2024-11-04 20:47:35'),(85,'producto','INSERT',12345678,NULL,'Nombre: Test, Precio: 15000.00','root@localhost','2024-11-04 20:48:23'),(86,'producto','DELETE',12345678,'Nombre: Test, Precio: 15000.00',NULL,'root@localhost','2024-11-04 20:58:11'),(87,'producto','DELETE',1952,'Nombre: Test, Precio: 15000.00',NULL,'root@localhost','2024-11-04 20:58:17'),(88,'producto','DELETE',0,'Nombre: s, Precio: 123.00',NULL,'root@localhost','2024-11-04 20:58:38'),(89,'producto','UPDATE',123,'Nombre: wrghj, Precio: 15000.00','Nombre: Carlos, Precio: 1256.00','root@localhost','2024-11-04 21:01:00'),(90,'producto','DELETE',123,'Nombre: Carlos, Precio: 1256.00',NULL,'root@localhost','2024-11-04 21:01:49'),(91,'producto','INSERT',12345675,NULL,'Nombre: Carlos, Precio: 15000.00','root@localhost','2024-11-04 21:14:18'),(92,'producto','INSERT',123456752,NULL,'Nombre: Mnak, Precio: 20000.00','root@localhost','2024-11-04 21:18:14'),(93,'producto','DELETE',123456752,'Nombre: Mnak, Precio: 20000.00',NULL,'root@localhost','2024-11-04 21:18:32'),(94,'producto','DELETE',12345675,'Nombre: Carlos, Precio: 15000.00',NULL,'root@localhost','2024-11-04 21:23:13'),(95,'producto','INSERT',12345678,NULL,'Nombre: Papel bond, Precio: 50000.00','root@localhost','2024-11-04 21:29:14'),(96,'producto','DELETE',12345678,'Nombre: Papel bond, Precio: 50000.00',NULL,'root@localhost','2024-11-04 21:53:01'),(97,'producto','INSERT',2147483647,NULL,'Nombre: Bloc de notas, Precio: 8500.00','root@localhost','2024-11-04 21:56:33'),(98,'producto','INSERT',2147483647,NULL,'Nombre: Papel carbón, Precio: 15000.00','root@localhost','2024-11-04 22:04:51');
/*!40000 ALTER TABLE `log_papeleria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_producto`
--

DROP TABLE IF EXISTS `pedidos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_producto` (
  `ID_pedidos_producto` int(11) NOT NULL,
  `ID_factura_pedido` int(11) DEFAULT NULL,
  `codigo_barras` varchar(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_pedidos_producto`),
  KEY `pedidos_producto_ibfk_1` (`codigo_barras`),
  KEY `pedidos_producto_ibfk_2` (`ID_factura_pedido`),
  CONSTRAINT `pedidos_producto_ibfk_1` FOREIGN KEY (`codigo_barras`) REFERENCES `producto` (`codigo_barras`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `pedidos_producto_ibfk_2` FOREIGN KEY (`ID_factura_pedido`) REFERENCES `factura_pedido` (`ID_factura_pedido`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_producto`
--

LOCK TABLES `pedidos_producto` WRITE;
/*!40000 ALTER TABLE `pedidos_producto` DISABLE KEYS */;
INSERT INTO `pedidos_producto` VALUES (1,1,NULL,2,'Entregado'),(2,1,NULL,1,'En proceso'),(3,2,NULL,3,'Entregado'),(4,3,NULL,1,'En proceso'),(5,4,NULL,4,'Entregado'),(6,5,NULL,2,'Entregado'),(7,6,NULL,5,'En proceso'),(8,7,NULL,3,'Entregado'),(9,8,NULL,2,'En proceso'),(10,9,NULL,4,'Entregado');
/*!40000 ALTER TABLE `pedidos_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insert_pedidos_producto

AFTER INSERT ON pedidos_producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_nuevo, usuario)

    VALUES ('pedidos_producto', 'INSERT', NEW.ID_pedidos_producto, CONCAT('Cantidad: ', NEW.cantidad, ', Estado: ', NEW.estado), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_update_pedidos_producto

AFTER UPDATE ON pedidos_producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, valor_nuevo, usuario)

    VALUES ('pedidos_producto', 'UPDATE', OLD.ID_pedidos_producto, CONCAT('Cantidad: ', OLD.cantidad, ', Estado: ', OLD.estado), CONCAT('Cantidad: ', NEW.cantidad, ', Estado: ', NEW.estado), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delete_pedidos_producto

AFTER DELETE ON pedidos_producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, usuario)

    VALUES ('pedidos_producto', 'DELETE', OLD.ID_pedidos_producto, CONCAT('Cantidad: ', OLD.cantidad, ', Estado: ', OLD.estado), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `codigo_barras` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `imagen` longblob NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `promocion` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_barras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('7701234357990','Papel carbón','',15,'Papel carbón para calcar',15000.00,'Papelería','2'),('7701234567890','Lápiz','',100,'Lápiz de grafito HB',500.00,'Útiles escolares',''),('7701234567891','Bolígrafo','',200,'Bolígrafo de tinta negra',800.00,'Útiles escolares',''),('7701234567892','Cuaderno','',150,'Cuaderno cuadriculado 100 hojas',3500.00,'Papelería',''),('7701234567893','Hoja Carta','',500,'Paquete de 500 hojas tamaño carta',12000.00,'Papelería',''),('7701234567894','Carpeta','',80,'Carpeta tamaño oficio color negro',2500.00,'Papelería',''),('7701234567895','Goma de borrar','',300,'Goma de borrar blanca',300.00,'Útiles escolares',''),('7701234567896','Tijeras','',60,'Tijeras escolares de 15 cm',2500.00,'Útiles escolares',''),('7701234567897','Pegamento','',200,'Pegamento en barra de 20 g',1500.00,'Útiles escolares',''),('7701234567898','Marcador','',150,'Marcador negro para pizarra',2000.00,'Útiles escolares',''),('7701234567899','Corrector','',80,'Corrector líquido de 20 ml',2500.00,'Útiles escolares',''),('7701234567990','Bloc de notas','',10,'Bloc cuadriculado de 120 hojas',8500.00,'Papelería','0');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insert_producto

AFTER INSERT ON producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_nuevo, usuario)

    VALUES ('producto', 'INSERT', NEW.codigo_barras, CONCAT('Nombre: ', NEW.nombre, ', Precio: ', NEW.precio), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_update_producto

AFTER UPDATE ON producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, valor_nuevo, usuario)

    VALUES ('producto', 'UPDATE', OLD.codigo_barras, CONCAT('Nombre: ', OLD.nombre, ', Precio: ', OLD.precio), CONCAT('Nombre: ', NEW.nombre, ', Precio: ', NEW.precio), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delete_producto

AFTER DELETE ON producto

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, usuario)

    VALUES ('producto', 'DELETE', OLD.codigo_barras, CONCAT('Nombre: ', OLD.nombre, ', Precio: ', OLD.precio), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(8) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('000111222','Verónica Sánchez','veronica.sanchez@correo.com','pass5161','3006543210','Calle 67 #90-12','Administrador'),('1004776193','Alejandro Díaz','alejandro.diaz@ucp.edu.co','1234','3116340023','Cra 18','Admin'),('111222333','Juan Pérez','juan.perez@yahoo.com','pass9101','3004567890','Calle 34 #12-34','Cliente'),('123456789','Camilo Reyes','camilo.reyes@gmail.com','pass1234','3001234567','Calle 12 #34-56','Cliente'),('222333444','Catalina Ramírez','catalina.ramirez@yahoo.com','pass3244','3002109876','Calle 1 #78-90','Cliente'),('333444555','Alejandro Castillo','alejandro.castillo@protonmail.com','pass7181','3005432109','Calle 78 #12-34','Cliente'),('444555666','Laura Gutiérrez','laura.gutierrez@outlook.com','pass1121','3002345678','Calle 45 #56-78','Cliente'),('666777888','Jessica Narváez','jessica.narvaez@gmail.com','pass9202','3004321098','Calle 89 #34-56','Cliente'),('777888999','David López','david.lopez@gmail.com','pass3141','3008765432','Calle 56 #78-90','Cliente'),('987654321','Sofía Martínez','sofia.martinez@hotmail.com','pass5678','3007654321','Calle 23 #78-90','Administrador'),('999000111','Santiago Muñoz','santiago.munoz@hotmail.com','pass1223','3003210987','Calle 90 #56-78','Cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insert_usuario

AFTER INSERT ON usuario

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_nuevo, usuario)

    VALUES ('usuario', 'INSERT', NEW.cedula, CONCAT('Nombre: ', NEW.nombre, ', Correo: ', NEW.correo, ', Rol: ', NEW.rol), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_update_usuario

AFTER UPDATE ON usuario

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, valor_nuevo, usuario)

    VALUES ('usuario', 'UPDATE', OLD.cedula, CONCAT('Nombre: ', OLD.nombre, ', Correo: ', OLD.correo, ', Rol: ', OLD.rol), CONCAT('Nombre: ', NEW.nombre, ', Correo: ', NEW.correo, ', Rol: ', NEW.rol), USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delete_usuario

AFTER DELETE ON usuario

FOR EACH ROW

BEGIN

    INSERT INTO log_papeleria (tabla_afectada, operacion, id_registro, valor_anterior, usuario)

    VALUES ('usuario', 'DELETE', OLD.cedula, CONCAT('Nombre: ', OLD.nombre, ', Correo: ', OLD.correo, ', Rol: ', OLD.rol), USER());

END */;;
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

-- Dump completed on 2024-11-04 17:16:04
