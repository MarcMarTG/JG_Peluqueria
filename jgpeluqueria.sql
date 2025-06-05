-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2024 a las 15:57:32
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jgpeluqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aperturas`
--

CREATE TABLE `aperturas` (
  `idaperturas` int(11) NOT NULL,
  `ape_fecha` date NOT NULL,
  `ape_monto` int(11) NOT NULL,
  `ape_estado` varchar(15) NOT NULL,
  `idusuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aperturas`
--

INSERT INTO `aperturas` (`idaperturas`, `ape_fecha`, `ape_monto`, `ape_estado`, `idusuarios`) VALUES
(19, '2024-12-08', 1111, 'CERRADA', 1),
(20, '2024-12-11', 10000, 'CERRADA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierres`
--

CREATE TABLE `cierres` (
  `idcierre` int(11) NOT NULL,
  `cie_fecha` date NOT NULL,
  `cie_monto` int(11) NOT NULL,
  `idaperturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cierres`
--

INSERT INTO `cierres` (`idcierre`, `cie_fecha`, `cie_monto`, `idaperturas`) VALUES
(18, '2024-12-09', 2000, 19),
(19, '2024-12-15', 500000, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idciudades` int(11) NOT NULL,
  `ciu_nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idciudades`, `ciu_nombre`) VALUES
(1, 'Itaugua'),
(2, 'Capiata'),
(3, 'Caacupe'),
(4, 'Ypakarai'),
(5, 'Atyra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idclientes` int(11) NOT NULL,
  `cli_nombre` varchar(30) NOT NULL,
  `cli_apellido` varchar(30) NOT NULL,
  `cli_ruc` varchar(15) NOT NULL,
  `cli_telefono` varchar(15) NOT NULL,
  `idciudades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `cli_nombre`, `cli_apellido`, `cli_ruc`, `cli_telefono`, `idciudades`) VALUES
(1, 'Aracely', 'Arrua', '5221321', '0981485456', 2),
(2, 'Esteban', 'Benitez', '5236632', '0982562232', 4),
(3, 'Bruno', 'Yampey', '5632236', '0985632214', 3),
(4, 'Agustin', 'Ruiz', '5412632', '0983652124', 3),
(5, 'Piero', 'Garcia', '5462123', '09854125412', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros`
--

CREATE TABLE `cobros` (
  `idcobros` int(11) NOT NULL,
  `cob_fecha` date NOT NULL,
  `cob_estado` varchar(10) NOT NULL,
  `idclientes` int(11) NOT NULL,
  `idaperturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cobros`
--

INSERT INTO `cobros` (`idcobros`, `cob_fecha`, `cob_estado`, `idclientes`, `idaperturas`) VALUES
(1, '2024-12-15', 'COBRADO', 1, 20),
(2, '2024-12-15', 'COBRADO', 2, 20),
(3, '2024-12-15', 'COBRADO', 3, 20),
(4, '2024-12-15', 'COBRADO', 4, 20),
(5, '2024-12-15', 'COBRADO', 5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompras` int(11) NOT NULL,
  `com_fecha` date NOT NULL,
  `com_condicion` varchar(8) DEFAULT NULL,
  `com_estado` varchar(10) DEFAULT NULL,
  `idusuarios` int(11) NOT NULL,
  `idproveedores` int(11) NOT NULL,
  `idaperturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompras`, `com_fecha`, `com_condicion`, `com_estado`, `idusuarios`, `idproveedores`, `idaperturas`) VALUES
(1, '2024-11-15', 'CONTADO', 'PAGADO', 1, 2, 20),
(2, '2024-11-15', 'CONTADO', 'PAGADO', 1, 1, 20),
(3, '2024-11-15', 'CONTADO', 'PAGADO', 1, 5, 20),
(4, '2024-11-15', 'CONTADO', 'PAGADO', 1, 5, 20),
(5, '2024-11-15', 'CONTADO', 'PAGADO', 1, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecobros`
--

CREATE TABLE `detallecobros` (
  `idcobros` int(11) NOT NULL,
  `idventas` int(11) NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecobros`
--

INSERT INTO `detallecobros` (`idcobros`, `idventas`, `monto`) VALUES
(1, 5, 60000),
(2, 1, 45000),
(3, 2, 65000),
(4, 3, 35000),
(5, 4, 30000);

--
-- Disparadores `detallecobros`
--
DELIMITER $$
CREATE TRIGGER `actualizar_estado_venta` AFTER INSERT ON `detallecobros` FOR EACH ROW BEGIN
    UPDATE ventas
    SET ven_estado = 'COBRADO'
    WHERE idventas = NEW.idventas; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idcompras` int(11) NOT NULL,
  `idproductos` int(11) NOT NULL,
  `det_precio` int(11) NOT NULL,
  `det_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`idcompras`, `idproductos`, `det_precio`, `det_cantidad`) VALUES
(1, 1, 25000, 4),
(1, 5, 35000, 2),
(2, 1, 25000, 2),
(2, 5, 35000, 5),
(3, 1, 25000, 3),
(3, 5, 35000, 11),
(4, 1, 25000, 9),
(4, 5, 35000, 6),
(5, 1, 25000, 10),
(5, 5, 35000, 5);

--
-- Disparadores `detallecompra`
--
DELIMITER $$
CREATE TRIGGER `after_insert_compra` AFTER INSERT ON `detallecompra` FOR EACH ROW BEGIN
  UPDATE productos
  SET pro_stock = pro_stock + NEW.det_cantidad
  WHERE idproductos = NEW.idproductos;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepagos`
--

CREATE TABLE `detallepagos` (
  `idpagos` int(11) NOT NULL,
  `idcompras` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallepagos`
--

INSERT INTO `detallepagos` (`idpagos`, `idcompras`, `monto`) VALUES
(1, 2, 225000),
(1, 5, 425000),
(2, 1, 170000),
(3, 3, 460000),
(4, 4, 435000);

--
-- Disparadores `detallepagos`
--
DELIMITER $$
CREATE TRIGGER `actualizar_estado_compras` AFTER INSERT ON `detallepagos` FOR EACH ROW BEGIN
    UPDATE compras
    SET com_estado = 'PAGADO'
    WHERE idcompras = NEW.idcompras; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `idventas` int(11) NOT NULL,
  `idproductos` int(11) NOT NULL,
  `det_precio` int(11) NOT NULL,
  `det_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalleventas`
--

INSERT INTO `detalleventas` (`idventas`, `idproductos`, `det_precio`, `det_cantidad`) VALUES
(1, 2, 35000, 1),
(1, 3, 10000, 1),
(2, 2, 35000, 1),
(2, 3, 10000, 1),
(2, 4, 20000, 1),
(3, 2, 35000, 1),
(4, 3, 10000, 1),
(4, 4, 20000, 1),
(5, 1, 25000, 1),
(5, 5, 35000, 1);

--
-- Disparadores `detalleventas`
--
DELIMITER $$
CREATE TRIGGER `after_insert_venta` AFTER INSERT ON `detalleventas` FOR EACH ROW BEGIN
  UPDATE productos
  SET pro_stock = pro_stock - NEW.det_cantidad
  WHERE idproductos = NEW.idproductos;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idpagos` int(11) NOT NULL,
  `pag_fecha` date NOT NULL,
  `pag_estado` varchar(10) NOT NULL,
  `idaperturas` int(11) NOT NULL,
  `idproveedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpagos`, `pag_fecha`, `pag_estado`, `idaperturas`, `idproveedores`) VALUES
(1, '2024-12-15', 'PAGADO', 20, 1),
(2, '2024-12-15', 'PAGADO', 20, 2),
(3, '2024-12-15', 'PAGADO', 20, 5),
(4, '2024-12-15', 'PAGADO', 20, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personales`
--

CREATE TABLE `personales` (
  `idpersonales` int(11) NOT NULL,
  `per_nombre` varchar(25) NOT NULL,
  `per_apellido` varchar(25) NOT NULL,
  `per_ci` varchar(15) NOT NULL,
  `per_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personales`
--

INSERT INTO `personales` (`idpersonales`, `per_nombre`, `per_apellido`, `per_ci`, `per_telefono`) VALUES
(1, 'Marcos', 'Martinez', '5877472', '0986452877'),
(2, 'Dieter ', 'Pastoriza', '4563123', '0978452632'),
(3, 'Jose ', 'Gomez', '5612321', '0986452145'),
(4, 'Juan ', 'Acosta', '4562123', '0985312545'),
(5, 'Fernando', 'Baez', '5623123', '0981235652');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` int(11) NOT NULL,
  `pro_nombre` varchar(35) NOT NULL,
  `pro_costo` int(11) NOT NULL,
  `pro_precio` int(11) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `pro_minimo` int(11) NOT NULL,
  `pro_iva` varchar(10) NOT NULL,
  `pro_categoria` varchar(45) NOT NULL,
  `idproveedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `pro_nombre`, `pro_costo`, `pro_precio`, `pro_stock`, `pro_minimo`, `pro_iva`, `pro_categoria`, `idproveedores`) VALUES
(1, 'Crema para peinar', 20000, 25000, 37, 5, '10', 'INSUMO', 1),
(2, 'Corte de Cabello', 35000, 35000, 37, 15, '5', 'SERVICIO', 3),
(3, 'Corte ce cejas', 10000, 10000, 77, 15, '0', 'SERVICIO', 3),
(4, 'Corte de barba', 20000, 20000, 78, 15, '5', 'SERVICIO', 3),
(5, 'Polvo para texturizar', 30000, 35000, 58, 10, '10', 'INSUMO', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedores` int(11) NOT NULL,
  `prov_nombre` varchar(35) NOT NULL,
  `prov_ruc` varchar(15) NOT NULL,
  `prov_telefono` varchar(15) NOT NULL,
  `prov_correo` varchar(150) NOT NULL,
  `idciudades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedores`, `prov_nombre`, `prov_ruc`, `prov_telefono`, `prov_correo`, `idciudades`) VALUES
(1, 'Barbershop', '4652132', '0982156456', 'barber@gmail.com', 2),
(2, 'vikingos', '4652333', '0985456123', 'vikingos@gmail.com', 1),
(3, 'JG Barberia & Peluqueria', '4521221', '0984789456', 'jg@gmail.com', 4),
(4, 'TY Cosmetic', '5623123', '0983214412', 'tycosm@gmail.com', 2),
(5, 'Pro Duo', '5897456', '0972123456', 'produo@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `usu_nombre` varchar(20) NOT NULL,
  `usu_clave` varchar(20) NOT NULL,
  `usu_tipo` varchar(15) NOT NULL,
  `usu_estado` varchar(10) NOT NULL,
  `idpersonales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `usu_nombre`, `usu_clave`, `usu_tipo`, `usu_estado`, `idpersonales`) VALUES
(1, 'admin', '1234', 'ADMINISTRADOR', 'ACTIVO', 1),
(2, 'JoseG', '1234', 'ADMINISTRADOR', 'ACTIVO', 3),
(3, 'marcmart', '1234', 'ADMINISTRADOR', 'ACTIVO', 1),
(4, 'JuanA', '1234', 'ADMINISTRADOR', 'ACTIVO', 4),
(5, 'Fer', '1234', 'ADMINISTRADOR', 'ACTIVO', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventas` int(11) NOT NULL,
  `ven_fecha` date NOT NULL,
  `ven_condicion` varchar(8) NOT NULL,
  `ven_estado` varchar(15) NOT NULL,
  `idusuarios` int(11) NOT NULL,
  `idclientes` int(11) NOT NULL,
  `idaperturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventas`, `ven_fecha`, `ven_condicion`, `ven_estado`, `idusuarios`, `idclientes`, `idaperturas`) VALUES
(1, '2024-11-15', 'CONTADO', 'COBRADO', 1, 2, 20),
(2, '2024-11-15', 'CONTADO', 'COBRADO', 1, 3, 20),
(3, '2024-11-15', 'CONTADO', 'COBRADO', 1, 4, 20),
(4, '2024-11-15', 'CONTADO', 'COBRADO', 1, 5, 20),
(5, '2024-11-15', 'CONTADO', 'COBRADO', 1, 1, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aperturas`
--
ALTER TABLE `aperturas`
  ADD PRIMARY KEY (`idaperturas`),
  ADD KEY `idusuarios` (`idusuarios`);

--
-- Indices de la tabla `cierres`
--
ALTER TABLE `cierres`
  ADD PRIMARY KEY (`idcierre`),
  ADD KEY `idaperturas` (`idaperturas`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idciudades`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idclientes`),
  ADD KEY `idciudades` (`idciudades`);

--
-- Indices de la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD PRIMARY KEY (`idcobros`),
  ADD KEY `fk_cobros_clientes1_idx` (`idclientes`),
  ADD KEY `fk_cobros_aperturas1_idx` (`idaperturas`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompras`),
  ADD KEY `idusuarios` (`idusuarios`),
  ADD KEY `idproveedores` (`idproveedores`),
  ADD KEY `idaperturas` (`idaperturas`);

--
-- Indices de la tabla `detallecobros`
--
ALTER TABLE `detallecobros`
  ADD PRIMARY KEY (`idcobros`,`idventas`),
  ADD KEY `fk_cobros_has_ventas_ventas1_idx` (`idventas`),
  ADD KEY `fk_cobros_has_ventas_cobros1_idx` (`idcobros`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`idcompras`,`idproductos`),
  ADD KEY `idproductos` (`idproductos`);

--
-- Indices de la tabla `detallepagos`
--
ALTER TABLE `detallepagos`
  ADD PRIMARY KEY (`idpagos`,`idcompras`),
  ADD KEY `fk_pagos_has_compras_compras1_idx` (`idcompras`),
  ADD KEY `fk_pagos_has_compras_pagos1_idx` (`idpagos`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`idventas`,`idproductos`),
  ADD KEY `idproductos` (`idproductos`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idpagos`),
  ADD KEY `fk_pagos_aperturas1_idx` (`idaperturas`),
  ADD KEY `fk_pagos_proveedores1_idx` (`idproveedores`);

--
-- Indices de la tabla `personales`
--
ALTER TABLE `personales`
  ADD PRIMARY KEY (`idpersonales`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproductos`),
  ADD KEY `idproveedores` (`idproveedores`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedores`),
  ADD KEY `idciudades` (`idciudades`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD KEY `idpersonales` (`idpersonales`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventas`),
  ADD KEY `idusuarios` (`idusuarios`),
  ADD KEY `idclientes` (`idclientes`),
  ADD KEY `idaperturas` (`idaperturas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aperturas`
--
ALTER TABLE `aperturas`
  MODIFY `idaperturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `cierres`
--
ALTER TABLE `cierres`
  MODIFY `idcierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idciudades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personales`
--
ALTER TABLE `personales`
  MODIFY `idpersonales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aperturas`
--
ALTER TABLE `aperturas`
  ADD CONSTRAINT `aperturas_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`);

--
-- Filtros para la tabla `cierres`
--
ALTER TABLE `cierres`
  ADD CONSTRAINT `cierres_ibfk_1` FOREIGN KEY (`idaperturas`) REFERENCES `aperturas` (`idaperturas`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idciudades`) REFERENCES `ciudades` (`idciudades`);

--
-- Filtros para la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD CONSTRAINT `fk_cobros_aperturas1` FOREIGN KEY (`idaperturas`) REFERENCES `aperturas` (`idaperturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cobros_clientes1` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idproveedores`) REFERENCES `proveedores` (`idproveedores`),
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`idaperturas`) REFERENCES `aperturas` (`idaperturas`);

--
-- Filtros para la tabla `detallecobros`
--
ALTER TABLE `detallecobros`
  ADD CONSTRAINT `fk_cobros_has_ventas_cobros1` FOREIGN KEY (`idcobros`) REFERENCES `cobros` (`idcobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cobros_has_ventas_ventas1` FOREIGN KEY (`idventas`) REFERENCES `ventas` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `detallecompra_ibfk_1` FOREIGN KEY (`idcompras`) REFERENCES `compras` (`idcompras`),
  ADD CONSTRAINT `detallecompra_ibfk_2` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproductos`);

--
-- Filtros para la tabla `detallepagos`
--
ALTER TABLE `detallepagos`
  ADD CONSTRAINT `fk_pagos_has_compras_compras1` FOREIGN KEY (`idcompras`) REFERENCES `compras` (`idcompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_has_compras_pagos1` FOREIGN KEY (`idpagos`) REFERENCES `pagos` (`idpagos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD CONSTRAINT `detalleventas_ibfk_1` FOREIGN KEY (`idventas`) REFERENCES `ventas` (`idventas`),
  ADD CONSTRAINT `detalleventas_ibfk_2` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproductos`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_aperturas1` FOREIGN KEY (`idaperturas`) REFERENCES `aperturas` (`idaperturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_proveedores1` FOREIGN KEY (`idproveedores`) REFERENCES `proveedores` (`idproveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idproveedores`) REFERENCES `proveedores` (`idproveedores`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`idciudades`) REFERENCES `ciudades` (`idciudades`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idpersonales`) REFERENCES `personales` (`idpersonales`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idaperturas`) REFERENCES `aperturas` (`idaperturas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
