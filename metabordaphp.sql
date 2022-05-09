-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2022 a las 14:06:22
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `metabordaphp`
--
CREATE DATABASE IF NOT EXISTS `metabordaphp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `metabordaphp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bordados`
--

DROP TABLE IF EXISTS `bordados`;
CREATE TABLE `bordados` (
  `idBordado` int(11) NOT NULL,
  `dimensionBordado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `composicionBordado` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `idProductoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `bordados`
--

INSERT INTO `bordados` (`idBordado`, `dimensionBordado`, `composicionBordado`, `idProductoFK`) VALUES
(1, '30 x 30 cm', 'Cojin con 5gr de relleno de poliester', 1),
(2, '60 x 60 cm', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nifCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosCliente` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `domicilioCliente` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `poblacionCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `provinciaCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `codigoPostalCliente` varchar(5) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correoElectronicoCliente` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nifCliente`, `nombreCliente`, `apellidosCliente`, `domicilioCliente`, `poblacionCliente`, `provinciaCliente`, `codigoPostalCliente`, `telefonoCliente`, `correoElectronicoCliente`) VALUES
(1, '123456', 'Nombre Cliente1', 'Apellidos Cliente1', 'Domicilio Cliente1', 'Poblacion Cliente1', 'Provincia Cliente1', '50009', '666666666', 'cliente1@email.com'),
(2, '222222', 'Nombre Cliente2', 'Apellidos Cliente2', 'Domicilio Cliente2', 'Poblacion Cliente2', 'Provincia Cliente2', '50008', '666666666', 'cliente2@email.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `idCompra` int(11) NOT NULL,
  `fechaCompra` date NOT NULL,
  `montoTotalCompra` decimal(15,2) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `idVendedorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompra`, `fechaCompra`, `montoTotalCompra`, `idClienteFK`, `idVendedorFK`) VALUES
(1, '2022-03-24', '75.00', 1, 1),
(2, '2022-03-25', '50.00', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_compras`
--

DROP TABLE IF EXISTS `lineas_compras`;
CREATE TABLE `lineas_compras` (
  `idLineaCompra` int(11) NOT NULL,
  `cantidadLineaCompra` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `idCompraFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `lineas_compras`
--

INSERT INTO `lineas_compras` (`idLineaCompra`, `cantidadLineaCompra`, `idProductoFK`, `idCompraFK`) VALUES
(1, 5, 1, 1),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

DROP TABLE IF EXISTS `materiales`;
CREATE TABLE `materiales` (
  `idMaterial` int(11) NOT NULL,
  `usoMaterial` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `esPackMaterial` tinyint(4) NOT NULL,
  `contenidoPackMaterial` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `idProductoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`idMaterial`, `usoMaterial`, `esPackMaterial`, `contenidoPackMaterial`, `idProductoFK`) VALUES
(1, 'Se usa para bordar sobre cojines', 0, NULL, 1),
(2, 'Se utiliza para tejer a crochet durante horas', 1, '9 agujas de ganchillo de aluminio', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `codigoProducto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreProducto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcionProducto` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precioProducto` decimal(15,2) NOT NULL,
  `cantidadDisponibleProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `codigoProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `cantidadDisponibleProducto`) VALUES
(1, 'P00001', 'Nombre Producto1', 'Descripcion Producto1', '15.00', 100),
(2, 'P00002', 'Nombre Producto2', 'Descripcion Producto2', '20.00', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `idVendedor` int(11) NOT NULL,
  `dniVendedor` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreVendedor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosVendedor` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoVendedor` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correoElectronicoVendedor` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idVendedorSupervisorFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`idVendedor`, `dniVendedor`, `nombreVendedor`, `apellidosVendedor`, `telefonoVendedor`, `correoElectronicoVendedor`, `idVendedorSupervisorFK`) VALUES
(1, '111111111', 'Nombre Vendedor1', 'Apellidos Vendedor1', '666666666', 'vendedor1@email.com', NULL),
(2, '222222222', 'Nombre Vendedor2', 'Apellidos Vendedor2', '666666666', 'vendedor2@email.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bordados`
--
ALTER TABLE `bordados`
  ADD PRIMARY KEY (`idBordado`),
  ADD KEY `idProductoFK` (`idProductoFK`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idClienteFK` (`idClienteFK`),
  ADD KEY `idVendedorFK` (`idVendedorFK`);

--
-- Indices de la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  ADD PRIMARY KEY (`idLineaCompra`),
  ADD KEY `idProductoFK` (`idProductoFK`),
  ADD KEY `idCompraFK` (`idCompraFK`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`idMaterial`),
  ADD KEY `idProductoFK` (`idProductoFK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idVendedor`),
  ADD KEY `idVendedorSupervisorFK` (`idVendedorSupervisorFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bordados`
--
ALTER TABLE `bordados`
  MODIFY `idBordado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  MODIFY `idLineaCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bordados`
--
ALTER TABLE `bordados`
  ADD CONSTRAINT `bordados_ibfk_1` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idVendedorFK`) REFERENCES `vendedores` (`idVendedor`);

--
-- Filtros para la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  ADD CONSTRAINT `lineas_compras_ibfk_1` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `lineas_compras_ibfk_2` FOREIGN KEY (`idCompraFK`) REFERENCES `compras` (`idCompra`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`idVendedorSupervisorFK`) REFERENCES `vendedores` (`idVendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
