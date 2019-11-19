-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2019 at 12:04 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniexport`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `alldetailed`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `alldetailed`;
CREATE TABLE IF NOT EXISTS `alldetailed` (
`id` int(11)
,`export` varchar(100)
,`dat` date
,`usdToEgp` double
,`shippingCompany` varchar(30)
,`boles` tinyint(1)
,`PORT` varchar(100)
,`exportDate` date
,`manualWork` tinyint(1)
,`receiptDate` date
,`manifesto` tinyint(1)
,`nolon` double
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`CLIENT` varchar(80)
,`country` varchar(50)
,`Cnolon` tinyint(1)
,`Cmanifest` tinyint(1)
,`company` varchar(30)
,`brand` varchar(50)
,`committee` varchar(300)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolonSupport` double
,`manifestoSupport` double
,`notes` varchar(1000)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `allrecords`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `allrecords`;
CREATE TABLE IF NOT EXISTS `allrecords` (
`id` int(11)
,`export` varchar(100)
,`exportDate` date
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`country` varchar(50)
,`company` varchar(30)
,`brand` varchar(50)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolon` double
,`manifesto` double
);

-- --------------------------------------------------------

--
-- Table structure for table `bankreceipt`
--

DROP TABLE IF EXISTS `bankreceipt`;
CREATE TABLE IF NOT EXISTS `bankreceipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `num` varchar(11) NOT NULL,
  `country` int(11) NOT NULL,
  `usd` double NOT NULL,
  `dat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceipt`
--

INSERT INTO `bankreceipt` (`id`, `company`, `num`, `country`, `usd`, `dat`) VALUES
(8, 3, '192340070', 49, 15500, '2019-08-22'),
(9, 3, '192260019', 71, 183476.95, '2019-08-14'),
(10, 3, '19220018', 54, 250677.86, '2019-08-08'),
(11, 3, '192330012', 71, 242150, '2019-08-21'),
(12, 3, '190900017', 37, 32817.67, '2019-03-31'),
(13, 3, '191250028', 49, 31842.84, '2019-05-05'),
(14, 3, '191710071', 37, 15894.2, '2019-06-20'),
(15, 3, '19212003', 71, 109316.8, '2019-07-31'),
(16, 3, '191970009', 54, 96687.3, '2019-07-16'),
(17, 3, '19168008', 71, 140960, '2019-06-17'),
(18, 3, '191950018', 54, 247369.3, '2019-07-14'),
(19, 3, '192020065', 54, 39598, '2019-07-21'),
(20, 3, '190030010', 54, 7072, '2019-01-03'),
(21, 3, '191700005', 54, 106347.6, '2019-06-19'),
(22, 3, '191970017', 54, 55313.52, '2019-07-16'),
(23, 3, '190760010', 54, 988776.28, '2019-03-17'),
(24, 3, '192030017', 54, 22429.56, '2019-07-22'),
(25, 3, '192330004', 54, 33868.5, '2019-08-21'),
(26, 3, '190930001', 73, 60000, '2019-04-03'),
(27, 3, '192600003', 54, 84045.84, '2019-09-17'),
(28, 3, '192690008', 71, 102345.28, '2019-09-26'),
(29, 3, '192600060', 49, 45160.6, '2019-09-17'),
(30, 3, '192730003', 54, 49386.84, '2019-09-30'),
(31, 3, '192740007', 54, 31065.1, '2019-10-01'),
(32, 3, '192660004', 54, 80519.31, '2019-09-23'),
(33, 3, '192370019', 54, 53358.09, '2019-08-25'),
(34, 3, '192550005', 71, 50938.69, '2019-09-12'),
(35, 3, '192340010', 54, 31540.09, '2019-08-22'),
(36, 3, '192590020', 37, 31152.32, '2019-09-16'),
(37, 3, '192590017', 37, 29926.96, '2019-09-16'),
(38, 3, '191990005', 54, 28562.76, '2019-07-18'),
(39, 3, '19232', 71, 22100, '2019-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `bankreceiptdata`
--

DROP TABLE IF EXISTS `bankreceiptdata`;
CREATE TABLE IF NOT EXISTS `bankreceiptdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankReceipt` int(11) NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceiptdata`
--

INSERT INTO `bankreceiptdata` (`id`, `bankReceipt`, `exportCertificate`) VALUES
(4, 8, 1966),
(5, 10, 1972),
(6, 10, 1971),
(7, 13, 1976),
(8, 14, 1977),
(9, 12, 1964),
(10, 12, 1963),
(11, 9, 1970),
(12, 9, 1969),
(13, 9, 1968),
(14, 9, 1967),
(15, 11, 1975),
(16, 11, 1974),
(17, 11, 1973),
(18, 15, 1980),
(19, 15, 1979),
(20, 15, 1978),
(21, 16, 1982),
(22, 16, 1981),
(23, 17, 1993),
(24, 17, 1992),
(25, 18, 1991),
(26, 18, 1990),
(27, 18, 1989),
(28, 18, 1987),
(29, 18, 1988),
(30, 19, 1983),
(31, 20, 1984),
(32, 21, 1985),
(33, 22, 1986),
(34, 23, 2016),
(35, 23, 2015),
(36, 23, 2014),
(37, 23, 2013),
(38, 23, 2012),
(39, 23, 2011),
(40, 23, 2010),
(41, 23, 2009),
(42, 23, 2008),
(43, 23, 2007),
(44, 23, 2006),
(45, 23, 2005),
(46, 23, 2004),
(47, 23, 2003),
(48, 23, 2002),
(49, 23, 2001),
(50, 23, 2000),
(51, 23, 1999),
(52, 23, 1998),
(53, 23, 1997),
(54, 23, 1996),
(55, 23, 1995),
(56, 23, 1994),
(57, 25, 2018),
(58, 24, 2017),
(59, 26, 2019),
(60, 27, 2022),
(61, 27, 2021),
(62, 27, 2020),
(63, 28, 2023),
(64, 29, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

DROP TABLE IF EXISTS `booked`;
CREATE TABLE IF NOT EXISTS `booked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valueEgp` double NOT NULL,
  `dat` date NOT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bookeddata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `bookeddata`;
CREATE TABLE IF NOT EXISTS `bookeddata` (
`date` date
,`booked` double
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brandCat` int(11) NOT NULL,
  `committee` int(11) NOT NULL,
  `supportPercentage` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandCat` (`brandCat`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `brandCat`, `committee`, `supportPercentage`) VALUES
(6, 'Dov', 6, 1, 0.12),
(7, 'Clear Shampoo', 9, 1, 0.12),
(8, 'signal', 8, 1, 0.11),
(9, 'Comfort', 7, 2, 0.12),
(10, 'fair& loely cream', 5, 1, 0.1),
(11, 'Sunsilk Shampoo', 9, 2, 0.1),
(12, 'Lux Shower Gel', 6, 1, 0.1),
(13, 'Close Up', 8, 1, 0.11),
(14, 'camy', 6, 1, 0.1),
(15, 'forest', 8, 1, 0.09),
(16, 'Ù…ÙˆØ§Ø¯ ØªØ­Ø¶ÙŠØ± ØµÙ†Ø§Ø¹ÙŠ', 8, 1, 0.12),
(17, 'Tea Bag ', 10, 1, 0.07),
(18, 'Tea Bags', 10, 2, 0.09);

-- --------------------------------------------------------

--
-- Table structure for table `brandcat`
--

DROP TABLE IF EXISTS `brandcat`;
CREATE TABLE IF NOT EXISTS `brandcat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brandcat`
--

INSERT INTO `brandcat` (`id`, `name`, `company`) VALUES
(5, 'mass skin', 1),
(6, 'Personal Wash Category', 1),
(7, 'Fabric Conditioner Ctegory', 1),
(8, 'Oral Category', 1),
(9, 'Hair Category', 1),
(10, 'Libton Tea Bag', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cheque`
--

DROP TABLE IF EXISTS `cheque`;
CREATE TABLE IF NOT EXISTS `cheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(15) NOT NULL,
  `company` int(11) NOT NULL,
  `valueEgp` double NOT NULL,
  `dat` date NOT NULL,
  `copy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheque`
--

INSERT INTO `cheque` (`id`, `num`, `company`, `valueEgp`, `dat`, `copy`) VALUES
(3, '1', 3, 100000, '2019-10-23', 'imgs\\3');

-- --------------------------------------------------------

--
-- Table structure for table `chequedata`
--

DROP TABLE IF EXISTS `chequedata`;
CREATE TABLE IF NOT EXISTS `chequedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cheque` int(11) NOT NULL,
  `fileNo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `chequerecieved`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `chequerecieved`;
CREATE TABLE IF NOT EXISTS `chequerecieved` (
`cheque` varchar(15)
,`chequeDate` date
,`fileNo` varchar(20)
,`bankreceipt` varchar(11)
,`export` varchar(100)
,`exportDate` date
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`country` varchar(50)
,`company` varchar(30)
,`brand` varchar(50)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolon` double
,`manifesto` double
);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `country` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `company`, `name`, `email`, `fax`, `phone`, `country`, `address`, `notes`) VALUES
(182, 1, 'panzani', '', '', '', 39, '', ''),
(183, 1, 'internatioal group', '', '', '', 45, '', ''),
(184, 1, 'UTIC Distribution', '', '', '', 36, '', ''),
(185, 1, 'towell unileve', '', '', '', 50, '', ''),
(186, 1, 'unilever ivory cost', '', '', '', 43, '', ''),
(187, 1, 'mu pharmacie', '', '', '', 52, '', ''),
(188, 1, 'unilever sanayia v', '', '', '', 48, '', ''),
(189, 1, 'unilever asia privat', '', '', '', 54, '', ''),
(190, 1, 'sharm treading', '', '', '', 65, '', ''),
(191, 1, 'unilever algeria', '', '', '', 49, '', ''),
(192, 1, 'unilever u ', '', '', '', 44, '', ''),
(193, 1, 'near east for distribution & marketing C', '', '', '', 47, '', ''),
(194, 1, 'aoutostarda trine', '', '', '', 59, '', ''),
(195, 1, 'Khairat Al Mazraa For Genral Trading', '', '', '', 40, '', ''),
(196, 1, 'kiev rdc', '', '', '', 58, '', ''),
(197, 1, 'heyel saeed anam', '', '', '', 53, '', ''),
(198, 1, 'binzager', '', '', '', 60, '', ''),
(199, 1, 'serven gulf fze', '', '', '', 48, '', ''),
(200, 1, 'Adiyat Marketing & Distribution Co', '', '', '', 34, '', ''),
(201, 1, 'thai united food', '', '', '', 66, '', ''),
(202, 1, 'edl mass market', '', '', '', 35, '', ''),
(203, 1, 'sergeya makeyeva', '', '', '', 55, '', ''),
(204, 1, 'unilever ukranine', '', '', '', 58, '', ''),
(205, 1, 'kiev', '', '', '', 58, '', ''),
(206, 1, 'unilever general treadind', '', '', '', 50, '', ''),
(207, 1, 'unilever dijbouti', '', '', '', 51, '', ''),
(208, 1, 'hayl saeed anam', '', '', '', 53, '', ''),
(209, 1, 'benzager', '', '', '', 60, '', ''),
(210, 1, 'unilever asia', '', '', '', 57, '', ''),
(211, 1, 'unilever kuwait', '', '', '', 38, '', ''),
(212, 1, 'unilever kenya', '', '', '', 61, '', ''),
(213, 1, 'kiev rd', '', '', '', 58, '', ''),
(214, 1, 'Endurance', '', '', '', 63, '', ''),
(215, 1, 'unilever maghreb', '', '', '', 37, '', ''),
(216, 1, 'unilever south africa', '', '', '', 42, '', ''),
(217, 1, 'unilever serven gulf', '', '', '', 54, '', ''),
(218, 1, 'unilever rus', '', '', '', 55, '', ''),
(219, 1, 'unilever bahrian', '', '', '', 46, '', ''),
(220, 1, 'unilever oman', '', '', '', 50, '', ''),
(221, 1, 'unilever rci dc export', '', '', '', 39, '', ''),
(222, 1, 'kievo', '', '', '', 58, '', ''),
(223, 1, 'kie', '', '', '', 58, '', ''),
(224, 1, 'Modern Arab Distribution Co. Ltd', '', '', '', 54, '', ''),
(226, 3, 'SDC BERBERA FZCO (SDC GROUP)', '', '', '', 41, '', ''),
(227, 3, 'HAYEL SAEED ANAM & CO. (C.S.C) - TRADING', '', '', '', 53, '', ''),
(228, 3, 'Veda Trading Fze', '', '', '', 54, '', ''),
(229, 3, 'KHAIRAT AL QARIEH FOOD STUFF TRADING', '', '', '', 40, '', ''),
(230, 3, 'UNILEVER MAGHREB', '', '', '', 37, '', ''),
(231, 3, 'AMI MIDDLE EAST LLC', '', '', '', 54, '', ''),
(232, 3, 'Algeria CDC Local Plant', '', '', '', 49, '', ''),
(233, 3, 'ROCCO GLOBAL LIMITED', '', '', '', 70, '', ''),
(234, 3, 'INTERNATIONAL GENERAL TRADING FOR TRADE & INVESTMENT', '', '', '', 45, '', ''),
(235, 3, 'Unilever General trading', '', '', '', 63, '', ''),
(236, 3, 'International Group for import', '', '', '', 64, '', ''),
(237, 3, 'PRINCE DAIRY COMPANY', '', '', '', 34, '', ''),
(238, 3, 'MODERN ARAB DISTRIBUTION LTD', '', '', '', 45, '', ''),
(239, 3, 'SAG GROUP OF COMPANIES LTD', '', '', '', 72, '', ''),
(240, 3, 'NEAR EAST FOR DISTRIBUTION & MARKETING CO', '', '', '', 47, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
CREATE TABLE IF NOT EXISTS `committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `committee`
--

INSERT INTO `committee` (`id`, `name`, `company`) VALUES
(1, 'food', 3),
(2, 'chimical', 3);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `logo` blob,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `phone`, `fax`, `address`, `logo`, `notes`) VALUES
(1, 'Unilever Mashreq Personal care', 'UMPC@Unilever.com', '01066934662', '123', 'Ø§Ù„Ù…Ù†Ø·Ù‚Ø© Ø§Ù„ØµÙ†Ø§Ø¹ÙŠØ© Ø§Ù„Ø±Ø§Ø¨Ø¹Ø© - 6 Ø£ÙƒØªÙˆØ¨Ø±', NULL, ''),
(3, 'Unilever Mashreq Tea', 'MMT@Unilever.com', '01066934662', '123', 'ÙƒÙˆØ¨Ø±Ù‰ 14 Ù…Ø§ÙŠÙˆ Ø³Ù…ÙˆØ­Ø© - Ø§Ù„Ø£Ø³ÙƒÙ†Ø¯Ø±ÙŠØ©', NULL, ''),
(4, 'Unilever Mashreq Home Care', 'UMHC@Unilever.com', '01066934662', '123', 'Ø§Ù„Ù…Ù†Ø·Ù‚Ø© Ø§Ù„ØµÙ†Ø§Ø¹ÙŠØ© Ø§Ù„Ø±Ø§Ø¨Ø¹Ø© - 6 Ø£ÙƒØªÙˆØ¨Ø±', NULL, ''),
(6, 'Unilever Mashreq Foods', 'UMF@unilever.com', '01066934662', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nolon` tinyint(1) NOT NULL,
  `manifest` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `nolon`, `manifest`) VALUES
(34, 'sudan', 1, 0),
(35, 'madgascar', 1, 0),
(36, 'Tunisia', 1, 0),
(37, 'Morocco', 1, 0),
(38, 'kuwait', 0, 0),
(39, 'cameroon', 1, 0),
(40, 'iraq', 1, 0),
(41, 'djibouti', 1, 0),
(42, 'south africa', 1, 0),
(43, 'ivory coast', 1, 0),
(44, 'united kingdom', 0, 0),
(45, 'Jordan', 0, 0),
(46, 'Bahrian', 0, 0),
(47, 'palestine', 0, 0),
(48, 'Turkey', 0, 0),
(49, 'Algeria', 1, 0),
(50, 'Oman', 0, 0),
(51, 'ethipoa', 1, 0),
(52, 'muritustus', 1, 0),
(53, 'yemen', 0, 0),
(54, 'UAE', 0, 0),
(55, 'russian', 0, 1),
(57, 'azrerbaijan', 0, 0),
(58, 'ukrania', 0, 1),
(59, 'albania', 0, 0),
(60, 'ksa', 0, 0),
(61, 'kenya', 1, 0),
(62, 'USA', 0, 0),
(63, 'Lebanon', 0, 0),
(64, 'libya', 1, 0),
(65, 'georgia', 0, 0),
(66, 'canada', 0, 0),
(70, 'Gambia', 1, 1),
(71, 'Asia', 0, 0),
(72, 'Uganda', 1, 0),
(73, 'Saudi arabia', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `estiva`
--

DROP TABLE IF EXISTS `estiva`;
CREATE TABLE IF NOT EXISTS `estiva` (
  `id` int(11) NOT NULL,
  `company` int(11) NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  `dat` date NOT NULL,
  `note` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `estivareport`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `estivareport`;
CREATE TABLE IF NOT EXISTS `estivareport` (
`export` varchar(100)
,`shippingCompany` varchar(30)
,`PORT` varchar(100)
,`exportDate` date
,`manualWork` tinyint(1)
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`CLIENT` varchar(80)
,`country` varchar(50)
,`Cnolon` tinyint(1)
,`Cmanifest` tinyint(1)
,`company` varchar(30)
,`brand` varchar(50)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolon` double
,`manifesto` double
,`note` varchar(400)
);

-- --------------------------------------------------------

--
-- Table structure for table `exportcertificate`
--

DROP TABLE IF EXISTS `exportcertificate`;
CREATE TABLE IF NOT EXISTS `exportcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) NOT NULL,
  `company` int(11) NOT NULL,
  `dat` date NOT NULL,
  `country` int(11) NOT NULL,
  `port` int(11) NOT NULL,
  `shippingCompany` int(11) NOT NULL,
  `boles` tinyint(1) NOT NULL DEFAULT '0',
  `nolon` double NOT NULL DEFAULT '0',
  `manifesto` tinyint(1) NOT NULL DEFAULT '0',
  `usdToEgp` double NOT NULL DEFAULT '0',
  `manualWork` tinyint(1) DEFAULT '0',
  `receiptDate` date DEFAULT NULL,
  `notes` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `company` (`company`),
  KEY `country` (`country`),
  KEY `port` (`port`),
  KEY `shippingCompany` (`shippingCompany`)
) ENGINE=InnoDB AUTO_INCREMENT=2030 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exportcertificate`
--

INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `nolon`, `manifesto`, `usdToEgp`, `manualWork`, `receiptDate`, `notes`) VALUES
(1963, '19112', 3, '2019-04-20', 40, 10, 4, 1, 844, 0, 17.5, 0, NULL, ''),
(1964, '20752', 3, '2019-04-30', 40, 10, 4, 1, 844, 0, 17.5, NULL, NULL, ''),
(1966, '14511', 3, '2019-07-21', 49, 11, 4, 1, 516, 0, 16.5, NULL, NULL, ''),
(1967, '30413', 3, '2019-07-14', 53, 10, 4, 1, 0, 0, 16.5, NULL, NULL, ''),
(1968, '12070', 3, '2019-04-07', 70, 11, 4, 1, 5836, 0, 17.5, NULL, NULL, ''),
(1969, '17597', 3, '2019-04-11', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, 'لا يوجد بها رقم بيرفورما'),
(1970, '24739', 3, '2018-11-28', 49, 11, 4, 1, 788, 0, 17.5, NULL, NULL, ''),
(1971, '31007', 3, '2019-07-20', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1972, '5450', 3, '2019-03-21', 40, 11, 4, 1, 1260, 0, 17.5, NULL, NULL, ''),
(1973, '31006', 3, '2019-07-20', 41, 10, 4, 1, 0, 0, 16.5, NULL, NULL, ''),
(1974, '12492', 3, '2019-06-23', 49, 11, 4, 1, 848, 0, 17.5, NULL, NULL, ''),
(1975, '26075', 3, '2018-12-19', 45, 11, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1976, '5551', 3, '2019-03-23', 49, 11, 4, 1, 820, 0, 17.5, NULL, NULL, ''),
(1977, '12134', 3, '2019-06-18', 37, 11, 4, 1, 276, 0, 17.5, NULL, NULL, ''),
(1978, '10682', 3, '2019-05-25', 70, 11, 4, 1, 2568, 1, 17.5, 0, NULL, ''),
(1979, '2167', 3, '2019-01-19', 37, 10, 4, 1, 288, 0, 17.5, NULL, NULL, 'يوجد صورة اضافية لهذه الشهاده بعد تقديمها'),
(1980, '20556', 3, '2019-04-28', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1981, '16506', 3, '2019-04-06', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1982, '8542', 3, '2019-04-27', 37, 11, 4, 1, 405, 0, 17.5, NULL, NULL, ''),
(1983, '43104', 3, '2018-10-28', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1984, '20526', 3, '2018-09-29', 63, 11, 6, 1, 0, 0, 17.5, NULL, NULL, ''),
(1985, '19025', 3, '2018-09-08', 64, 11, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1986, '46093', 3, '2018-11-25', 40, 10, 4, 1, 1940, 0, 17.5, NULL, NULL, ''),
(1987, '41876', 3, '2018-10-17', 34, 10, 6, 1, 807, 0, 17.5, NULL, NULL, ''),
(1988, '41875', 3, '2018-10-17', 34, 10, 6, 1, 807, 0, 17.5, NULL, NULL, ''),
(1989, '24113', 3, '2018-11-17', 49, 11, 4, 1, 738, 0, 17.5, NULL, NULL, ''),
(1990, '42406', 3, '2018-10-22', 40, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1991, '48690', 3, '2018-12-13', 45, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1992, '48433', 3, '2018-12-12', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1993, '43105', 3, '2018-10-28', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1994, '22152', 3, '2019-05-09', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1995, '1308', 3, '2019-01-23', 49, 11, 4, 1, 820, 0, 17.5, NULL, NULL, ''),
(1996, '9265', 3, '2019-02-27', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1997, '9033', 3, '2019-02-26', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(1998, '9032', 3, '2019-02-26', 40, 10, 4, 1, 4384, 0, 17.5, NULL, NULL, ''),
(1999, '2961', 3, '2019-02-17', 49, 11, 4, 1, 820, 0, 17.5, NULL, NULL, ''),
(2000, '3745', 3, '2019-02-27', 49, 11, 4, 1, 1319, 0, 17.5, NULL, NULL, ''),
(2001, '14658', 3, '2019-03-27', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2002, '14195', 3, '2019-03-25', 37, 10, 4, 1, 288, 0, 17.5, NULL, NULL, ''),
(2003, '13328', 3, '2019-03-20', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2004, '12578', 3, '2019-03-17', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2005, '18212', 3, '2019-04-15', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2006, '27819', 3, '2019-06-19', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2007, '28301', 3, '2019-06-23', 41, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2008, '27308', 3, '2019-06-16', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2009, '27634', 3, '2019-06-18', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2010, '27309', 3, '2019-06-16', 41, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2011, '13064', 3, '2019-03-19', 41, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2012, '24334', 3, '2019-05-23', 53, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2013, '3173', 3, '2019-01-26', 40, 10, 4, 1, 1096, 0, 17.5, NULL, NULL, ''),
(2014, '4026', 3, '2019-01-30', 40, 10, 4, 1, 1943, 0, 17.5, NULL, NULL, ''),
(2015, '4031', 3, '2019-01-30', 54, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2016, '24336', 3, '2019-05-23', 41, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2017, '30565', 3, '2019-07-15', 72, 10, 4, 1, 0, 0, 16.5, NULL, NULL, ''),
(2018, '33571', 3, '2019-08-20', 37, 10, 4, 1, 561, 0, 16.5, NULL, NULL, ''),
(2019, '34270', 3, '2019-08-26', 72, 10, 4, 1, 0, 0, 16.5, NULL, NULL, 'FOB'),
(2020, '34273', 3, '2019-08-26', 70, 10, 4, 1, 4576, 0, 16.5, NULL, NULL, ''),
(2021, '14512', 3, '2019-07-21', 70, 10, 4, 1, 2178, 0, 16.5, NULL, NULL, ''),
(2022, '31439', 3, '2019-07-24', 40, 10, 4, 1, 800, 0, 16.5, NULL, NULL, ''),
(2023, '8664', 3, '2019-04-30', 70, 10, 4, 1, 0, 0, 17.5, NULL, NULL, ''),
(2024, '15999', 3, '2019-08-17', 49, 11, 4, 1, 1370, 0, 16.5, NULL, NULL, ''),
(2025, '34769', 3, '2019-08-29', 37, 10, 4, 1, 438, 0, 16.5, NULL, NULL, ''),
(2026, '34560', 3, '2019-08-28', 41, 10, 4, 1, 0, 0, 16.5, NULL, NULL, 'FOB'),
(2027, '34771', 3, '2019-08-29', 53, 10, 4, 1, 0, 0, 16.5, NULL, NULL, ''),
(2028, '33356', 3, '2019-08-18', 47, 10, 4, 1, 0, 0, 16.5, NULL, NULL, ''),
(2029, '10883', 3, '2019-05-28', 70, 11, 4, 1, 5136, 0, 17.5, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `fileno`
--

DROP TABLE IF EXISTS `fileno`;
CREATE TABLE IF NOT EXISTS `fileno` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `company` int(11) NOT NULL,
  `dat` datetime NOT NULL,
  `committee` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fileno`
--

INSERT INTO `fileno` (`id`, `num`, `company`, `dat`, `committee`) VALUES
(278, '159443', 3, '2019-09-17 00:00:00', 1),
(279, '159444', 3, '2019-09-16 00:00:00', 1),
(280, '159448', 3, '2019-09-16 00:00:00', 1),
(281, '159447', 3, '2019-09-16 00:00:00', 1),
(282, '159449', 3, '2019-09-16 00:00:00', 1),
(283, '159450', 3, '2019-09-16 00:00:00', 1),
(284, '159451', 3, '2019-09-16 00:00:00', 1),
(285, '153529', 3, '2019-09-05 00:00:00', 1),
(286, '153528', 3, '2019-09-05 00:00:00', 1),
(287, '153530', 3, '2019-09-05 00:00:00', 1),
(288, '153531', 3, '2019-09-05 00:00:00', 1),
(289, '153532', 3, '2019-09-05 00:00:00', 1),
(290, '153533', 3, '2019-09-05 00:00:00', 1),
(291, '153534', 3, '2019-09-05 00:00:00', 1),
(292, '153535', 3, '2019-09-05 00:00:00', 1),
(293, '153536', 3, '2019-09-05 00:00:00', 1),
(294, '153537', 3, '2019-09-05 00:00:00', 1),
(295, '153538', 3, '2019-09-05 00:00:00', 1),
(296, '153539', 3, '2019-09-05 00:00:00', 1),
(297, '153540', 3, '2019-09-05 00:00:00', 1),
(298, '153541', 3, '2019-09-05 00:00:00', 1),
(299, '153542', 3, '2019-09-05 00:00:00', 1),
(300, '153543', 3, '2019-09-05 00:00:00', 1),
(301, '153544', 3, '2019-09-05 00:00:00', 1),
(302, '153545', 3, '2019-09-05 00:00:00', 1),
(303, '153546', 3, '2019-09-05 00:00:00', 1),
(304, '153547', 3, '2019-09-05 00:00:00', 1),
(305, '153548', 3, '2019-09-05 00:00:00', 1),
(306, '153549', 3, '2019-09-05 00:00:00', 1),
(307, '153550', 3, '2019-09-05 00:00:00', 1),
(308, '153551', 3, '2019-09-05 00:00:00', 1),
(309, '153552', 3, '2019-09-05 00:00:00', 1),
(310, '153553', 3, '2019-09-05 00:00:00', 1),
(311, '153554', 3, '2019-09-05 00:00:00', 1),
(312, '153555', 3, '2019-09-05 00:00:00', 1),
(313, '153556', 3, '2019-09-05 00:00:00', 1),
(314, '153557', 3, '2019-09-05 00:00:00', 1),
(315, '153558', 3, '2019-09-05 00:00:00', 1),
(316, '153559', 3, '2019-09-05 00:00:00', 1),
(317, '153560', 3, '2019-09-05 00:00:00', 1),
(318, '153561', 3, '2019-09-05 00:00:00', 1),
(319, '159445', 3, '2019-09-16 00:00:00', 1),
(320, '159446', 3, '2019-09-16 00:00:00', 1),
(321, '173834', 3, '2019-10-03 00:00:00', 1),
(322, '173835', 3, '2019-10-03 00:00:00', 1),
(323, '173836', 3, '2019-10-03 00:00:00', 1),
(324, '173837', 3, '2019-10-03 00:00:00', 1),
(325, '173838', 3, '2019-10-03 00:00:00', 1),
(326, '173839', 3, '2019-10-03 00:00:00', 1),
(327, '173840', 3, '2019-10-03 00:00:00', 1),
(328, '173841', 3, '2019-10-03 00:00:00', 1),
(329, '173842', 3, '2019-10-03 00:00:00', 1),
(330, '173843', 3, '2019-10-03 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `filenodata`
--

DROP TABLE IF EXISTS `filenodata`;
CREATE TABLE IF NOT EXISTS `filenodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileNo` int(11) NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filenodata`
--

INSERT INTO `filenodata` (`id`, `fileNo`, `exportCertificate`) VALUES
(1, 278, 1966),
(2, 278, 1969),
(3, 278, 1968);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) NOT NULL,
  `client` int(11) NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  `performa` varchar(100) NOT NULL,
  `systemRef` varchar(100) NOT NULL,
  `bankReciete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `exportCertificate` (`exportCertificate`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `num`, `client`, `exportCertificate`, `performa`, `systemRef`, `bankReciete`) VALUES
(1132, '3664059622', 229, 1963, '3870019385', '2601637995', 0),
(1133, '3664060388', 229, 1964, '3870019810', '2601640137', 0),
(1134, '3664065132', 232, 1966, '3870021332', '2601700257', 0),
(1135, '3664064770', 227, 1967, '3870021172', '2601696127', 0),
(1136, '3664063051', 233, 1968, '3870020560', '2601675156', 0),
(1137, '3664060180', 231, 1969, '', '2601649009', 0),
(1138, '3664060179', 231, 1969, '', '2601649854', 0),
(1139, '3664049711', 232, 1970, '3870016824', '2601536609', 0),
(1140, '3664049576', 232, 1970, '3870016824', '2601531876', 0),
(1141, '3664065127', 231, 1971, '3870021306', '2601701229', 0),
(1142, '3664057223', 229, 1972, '3870018877', '2601599320', 0),
(1143, '3664065128', 226, 1973, '3870021345', '2601701228', 0),
(1144, '3664063457', 232, 1974, '3870020611', '2601677671', 0),
(1145, '3664050715', 234, 1975, '3870017135', '2601552288', 0),
(1146, '3664050918', 234, 1975, '3870017135', '2601552591', 0),
(1147, '3664057449', 232, 1976, '3870018920', '2601618970', 0),
(1148, '3664063259', 230, 1977, '3870020537', '2601677670', 0),
(1149, '3664061919', 233, 1978, '3870020149', '2601664397', 0),
(1150, '3664052725', 230, 1979, '3870017691', '2601568575', 0),
(1151, '3664060241', 231, 1980, '', '2601649010', 0),
(1152, '3664058729', 231, 1981, '3870019223', '2601631512', 0),
(1153, '3664060239', 230, 1982, '3870019438', '2601589581', 0),
(1154, '3664047371', 228, 1983, '3870016453', '2601511220', 0),
(1155, '2601476977', 235, 1984, '3870015935', '4514914615', 0),
(1156, '3664044302', 236, 1985, '3870015593', '2601486823', 0),
(1157, '3664049218', 229, 1986, '3870016781', '2601532778', 0),
(1158, '3664046721', 237, 1987, '1601404551', '2601511430', 0),
(1159, '3664046708', 237, 1988, '1601404552', '2601511439', 0),
(1160, '3664048815', 232, 1989, '3870016687', '2601528887', 0),
(1161, '3664046967', 229, 1990, '3870016287', '2601514289', 0),
(1162, '3664050492', 238, 1991, '3870017033', '2601547991', 0),
(1163, '3664047476', 231, 1993, '3870016435', '2601517006', 0),
(1164, '3664050356', 231, 1992, '3870017026', '2601547209', 0),
(1165, '3664060923', 231, 1994, '3870019868', '2601653019', 0),
(1166, '3664052943', 232, 1995, '3870017737', '2601575646', 0),
(1167, '3664055474', 228, 1996, '3870018874', '2601600725', 0),
(1168, '3664055299', 231, 1997, '3870018344', '2601597878', 0),
(1169, '3664055300', 229, 1998, '3870018434', '2601597872', 0),
(1170, '3664054604', 232, 1999, '3870018016', '2601589582', 0),
(1171, '3664055461', 232, 2000, '3870018309', '2601992211', 0),
(1172, '3664057918', 228, 2001, '3870018993', '2601617230', 0),
(1173, '3664057528', 230, 2002, '3870018919', '2601611445', 0),
(1174, '3664057128', 228, 2003, '3870018809', '2601617229', 0),
(1175, '3664056849', 228, 2004, '3870018699', '2601610131', 0),
(1176, '3664059899', 231, 2005, '', '2601648144', 0),
(1177, '3664063263', 228, 2006, '3870020644', '2601680194', 0),
(1178, '3664063465', 226, 2007, '3870020726', '2601682693', 0),
(1179, '3664063043', 228, 2008, '3870020558', '2601678254', 0),
(1180, '3664063260', 228, 2009, '3870020576', '2601678763', 0),
(1181, '3664063044', 226, 2010, '3870020559', '2601678237', 0),
(1182, '3664057045', 226, 2011, '3870018716', '2601612582', 0),
(1183, '3664061921', 227, 2012, '3870020136', '2601664438', 0),
(1184, '3664053347', 229, 2013, '3870017728', '2601576255', 0),
(1185, '3664053624', 229, 2014, '3870017870', '2601579513', 0),
(1186, '3664053540', 231, 2015, '3870017880', '2601584224', 0),
(1187, '3664061920', 226, 2016, '3870020174', '2601665222', 0),
(1188, '3664064786', 239, 2017, '3870021038', '2601689933', 0),
(1189, '3664066539', 230, 2018, '3870021755', '2601715482', 0),
(1190, '3664067033', 239, 2019, '3870021884', '2601725216', 0),
(1191, '3664067031', 239, 2019, '', '2601726618', 0),
(1192, '3664067052', 233, 2020, '3870021872', '2601722163', 0),
(1193, '3664065129', 233, 2021, '3870021106', '2601692619', 0),
(1194, '3664065348', 229, 2022, '3870021320', '2601701392', 0),
(1195, '3664060556', 233, 2023, '3870019855', '2601650094', 0),
(1196, '3664066409', 232, 2024, '3870021716', '2601623105', 0),
(1197, '3664067401', 230, 2025, '3870022037', '2601715906', 0),
(1198, '3664067242', 226, 2026, '3870021968', '2601724543', 0),
(1199, '3664067327', 227, 2027, '3870021971', '2601728587', 0),
(1200, '3664066410', 240, 2028, '3870021721', '2601715977', 0),
(1201, '3664062006', 233, 2029, '3870020213', '2601665874', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedata`
--

DROP TABLE IF EXISTS `invoicedata`;
CREATE TABLE IF NOT EXISTS `invoicedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `usdVal` double NOT NULL,
  `supportPercentage` double NOT NULL DEFAULT '0.09',
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=3073 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedata`
--

INSERT INTO `invoicedata` (`id`, `invoice`, `brand`, `usdVal`, `supportPercentage`) VALUES
(3002, 1132, 17, 18422.4, 0.07),
(3003, 1133, 17, 13755.18, 0.07),
(3004, 1134, 18, 15500.8, 0.09),
(3005, 1136, 18, 68940, 0.09),
(3006, 1137, 17, 33850, 0.07),
(3007, 1138, 17, 33850, 0.07),
(3008, 1140, 18, 21269.39, 0.09),
(3009, 1139, 18, 9435.7, 0.09),
(3010, 1141, 17, 145900, 0.07),
(3011, 1142, 17, 106374.6, 0.07),
(3012, 1143, 18, 29180, 0.09),
(3013, 1135, 17, 16430, 0.07),
(3014, 1144, 18, 35952.28, 0.09),
(3015, 1145, 17, 140418.08, 0.07),
(3016, 1146, 17, 36160, 0.07),
(3017, 1147, 18, 32127.84, 0.09),
(3018, 1148, 18, 15259.2, 0.09),
(3019, 1149, 18, 34940, 0.09),
(3020, 1150, 18, 16642.8, 0.09),
(3021, 1151, 17, 55300, 0.07),
(3022, 1152, 17, 67700, 0.07),
(3023, 1153, 18, 29951.96, 0.09),
(3024, 1154, 17, 35240, 0.07),
(3025, 1155, 17, 7072, 0.07),
(3026, 1156, 18, 105579.92, 0.09),
(3027, 1157, 17, 54587.64, 0.07),
(3028, 1158, 18, 63800, 0.09),
(3029, 1159, 18, 66300.5, 0.09),
(3030, 1160, 18, 39955.49, 0.09),
(3031, 1161, 17, 69577.77, 0.07),
(3032, 1162, 17, 10959, 0.07),
(3033, 1163, 17, 70480, 0.07),
(3034, 1164, 17, 70480, 0.07),
(3035, 1165, 17, 26626.95, 0.07),
(3036, 1166, 18, 38348.4, 0.09),
(3037, 1167, 17, 34890, 0.07),
(3038, 1168, 17, 34890, 0.07),
(3039, 1169, 17, 139502.15, 0.07),
(3040, 1170, 18, 34781.04, 0.09),
(3041, 1171, 18, 45616.95, 0.09),
(3042, 1172, 17, 69780, 0.07),
(3043, 1173, 18, 15919.2, 0.09),
(3044, 1174, 17, 69780, 0.07),
(3045, 1175, 17, 34890, 0.07),
(3046, 1176, 17, 33850, 0.07),
(3047, 1177, 17, 33850, 0.07),
(3048, 1178, 18, 33850, 0.09),
(3049, 1179, 17, 33850, 0.07),
(3050, 1180, 17, 33850, 0.07),
(3051, 1181, 18, 33850, 0.09),
(3052, 1182, 18, 69780, 0.09),
(3053, 1183, 17, 16728.69, 0.07),
(3054, 1184, 17, 34052.82, 0.07),
(3055, 1185, 17, 49604.25, 0.07),
(3056, 1186, 17, 34890, 0.07),
(3057, 1187, 18, 34210, 0.09),
(3058, 1188, 18, 22100, 0.09),
(3059, 1189, 18, 33281.55, 0.09),
(3060, 1190, 18, 29350, 0.09),
(3061, 1191, 18, 29350, 0.09),
(3062, 1192, 18, 33330, 0.09),
(3063, 1193, 18, 33330, 0.09),
(3064, 1194, 17, 17392.2, 0.07),
(3065, 1195, 18, 103880, 0.09),
(3066, 1196, 18, 45505.6, 0.09),
(3067, 1197, 18, 14652, 0.09),
(3068, 1198, 18, 58360, 0.09),
(3069, 1199, 17, 8017.84, 0.07),
(3070, 1200, 17, 88937.49, 0.07),
(3071, 1201, 18, 68940, 0.09),
(3072, 1149, 17, 34940, 0.07);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mandnsupport`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `mandnsupport`;
CREATE TABLE IF NOT EXISTS `mandnsupport` (
`id` int(11)
,`nolonSupport` double
,`manifestoSupport` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `notsubmitted`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `notsubmitted`;
CREATE TABLE IF NOT EXISTS `notsubmitted` (
`id` int(11)
,`export` varchar(100)
,`dat` date
,`usdToEgp` double
,`shippingCompany` varchar(30)
,`boles` tinyint(1)
,`PORT` varchar(100)
,`exportDate` date
,`manualWork` tinyint(1)
,`receiptDate` date
,`nolon` double
,`manifesto` tinyint(1)
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`CLIENT` varchar(80)
,`country` varchar(50)
,`Cnolon` tinyint(1)
,`Cmanifest` tinyint(1)
,`company` varchar(30)
,`brand` varchar(50)
,`committee` varchar(300)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolonSupport` double
,`manifestoSupport` double
,`bankreciete` varchar(5)
,`notes` varchar(1000)
);

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
CREATE TABLE IF NOT EXISTS `port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`id`, `name`, `notes`) VALUES
(4, 'sosdi', ''),
(5, 'air port', ''),
(6, 'oct', ''),
(10, 'ALX', ''),
(11, 'EL-Dekhila', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `repochequerecieved`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repochequerecieved`;
CREATE TABLE IF NOT EXISTS `repochequerecieved` (
`cheque` varchar(15)
,`chequeDate` date
,`fileNo` varchar(20)
,`bankreceipt` varchar(11)
,`export` varchar(100)
,`exportDate` date
,`Invoice` varchar(100)
,`performa` varchar(100)
,`systemRef` varchar(100)
,`country` varchar(50)
,`company` varchar(30)
,`brand` varchar(50)
,`entity` varchar(30)
,`usdVal` double
,`PTR` double
,`nolon` double
,`manifesto` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repodata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repodata`;
CREATE TABLE IF NOT EXISTS `repodata` (
`export` varchar(100)
,`invoice` varchar(100)
,`bankreceipt` varchar(11)
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repoemptybankreceipt`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repoemptybankreceipt`;
CREATE TABLE IF NOT EXISTS `repoemptybankreceipt` (
`num` varchar(11)
,`usd` double
,`dat` date
,`company` varchar(30)
,`country` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repoerror`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repoerror`;
CREATE TABLE IF NOT EXISTS `repoerror` (
`exportCertificate` varchar(100)
,`company` varchar(30)
,`dat` date
,`Invoice` varchar(100)
,`PORT` varchar(100)
,`shippingCompany` varchar(30)
,`Export (USD)` double
,`PTR` double
,`Nolon Support` double
,`Manifesto Support` varchar(23)
,`bankreciete` varchar(5)
,`notes` varchar(1000)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reposubmission`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reposubmission`;
CREATE TABLE IF NOT EXISTS `reposubmission` (
`submitDate` datetime
,`dat` date
,`PTR` double
,`manifestoSupport` double
,`nolonSupport` double
,`committee` varchar(300)
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repounderpreparing`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repounderpreparing`;
CREATE TABLE IF NOT EXISTS `repounderpreparing` (
`export` varchar(100)
,`PTR` double
,`nolonSupport` double
,`ManifestoSupport` double
,`total` double
,`manualWork` varchar(4)
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repowarning`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `repowarning`;
CREATE TABLE IF NOT EXISTS `repowarning` (
`export` varchar(100)
,`company` varchar(30)
,`dat` date
,`Invoice` varchar(100)
,`PORT` varchar(100)
,`shippingCompany` varchar(30)
,`Export (USD)` double
,`PTR` double
,`Nolon Support` double
,`Manifesto Support` double
,`bankreciete` varchar(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `shippingcompany`
--

DROP TABLE IF EXISTS `shippingcompany`;
CREATE TABLE IF NOT EXISTS `shippingcompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingcompany`
--

INSERT INTO `shippingcompany` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`) VALUES
(4, 'UTI', '', '', '', '', ''),
(5, '3A', '', '', '', '', ''),
(6, 'Cop', '', '', '', '', ''),
(7, 'mesco', '', '', '', '', ''),
(8, 'air port', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `submissiondata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `submissiondata`;
CREATE TABLE IF NOT EXISTS `submissiondata` (
`submitDate` datetime
,`expDate` date
,`PTR` double
,`nolonSupport` double
,`manifestoSupport` double
,`committee` varchar(300)
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(80) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `company` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pass`, `company`, `admin`) VALUES
(1, 'admin', 'admin@admin', '123', 0, 1),
(2, 'Mohamed', 'UMHC@unilever.com', '12345', 4, 0),
(4, 'Hassan', 'UMF@unilever.com', '123456', 6, 0),
(6, 'Sherif', 'MMT@unilever.com', '1234567', 3, 0),
(11, 'Saber', 'UMPC@unilever.com', '1234', 1, 0);

-- --------------------------------------------------------

--
-- Structure for view `alldetailed`
--
DROP TABLE IF EXISTS `alldetailed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `alldetailed`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `dat`,`e`.`usdToEgp` AS `usdToEgp`,`shco`.`name` AS `shippingCompany`,`e`.`boles` AS `boles`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`manualWork` AS `manualWork`,`e`.`receiptDate` AS `receiptDate`,`e`.`manifesto` AS `manifesto`,`e`.`nolon` AS `nolon`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`committee`.`name` AS `committee`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,`mandnsupport`.`nolonSupport` AS `nolonSupport`,`mandnsupport`.`manifestoSupport` AS `manifestoSupport`,`e`.`notes` AS `notes` from (((((((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) left join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) left join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) left join `port` on((`port`.`id` = `e`.`port`))) left join `committee` on((`committee`.`id` = `b`.`committee`))) left join `mandnsupport` on((`mandnsupport`.`id` = `e`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `allrecords`
--
DROP TABLE IF EXISTS `allrecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `allrecords`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `exportDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cr`.`name` AS `country`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.05),0) AS `nolon`,if(`cr`.`manifest`,(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) * 0.5),0) AS `manifesto` from (((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) left join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) order by `e`.`num` ;

-- --------------------------------------------------------

--
-- Structure for view `bookeddata`
--
DROP TABLE IF EXISTS `bookeddata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bookeddata`  AS  select `booked`.`dat` AS `date`,sum(`booked`.`valueEgp`) AS `booked`,`company`.`name` AS `company` from (`booked` join `company` on((`company`.`id` = `booked`.`company`))) group by date_format(`booked`.`dat`,'%M %Y') order by `booked`.`dat` ;

-- --------------------------------------------------------

--
-- Structure for view `chequerecieved`
--
DROP TABLE IF EXISTS `chequerecieved`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `chequerecieved`  AS  select `ch`.`num` AS `cheque`,`ch`.`dat` AS `chequeDate`,`fno`.`num` AS `fileNo`,`br`.`num` AS `bankreceipt`,`e`.`num` AS `export`,`e`.`dat` AS `exportDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cr`.`name` AS `country`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) AS `PTR`,`mn`.`nolonSupport` AS `nolon`,`mn`.`manifestoSupport` AS `manifesto` from ((((((((((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `brand` `b` on((`b`.`id` = `id`.`brand`))) join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) join `client` `cl` on((`cl`.`id` = `i`.`client`))) join `bankreceiptdata` `brdata` on((`brdata`.`exportCertificate` = `e`.`id`))) join `bankreceipt` `br` on((`br`.`id` = `brdata`.`bankReceipt`))) join `filenodata` `fnodata` on((`fnodata`.`exportCertificate` = `e`.`id`))) join `fileno` `fno` on((`fno`.`id` = `fnodata`.`fileNo`))) join `chequedata` `chdata` on((`chdata`.`fileNo` = `fno`.`id`))) join `cheque` `ch` on((`ch`.`id` = `chdata`.`cheque`))) join `mandnsupport` `mn` on((`mn`.`id` = `e`.`id`))) group by `e`.`id`,`nolon` order by `e`.`num` ;

-- --------------------------------------------------------

--
-- Structure for view `estivareport`
--
DROP TABLE IF EXISTS `estivareport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `estivareport`  AS  select `e`.`num` AS `export`,`shco`.`name` AS `shippingCompany`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`manualWork` AS `manualWork`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.5),0) AS `nolon`,if((`cr`.`manifest` and `e`.`manifesto`),(((`e`.`usdToEgp` * `id`.`usdVal`) * `id`.`supportPercentage`) * 0.5),0) AS `manifesto`,`estiva`.`note` AS `note` from ((((((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `brand` `b` on((`b`.`id` = `id`.`brand`))) join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) join `client` `cl` on((`cl`.`id` = `i`.`client`))) join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) join `port` on((`port`.`id` = `e`.`port`))) join `estiva` on((`e`.`id` = `estiva`.`exportCertificate`))) order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `mandnsupport`
--
DROP TABLE IF EXISTS `mandnsupport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `mandnsupport`  AS  select `e`.`id` AS `id`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.5),0) AS `nolonSupport`,sum(if((`cr`.`manifest` and `e`.`manifesto`),(((`e`.`usdToEgp` * `id`.`usdVal`) * `id`.`supportPercentage`) * 0.5),0)) AS `manifestoSupport` from (((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`cr`.`id` = `e`.`country`))) group by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `notsubmitted`
--
DROP TABLE IF EXISTS `notsubmitted`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `notsubmitted`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `dat`,`e`.`usdToEgp` AS `usdToEgp`,`shco`.`name` AS `shippingCompany`,`e`.`boles` AS `boles`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`manualWork` AS `manualWork`,`e`.`receiptDate` AS `receiptDate`,`e`.`nolon` AS `nolon`,`e`.`manifesto` AS `manifesto`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`committee`.`name` AS `committee`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) AS `PTR`,`mn`.`nolonSupport` AS `nolonSupport`,`mn`.`manifestoSupport` AS `manifestoSupport`,if(`e`.`id` in (select `bankreceiptdata`.`exportCertificate` from `bankreceiptdata`),'TRUE','FALSE') AS `bankreciete`,`e`.`notes` AS `notes` from (((((((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) left join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) left join `port` on((`port`.`id` = `e`.`port`))) left join `committee` on((`committee`.`id` = `b`.`committee`))) left join `mandnsupport` `mn` on((`e`.`id` = `mn`.`id`))) where ((not(`e`.`id` in (select `filenodata`.`exportCertificate` from `filenodata`))) and ((if(`cr`.`nolon`,`e`.`nolon`,1) = 0) or (if(`cr`.`manifest`,`e`.`manifesto`,1) = 0) or (`e`.`notes` <> '') or (not(`e`.`id` in (select `bdata2`.`exportCertificate` from `bankreceiptdata` `bdata2`))))) group by `e`.`id`,`b`.`committee` order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `repochequerecieved`
--
DROP TABLE IF EXISTS `repochequerecieved`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repochequerecieved`  AS  select `ch`.`num` AS `cheque`,`ch`.`dat` AS `chequeDate`,`fno`.`num` AS `fileNo`,`br`.`num` AS `bankreceipt`,`e`.`num` AS `export`,`e`.`dat` AS `exportDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cr`.`name` AS `country`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) AS `PTR`,`mn`.`nolonSupport` AS `nolon`,`mn`.`manifestoSupport` AS `manifesto` from ((((((((((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `brand` `b` on((`b`.`id` = `id`.`brand`))) join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) join `client` `cl` on((`cl`.`id` = `i`.`client`))) join `bankreceiptdata` `brdata` on((`brdata`.`exportCertificate` = `e`.`id`))) join `bankreceipt` `br` on((`br`.`id` = `brdata`.`bankReceipt`))) join `filenodata` `fnodata` on((`fnodata`.`exportCertificate` = `e`.`id`))) join `fileno` `fno` on((`fno`.`id` = `fnodata`.`fileNo`))) join `chequedata` `chdata` on((`chdata`.`fileNo` = `fno`.`id`))) join `cheque` `ch` on((`ch`.`id` = `chdata`.`cheque`))) join `mandnsupport` `mn` on((`mn`.`id` = `e`.`id`))) group by `e`.`id` order by `e`.`num` ;

-- --------------------------------------------------------

--
-- Structure for view `repodata`
--
DROP TABLE IF EXISTS `repodata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repodata`  AS  select `e`.`num` AS `export`,`invoice`.`num` AS `invoice`,`bankreceipt`.`num` AS `bankreceipt`,`company`.`name` AS `company` from ((((`exportcertificate` `e` left join `invoice` on((`e`.`id` = `invoice`.`exportCertificate`))) left join `company` on((`e`.`company` = `company`.`id`))) left join `bankreceiptdata` on((`bankreceiptdata`.`exportCertificate` = `e`.`id`))) left join `bankreceipt` on((`bankreceipt`.`id` = `bankreceiptdata`.`bankReceipt`))) ;

-- --------------------------------------------------------

--
-- Structure for view `repoemptybankreceipt`
--
DROP TABLE IF EXISTS `repoemptybankreceipt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repoemptybankreceipt`  AS  select `bankreceipt`.`num` AS `num`,`bankreceipt`.`usd` AS `usd`,`bankreceipt`.`dat` AS `dat`,`company`.`name` AS `company`,`country`.`name` AS `country` from ((`bankreceipt` join `country` on((`country`.`id` = `bankreceipt`.`country`))) left join `company` on((`company`.`id` = `bankreceipt`.`company`))) where (not(`bankreceipt`.`id` in (select `bankreceiptdata`.`bankReceipt` from `bankreceiptdata`))) ;

-- --------------------------------------------------------

--
-- Structure for view `repoerror`
--
DROP TABLE IF EXISTS `repoerror`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repoerror`  AS  select `notsubmitted`.`export` AS `exportCertificate`,`notsubmitted`.`company` AS `company`,`notsubmitted`.`dat` AS `dat`,`notsubmitted`.`Invoice` AS `Invoice`,`notsubmitted`.`PORT` AS `PORT`,`notsubmitted`.`shippingCompany` AS `shippingCompany`,sum(`notsubmitted`.`usdVal`) AS `Export (USD)`,sum(`notsubmitted`.`PTR`) AS `PTR`,`notsubmitted`.`nolonSupport` AS `Nolon Support`,if(`notsubmitted`.`Cmanifest`,if(`notsubmitted`.`manifesto`,`notsubmitted`.`manifestoSupport`,'FALSE'),0) AS `Manifesto Support`,`notsubmitted`.`bankreciete` AS `bankreciete`,`notsubmitted`.`notes` AS `notes` from `notsubmitted` group by `notsubmitted`.`export` order by `notsubmitted`.`export` ;

-- --------------------------------------------------------

--
-- Structure for view `reposubmission`
--
DROP TABLE IF EXISTS `reposubmission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reposubmission`  AS  select `submissiondata`.`submitDate` AS `submitDate`,`submissiondata`.`expDate` AS `dat`,sum(`submissiondata`.`PTR`) AS `PTR`,sum(`submissiondata`.`manifestoSupport`) AS `manifestoSupport`,sum(`submissiondata`.`nolonSupport`) AS `nolonSupport`,`submissiondata`.`committee` AS `committee`,`submissiondata`.`company` AS `company` from `submissiondata` group by date_format(`submissiondata`.`submitDate`,'%M %Y'),date_format(`submissiondata`.`expDate`,'%M %Y'),`submissiondata`.`committee` order by `submissiondata`.`expDate` ;

-- --------------------------------------------------------

--
-- Structure for view `repounderpreparing`
--
DROP TABLE IF EXISTS `repounderpreparing`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repounderpreparing`  AS  select `alldetailed`.`export` AS `export`,`alldetailed`.`PTR` AS `PTR`,`alldetailed`.`nolonSupport` AS `nolonSupport`,`alldetailed`.`manifestoSupport` AS `ManifestoSupport`,((`alldetailed`.`PTR` + `alldetailed`.`nolonSupport`) + `alldetailed`.`manifestoSupport`) AS `total`,`alldetailed`.`manualWork` AS `manualWork`,`alldetailed`.`company` AS `company` from `alldetailed` where ((`alldetailed`.`boles` = 1) and (not(`alldetailed`.`id` in (select `filenodata`.`exportCertificate` from `filenodata`))) and `alldetailed`.`id` in (select `bankreceiptdata`.`exportCertificate` from `bankreceiptdata`)) union select 'Total' AS `Total`,sum(`alldetailed`.`PTR`) AS `sum(PTR)`,sum(`alldetailed`.`nolonSupport`) AS `Sum(nolonSupport)`,sum(`alldetailed`.`manifestoSupport`) AS `sum(ManifestoSupport)`,sum(((`alldetailed`.`PTR` + `alldetailed`.`nolonSupport`) + `alldetailed`.`manifestoSupport`)) AS `sum(PTR+nolonSupport+ManifestoSupport)`,' ' AS `Name_exp_13`,`alldetailed`.`company` AS `company` from `alldetailed` where ((`alldetailed`.`boles` = 1) and (not(`alldetailed`.`id` in (select `filenodata`.`exportCertificate` from `filenodata`))) and `alldetailed`.`id` in (select `bankreceiptdata`.`exportCertificate` from `bankreceiptdata`)) group by `alldetailed`.`company` ;

-- --------------------------------------------------------

--
-- Structure for view `repowarning`
--
DROP TABLE IF EXISTS `repowarning`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repowarning`  AS  select `notsubmitted`.`export` AS `export`,`notsubmitted`.`company` AS `company`,`notsubmitted`.`dat` AS `dat`,`notsubmitted`.`Invoice` AS `Invoice`,`notsubmitted`.`PORT` AS `PORT`,`notsubmitted`.`shippingCompany` AS `shippingCompany`,sum(`notsubmitted`.`usdVal`) AS `Export (USD)`,sum(`notsubmitted`.`PTR`) AS `PTR`,`notsubmitted`.`nolonSupport` AS `Nolon Support`,sum(`notsubmitted`.`manifestoSupport`) AS `Manifesto Support`,`notsubmitted`.`bankreciete` AS `bankreciete` from `notsubmitted` where (cast((now() - interval 9 month) as date) >= `notsubmitted`.`dat`) group by `notsubmitted`.`export` ;

-- --------------------------------------------------------

--
-- Structure for view `submissiondata`
--
DROP TABLE IF EXISTS `submissiondata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `submissiondata`  AS  select `fileno`.`dat` AS `submitDate`,`alldetailed`.`dat` AS `expDate`,sum(`alldetailed`.`PTR`) AS `PTR`,`alldetailed`.`nolonSupport` AS `nolonSupport`,`alldetailed`.`manifestoSupport` AS `manifestoSupport`,`alldetailed`.`committee` AS `committee`,`alldetailed`.`company` AS `company` from ((`alldetailed` join `filenodata` on((`filenodata`.`exportCertificate` = `alldetailed`.`id`))) join `fileno` on((`fileno`.`id` = `filenodata`.`fileNo`))) group by `alldetailed`.`id`,`alldetailed`.`company`,`alldetailed`.`committee` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`exportCertificate`) REFERENCES `exportcertificate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoicedata`
--
ALTER TABLE `invoicedata`
  ADD CONSTRAINT `invoicedata_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
