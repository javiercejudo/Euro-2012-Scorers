-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 23, 2012 at 12:21 PM
-- Server version: 5.1.61-log
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eurocup`
--

-- --------------------------------------------------------

--
-- Table structure for table `top_goal_scorers`
--

CREATE TABLE IF NOT EXISTS `top_goal_scorers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `sName` varchar(100) NOT NULL,
  `iGoals` tinyint(3) unsigned NOT NULL,
  `sCountry` varchar(50) NOT NULL,
  `sFlag` varchar(255) NOT NULL,
  `sFlagLarge` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_NAMES` (`sName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='works only as cache for the webservice' AUTO_INCREMENT=50 ;

--
-- Dumping data for table `top_goal_scorers`
--

INSERT INTO `top_goal_scorers` (`id`, `sName`, `iGoals`, `sCountry`, `sFlag`, `sFlagLarge`) VALUES
(1, 'Alan Dzagoev', 3, 'Y', 'http://footballpool.dataaccess.eu/images/flags/ru.gif', 'http://footballpool.dataaccess.eu/images/flags/ru.png'),
(2, 'Mario Gómez', 3, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(3, 'Mario Mandzukic', 3, 'Y', 'http://footballpool.dataaccess.eu/images/flags/hr.gif', 'http://footballpool.dataaccess.eu/images/flags/hr.png'),
(4, 'Andriy Shevchenko', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/ua.gif', 'http://footballpool.dataaccess.eu/images/flags/ua.png'),
(5, 'Cesc Fàbregas', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/es.gif', 'http://footballpool.dataaccess.eu/images/flags/es.png'),
(6, 'Fernando Torres', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/es.gif', 'http://footballpool.dataaccess.eu/images/flags/es.png'),
(7, 'Nicklas Bendtner', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/dk.gif', 'http://footballpool.dataaccess.eu/images/flags/dk.png'),
(8, 'Olof Mellberg', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/se.gif', 'http://footballpool.dataaccess.eu/images/flags/se.png'),
(9, 'Václav Pilar', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/cz.gif', 'http://footballpool.dataaccess.eu/images/flags/cz.png'),
(10, 'Andrea Pirlo', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/it.gif', 'http://footballpool.dataaccess.eu/images/flags/it.png'),
(11, 'Andy Carroll', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/en.gif', 'http://footballpool.dataaccess.eu/images/flags/en.png'),
(12, 'Antonio Di Natale', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/it.gif', 'http://footballpool.dataaccess.eu/images/flags/it.png'),
(13, 'Danny Welbeck', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/en.gif', 'http://footballpool.dataaccess.eu/images/flags/en.png'),
(14, 'David Silva', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/es.gif', 'http://footballpool.dataaccess.eu/images/flags/es.png'),
(15, 'Dimitris Salpigidis', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/gr.gif', 'http://footballpool.dataaccess.eu/images/flags/gr.png'),
(16, 'Hélder Postiga', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pt.gif', 'http://footballpool.dataaccess.eu/images/flags/pt.png'),
(17, 'Jakub Blaszczykowski', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pl.gif', 'http://footballpool.dataaccess.eu/images/flags/pl.png'),
(18, 'Jérémy Menez', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/fr.gif', 'http://footballpool.dataaccess.eu/images/flags/fr.png'),
(19, 'Joleon Lescott', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/en.gif', 'http://footballpool.dataaccess.eu/images/flags/en.png'),
(20, 'Képler Ferreira (Pepe)', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pt.gif', 'http://footballpool.dataaccess.eu/images/flags/pt.png'),
(21, 'Michael Krohn-Dehli', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/dk.gif', 'http://footballpool.dataaccess.eu/images/flags/dk.png'),
(22, 'Nikica Jelavic', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/hr.gif', 'http://footballpool.dataaccess.eu/images/flags/hr.png'),
(23, 'Petr Jirácek', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/cz.gif', 'http://footballpool.dataaccess.eu/images/flags/cz.png'),
(24, 'Robert Lewandowski', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pl.gif', 'http://footballpool.dataaccess.eu/images/flags/pl.png'),
(25, 'Robin van Persie', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/nl.gif', 'http://footballpool.dataaccess.eu/images/flags/nl.png'),
(26, 'Roman Pavlyuchenko', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/ru.gif', 'http://footballpool.dataaccess.eu/images/flags/ru.png'),
(27, 'Roman Shirokov', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/ru.gif', 'http://footballpool.dataaccess.eu/images/flags/ru.png'),
(28, 'Samir Nasri', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/fr.gif', 'http://footballpool.dataaccess.eu/images/flags/fr.png'),
(29, 'Sean St Ledger', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/ie.gif', 'http://footballpool.dataaccess.eu/images/flags/ie.png'),
(30, 'Silvestre Varela', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pt.gif', 'http://footballpool.dataaccess.eu/images/flags/pt.png'),
(31, 'Theo Walcott', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/en.gif', 'http://footballpool.dataaccess.eu/images/flags/en.png'),
(32, 'Theofanis Gekas', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/gr.gif', 'http://footballpool.dataaccess.eu/images/flags/gr.png'),
(33, 'Yohan Cabaye', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/fr.gif', 'http://footballpool.dataaccess.eu/images/flags/fr.png'),
(34, 'Zlatan Ibrahimovic', 2, 'Y', 'http://footballpool.dataaccess.eu/images/flags/se.gif', 'http://footballpool.dataaccess.eu/images/flags/se.png'),
(35, 'Giorgos Karagounis', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/gr.gif', 'http://footballpool.dataaccess.eu/images/flags/gr.png'),
(36, 'Rafael van der Vaart', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/nl.gif', 'http://footballpool.dataaccess.eu/images/flags/nl.png'),
(37, 'Lukas Podolski', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(38, 'Cristiano Ronaldo', 3, 'Y', 'http://footballpool.dataaccess.eu/images/flags/pt.gif', 'http://footballpool.dataaccess.eu/images/flags/pt.png'),
(39, 'Lars Bender', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(40, 'Antonio Cassano', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/it.gif', 'http://footballpool.dataaccess.eu/images/flags/it.png'),
(41, 'Jesús Navas', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/es.gif', 'http://footballpool.dataaccess.eu/images/flags/es.png'),
(42, 'Mario Balotelli', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/it.gif', 'http://footballpool.dataaccess.eu/images/flags/it.png'),
(43, 'Wayne Rooney', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/en.gif', 'http://footballpool.dataaccess.eu/images/flags/en.png'),
(44, 'Sebastian Larsson', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/se.gif', 'http://footballpool.dataaccess.eu/images/flags/se.png'),
(45, 'Giorgos Samaras', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/gr.gif', 'http://footballpool.dataaccess.eu/images/flags/gr.png'),
(46, 'Marco Reus', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(47, 'Miroslav Klose', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(48, 'Philipp Lahm', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png'),
(49, 'Sami Khedira', 1, 'Y', 'http://footballpool.dataaccess.eu/images/flags/de.gif', 'http://footballpool.dataaccess.eu/images/flags/de.png');

-- --------------------------------------------------------

--
-- Table structure for table `variables`
--

CREATE TABLE IF NOT EXISTS `variables` (
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `value` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `variables`
--

INSERT INTO `variables` (`name`, `value`) VALUES
('last_update', '2012-06-23 12:21:11');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
