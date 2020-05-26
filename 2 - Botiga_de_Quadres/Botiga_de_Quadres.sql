-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 12:59:04
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
-- Base de datos: `Botiga_de_Quadres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AUTOR`
--

CREATE TABLE `AUTOR` (
  `id_autor` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `AUTOR`
--

INSERT INTO `AUTOR` (`id_autor`, `nom`, `cognom`) VALUES
(1, 'Gail M. ', 'Dudack'),
(2, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COMPRADOR`
--

CREATE TABLE `COMPRADOR` (
  `id_comprador` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL,
  `dni` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `COMPRADOR`
--

INSERT INTO `COMPRADOR` (`id_comprador`, `nom`, `cognom`, `dni`) VALUES
(1, 'Pedro', 'Fernandez', '1111111-b'),
(2, 'Maria', 'Vitoria', '77777-xp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `QUADRE_DINS_STOCK`
--

CREATE TABLE `QUADRE_DINS_STOCK` (
  `id_quadre` int(11) NOT NULL,
  `preu` float NOT NULL,
  `autor_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `QUADRE_DINS_STOCK`
--

INSERT INTO `QUADRE_DINS_STOCK` (`id_quadre`, `preu`, `autor_fk`) VALUES
(11, 20, 1),
(12, 970, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REGISTRO_VENTA`
--

CREATE TABLE `REGISTRO_VENTA` (
  `id_registro_venta` int(11) NOT NULL,
  `comprador_fk` int(11) NOT NULL,
  `quadre_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `REGISTRO_VENTA`
--

INSERT INTO `REGISTRO_VENTA` (`id_registro_venta`, `comprador_fk`, `quadre_fk`) VALUES
(1, 1, 11),
(2, 2, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AUTOR`
--
ALTER TABLE `AUTOR`
  ADD PRIMARY KEY (`id_autor`),
  ADD UNIQUE KEY `id_autor` (`id_autor`);

--
-- Indices de la tabla `COMPRADOR`
--
ALTER TABLE `COMPRADOR`
  ADD PRIMARY KEY (`id_comprador`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `id_comprador` (`id_comprador`);

--
-- Indices de la tabla `QUADRE_DINS_STOCK`
--
ALTER TABLE `QUADRE_DINS_STOCK`
  ADD PRIMARY KEY (`id_quadre`),
  ADD UNIQUE KEY `id_quadre` (`id_quadre`),
  ADD KEY `autor_fk` (`autor_fk`);

--
-- Indices de la tabla `REGISTRO_VENTA`
--
ALTER TABLE `REGISTRO_VENTA`
  ADD PRIMARY KEY (`id_registro_venta`),
  ADD UNIQUE KEY `id_registro_venta` (`id_registro_venta`),
  ADD KEY `comprador_fk` (`comprador_fk`,`quadre_fk`),
  ADD KEY `quadre_fk` (`quadre_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AUTOR`
--
ALTER TABLE `AUTOR`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `COMPRADOR`
--
ALTER TABLE `COMPRADOR`
  MODIFY `id_comprador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `QUADRE_DINS_STOCK`
--
ALTER TABLE `QUADRE_DINS_STOCK`
  MODIFY `id_quadre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `REGISTRO_VENTA`
--
ALTER TABLE `REGISTRO_VENTA`
  MODIFY `id_registro_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `QUADRE_DINS_STOCK`
--
ALTER TABLE `QUADRE_DINS_STOCK`
  ADD CONSTRAINT `quadre_dins_stock_ibfk_1` FOREIGN KEY (`autor_fk`) REFERENCES `AUTOR` (`id_autor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `REGISTRO_VENTA`
--
ALTER TABLE `REGISTRO_VENTA`
  ADD CONSTRAINT `registro_venta_ibfk_1` FOREIGN KEY (`comprador_fk`) REFERENCES `COMPRADOR` (`id_comprador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_venta_ibfk_2` FOREIGN KEY (`quadre_fk`) REFERENCES `QUADRE_DINS_STOCK` (`id_quadre`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
