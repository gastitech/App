-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-08-2019 a las 00:48:20
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_db`
--
CREATE DATABASE IF NOT EXISTS `app_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `app_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

DROP TABLE IF EXISTS `compania`;
CREATE TABLE IF NOT EXISTS `compania` (
  `ID_Compania` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(11) NOT NULL,
  `Email` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Compania`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`ID_Compania`, `Nombre`, `Email`) VALUES
(1, 'Jorge', 'Peluqueria'),
(2, 'Manuela', 'camila23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `ID_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(11) NOT NULL,
  `Marca` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='La tabla contiene cada producto que se pueda ofrecer';

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `Nombre`, `Marca`) VALUES
(1, 'Jabon', 'Noblex'),
(2, 'Manteca', 'Conaprole'),
(3, 'Corte', 'niño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_compania`
--

DROP TABLE IF EXISTS `producto_compania`;
CREATE TABLE IF NOT EXISTS `producto_compania` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Compania` int(11) NOT NULL,
  `Tiempo` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`,`ID_Compania`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_compania`
--

INSERT INTO `producto_compania` (`ID_Producto`, `ID_Compania`, `Tiempo`, `Precio`) VALUES
(1, 1, 10, 120),
(3, 1, 30, 500),
(1, 2, 1, 50),
(2, 2, 1, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Compania` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Producto`,`ID_Compania`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`ID_Usuario`, `ID_Producto`, `ID_Compania`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Tipo` int(11) NOT NULL DEFAULT '1' COMMENT 'Tipos: 1-Cliente ; 2-Dueño',
  `Nombre` varchar(11) NOT NULL,
  `Apellido` varchar(11) NOT NULL,
  `Email` varchar(11) DEFAULT NULL,
  `Foto` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `ID_Tipo`, `Nombre`, `Apellido`, `Email`, `Foto`) VALUES
(1, 1, 'Maria', 'Gonzalez', 'mari33', NULL),
(2, 2, 'Pepe', 'Rocho', 'Salame', NULL),
(3, 2, 'Ana', 'Liza', 'Meltrozo', NULL),
(4, 1, 'Anthony', 'Peralta', 'Gaston', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
