-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2020 a las 13:45:53
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
-- Base de datos: `Stube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LISTADO_VIDEO_USUARIO`
--

CREATE TABLE `LISTADO_VIDEO_USUARIO` (
  `id_listado_video_usuario` int(11) NOT NULL,
  `usuari_fk` int(11) NOT NULL,
  `video_fk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `LISTADO_VIDEO_USUARIO`
--

INSERT INTO `LISTADO_VIDEO_USUARIO` (`id_listado_video_usuario`, `usuari_fk`, `video_fk`) VALUES
(1, 1, 'YtRe45-V-1001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARI`
--

CREATE TABLE `USUARI` (
  `id_usuari` int(11) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `contrasena` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `USUARI`
--

INSERT INTO `USUARI` (`id_usuari`, `e_mail`, `contrasena`) VALUES
(1, 'usuari@elvideo.com', 'dasdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VIDEO_PUBLICADO`
--

CREATE TABLE `VIDEO_PUBLICADO` (
  `id_video` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `VIDEO_PUBLICADO`
--

INSERT INTO `VIDEO_PUBLICADO` (`id_video`, `descripcion`, `titulo`, `url`) VALUES
('YtRe45-V-1001', 'El video del momento', 'El Video', 'www.youtube.com/elvideo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `LISTADO_VIDEO_USUARIO`
--
ALTER TABLE `LISTADO_VIDEO_USUARIO`
  ADD PRIMARY KEY (`id_listado_video_usuario`),
  ADD UNIQUE KEY `id_listado_video_usuario` (`id_listado_video_usuario`),
  ADD KEY `usuari_fk` (`usuari_fk`,`video_fk`),
  ADD KEY `video_fk` (`video_fk`);

--
-- Indices de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  ADD PRIMARY KEY (`id_usuari`);

--
-- Indices de la tabla `VIDEO_PUBLICADO`
--
ALTER TABLE `VIDEO_PUBLICADO`
  ADD PRIMARY KEY (`id_video`),
  ADD UNIQUE KEY `id_video` (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `LISTADO_VIDEO_USUARIO`
--
ALTER TABLE `LISTADO_VIDEO_USUARIO`
  MODIFY `id_listado_video_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `LISTADO_VIDEO_USUARIO`
--
ALTER TABLE `LISTADO_VIDEO_USUARIO`
  ADD CONSTRAINT `listado_video_usuario_ibfk_1` FOREIGN KEY (`usuari_fk`) REFERENCES `USUARI` (`id_usuari`) ON UPDATE CASCADE,
  ADD CONSTRAINT `listado_video_usuario_ibfk_2` FOREIGN KEY (`video_fk`) REFERENCES `VIDEO_PUBLICADO` (`id_video`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
