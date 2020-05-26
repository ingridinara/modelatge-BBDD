-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 15:27:56
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
-- Base de datos: `Vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TAULA_AVIO`
--

CREATE TABLE `TAULA_AVIO` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(11) NOT NULL,
  `model` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `TAULA_AVIO`
--

INSERT INTO `TAULA_AVIO` (`id_avio`, `capacitat`, `model`) VALUES
(1, 400, 'model america');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TAULA_SEIENT`
--

CREATE TABLE `TAULA_SEIENT` (
  `id_seient` int(11) NOT NULL,
  `avio_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `TAULA_SEIENT`
--

INSERT INTO `TAULA_SEIENT` (`id_seient`, `avio_fk`) VALUES
(8001, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TAULA_AVIO`
--
ALTER TABLE `TAULA_AVIO`
  ADD PRIMARY KEY (`id_avio`);

--
-- Indices de la tabla `TAULA_SEIENT`
--
ALTER TABLE `TAULA_SEIENT`
  ADD PRIMARY KEY (`id_seient`),
  ADD KEY `avio_fk` (`avio_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TAULA_AVIO`
--
ALTER TABLE `TAULA_AVIO`
  MODIFY `id_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `TAULA_SEIENT`
--
ALTER TABLE `TAULA_SEIENT`
  MODIFY `id_seient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8002;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `TAULA_SEIENT`
--
ALTER TABLE `TAULA_SEIENT`
  ADD CONSTRAINT `taula_seient_ibfk_1` FOREIGN KEY (`avio_fk`) REFERENCES `TAULA_AVIO` (`id_avio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
