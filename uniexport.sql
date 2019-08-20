-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 18, 2019 at 10:14 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

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
-- Table structure for table `bankreceipt`
--

DROP TABLE IF EXISTS `bankreceipt`;
CREATE TABLE IF NOT EXISTS `bankreceipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `num` varchar(11) NOT NULL,
  `client` int(11) NOT NULL,
  `usd` double NOT NULL,
  `dat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceipt`
--

INSERT INTO `bankreceipt` (`id`, `company`, `num`, `client`, `usd`, `dat`) VALUES
(2, 1, '5454541', 2, 500000, NULL),
(3, 1, '5671345', 2, 12345666, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bankreceiptdata`
--

DROP TABLE IF EXISTS `bankreceiptdata`;
CREATE TABLE IF NOT EXISTS `bankreceiptdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankReceipt` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceiptdata`
--

INSERT INTO `bankreceiptdata` (`id`, `bankReceipt`, `invoice`) VALUES
(21, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

DROP TABLE IF EXISTS `booked`;
CREATE TABLE IF NOT EXISTS `booked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valueEgp` double NOT NULL,
  `dat` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brandCat` int(11) NOT NULL,
  `supportPercentage` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandCat` (`brandCat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `brandCat`, `supportPercentage`) VALUES
(1, 'safdfsd', 1, 0.5),
(2, 'dsafdsfsd', 2, 0.23),
(3, 'fsdf', 1, 0.15);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brandcat`
--

INSERT INTO `brandcat` (`id`, `name`, `company`) VALUES
(1, 'dffvdvfdf', 0),
(2, '2fdfb', 0);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheque`
--

INSERT INTO `cheque` (`id`, `num`, `company`, `valueEgp`, `dat`) VALUES
(1, '2', 1, 5000, '2019-08-07');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chequedata`
--

INSERT INTO `chequedata` (`id`, `cheque`, `fileNo`) VALUES
(2, 1, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `country` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name`, `email`, `fax`, `phone`, `country`, `address`, `notes`) VALUES
(2, 'sdfsdf', 'fdsfsd', 'dsfda', 'dsfadsf', 3, 'fdasfds', 'sdafsad');

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
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`) VALUES
(1, 'UMPC', 'UMPC@Unilever.com', '123', '123', 'dsasd', 'sdadsd');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `nolon`, `manifest`) VALUES
(1, 'dasd', 0, 0),
(3, 'Egypt', 1, 0),
(4, 'x', 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `export`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `export`;
CREATE TABLE IF NOT EXISTS `export` (
`id` int(11)
,`num` varchar(20)
,`Export date` date
,`submitDate` date
,`Company` varchar(30)
,`Country` varchar(50)
,`Port` varchar(100)
,`ShippingCompany` varchar(30)
,`usdToEgp` double
,`nolon` double
,`manifesto` tinyint(1)
,`boles` tinyint(1)
,`usdVal` double
,`nolon_Man` double
,`PTR` double
);

-- --------------------------------------------------------

--
-- Table structure for table `exportcertificate`
--

DROP TABLE IF EXISTS `exportcertificate`;
CREATE TABLE IF NOT EXISTS `exportcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `company` int(11) NOT NULL,
  `dat` date NOT NULL,
  `country` int(11) NOT NULL,
  `port` int(11) NOT NULL,
  `shippingCompany` int(11) NOT NULL,
  `boles` tinyint(1) NOT NULL DEFAULT '0',
  `nolon` double NOT NULL DEFAULT '0',
  `manifesto` tinyint(1) NOT NULL DEFAULT '0',
  `usdToEgp` double NOT NULL DEFAULT '0',
  `submitDate` date DEFAULT NULL,
  `accrualDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `company` (`company`),
  KEY `country` (`country`),
  KEY `port` (`port`),
  KEY `shippingCompany` (`shippingCompany`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exportcertificate`
--

INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `nolon`, `manifesto`, `usdToEgp`, `submitDate`, `accrualDate`) VALUES
(1, '5465', 1, '2019-08-30', 3, 1, 2, 0, 0, 0, 55, '2019-08-08', '2019-08-08'),
(2, '554', 1, '2019-08-11', 4, 1, 2, 0, 0, 0, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `exptable`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `exptable`;
CREATE TABLE IF NOT EXISTS `exptable` (
`id` int(11)
,`company` int(11)
,`num` varchar(20)
,`dat` date
,`country` int(11)
,`port` int(11)
,`shippingCompany` int(11)
,`boles` tinyint(1)
,`nolon` double
,`manifesto` tinyint(1)
,`usdToEgp` double
,`submitDate` date
,`accrualDate` date
,`PTREgp` double
,`nolon_Man` double
);

-- --------------------------------------------------------

--
-- Table structure for table `fileno`
--

DROP TABLE IF EXISTS `fileno`;
CREATE TABLE IF NOT EXISTS `fileno` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `dat` datetime NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fileno`
--

INSERT INTO `fileno` (`id`, `num`, `dat`, `exportCertificate`) VALUES
(1, '2', '2019-08-13 00:00:00', 2),
(2, '56', '2019-08-15 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `client` int(11) NOT NULL,
  `exportCertificate` varchar(20) NOT NULL,
  `performa` varchar(20) NOT NULL,
  `systemRef` varchar(20) NOT NULL,
  `bankReciete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `exportCertificate` (`exportCertificate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `num`, `client`, `exportCertificate`, `performa`, `systemRef`, `bankReciete`) VALUES
(1, '888', 2, '1', '5488', '88454', 0),
(2, '5464577', 2, '1', '56450', '54654', 0),
(3, '56546', 2, '2', '654654', '54654', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedata`
--

DROP TABLE IF EXISTS `invoicedata`;
CREATE TABLE IF NOT EXISTS `invoicedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(20) NOT NULL,
  `brand` int(11) NOT NULL,
  `usdVal` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedata`
--

INSERT INTO `invoicedata` (`id`, `invoice`, `brand`, `usdVal`) VALUES
(1, '1', 1, 521542),
(2, '3', 2, 55),
(3, '3', 3, 5784),
(4, '2', 1, 2651);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`id`, `name`, `notes`) VALUES
(1, 'asdadsa', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingcompany`
--

INSERT INTO `shippingcompany` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`) VALUES
(2, 'vxvbxcvbsdgfsdfg', 'sdfgsdfg', 'sdgdfg', 'sdfgsdf', 'gdfsgdf', 'gsdfgdf');

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
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pass`, `company`, `admin`, `edit`, `del`) VALUES
(1, 'admin', 'admin@admin', '123', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure for view `export`
--
DROP TABLE IF EXISTS `export`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `export`  AS  select `e`.`id` AS `id`,`e`.`num` AS `num`,`e`.`dat` AS `Export date`,`e`.`submitDate` AS `submitDate`,`com`.`name` AS `Company`,`c`.`name` AS `Country`,`port`.`name` AS `Port`,`s`.`name` AS `ShippingCompany`,`e`.`usdToEgp` AS `usdToEgp`,`e`.`nolon` AS `nolon`,`e`.`manifesto` AS `manifesto`,`e`.`boles` AS `boles`,sum(`idata`.`usdVal`) AS `usdVal`,if(`c`.`nolon`,if((`c`.`manifest` and `e`.`manifesto`),(((`e`.`nolon` * `e`.`usdToEgp`) * 0.5) + (sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) * 0.5)),((`e`.`nolon` * `e`.`usdToEgp`) * 0.5)),if((`c`.`manifest` and `e`.`manifesto`),(sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) * 0.5),0)) AS `nolon_Man`,sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) AS `PTR` from (((((((`exportcertificate` `e` join `country` `c` on((`e`.`country` = `c`.`id`))) join `port` on((`port`.`id` = `e`.`port`))) join `shippingcompany` `s` on((`s`.`id` = `e`.`shippingCompany`))) join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `idata` on((`idata`.`invoice` = `i`.`id`))) join `company` `com` on((`e`.`company` = `com`.`id`))) join `brand` `b` on((`b`.`id` = `idata`.`brand`))) group by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `exptable`
--
DROP TABLE IF EXISTS `exptable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exptable`  AS  select `e`.`id` AS `id`,`e`.`company` AS `company`,`e`.`num` AS `num`,`e`.`dat` AS `dat`,`e`.`country` AS `country`,`e`.`port` AS `port`,`e`.`shippingCompany` AS `shippingCompany`,`e`.`boles` AS `boles`,`e`.`nolon` AS `nolon`,`e`.`manifesto` AS `manifesto`,`e`.`usdToEgp` AS `usdToEgp`,`e`.`submitDate` AS `submitDate`,`e`.`accrualDate` AS `accrualDate`,sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) AS `PTREgp`,if(`c`.`nolon`,if((`c`.`manifest` and `e`.`manifesto`),(((`e`.`nolon` * `e`.`usdToEgp`) * 0.5) + (sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) * 0.5)),((`e`.`nolon` * `e`.`usdToEgp`) * 0.5)),if((`c`.`manifest` and `e`.`manifesto`),(sum(((`idata`.`usdVal` * `e`.`usdToEgp`) * `b`.`supportPercentage`)) * 0.5),0)) AS `nolon_Man` from ((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `idata` on((`idata`.`invoice` = `i`.`id`))) join `brand` `b` on((`idata`.`brand` = `b`.`id`))) join `country` `c` on((`e`.`country` = `c`.`id`))) group by `e`.`id` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
