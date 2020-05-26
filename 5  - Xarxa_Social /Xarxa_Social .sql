-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 14:04:52
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
-- Base de datos: `Xarxa_Social`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AMIC`
--

CREATE TABLE `AMIC` (
  `id_amic` int(11) NOT NULL,
  `usuari_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `AMIC`
--

INSERT INTO `AMIC` (`id_amic`, `usuari_fk`) VALUES
(5001, 10001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COM_SHAN_CONEGUT`
--

CREATE TABLE `COM_SHAN_CONEGUT` (
  `com_shan_conegut` varchar(50) NOT NULL,
  `usuari_fk` int(11) NOT NULL,
  `amic_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `COM_SHAN_CONEGUT`
--

INSERT INTO `COM_SHAN_CONEGUT` (`com_shan_conegut`, `usuari_fk`, `amic_fk`) VALUES
('IT Academy', 10001, 5001);

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
(10001, 'Camila', 'cam@mail.com', '5asf6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AMIC`
--
ALTER TABLE `AMIC`
  ADD PRIMARY KEY (`id_amic`),
  ADD UNIQUE KEY `id_amic` (`id_amic`),
  ADD KEY `usuari_fk` (`usuari_fk`);

--
-- Indices de la tabla `COM_SHAN_CONEGUT`
--
ALTER TABLE `COM_SHAN_CONEGUT`
  ADD PRIMARY KEY (`com_shan_conegut`),
  ADD KEY `usuari_fk` (`usuari_fk`,`amic_fk`),
  ADD KEY `amic_fk` (`amic_fk`);

--
-- Indices de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  ADD PRIMARY KEY (`id_usuari`),
  ADD UNIQUE KEY `id_usuari` (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AMIC`
--
ALTER TABLE `AMIC`
  MODIFY `id_amic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5002;

--
-- AUTO_INCREMENT de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AMIC`
--
ALTER TABLE `AMIC`
  ADD CONSTRAINT `amic_ibfk_1` FOREIGN KEY (`usuari_fk`) REFERENCES `USUARI` (`id_usuari`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `COM_SHAN_CONEGUT`
--
ALTER TABLE `COM_SHAN_CONEGUT`
  ADD CONSTRAINT `com_shan_conegut_ibfk_1` FOREIGN KEY (`usuari_fk`) REFERENCES `USUARI` (`id_usuari`) ON UPDATE CASCADE,
  ADD CONSTRAINT `com_shan_conegut_ibfk_2` FOREIGN KEY (`amic_fk`) REFERENCES `AMIC` (`id_amic`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
