-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 15:09:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Cull_d_Ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENT`
--

CREATE TABLE `CLIENT` (
  `id_clients` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adereca` text NOT NULL,
  `telefon` int(11) NOT NULL,
  `correu_electronic` varchar(20) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nom_recomanador_fk` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `CLIENT`
--

INSERT INTO `CLIENT` (`id_clients`, `nom`, `adereca`, `telefon`, `correu_electronic`, `data_registre`, `nom_recomanador_fk`) VALUES
(6001, 'Paco', 'C. de L Or 35, 08025', 62456, 'paco@mail.com', '2020-05-26 12:52:41', 'Tienda de al lado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEAT`
--

CREATE TABLE `EMPLEAT` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `EMPLEAT`
--

INSERT INTO `EMPLEAT` (`id_empleat`, `nom`) VALUES
(7001, 'Dulce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROVEIDOR`
--

CREATE TABLE `PROVEIDOR` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adereca_carrer` varchar(50) NOT NULL,
  `adereca_numero` int(5) NOT NULL,
  `adereca_pis` int(5) NOT NULL,
  `adereca_porta` int(5) NOT NULL,
  `adereca_ciutat` varchar(20) NOT NULL,
  `adereca_cod_post` int(5) NOT NULL,
  `adereca_pais` varchar(20) NOT NULL,
  `telefon` int(8) NOT NULL,
  `fax` int(8) NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `PROVEIDOR`
--

INSERT INTO `PROVEIDOR` (`id_proveidor`, `nom`, `adereca_carrer`, `adereca_numero`, `adereca_pis`, `adereca_porta`, `adereca_ciutat`, `adereca_cod_post`, `adereca_pais`, `telefon`, `fax`, `nif`) VALUES
(5001, 'Ulleres Cat', 'C. Le pant', 456, 6, 4, 'Barcelona', 8023, 'España', 63567, 73456, '809-puc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RECOMANADOR`
--

CREATE TABLE `RECOMANADOR` (
  `nom_recomanador` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `RECOMANADOR`
--

INSERT INTO `RECOMANADOR` (`nom_recomanador`) VALUES
('Tienda de al lado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ULLERE`
--

CREATE TABLE `ULLERE` (
  `id_ulleres` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `proveidor_fk` int(11) NOT NULL,
  `graduacio_dir` decimal(10,0) NOT NULL,
  `graducacio_esq` decimal(10,0) NOT NULL,
  `montura` varchar(20) NOT NULL,
  `color_montura` varchar(20) NOT NULL,
  `color_vidre_dir` varchar(20) NOT NULL,
  `color_vidre_esq` varchar(20) NOT NULL,
  `preu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ULLERE`
--

INSERT INTO `ULLERE` (`id_ulleres`, `marca`, `proveidor_fk`, `graduacio_dir`, `graducacio_esq`, `montura`, `color_montura`, `color_vidre_dir`, `color_vidre_esq`, `preu`) VALUES
(8001, 'Cat Ull', 5001, '3', '2', 'metalica', 'gris', 'clar', 'oscur', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VENDA`
--

CREATE TABLE `VENDA` (
  `id_venda` int(11) NOT NULL,
  `empleat_fk` int(11) NOT NULL,
  `ullere_fk` int(11) NOT NULL,
  `client_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `VENDA`
--

INSERT INTO `VENDA` (`id_venda`, `empleat_fk`, `ullere_fk`, `client_fk`) VALUES
(40001, 7001, 8001, 6001);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`id_clients`),
  ADD UNIQUE KEY `id_clients` (`id_clients`),
  ADD KEY `recomanador_fk` (`nom_recomanador_fk`);

--
-- Indices de la tabla `EMPLEAT`
--
ALTER TABLE `EMPLEAT`
  ADD PRIMARY KEY (`id_empleat`),
  ADD UNIQUE KEY `id_empleat` (`id_empleat`);

--
-- Indices de la tabla `PROVEIDOR`
--
ALTER TABLE `PROVEIDOR`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `id_proveidor` (`id_proveidor`);

--
-- Indices de la tabla `RECOMANADOR`
--
ALTER TABLE `RECOMANADOR`
  ADD PRIMARY KEY (`nom_recomanador`);

--
-- Indices de la tabla `ULLERE`
--
ALTER TABLE `ULLERE`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD UNIQUE KEY `id_ulleres` (`id_ulleres`),
  ADD KEY `proveidor_fk` (`proveidor_fk`);

--
-- Indices de la tabla `VENDA`
--
ALTER TABLE `VENDA`
  ADD PRIMARY KEY (`id_venda`),
  ADD UNIQUE KEY `id_venda` (`id_venda`),
  ADD KEY `empleat_fk` (`empleat_fk`,`ullere_fk`,`client_fk`),
  ADD KEY `ullere_fk` (`ullere_fk`),
  ADD KEY `client_fk` (`client_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CLIENT`
--
ALTER TABLE `CLIENT`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6002;

--
-- AUTO_INCREMENT de la tabla `EMPLEAT`
--
ALTER TABLE `EMPLEAT`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7002;

--
-- AUTO_INCREMENT de la tabla `PROVEIDOR`
--
ALTER TABLE `PROVEIDOR`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5002;

--
-- AUTO_INCREMENT de la tabla `ULLERE`
--
ALTER TABLE `ULLERE`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8002;

--
-- AUTO_INCREMENT de la tabla `VENDA`
--
ALTER TABLE `VENDA`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40002;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`nom_recomanador_fk`) REFERENCES `RECOMANADOR` (`nom_recomanador`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ULLERE`
--
ALTER TABLE `ULLERE`
  ADD CONSTRAINT `ullere_ibfk_1` FOREIGN KEY (`proveidor_fk`) REFERENCES `PROVEIDOR` (`id_proveidor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `VENDA`
--
ALTER TABLE `VENDA`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`empleat_fk`) REFERENCES `EMPLEAT` (`id_empleat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`ullere_fk`) REFERENCES `ULLERE` (`id_ulleres`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`client_fk`) REFERENCES `CLIENT` (`id_clients`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
