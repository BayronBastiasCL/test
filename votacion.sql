-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2024 a las 18:08:30
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
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
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
  `nombre` varchar(255) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Arica', 1),
(2, 'Camarones', 1),
(3, 'Putre', 1),
(4, 'General Lagos', 1),
(5, 'Iquique', 2),
(6, 'Alto Hospicio', 2),
(7, 'Pozo Almonte', 2),
(8, 'Camiña', 2),
(9, 'Colchane', 2),
(10, 'Huara', 2),
(11, 'Pica', 2),
(12, 'Antofagasta', 3),
(13, 'Mejillones', 3),
(14, 'Sierra Gorda', 3),
(15, 'Taltal', 3),
(16, 'Calama', 3),
(17, 'Ollagüe', 3),
(18, 'San Pedro de Atacama', 3),
(19, 'Tocopilla', 3),
(20, 'María Elena', 3),
(21, 'Copiapó', 4),
(22, 'Caldera', 4),
(23, 'Tierra Amarilla', 4),
(24, 'Chañaral', 4),
(25, 'Diego de Almagro', 4),
(26, 'Vallenar', 4),
(27, 'Huasco', 4),
(28, 'Freirina', 4),
(29, 'Alto del Carmen', 4),
(30, 'La Serena', 5),
(31, 'Coquimbo', 5),
(32, 'Andacollo', 5),
(33, 'La Higuera', 5),
(34, 'Paihuano', 5),
(35, 'Vicuña', 5),
(36, 'Illapel', 5),
(37, 'Canela', 5),
(38, 'Los Vilos', 5),
(39, 'Salamanca', 5),
(40, 'Ovalle', 5),
(41, 'Monte Patria', 5),
(42, 'Combarbalá', 5),
(43, 'Punitaqui', 5),
(44, 'Río Hurtado', 5),
(45, 'Valparaíso', 6),
(46, 'Viña del Mar', 6),
(47, 'Concón', 6),
(48, 'Quintero', 6),
(49, 'Puchuncaví', 6),
(50, 'Quilpué', 6),
(51, 'Villa Alemana', 6),
(52, 'Limache', 6),
(53, 'Olmué', 6),
(54, 'Quillota', 6),
(55, 'La Calera', 6),
(56, 'Hijuelas', 6),
(57, 'Nogales', 6),
(58, 'San Antonio', 6),
(59, 'Cartagena', 6),
(60, 'El Tabo', 6),
(61, 'El Quisco', 6),
(62, 'Algarrobo', 6),
(63, 'Santo Domingo', 6),
(64, 'San Felipe', 6),
(65, 'Catemu', 6),
(66, 'Llaillay', 6),
(67, 'Panquehue', 6),
(68, 'Putaendo', 6),
(69, 'Santa María', 6),
(70, 'Los Andes', 6),
(71, 'Calle Larga', 6),
(72, 'Rinconada', 6),
(73, 'San Esteban', 6),
(74, 'Rancagua', 7),
(75, 'Machalí', 7),
(76, 'Graneros', 7),
(77, 'Las Cabras', 7),
(78, 'San Vicente', 7),
(79, 'Pichidegua', 7),
(80, 'Peumo', 7),
(81, 'Coltauco', 7),
(82, 'Doñihue', 7),
(83, 'Coinco', 7),
(84, 'Olivar', 7),
(85, 'Requínoa', 7),
(86, 'Rengo', 7),
(87, 'Malloa', 7),
(88, 'San Fernando', 7),
(89, 'Chépica', 7),
(90, 'Nancagua', 7),
(91, 'Placilla', 7),
(92, 'Santa Cruz', 7),
(93, 'Palmilla', 7),
(94, 'Peralillo', 7),
(95, 'Pumanque', 7),
(96, 'Marchihue', 7),
(97, 'Paredones', 7),
(98, 'Pichilemu', 7),
(99, 'Navidad', 7),
(100, 'La Estrella', 7),
(101, 'Litueche', 7),
(102, 'Talca', 8),
(103, 'Constitución', 8),
(104, 'Curepto', 8),
(105, 'Empedrado', 8),
(106, 'Maule', 8),
(107, 'Pelarco', 8),
(108, 'Pencahue', 8),
(109, 'Río Claro', 8),
(110, 'San Clemente', 8),
(111, 'San Rafael', 8),
(112, 'Cauquenes', 8),
(113, 'Chanco', 8),
(114, 'Pelluhue', 8),
(115, 'Curicó', 8),
(116, 'Hualañé', 8),
(117, 'Licantén', 8),
(118, 'Molina', 8),
(119, 'Rauco', 8),
(120, 'Romeral', 8),
(121, 'Sagrada Familia', 8),
(122, 'Teno', 8),
(123, 'Vichuquén', 8),
(124, 'Linares', 8),
(125, 'Colbún', 8),
(126, 'Longaví', 8),
(127, 'Parral', 8),
(128, 'Retiro', 8),
(129, 'San Javier', 8),
(130, 'Villa Alegre', 8),
(131, 'Yerbas Buenas', 8),
(132, 'Chillán', 9),
(133, 'Chillán Viejo', 9),
(134, 'Quirihue', 9),
(135, 'Cobquecura', 9),
(136, 'Coelemu', 9),
(137, 'Trehuaco', 9),
(138, 'Ninhue', 9),
(139, 'Portezuelo', 9),
(140, 'Ránquil', 9),
(141, 'San Nicolás', 9),
(142, 'San Carlos', 9),
(143, 'Ñiquén', 9),
(144, 'San Fabián', 9),
(145, 'San Ignacio', 9),
(146, 'El Carmen', 9),
(147, 'Pinto', 9),
(148, 'Coihueco', 9),
(149, 'Bulnes', 9),
(150, 'Quillón', 9),
(151, 'Yungay', 9),
(152, 'Concepción', 10),
(153, 'Talcahuano', 10),
(154, 'Hualpén', 10),
(155, 'Chiguayante', 10),
(156, 'Coronel', 10),
(157, 'Lota', 10),
(158, 'San Pedro de la Paz', 10),
(159, 'Hualqui', 10),
(160, 'Santa Juana', 10),
(161, 'Tomé', 10),
(162, 'Penco', 10),
(163, 'Florida', 10),
(164, 'Tucapel', 10),
(165, 'Yumbel', 10),
(166, 'Cabrero', 10),
(167, 'Laja', 10),
(168, 'San Rosendo', 10),
(169, 'Nacimiento', 10),
(170, 'Los Ángeles', 10),
(171, 'Negrete', 10),
(172, 'Mulchén', 10),
(173, 'Santa Bárbara', 10),
(174, 'Quilaco', 10),
(175, 'Quilleco', 10),
(176, 'Antuco', 10),
(177, 'Tirúa', 10),
(178, 'Cañete', 10),
(179, 'Lebu', 10),
(180, 'Los Álamos', 10),
(181, 'Arauco', 10),
(182, 'Curanilahue', 10),
(183, 'Contulmo', 10),
(184, 'Angol', 11),
(185, 'Collipulli', 11),
(186, 'Ercilla', 11),
(187, 'Los Sauces', 11),
(188, 'Lumaco', 11),
(189, 'Purén', 11),
(190, 'Renaico', 11),
(191, 'Traiguén', 11),
(192, 'Victoria', 11),
(193, 'Temuco', 11),
(194, 'Carahue', 11),
(195, 'Cunco', 11),
(196, 'Curarrehue', 11),
(197, 'Freire', 11),
(198, 'Galvarino', 11),
(199, 'Gorbea', 11),
(200, 'Lautaro', 11),
(201, 'Loncoche', 11),
(202, 'Melipeuco', 11),
(203, 'Nueva Imperial', 11),
(204, 'Padre Las Casas', 11),
(205, 'Perquenco', 11),
(206, 'Pitrufquén', 11),
(207, 'Pucón', 11),
(208, 'Saavedra', 11),
(209, 'Teodoro Schmidt', 11),
(210, 'Toltén', 11),
(211, 'Vilcún', 11),
(212, 'Villarrica', 11),
(213, 'Cholchol', 11),
(214, 'Valdivia', 12),
(215, 'Corral', 12),
(216, 'Lanco', 12),
(217, 'Los Lagos', 12),
(218, 'Máfil', 12),
(219, 'Mariquina', 12),
(220, 'Paillaco', 12),
(221, 'Panguipulli', 12),
(222, 'La Unión', 12),
(223, 'Futrono', 12),
(224, 'Lago Ranco', 12),
(225, 'Río Bueno', 12),
(226, 'Puerto Montt', 13),
(227, 'Calbuco', 13),
(228, 'Cochamó', 13),
(229, 'Fresia', 13),
(230, 'Frutillar', 13),
(231, 'Los Muermos', 13),
(232, 'Llanquihue', 13),
(233, 'Maullín', 13),
(234, 'Puerto Varas', 13),
(235, 'Castro', 13),
(236, 'Ancud', 13),
(237, 'Chonchi', 13),
(238, 'Curaco de Vélez', 13),
(239, 'Dalcahue', 13),
(240, 'Puqueldón', 13),
(241, 'Queilén', 13),
(242, 'Quellón', 13),
(243, 'Quemchi', 13),
(244, 'Quinchao', 13),
(245, 'Osorno', 13),
(246, 'Puerto Octay', 13),
(247, 'Purranque', 13),
(248, 'Puyehue', 13),
(249, 'Río Negro', 13),
(250, 'San Juan de la Costa', 13),
(251, 'San Pablo', 13),
(252, 'Chaitén', 13),
(253, 'Futaleufú', 13),
(254, 'Hualaihué', 13),
(255, 'Palena', 13),
(256, 'Coyhaique', 14),
(257, 'Lago Verde', 14),
(258, 'Aysén', 14),
(259, 'Cisnes', 14),
(260, 'Guaitecas', 14),
(261, 'Cochrane', 14),
(262, 'O\'Higgins', 14),
(263, 'Tortel', 14),
(264, 'Chile Chico', 14),
(265, 'Río Ibáñez', 14),
(266, 'Punta Arenas', 15),
(267, 'Laguna Blanca', 15),
(268, 'Río Verde', 15),
(269, 'San Gregorio', 15),
(270, 'Cabo de Hornos', 15),
(271, 'Antártica', 15),
(272, 'Porvenir', 15),
(273, 'Primavera', 15),
(274, 'Timaukel', 15),
(275, 'Natales', 15),
(276, 'Torres del Paine', 15),
(277, 'Santiago', 16),
(278, 'Cerrillos', 16),
(279, 'Cerro Navia', 16),
(280, 'Conchalí', 16),
(281, 'El Bosque', 16),
(282, 'Estación Central', 16),
(283, 'Huechuraba', 16),
(284, 'Independencia', 16),
(285, 'La Cisterna', 16),
(286, 'La Florida', 16),
(287, 'La Granja', 16),
(288, 'La Pintana', 16),
(289, 'La Reina', 16),
(290, 'Las Condes', 16),
(291, 'Lo Barnechea', 16),
(292, 'Lo Espejo', 16),
(293, 'Lo Prado', 16),
(294, 'Macul', 16),
(295, 'Maipú', 16),
(296, 'Ñuñoa', 16),
(297, 'Pedro Aguirre Cerda', 16),
(298, 'Peñalolén', 16),
(299, 'Providencia', 16),
(300, 'Pudahuel', 16),
(301, 'Quilicura', 16),
(302, 'Quinta Normal', 16),
(303, 'Recoleta', 16),
(304, 'Renca', 16),
(305, 'San Joaquín', 16),
(306, 'San Miguel', 16),
(307, 'San Ramón', 16),
(308, 'Vitacura', 16),
(309, 'Puente Alto', 16),
(310, 'Pirque', 16),
(311, 'San José de Maipo', 16),
(312, 'Colina', 16),
(313, 'Lampa', 16),
(314, 'Tiltil', 16),
(315, 'San Bernardo', 16),
(316, 'Buin', 16),
(317, 'Calera de Tango', 16),
(318, 'Paine', 16),
(319, 'Melipilla', 16),
(320, 'Alhué', 16),
(321, 'Curacaví', 16),
(322, 'María Pinto', 16),
(323, 'San Pedro', 16),
(324, 'Talagante', 16),
(325, 'El Monte', 16),
(326, 'Isla de Maipo', 16),
(327, 'Padre Hurtado', 16),
(328, 'Peñaflor', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Región de Arica y Parinacota'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región del Libertador General Bernardo O’Higgins'),
(8, 'Región del Maule'),
(9, 'Región del Ñuble'),
(10, 'Región del Biobío'),
(11, 'Región de La Araucanía'),
(12, 'Región de Los Ríos'),
(13, 'Región de Los Lagos'),
(14, 'Región de Aysén del General Carlos Ibáñez del Campo'),
(15, 'Región de Magallanes y de la Antártica Chilena'),
(16, 'Región Metropolitana de Santiago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `comuna_id` int(11) DEFAULT NULL,
  `candidato_id` int(11) DEFAULT NULL,
  `como_se_entero` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`id`, `nombre_apellido`, `alias`, `rut`, `email`, `region_id`, `comuna_id`, `candidato_id`, `como_se_entero`) VALUES
(5, 'Bayron', 'Joseph', '19598692-4', 'bayron.joseph@hotmail.com', 6, 70, 2, 'Web, TV'),
(6, 'Patricia Gonzales', 'Paticia21', '7012140-9', 'pati@gmail.com', 13, 235, 2, 'TV, Redes Sociales');

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
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `comuna_id` (`comuna_id`),
  ADD KEY `candidato_id` (`candidato_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`),
  ADD CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
