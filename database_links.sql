-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-12-2020 a las 08:34:42
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database_links`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `title`, `url`, `description`, `user_id`, `created_at`) VALUES
(15, 'Facebook', 'http://facebook.com', 'Redes Sociales', NULL, '2020-12-08 04:41:48'),
(16, 'Program', 'http://w3school.com', 'Pagina para aprender programacion', NULL, '2020-12-08 04:55:06'),
(17, 'Instagram', 'http://instagram.com', 'Red Social', NULL, '2020-12-08 23:35:46'),
(19, 'instagram', 'http://instagram.com', 'Red Social\r\n', 6, '2020-12-09 00:48:07'),
(20, 'Fb Finn', 'https://www.facebook.com/alee.faciio', 'pagina de finn', 7, '2020-12-09 00:59:39'),
(21, 'youtube', 'http://youtube.com', 'Pagina de videos', 7, '2020-12-09 01:01:14'),
(22, 'instagram', 'http://instagram.com', 'Red Social', 5, '2020-12-09 01:02:24'),
(24, 'facebook', 'https://www.facebook.com/josearmando.esparzaoviedo.3', 'Página de Armando', 8, '2020-12-09 01:18:33'),
(25, 'youtube', 'https://www.youtube.com/channel/UCToKsdaKxt7o3YWec8C90zA', 'Pagina de ElNuevoElemento', 6, '2020-12-09 01:20:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('gcBaLCQDwSl0RJhhC-pD_4RzZ9D7ZEBC', 1607563339, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(2, 'abraham', '$2a$10$nZuBD9eyZCzCPlzojMKHOOAw0MJ2a0NWxeHVQcttbZ1IGGNL0T4Zi', 'abraham'),
(3, 'abraham', '$2a$10$vburXr0qgd4GiwKefBengO1e.c6tPlPh0BLuHfsJC1Sub/QQfnGmm', 'abraham'),
(4, 'garo', '$2a$10$BcuUsiAP6D3p0bvrMx.0qu8CZceM0LFBXGmyb3iibiP72n199jgwy', 'edgar'),
(5, 'Edgar', '$2a$10$RTD2Uv/G2Pu7eF4FVuykveucX7xSezLvbFWPW9qxfj0NpCQJCfoLC', 'Edgar'),
(6, 'Meme', '$2a$10$nIvF3r4OTfUREZpBt99iXuGVvCuEQzhH9ZeeBZP3I.UN23Ke18eBK', 'Meme'),
(7, 'Finn', '$2a$10$B4SYI3oWUysXffwRL8TemuRzak8DDTVkJFkg6n5yf7i22ZMOajC5W', 'Finn'),
(8, 'Veneno', '$2a$10$THUUJZMbNKuig3B5mExmyuopGL3oIml.A040B2Xx7yk8G61GIsoQG', 'Armando'),
(9, 'Monse', '$2a$10$ujSJ3OidA5xUDhqCj7lnGuM0Win/MYZPJX4g1BaBv4b/08qVHpUmq', 'Monse');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
