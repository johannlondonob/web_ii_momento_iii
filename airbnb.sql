-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-07-2020 a las 13:46:07
-- Versión del servidor: 5.7.28
-- Versión de PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `airbnb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id_document_type` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` varchar(3) NOT NULL,
  `document` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `document_is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_document_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`id_document_type`, `document_type`, `document`, `created_at`, `updated_at`, `document_is_active`) VALUES
(1, 'CC', 'CÉDULA DE CIUDADANÍA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(2, 'NIT', 'NÚMERO DE IDENTIFICACIÓN TRIBUTARIA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(3, 'PA', 'PASAPORTE', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(4, 'CE', 'CÉDULA DE EXTRANJERÍA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(5, 'TI', 'TARJETA DE IDENTIDAD', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(6, 'RC', 'REGISTRO CIVIL', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id_property` int(11) NOT NULL AUTO_INCREMENT,
  `property_title` varchar(100) NOT NULL,
  `id_property_type` int(11) NOT NULL,
  `property_address` varchar(100) NOT NULL,
  `property_rooms` tinyint(4) NOT NULL,
  `property_price` float NOT NULL,
  `property_area` varchar(50) NOT NULL,
  `property_description` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `property_is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_property`),
  KEY `id_property_type` (`id_property_type`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `property`
--

INSERT INTO `property` (`id_property`, `property_title`, `id_property_type`, `property_address`, `property_rooms`, `property_price`, `property_area`, `property_description`, `created_at`, `updated_at`, `property_is_active`, `deleted_at`) VALUES
(1, 'A', 1, '873 Locuhi Heights', 3, 203000000, '133', 'EN UNA UBICACIÓN MUY CENTRAL', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(2, 'B', 2, '1424 Fibwo Road', 5, 120304000, '116', 'jefapipinejicnubacazewwotevoza', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(3, 'C', 2, '385 Wanoh Heights', 4, 180558000, '120', 'ubobaafucuseboghezcaguscaebboj', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(4, 'D', 2, '1631 Giroj Road', 6, 100227000, '146', 'koebespakojsegdozaczakuzascato', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(5, 'E', 5, '566 Cisoha Way', 2, 208402000, '164', 'keledwemocaadiugumogagnivoedea', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(6, 'F', 3, '564 Pusha Point', 6, 219654000, '233', 'rewihuznokewukerruulobociemuiv', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(7, 'G', 2, '1530 Gugtot Terrace', 6, 154541000, '102', 'lidosunsupoziinosidzuwumvotwih', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(8, 'H', 4, '269 Obinor Ridge', 3, 229311000, '131', 'avzilopamiliudjiwgarbekmemnojo', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(9, 'I', 6, '1431 Duska Square', 3, 107192000, '188', 'ohumahpinosoogjaftaosigukizuwe', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(10, 'J', 2, '1216 Igik Point', 2, 117436000, '173', 'sohdovuvfufirfehginelgowirmosa', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(11, 'K', 2, '817 Daaz Grove', 2, 105730000, '151', 'ririrufedafoevjevajokesumlorum', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(12, 'L', 3, '1233 Cimdu Plaza', 5, 116998000, '210', 'oshibbuhkalednegzeluhbikikisaz', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(13, 'M', 5, '1371 Mozpe Terrace', 6, 207067000, '205', 'latwekkurawovanozafuvajejroazs', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(14, 'N', 4, '28 Wisnot Square', 5, 136587000, '157', 'mozudaamjewturuefigifaohotiznu', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(15, 'O', 2, '1186 Kovzac Boulevard', 3, 176680000, '149', 'mupelpajnomnaficagidasusevajav', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(16, 'P', 3, '1092 Tiste Terrace', 4, 89237900, '242', 'feesugazbaeflumorvetetazafnulu', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(17, 'Q', 1, '1280 Rocsu Grove', 4, 126848000, '184', 'gituzluruvutegizsevekgisjepefw', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(18, 'R', 5, '897 Poov Extension', 4, 85199600, '235', 'bupivhalvudhemecvewkasmitamipz', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(19, 'S', 3, '1568 Bebram Extension', 2, 220045000, '213', 'vorosbadhavovofvasdullabigogeg', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(20, 'T', 5, '547 Wacmi Pike', 6, 172392000, '166', 'numnokukebpazwiwevesofazbosuze', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(21, 'U', 2, '1241 Taiku Place', 6, 241924000, '128', 'naikfekubufocruetusisobkubhudv', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(22, 'V', 1, '409 Mimmiz Square', 3, 107533000, '110', 'gigizasumbulahwigcakupofedotas', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(23, 'W', 6, '911 Nivjoj Trail', 1, 151577000, '131', 'botirgoltuhjudedujnemupobowidi', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(24, 'AQUI CUALQUIER TITULO DE LA PROPIEDAD', 4, 'AQUI CUALQUIER DIRECCION', 6, 220000, '120', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-19 00:00:00', '2020-06-29 15:39:42', 1, '2020-06-29 15:39:42'),
(25, 'Y', 2, '1218 Ibhav Loop', 3, 188961000, '146', 'odwojifniclavardukhaomvortanuh', '2020-06-19 00:00:00', '2020-06-19 12:27:07', 1, NULL),
(26, 'Z', 6, '662 Cokibu Street', 6, 229377000, '195', 'hevamjoripzodbuhtobacuozemomil', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(27, 'AA', 6, '1013 Zauji Pike', 4, 125343000, '139', 'zienosimujosigijajrochilsajhan', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(28, 'AB', 1, '714 Hune Loop', 1, 164046000, '201', 'bimifukekoefojoefzenenrobvufpi', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(29, 'AC', 6, '1610 Lelen Road', 4, 84439700, '235', 'wuzafelowiobjejuemolempobebupe', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(30, 'AD', 3, '391 Wewse View', 2, 167619000, '222', 'puirvidikhuhjuredjafufimwimruk', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(31, 'AE', 5, '1720 Webe Way', 4, 155501000, '100', 'dejbefertigcuofkeulbikpesawpec', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(32, 'AF', 6, '1278 Kebrib Grove', 6, 211388000, '119', 'kahogomiwufenecetzaupomatsuugi', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(33, 'YA TU SABE', 2, 'CR 58 SUR 4 KLL 22', 4, 30000, '78.7', 'TA TA TA TA TA TA TA TA TA', '2020-06-24 09:38:37', '2020-06-24 09:38:37', 1, NULL),
(34, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 13:47:41', '2020-06-25 13:47:41', 1, NULL),
(35, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:40:23', '2020-06-25 14:40:23', 1, NULL),
(36, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:41:29', '2020-06-25 14:41:29', 1, NULL),
(37, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:45:59', '2020-06-25 14:45:59', 1, NULL),
(38, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:46:37', '2020-06-25 14:46:37', 1, NULL),
(39, 'AQUI CUALQUIER TITULO DE LA PROPIEDAD', 6, 'AQUI CUALQUIER DIRECCION', 6, 220000, '120', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-25 15:02:34', '2020-06-29 15:43:36', 1, '2020-06-29 15:43:36'),
(40, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:53:16', '2020-06-25 15:53:16', 1, NULL),
(41, 'Ja ja nino lerdo', 6, 'Je je kals loe i', 1, 51000, '10', 'jae jañdasdadadade', '2020-06-25 15:54:48', '2020-06-29 11:27:28', 1, '2020-06-29 11:27:28'),
(42, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:55:58', '2020-06-25 15:55:58', 1, NULL),
(43, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:58:57', '2020-06-25 15:58:57', 1, NULL),
(44, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 16:00:26', '2020-06-25 16:00:26', 1, NULL),
(45, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 16:03:54', '2020-06-25 16:03:54', 1, NULL),
(46, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '78.7', 'TI TI TITITITIT', '2020-06-29 11:45:58', '2020-06-29 11:45:58', 1, NULL),
(47, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '78.7', 'TI TI TITITITIT', '2020-06-29 11:59:40', '2020-06-29 11:59:40', 1, NULL),
(48, 'AQUI CUALQUIER TITULO DE LA PROPIEDAD', 2, 'AQUI CUALQUIER DIRECCION', 4, 49000, '180.5', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-29 15:21:27', '2020-06-29 15:21:27', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `property_type`
--

DROP TABLE IF EXISTS `property_type`;
CREATE TABLE IF NOT EXISTS `property_type` (
  `id_property_type` int(11) NOT NULL AUTO_INCREMENT,
  `property_type` varchar(50) NOT NULL,
  `property_type_is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_property_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `property_type`
--

INSERT INTO `property_type` (`id_property_type`, `property_type`, `property_type_is_active`, `created_at`, `updated_at`) VALUES
(1, 'CASA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(2, 'APARTAMENTO', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(3, 'FINCA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(4, 'LOCAL COMERCIAL', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(5, 'BODEGA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(6, 'APARTA-ESTUDIO', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `property_user`
--

DROP TABLE IF EXISTS `property_user`;
CREATE TABLE IF NOT EXISTS `property_user` (
  `id_user` int(11) NOT NULL,
  `id_property` int(11) NOT NULL,
  `property_user_is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_property` (`id_property`),
  KEY `id_user` (`id_user`,`id_property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `property_user`
--

INSERT INTO `property_user` (`id_user`, `id_property`, `property_user_is_active`, `created_at`, `updated_at`) VALUES
(5, 1, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(2, 2, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(2, 3, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(2, 4, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(8, 5, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(10, 6, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(1, 7, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(8, 8, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(7, 9, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(6, 10, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(1, 11, 1, '2020-06-24 16:33:22', '2020-06-29 16:09:26'),
(4, 12, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(1, 13, 0, '2020-06-24 16:33:22', '2020-06-29 16:05:29'),
(7, 14, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(6, 15, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(5, 16, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(4, 17, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(7, 19, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(3, 21, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(8, 22, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(9, 23, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(2, 24, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(3, 25, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(10, 27, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(9, 28, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(6, 29, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(3, 30, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(10, 31, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(6, 32, 1, '2020-06-24 16:33:22', '2020-06-27 12:49:10'),
(20, 34, 1, '2020-06-29 15:58:16', '2020-06-29 15:58:16'),
(11, 39, 1, '2020-06-25 15:22:41', '2020-06-27 13:14:38'),
(11, 40, 1, '2020-06-25 15:53:30', '2020-06-27 13:14:20'),
(11, 41, 1, '2020-06-25 15:55:03', '2020-06-27 13:14:20'),
(6, 42, 1, '2020-06-25 15:56:11', '2020-06-27 12:49:10'),
(6, 43, 1, '2020-06-25 15:59:03', '2020-06-27 12:49:10'),
(6, 44, 1, '2020-06-25 16:00:34', '2020-06-27 12:49:10'),
(6, 45, 1, '2020-06-25 16:03:58', '2020-06-27 12:49:10'),
(20, 46, 1, '2020-06-29 15:55:57', '2020-06-29 15:55:57'),
(20, 47, 1, '2020-06-29 15:57:24', '2020-06-29 15:57:24'),
(20, 48, 1, '2020-06-29 15:57:16', '2020-06-29 15:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `user_lastname` varchar(40) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `id_document_type` int(11) NOT NULL,
  `user_identification` varchar(15) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `id_document_type` (`id_document_type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `user_lastname`, `user_email`, `id_document_type`, `user_identification`, `user_password`, `user_is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'JOHAN ALEXANDER', 'LONDOÑO BEDOYA', 'johannlondonob@gmail.com', 1, '1026154301', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:32:24', NULL),
(2, 'DIEGO FERNANDO', 'AGUDELO AGUDELO', 'diegofer199@gmail.com', 1, '1023121454', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(3, 'MARÍA LA DEL BARRIO', 'GARCÍA', 'maribarrio0909@gmail.com', 1, '1029890122', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(4, 'MARLON ALEXIS', 'LONDOÑO BEDOYA', 'marlon1099@hotmail.com', 1, '1021143001', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(5, 'ANDRÉS FELIPE', 'RENDÓN ZAPATA', 'anfe0595@gmail.com', 1, '1026543333', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(6, 'SANTIAGO', 'ARIAS CORREA', 'sac1995@gmail.com', 1, '1023676234', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(7, 'CARLOS STEEVEN', 'JARAMILLO', 'csjaramillo@gmail.com', 1, '80966533', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(8, 'MAYELLI', 'GRISALES', 'mayellimayelli@gmail.com', 1, '1032545330', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(9, 'MARÍA ALEJANDRA', 'CORDERO SILVA', 'corderosilvaale@gmail.com', 1, '1022654996', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(10, 'JENNY', 'ROJAS ROJAS', 'jrojasj@gmail.com', 1, '1025443441', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(11, 'JUAN JOSÉ', 'LONDOÑO MONTOYA', 'juanjo@gmail.com', 5, '123456789012345', '12345678', 1, '2020-06-23 15:55:28', '2020-06-23 15:55:28', NULL),
(12, 'LINDAY EDILMA', 'MONCADA ARREDONDO', 'lindayedilma@outlook.com', 1, '57839022', '*12345*1', 1, '2020-06-24 07:50:56', '2020-06-24 07:50:56', NULL),
(13, 'JULIAN ALBERTO', 'GOMEZ BOLANOS', 'julialberto@hotmail.com', 3, 'A943D0S223H1', '*2$88545\\', 1, '2020-06-24 08:11:46', '2020-06-24 08:11:46', NULL),
(18, 'VALENTINA', 'LONDONO MONTOYA', 'valentinalondomontoya@gmail.com', 5, '10294039124', '%9fsf&/as1', 1, '2020-06-24 10:41:45', '2020-06-24 10:41:45', NULL),
(19, 'VALENTINA', 'LONDONO MONTOYA', 'valentinalondomotoya@gmail.com', 1, '1yy0294039124', '%9fsf&/as1', 1, '2020-06-24 15:43:46', '2020-06-24 15:43:46', NULL),
(20, 'VALENTINA', 'LONDONO MONTOYA', 'valentialondomotoya@gmail.com', 1, '1024039124', '%9fsf&/as1', 1, '2020-06-29 11:46:42', '2020-06-29 11:46:42', NULL),
(21, 'AQUI CUALQUIER NOMBRE', 'AQUI CUALQUIER APELLIDO', 'gomezfsd09@gmail.com', 1, '213345345234', 'UAL¡UIER&CLAVE', 1, '2020-06-29 15:13:17', '2020-06-29 15:13:17', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`id_property_type`) REFERENCES `property_type` (`id_property_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `property_user`
--
ALTER TABLE `property_user`
  ADD CONSTRAINT `property_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `property_user_ibfk_2` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id_document_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
