-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2024 a las 03:31:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_votacion_desis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`) VALUES
(1, 'Candidato 1'),
(2, 'Candidato 2'),
(3, 'Candidato 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Arica', 1),
(2, 'Putre', 1),
(3, 'Iquique', 2),
(4, 'Alto Hospicio', 2),
(5, 'Antofagasta', 3),
(6, 'Calama', 3),
(7, 'Copiapó', 4),
(8, 'Vallenar', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formasconocimiento`
--

CREATE TABLE `formasconocimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formasconocimiento`
--

INSERT INTO `formasconocimiento` (`id`, `nombre`) VALUES
(1, 'Web'),
(2, 'TV'),
(3, 'Redes Sociales'),
(4, 'Amigos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votanteformaconocimiento`
--

CREATE TABLE `votanteformaconocimiento` (
  `votante_id` int(11) NOT NULL,
  `forma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votantes`
--

CREATE TABLE `votantes` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `comuna_id` int(11) DEFAULT NULL,
  `id_candidato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `formasconocimiento`
--
ALTER TABLE `formasconocimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votanteformaconocimiento`
--
ALTER TABLE `votanteformaconocimiento`
  ADD PRIMARY KEY (`votante_id`,`forma_id`),
  ADD KEY `forma_id` (`forma_id`);

--
-- Indices de la tabla `votantes`
--
ALTER TABLE `votantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `comuna_id` (`comuna_id`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `formasconocimiento`
--
ALTER TABLE `formasconocimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `votantes`
--
ALTER TABLE `votantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `votanteformaconocimiento`
--
ALTER TABLE `votanteformaconocimiento`
  ADD CONSTRAINT `votanteformaconocimiento_ibfk_1` FOREIGN KEY (`votante_id`) REFERENCES `votantes` (`id`),
  ADD CONSTRAINT `votanteformaconocimiento_ibfk_2` FOREIGN KEY (`forma_id`) REFERENCES `formasconocimiento` (`id`);

--
-- Filtros para la tabla `votantes`
--
ALTER TABLE `votantes`
  ADD CONSTRAINT `votantes_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`),
  ADD CONSTRAINT `votantes_ibfk_2` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`),
  ADD CONSTRAINT `votantes_ibfk_3` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
