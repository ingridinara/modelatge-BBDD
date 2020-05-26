-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 13:59:31
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
-- Base de datos: `Cataleg_Libres_Amazon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AUTOR`
--

CREATE TABLE `AUTOR` (
  `id_autor` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `AUTOR`
--

INSERT INTO `AUTOR` (`id_autor`, `direccion`) VALUES
(1, 'Llacuna, 30. 08025');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FACTURA`
--

CREATE TABLE `FACTURA` (
  `id_factura` int(11) NOT NULL,
  `usuari_fk` int(11) NOT NULL,
  `libre_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `FACTURA`
--

INSERT INTO `FACTURA` (`id_factura`, `usuari_fk`, `libre_fk`) VALUES
(7001, 3001, 9001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LIBRE`
--

CREATE TABLE `LIBRE` (
  `id_libre` int(11) NOT NULL,
  `unitats_disponibles` int(11) NOT NULL,
  `preu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `LIBRE`
--

INSERT INTO `LIBRE` (`id_libre`, `unitats_disponibles`, `preu`) VALUES
(9001, 3, 20.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LIBRE_PER_AUTOR`
--

CREATE TABLE `LIBRE_PER_AUTOR` (
  `id_libre_per_autor` int(11) NOT NULL,
  `autor_fk` int(11) NOT NULL,
  `libre_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `LIBRE_PER_AUTOR`
--

INSERT INTO `LIBRE_PER_AUTOR` (`id_libre_per_autor`, `autor_fk`, `libre_fk`) VALUES
(4, 1, 9001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARI`
--

CREATE TABLE `USUARI` (
  `id_usuari` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `e_mail` varchar(20) NOT NULL,
  `contrasena` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `USUARI`
--

INSERT INTO `USUARI` (`id_usuari`, `nom`, `e_mail`, `contrasena`) VALUES
(3001, 'Joao Manuel', 'jmanuel@mail.com', 'dasdf');

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
-- Indices de la tabla `FACTURA`
--
ALTER TABLE `FACTURA`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `usuari_fk` (`usuari_fk`,`libre_fk`),
  ADD KEY `libre_fk` (`libre_fk`);

--
-- Indices de la tabla `LIBRE`
--
ALTER TABLE `LIBRE`
  ADD PRIMARY KEY (`id_libre`),
  ADD UNIQUE KEY `id_libre` (`id_libre`);

--
-- Indices de la tabla `LIBRE_PER_AUTOR`
--
ALTER TABLE `LIBRE_PER_AUTOR`
  ADD PRIMARY KEY (`id_libre_per_autor`),
  ADD KEY `autor_fk` (`autor_fk`,`libre_fk`),
  ADD KEY `libre_fk` (`libre_fk`);

--
-- Indices de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  ADD PRIMARY KEY (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AUTOR`
--
ALTER TABLE `AUTOR`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `FACTURA`
--
ALTER TABLE `FACTURA`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7002;

--
-- AUTO_INCREMENT de la tabla `LIBRE`
--
ALTER TABLE `LIBRE`
  MODIFY `id_libre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9002;

--
-- AUTO_INCREMENT de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3002;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `FACTURA`
--
ALTER TABLE `FACTURA`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuari_fk`) REFERENCES `USUARI` (`id_usuari`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`libre_fk`) REFERENCES `LIBRE` (`id_libre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `LIBRE_PER_AUTOR`
--
ALTER TABLE `LIBRE_PER_AUTOR`
  ADD CONSTRAINT `libre_per_autor_ibfk_1` FOREIGN KEY (`autor_fk`) REFERENCES `AUTOR` (`id_autor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `libre_per_autor_ibfk_2` FOREIGN KEY (`libre_fk`) REFERENCES `LIBRE` (`id_libre`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
