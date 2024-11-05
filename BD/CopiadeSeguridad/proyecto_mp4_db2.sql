-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 10:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto_mp4_db2`
--

-- --------------------------------------------------------

--
-- Table structure for table `factura_pedido`
--

CREATE TABLE `factura_pedido` (
  `ID_factura_pedido` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_papeleria`
--

CREATE TABLE `log_papeleria` (
  `ID_log` int(11) NOT NULL,
  `u_cedula` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos_producto`
--

CREATE TABLE `pedidos_producto` (
  `ID_pedidos_producto` int(11) NOT NULL,
  `ID_factura_pedido` int(11) DEFAULT NULL,
  `codigo_barras` varchar(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `codigo_barras` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `promocion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(8) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `factura_pedido`
--
ALTER TABLE `factura_pedido`
  ADD PRIMARY KEY (`ID_factura_pedido`),
  ADD KEY `cedula` (`cedula`);

--
-- Indexes for table `log_papeleria`
--
ALTER TABLE `log_papeleria`
  ADD PRIMARY KEY (`ID_log`),
  ADD KEY `u_cedula` (`u_cedula`);

--
-- Indexes for table `pedidos_producto`
--
ALTER TABLE `pedidos_producto`
  ADD PRIMARY KEY (`ID_pedidos_producto`),
  ADD KEY `codigo_barras` (`codigo_barras`),
  ADD KEY `ID_factura_pedido` (`ID_factura_pedido`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo_barras`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura_pedido`
--
ALTER TABLE `factura_pedido`
  ADD CONSTRAINT `factura_pedido_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);

--
-- Constraints for table `log_papeleria`
--
ALTER TABLE `log_papeleria`
  ADD CONSTRAINT `log_papeleria_ibfk_1` FOREIGN KEY (`u_cedula`) REFERENCES `usuario` (`cedula`);

--
-- Constraints for table `pedidos_producto`
--
ALTER TABLE `pedidos_producto`
  ADD CONSTRAINT `pedidos_producto_ibfk_1` FOREIGN KEY (`codigo_barras`) REFERENCES `producto` (`codigo_barras`),
  ADD CONSTRAINT `pedidos_producto_ibfk_2` FOREIGN KEY (`ID_factura_pedido`) REFERENCES `factura_pedido` (`ID_factura_pedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
