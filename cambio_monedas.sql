-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2020 a las 07:23:40
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cambio_monedas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` int(11) NOT NULL,
  `simbolo` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `actualizacion` date NOT NULL,
  `tarifa` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id`, `simbolo`, `nombre`, `actualizacion`, `tarifa`) VALUES
(1, 'USD', 'Dolar Estadounidense', '0000-00-00', '1.18'),
(2, 'EUR', 'Euro', '0000-00-00', '1.00'),
(3, 'GBP', 'Libra Esterlina', '0000-00-00', '0.90'),
(4, 'CAD', 'Dolar Canadiense', '0000-00-00', '1.57'),
(5, 'JPY', 'Yen Japones', '0000-00-00', '124.96'),
(6, 'AUD', 'Dolar Australiano', '0000-00-00', '1.64'),
(7, 'HNL', 'Lempira', '0000-00-00', '29.55'),
(8, 'ZAR', 'Rand sudafricano', '0000-00-00', '20.76'),
(9, 'ILS', 'Shekel israelÃ­', '0000-00-00', '4.03'),
(10, 'MXN', 'Peso Mexicano', '0000-00-00', '26.62'),
(11, 'ABC', 'otra moneda', '2020-08-06', '1.23'),
(12, 'XYZ', 'Moneda Nueva ', '2020-08-06', '1.46'),
(13, 'EFG', 'Moneda Vieja', '2020-08-07', '0.57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
