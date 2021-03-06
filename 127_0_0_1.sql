-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2019 at 06:16 AM
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
-- Database: `database`
--
CREATE DATABASE IF NOT EXISTS `database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `database`;

-- --------------------------------------------------------

--
-- Table structure for table `table_name`
--

DROP TABLE IF EXISTS `table_name`;
CREATE TABLE IF NOT EXISTS `table_name` (
  `ad` varchar(100) DEFAULT NULL,
  `yusu` varchar(100) DEFAULT NULL,
  `adh` varchar(50) DEFAULT NULL,
  `refe` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_name`
--

INSERT INTO `table_name` (`ad`, `yusu`, `adh`, `refe`) VALUES
('', '123456789', 'rfsdf', '4Kpq4jN'),
('', '123456789', 'trestewte', 'nMLst4w'),
('', '123456789', 'teretre', 'XjLp7MU'),
('', '123456789', 'gfdsgfdgds', 'ChSZvFK'),
('', 'mohjsdhhfdj', '132456', 'IOkZrDM');
--
-- Database: `dm`
--
CREATE DATABASE IF NOT EXISTS `dm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dm`;

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Code` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `code` (`Code`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`Id`, `Name`, `Code`) VALUES
(1, 'المستقبل', 1),
(2, 'العبور', 2),
(3, 'الشروق', 4);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(6) NOT NULL,
  `StoId` int(6) NOT NULL,
  `Price` double NOT NULL,
  `Rating` tinyint(4) NOT NULL,
  `CatId` int(6) NOT NULL,
  `TyId` int(6) NOT NULL,
  PRIMARY KEY (`Id`,`StoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemsdata`
--

DROP TABLE IF EXISTS `itemsdata`;
CREATE TABLE IF NOT EXISTS `itemsdata` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Img` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offerdetails`
--

DROP TABLE IF EXISTS `offerdetails`;
CREATE TABLE IF NOT EXISTS `offerdetails` (
  `OffId` int(6) NOT NULL,
  `StoId` int(6) NOT NULL,
  `ItId` int(6) NOT NULL,
  PRIMARY KEY (`OffId`,`StoId`,`ItId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offersheader`
--

DROP TABLE IF EXISTS `offersheader`;
CREATE TABLE IF NOT EXISTS `offersheader` (
  `OffId` int(6) NOT NULL AUTO_INCREMENT,
  `Price` double NOT NULL,
  `Exp` date NOT NULL,
  `Img` varchar(100) NOT NULL,
  PRIMARY KEY (`OffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrId` int(11) NOT NULL,
  `ItId` int(6) NOT NULL,
  `OfId` int(6) DEFAULT NULL,
  `Quantaty` int(2) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderheader`
--

DROP TABLE IF EXISTS `orderheader`;
CREATE TABLE IF NOT EXISTS `orderheader` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UId` int(6) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CityId` int(2) NOT NULL,
  `StreetName` varchar(100) DEFAULT NULL,
  `BuildingNo` int(4) NOT NULL,
  `FloarNo` int(2) NOT NULL,
  `Appno` int(2) NOT NULL,
  `SpMark` varchar(100) NOT NULL,
  `Note` varchar(500) NOT NULL,
  `LocationH` double NOT NULL,
  `LocationY` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rstca`
--

DROP TABLE IF EXISTS `rstca`;
CREATE TABLE IF NOT EXISTS `rstca` (
  `StoId` int(11) NOT NULL,
  `CatId` int(11) NOT NULL,
  PRIMARY KEY (`StoId`,`CatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stophones`
--

DROP TABLE IF EXISTS `stophones`;
CREATE TABLE IF NOT EXISTS `stophones` (
  `Id` int(11) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  PRIMARY KEY (`Id`,`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `StoId` int(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Location` text NOT NULL,
  `Img` varchar(100) NOT NULL,
  `DelAv` tinyint(4) NOT NULL,
  `LocationH` double DEFAULT NULL,
  `LocationV` double DEFAULT NULL,
  PRIMARY KEY (`StoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UId` int(10) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Type` tinyint(1) NOT NULL DEFAULT '1',
  `Rating` tinyint(4) NOT NULL DEFAULT '5',
  `City` tinyint(4) NOT NULL,
  `Latitude` double DEFAULT NULL,
  `Longtude` double DEFAULT NULL,
  `Altitude` double DEFAULT NULL,
  PRIMARY KEY (`UId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UId`, `Name`, `Email`, `Pass`, `Type`, `Rating`, `City`, `Latitude`, `Longtude`, `Altitude`) VALUES
(1, 'admin', 'admin@admin', 'admin', 1, 5, 7, 1.26219549, 326.5662964, 0),
(2, 'user', 'user@dm.com', '1234', 1, 5, 1, 1.23, 1.234, 0),
(3, 'name', 'mail', 'pass', 1, 5, 1, NULL, NULL, NULL),
(4, 'name', 'mail', 'pass', 1, 5, 1, NULL, NULL, NULL),
(5, 'name', 'mail', 'pass', 1, 5, 1, NULL, NULL, NULL),
(6, 'mohamma', 'mail', 'pass', 1, 5, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usrphones`
--

DROP TABLE IF EXISTS `usrphones`;
CREATE TABLE IF NOT EXISTS `usrphones` (
  `UId` int(11) NOT NULL,
  `PhoneNo` varchar(11) NOT NULL,
  PRIMARY KEY (`UId`,`PhoneNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Database: `easyaccess`
--
CREATE DATABASE IF NOT EXISTS `easyaccess` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `easyaccess`;

-- --------------------------------------------------------

--
-- Table structure for table `barcode`
--

DROP TABLE IF EXISTS `barcode`;
CREATE TABLE IF NOT EXISTS `barcode` (
  `barcode` varchar(128) NOT NULL,
  `itemId` int(11) NOT NULL,
  `unitId` int(11) NOT NULL,
  `factor` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barcode`
--

INSERT INTO `barcode` (`barcode`, `itemId`, `unitId`, `factor`) VALUES
('554', 1, 2, 2),
('5555', 1, 1, 1),
('fgdfgdf', 6, 0, 1),
('ggg', 4, 1, 1),
('ghgfhgf', 5, 0, 1),
('rhtrh', 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `country` int(11) NOT NULL,
  `gov` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(13) NOT NULL,
  `fax` varchar(13) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `website` varchar(150) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `port` int(11) NOT NULL,
  `rule` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `govId` smallint(5) NOT NULL,
  `name` varchar(60) NOT NULL,
  `nameEn` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(1, 'بدون');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`) VALUES
(1, 'غير مهم'),
(2, 'بيبسى'),
(3, 'شيبسى');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `nameEn` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currenciesconv`
--

DROP TABLE IF EXISTS `currenciesconv`;
CREATE TABLE IF NOT EXISTS `currenciesconv` (
  `fromid` int(11) NOT NULL,
  `toId` int(11) NOT NULL,
  `factor` double NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(80) NOT NULL,
  `country` int(11) NOT NULL,
  `gov` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `govs`
--

DROP TABLE IF EXISTS `govs`;
CREATE TABLE IF NOT EXISTS `govs` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `countryId` smallint(5) NOT NULL,
  `name` varchar(60) NOT NULL,
  `nameEn` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemgroups`
--

DROP TABLE IF EXISTS `itemgroups`;
CREATE TABLE IF NOT EXISTS `itemgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemgroups`
--

INSERT INTO `itemgroups` (`id`, `name`, `parentId`) VALUES
(1, 'بقالة', NULL),
(2, 'منتجات البان', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short` varchar(150) DEFAULT NULL,
  `isMix` tinyint(1) NOT NULL,
  `itemType` int(11) DEFAULT NULL,
  `canceled` tinyint(1) NOT NULL,
  `metric` tinyint(1) NOT NULL,
  `img` varchar(150) DEFAULT NULL,
  `limitOrder` int(11) DEFAULT NULL,
  `expiringPeriod` tinyint(1) DEFAULT NULL,
  `mainUnitId` int(11) NOT NULL,
  `serial` tinyint(1) DEFAULT NULL,
  `size` tinyint(1) DEFAULT NULL,
  `Guarantee` tinyint(1) DEFAULT NULL,
  `color` tinyint(1) DEFAULT NULL,
  `notes` text,
  `companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `groupId`, `name`, `short`, `isMix`, `itemType`, `canceled`, `metric`, `img`, `limitOrder`, `expiringPeriod`, `mainUnitId`, `serial`, `size`, `Guarantee`, `color`, `notes`, `companyId`) VALUES
(1, 1, 'شسيبسى', NULL, 0, NULL, 0, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemscolors`
--

DROP TABLE IF EXISTS `itemscolors`;
CREATE TABLE IF NOT EXISTS `itemscolors` (
  `itemId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`,`colorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemssizes`
--

DROP TABLE IF EXISTS `itemssizes`;
CREATE TABLE IF NOT EXISTS `itemssizes` (
  `itemId` int(11) NOT NULL,
  `sizeId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`,`sizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
CREATE TABLE IF NOT EXISTS `itemtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemtype`
--

INSERT INTO `itemtype` (`id`, `name`) VALUES
(1, 'جديد');

-- --------------------------------------------------------

--
-- Table structure for table `mix`
--

DROP TABLE IF EXISTS `mix`;
CREATE TABLE IF NOT EXISTS `mix` (
  `productId` int(11) NOT NULL,
  `khamId` int(11) NOT NULL,
  `percentage` double NOT NULL,
  `unit` int(11) NOT NULL,
  `halk` double NOT NULL,
  `serial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`productId`,`khamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pricecats`
--

DROP TABLE IF EXISTS `pricecats`;
CREATE TABLE IF NOT EXISTS `pricecats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pricecats`
--

INSERT INTO `pricecats` (`id`, `name`) VALUES
(1, 'مستهلك');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `priceCatId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `price` double NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`priceCatId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`priceCatId`, `itemId`, `price`, `date`) VALUES
(1, 1, 5, '2019-04-18 03:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

DROP TABLE IF EXISTS `safes`;
CREATE TABLE IF NOT EXISTS `safes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchId` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `initialBalance` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

DROP TABLE IF EXISTS `shelf`;
CREATE TABLE IF NOT EXISTS `shelf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `simpleitems`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `simpleitems`;
CREATE TABLE IF NOT EXISTS `simpleitems` (
`id` int(11)
,`barcode` varchar(128)
,`name` varchar(250)
,`price` double
,`unit` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
(1, 'صغير');

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
CREATE TABLE IF NOT EXISTS `storage` (
  `storeId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `shelfId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`storeId`,`itemId`,`shelfId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supporter_company`
--

DROP TABLE IF EXISTS `supporter_company`;
CREATE TABLE IF NOT EXISTS `supporter_company` (
  `supporter_id` int(11) NOT NULL,
  `Company_id` int(11) NOT NULL,
  PRIMARY KEY (`supporter_id`,`Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `traders`
--

DROP TABLE IF EXISTS `traders`;
CREATE TABLE IF NOT EXISTS `traders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `balance` double DEFAULT '0',
  `balanceDate` date DEFAULT NULL,
  `creditLimit` double DEFAULT '0',
  `country` smallint(5) DEFAULT NULL,
  `gov` smallint(5) DEFAULT NULL,
  `city` smallint(5) DEFAULT NULL,
  `adress` mediumtext,
  `type` smallint(5) DEFAULT NULL,
  `rate` smallint(6) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `traderstypes`
--

DROP TABLE IF EXISTS `traderstypes`;
CREATE TABLE IF NOT EXISTS `traderstypes` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactiondata`
--

DROP TABLE IF EXISTS `transactiondata`;
CREATE TABLE IF NOT EXISTS `transactiondata` (
  `id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `barcode` varchar(128) NOT NULL,
  `trader` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `waredId` int(11) DEFAULT NULL,
  PRIMARY KEY (`barcode`,`storeId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `traderId` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `empId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `okDate` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `notes` varchar(800) NOT NULL,
  PRIMARY KEY (`id`,`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'قطعة'),
(2, 'كرتونه'),
(3, 'متر'),
(5, 'كيلو جرام');

-- --------------------------------------------------------

--
-- Structure for view `simpleitems`
--
DROP TABLE IF EXISTS `simpleitems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `simpleitems`  AS  select `items`.`id` AS `id`,`barcode`.`barcode` AS `barcode`,`items`.`name` AS `name`,`prices`.`price` AS `price`,`units`.`name` AS `unit` from (((`items` join `barcode` on((`items`.`id` = `barcode`.`itemId`))) join `prices` on((`items`.`id` = `prices`.`itemId`))) join `units` on((`units`.`id` = `barcode`.`unitId`))) where (`items`.`mainUnitId` = `barcode`.`unitId`) ;
--
-- Database: `exportmemo`
--
CREATE DATABASE IF NOT EXISTS `exportmemo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `exportmemo`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brandcats`
--

DROP TABLE IF EXISTS `brandcats`;
CREATE TABLE IF NOT EXISTS `brandcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `catId` int(11) NOT NULL,
  `supportPercentage` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `country` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `notes` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameEn` varchar(50) NOT NULL,
  `nameAr` varchar(50) NOT NULL,
  `nolon` tinyint(1) NOT NULL DEFAULT '0',
  `manifest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameEn` (`nameEn`),
  UNIQUE KEY `nameAr` (`nameAr`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `nameEn`, `nameAr`, `nolon`, `manifest`) VALUES
(1, 'Egypt', ' مصر', 1, 1),
(2, 'usa', 'أمريكا', 0, 1),
(11, 'Saudi', 'السعودية', 0, 0),
(15, 'Syria', 'سوريا', 1, 1),
(25, 'dsfdf', 'uvfn', 1, 0),
(27, 'dsfdfrwdfsf', 'uvfnwerfsd', 1, 0),
(28, 'dsfdfrwdfsffsddf', 'uvfnwerfsddsf', 0, 0),
(29, 'dsfdfrwdfsffsddfsdfdf', 'uvfnwerfsddsffsdf', 0, 0),
(32, 'dasdas', 'dqeweeaadasdsdas', 0, 0),
(33, 'eqwe', 'eqwewq', 0, 0),
(35, 'dfsfsf', 'dasdafsdfsds', 0, 0),
(36, 'dfsfd', 'fsddfsdf', 0, 0),
(37, 'fdsfdsfds', 'fsdfdfsd', 0, 0),
(38, 'fsdfsdf', 'fsdfdsdf', 0, 0),
(39, 'fsdfsdfsdfsdf', 'fsfsdfsdf', 0, 0),
(40, 'fsdfsdfsaffasdfsdfsda', 'fsddfsfdf', 0, 0),
(42, 'fsafdsfjghjfgjfg', 'fsddfafsfghfghfgdfasdfsfdf', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE IF NOT EXISTS `ports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shippingcompanies`
--

DROP TABLE IF EXISTS `shippingcompanies`;
CREATE TABLE IF NOT EXISTS `shippingcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `notes` varchar(300) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingcompanies`
--

INSERT INTO `shippingcompanies` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`, `rating`) VALUES
(1, 'abc', 'email', '123', '321', 'dsdd', 'sdsd', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `prev` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `Email`, `password`, `prev`) VALUES
(1, 'admin', 'admin@admin', '123', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`brandCat`) REFERENCES `brandcats` (`id`);
--
-- Database: `fipcomgr`
--
CREATE DATABASE IF NOT EXISTS `fipcomgr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fipcomgr`;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branchName`) VALUES
(1, 'نظم المعلومات'),
(2, 'الشؤون المالية والتجارية'),
(3, 'الإدارة'),
(4, 'القطاع الهندسى'),
(5, 'التسويق'),
(6, 'الأمن'),
(7, 'المخازن'),
(8, 'مصنع الخضار'),
(9, 'مصنع الأعلاف'),
(10, 'الأمن الصناعى و الإطفاء'),
(11, 'الخزينة'),
(12, 'قسم الإستحقاقات'),
(13, 'الشؤون القانونية'),
(14, 'التخطيط و المتابعة'),
(15, 'محطة الوقود'),
(19, 'النقطة الطبية'),
(21, 'مصنع السلع'),
(22, 'شؤون فنية المركبات'),
(23, 'البيطرى'),
(24, 'شؤون عاملين المدنيين'),
(25, 'خارج المجمع'),
(26, 'قطاع المصانع'),
(27, 'الحمله'),
(28, 'مصنع الوجبات');

-- --------------------------------------------------------

--
-- Table structure for table `dep`
--

DROP TABLE IF EXISTS `dep`;
CREATE TABLE IF NOT EXISTS `dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dep`
--

INSERT INTO `dep` (`id`, `name`) VALUES
(1, 'ش مالية'),
(2, 'تعيينات'),
(3, 'مدفعية'),
(4, 'مركبات'),
(5, 'مهندسين'),
(6, 'أ . ذ'),
(7, 'خ بيطرية'),
(8, 'إشارة'),
(9, 'مدرعات'),
(10, 'مهمات'),
(11, 'الوقود'),
(12, 'قضاء عسكرى'),
(13, 'حرب كيميائية'),
(14, 'حرب إلكترونية'),
(15, 'خدمات طبية'),
(16, 'إشارة'),
(17, 'none');

-- --------------------------------------------------------

--
-- Stand-in structure for view `q`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `q`;
CREATE TABLE IF NOT EXISTS `q` (
`id` int(11)
,`title` varchar(100)
,`name` varchar(300)
,`job` varchar(200)
,`text` text
,`dateTime` datetime
,`status` tinyint(4)
,`notes` text
,`waitingTime` time
,`acTime` time
);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchId` int(11) NOT NULL,
  `mCode` varchar(6) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `reason` int(11) NOT NULL,
  `notes` text,
  `dateTime` datetime NOT NULL,
  `confirmTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_visitors` (`branchId`,`mCode`),
  KEY `queue_reasons` (`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `branchId`, `mCode`, `status`, `reason`, `notes`, `dateTime`, `confirmTime`) VALUES
(22, 1, '1/1', 1, 1, '', '2019-04-06 13:16:24', '2019-04-06 14:00:43'),
(23, 3, '2/1', 1, 1, '', '2019-04-06 14:00:04', '2019-04-06 14:00:46'),
(24, 3, '2/1', 0, 1, '', '2019-04-06 14:03:51', '2019-04-06 14:04:10'),
(25, 3, '3/1', 0, 1, '', '2019-04-06 14:04:06', '2019-04-06 14:04:10'),
(27, 1, '2/1', 0, 1, '', '2019-04-08 09:53:25', '2019-04-11 20:31:24'),
(28, 6, '1/1', 0, 1, '', '2019-04-08 09:53:43', '2019-04-11 20:31:24'),
(29, 8, '2/1', 0, 1, '', '2019-04-08 09:54:10', '2019-04-11 20:31:24'),
(30, 9, '1/1', 0, 7, '', '2019-04-11 20:34:22', '2019-04-11 20:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
CREATE TABLE IF NOT EXISTS `reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `text`) VALUES
(1, 'عرض تقرير'),
(2, 'تصديق طلب'),
(3, ' عرضتقرير'),
(4, 'أعمال'),
(5, 'بيبي '),
(6, 'dfg fgd'),
(7, 'fddsv fdvsfdgsf');

-- --------------------------------------------------------

--
-- Stand-in structure for view `review`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
`branchName` varchar(100)
,`mCode` varchar(6)
,`title` varchar(100)
,`name` varchar(300)
,`job` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `title`) VALUES
(1, 'ملازم'),
(2, 'ملازم أ'),
(3, 'نقيب'),
(4, 'رائد'),
(5, 'مقدم'),
(6, 'عقيد'),
(7, 'عميد'),
(8, 'لواء'),
(9, 'لواء م'),
(10, 'رقيب'),
(11, 'رقيب أ'),
(12, 'مساعد'),
(13, ' مساعد أ'),
(14, 'عميد م'),
(15, 'عقيد م'),
(16, 'مدنى'),
(17, 'مقدم ط.ب'),
(18, 'نقيب فنى'),
(19, 'ملازم أ ط'),
(20, 'مهندس/ة'),
(21, 'أستاذ/ة');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`, `fullName`) VALUES
(1, 'test', 'test', 'Mohammad AlBerry');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
  `branchId` int(11) NOT NULL,
  `mCode` varchar(6) NOT NULL,
  `titleId` int(11) NOT NULL,
  `dep` int(11) DEFAULT NULL,
  `job` varchar(200) NOT NULL,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`branchId`,`mCode`),
  KEY `visitors_titles` (`titleId`),
  KEY `visitor_dep` (`dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`branchId`, `mCode`, `titleId`, `dep`, `job`, `name`) VALUES
(1, '1/1', 5, 6, 'رئيس فرع نظم المعلومات', 'محمد أحمد عبد المنعم محمد'),
(1, '2/1', 3, 6, 'رئيس فرع شؤون الضباط / رئيس فرع التخطيط و المتابعة / رئيس قسم تشغيل الحواسب / قائد منظومة المنافذ و التدبير المركزى', 'عبد المنعم أحمد عزت على'),
(2, '1/1', 6, 1, 'رئيس فرع الشؤون المالية و التجارية', 'أحمد عبد العزيز أحمد عبد العزيز'),
(2, '2/1', 21, 17, 'الفرع المالى', 'محمد صديق عبد الفتاح'),
(2, '3/1', 21, 17, 'الفرع المالى', 'محمد ابراهيم عطيه الكاشف'),
(2, '4/1', 21, 17, 'الفرع المالى', 'السيد عزوز'),
(2, '5/1', 21, 17, 'الفرع المالى', 'هشام عبد المنعم فرغلى'),
(2, '6/1', 21, 17, 'الفرع المالى', 'شادية عبد المحسن سليم'),
(2, '7/1', 21, 17, 'الفرع المالى / مراقبة العهدة', 'محمد مصطفى عبد الجليل'),
(2, '8/1', 21, 17, 'الفرع المالى / مندوب', 'عمرو عبد المحسن عثمان'),
(2, '9/1', 21, 17, 'الفرع المالى', 'هبه عبد الله محمد'),
(2, '9/2', 21, 17, 'الفرع المالى', 'تامر سالم ذكى'),
(2, '9/3', 21, NULL, 'الفرع المالي', 'رضا محمد التهامي'),
(2, '9/4', 21, NULL, 'الفرع المالي/ تسويق', 'احمد عبد العليم محمد '),
(2, '9/5', 21, NULL, 'الفرع المالي', 'السيد عزوز'),
(2, '9/6', 21, NULL, 'الفرع المالي', 'ابراهيم رجب ابراهيم'),
(2, '9/7', 21, NULL, 'الفرع المالي', 'احمد حسن شداد'),
(2, '9/8', 21, NULL, 'الفرع المالي', 'محمد ابراهيم عطيه الكاشف'),
(2, '9/9', 21, NULL, 'الفرع المالي', 'محمد صديق عبد الفتاح'),
(2, '9/9/1', 21, NULL, 'اخصائي تخطيط/الفرع المالي', 'هبه عاطف محمد'),
(3, '2/1', 7, 17, 'نائب مدير عام المجمع', 'طارق السيد عبد السلام'),
(3, '3/1', 5, 2, 'مساعد المدير لمصنع الخضار', 'محمد بهاء الدين محمد'),
(4, '1/1', 5, 5, 'رئيس القطاع الهندسى', 'محمود ابراهيم محمود السيد'),
(4, '2/1', 4, 9, 'رئيس شؤون فنية المجمع / القطاع الهندسى', 'ياسر عبد العزيز قطب مهينه'),
(4, '3/1', 20, 17, 'القطاع الهندسى', 'هشام أحمد فضالى'),
(4, '4/1', 21, NULL, 'القطاع الهندسي', 'احمد سمير توفيق'),
(5, '1/1', 5, 1, 'رئيس فرع التسويق', 'محمد أحمد عبد الوهاب'),
(5, '2/1', 3, 13, 'فرع التسويق', 'محمد ساهر محمود يوسف'),
(5, '3/1', 2, 11, 'فرع التسويق', 'رومانى نبيل ابراهيم توفيق'),
(5, '4/1', 21, 17, 'قطاع التسويق', 'أحمد كمال سلامة'),
(5, '5/1', 21, 17, 'قطاع التسويق', 'أشرف أحمد  فؤاد'),
(5, '6/1', 21, NULL, 'تسويق / مشرف مبيعات', 'عماد حمدى حامد'),
(5, '7/1', 21, NULL, 'تسويق/ منسقة', 'سعدية محمد عبد الباسط'),
(5, '8/1', 21, NULL, 'تسويق/ مندوب مبيعات', 'السيد ربيع مصطفي'),
(5, '9/1', 21, NULL, 'تسويق/مندوب مبيعات', 'كريم بيومي سعد'),
(5, '9/2', 21, NULL, 'مشرف تسويق', 'احمد محمد زكي'),
(6, '1/1', 4, 16, 'رئيس قسم الأمن', 'أحمد يوسف محمد البربرى'),
(7, '1/1', 5, 3, 'رئيس مجموعة المخازن / ضباط التدريب / محو الأمية', ' إسلام أحمد عبد السميع'),
(7, '2/1', 21, 17, 'قطاع المخازن', 'محمد حسين خفاجة'),
(8, '1/1', 5, 4, 'قائد مصنع الخضار', 'محمود على يوسف'),
(8, '2/1', 18, 6, 'رئيس شؤون فنية مصنع الخضار / ضابط الرماية', 'حسن جمعة محمد فهيم'),
(8, '3/1', 3, 13, 'ضابط الجودة بمصنع الخضار', 'يحيى ابراهيم يحيى أحمد'),
(8, '4/1', 20, 17, 'مصنع الخضار', 'مروة جودة محمد'),
(8, '5/1', 20, 17, 'مصنع الخضار', 'أسماء فتحى عبد اللطيف'),
(8, '6/1', 20, 17, 'مصنع الخضار', 'عادل عبد العزيز محمد'),
(8, '7/1', 21, NULL, 'مصنع الخضار', 'أشرف حسين عبد الخالق'),
(8, '8/1', 21, NULL, 'مصنع الخضار', 'هند ابو طالب شوري'),
(8, '9/1', 21, NULL, 'مصنع الخضار', 'شيماء شمندي محمود'),
(8, '9/2', 21, NULL, 'مصنع الخضار', 'حسن ابو الخير محمد'),
(8, '9/3', 21, NULL, 'مصنع الخضار', 'طارق عبد العليم علي'),
(8, '9/4', 21, NULL, 'مشرف جوده /مصنع الخضار', 'محمد السيد حسنين حسن'),
(9, '1/1', 17, 7, 'قائد مصنع الأعلاف', 'أحمد محمد الحسينى'),
(9, '2/1', 3, 9, 'رئيس شؤون فنية مصنع العلف / ضابط الذخيرة', 'عبد الرازق محمد كمال الدين'),
(9, '3/1', 20, 17, 'إنتاج مصنع الأعلاف', 'مصطفى جلال حسن'),
(9, '4/1', 21, NULL, 'مصنع العلف', 'احمد صلاح درويش'),
(9, '5/1', 21, NULL, 'حسابات /مصنع العلف', 'محمود نبيل محمد'),
(10, '1/1', 4, 10, 'رئيس فرع الأمن الصناعى و الإطفاء / رئيس شؤون إدارية المجمع', 'أحمد سيد محمد محمد'),
(11, '1/1', 4, 1, 'رئيس قسم الخزينة', 'منجد السيد أحمد على'),
(12, '1/1', 4, 1, 'رئيس قسم الإستحقاقات / ضابط الخدمة الإجتماعية', 'هشام محمد حسن حسن'),
(13, '1/1', 4, 12, 'رئيس فرع الشؤن القانونية', 'أحمد محمد محمد فتوح'),
(13, '2/1', 21, NULL, 'شؤون قانونية', 'محمد احمد سيد'),
(14, '1/1', 3, 6, 'رئيس فرع شؤون الضباط / رئيس فرع التخطيط و المتابعة / رئيس قسم تشغيل الحواسب / قائد منظومة المنافذ و التدبير المركزى', 'عبد المنعم أحمد عزت على'),
(15, '1/1', 3, 14, 'قائد محطة الوقود / ضابط التربية الرياضية / ضابط الرماية البديل', 'أحمد نصر الدين السيد'),
(15, '2/1', 21, NULL, 'مغسله/محطه الوقود', 'ايمن حامد سليمان'),
(15, '3/1', 21, NULL, 'محطه الوقود', 'عزيز قناوي'),
(19, '1/1', 19, 15, 'قائد النقطة الطبية', 'أحمد محمد ابراهيم محمد'),
(21, '1/1', 6, 2, 'قائد مصنع السلع', 'حازم زكى أحمد أحمد طه'),
(21, '2/1', 3, 6, 'رئيس شؤون فنية مصنع السلع / ضابط السلاح', 'سعيد محمد محمد شرف'),
(21, '3/1', 2, 2, 'مصنع السلع', 'محمد كرم محمد قطب'),
(21, '4/1', 20, 17, 'مصنع السلع / مضرب الأرز', 'مجدى راضى محجوب'),
(21, '5/1', 20, 17, 'مهندسة إنتاج / مصنع السلع', 'رشا زين العابدين'),
(21, '6/1', 21, 17, 'مشرف جوده / مصنع السلع', 'صالح محمد متولى'),
(21, '7/1', 21, 17, 'مصنع السلع', 'يسرى محمد عواد'),
(21, '8/1', 21, 17, 'مشرف إنتاج / مصنع السلع', 'السيد إبراهيم سليمان'),
(21, '9/1', 21, 17, 'مشرفة إنتاج / مصنع السلع', ' ليلى موسى أبو الفتوح'),
(21, '9/2', 21, 17, 'مصنع السلع', 'صلاح شوقى محمود'),
(21, '9/3', 21, 17, 'فنى ميكانيكى / مصنع السلع', 'أحمد عبد القادر على'),
(21, '9/4', 21, NULL, 'جوده / مصنع السلع', 'أحمد السيد السباعى'),
(21, '9/5', 21, NULL, 'فني معدات/مصنع السلع', 'توفيق سمير توفيق'),
(21, '9/6', 21, NULL, 'فني معدات / مصنع السلع', 'هشام عبد اللطيف سيد'),
(21, '9/7', 20, NULL, 'مهندسة انتاج /مصنع السلع', 'رشا زين العابدين'),
(21, '9/8', 20, NULL, 'مشرفة انتاج /مصنع السلع', 'فاتن احمد عبد الفتاح'),
(21, '9/9', 21, NULL, 'فني معدات /مصنع السلع', 'وائل علي لطفي'),
(21, '9/9/1', 21, NULL, 'فني معدات/مصنع السلع', 'محمد زكريا عز الدين'),
(21, '9/9/2', 21, NULL, 'مصنع السلع', 'رابعة مهني السيد'),
(21, '9/9/3', 21, NULL, 'حسابات مصنع السلع', 'صباح عبد العزيز مصطفي'),
(21, '9/9/4', 21, NULL, 'مشرف تعبئه /مصنع السلع', 'حسن محمد حسن'),
(21, '9/9/5', 21, NULL, 'مشرف تعبئه /مصنع السلع', 'رضا عمر عمر'),
(22, '1/1', 4, 4, 'رئيس شؤون فنية المركبات / بديل ضابط السلاح', 'مصطفى أنور مصطفى كمال'),
(23, '1/1', 2, 7, 'قائد الفرع البيطرى', 'محمد رفاعى محمد'),
(24, '1/1', 21, 17, 'رئيس شؤون عاملين المدنيين', 'محمد عثمان الحديدى'),
(24, '2/1', 21, 17, 'شؤون عاملين المدنيين', 'أبو الفتوح عبد الفضيل عبد الرحمن'),
(24, '3/1', 21, 17, 'شؤون عاملين المدنيين', 'إصلاح سيد محمود'),
(24, '4/1', 21, 17, 'شؤون عاملين المدنيين', 'سامية أبو اليزيد عطية'),
(26, '2/1', 20, 17, 'رئيس قطاع المصانع بالإنابة', 'حمدى أحمد نبوى'),
(26, '3/1', 21, 17, 'قطاع المصانع', 'نادية عواد توفيق'),
(26, '4/1', 21, 17, 'قطاع المصانع', 'سامية حسن حمام'),
(26, '5/1', 20, NULL, 'قطاع المصانع', 'هيثم محمد رشاد'),
(27, '1/1', 21, NULL, 'الحمله', 'جميل محمود محمود'),
(27, '2/1', 21, NULL, '', 'يحي عبد السلام'),
(28, '1/1', 21, NULL, 'مصنع الوجبات', 'وفاء محمد عبد القادر');

-- --------------------------------------------------------

--
-- Structure for view `q`
--
DROP TABLE IF EXISTS `q`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q`  AS  select `queue`.`id` AS `id`,`titles`.`title` AS `title`,`visitors`.`name` AS `name`,`visitors`.`job` AS `job`,`reasons`.`text` AS `text`,`queue`.`dateTime` AS `dateTime`,`queue`.`status` AS `status`,`queue`.`notes` AS `notes`,timediff(`queue`.`confirmTime`,`queue`.`dateTime`) AS `waitingTime`,timediff(now(),`queue`.`dateTime`) AS `acTime` from (((`queue` join `visitors` on(((`queue`.`mCode` = `visitors`.`mCode`) and (`queue`.`branchId` = `visitors`.`branchId`)))) join `titles` on((`visitors`.`titleId` = `titles`.`id`))) join `reasons` on((`queue`.`reason` = `reasons`.`id`))) where (isnull(`queue`.`status`) or isnull(`queue`.`confirmTime`) or (timediff(now(),`queue`.`confirmTime`) < '00:01:00')) order by `queue`.`dateTime` ;

-- --------------------------------------------------------

--
-- Structure for view `review`
--
DROP TABLE IF EXISTS `review`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `review`  AS  select `branches`.`branchName` AS `branchName`,`visitors`.`mCode` AS `mCode`,`titles`.`title` AS `title`,`visitors`.`name` AS `name`,`visitors`.`job` AS `job` from ((`visitors` join `branches` on((`branches`.`id` = `visitors`.`branchId`))) join `titles` on((`titles`.`id` = `visitors`.`titleId`))) order by `branches`.`id`,`visitors`.`mCode` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_reasons` FOREIGN KEY (`reason`) REFERENCES `reasons` (`id`),
  ADD CONSTRAINT `queue_visitors` FOREIGN KEY (`branchId`,`mCode`) REFERENCES `visitors` (`branchId`, `mCode`) ON UPDATE CASCADE;

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitor_dep` FOREIGN KEY (`dep`) REFERENCES `dep` (`id`),
  ADD CONSTRAINT `visitors_branches` FOREIGN KEY (`branchId`) REFERENCES `branches` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `visitors_titles` FOREIGN KEY (`titleId`) REFERENCES `titles` (`id`) ON UPDATE CASCADE;
--
-- Database: `sahl1`
--
CREATE DATABASE IF NOT EXISTS `sahl1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sahl1`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `balance_in` decimal(13,3) DEFAULT '0.000',
  `balance_out` decimal(13,3) DEFAULT '0.000',
  `kind` varchar(10) DEFAULT NULL COMMENT 'customer - supplier - salesman - other',
  `category` varchar(100) DEFAULT '',
  `phone` varchar(200) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `address` varchar(500) DEFAULT '',
  `address2` varchar(500) DEFAULT '',
  `tax_id` varchar(200) DEFAULT '',
  `more` varchar(500) DEFAULT '',
  `reminder_date` date DEFAULT NULL,
  `sales_price_list` tinyint(4) DEFAULT '0',
  `sales_discount_per` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `code` (`code`),
  KEY `category` (`category`),
  KEY `reminder_date` (`reminder_date`),
  KEY `phone` (`phone`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `title`, `code`, `balance_in`, `balance_out`, `kind`, `category`, `phone`, `email`, `address`, `address2`, `tax_id`, `more`, `reminder_date`, `sales_price_list`, `sales_discount_per`) VALUES
(1, 'الخزنة', '1', '0.000', '0.000', 'other', '', '', '', '', '', '', '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `title`) VALUES
(1, 'درج النقدية');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

DROP TABLE IF EXISTS `installments`;
CREATE TABLE IF NOT EXISTS `installments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `time1` time DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `total` decimal(13,3) DEFAULT NULL,
  `paid` decimal(13,3) DEFAULT '0.000',
  `unpaid` decimal(13,3) DEFAULT '0.000',
  `parts` int(11) DEFAULT '0',
  `part_amount` decimal(13,3) DEFAULT '0.000',
  `last_part_amount` decimal(13,3) DEFAULT '0.000',
  `dead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `date1` (`date1`),
  KEY `dead` (`dead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `installments_parts`
--

DROP TABLE IF EXISTS `installments_parts`;
CREATE TABLE IF NOT EXISTS `installments_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `installment_id` int(11) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `total` decimal(13,3) DEFAULT '0.000',
  `paid` decimal(13,3) DEFAULT '0.000',
  `unpaid` decimal(13,3) DEFAULT '0.000',
  `more` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_id` (`installment_id`),
  KEY `date1` (`date1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) DEFAULT NULL COMMENT 'OPEN, SALE, RETURNSALE, SALEQUOTE, PURCHASE, RETURNPUR, INVENT, TRANSFER, ADJUST',
  `id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `time1` time DEFAULT NULL,
  `cash` tinyint(1) DEFAULT '1',
  `account_id` int(11) DEFAULT NULL,
  `qty` decimal(16,6) DEFAULT '0.000000',
  `total` decimal(16,6) DEFAULT '0.000000',
  `total_inc_tax` decimal(16,6) DEFAULT '0.000000',
  `total_cost` decimal(16,6) DEFAULT '0.000000',
  `total_price` decimal(16,6) DEFAULT '0.000000',
  `discount1` decimal(16,6) DEFAULT '0.000000',
  `total_inc_discount1` decimal(16,6) DEFAULT '0.000000',
  `addition1_type` varchar(200) DEFAULT '',
  `addition1_per` decimal(6,3) DEFAULT '0.000',
  `addition1` decimal(16,6) DEFAULT '0.000000',
  `addition2_per` decimal(6,3) DEFAULT '0.000',
  `addition2` decimal(16,6) DEFAULT '0.000000',
  `addition3_per` decimal(6,3) DEFAULT '0.000',
  `addition3` decimal(16,6) DEFAULT '0.000000',
  `additions` decimal(16,6) DEFAULT '0.000000',
  `discount2_per` decimal(6,3) DEFAULT '0.000',
  `discount2` decimal(16,6) DEFAULT '0.000000',
  `discounts` decimal(16,6) DEFAULT '0.000000',
  `net_cost` decimal(16,6) DEFAULT '0.000000',
  `net_price` decimal(16,6) DEFAULT '0.000000',
  `net_total` decimal(16,6) DEFAULT '0.000000',
  `expenses` decimal(16,6) DEFAULT '0.000000',
  `expenses_type` varchar(200) DEFAULT '',
  `real_net_cost` decimal(16,6) DEFAULT '0.000000',
  `profit` decimal(16,6) DEFAULT '0.000000',
  `cost_errors` decimal(16,6) DEFAULT '0.000000',
  `tax1_per` decimal(6,3) DEFAULT '0.000',
  `tax1` decimal(16,6) DEFAULT '0.000000',
  `tax2_per` decimal(6,3) DEFAULT '0.000',
  `tax2` decimal(16,6) DEFAULT '0.000000',
  `grand_total` decimal(16,6) DEFAULT '0.000000',
  `store_to_id` int(11) DEFAULT NULL,
  `salesman_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `reference` varchar(30) DEFAULT '',
  `more` varchar(500) DEFAULT '',
  `reserved` tinyint(1) DEFAULT '0' COMMENT 'with SALEQUOTE',
  `status` varchar(50) DEFAULT '',
  `shippedby` varchar(50) DEFAULT '',
  `custom1` varchar(200) DEFAULT '',
  `custom2` varchar(200) DEFAULT '',
  `custom3` varchar(200) DEFAULT '',
  `custom4` varchar(200) DEFAULT '',
  `custom5` varchar(200) DEFAULT '',
  `createdby` int(11) DEFAULT NULL,
  `editedby` int(11) DEFAULT NULL,
  `cash_received` decimal(13,3) DEFAULT '0.000',
  `cash_change` decimal(13,3) DEFAULT '0.000',
  PRIMARY KEY (`pk`),
  KEY `kind` (`kind`),
  KEY `kind_id` (`kind`,`id`),
  KEY `date1` (`date1`),
  KEY `cash` (`cash`),
  KEY `account_id` (`account_id`),
  KEY `store_id` (`store_id`),
  KEY `salesman_id` (`salesman_id`),
  KEY `bank_id` (`bank_id`),
  KEY `date1_time1` (`date1`,`time1`),
  KEY `custom1` (`custom1`),
  KEY `custom2` (`custom2`),
  KEY `custom3` (`custom3`),
  KEY `custom4` (`custom4`),
  KEY `custom5` (`custom5`),
  KEY `expenses_type` (`expenses_type`),
  KEY `shippedby` (`shippedby`),
  KEY `status_kind` (`status`,`kind`),
  KEY `reference_kind` (`reference`,`kind`),
  KEY `createdby_kind` (`createdby`,`kind`),
  KEY `editedby_kind` (`editedby`,`kind`),
  KEY `addition1_type` (`addition1_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`pk`, `kind`, `id`, `store_id`, `date1`, `time1`, `cash`, `account_id`, `qty`, `total`, `total_inc_tax`, `total_cost`, `total_price`, `discount1`, `total_inc_discount1`, `addition1_type`, `addition1_per`, `addition1`, `addition2_per`, `addition2`, `addition3_per`, `addition3`, `additions`, `discount2_per`, `discount2`, `discounts`, `net_cost`, `net_price`, `net_total`, `expenses`, `expenses_type`, `real_net_cost`, `profit`, `cost_errors`, `tax1_per`, `tax1`, `tax2_per`, `tax2`, `grand_total`, `store_to_id`, `salesman_id`, `bank_id`, `reference`, `more`, `reserved`, `status`, `shippedby`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `createdby`, `editedby`, `cash_received`, `cash_change`) VALUES
(1, 'OPEN', 0, NULL, '2015-01-01', '00:00:00', 1, NULL, '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '', '0.000', '0.000000', '0.000', '0.000000', '0.000', '0.000000', '0.000000', '0.000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '', '0.000000', '0.000000', '0.000000', '0.000', '0.000000', '0.000', '0.000000', '0.000000', NULL, NULL, NULL, '', '', 0, '', '', '', '', '', '', '', NULL, NULL, '0.000', '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `invoices_items`
--

DROP TABLE IF EXISTS `invoices_items`;
CREATE TABLE IF NOT EXISTS `invoices_items` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` decimal(16,6) DEFAULT '0.000000',
  `amount` decimal(16,6) DEFAULT '0.000000',
  `total` decimal(16,6) DEFAULT '0.000000',
  `amount_inc_tax` decimal(16,6) DEFAULT '0.000000',
  `total_inc_tax` decimal(16,6) DEFAULT '0.000000',
  `unit` varchar(20) DEFAULT '',
  `unit_pieces` decimal(11,6) DEFAULT '1.000000',
  `unit_qty_in` decimal(16,6) DEFAULT '0.000000',
  `unit_qty_out` decimal(16,6) DEFAULT '0.000000',
  `unit_cost` decimal(16,6) DEFAULT '0.000000',
  `unit_price` decimal(16,6) DEFAULT '0.000000',
  `total_cost` decimal(16,6) DEFAULT '0.000000',
  `total_price` decimal(16,6) DEFAULT '0.000000',
  `discount1_per` decimal(6,3) DEFAULT '0.000',
  `discount1` decimal(16,6) DEFAULT '0.000000',
  `total_inc_discount1` decimal(16,6) DEFAULT '0.000000',
  `additions` decimal(16,6) DEFAULT '0.000000',
  `discount2` decimal(16,6) DEFAULT '0.000000',
  `discounts` decimal(16,6) DEFAULT '0.000000',
  `net_cost` decimal(16,6) DEFAULT '0.000000',
  `net_price` decimal(16,6) DEFAULT '0.000000',
  `net_total` decimal(16,6) DEFAULT '0.000000',
  `qty_in` decimal(16,6) DEFAULT '0.000000',
  `qty_out` decimal(16,6) DEFAULT '0.000000',
  `cost` decimal(16,6) DEFAULT '0.000000',
  `price` decimal(16,6) DEFAULT '0.000000',
  `expenses` decimal(16,6) DEFAULT '0.000000',
  `real_net_cost` decimal(16,6) DEFAULT '0.000000',
  `real_cost` decimal(16,6) DEFAULT '0.000000',
  `profit` decimal(16,6) DEFAULT '0.000000',
  `cost_errors` decimal(16,6) DEFAULT '0.000000',
  `tax1_per` decimal(6,3) DEFAULT '0.000',
  `tax1` decimal(16,6) DEFAULT '0.000000',
  `tax2_per` decimal(6,3) DEFAULT '0.000',
  `tax2` decimal(16,6) DEFAULT '0.000000',
  `grand_total` decimal(16,6) DEFAULT '0.000000',
  `custom1` varchar(200) DEFAULT '',
  `custom2` varchar(200) DEFAULT '',
  `custom3` varchar(200) DEFAULT '',
  `serials` varchar(1000) DEFAULT '',
  `cargo` varchar(20) DEFAULT '',
  PRIMARY KEY (`pk`),
  KEY `kind` (`kind`),
  KEY `item_id` (`item_id`),
  KEY `store_id` (`store_id`),
  KEY `kind_id` (`kind`,`id`),
  KEY `store_id_item_id` (`store_id`,`item_id`),
  KEY `custom1` (`custom1`),
  KEY `custom2` (`custom2`),
  KEY `custom3` (`custom3`),
  KEY `kind_id_store_id` (`kind`,`id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT '',
  `code1` varchar(300) DEFAULT '',
  `code2` varchar(300) DEFAULT '',
  `barcode` varchar(2000) DEFAULT '',
  `price1` decimal(13,3) DEFAULT '0.000',
  `price2` decimal(13,3) DEFAULT '0.000',
  `price3` decimal(13,3) DEFAULT '0.000',
  `price_min` decimal(13,3) DEFAULT '0.000',
  `category1` varchar(200) DEFAULT '',
  `category2` varchar(200) DEFAULT '',
  `category3` varchar(200) DEFAULT '',
  `category4` varchar(200) DEFAULT '',
  `category5` varchar(200) DEFAULT '',
  `category6` varchar(200) DEFAULT '',
  `unit` varchar(50) DEFAULT '',
  `service` tinyint(1) DEFAULT '0',
  `avg_cost` decimal(16,6) DEFAULT '0.000000',
  `last_cost` decimal(16,6) DEFAULT '0.000000',
  `last_purchased` date DEFAULT NULL,
  `qty` decimal(16,6) DEFAULT '0.000000',
  `reorder_qty` decimal(16,6) DEFAULT '0.000000',
  `starred` tinyint(1) DEFAULT '0',
  `discount_per1` decimal(8,3) DEFAULT '0.000',
  `tax_type` char(1) DEFAULT 'Y',
  `price_include_tax1` tinyint(1) DEFAULT '0',
  `dead` tinyint(1) DEFAULT '0',
  `photo` varchar(20) DEFAULT '',
  `more` text,
  PRIMARY KEY (`id`),
  KEY `code1` (`code1`(255)),
  KEY `title` (`title`(255)),
  KEY `code2` (`code2`(255)),
  KEY `starred` (`starred`),
  KEY `barcode` (`barcode`(255)),
  KEY `dead` (`dead`),
  KEY `category2` (`category2`),
  KEY `category3` (`category3`),
  KEY `category4` (`category4`),
  KEY `reorder_qty` (`reorder_qty`),
  KEY `qty` (`qty`),
  KEY `unit` (`unit`),
  KEY `category1` (`category1`),
  KEY `category5` (`category5`),
  KEY `category6` (`category6`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `code1`, `code2`, `barcode`, `price1`, `price2`, `price3`, `price_min`, `category1`, `category2`, `category3`, `category4`, `category5`, `category6`, `unit`, `service`, `avg_cost`, `last_cost`, `last_purchased`, `qty`, `reorder_qty`, `starred`, `discount_per1`, `tax_type`, `price_include_tax1`, `dead`, `photo`, `more`) VALUES
(1, 'اتاتاتا', '', '', '', '0.000', '0.000', '0.000', '0.000', '', '', '', '', '', '', 'قطعة', 0, '0.000000', '0.000000', NULL, '0.000000', '0.000000', 0, '0.000', 'Y', 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_units`
--

DROP TABLE IF EXISTS `items_units`;
CREATE TABLE IF NOT EXISTS `items_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT '',
  `pieces` decimal(11,6) DEFAULT '1.000000',
  `price` decimal(13,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `money`
--

DROP TABLE IF EXISTS `money`;
CREATE TABLE IF NOT EXISTS `money` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) DEFAULT NULL COMMENT 'OPEN, PAYMENT, RECEIPT',
  `id` int(11) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `time1` time DEFAULT NULL,
  `amount` decimal(13,3) DEFAULT '0.000',
  `tax1_per` decimal(6,3) DEFAULT '0.000',
  `tax1` decimal(13,3) DEFAULT '0.000',
  `amount_inc_tax` decimal(13,3) DEFAULT '0.000',
  `money_in` decimal(13,3) DEFAULT '0.000',
  `money_out` decimal(13,3) DEFAULT '0.000',
  `account_id` int(11) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `more` varchar(500) DEFAULT '',
  `transfer_id` int(11) DEFAULT NULL,
  `reference` varchar(30) DEFAULT '',
  `createdby` int(11) DEFAULT NULL,
  `editedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `kind` (`kind`),
  KEY `date1` (`date1`),
  KEY `account_id` (`account_id`),
  KEY `item` (`item`),
  KEY `bank_id` (`bank_id`),
  KEY `kind_id` (`kind`,`id`),
  KEY `date1_time1` (`date1`,`time1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `version` int(11) DEFAULT '0',
  `company` varchar(200) DEFAULT '',
  `backup_pass` varchar(50) DEFAULT '',
  `super_pass` varchar(50) DEFAULT '',
  `contact_details` varchar(500) DEFAULT '',
  `contact_details2` varchar(500) DEFAULT '',
  `contact_details3` varchar(500) DEFAULT '',
  `price1_title` varchar(50) DEFAULT '',
  `price2_title` varchar(50) DEFAULT '',
  `price3_title` varchar(50) DEFAULT '',
  `force_last_account_sales_price` tinyint(1) DEFAULT '0',
  `category2title` varchar(50) DEFAULT '',
  `category3title` varchar(50) DEFAULT '',
  `category4title` varchar(50) DEFAULT '',
  `category5title` varchar(50) DEFAULT '',
  `category6title` varchar(50) DEFAULT '',
  `invoice_custom1` varchar(50) DEFAULT '',
  `invoice_custom2` varchar(50) DEFAULT '',
  `invoice_custom3` varchar(50) DEFAULT '',
  `invoice_custom4` varchar(50) DEFAULT '',
  `invoice_custom5` varchar(50) DEFAULT '',
  `invoice_addition2` varchar(50) DEFAULT '',
  `invoice_addition3` varchar(50) DEFAULT '',
  `invoice_items_custom1` varchar(50) DEFAULT '',
  `invoice_items_custom2` varchar(50) DEFAULT '',
  `invoice_items_custom3` varchar(50) DEFAULT '',
  `sales_print_copies` int(11) DEFAULT '1',
  `order_status` varchar(1000) DEFAULT '',
  `order_shippedby` varchar(1000) DEFAULT '',
  `currency_title` varchar(50) DEFAULT '',
  `currency_units` int(11) DEFAULT '100',
  `currency_unit_title` varchar(50) DEFAULT '',
  `wbarcode_enabled` tinyint(1) DEFAULT '0',
  `wbarcode_size` int(11) DEFAULT '13',
  `wbarcode_prefix` varchar(10) DEFAULT '00',
  `wbarcode_code_size` int(11) DEFAULT '5',
  `wbarcode_value_size` int(11) DEFAULT '5',
  `tax_id` varchar(200) DEFAULT '',
  `tax1_title` varchar(100) DEFAULT '',
  `tax1_per` decimal(5,2) DEFAULT '0.00',
  `tax1_auto_sale` tinyint(1) DEFAULT '0',
  `tax1_auto_purchase` tinyint(1) DEFAULT '0',
  `tax2_title` varchar(100) DEFAULT '',
  `tax2_per` decimal(5,2) DEFAULT '0.00',
  `tax2_auto_sale` tinyint(1) DEFAULT '0',
  `tax2_auto_purchase` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`version`, `company`, `backup_pass`, `super_pass`, `contact_details`, `contact_details2`, `contact_details3`, `price1_title`, `price2_title`, `price3_title`, `force_last_account_sales_price`, `category2title`, `category3title`, `category4title`, `category5title`, `category6title`, `invoice_custom1`, `invoice_custom2`, `invoice_custom3`, `invoice_custom4`, `invoice_custom5`, `invoice_addition2`, `invoice_addition3`, `invoice_items_custom1`, `invoice_items_custom2`, `invoice_items_custom3`, `sales_print_copies`, `order_status`, `order_shippedby`, `currency_title`, `currency_units`, `currency_unit_title`, `wbarcode_enabled`, `wbarcode_size`, `wbarcode_prefix`, `wbarcode_code_size`, `wbarcode_value_size`, `tax_id`, `tax1_title`, `tax1_per`, `tax1_auto_sale`, `tax1_auto_purchase`, `tax2_title`, `tax2_per`, `tax2_auto_sale`, `tax2_auto_purchase`) VALUES
(23, 'اسم المشروع', '', '', '', '', '', 'سعر البيع', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '', '', 100, '', 0, 13, '00', 5, 5, '', '', '0.00', 0, 0, '', '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `title`) VALUES
(1, 'المخزن الرئيسي');

-- --------------------------------------------------------

--
-- Table structure for table `stores_items`
--

DROP TABLE IF EXISTS `stores_items`;
CREATE TABLE IF NOT EXISTS `stores_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` decimal(16,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `item_id` (`item_id`),
  KEY `store_item` (`store_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `stores` varchar(200) DEFAULT '',
  `banks` varchar(200) DEFAULT '',
  `options` tinyint(1) DEFAULT '1',
  `see_cost` tinyint(1) DEFAULT '1',
  `edit_ids` tinyint(1) DEFAULT '1',
  `edit_date` tinyint(1) DEFAULT '1',
  `today_only_update` tinyint(1) DEFAULT '0',
  `today_only_list` tinyint(1) DEFAULT '0',
  `remove_bank` tinyint(1) DEFAULT '0',
  `change_qty_minus_zero` tinyint(1) DEFAULT '0',
  `backup_create` tinyint(1) DEFAULT '1',
  `backup_restore` tinyint(1) DEFAULT '1',
  `item_list` tinyint(1) DEFAULT '1',
  `item_add` tinyint(1) DEFAULT '1',
  `item_edit` tinyint(1) DEFAULT '1',
  `item_del` tinyint(1) DEFAULT '1',
  `item_statement` tinyint(1) DEFAULT '1',
  `item_evaluation` tinyint(1) DEFAULT '1',
  `item_in_out` tinyint(1) DEFAULT '1',
  `item_barcode` tinyint(1) DEFAULT '1',
  `item_cargo` tinyint(1) DEFAULT '1',
  `account_list` tinyint(1) DEFAULT '1',
  `account_add` tinyint(1) DEFAULT '1',
  `account_edit` tinyint(1) DEFAULT '1',
  `account_del` tinyint(1) DEFAULT '1',
  `account_customer` tinyint(1) DEFAULT '1',
  `account_supplier` tinyint(1) DEFAULT '1',
  `account_salesman` tinyint(1) DEFAULT '1',
  `account_other` tinyint(1) DEFAULT '1',
  `account_balance` tinyint(1) DEFAULT '1',
  `account_statement` tinyint(1) DEFAULT '1',
  `purchase_list` tinyint(1) DEFAULT '1',
  `purchase_add` tinyint(1) DEFAULT '1',
  `purchase_edit` tinyint(1) DEFAULT '1',
  `purchase_del` tinyint(1) DEFAULT '1',
  `purchase_return` tinyint(1) DEFAULT '1',
  `sale_list` tinyint(1) DEFAULT '1',
  `sale_add` tinyint(1) DEFAULT '1',
  `sale_edit` tinyint(1) DEFAULT '1',
  `sale_del` tinyint(1) DEFAULT '1',
  `sale_modify_prices` tinyint(1) DEFAULT '1',
  `sale_price_below_min_price` tinyint(1) DEFAULT '1',
  `sale_price_below_cost` tinyint(1) DEFAULT '1',
  `sale_discount` tinyint(1) DEFAULT '1',
  `sale_see_profit` tinyint(1) DEFAULT '1',
  `sale_see_invoice_profit` tinyint(1) DEFAULT '1',
  `sale_return` tinyint(1) DEFAULT '1',
  `delivery` tinyint(1) DEFAULT '1',
  `salequote_list` tinyint(1) DEFAULT '1',
  `salequote_add` tinyint(1) DEFAULT '1',
  `salequote_edit` tinyint(1) DEFAULT '1',
  `salequote_del` tinyint(1) DEFAULT '1',
  `invent_list` tinyint(1) DEFAULT '1',
  `invent_add` tinyint(1) DEFAULT '1',
  `invent_edit` tinyint(1) DEFAULT '1',
  `invent_del` tinyint(1) DEFAULT '1',
  `adjust_list` tinyint(1) DEFAULT '1',
  `adjust_add` tinyint(1) DEFAULT '1',
  `adjust_edit` tinyint(1) DEFAULT '1',
  `adjust_del` tinyint(1) DEFAULT '1',
  `transfer_list` tinyint(1) DEFAULT '1',
  `transfer_add` tinyint(1) DEFAULT '1',
  `transfer_edit` tinyint(1) DEFAULT '1',
  `transfer_del` tinyint(1) DEFAULT '1',
  `payment_list` tinyint(1) DEFAULT '1',
  `payment_add` tinyint(1) DEFAULT '1',
  `payment_edit` tinyint(1) DEFAULT '1',
  `payment_del` tinyint(1) DEFAULT '1',
  `receipt_list` tinyint(1) DEFAULT '1',
  `receipt_add` tinyint(1) DEFAULT '1',
  `receipt_edit` tinyint(1) DEFAULT '1',
  `receipt_del` tinyint(1) DEFAULT '1',
  `money_transfer_add` tinyint(1) DEFAULT '1',
  `money_transfer_edit` tinyint(1) DEFAULT '1',
  `money_transfer_del` tinyint(1) DEFAULT '1',
  `installment_list` tinyint(1) DEFAULT '1',
  `installment_add` tinyint(1) DEFAULT '1',
  `installment_edit` tinyint(1) DEFAULT '1',
  `installment_del` tinyint(1) DEFAULT '1',
  `installment_due_parts` tinyint(1) DEFAULT '1',
  `installment_receipt` tinyint(1) DEFAULT '1',
  `money_list` tinyint(1) DEFAULT '1',
  `payment_analysis` tinyint(1) DEFAULT '1',
  `receipt_analysis` tinyint(1) DEFAULT '1',
  `reports` tinyint(1) DEFAULT '1',
  `report_daily` tinyint(1) DEFAULT '1',
  `report_sales_analysis` tinyint(1) DEFAULT '1',
  `report_purchases_analysis` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `title`, `pass`, `stores`, `banks`, `options`, `see_cost`, `edit_ids`, `edit_date`, `today_only_update`, `today_only_list`, `remove_bank`, `change_qty_minus_zero`, `backup_create`, `backup_restore`, `item_list`, `item_add`, `item_edit`, `item_del`, `item_statement`, `item_evaluation`, `item_in_out`, `item_barcode`, `item_cargo`, `account_list`, `account_add`, `account_edit`, `account_del`, `account_customer`, `account_supplier`, `account_salesman`, `account_other`, `account_balance`, `account_statement`, `purchase_list`, `purchase_add`, `purchase_edit`, `purchase_del`, `purchase_return`, `sale_list`, `sale_add`, `sale_edit`, `sale_del`, `sale_modify_prices`, `sale_price_below_min_price`, `sale_price_below_cost`, `sale_discount`, `sale_see_profit`, `sale_see_invoice_profit`, `sale_return`, `delivery`, `salequote_list`, `salequote_add`, `salequote_edit`, `salequote_del`, `invent_list`, `invent_add`, `invent_edit`, `invent_del`, `adjust_list`, `adjust_add`, `adjust_edit`, `adjust_del`, `transfer_list`, `transfer_add`, `transfer_edit`, `transfer_del`, `payment_list`, `payment_add`, `payment_edit`, `payment_del`, `receipt_list`, `receipt_add`, `receipt_edit`, `receipt_del`, `money_transfer_add`, `money_transfer_edit`, `money_transfer_del`, `installment_list`, `installment_add`, `installment_edit`, `installment_del`, `installment_due_parts`, `installment_receipt`, `money_list`, `payment_analysis`, `receipt_analysis`, `reports`, `report_daily`, `report_sales_analysis`, `report_purchases_analysis`) VALUES
(1, '_مدير النظام', '', '', '', 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'كاشير 1', '', '1', '2', 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);
--
-- Database: `sales`
--
CREATE DATABASE IF NOT EXISTS `sales` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sales`;
--
-- Database: `uniexport`
--
CREATE DATABASE IF NOT EXISTS `uniexport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `uniexport`;

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
,`submitDate` date
,`accrualDate` date
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceipt`
--

INSERT INTO `bankreceipt` (`id`, `company`, `num`, `country`, `usd`, `dat`) VALUES
(1, 1, '5454', 34, 6565, '2019-09-12'),
(2, 3, '545554', 36, 62286, '2019-09-17'),
(3, 3, '54654', 36, 4565, '2019-10-14');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankreceiptdata`
--

INSERT INTO `bankreceiptdata` (`id`, `bankReceipt`, `exportCertificate`) VALUES
(1, 2, 1964),
(2, 2, 1963),
(3, 2, 1961);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `valueEgp`, `dat`) VALUES
(1, 51425445654, '2019-09-10');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `brandCat`, `supportPercentage`) VALUES
(6, 'Dov', 6, 0.12),
(7, 'Clear Shampoo', 9, 0.12),
(8, 'signal', 8, 0.11),
(10, 'fair& loely cream', 5, 0.1),
(12, 'Lux Shower Gel', 6, 0.1),
(13, 'Close Up', 8, 0.11),
(14, 'camy', 6, 0.1),
(15, 'forest', 8, 0.09),
(16, 'مواد تحضير صناعي', 6, 0.12),
(17, 'few', 5, 0.05),
(18, 'trwetrcamy', 6, 0.1),
(19, 'dasdfs', 12, 0.9),
(20, 'sagfsdf', 11, 0.89),
(21, 'gsdfgsdfg', 13, 0.26);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brandcat`
--

INSERT INTO `brandcat` (`id`, `name`, `company`) VALUES
(5, 'mass skin', 1),
(6, 'Personal Wash Category', 1),
(7, 'Fabric Conditioner Ctegory', 1),
(8, 'Oral Category', 1),
(9, 'Hair Category', 1),
(10, 'Hair ةرةرةرةرةبنتب', 1),
(11, 'fdssfsdfsd', 3),
(12, 'adfsadfds', 3),
(13, 'fsdadfsa', 3);

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
(1, 'nkdndnjk', 3, 77777777, '2019-09-10');

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
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `company`, `name`, `email`, `fax`, `phone`, `country`, `address`, `notes`) VALUES
(182, 1, 'panzani', 'jhgkhg@fsdf.com', '545464645', '32656', 39, '', ''),
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
(225, 0, 'نبتبتتبتبتArab Distribution Co. Ltd', '', '', '', 54, '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `phone`, `fax`, `address`, `logo`, `notes`) VALUES
(1, 'UMPC', 'UMPC@Unilever.com', '123', '123', 'dsasd', NULL, 'sdadsd'),
(3, 'Unilever Mashreq Tea', 'MMT@Unilever.com', '123', '123', 'dsasd', NULL, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `nolon`, `manifest`) VALUES
(34, 'sudan', 0, 1),
(35, 'madagacar', 1, 0),
(36, 'Tunisia', 1, 0),
(37, 'Morocco', 1, 0),
(38, 'kuwait', 0, 0),
(39, 'camiron', 1, 0),
(40, 'iraq', 1, 0),
(41, 'dijboute', 1, 0),
(42, 'south africa', 1, 0),
(43, 'ivory coast', 1, 0),
(44, 'united kingdom', 0, 0),
(45, 'Jordan', 0, 0),
(46, 'Bahrian', 0, 0),
(47, 'palestine', 1, 0),
(48, 'Turkey', 0, 0),
(49, 'Algeria', 1, 0),
(50, 'Oman', 0, 0),
(51, 'ethipoa', 1, 0),
(52, 'muritustus', 1, 0),
(53, 'yemen', 0, 0),
(54, 'UAE', 1, 0),
(55, 'russian', 0, 1),
(56, '', 1, 0),
(57, 'azrerbaijan', 0, 0),
(58, 'ukrania', 0, 0),
(59, 'albania', 0, 0),
(60, 'ksa', 0, 0),
(61, 'kenya', 0, 0),
(62, 'USA', 0, 0),
(63, 'Lebanon', 0, 0),
(64, 'libya', 0, 0),
(65, 'georgia', 0, 0),
(66, 'canada', 0, 0),
(67, 'mauritues', 0, 0);

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
,`submitDate` date
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
  `submitDate` date DEFAULT NULL,
  `accrualDate` date DEFAULT NULL,
  `notes` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `company` (`company`),
  KEY `country` (`country`),
  KEY `port` (`port`),
  KEY `shippingCompany` (`shippingCompany`)
) ENGINE=InnoDB AUTO_INCREMENT=1973 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exportcertificate`
--

INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `nolon`, `manifesto`, `usdToEgp`, `submitDate`, `accrualDate`, `notes`) VALUES
(854, '3713.0', 1, '2018-07-31', 34, 4, 5, 1, 10806.25, 0, 17.5, '2019-02-25', '2019-01-01', 'fxgsfgsdfg'),
(855, '4558.0', 1, '2018-09-18', 63, 4, 5, 1, 0, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(856, '4162.0', 1, '2018-08-28', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(857, '4335.0', 1, '2018-03-06', 40, 6, 4, 1, 6125, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(858, '5473.0', 1, '2018-10-30', 50, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(859, '1973.0', 1, '2018-04-29', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(860, '1422.0', 1, '2018-04-02', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(861, '2010.0', 1, '2018-01-30', 47, 6, 7, 1, 3535, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(862, '22430.0', 1, '2018-11-21', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(863, '7944.0', 1, '2018-04-29', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(864, '256.0', 1, '2018-01-24', 37, 6, 5, 1, 17963.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(865, '3926.0', 1, '2018-08-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(866, '5722.0', 1, '2018-11-12', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(867, '21970.0', 1, '2018-11-15', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-01', '2019-01-01', ''),
(868, '6049.0', 1, '2018-03-31', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(869, '1998.0', 1, '2018-01-30', 36, 6, 4, 1, 3937.5, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(870, '3053.0', 1, '2018-06-27', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(871, '1867.0', 1, '2018-01-29', 34, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(872, '6344.0', 1, '2018-12-10', 34, 6, 5, 1, 3027.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(873, '11896.0', 1, '2018-06-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(874, '5204.0', 1, '2018-10-18', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(875, '26841.0', 1, '2018-05-27', 52, 6, 5, 1, 0, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(876, '1308.0', 1, '2018-03-27', 36, 6, 5, 1, 10937.5, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(877, '1172.0', 1, '2018-03-21', 36, 6, 5, 1, 3937.5, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(878, '21519.0', 1, '2018-11-10', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-25', '2019-01-01', ''),
(879, '6383.0', 1, '2018-04-05', 49, 6, 4, 1, 21070, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(880, '1341.0', 1, '2018-01-21', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(881, '5544.0', 1, '2018-11-01', 36, 6, 5, 1, 8995, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(882, '3700.0', 1, '2018-02-24', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(883, '11237.0', 1, '2018-06-20', 40, 6, 4, 1, 4042.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(884, '1543.0', 1, '2018-04-11', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(885, '7046.0', 1, '2018-04-17', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(886, '8028.0', 1, '2018-04-30', 55, 6, 4, 1, 0, 1, 17.5, '2019-02-14', '2019-01-01', ''),
(887, '17814.0', 1, '2018-09-26', 43, 6, 6, 1, 15837.5, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(888, '10218.0', 1, '2018-05-31', 54, 6, 4, 1, 17990, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(889, '6457.0', 1, '2018-12-16', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(890, '18836.0', 1, '2018-10-10', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(891, '5817.0', 1, '2018-11-17', 47, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(892, '2604.0', 1, '2018-06-02', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(893, '1557.0', 1, '2018-01-24', 40, 6, 4, 1, 19460, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(894, '227.0', 1, '2018-01-22', 37, 6, 5, 1, 19530, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(895, '4263.0', 1, '2018-08-30', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(896, '2319.0', 1, '2018-05-20', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(897, '15344.0', 1, '2018-08-27', 40, 6, 4, 1, 55072.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(898, '2941.0', 1, '2018-06-24', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(899, '24304.0', 1, '2018-12-15', 40, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(900, '1997.0', 1, '2018-01-30', 36, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(901, '4425.0', 1, '2018-03-07', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(902, '2874.0', 1, '2018-06-21', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(903, '2491.0', 1, '2018-02-07', 47, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(904, '908.0', 1, '2018-01-16', 36, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(905, '790.0', 1, '2018-02-27', 36, 6, 5, 1, 10937.5, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(906, '4282.0', 1, '2018-09-01', 34, 6, 5, 1, 18033.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(907, '2231.0', 1, '2018-05-14', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(908, '14384.0', 1, '2018-08-08', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(909, '17816.0', 1, '2018-09-26', 43, 6, 6, 1, 10767.75, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(910, '17680.0', 1, '2018-09-25', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(911, '3957.0', 1, '2018-02-27', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(912, '7611.0', 1, '2018-04-24', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(913, '5246.0', 1, '2018-10-21', 45, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(914, '2229.0', 1, '2018-05-14', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(915, '2197.0', 1, '2018-05-13', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(916, '4783.0', 1, '2018-09-27', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(917, '2172.0', 1, '2018-05-12', 47, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(918, '12508.0', 1, '2018-07-10', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(919, '3189.0', 1, '2018-07-02', 37, 4, 5, 1, 14175, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(920, '17121.0', 1, '2018-09-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(921, '17683.0', 1, '2018-09-25', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(922, '6734.0', 1, '2018-04-12', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(923, '101.0', 1, '2018-01-17', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(924, '3714.0', 1, '2018-07-31', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(925, '10935.0', 1, '2018-06-12', 40, 6, 4, 1, 8085, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(926, '1707.0', 1, '2018-04-18', 47, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(927, '5539.0', 1, '2018-11-01', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(928, '16111.0', 1, '2018-09-05', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(929, '11876.0', 1, '2018-06-28', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(930, '20493.0', 1, '2018-10-28', 40, 4, 5, 1, 19145, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(931, '2329.0', 1, '2018-05-20', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(932, '2547.0', 1, '2018-05-30', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(933, '1828.0', 1, '2018-04-23', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(934, '1706.0', 1, '2018-04-18', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(935, '844.0', 1, '2018-01-15', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(936, '10211.0', 1, '2018-05-31', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(937, '1963.0', 1, '2018-01-30', 40, 6, 4, 1, 9730, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(938, '18931.0', 1, '2018-10-11', 40, 6, 4, 1, 19145, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(939, '2228.0', 1, '2018-05-14', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(940, '1831.0', 1, '2018-04-23', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(941, '4560.0', 1, '2018-09-18', 37, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(942, '848.0', 1, '2018-02-28', 37, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(943, '19901.0', 1, '2018-10-21', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(944, '4600.0', 1, '2018-03-10', 45, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(945, '4275.0', 1, '2018-03-05', 43, 6, 6, 1, 41090, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(946, '4764.0', 1, '2018-09-26', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(947, '715.0', 1, '2018-02-24', 37, 6, 5, 1, 10325, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(948, '2230.0', 1, '2018-05-14', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(949, '23133.0', 1, '2018-11-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(950, '6814.0', 1, '2018-04-14', 58, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(951, '3737.0', 1, '2018-08-01', 63, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(952, '2292.0', 1, '2018-05-17', 41, 6, 5, 1, 22750, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(953, '1975.0', 1, '2018-04-29', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(954, '5684.0', 1, '2018-03-26', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(955, '2603.0', 1, '2018-06-02', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(956, '20669.0', 1, '2018-10-30', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(957, '2597.0', 1, '2018-06-02', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(958, '7497.0', 1, '2018-04-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(959, '1592.0', 1, '2018-01-24', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(960, '1164.0', 1, '2018-01-20', 34, 6, 7, 1, 26985, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(961, '17929.0', 1, '2018-09-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(962, '16276.0', 1, '2018-09-08', 40, 6, 4, 1, 9537.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(963, '23321.0', 1, '2018-11-29', 40, 6, 4, 1, 9572.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(964, '2050.0', 1, '2018-05-02', 56, 6, 5, 0, 27256.25, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(965, '1604.0', 1, '2018-04-14', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(966, '2289.0', 1, '2018-05-17', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(967, '3029.0', 1, '2018-02-14', 47, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(968, '7204.0', 1, '2018-04-18', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(969, '3395.0', 1, '2018-07-15', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(970, '2470.0', 1, '2018-05-28', 50, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(971, '1076.0', 1, '2018-03-15', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(972, '258.0', 1, '2018-01-24', 37, 6, 5, 1, 24412.5, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(973, '1169.0', 1, '2018-03-21', 51, 6, 5, 1, 16143.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(974, '2518.0', 1, '2018-02-07', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(975, '513.0', 1, '2018-02-12', 36, 6, 5, 1, 47775, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(976, '3560.0', 1, '2018-07-25', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(977, '5556.0', 1, '2018-11-03', 36, 6, 5, 1, 4497.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(978, '7277.0', 1, '2018-04-19', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(979, '4017.0', 1, '2018-08-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(980, '3040.0', 1, '2018-02-14', 43, 6, 7, 1, 12460, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(981, '712.0', 1, '2018-02-24', 36, 6, 5, 1, 46637.5, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(982, '19902.0', 1, '2018-10-21', 40, 6, 4, 1, 36120, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(983, '19768.0', 1, '2018-10-20', 40, 6, 4, 1, 26547.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(984, '2700.0', 1, '2018-06-09', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(985, '4266.0', 1, '2018-08-30', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(986, '4814.0', 1, '2018-03-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(987, '2336.0', 1, '2018-05-20', 34, 4, 5, 0, 20440, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(988, '1189.0', 1, '2018-03-25', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(989, '919.0', 1, '2018-01-16', 47, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(990, '5948.0', 1, '2018-03-29', 34, 6, 6, 1, 4497.5, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(991, '20494.0', 1, '2018-10-28', 40, 4, 5, 1, 38290, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(992, '6701.0', 1, '2018-12-26', 34, 4, 5, 1, 4987.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(993, '4784.0', 1, '2018-09-27', 51, 4, 5, 1, 19950, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(994, '4280.0', 1, '2018-09-01', 45, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(995, '1226.0', 1, '2018-03-24', 37, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(996, '6287.0', 1, '2018-04-04', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(997, '6772.0', 1, '2018-12-27', 45, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(998, '2546.0', 1, '2018-05-30', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(999, '3190.0', 1, '2018-07-02', 37, 4, 5, 1, 10631.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1000, '3474.0', 1, '2018-07-19', 36, 4, 5, 1, 21875, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1001, '3101.0', 1, '2018-06-28', 47, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1002, '1996.0', 1, '2018-01-30', 36, 6, 4, 1, 7000, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1003, '4180.0', 1, '2018-03-03', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1004, '2563.0', 1, '2018-05-31', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1005, '1119.0', 1, '2018-01-18', 45, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1006, '16917.0', 1, '2018-09-17', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1007, '3672.0', 1, '2018-07-30', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1008, '2517.0', 1, '2018-02-08', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1009, '6925.0', 1, '2018-04-16', 40, 6, 4, 1, 9730, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1010, '4588.0', 1, '2018-03-10', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1011, '5946.0', 1, '2018-11-24', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1012, '1910.0', 1, '2018-01-29', 40, 6, 4, 1, 0, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1013, '3640.0', 1, '2018-02-22', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1014, '5711.0', 1, '2018-03-26', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1015, '20520.0', 1, '2018-10-29', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1016, '6343.0', 1, '2018-12-10', 45, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1017, '5640.0', 1, '2018-11-07', 37, 6, 5, 1, 3666.25, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1018, '1611.0', 1, '2018-01-24', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1019, '1612.0', 1, '2018-01-24', 43, 6, 7, 1, 24920, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1020, '259.0', 1, '2018-01-24', 37, 6, 5, 1, 8198.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1021, '24230.0', 1, '2018-12-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1022, '15706.0', 1, '2018-08-30', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1023, '7945.0', 1, '2018-04-29', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1024, '4915.0', 1, '2018-03-14', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1025, '4104.0', 1, '2018-03-01', 45, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1026, '1603.0', 1, '2018-04-14', 37, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1027, '1923.0', 1, '2018-01-29', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1028, '1974.0', 1, '2018-04-29', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1029, '7496.0', 1, '2018-04-23', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1030, '7498.0', 1, '2018-04-23', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1031, '5421.0', 1, '2018-10-29', 63, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1032, '1185.0', 1, '2018-03-22', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1033, '3170.0', 1, '2018-02-17', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1034, '2984.0', 1, '2018-02-14', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1035, '18074.0', 1, '2018-09-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1036, '5884.0', 1, '2018-03-28', 40, 6, 4, 1, 16913.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1037, '21976.0', 1, '2018-11-15', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1038, '13772.0', 1, '2018-07-30', 58, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1039, '15342.0', 1, '2018-08-27', 40, 6, 4, 1, 49084, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1040, '1494.0', 1, '2018-01-23', 47, 6, 7, 1, 3535, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1041, '6181.0', 1, '2018-12-01', 34, 6, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1042, '2405.0', 1, '2018-05-23', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1043, '3866.0', 1, '2018-08-08', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1044, '5866.0', 1, '2018-11-19', 37, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1045, '3910.0', 1, '2018-08-09', 50, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1046, '1649.0', 1, '2018-04-11', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1047, '2872.0', 1, '2018-02-12', 45, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1048, '6611.0', 1, '2018-12-23', 34, 6, 5, 1, 4891.25, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1049, '1246.0', 1, '2018-03-25', 36, 6, 5, 1, 7875, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1050, '1190.0', 1, '2018-03-22', 41, 6, 7, 1, 1715.7, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1051, '6633.0', 1, '2018-12-23', 45, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1052, '1516.0', 1, '2018-04-07', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1053, '17287.0', 1, '2018-09-20', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1054, '2781.0', 1, '2018-06-12', 50, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1055, '8902.0', 1, '2018-05-13', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1056, '19900.0', 1, '2018-10-21', 40, 6, 4, 1, 47862.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1057, '25120.0', 1, '2018-12-24', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1058, '3431.0', 1, '2018-02-20', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1059, '4189.0', 1, '2018-08-28', 36, 4, 5, 1, 8750, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1060, '4675.0', 1, '2018-03-11', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-11', '2019-01-01', ''),
(1061, '3042.0', 1, '2018-02-14', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1062, '2052.0', 1, '2018-05-20', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1063, '23320.0', 1, '2018-11-29', 40, 6, 4, 1, 7402.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1064, '24036.0', 1, '2018-12-11', 40, 6, 5, 1, 81917.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1065, '2739.0', 1, '2018-06-11', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1066, '1715.0', 1, '2018-01-27', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1067, '20056.0', 1, '2018-10-23', 38, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1068, '20091.0', 1, '2018-10-23', 40, 4, 5, 1, 9572.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1069, '3623.0', 1, '2018-07-28', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1070, '3907.0', 1, '2018-08-09', 36, 4, 5, 1, 2625, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1071, '11238.0', 1, '2018-06-20', 40, 6, 4, 1, 4042.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1072, '504.0', 1, '2018-02-12', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1073, '9695.0', 1, '2018-05-24', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1074, '9364.0', 1, '2018-05-19', 64, 6, 4, 1, 0, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1075, '6294.0', 1, '2018-12-06', 34, 6, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1076, '4769.0', 1, '2018-09-26', 41, 4, 5, 1, 7910, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1077, '4590.0', 1, '2018-03-10', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1078, '4115.0', 1, '2018-08-26', 45, 4, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1079, '25185.0', 1, '2018-12-25', 61, 5, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1080, '939.0', 1, '2018-01-16', 45, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1081, '5776.0', 1, '2018-03-27', 59, 6, 4, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1082, '3429.0', 1, '2018-02-20', 48, 6, 6, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1083, '4525.0', 1, '2018-09-17', 36, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1084, '2881.0', 1, '2018-06-21', 36, 4, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1085, '3659.0', 1, '2018-07-30', 50, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1086, '3099.0', 1, '2018-06-28', 47, 4, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1087, '3342.0', 1, '2018-07-12', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1088, '17850.0', 1, '2018-09-26', 40, 6, 4, 1, 9572.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1089, '1610.0', 1, '2018-01-24', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1090, '1449.0', 1, '2018-04-03', 47, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1091, '4029.0', 1, '2018-02-28', 41, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1092, '30032.0', 1, '2018-06-24', 67, 6, 4, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1093, '24721.0', 1, '2018-12-19', 43, 6, 6, 1, 28796.25, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1094, '1086.0', 1, '2018-01-18', 40, 6, 4, 1, 19460, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1095, '3364.0', 1, '2018-07-14', 46, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1096, '1446.0', 1, '2018-04-03', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1097, '634.0', 1, '2018-02-20', 36, 6, 5, 1, 47775, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1098, '5497.0', 1, '2018-03-22', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1099, '1912.0', 1, '2018-01-29', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1100, '2824.0', 1, '2018-06-13', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1101, '20305.0', 1, '2018-10-25', 43, 6, 6, 1, 13002.5, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1102, '10213.0', 1, '2018-05-31', 58, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1103, '5214.0', 1, '2018-03-19', 40, 6, 4, 1, 7183.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1104, '4673.0', 1, '2018-03-11', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-11', '2019-01-01', ''),
(1105, '6699.0', 1, '2018-04-12', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1106, '15239.0', 1, '2018-08-26', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1107, '5830.0', 1, '2018-11-17', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1108, '5461.0', 1, '2018-10-30', 63, 6, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1109, '3605.0', 1, '2018-07-26', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1110, '4164.0', 1, '2018-08-28', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1111, '4782.0', 1, '2018-09-27', 45, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1112, '1697.0', 1, '2018-04-18', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1113, '4677.0', 1, '2018-03-11', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-11', '2019-01-01', ''),
(1114, '2598.0', 1, '2018-06-02', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1115, '4165.0', 1, '2018-08-28', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1116, '4068.0', 1, '2018-08-16', 46, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1117, '1506.0', 1, '2018-04-05', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1118, '5051.0', 1, '2018-10-11', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1119, '2605.0', 1, '2018-06-02', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1120, '6608.0', 1, '2018-04-11', 40, 6, 4, 1, 19460, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1121, '8029.0', 1, '2018-04-30', 66, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1122, '1750.0', 1, '2018-01-28', 36, 6, 4, 1, 7000, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1123, '1088.0', 1, '2018-03-17', 37, 6, 5, 1, 3850, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1124, '1614.0', 1, '2018-04-15', 47, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1125, '4044.0', 1, '2018-02-28', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1126, '2057.0', 1, '2018-01-31', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1127, '14896.0', 1, '2018-08-15', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1128, '7047.0', 1, '2018-04-17', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1129, '4768.0', 1, '2018-09-26', 51, 4, 5, 1, 19950, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1130, '4602.0', 1, '2018-03-10', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1131, '4218.0', 1, '2018-08-29', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1132, '6683.0', 1, '2018-12-25', 34, 4, 5, 1, 4812.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1133, '1964.0', 1, '2018-04-29', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1134, '5846.0', 1, '2018-11-18', 36, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1135, '10123.0', 1, '2018-05-30', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1136, '3778.0', 1, '2018-08-04', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1137, '3473.0', 1, '2018-07-19', 37, 4, 5, 1, 13046.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1138, '23030.0', 1, '2018-11-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1139, '3031.0', 1, '2018-02-04', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1140, '1187.0', 1, '2018-03-22', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1141, '23124.0', 1, '2018-11-28', 43, 6, 4, 1, 9975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1142, '3821.0', 1, '2018-02-26', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1143, '11600.0', 1, '2018-06-26', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1144, '5947.0', 1, '2018-03-29', 34, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1145, '2435.0', 1, '2018-05-26', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1146, '4038.0', 1, '2018-02-28', 59, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1147, '9020.0', 1, '2018-05-14', 43, 6, 4, 1, 12652.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1148, '4163.0', 1, '2018-08-28', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1149, '6722.0', 1, '2018-04-12', 37, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1150, '20435.0', 1, '2018-10-28', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1151, '38351.0', 1, '2018-09-18', 35, 6, 5, 1, 11760, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1152, '11893.0', 1, '2018-06-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1153, '14034.0', 1, '2018-08-02', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1154, '3563.0', 1, '2018-07-25', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1155, '23261.0', 1, '2018-11-29', 38, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1156, '20521.0', 1, '2018-10-29', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1157, '2876.0', 1, '2018-06-21', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1158, '20740.0', 1, '2018-10-30', 40, 4, 5, 1, 16975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1159, '3703.0', 1, '2018-02-24', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(1160, '25243.0', 1, '2018-12-25', 40, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1161, '3733.0', 1, '2018-08-01', 46, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1162, '4441.0', 1, '2018-09-12', 50, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1163, '1363.0', 1, '2018-01-22', 40, 6, 4, 1, 11926.25, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1164, '5062.0', 1, '2018-03-17', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1165, '4487.0', 1, '2018-03-07', 45, 6, 7, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1166, '3658.0', 1, '2018-07-30', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1167, '16278.0', 1, '2018-09-08', 40, 6, 4, 1, 9537.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1168, '1037.0', 1, '2018-03-14', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1169, '6199.0', 1, '2018-12-02', 45, 6, 4, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1170, '1474.0', 1, '2018-01-23', 54, 6, 4, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1171, '4127.0', 1, '2018-08-26', 34, 6, 5, 1, 18348.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1172, '5894.0', 1, '2018-11-17', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1173, '4885.0', 1, '2018-03-14', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1174, '3603.0', 1, '2018-07-26', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1175, '1027.0', 1, '2018-01-17', 47, 6, 7, 1, 2966.25, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1176, '19770.0', 1, '2018-10-20', 40, 6, 4, 1, 76580, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1177, '797.0', 1, '2018-02-27', 37, 6, 5, 1, 10325, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1178, '3924.0', 1, '2018-08-11', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1179, '4137.0', 1, '2018-08-26', 34, 6, 5, 1, 12792.5, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1180, '5850.0', 1, '2018-11-18', 34, 4, 5, 1, 6973.75, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1181, '7947.0', 1, '2018-04-29', 63, 6, 6, 0, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1182, '20516.0', 1, '2018-10-29', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1183, '3344.0', 1, '2018-07-12', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1184, '3193.0', 1, '2018-07-02', 36, 4, 5, 1, 2625, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1185, '7195.0', 1, '2018-04-18', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1186, '15498.0', 1, '2018-08-28', 40, 6, 4, 1, 38150, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1187, '2879.0', 1, '2018-06-21', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1188, '2293.0', 1, '2018-05-17', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1189, '5288.0', 1, '2018-03-02', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1190, '4480.0', 1, '2018-09-15', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1191, '5076.0', 1, '2018-10-13', 45, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1192, '1314.0', 1, '2018-03-27', 37, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1193, '1075.0', 1, '2018-03-15', 36, 6, 5, 1, 7875, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1194, '1120.0', 1, '2018-01-18', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1195, '3008.0', 1, '2018-06-26', 34, 6, 5, 1, 7498.75, 0, 17.5, '2019-06-20', '2019-01-01', ''),
(1196, '3401.0', 1, '2018-07-15', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1197, '23666.0', 1, '2018-12-05', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1198, '3283.0', 1, '2018-07-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1199, '2450.0', 1, '2018-02-06', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1200, '10122.0', 1, '2018-05-30', 40, 6, 4, 1, 8085, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1201, '3738.0', 1, '2018-08-01', 50, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1202, '1977.0', 1, '2018-04-29', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1203, '3964.0', 1, '2018-02-27', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1204, '2676.0', 1, '2018-02-10', 40, 6, 4, 1, 9730, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1205, '6179.0', 1, '2018-12-01', 46, 6, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1206, '6789.0', 1, '2018-04-14', 49, 6, 4, 1, 10535, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1207, '1605.0', 1, '2018-04-14', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1208, '2485.0', 1, '2018-05-28', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1209, '3505.0', 1, '2018-07-22', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1210, '940.0', 1, '2018-01-16', 43, 6, 7, 1, 24920, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1211, '11539.0', 1, '2018-06-25', 40, 6, 4, 1, 4891.25, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1212, '16992.0', 1, '2018-09-17', 40, 6, 4, 1, 16922.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1213, '3054.0', 1, '2018-06-27', 37, 4, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1214, '10933.0', 1, '2018-06-12', 40, 6, 4, 1, 33810, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1215, '12344.0', 1, '2018-07-08', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1216, '3927.0', 1, '2018-08-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1217, '714.0', 1, '2018-02-24', 36, 6, 5, 1, 50085, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1218, '4736.0', 1, '2018-03-12', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1219, '4571.0', 1, '2018-09-18', 37, 4, 5, 1, 14358.75, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1220, '2174.0', 1, '2018-05-12', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1221, '2621.0', 1, '2018-06-04', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1222, '17970.0', 1, '2018-09-27', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1223, '6583.0', 1, '2018-12-20', 45, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1224, '14901.0', 1, '2018-08-15', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1225, '3302.0', 1, '2018-02-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1226, '2571.0', 1, '2018-02-08', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1227, '2696.0', 1, '2018-06-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1228, '4036.0', 1, '2018-08-15', 51, 6, 5, 1, 525, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1229, '12970.0', 1, '2018-07-18', 38, 4, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1230, '2928.0', 1, '2018-02-13', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1231, '6582.0', 1, '2018-12-20', 45, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1232, '13906.0', 1, '2018-07-31', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1233, '8435.0', 1, '2018-05-07', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1234, '1313.0', 1, '2018-03-27', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1235, '4438.0', 1, '2018-09-12', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1236, '6456.0', 1, '2018-12-16', 45, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1237, '4324.0', 1, '2018-09-04', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1238, '609.0', 1, '2018-01-11', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1239, '3807.0', 1, '2018-08-06', 37, 4, 5, 1, 10631.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1240, '4082.0', 1, '2018-08-16', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1241, '4916.0', 1, '2018-03-14', 43, 6, 6, 1, 24920, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1242, '7285.0', 1, '2018-04-19', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1243, '16158.0', 1, '2018-09-06', 40, 6, 4, 1, 28612.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1244, '22249.0', 1, '2018-11-18', 40, 6, 4, 1, 26547.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1245, '22431.0', 1, '2018-11-21', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1246, '7575.0', 1, '2018-04-23', 49, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1247, '18708.0', 1, '2018-10-09', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1248, '4599.0', 1, '2018-09-19', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1249, '4733.0', 1, '2018-03-12', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1250, '5944.0', 1, '2018-03-29', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1251, '3963.0', 1, '2018-02-27', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1252, '3673.0', 1, '2018-07-30', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1253, '1976.0', 1, '2018-04-29', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1254, '3687.0', 1, '2018-07-31', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1255, '3724.0', 1, '2018-07-31', 34, 6, 5, 1, 12635, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1256, '9803.0', 1, '2018-05-26', 65, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1257, '5858.0', 1, '2018-03-28', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1258, '467.0', 1, '2018-01-10', 40, 6, 4, 1, 29190, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1259, '25388.0', 1, '2018-12-27', 40, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1260, '3859.0', 1, '2018-02-26', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1261, '12969.0', 1, '2018-07-18', 57, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1262, '4843.0', 1, '2018-09-29', 45, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1263, '20667.0', 1, '2018-10-30', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1264, '1507.0', 1, '2018-04-05', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1265, '4754.0', 1, '2018-03-12', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1266, '20310.0', 1, '2018-10-25', 48, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1267, '3811.0', 1, '2018-02-25', 34, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1268, '4836.0', 1, '2018-09-29', 51, 4, 5, 1, 19950, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1269, '5392.0', 1, '2018-03-21', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1270, '4730.0', 1, '2018-03-12', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1271, '5333.0', 1, '2018-10-24', 50, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1272, '3403.0', 1, '2018-07-15', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1273, '23254.0', 1, '2018-11-29', 48, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1274, '5462.0', 1, '2018-10-30', 34, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1275, '3995.0', 1, '2018-08-14', 45, 4, 4, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1276, '3488.0', 1, '2018-07-21', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1277, '1437.0', 1, '2018-04-03', 64, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1278, '5299.0', 1, '2018-03-20', 49, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1279, '5298.0', 1, '2018-03-20', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1280, '3115.0', 1, '2018-06-28', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1281, '8023.0', 1, '2018-04-30', 63, 6, 6, 0, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1282, '1011.0', 1, '2018-01-17', 40, 6, 4, 1, 19460, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1283, '4284.0', 1, '2018-09-01', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1284, '1080.0', 1, '2018-03-15', 37, 6, 5, 1, 3850, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1285, '4015.0', 1, '2018-08-14', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1286, '941.0', 1, '2018-01-16', 63, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1287, '5707.0', 1, '2018-11-11', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1288, '3908.0', 1, '2018-08-09', 37, 4, 5, 1, 7087.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1289, '9923.0', 1, '2018-05-28', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1290, '24823.0', 1, '2018-12-20', 48, 6, 6, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1291, '1353.0', 1, '2018-03-28', 36, 6, 5, 1, 18733.75, 0, 17.5, '2019-01-23', '2019-01-01', ''),
(1292, '4767.0', 1, '2018-09-26', 41, 4, 5, 1, 19950, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1293, '6926.0', 1, '2018-04-16', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1294, '3925.0', 1, '2018-08-11', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1295, '3588.0', 1, '2018-02-22', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1296, '11697.0', 1, '2018-06-27', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1297, '7411.0', 1, '2018-04-22', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1298, '19777.0', 1, '2018-10-20', 42, 6, 4, 1, 18138.75, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1299, '1470.0', 1, '2018-01-23', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1300, '19769.0', 1, '2018-10-20', 40, 6, 4, 1, 16975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1301, '257.0', 1, '2018-01-24', 37, 6, 5, 1, 8198.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1302, '686.0', 1, '2018-01-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1303, '2386.0', 1, '2018-05-23', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1304, '23123.0', 1, '2018-11-28', 43, 6, 4, 1, 14393.75, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1305, '16303.0', 1, '2018-09-09', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1306, '2020.0', 1, '2018-04-30', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1307, '1966.0', 1, '2018-04-29', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1308, '17427.0', 1, '2018-09-22', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1309, '16380.0', 1, '2018-09-10', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1310, '19946.0', 1, '2018-10-22', 40, 6, 4, 1, 9572.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1311, '1380.0', 1, '2018-01-22', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1312, '15705.0', 1, '2018-08-30', 40, 6, 4, 1, 9537.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1313, '24883.0', 1, '2018-12-20', 38, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1314, '5222.0', 1, '2018-10-21', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1315, '1857.0', 1, '2018-01-29', 49, 6, 4, 1, 52150, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1316, '9205.0', 1, '2018-05-16', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1317, '17815.0', 1, '2018-09-26', 43, 6, 6, 1, 13002.5, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1318, '3621.0', 1, '2018-07-28', 37, 4, 5, 1, 3543.75, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1319, '4091.0', 1, '2018-08-16', 36, 4, 5, 1, 7000, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1320, '1749.0', 1, '2018-01-28', 36, 6, 4, 1, 3062.5, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1321, '909.0', 1, '2018-01-16', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1322, '8030.0', 1, '2018-04-30', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1323, '4014.0', 1, '2018-08-14', 63, 4, 5, 1, 0, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1324, '3706.0', 1, '2018-02-24', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(1325, '2232.0', 1, '2018-05-14', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1326, '2749.0', 1, '2018-06-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1327, '6807.0', 1, '2018-12-30', 41, 4, 5, 1, 936.25, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1328, '24139.0', 1, '2018-12-12', 43, 6, 6, 1, 48090, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1329, '21849.0', 1, '2018-11-14', 40, 6, 4, 1, 45692.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1330, '1875.0', 1, '2018-01-29', 47, 6, 7, 1, 2966.25, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1331, '6684.0', 1, '2018-12-25', 34, 4, 5, 1, 6615, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1332, '5496.0', 1, '2018-03-22', 49, 6, 4, 1, 52675, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1333, '24885.0', 1, '2018-12-20', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1334, '1340.0', 1, '2018-03-28', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1335, '6677.0', 1, '2018-12-25', 34, 6, 5, 1, 6632.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1336, '3990.0', 1, '2018-08-14', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1337, '22294.0', 1, '2018-11-19', 38, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1338, '3813.0', 1, '2018-02-25', 34, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1339, '3025.0', 1, '2018-06-26', 34, 4, 5, 1, 0, 0, 17.5, '2019-06-20', '2019-01-01', ''),
(1340, '711.0', 1, '2018-02-24', 37, 6, 5, 1, 6475, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1341, '5848.0', 1, '2018-11-18', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1342, '1231.0', 1, '2018-03-24', 36, 6, 5, 1, 75880, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1343, '6282.0', 1, '2018-12-16', 34, 6, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1344, '3956.0', 1, '2018-02-27', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1345, '7919.0', 1, '2018-04-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1346, '25648.0', 1, '2018-12-30', 44, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1347, '3455.0', 1, '2018-07-18', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1348, '3428.0', 1, '2018-02-20', 48, 6, 6, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1349, '24302.0', 1, '2018-12-15', 38, 6, 4, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1350, '5770.0', 1, '2018-03-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1351, '1819.0', 1, '2018-04-23', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1352, '3207.0', 1, '2018-07-02', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1353, '608.0', 1, '2018-01-11', 40, 6, 4, 1, 19460, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1354, '2240.0', 1, '2018-05-14', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1355, '3633.0', 1, '2018-02-22', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1356, '2836.0', 1, '2018-06-02', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1357, '3947.0', 1, '2018-02-27', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1358, '2021.0', 1, '2018-01-30', 45, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1359, '1864.0', 1, '2018-04-24', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1360, '1383.0', 1, '2018-01-22', 63, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1361, '11440.0', 1, '2018-06-23', 64, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1362, '3921.0', 1, '2018-08-09', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1363, '58.0', 1, '2018-01-03', 36, 6, 4, 1, 3937.5, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1364, '10932.0', 1, '2018-06-12', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1365, '5818.0', 1, '2018-11-17', 47, 6, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1366, '22719.0', 1, '2018-11-24', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1367, '3103.0', 1, '2018-06-28', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1368, '6813.0', 1, '2018-04-14', 58, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1369, '15499.0', 1, '2018-08-28', 40, 6, 4, 1, 26460, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1370, '3511.0', 1, '2018-07-22', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1371, '210.0', 1, '2018-01-06', 37, 6, 4, 1, 17718.75, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1372, '5467.0', 1, '2018-10-30', 34, 4, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1373, '3398.0', 1, '2018-07-15', 37, 4, 5, 1, 10631.25, 0, 17.5, '2019-04-18', '2019-01-01', ''),
(1374, '2627.0', 1, '2018-02-08', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1375, '25242.0', 1, '2018-12-25', 64, 6, 4, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1376, '2054.0', 1, '2018-05-20', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1377, '1821.0', 1, '2018-04-23', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1378, '4240.0', 1, '2018-08-30', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1379, '20742.0', 1, '2018-10-30', 40, 4, 5, 1, 7402.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1380, '5847.0', 1, '2018-11-18', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1381, '2871.0', 1, '2018-02-12', 63, 6, 6, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1382, '3641.0', 1, '2018-02-22', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1383, '4187.0', 1, '2018-08-28', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1384, '23049.0', 1, '2018-11-27', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1385, '10216.0', 1, '2018-05-31', 40, 6, 4, 1, 3815, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1386, '4285.0', 1, '2018-09-01', 37, 4, 5, 1, 7087.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1387, '3721.0', 1, '2018-02-24', 48, 6, 7, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1388, '2063.0', 1, '2018-01-31', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1389, '11882.0', 1, '2018-06-28', 40, 6, 4, 1, 5346.25, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1390, '33432.0', 1, '2018-07-26', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1391, '10908.0', 1, '2018-06-12', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1392, '7926.0', 1, '2018-04-29', 40, 6, 4, 1, 16913.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1393, '6584.0', 1, '2018-12-20', 45, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1394, '1518.0', 1, '2018-04-07', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1395, '4089.0', 1, '2018-08-16', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1396, '3361.0', 1, '2018-07-14', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1397, '4678.0', 1, '2018-03-11', 60, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1398, '21296.0', 1, '2018-11-07', 54, 6, 8, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', '');
INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `nolon`, `manifesto`, `usdToEgp`, `submitDate`, `accrualDate`, `notes`) VALUES
(1399, '17018.0', 1, '2018-09-18', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1400, '21387.0', 1, '2018-11-08', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1401, '2564.0', 1, '2018-05-31', 45, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1402, '22816.0', 1, '2018-11-25', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1403, '11275.0', 1, '2018-06-21', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1404, '3360.0', 1, '2018-07-14', 36, 4, 5, 1, 13125, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1405, '905.0', 1, '2018-03-06', 37, 6, 5, 1, 6475, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1406, '2934.0', 1, '2018-06-24', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1407, '5541.0', 1, '2018-11-01', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1408, '1227.0', 1, '2018-03-24', 37, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1409, '3527.0', 1, '2018-07-22', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1410, '4013.0', 1, '2018-08-14', 50, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1411, '4597.0', 1, '2018-09-19', 34, 4, 5, 1, 4856.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1412, '4092.0', 1, '2018-08-16', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1413, '4595.0', 1, '2018-09-19', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1414, '1170.0', 1, '2018-03-20', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1415, '4090.0', 1, '2018-08-16', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1416, '3487.0', 1, '2018-02-21', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1417, '4601.0', 1, '2018-03-10', 43, 6, 6, 1, 7148.75, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1418, '2497.0', 1, '2018-02-07', 40, 6, 4, 1, 48965, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1419, '14701.0', 1, '2018-08-13', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1420, '1165.0', 1, '2018-01-20', 34, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1421, '3780.0', 1, '2018-08-04', 36, 4, 5, 1, 2625, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1422, '6778.0', 1, '2018-12-27', 46, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1423, '2330.0', 1, '2018-05-20', 34, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1424, '5731.0', 1, '2018-03-26', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1425, '1213.0', 1, '2018-03-22', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1426, '4199.0', 1, '2018-08-28', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1427, '1836.0', 1, '2018-04-23', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1428, '3185.0', 1, '2018-07-02', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1429, '20292.0', 1, '2018-10-25', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1430, '20664.0', 1, '2018-10-30', 64, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1431, '23134.0', 1, '2018-11-28', 60, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1432, '2748.0', 1, '2018-06-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1433, '1176.0', 1, '2018-03-21', 45, 6, 5, 1, 3937.5, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1434, '23865.0', 1, '2018-12-18', 67, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1435, '15732.0', 1, '2018-08-30', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1436, '5708.0', 1, '2018-11-11', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1437, '11698.0', 1, '2018-06-27', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1438, '4436.0', 1, '2018-09-12', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1439, '15473.0', 1, '2018-08-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1440, '2370.0', 1, '2018-05-22', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1441, '367.0', 1, '2018-01-30', 37, 6, 5, 1, 4882.5, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1442, '2171.0', 1, '2018-05-12', 47, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1443, '1556.0', 1, '2018-01-24', 36, 6, 4, 1, 10937.5, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1444, '5941.0', 1, '2018-11-24', 45, 6, 4, 1, 8995, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1445, '17486.0', 1, '2018-09-22', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1446, '1869.0', 1, '2018-01-29', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1447, '3962.0', 1, '2018-08-13', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1448, '6234.0', 1, '2018-12-04', 39, 6, 5, 1, 20711.25, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1449, '23971.0', 1, '2018-12-10', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1450, '1081.0', 1, '2018-03-15', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1451, '2751.0', 1, '2018-06-11', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1452, '20739.0', 1, '2018-10-30', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1453, '502.0', 1, '2018-02-12', 37, 6, 5, 1, 22846.25, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1454, '2800.0', 1, '2018-02-12', 47, 6, 7, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1455, '2335.0', 1, '2018-05-20', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1456, '24948.0', 1, '2018-12-22', 64, 6, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1457, '9073.0', 1, '2018-05-15', 48, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1458, '6241.0', 1, '2018-04-03', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1459, '2371.0', 1, '2018-05-22', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1460, '2331.0', 1, '2018-05-20', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1461, '1138.0', 1, '2018-03-20', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1462, '1866.0', 1, '2018-04-24', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1463, '16637.0', 1, '2018-09-13', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1464, '500.0', 1, '2018-02-12', 37, 6, 5, 1, 39060, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1465, '2740.0', 1, '2018-06-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1466, '3562.0', 1, '2018-07-25', 37, 4, 5, 1, 3543.75, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1467, '38760.0', 1, '2018-09-21', 67, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1468, '3013.0', 1, '2018-06-26', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1469, '5809.0', 1, '2018-03-27', 34, 6, 6, 1, 11208.75, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1470, '3396.0', 1, '2018-07-15', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1471, '1447.0', 1, '2018-03-04', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1472, '2742.0', 1, '2018-06-11', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1473, '16743.0', 1, '2018-09-15', 43, 6, 6, 1, 28516.25, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1474, '2046.0', 1, '2018-05-20', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1475, '4008.0', 1, '2018-08-14', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1476, '15413.0', 1, '2018-08-28', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1477, '3858.0', 1, '2018-02-26', 45, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1478, '1398.0', 1, '2018-03-31', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1479, '5864.0', 1, '2018-11-19', 37, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1480, '1594.0', 1, '2018-01-24', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1481, '2880.0', 1, '2018-06-21', 37, 4, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1482, '6177.0', 1, '2018-12-01', 45, 4, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1483, '4276.0', 1, '2018-03-05', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1484, '2805.0', 1, '2018-06-13', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1485, '1221.0', 1, '2018-03-22', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1486, '24962.0', 1, '2018-12-22', 64, 6, 4, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1487, '3635.0', 1, '2018-07-29', 47, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1488, '4123.0', 1, '2018-03-01', 39, 6, 7, 1, 10053.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1489, '3173.0', 1, '2018-02-17', 45, 6, 6, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1490, '20293.0', 1, '2018-10-25', 60, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1491, '5808.0', 1, '2018-03-27', 34, 6, 6, 1, 17990, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1492, '798.0', 1, '2018-02-27', 36, 6, 5, 1, 0, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1493, '7734.0', 1, '2018-04-24', 40, 6, 4, 1, 7183.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1494, '3362.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1495, '43597.0', 1, '2018-10-31', 52, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1496, '2750.0', 1, '2018-06-11', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1497, '3188.0', 1, '2018-02-17', 34, 6, 7, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1498, '5561.0', 1, '2018-03-24', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1499, '1542.0', 1, '2018-04-11', 61, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1500, '13903.0', 1, '2018-07-25', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1501, '3367.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1502, '30030.0', 1, '2018-06-24', 60, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1503, '3192.0', 1, '2018-07-02', 36, 4, 5, 1, 7000, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1504, '2471.0', 1, '2018-05-28', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1505, '4674.0', 1, '2018-03-11', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-11', '2019-01-01', ''),
(1506, '22106.0', 1, '2018-11-17', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-25', '2019-01-01', ''),
(1507, '2001.0', 1, '2018-01-31', 36, 6, 4, 1, 3062.5, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1508, '23135.0', 1, '2018-11-28', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1509, '7110.0', 1, '2018-04-17', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1510, '19975.0', 1, '2018-10-22', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1511, '1444.0', 1, '2018-04-03', 37, 6, 5, 1, 0, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1512, '3904.0', 1, '2018-08-09', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1513, '4872.0', 1, '2018-03-14', 40, 6, 4, 1, 12915, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1514, '1739.0', 1, '2018-04-21', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1515, '3113.0', 1, '2018-06-28', 34, 6, 5, 1, 0, 0, 17.5, '2019-06-20', '2019-01-01', ''),
(1516, '3006.0', 1, '2018-06-26', 34, 6, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1517, '10214.0', 1, '2018-05-31', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-14', '2019-01-01', ''),
(1518, '23031.0', 1, '2018-11-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1519, '3124.0', 1, '2018-02-15', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1520, '5966.0', 1, '2018-03-29', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1521, '6672.0', 1, '2018-12-25', 34, 4, 5, 1, 6615, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1522, '15677.0', 1, '2018-08-29', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1523, '15500.0', 1, '2018-08-28', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1524, '3722.0', 1, '2018-02-24', 43, 6, 7, 1, 7148.75, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1525, '1696.0', 1, '2018-04-08', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1526, '4288.0', 1, '2018-09-01', 45, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1527, '10783.0', 1, '2018-02-28', 67, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1528, '17019.0', 1, '2018-09-18', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1529, '4445.0', 1, '2018-09-12', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1530, '3038.0', 1, '2018-02-14', 45, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1531, '1145.0', 1, '2018-03-05', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1532, '11894.0', 1, '2018-06-28', 60, 6, 4, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1533, '2320.0', 1, '2018-05-20', 51, 4, 5, 1, 17062.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1534, '5983.0', 1, '2018-02-06', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(1535, '6775.0', 1, '2018-12-27', 34, 4, 5, 1, 3045, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1536, '14519.0', 1, '2018-08-09', 54, 6, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1537, '1613.0', 1, '2018-04-15', 47, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1538, '4376.0', 1, '2018-09-08', 47, 4, 5, 1, 0, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1539, '7988.0', 1, '2018-04-29', 58, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1540, '6606.0', 1, '2018-12-23', 34, 6, 5, 1, 4891.25, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1541, '6200.0', 1, '2018-12-02', 45, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1542, '17517.0', 1, '2018-09-23', 61, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1543, '15733.0', 1, '2018-08-30', 43, 6, 6, 1, 24780, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1544, '11602.0', 1, '2018-06-26', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1545, '20157.0', 1, '2018-10-24', 38, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1546, '1553.0', 1, '2018-01-24', 60, 6, 4, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1547, '3432.0', 1, '2018-02-20', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1548, '21511.0', 1, '2018-11-10', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1549, '21386.0', 1, '2018-11-08', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1550, '16993.0', 1, '2018-09-17', 40, 6, 4, 1, 28612.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1551, '5849.0', 1, '2018-11-18', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1552, '5945.0', 1, '2018-11-24', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1553, '3301.0', 1, '2018-02-19', 40, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1554, '7987.0', 1, '2018-04-29', 58, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1555, '1186.0', 1, '2018-03-22', 41, 6, 7, 1, 6125, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1556, '5205.0', 1, '2018-10-18', 46, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1557, '2536.0', 1, '2018-05-30', 45, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1558, '17290.0', 1, '2018-09-20', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1559, '3826.0', 1, '2018-08-07', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1560, '4067.0', 1, '2018-08-16', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1561, '11757.0', 1, '2018-06-27', 40, 6, 4, 1, 770, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1562, '2839.0', 1, '2018-06-20', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1563, '4479.0', 1, '2018-09-15', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1564, '4126.0', 1, '2018-08-26', 34, 6, 5, 1, 18348.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1565, '6773.0', 1, '2018-12-27', 34, 4, 5, 1, 3045, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1566, '5610.0', 1, '2018-11-06', 47, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1567, '4676.0', 1, '2018-03-11', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-11', '2019-01-01', ''),
(1568, '11756.0', 1, '2018-06-27', 40, 6, 4, 1, 1680, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1569, '19118.0', 1, '2018-10-14', 43, 6, 6, 1, 43197, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1570, '1168.0', 1, '2018-03-21', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1571, '1450.0', 1, '2018-04-03', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1572, '7286.0', 1, '2018-04-19', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1573, '8901.0', 1, '2018-05-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1574, '5954.0', 1, '2018-03-29', 49, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1575, '3012.0', 1, '2018-06-26', 34, 6, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1576, '1038.0', 1, '2018-03-14', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1577, '2243.0', 1, '2018-05-14', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1578, '3098.0', 1, '2018-06-28', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1579, '20659.0', 1, '2018-10-30', 43, 6, 6, 1, 14399, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1580, '17124.0', 1, '2018-09-19', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1581, '3328.0', 1, '2018-07-11', 61, 4, 5, 1, 13125, 0, 17.5, '2019-04-18', '2019-01-01', ''),
(1582, '956.0', 1, '2018-03-08', 37, 6, 5, 1, 15400, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1583, '2066.0', 1, '2018-01-31', 36, 6, 4, 1, 3062.5, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1584, '2372.0', 1, '2018-05-22', 36, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1585, '17942.0', 1, '2018-09-27', 40, 6, 4, 1, 7402.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1586, '3705.0', 1, '2018-02-24', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1587, '25035.0', 1, '2018-12-23', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1588, '4083.0', 1, '2018-08-16', 37, 4, 5, 1, 3543.75, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1589, '1837.0', 1, '2018-04-23', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1590, '2233.0', 1, '2018-05-14', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1591, '10210.0', 1, '2018-05-31', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1592, '1699.0', 1, '2018-04-18', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1593, '22718.0', 1, '2018-11-24', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1594, '3350.0', 1, '2018-02-19', 63, 6, 6, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1595, '16728.0', 1, '2018-09-15', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1596, '1508.0', 1, '2018-04-05', 47, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1597, '6364.0', 1, '2018-12-11', 34, 4, 5, 0, 2800, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1598, '3363.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1599, '4559.0', 1, '2018-09-18', 37, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1600, '2738.0', 1, '2018-06-11', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1601, '5641.0', 1, '2018-11-17', 37, 4, 5, 1, 51327.5, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1602, '6232.0', 1, '2018-04-03', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1603, '13130.0', 1, '2018-07-21', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1604, '13400.0', 1, '2018-07-25', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1605, '2548.0', 1, '2018-05-30', 63, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1606, '4075.0', 1, '2018-08-16', 50, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1607, '11015.0', 1, '2018-06-13', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1608, '1485.0', 1, '2018-01-23', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1609, '1505.0', 1, '2018-04-05', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1610, '998.0', 1, '2018-03-12', 36, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1611, '4016.0', 1, '2018-08-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1612, '22923.0', 1, '2018-11-26', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1613, '10598.0', 1, '2018-06-07', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1614, '8744.0', 1, '2018-05-10', 43, 6, 4, 1, 12652.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1615, '3655.0', 1, '2018-07-29', 46, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1616, '16631.0', 1, '2018-09-13', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1617, '11895.0', 1, '2018-06-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1618, '3735.0', 1, '2018-08-01', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1619, '3993.0', 1, '2018-08-14', 34, 6, 5, 1, 12845, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1620, '5943.0', 1, '2018-03-29', 63, 6, 6, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1621, '5682.0', 1, '2018-03-26', 49, 6, 4, 1, 31605, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1622, '2019.0', 1, '2018-04-03', 47, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1623, '13047.0', 1, '2018-07-19', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1624, '3719.0', 1, '2018-02-24', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1625, '2022.0', 1, '2018-01-30', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1626, '13616.0', 1, '2018-07-28', 58, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1627, '709.0', 1, '2018-02-24', 36, 6, 5, 1, 0, 0, 17.5, '2019-01-23', '2019-01-01', ''),
(1628, '364.0', 1, '2018-01-30', 37, 6, 5, 1, 4882.5, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1629, '1087.0', 1, '2018-01-18', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1630, '1232.0', 1, '2018-03-24', 47, 6, 5, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1631, '24935.0', 1, '2018-12-22', 43, 6, 6, 1, 14227.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1632, '5570.0', 1, '2018-03-24', 55, 6, 4, 1, 0, 1, 17.5, '2019-02-14', '2019-01-01', ''),
(1633, '4500.0', 1, '2018-09-16', 45, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1634, '22289.0', 1, '2018-11-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1635, '2869.0', 1, '2018-02-12', 43, 6, 7, 1, 10937.5, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1636, '14700.0', 1, '2018-08-13', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1637, '4772.0', 1, '2018-09-26', 51, 4, 5, 1, 19950, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1638, '3341.0', 1, '2018-07-12', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1639, '2308.0', 1, '2018-05-19', 41, 6, 5, 1, 5250, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1640, '3368.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1641, '2404.0', 1, '2018-05-21', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1642, '15678.0', 1, '2018-08-29', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1643, '2622.0', 1, '2018-06-04', 63, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1644, '24950.0', 1, '2018-12-22', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1645, '5075.0', 1, '2018-10-13', 50, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1646, '3030.0', 1, '2018-02-04', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1647, '2807.0', 1, '2018-02-12', 40, 6, 4, 1, 22050, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1648, '3827.0', 1, '2018-08-07', 36, 4, 5, 1, 2625, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1649, '6345.0', 1, '2018-12-10', 34, 6, 5, 1, 3027.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1650, '3634.0', 1, '2018-07-29', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1651, '3510.0', 1, '2018-07-22', 34, 4, 5, 1, 4856.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1652, '20307.0', 1, '2018-10-25', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1653, '23264.0', 1, '2018-11-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1654, '5685.0', 1, '2018-03-26', 52, 6, 4, 1, 39550, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1655, '14799.0', 1, '2018-08-14', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1656, '3184.0', 1, '2018-02-17', 47, 6, 7, 1, 7288.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1657, '2983.0', 1, '2018-02-24', 40, 6, 4, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1658, '1448.0', 1, '2018-04-03', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1659, '3370.0', 1, '2018-07-14', 34, 4, 5, 0, 2975, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1660, '4765.0', 1, '2018-09-26', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1661, '15476.0', 1, '2018-08-28', 40, 6, 4, 1, 9537.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1662, '3973.0', 1, '2018-02-27', 43, 6, 7, 1, 7996.625, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1663, '4914.0', 1, '2018-03-14', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1664, '3601.0', 1, '2018-02-22', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1665, '25653.0', 1, '2018-12-30', 62, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1666, '7345.0', 1, '2018-04-21', 49, 6, 4, 1, 5267.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1667, '3200.0', 1, '2018-07-02', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1668, '24936.0', 1, '2018-12-22', 43, 6, 6, 1, 14227.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1669, '876.0', 1, '2018-01-15', 39, 6, 7, 1, 15793.75, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1670, '4841.0', 1, '2018-09-29', 50, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1671, '4463.0', 1, '2018-09-13', 47, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1672, '6605.0', 1, '2018-12-23', 34, 6, 5, 1, 3045, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1673, '20741.0', 1, '2018-10-30', 40, 4, 5, 1, 7402.5, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1674, '4374.0', 1, '2018-03-06', 45, 6, 7, 1, 0, 0, 17.5, '2019-02-03', '2019-01-01', ''),
(1675, '9457.0', 1, '2018-05-21', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1676, '2875.0', 1, '2018-06-21', 36, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1677, '3237.0', 1, '2018-07-05', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1678, '2898.0', 1, '2018-02-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1679, '5486.0', 1, '2018-10-30', 63, 6, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1680, '9914.0', 1, '2018-05-28', 61, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1681, '4486.0', 1, '2018-03-07', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1682, '2870.0', 1, '2018-02-12', 43, 6, 7, 1, 24920, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1683, '10124.0', 1, '2018-05-30', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1684, '15341.0', 1, '2018-08-27', 40, 6, 4, 1, 28612.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1685, '4287.0', 1, '2018-09-01', 46, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1686, '955.0', 1, '2018-03-08', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1687, '1180.0', 1, '2018-03-21', 41, 6, 7, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1688, '2635.0', 1, '2018-02-10', 45, 6, 6, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1689, '17289.0', 1, '2018-09-20', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1690, '4286.0', 1, '2018-09-01', 50, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1691, '1961.0', 1, '2018-04-29', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1692, '4219.0', 1, '2018-08-29', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1693, '5466.0', 1, '2018-10-30', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1694, '3284.0', 1, '2018-07-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1695, '2936.0', 1, '2018-06-24', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1696, '20666.0', 1, '2018-10-30', 64, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1697, '6774.0', 1, '2018-12-27', 34, 6, 5, 1, 3045, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1698, '10030.0', 1, '2018-05-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1699, '21758.0', 1, '2018-11-13', 43, 6, 4, 1, 14393.75, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1700, '19324.0', 1, '2018-10-16', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1701, '10215.0', 1, '2018-05-31', 48, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1702, '2829.0', 1, '2018-06-14', 63, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1703, '3285.0', 1, '2018-07-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1704, '2935.0', 1, '2018-06-24', 46, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1705, '6365.0', 1, '2018-12-11', 34, 6, 5, 1, 4882.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1706, '2005.0', 1, '2018-01-30', 41, 6, 7, 1, 13448.75, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1707, '8308.0', 1, '2018-05-05', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1708, '3958.0', 1, '2018-08-13', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1709, '13131.0', 1, '2018-07-21', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1710, '832.0', 1, '2018-01-15', 54, 6, 4, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1711, '1214.0', 1, '2018-03-22', 37, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1712, '4996.0', 1, '2018-03-15', 49, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1713, '4292.0', 1, '2018-09-01', 34, 4, 5, 1, 18033.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1714, '366.0', 1, '2018-01-30', 37, 6, 5, 1, 24412.5, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1715, '13773.0', 1, '2018-07-30', 60, 4, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1716, '19976.0', 1, '2018-10-22', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1717, '1698.0', 1, '2018-04-18', 47, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1718, '1922.0', 1, '2018-01-29', 45, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1719, '11603.0', 1, '2018-06-26', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1720, '15679.0', 1, '2018-08-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1721, '2929.0', 1, '2018-02-13', 63, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1722, '2328.0', 1, '2018-05-20', 34, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1723, '3604.0', 1, '2018-07-26', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1724, '2178.0', 1, '2018-05-12', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1725, '12731.0', 1, '2018-07-14', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1726, '9706.0', 1, '2018-05-24', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1727, '710.0', 1, '2018-02-24', 37, 6, 5, 1, 11550, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1728, '1863.0', 1, '2018-04-24', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1729, '3639.0', 1, '2018-02-22', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1730, '3011.0', 1, '2018-06-26', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1731, '2701.0', 1, '2018-06-09', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1732, '3366.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1733, '2942.0', 1, '2018-06-24', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1734, '20156.0', 1, '2018-10-24', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1735, '5560.0', 1, '2018-03-24', 48, 6, 6, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1736, '4818.0', 1, '2018-03-13', 63, 6, 6, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1737, '2697.0', 1, '2018-06-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1738, '1362.0', 1, '2018-01-22', 54, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1739, '1074.0', 1, '2018-03-15', 36, 6, 5, 1, 10937.5, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1740, '3509.0', 1, '2018-07-22', 34, 4, 5, 1, 4856.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1741, '3052.0', 1, '2018-06-27', 47, 4, 5, 1, 0, 0, 17.5, '2019-06-18', '2019-01-01', ''),
(1742, '3359.0', 1, '2018-07-14', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1743, '1851.0', 1, '2018-01-29', 60, 6, 4, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1744, '1962.0', 1, '2018-04-29', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1745, '21971.0', 1, '2018-11-15', 58, 6, 4, 1, 0, 1, 17.5, '2019-02-25', '2019-01-01', ''),
(1746, '1820.0', 1, '2018-04-23', 41, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1747, '6733.0', 1, '2018-12-27', 34, 6, 5, 1, 6632.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1748, '15343.0', 1, '2018-08-27', 40, 6, 4, 1, 16922.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1749, '3327.0', 1, '2018-07-11', 39, 6, 5, 1, 40950, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1750, '2049.0', 1, '2018-05-02', 36, 6, 5, 0, 3062.5, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1751, '12202.0', 1, '2018-07-05', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1752, '19974.0', 1, '2018-10-22', 64, 6, 4, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1753, '980.0', 1, '2018-03-11', 36, 6, 5, 1, 3062.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1754, '3007.0', 1, '2018-06-26', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1755, '796.0', 1, '2018-02-27', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1756, '3345.0', 1, '2018-02-19', 47, 6, 7, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1757, '16914.0', 1, '2018-09-17', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1758, '999.0', 1, '2018-03-12', 37, 6, 5, 1, 10325, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1759, '713.0', 1, '2018-02-24', 37, 6, 5, 1, 6475, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1760, '7948.0', 1, '2018-04-29', 43, 6, 6, 1, 12652.5, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1761, '15704.0', 1, '2018-08-30', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1762, '11601.0', 1, '2018-06-26', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1763, '15703.0', 1, '2018-08-30', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1764, '13905.0', 1, '2018-07-31', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1765, '5803.0', 1, '2018-11-15', 47, 4, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1766, '6780.0', 1, '2018-12-27', 50, 6, 5, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1767, '211.0', 1, '2018-01-06', 36, 6, 4, 1, 3937.5, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1768, '1171.0', 1, '2018-03-21', 36, 6, 5, 1, 15750, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1769, '3144.0', 1, '2018-06-28', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1770, '5216.0', 1, '2018-03-19', 40, 6, 4, 1, 7183.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1771, '12516.0', 1, '2018-07-10', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1772, '17679.0', 1, '2018-09-25', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1773, '3750.0', 1, '2018-08-01', 34, 4, 5, 1, 8802.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1774, '4166.0', 1, '2018-08-28', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1775, '10217.0', 1, '2018-05-31', 40, 6, 4, 1, 17990, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1776, '24751.0', 1, '2018-12-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1777, '3015.0', 1, '2018-06-26', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1778, '4499.0', 1, '2018-09-16', 41, 4, 5, 1, 15750, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1779, '1737.0', 1, '2018-04-21', 45, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1780, '8462.0', 1, '2018-05-07', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1781, '3622.0', 1, '2018-07-28', 36, 4, 5, 1, 4375, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1782, '4954.0', 1, '2018-03-15', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1783, '935.0', 1, '2018-03-07', 47, 6, 5, 1, 8365, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1784, '4377.0', 1, '2018-09-08', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1785, '6455.0', 1, '2018-12-16', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1786, '3010.0', 1, '2018-06-26', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1787, '4241.0', 1, '2018-08-30', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1788, '17853.0', 1, '2018-09-26', 40, 6, 4, 1, 9572.5, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1789, '21848.0', 1, '2018-09-20', 40, 6, 4, 1, 9572.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1790, '4953.0', 1, '2018-03-15', 40, 6, 4, 1, 16913.75, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1791, '15099.0', 1, '2018-08-18', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1792, '3475.0', 1, '2018-07-19', 36, 4, 5, 1, 2625, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1793, '16632.0', 1, '2018-09-13', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1794, '3454.0', 1, '2018-07-18', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1795, '1242.0', 1, '2018-03-25', 36, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1796, '11188.0', 1, '2018-06-20', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1797, '6393.0', 1, '2018-04-05', 63, 6, 6, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1798, '2175.0', 1, '2018-05-12', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1799, '4575.0', 1, '2018-09-18', 37, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1800, '4105.0', 1, '2018-03-01', 40, 6, 4, 1, 9730, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1801, '20738.0', 1, '2018-10-30', 40, 4, 5, 1, 26547.5, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1802, '3140.0', 1, '2018-02-17', 40, 6, 4, 1, 0, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1803, '18072.0', 1, '2018-09-29', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1804, '25502.0', 1, '2018-12-29', 64, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1805, '17293.0', 1, '2018-09-20', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1806, '23048.0', 1, '2018-11-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1807, '226.0', 1, '2018-01-22', 37, 6, 5, 1, 27728.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1808, '6682.0', 1, '2018-12-25', 34, 4, 5, 1, 6632.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1809, '2003.0', 1, '2018-01-30', 47, 6, 7, 1, 9467.5, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1810, '5463.0', 1, '2018-10-30', 34, 4, 5, 1, 4882.5, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1811, '3014.0', 1, '2018-06-26', 34, 6, 5, 1, 0, 0, 17.5, '2019-06-20', '2019-01-01', ''),
(1812, '15813.0', 1, '2018-08-30', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1813, '14691.0', 1, '2018-08-13', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1814, '11873.0', 1, '2018-06-28', 40, 6, 4, 1, 4663.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1815, '6366.0', 1, '2018-12-11', 45, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1816, '18713.0', 1, '2018-10-09', 40, 6, 4, 1, 57435, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1817, '3187.0', 1, '2018-07-02', 63, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1818, '16505.0', 1, '2018-09-12', 43, 6, 6, 1, 14343, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1819, '6771.0', 1, '2018-12-27', 34, 6, 5, 1, 3045, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1820, '5981.0', 1, '2018-02-06', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(1821, '24884.0', 1, '2018-12-20', 60, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1822, '16305.0', 1, '2018-09-09', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1823, '4283.0', 1, '2018-09-01', 34, 6, 5, 1, 18033.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1824, '3732.0', 1, '2018-08-01', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1825, '2938.0', 1, '2018-06-24', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1826, '17827.0', 1, '2018-09-26', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1827, '7924.0', 1, '2018-04-29', 40, 6, 4, 1, 7183.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1828, '22072.0', 1, '2018-11-17', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1829, '9455.0', 1, '2018-05-21', 38, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1830, '9588.0', 1, '2018-05-23', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1831, '12525.0', 1, '2018-07-10', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1832, '2695.0', 1, '2018-06-09', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1833, '3814.0', 1, '2018-02-25', 34, 6, 7, 1, 13492.5, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1834, '1382.0', 1, '2018-01-22', 63, 6, 6, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1835, '17292.0', 1, '2018-09-20', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1836, '20668.0', 1, '2018-10-30', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1837, '5683.0', 1, '2018-03-26', 49, 6, 4, 1, 5267.5, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1838, '23047.0', 1, '2018-11-27', 38, 6, 4, 1, 0, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1839, '17426.0', 1, '2018-09-22', 54, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1840, '1896.0', 1, '2018-04-26', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1841, '1315.0', 1, '2018-03-27', 45, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1842, '5540.0', 1, '2018-11-01', 34, 4, 5, 1, 48475, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1843, '15702.0', 1, '2018-08-30', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1844, '17393.0', 1, '2018-09-20', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1845, '4122.0', 1, '2018-03-01', 39, 6, 7, 1, 14490, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1846, '1166.0', 1, '2018-01-20', 34, 6, 7, 1, 18579.75, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1847, '3723.0', 1, '2018-02-24', 43, 6, 7, 1, 0, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1848, '7576.0', 1, '2018-04-23', 49, 6, 4, 1, 21070, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1849, '4446.0', 1, '2018-09-12', 63, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1850, '1695.0', 1, '2018-04-18', 37, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1851, '3620.0', 1, '2018-07-28', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1852, '20670.0', 1, '2018-10-30', 44, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1853, '11081.0', 1, '2018-06-19', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1854, '4161.0', 1, '2018-08-28', 51, 4, 5, 1, 9721.25, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1855, '15812.0', 1, '2018-08-30', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1856, '3365.0', 1, '2018-07-14', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1857, '4011.0', 1, '2018-08-14', 34, 6, 5, 1, 12845, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1858, '1445.0', 1, '2018-04-03', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1859, '11541.0', 1, '2018-06-25', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1860, '9363.0', 1, '2018-05-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1861, '5769.0', 1, '2018-03-27', 40, 6, 4, 1, 7183.75, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1862, '3172.0', 1, '2018-02-17', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1863, '3009.0', 1, '2018-06-26', 41, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1864, '979.0', 1, '2018-03-11', 47, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1865, '21977.0', 1, '2018-11-15', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1866, '5706.0', 1, '2018-11-11', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1867, '2570.0', 1, '2018-02-08', 45, 6, 6, 1, 0, 0, 17.5, '2019-01-10', '2019-01-01', ''),
(1868, '4010.0', 1, '2018-08-14', 34, 4, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1869, '6646.0', 1, '2018-12-24', 50, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1870, '14699.0', 1, '2018-08-13', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1871, '5823.0', 1, '2018-11-17', 34, 4, 5, 1, 3027.5, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1872, '4160.0', 1, '2018-08-28', 51, 6, 5, 1, 9948.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1873, '25119.0', 1, '2018-12-24', 38, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1874, '22835.0', 1, '2018-11-25', 40, 6, 4, 1, 16975, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1875, '2291.0', 1, '2018-05-17', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1876, '7989.0', 1, '2018-04-29', 58, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1877, '4439.0', 1, '2018-09-12', 45, 4, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1878, '2694.0', 1, '2018-06-09', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1879, '6579.0', 1, '2018-12-02', 45, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1880, '3561.0', 1, '2018-07-25', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1881, '25034.0', 1, '2018-12-23', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1882, '2176.0', 1, '2018-05-12', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1883, '5957.0', 1, '2018-03-29', 49, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1884, '20523.0', 1, '2018-10-29', 40, 4, 5, 1, 19145, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1885, '6281.0', 1, '2018-12-06', 34, 6, 5, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1886, '21476.0', 1, '2018-04-22', 35, 6, 4, 1, 11900, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1887, '3039.0', 1, '2018-02-14', 45, 6, 6, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1888, '799.0', 1, '2018-02-27', 36, 6, 5, 1, 3062.5, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1889, '1832.0', 1, '2018-04-23', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1890, '3905.0', 1, '2018-08-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1891, '5828.0', 1, '2018-11-17', 37, 4, 5, 1, 32996.25, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1892, '11082.0', 1, '2018-06-19', 43, 6, 6, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1893, '3982.0', 1, '2018-02-27', 43, 6, 7, 1, 7996.625, 0, 17.5, '2019-01-16', '2019-01-01', ''),
(1894, '11016.0', 1, '2018-06-13', 40, 6, 4, 1, 9905, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1895, '17826.0', 1, '2018-09-26', 64, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1896, '16304.0', 1, '2018-09-09', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1897, '3812.0', 1, '2018-02-25', 34, 6, 7, 1, 4497.5, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1898, '24750.0', 1, '2018-12-19', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1899, '24963.0', 1, '2018-12-22', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1900, '3500.0', 1, '2018-07-22', 34, 4, 5, 1, 2975, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1901, '1860.0', 1, '2018-04-24', 34, 6, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1902, '10934.0', 1, '2018-06-12', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1903, '2051.0', 1, '2018-05-20', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1904, '20831.0', 1, '2018-10-31', 54, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1905, '24460.0', 1, '2018-12-17', 54, 6, 4, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1906, '13206.0', 1, '2018-07-22', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1907, '6628.0', 1, '2018-12-23', 34, 4, 5, 1, 4891.25, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1908, '3397.0', 1, '2018-07-15', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1909, '3704.0', 1, '2018-02-24', 58, 6, 4, 1, 0, 1, 17.5, '2019-01-14', '2019-01-01', ''),
(1910, '3282.0', 1, '2018-07-09', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1911, '430.0', 1, '2018-02-05', 37, 6, 5, 1, 27728.75, 0, 17.5, '2019-01-20', '2019-01-01', ''),
(1912, '13035.0', 1, '2018-07-19', 43, 6, 4, 1, 9816.625, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1913, '3191.0', 1, '2018-07-02', 36, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1914, '13510.0', 1, '2018-07-26', 43, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1915, '4325.0', 1, '2018-09-04', 36, 4, 5, 1, 7000, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1916, '4138.0', 1, '2018-08-27', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1917, '1490.0', 1, '2018-01-23', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-04', '2019-01-01', ''),
(1918, '2702.0', 1, '2018-06-09', 34, 6, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1919, '3906.0', 1, '2018-08-09', 34, 6, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1920, '19862.0', 1, '2018-10-21', 60, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1921, '2877.0', 1, '2018-06-21', 36, 4, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1922, '17288.0', 1, '2018-09-20', 48, 6, 6, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1923, '18075.0', 1, '2018-09-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1924, '2804.0', 1, '2018-06-13', 36, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1925, '2018.0', 1, '2018-04-30', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-07', '2019-01-01', ''),
(1926, '20306.0', 1, '2018-10-25', 58, 6, 6, 1, 0, 1, 17.5, '2019-02-20', '2019-01-01', ''),
(1927, '4125.0', 1, '2018-08-26', 34, 6, 5, 1, 18348.75, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1928, '22814.0', 1, '2018-11-25', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1929, '6854.0', 1, '2018-04-15', 49, 6, 4, 1, 5267.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1930, '2008.0', 1, '2018-01-30', 47, 6, 7, 1, 0, 0, 17.5, '2018-12-27', '2019-01-01', ''),
(1931, '6700.0', 1, '2018-12-26', 34, 4, 5, 1, 4593.75, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1932, '11017.0', 1, '2018-06-13', 40, 6, 4, 1, 5477.5, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1933, '17053.0', 1, '2018-09-18', 40, 6, 4, 1, 9537.5, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1934, '6676.0', 1, '2018-12-25', 34, 6, 5, 1, 6615, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1935, '22924.0', 1, '2018-11-26', 54, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1936, '9910.0', 1, '2018-05-28', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-14', '2019-01-01', ''),
(1937, '18073.0', 1, '2018-09-29', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1938, '5719.0', 1, '2018-11-12', 47, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1939, '4093.0', 1, '2018-08-16', 36, 4, 5, 1, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1940, '24232.0', 1, '2018-12-13', 60, 6, 4, 1, 0, 0, 17.5, '2019-04-24', '2019-01-01', ''),
(1941, '1751.0', 1, '2018-01-28', 49, 6, 4, 1, 52150, 0, 17.5, '2018-12-04', '2019-01-01', '');
INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `nolon`, `manifesto`, `usdToEgp`, `submitDate`, `accrualDate`, `notes`) VALUES
(1942, '12515.0', 1, '2018-07-10', 40, 6, 4, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1943, '6405.0', 1, '2018-12-12', 45, 6, 5, 1, 0, 0, 17.5, '2019-06-16', '2019-01-01', ''),
(1944, '3508.0', 1, '2018-07-22', 34, 4, 5, 1, 4856.25, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1945, '2366.0', 1, '2018-05-21', 45, 4, 5, 0, 0, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1946, '9824.0', 1, '2018-05-27', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1947, '1378.0', 1, '2018-03-29', 45, 6, 5, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1948, '3051.0', 1, '2018-06-27', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-20', '2019-01-01', ''),
(1949, '16915.0', 1, '2018-09-17', 53, 6, 4, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1950, '2599.0', 1, '2018-06-02', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-24', '2019-01-01', ''),
(1951, '2837.0', 1, '2018-06-02', 37, 4, 5, 1, 0, 0, 17.5, '2019-02-17', '2019-01-01', ''),
(1952, '365.0', 1, '2018-01-30', 37, 6, 5, 1, 8198.75, 0, 17.5, '2019-01-14', '2019-01-01', ''),
(1953, '4444.0', 1, '2018-09-12', 36, 4, 5, 1, 0, 0, 17.5, '2019-04-30', '2019-01-01', ''),
(1954, '5819.0', 1, '2018-11-17', 41, 6, 5, 1, 24535, 0, 17.5, '2019-05-09', '2019-01-01', ''),
(1955, '4357.0', 1, '2018-09-06', 47, 4, 5, 1, 0, 0, 17.5, '2019-02-25', '2019-01-01', ''),
(1956, '24720.0', 1, '2018-12-19', 43, 6, 6, 1, 28796.25, 0, 17.5, '2019-01-01', '2019-01-01', ''),
(1957, '5465.0', 1, '2018-10-30', 34, 4, 5, 1, 0, 0, 17.5, '2019-05-22', '2019-01-01', ''),
(1958, '9456.0', 1, '2018-05-21', 54, 6, 4, 1, 0, 0, 17.5, '2019-02-11', '2019-01-01', ''),
(1959, '24719.0', 1, '2018-12-19', 58, 6, 6, 1, 0, 1, 17.5, '2019-01-01', '2019-01-01', ''),
(1960, '45646', 3, '2019-09-10', 37, 6, 5, 0, 0, 1, 17, NULL, NULL, ''),
(1961, 'fgdfg', 3, '2018-09-11', 34, 4, 5, 0, 0, 1, 17, NULL, NULL, ''),
(1962, 'jdjkjj', 3, '2019-09-05', 39, 8, 8, 0, 0, 0, 17, NULL, NULL, ''),
(1964, '363', 3, '2019-09-11', 55, 4, 5, 0, 0, 1, 17, NULL, NULL, ''),
(1965, '2543254', 3, '2019-09-10', 35, 4, 5, 1, 550, 0, 10, NULL, NULL, '123'),
(1966, '54', 54, '2019-09-09', 54, 54, 64, 1, 1, 1, 54545, '2019-09-11', NULL, ''),
(1968, 'cvb', 3, '2019-09-10', 37, 6, 5, 0, 0, 1, 17, NULL, NULL, 'vbcxbvxcvbxcv'),
(1969, '88585jndmd', 3, '2019-09-05', 44, 5, 7, 1, 0, 0, 30, NULL, NULL, '123'),
(1970, '254553254', 3, '2019-09-10', 35, 4, 5, 1, 550, 0, 10, NULL, NULL, '13'),
(1971, '27754553254', 3, '2019-09-10', 35, 4, 5, 1, 550, 0, 10, NULL, NULL, '5555555555678'),
(1972, '5545jdjkjj', 3, '2019-09-05', 39, 8, 8, 0, 0, 0, 17, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `fileno`
--

DROP TABLE IF EXISTS `fileno`;
CREATE TABLE IF NOT EXISTS `fileno` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `company` int(11) NOT NULL,
  `dat` date NOT NULL,
  `exportCertificate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fileno`
--

INSERT INTO `fileno` (`id`, `num`, `company`, `dat`, `exportCertificate`) VALUES
(5, '208526', 1, '2018-03-19', 615),
(6, '33226', 1, '2018-10-10', 793),
(7, '34373', 1, '2018-11-25', 402),
(8, '109532', 1, '2019-04-10', 727),
(9, '47553', 1, '2019-02-06', 477),
(10, '49773', 1, '2019-02-12', 522),
(11, '25610/25098', 1, '2018-07-11', 591),
(12, '42311', 1, '2018-11-14', 958),
(13, '42349', 1, '2019-01-22', 694),
(14, '16605/116449', 1, '2019-03-20', 671),
(15, '5848', 1, '2018-03-19', 417),
(16, '49730', 1, '2019-02-19', 592),
(17, '28332', 1, '2018-03-19', 636),
(18, '47557', 1, '2019-02-06', 335),
(19, '7828', 1, '2018-03-19', 721),
(20, '42331', 1, '2018-12-11', 622),
(21, '28337', 1, '2018-03-19', 551),
(22, '99490', 1, '2019-03-20', 599),
(23, '25586', 1, '2018-07-25', 446),
(24, '49805/49757', 1, '2019-01-16', 516),
(25, '49764', 1, '2019-02-06', 401),
(26, '42348', 1, '2019-01-22', 489),
(27, '49733', 1, '2019-02-19', 419),
(28, '49796/49748', 1, '2019-01-16', 506),
(29, '99465', 1, '2019-04-03', 433),
(30, '34370', 1, '2018-11-25', 766),
(31, '34313', 1, '2018-11-11', 340),
(32, '49783', 1, '2019-01-16', 729),
(33, '33174', 1, '2018-10-10', 371),
(34, '7812', 1, '2018-07-25', 536),
(35, '20103/21064', 1, '2018-03-19', 589),
(36, '118797', 1, '2018-11-14', 352),
(37, '49765', 1, '2019-02-06', 401),
(38, '109545', 1, '2019-03-20', 464),
(39, '47551', 1, '2019-02-06', 489),
(40, '49662', 1, '2019-02-18', 482),
(41, '21093/21054', 1, '2018-03-19', 495),
(42, '34322', 1, '2018-11-14', 510),
(43, '99513', 1, '2019-03-20', 533),
(44, '49713', 1, '2019-02-19', 719),
(45, '193575', 1, '2018-03-19', 737),
(46, '33126', 1, '2018-07-11', 485),
(47, '25621/25109', 1, '2018-11-14', 568),
(48, ' من احمد نبيل ', 1, '2018-11-14', 449),
(49, '42323', 1, '2018-12-20', 751),
(50, '193526', 1, '2018-03-19', 584),
(51, '42322', 1, '2018-12-20', 335),
(52, '42351', 1, '2019-01-22', 316),
(53, '33143', 1, '2018-07-25', 469),
(54, '7826', 1, '2018-07-11', 505),
(55, '47592', 1, '2019-02-06', 361),
(56, '49784', 1, '2019-01-16', 729),
(57, '9548', 1, '2018-07-11', 617),
(58, '20107/20168', 1, '2018-07-11', 580),
(59, '42312', 1, '2018-11-14', 449),
(60, '42325', 1, '2019-01-22', 596),
(61, '42304', 1, '2018-10-10', 618),
(62, '47555', 1, '2019-02-12', 830),
(63, '49795', 1, '2019-02-19', 435),
(64, '28334', 1, '2018-10-10', 394),
(65, '42359', 1, '2019-01-27', 784),
(66, '28350', 1, '2018-07-11', 321),
(67, '28272', 1, '2018-11-14', 349),
(68, '99509', 1, '2019-03-20', 594),
(69, '49775', 1, '2019-02-12', 357),
(70, '25591', 1, '2018-07-16', 342),
(71, '193533', 1, '2018-03-19', 547),
(72, '25594', 1, '2018-07-25', 632),
(73, 'منزليه', 1, '2018-03-19', 551),
(74, '33183', 1, '2018-10-10', 507),
(75, '21097/21058', 1, '2018-03-19', 534),
(76, '9527', 1, '2018-03-19', 792),
(77, '47614', 1, '2019-01-16', 407),
(78, '47575', 1, '2019-01-16', 468),
(79, '16603/16447', 1, '2018-11-14', 352),
(80, '42303', 1, '2018-11-14', 526),
(81, '49761', 1, '2019-02-12', 548),
(82, '104581', 1, '2019-02-12', 592),
(83, '47550', 1, '2019-02-12', 710),
(84, 'جمرك', 1, '2018-11-14', 418),
(85, '34363', 1, '2018-11-29', 642),
(86, '33128', 1, '2018-07-11', 528),
(87, '42300', 1, '2018-11-05', 368),
(88, '28351', 1, '2018-07-11', 578),
(89, '99507', 1, '2019-03-20', 327),
(90, '11578', 1, '2018-07-25', 730),
(91, '49726', 1, '2019-02-19', 493),
(92, '99481', 1, '2019-03-20', 527),
(93, ' من احمد نبيل ', 1, '2018-11-14', 501),
(94, '208509', 1, '2018-03-19', 367),
(95, '28339', 1, '2018-03-19', 344),
(96, '104571', 1, '2019-04-10', 531),
(97, ' من احمد نبيل ', 1, '2018-11-14', 418),
(98, '21091/21052', 1, '2018-03-19', 417),
(99, '193551', 1, '2018-03-19', 398),
(100, '47605', 1, '2019-02-12', 492),
(101, '28314', 1, '2018-07-16', 480),
(102, '208522', 1, '2018-03-19', 713),
(103, '25608/25096', 1, '2018-07-11', 715),
(104, '42315', 1, '2019-01-16', 539),
(105, '47563', 1, '2019-02-06', 496),
(106, '47552', 1, '2019-02-06', 457),
(107, '16588/116432', 1, '2019-03-20', 452),
(108, '49732', 1, '2019-02-19', 761),
(109, '49743', 1, '2019-02-19', 679),
(110, '33147', 1, '2018-07-16', 663),
(111, '33223', 1, '2019-01-16', 739),
(112, '99468', 1, '2019-04-03', 698),
(113, '33194', 1, '2018-09-12', 321),
(114, '47602', 1, '2019-02-12', 420),
(115, '47587', 1, '2019-02-12', 351),
(116, '33150', 1, '2018-07-11', 838),
(117, '33219', 1, '2018-11-14', 743),
(118, 'منزليه', 1, '2018-07-11', 690),
(119, '99510', 1, '2019-03-20', 594),
(120, '49700', 1, '2019-02-18', 448),
(121, '49780', 1, '2018-11-14', 383),
(122, '42336', 1, '2018-12-11', 415),
(123, '33136', 1, '2018-07-11', 688),
(124, '104588', 1, '2019-03-20', 795),
(125, '208520', 1, '2018-03-19', 772),
(126, '25602', 1, '2018-10-10', 618),
(127, '47541', 1, '2019-02-12', 365),
(128, ' من احمد نبيل ', 1, '2019-01-16', 746),
(129, '33160', 1, '2018-11-14', 676),
(130, '49714', 1, '2019-02-19', 719),
(131, '49789', 1, '2019-01-16', 739),
(132, '33224', 1, '2019-01-22', 434),
(133, '28304', 1, '2018-09-16', 722),
(134, '47578', 1, '2019-02-06', 503),
(135, '25624/25112', 1, '2018-11-14', 329),
(136, '99047', 1, '2019-02-19', 588),
(137, '116513', 1, '2019-03-20', 559),
(138, '49699', 1, '2019-02-18', 451),
(139, 'جمرك بصمه', 1, '2019-03-20', 473),
(140, '28348', 1, '2018-07-11', 692),
(141, '49731', 1, '2019-02-19', 821),
(142, '42333', 1, '2018-12-11', 403),
(143, '42334', 1, '2018-12-11', 721),
(144, '47554', 1, '2019-02-10', 770),
(145, '49734', 1, '2019-02-19', 734),
(146, '47603', 1, '2019-02-12', 604),
(147, '34364', 1, '2018-11-29', 642),
(148, '42358', 1, '2019-01-27', 491),
(149, '21094/21055', 1, '2018-03-19', 582),
(150, '33204', 1, '2018-11-14', 334),
(151, '25590', 1, '2018-07-16', 900),
(152, '49786', 1, '2019-01-16', 736),
(153, '47604', 1, '2019-02-12', 485),
(154, '34317', 1, '2018-11-11', 689),
(155, '33187', 1, '2018-07-16', 637),
(156, '28330', 1, '2018-07-25', 465),
(157, 'جمرك', 1, '2019-01-16', 501),
(158, '208512', 1, '2018-03-19', 646),
(159, '208527', 1, '2018-03-19', 508),
(160, '193555', 1, '2018-03-19', 563),
(161, '49800/49752', 1, '2018-11-05', 431),
(162, '34360', 1, '2018-11-05', 714),
(163, ' من احمد نبيل ', 1, '2018-11-14', 563),
(164, '104564', 1, '2019-04-10', 727),
(165, '33228', 1, '2018-11-14', 378),
(166, '47580', 1, '2019-02-06', 489),
(167, '193554', 1, '2018-03-19', 342),
(168, '25600', 1, '2018-11-14', 602),
(169, '47619', 1, '2019-02-12', 635),
(170, '99052', 1, '2019-03-20', 403),
(171, '33139', 1, '2018-07-25', 440),
(172, '25613/25101', 1, '2018-07-11', 369),
(173, '99505', 1, '2019-03-20', 847),
(174, '193580/193564', 1, '2018-03-19', 330),
(175, '25627/25115', 1, '2018-07-25', 469),
(176, '20102/21063', 1, '2018-03-19', 501),
(177, '28315', 1, '2018-07-16', 480),
(178, '49787', 1, '2019-01-16', 506),
(179, '7824', 1, '2018-07-11', 386),
(180, '193541', 1, '2018-07-11', 664),
(181, '33225', 1, '2019-01-22', 437),
(182, ' من احمد نبيل ', 1, '2019-01-16', 434),
(183, '99467', 1, '2019-04-03', 823),
(184, '104579', 1, '2019-04-03', 350),
(185, '33125', 1, '2018-07-11', 759),
(186, '208528', 1, '2018-03-19', 631),
(187, '49739', 1, '2019-02-19', 525),
(188, '42328', 1, '2018-11-25', 481),
(189, '193574', 1, '2018-07-11', 395),
(190, '193527', 1, '2018-03-19', 508),
(191, '28282', 1, '2018-07-11', 385),
(192, '33206', 1, '2018-11-14', 334),
(193, '49718', 1, '2019-02-19', 660),
(194, '33234', 1, '2019-01-16', 736),
(195, '99482', 1, '2019-03-20', 748),
(196, '42316', 1, '2019-01-16', 526),
(197, '99462', 1, '2019-04-03', 328),
(198, '42369', 1, '2018-07-25', 465),
(199, '9529', 1, '2018-07-11', 321),
(200, '34326', 1, '2019-01-16', 648),
(201, '7825', 1, '2018-07-11', 386),
(202, '42365', 1, '2019-01-27', 784),
(203, '49692', 1, '2019-02-18', 459),
(204, '20104/21065', 1, '2018-03-19', 560),
(205, '34321', 1, '2018-11-14', 729),
(206, '104585', 1, '2019-03-20', 672),
(207, '49674', 1, '2019-02-18', 325),
(208, '109539', 1, '2019-03-20', 782),
(209, '49746', 1, '2019-02-19', 644),
(210, '7811', 1, '2018-07-25', 463),
(211, '47570', 1, '2019-02-06', 364),
(212, '34338', 1, '2018-12-20', 684),
(213, '9524', 1, '2018-07-25', 536),
(214, '33172', 1, '2018-10-10', 816),
(215, '42367', 1, '2019-01-27', 784),
(216, '104576', 1, '2019-04-10', 697),
(217, '28277', 1, '2018-11-14', 428),
(218, '208528', 1, '2018-03-19', 320),
(219, '25625/25113', 1, '2018-07-11', 608),
(220, '42313', 1, '2019-01-16', 683),
(221, '25620/25108', 1, '2018-07-25', 427),
(222, 'جمرك', 1, '2019-01-16', 590),
(223, '28308', 1, '2019-01-22', 397),
(224, '99448', 1, '2019-03-20', 656),
(225, '7806', 1, '2018-07-25', 536),
(226, '33134', 1, '2018-11-14', 593),
(227, '49704', 1, '2019-02-18', 491),
(228, '42363', 1, '2018-12-20', 611),
(229, '34367', 1, '2018-11-29', 596),
(230, '109534', 1, '2019-04-03', 486),
(231, '49722', 1, '2019-02-19', 419),
(232, 'جمرك', 1, '2018-07-16', 322),
(233, '99497', 1, '2019-03-20', 369),
(234, '49677', 1, '2019-02-18', 424),
(235, '34316', 1, '2018-11-11', 658),
(236, '104582', 1, '2019-03-20', 820),
(237, '99502', 1, '2019-03-20', 447),
(238, '47581', 1, '2019-02-06', 457),
(239, '99480', 1, '2019-03-20', 559),
(240, '104568', 1, '2019-04-10', 778),
(241, '47599', 1, '2019-02-06', 555),
(242, '33144', 1, '2018-07-25', 469),
(243, '34329', 1, '2018-11-05', 522),
(244, '33161', 1, '2018-11-14', 717),
(245, '33156', 1, '2018-07-16', 343),
(246, '11583', 1, '2018-07-25', 412),
(247, '33176', 1, '2018-07-16', 453),
(248, '47621', 1, '2019-02-06', 364),
(249, '104595', 1, '2019-03-20', 408),
(250, '34343', 1, '2019-01-30', 607),
(251, '28341', 1, '2018-03-19', 482),
(252, '25595', 1, '2018-07-25', 423),
(253, '7808', 1, '2018-07-25', 463),
(254, '49721', 1, '2019-02-19', 337),
(255, '9539', 1, '2018-07-11', 610),
(256, 'مطلوب باقي البوليصه', 1, '2018-07-11', 559),
(257, '47588', 1, '2019-02-12', 457),
(258, '33137', 1, '2018-07-25', 553),
(259, '33162', 1, '2018-11-14', 593),
(260, '193531', 1, '2018-03-19', 800),
(261, '193534', 1, '2018-03-19', 713),
(262, '49680', 1, '2019-02-18', 804),
(263, '47606', 1, '2019-02-12', 477),
(264, '7813', 1, '2018-03-19', 613),
(265, '118795', 1, '2018-11-14', 659),
(266, '42308', 1, '2018-11-14', 352),
(267, '33197', 1, '2018-07-16', 519),
(268, '49720', 1, '2019-02-19', 775),
(269, '99493', 1, '2019-03-20', 532),
(270, ' من احمد نبيل ', 1, '2019-01-16', 332),
(271, '28316', 1, '2018-07-16', 480),
(272, '28309', 1, '2018-10-10', 816),
(273, '42318', 1, '2019-01-16', 377),
(274, '47545', 1, '2019-02-12', 368),
(275, '49725', 1, '2019-02-19', 817),
(276, '165956/116440', 1, '2019-02-12', 704),
(277, '2544', 3, '2019-10-08', 1965),
(278, '254447', 3, '2019-10-09', 1970);

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
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `num`, `client`, `exportCertificate`, `performa`, `systemRef`, `bankReciete`) VALUES
(8, '3649112705', 206, 1054, '3870014216', '2601441715', 0),
(9, '3649115404/', 189, 1261, '3870014829', '2601457721', 0),
(10, '3649112410', 200, 1484, '1601347007', '2601440429', 0),
(11, '3649130983', 206, 997, '3870017422', '2601560164', 0),
(12, '3649107290', 224, 1947, '3870013212', '2601397518/4513907000', 0),
(13, '3649106948', 184, 1049, '3870013087', '2601395984/4514113456', 0),
(14, '3649120968/3649120967', 207, 1076, '3870015875/387001576', '2601496785/2601489482', 0),
(15, '3649118731', 206, 1855, '3870015571', '2601485289', 0),
(16, '3649110238', 224, 915, '3870013673', '2601422343', 0),
(17, '3649118602', 184, 1378, '3870015553', '2601483293', 0),
(18, '3649108504/3870013395', 191, 1206, '2601400472', '4513915271', 0),
(19, '3649117291', 206, 1813, '3870015161', '2601473261', 0),
(20, '3649120975', 206, 1788, '3870015912', '2601491234', 0),
(21, '3649130119', 196, 1959, '3870017217', '2601555511', 0),
(22, '3649127827', 186, 1304, '3870016894', '2601538024', 0),
(23, '3649110938', 199, 1860, '3870013864', '2601429108', 0),
(24, '3649107017', 187, 1654, '3870013107', '2601389766/4513998155', 0),
(25, '3649106790/', 214, 1498, '3870013084', '2601393175/4513935483', 0),
(26, '3649123556', 206, 1920, '3870016260', '2601510913', 0),
(27, '3649104667', 184, 1217, '3870012428', '2601372862/4513930412', 0),
(28, '3649114002', 188, 1143, '3870014384', '2601443879', 0),
(29, '3649111446', 215, 1145, '3870013947', '2601431864', 0),
(30, '3649103775', 200, 1497, '2601371631', '1601290271', 0),
(31, '3649111990', 224, 1401, '3870014082', '2601436664', 0),
(32, '3649115711', 185, 1085, '2601462214', '4514756753', 0),
(33, '3649119434', 195, 1167, '3870015629', '2601486968', 0),
(34, '3649120849', 199, 1826, '3870015870', '2601498317', 0),
(35, '3649104592/3649104538', 215, 1340, '3870012359/3870012359', '2601372481/2601372595', 0),
(36, '3649107353', 195, 1520, '3870013221', '2601399882', 0),
(37, '3649107354', 215, 1334, '3870013173', '2601397989/4513921764', 0),
(38, '3649124416', 195, 1801, '3870016532', '2601520355', 0),
(39, '3649105195', 186, 945, '3870012680', '2601381655/4514045184', 0),
(40, '3649107311', 193, 1090, '3870013218', '2601398634/4513936132', 0),
(41, '3649112606', 214, 1065, '3870014159', '2601438839', 0),
(42, '3649116340/3649116341', 208, 1232, '3870015010', '2601468064/2601468205', 0),
(43, '3649112616', 200, 1731, '1601347023', '2601440456', 0),
(44, '3649114711', 184, 1404, '2601455983', '4514765446', 0),
(45, '3649111463', 206, 1726, '3870013928', '2601431217/4514448625', 0),
(46, '3649104810', 215, 1177, '3870012539', '2601378863/4513921753', 0),
(47, '3649102223/', 215, 1911, '2601360952', '4513750753', 0),
(48, '3649119995', 197, 1949, '3870015730', '2601491694', 0),
(49, '3649127902', 183, 1482, '3870016930', '2601536949', 0),
(50, '3649130117', 186, 1956, '3870017192', '2601552610', 0),
(51, '3649129560', 206, 1785, '3870017134', '2601552477', 0),
(52, '3649107420', 184, 1471, '3870013229', '2601400206/4514113456', 0),
(53, '3649104814', 214, 1344, '4513908013', '2601378844', 0),
(54, '3649108619', 199, 1293, '3870013410', '2601407032/4513923666', 0),
(55, '3649116830', 184, 1070, '2601469449', '4514785864', 0),
(56, '3649117527', 200, 1868, '2601476966', '1601375939', 0),
(57, '3870012339', 193, 1656, '2601370690', '4513913117', 0),
(58, '3649128651/3649128650', 199, 1197, '3870016994/3870016994', '2601545581/2601544920', 0),
(59, '3649126822', 206, 1337, '3870016767', '4515434903', 0),
(60, '3649108618/3870013414', 206, 1009, '2601408117', '4514028554', 0),
(61, '3649111971', 215, 1950, '3870014064', '4514448253', 0),
(62, '3649123475', 189, 943, '3870016235', '2601510910', 0),
(63, '3649118637', 206, 1022, '3870015557', '2601484504', 0),
(64, '3649126808/3649126807/3649126821/3649126820', 215, 1479, '3870016760/3870016760/', '2601535052/2601535051/2601534867/2601534866', 0),
(65, '3649110146', 207, 1728, '3870013542', '2601406078', 0),
(66, '3649117269', 188, 1419, '3870015160', '2601474888', 0),
(67, '3649118596', 206, 1761, '3870015560', '2601483172', 0),
(68, '3649107018', 191, 1837, '3870013095', '2601395092/4514113460', 0),
(69, '3649124506', 195, 1673, '3870016536', '2601519305', 0),
(70, '3649115544', 200, 1370, '1601363361', '2601461535', 0),
(71, '3649119262', 193, 1955, '3870015612', '2601481921', 0),
(72, '3649106115', 193, 1485, '3870012946', '2601389694/4514052942', 0),
(73, '3649105347', 215, 1582, '3870012714', '2601383271/4513929281', 0),
(74, '2601372859', 214, 1594, '2601372859', '4513907760', 0),
(75, '3649119842', 206, 1595, '3870015699', '2601489674', 0),
(76, '3649104813', 224, 1203, '4513907000', '2601378841', 0),
(77, '3649112814', 214, 1187, '2870014287', '2601439544', 0),
(78, '3649130557', 206, 1873, '3870017357', '2601550438', 0),
(79, '3649115426', 206, 1906, '3870014913', '2601462895', 0),
(80, '3649115444', 193, 1209, '2601554327', '4514629142', 0),
(81, '3649127711', 206, 1518, '3870016890', '2601532399', 0),
(82, '3649117146/3649117147', 193, 865, '3870015162/3649117146', '2601474299/2601474298', 0),
(83, '3649100642/3649100641', 199, 923, '3870011842/3870011840', '2601351165/2601349020', 0),
(84, '3649113271', 184, 870, '3870014385', '2601443782', 0),
(85, '3649116166', 204, 1038, '3870014995', '2601467008', 0),
(86, '3649108507/3870013357', 196, 950, '2601406810', '4514290814', 0),
(87, '3649127828', 186, 1141, '3870016895', '2601536747', 0),
(88, '3649126706', 195, 1244, '3870016748', '2601530640', 0),
(89, '3649107111', 215, 1192, '3870013121', '2601397532/45140777723', 0),
(90, '3649122269/3649122256', 220, 1645, '3870016052/3870016052', '26014506617/2601508284', 0),
(91, '3649116586', 184, 1648, '2601466370', '4514760149', 0),
(92, '3649105824', 184, 1193, '3870012832', '2601388077/4514084618', 0),
(93, '3649101015', 224, 1311, 'nan', '2601351834/4513737394', 0),
(94, '3649123477', 195, 1056, '3870016285', '2601514051', 0),
(95, '3649118582/3649118579/3649118583/3649118578/3649118577', 184, 1059, '2601480887/2601482702/2601482697/2601482696/2601482688', 'nan', 0),
(96, '3649110190', 193, 917, '3870013677', '2601416617', 0),
(97, '3649117271', 188, 1636, '3870015158', '2601474887', 0),
(98, '3649106791', 188, 1735, '3870013056', '2601395077', 0),
(99, '3649106478', 193, 1461, '3870012958', '2601387622/4514052942', 0),
(100, '3649111461', 199, 1830, '2601432675', '4513923666', 0),
(101, '3649108317', 184, 965, '2601407024', '4514285515', 0),
(102, '3649109649', 215, 1062, '2601417499', '4514283110', 0),
(103, '3870013968', 187, 875, '2601428584', '4514340384', 0),
(104, '3649101438/3649101437', 199, 1066, '3870011972/3870011971', '2601355804/2601355803', 0),
(105, '3649118150', 195, 1039, '3870015448', '2601472305', 0),
(106, '3649104596', 184, 981, '3870012484', '2601371927/4513930412', 0),
(107, '3649130038', 186, 1093, '3870017193', '2601551611', 0),
(108, '3649110282', 193, 1882, '3870013717', '2601423227', 0),
(109, '3649106044', 191, 1712, '3870012872', '2601389401/4513915271', 0),
(110, '3649130118', 189, 1898, '3870017224', '2601550439', 0),
(111, '3649123577', 189, 1510, '3870016249', '2601510901', 0),
(112, '3649105220', 195, 857, '3870012704', '2601382775/4513935640', 0),
(113, '3649112014', 195, 1775, '3870014049', '2601426569/4514208671', 0),
(114, '3649106477', 224, 1531, '2601387439', '4513935766', 0),
(115, '3649112916', 217, 1796, '3870014314', '2601441717', 0),
(116, '3649130860', 200, 1535, '1601445363', '2601560478', 0),
(117, '3649107712/3649107737', 224, 1609, '3870013263/3870013263', '2601401769/2601399228', 0),
(118, '3649110646', 184, 1577, '3870013825', '2601424544', 0),
(119, '3649108242', 184, 1207, '3870013345', '2601395090', 0),
(120, '3649111989', 222, 1517, '3870014073', '2601436617', 0),
(121, '3649100241', 214, 935, '3870011823', '2601344964/4513432755', 0),
(122, '3649112071/364911202/3649112021', 214, 892, '3870014068/3870014068/3870014068', '2601435818/260435973//2601421918', 0),
(123, '3649112748', 195, 1894, '3870014278', '2601441707/4514486311', 0),
(124, '3649101763', 184, 1002, '3870012092', '2601356261/4513699495', 0),
(125, '3649105284/3649105283/', 214, 1681, '3649105284/3649105283', '2601377624/2601379760', 0),
(126, '3649119869', 184, 1083, '3870015726', '2601491295', 0),
(127, '3649126628/3649126627', 207, 1954, '3870016724', '2601530030', 0),
(128, '3649115207', 207, 1794, '3870014830', '2601456444', 0),
(129, '3649127335', 206, 1444, '3870016833', '2601537739', 0),
(130, '3649125835', 206, 1548, '3870016605', '2601526755', 0),
(131, '3649109534', 193, 1622, '3870013551', '2601401778', 0),
(132, '3649106711', 215, 995, '3870013092', '2601390518/4514084615', 0),
(133, '3649126623', 200, 1551, '1601423075', '2601533761', 0),
(134, '3649111603', 199, 1946, '3870013993', '2601433127', 0),
(135, '3649129392', 206, 1943, '3870017104', '2601549700', 0),
(136, '3649128066', 200, 1041, '1601429825', '2601541744', 0),
(137, '3649122251', 195, 938, '3870016072', '2601509266', 0),
(138, '3649119732', 224, 1190, '3870015710', '2601491681', 0),
(139, '3649109420', 200, 1462, '1601325084', '2601413440', 0),
(140, '3649125749', 189, 1400, '3870016640', '2601526762', 0),
(141, '3649130560', 200, 1934, '1601443458', '2601558486', 0),
(142, '3649117292', 200, 1619, '1601373892', '2601474148', 0),
(143, '3649112923', 184, 1676, '3870014344', '2601441911', 0),
(144, '3649113537', 184, 1503, '3870014429', '2601436101', 0),
(145, '3649113785', 200, 1515, '1601354689', '2601449862', 0),
(146, '3649130513', 200, 1808, '1601442603', '2601557172', 0),
(147, '3649107867/364910786/3649107864', 195, 996, '3870013276/3870013276/3870013276', '2601401637/2601402175/2601401835', 0),
(148, '3649115577', 184, 1880, '2601461211', '4514765458', 0),
(149, '3649108816', 199, 1128, '3870013432', '2601407026', 0),
(150, '3649116903', 206, 908, '3870015064', '2601472920', 0),
(151, '3649109587', 200, 859, '2601414606', 'nan', 0),
(152, '3649110180', 195, 1780, '3870013671', '2601418490/4514208671', 0),
(153, '3649119596', 184, 1953, '3870015674', '2601490499', 0),
(154, '3649114677', 215, 1272, '2601456975', '4514765466', 0),
(155, '3649102664', 224, 1867, 'nan', '2601365800/453907369', 0),
(156, '3649113669', 186, 1719, '3870014420', '2601448666/4514302225', 0),
(157, '3649104693', 195, 1559, '3870012533', '2601378423/4513908437', 0),
(158, '3649110237', 224, 1798, '3870013672', '2601421306', 0),
(159, '3649114590', 224, 1198, '3870014680', '2601453553', 0),
(160, '3649131250', 183, 1327, '3870017518', '2601563585', 0),
(161, '3649111459', 193, 932, '3870013969', '2601431487', 0),
(162, '3649120132', 199, 1399, '3870015690', '2601488590', 0),
(163, '3649104477', 214, 1624, '4513908116', '2601377382', 0),
(164, '3649113535', 186, 1544, '2601447807', '4514580633', 0),
(165, '3649116299', 207, 1166, '3870014986', '2601466396', 0),
(166, '3649118615', 214, 985, '3870015566', '2601478123', 0),
(167, '3649103144/3649103121/3649103103/3649103122', 215, 1453, '2601369383/2601369384/2601369430', '4513929281', 0),
(168, '3649101276', 215, 1020, '3870011934', '2601354805/4513778083', 0),
(169, '3649123569', 183, 1716, '3870016277', '2601512804', 0),
(170, '3649114707', 206, 1831, '3870014697', '2601453654', 0),
(171, '3649116896/', 214, 1362, '3870015061', '2601471012', 0),
(172, '3649119731', 199, 1793, '3870015691', '2601490931', 0),
(173, '3649116153', 200, 1255, '1601367889', '2601466407', 0),
(174, '3649103412', 184, 975, '3870012206', '2601366405/4513929283', 0),
(175, '3649130987', 206, 1259, '3870017445', '2601552650', 0),
(176, '3649101871', 199, 1126, '3870012111', '2601358794/4513503205', 0),
(177, '3649112869/3870014339', 195, 1071, '2601438644', '4514486311', 0),
(178, '3649116293', 214, 1824, '3870015008', '2601465696', 0),
(179, '3649120711', 199, 921, '3870015855', '2601490952', 0),
(180, '3649125751', 200, 1436, '1601415812', '2601527087', 0),
(181, '3649101761', 193, 1930, '3870012023', '2601358332/4513737405', 0),
(182, '3649125456', 206, 1549, '3870016609', '2601526765', 0),
(183, '3649113637', 195, 1561, '3870014461', '2601441049/4514486311', 0),
(184, '3649100548', 193, 1175, '3870011852', '4513737405/2601344682', 0),
(185, '3649120312', 200, 1411, '1601390772', '2601494948', 0),
(186, '3649106703', 218, 1632, '3870013065', '2601394541/4514035308', 0),
(187, '3649112414', 200, 1451, '1601347104', '2601440435', 0),
(188, '3649115405', 206, 1709, '3870014838', '2601455872', 0),
(189, '3649101764', 215, 1952, '3870012070', '2601353240/4513750753', 0),
(190, '3649130354', 183, 1486, '3870017204', '2601554781', 0),
(191, '3649119581', 199, 1896, '3870015617', '2601487018', 0),
(192, '3649124404', 189, 1452, '3870016539', '2601520699', 0),
(193, '3649129509', 206, 1236, '3870017116', '2601551605', 0),
(194, '3649101681', 193, 1809, '3870012074', '2601357710/4513737405', 0),
(195, '3649119996', 198, 1757, '3870015735', '2601493774', 0),
(196, '3649129508', 199, 1021, '3870017114', '2601550440', 0),
(197, '3649126483', 200, 1107, '1601422043', '2601532008', 0),
(198, '3649105491', 188, 1483, '38700126121', '2601377346/4513939969', 0),
(199, '3649104597', 186, 1847, '3870012499', '2601377315', 0),
(200, '3649112958', 214, 1157, '3870014350', '2601443309', 0),
(201, '3649101746', 214, 1625, 'nan', '2601355368/4513737408', 0),
(202, '3649115430', 200, 1409, '2601462619', '1601364290', 0),
(203, '3649107446', 224, 1478, '3870013211', '2601399227', 0),
(204, '3649104716/3649104718', 199, 1142, '3870012524', '3870012524', 0),
(205, '3649124478/3649124426', 192, 1852, '2601515621/2601514487', '4515285821', 0),
(206, '2601368108', 224, 1887, '4513907000', 'nan', 0),
(207, '3649108921', 224, 1351, '3870013456', '2601407066', 0),
(208, '3649106952', 198, 1424, '3870013115', '2601389197/4514037721', 0),
(209, '3649127354', 206, 1402, '3870016840', '2601537634', 0),
(210, '3649109327', 191, 1246, '2601414299', '4514241511', 0),
(211, '3649131200/3649131201', 192, 1346, '2601561516/2601561360', '4515285821', 0),
(212, '3649102953', 195, 1418, '3870012158', '2601364189/4513908437', 0),
(213, '3649104689', 199, 1260, '3870012546', '2601372564/4513923671', 0),
(214, '3649127250', 200, 1552, '1601425630', '2601536567', 0),
(215, '3649114770', 184, 1908, '2601456423', '4514765496', 0),
(216, '3649130559', 200, 1335, '1601442611', '2601557220', 0),
(217, '3649101280', 215, 972, '3870011931', '2601346520/4513749185', 0),
(218, '3649118632', 183, 1843, '3870015479', '2601482544', 0),
(219, '3649127820', 206, 949, '3870016919', '2601539916', 0),
(220, '3649130338', 189, 1899, '3870017152', '2601552440', 0),
(221, '3649105715', 199, 1218, '3870012811', '2601387915/4513923665', 0),
(222, '3649107041', 214, 978, '3870013462', '2601410851/4514076765', 0),
(223, '3649099300', 184, 1767, '3870011746', '2601343251/4513699495', 0),
(224, '3649118732', 206, 1812, '3870015572', '2601484872', 0),
(225, '3649106125', 224, 1140, '3870012945', '2601367161/4513907369', 0),
(226, '3649124393', 206, 1108, '3870016529', '2601519757', 0),
(227, '3649118547', 193, 1692, '3870015526', '2601481378', 0),
(228, '3649104815', 186, 1662, '3870012540', '4513929717', 0),
(229, '3649117417', 206, 1655, '3870015216', '2601476971', 0),
(230, '3679116881', 200, 1659, '1601359740', '2601456595', 0),
(231, '3649130301', 200, 1672, '1601441275', '2601555524', 0),
(232, '3649110634', 215, 1590, '3870013742', '2601424557', 0),
(233, '3870013904', 212, 1675, '2601431485', '4513968248', 0),
(234, '3649113786', 193, 1367, '3870014549', '2601450742', 0),
(235, '3649109008', 188, 1572, '3870013446', '2601410274/4514290276', 0),
(236, '3649128074', 206, 1155, '2601532159', '4515491528', 0),
(237, '3649122765', 196, 1700, '3870016105', '2601510370', 0),
(238, '3649105468', 186, 1417, '3870012736', '2601370192/4513920714', 0),
(239, '3649106700', 224, 1425, '3870013037', '2601394408/4513936021', 0),
(240, '3649124196', 195, 991, '3870016461', '2601517427', 0),
(241, '3649114981', 224, 1396, '3870014780', '2601456564', 0),
(242, '3649112015', 199, 1591, '3870014072', '2601435968/4514224054', 0),
(243, '3649109009', 188, 1242, '3870013420', '2601409303', 0),
(244, '3649105937', 199, 1173, '3870012863', '2601388715/4513923665', 0),
(245, '3649106054', 207, 1555, '3870012853', '2601384189/4514070585', 0),
(246, '3649122198/3649122198', 195, 1816, '3870016019', '2601505489/', 0),
(247, '3649101139', 193, 1608, '3870011924', '2601351063/4513737405', 0),
(248, '3649130179', 206, 1393, '3870017234', '2601554800', 0),
(249, '2601380739', 182, 1488, '3870012591', '4513928867', 0),
(250, '3649111993', 199, 936, '3870014057', '2601435952/4514224054', 0),
(251, '3649109533', 193, 1925, '3870013545', '2601412281', 0),
(252, '3649106554', 224, 1414, '3870013004', '2601393185', 0),
(253, '3870012279', 193, 1139, '3649103433', '2601369391/4513907211', 0),
(254, '3649120065/3649120066', 195, 1212, '3870015749', '2601491306', 0),
(255, '3649130395', 198, 1587, '3870017289', '2601556308', 0),
(256, '3649116892', 206, 1045, '3870015063', '2601472251', 0),
(257, '3649110757', 193, 1875, '3870013786', '2601422833', 0),
(258, '3649125752', 204, 878, '3870016621', '2601527523', 0),
(259, '3649107295', 191, 1574, '3870013170', '2601397271/45141136460', 0),
(260, '3649103411', 214, 1721, '4513907760', '2601369348', 0),
(261, '3649110033', 199, 1707, '3870013655', '2601420963/4513923666', 0),
(262, '3649112949', 211, 1403, '3870014345', '2601443922', 0),
(263, '3649127819', 206, 1431, '3870016939', '2601539950', 0),
(264, '3649115775', 207, 1109, '3870014931', '2601464310', 0),
(265, '3649109158', 200, 933, '2601410736', 'nan', 0),
(266, '3649109725', 214, 1281, '3870013639', '2601417733/4514384836', 0),
(267, '3649112950', 200, 1754, '1601350444', '2601445428', 0),
(268, '3649108934', 184, 1112, '3870013458', '2601406522', 0),
(269, '3649119583/3649119676', 214, 1849, '3870015663/', '2601485849/2601489424', 0),
(270, '3649112815', 193, 902, '3870014296', '2601441704', 0),
(271, '3649108916', 199, 968, '3870013445', '2601410408/4513923665', 0),
(272, '3649124472', 183, 1696, '3870016482', '2601515632', 0),
(273, '3649112509', 193, 1432, '3870014183', '2601438824', 0),
(274, '3649117994', 200, 1564, '2601480877', '1601379292', 0),
(275, '3649100689', 214, 1194, 'nan', '2601349818/4513737407', 0),
(276, '3649127251', 200, 1011, '1601425720', '2601537207', 0),
(277, '3649109921', 184, 1474, '3870013635', '2601417515', 0),
(278, '3649118674', 206, 1642, '3870015508', '2601472290', 0),
(279, '3649119415/3649119276', 224, 1877, '3870015616', '2601478124/2601488005', 0),
(280, '3649118258', 224, 1787, '3870015439', '2601479557', 0),
(281, '3649123306', 200, 1314, '1601405646', '2601514045', 0),
(282, '3649112409', 224, 984, '2601438814', '3870014516', 0),
(283, '3649114681', 224, 1638, '3870014700', 'nan', 0),
(284, '3649101744/3649101743', 199, 1202, '3870012062/3870012061', '2601358066/2601356938', 0),
(285, '3649118557', 200, 1713, '2601481650', '1601379855', 0),
(286, '3649120397', 183, 1844, '3870015736', '2601490753', 0),
(287, '3649116902', 200, 1919, '1601373211', '2601473267', 0),
(288, '3649120187', 215, 941, '3870015723', '2601491636', 0),
(289, '3649101219', 195, 893, '3870011956', '2601347822/4513736970', 0),
(290, '364121067', 206, 1670, '3870015921', '2601498324', 0),
(291, '3649109075', 191, 1666, '3870013453', '2601401842/4513915271', 0),
(292, '3649127650', 206, 1612, '3870016855', '2601538466', 0),
(293, '3649114458', 224, 1694, '3870014648', '2601453554', 0),
(294, '3649130660', 200, 1931, '1601444138', '2601559194', 0),
(295, '3649110183', 214, 1233, '3870013670', '2601420845/4514235672', 0),
(296, '3649116339', 206, 1764, '3870015017', '2601468629', 0),
(297, '3649130524', 200, 1331, '1601443456', '2601558484', 0),
(298, '3649101728', 184, 869, '3870012000', '2601356985/4513699495', 0),
(299, '3649101467/3649101466', 191, 1941, '3870011984/3870011983', '2601356042/26013564040', 0),
(300, '3649118541', 224, 994, '3870015469', '2601481386', 0),
(301, '3649128754', 200, 872, '1601434754', '2601547757', 0),
(302, '3649107112', 184, 876, '3870013119', '2601396950/4514113455', 0),
(303, '3649115543', 224, 1650, '3870014883', '2601455108', 0),
(304, '3649120135', 199, 1528, '3870015728', '2601493791', 0),
(305, '3649106127', 207, 1050, '3870012875', '2601389194', 0),
(306, '3870012086', 212, 1199, '2601360461', '4513791277', 0),
(307, '3649109330', 184, 940, '3870013514', '2601412301', 0),
(308, '3649112607/3649112608/', 224, 1227, '3870014160/3870014168', '2601436267/2601436267', 0),
(309, '3649115208', 206, 1229, '3870014825', '2601455894/4514757319', 0),
(310, '3649101803', 193, 1388, '2601360456', '3870012115', 0),
(311, '3649120092', 202, 1151, '3870015638', '2601488890', 0),
(312, '3649124288', 200, 1372, '2601518903', '1601410324', 0),
(313, '3649108844', 199, 1185, '3870013411/260140415', '4514304553', 0),
(314, '3649110925', 207, 1639, '3870013866', '2601428546', 0),
(315, '3649116208', 199, 1715, '3870014996', '2601458111/4514629451', 0),
(316, '3649126632', 215, 1044, '3870016747', '2601530014', 0),
(317, '3649106003', 215, 1284, '3870012830', '2601386423/4514084615', 0),
(318, '3649107294/3870013168', 191, 1883, '2601397798', '4513915271', 0),
(319, '3649124471', 189, 1836, '3870016511', '2601520636', 0),
(320, '3649098752', 195, 1673, '3870011692', '2601337277/4513432743', 0),
(321, '3649109622', 193, 1253, '3870013607', '2601416621', 0),
(322, '3649111823', 199, 1698, '3870014010', '2601434186/4514224054', 0),
(323, '3649127710', 206, 1384, '3870016862', '2601538492', 0),
(324, '3649101157', 215, 894, '3870011822', '2601347744/4513750753', 0),
(325, '3649123035', 219, 1556, '3870016126', '2601498320', 0),
(326, '3649117827', 188, 1791, '3870015234', '2601478111', 0),
(327, '3649104666', 184, 1627, '3870012431', '2601366884/4513937266', 0),
(328, '3649117537', 207, 1228, '3870015159', '2601474889', 0),
(329, '3649109683', 196, 1539, '3870013596', '2601397256/4514183150', 0),
(330, '3649106441', 195, 1279, '3870012976', '2601392563/4513935640', 0),
(331, '3649107442', 184, 1096, '3870013209', '2601399879/4514113456', 0),
(332, '3649109688', 203, 886, '3870013620', '2601418614/45140351416', 0),
(333, '3649111094', 200, 1455, '1601337126', '2601427992', 0),
(334, '3649104857', 184, 1888, '3870012557', '2601375470/4513956553', 0),
(335, '3870016026', 212, 1542, '2601487610', '4514370578', 0),
(336, '3649114941', 200, 1494, '1601359978', '2601456732', 0),
(337, '3649119582', 186, 1818, '3870015632', '2601489490', 0),
(338, '3649115777', 200, 1252, '2601465530', '1601367302', 0),
(339, '3649101052/3649101053', 199, 1738, '3870011888/3870011889', '2601352630/2601353984', 0),
(340, '3649130325', 206, 1223, '3870017233', '2601553641', 0),
(341, '3649103923', 195, 1553, '3870012379', '2601371572/4513912511', 0),
(342, '3649130852', 200, 1565, '1601445361', '2601560475', 0),
(343, '3649109614', 195, 1392, '3870013612', '2601417743/4514208671', 0),
(344, '3649104809', 215, 1755, '3870012556', '2601379443/4513921753', 0),
(345, '3649127336', 183, 1593, '3870016800', '2601523772', 0),
(346, '3649130633', 206, 922, '3870017386', '2601558427', 0),
(347, '3649112759', 214, 1702, '3870014205', '2601438745', 0),
(348, '3649107880', 191, 879, '3870013281', '2601402187', 0),
(349, '3649105018', 215, 1405, '3870012675', '2601382197/4513921753', 0),
(350, '3649105789', 193, 971, '3870012840', '2601387206/4513908028', 0),
(351, '3649110756', 193, 907, '3870013778', '2601422832', 0),
(352, '3649111759', 215, 998, '3870014003', '2601432442', 0),
(353, '3649107704', 193, 1264, '3870013262', '2601401652/4514036458', 0),
(354, '3649112753/3649112752', 184, 1924, '3870014209/3870014209', '260142651', 0),
(355, '3649110795', 188, 1457, '3870013773', '2601424179', 0),
(356, '3649122498', 186, 1569, '3870016077', '2601506637', 0),
(357, '3649111090', 200, 931, '1601337132', '2601427998', 0),
(358, '3649107272/3649107270/3649107271', 200, 1469, '2601397530/2601397357', '2601397358', 0),
(359, '3649119287', 224, 1413, '3870015611', '2601487458', 0),
(360, '3649111091', 200, 987, '1601337124', '2601427990', 0),
(361, '3649118397', 195, 1186, '387015474', '2601475318', 0),
(362, '3649110937', 183, 1074, '3870013846', '2601428423/4514461032', 0),
(363, '3649115439', 200, 1740, '1601363369', '2601461674', 0),
(364, '3649117418', 193, 1336, '3870015201', '2601466576', 0),
(365, '3649111738', 199, 1936, '3870013998', '2601434734/4514224054', 0),
(366, '3649123884', 189, 1429, '3870016429', '2601517890', 0),
(367, '3649106116', 215, 1711, '3870012933', '2601389770/45140777722', 0),
(368, '3649101199', 224, 1089, 'nan', '2601351284/4513737402', 0),
(369, '3649124543', 187, 1495, '3870016507', '2601512771', 0),
(370, '3649117145', 193, 1216, '3870015163', '2601474302', 0),
(371, '3649113685', 184, 1913, '3870014530', '2601448212', 0),
(372, '3649100390', 224, 1080, '3870011832', '2601346740/4513737394', 0),
(373, '3649117828', 206, 1606, '3870015240', '2601477305', 0),
(374, '3649115940', 184, 1781, '2601465493', '4514765458', 0),
(375, '3870011923', 193, 1040, '3649101141', '2601344947/4513737400', 0),
(376, '3649104203', 199, 1416, '3870012420', '2601376200/4513923675', 0),
(377, '3649107881/3649107875', 224, 1052, '2601401784', 'nan', 0),
(378, '3649111336', 200, 1440, '1601339815', '2601431510', 0),
(379, '3870011947', 193, 1917, '2601346747', '4513737405', 0),
(380, '3649119400/3649119420', 193, 1784, '3870015627/3870015627', '2601486810/2601486974', 0),
(381, '3649107445', 214, 868, '3870013246', '2601400191/4514082205', 0),
(382, '3649101727', 184, 1507, '3870012088', '2601357670/4513755908', 0),
(383, '3649108250', 214, 1105, '3870013376', '2601404138/4514035606', 0),
(384, '3649122057', 224, 1118, '2601499259', '4515151363', 0),
(385, '3649126136', 200, 1172, '1601419575', '2601529539', 0),
(386, '3649112712', 215, 1951, '3870014208', '2601424852', 0),
(387, '3649112701', 188, 1391, '3870014173', '2601440925', 0),
(388, '3649106531', 193, 1570, '3870013006', '2601375465/4513907211', 0),
(389, '3649109694/3649109759', 193, 1903, '3870013643/3870013642', '2601418683', 0),
(390, '3649112928', 184, 1084, '2601441692', '3870014310', 0),
(391, '3649130305', 200, 1048, '1601441464', '2601555689', 0),
(392, '3649105221/3870012702', 224, 1674, '2601384191', '4513936021', 0),
(393, '3649114001', 214, 1428, '3870014541', '2601449840', 0),
(394, '3649103010', 214, 1381, '4513907760', '2601367519', 0),
(395, '3649104913', 187, 1527, '38700122566', '2601377387', 0),
(396, '3649114773', 182, 1749, '3870014727', '2601455098/4514758769', 0),
(397, '3649113789', 193, 1001, '3870014557', '2601440236', 0),
(398, '3649113662', 186, 1296, '3870014438', '2601449300/4514580633', 0),
(399, '3649104164', 188, 1082, '3870012430', '2601370289', 0),
(400, '3649110637/3649110635', 184, 1354, '3870013815/3870013819', '2601423939/2601425504', 0),
(401, '3649118399/3649118443', 214, 1110, '3870015478', '2601481343', 0),
(402, '3649114931', 207, 1087, '3870014693', '2601454166', 0),
(403, '3649117106', 214, 1708, '3870015140', '2601473765', 0),
(404, '3649111460', 214, 1504, '3870013950', '2601427854', 0),
(405, '3649108227', 224, 884, '3870013346', 'nan', 0),
(406, '3649120191', 206, 1933, '3870015768', '2601486035', 0),
(407, '3649109328', 215, 1306, '3870013512', '2601412725', 0),
(408, '3649106951', 214, 1014, '3870013126', '2601396205/4514176113', 0),
(409, '3649113771/3649113772', 224, 1769, '3870014462/', '2601449039/2601448256', 0),
(410, '3649108318', 193, 1537, '3870013384', '2601406192/4514036340', 0),
(411, '3649119255/3649119254', 198, 928, '3870015596', '2601487107/2601486052', 0),
(412, '3649119730', 193, 1671, '3870015709', '2601486058', 0),
(413, '3649124279', 220, 858, '3870016485', '2601514455', 0),
(414, '3649110794', 207, 952, '3870013775', '2601424686', 0),
(415, '3649118532/3649118531', 206, 1522, '3870015538', '2601473438/2601400000', 0),
(416, '3649127825', 206, 1508, '3870016925', '2601539970', 0),
(417, '3649102817', 224, 1688, 'nan', '2601366868/4513907369', 0),
(418, '3649123881', 196, 1652, '3870016425', '2601517888', 0),
(419, '3649112922', 200, 1516, '1601350366', '2601444703', 0),
(420, '3649112924', 195, 883, '3870014340', '260443312/4514588640', 0),
(421, '3649104476', 196, 882, '3870012486', '2601377101/4513962089', 0),
(422, '3649130336', 189, 1644, '3870017205', '2601552437', 0),
(423, '3649124433', 195, 1379, '3870016531', '2601509554', 0),
(424, '3649113687', 195, 1389, '3870014543/2601448210', '4514486311', 0),
(425, '3649115590', 214, 1174, '3870014882', '2601461912', 0),
(426, '3649124289', 200, 1274, '2601518938', '1601410326', 0),
(427, '3649130736', 189, 1057, '3870017325', '2601557072', 0),
(428, '3649112603', 200, 1918, '1601347021', '2601440440', 0),
(429, '3649112812', 188, 1853, '3870014282', '2601443878', 0),
(430, '3649108316', 195, 922, '3870013377', '2601402196/4514029697', 0),
(431, '3649116829', 215, 1288, '2601469685', '4514765494', 0),
(432, '3649107297', 193, 1858, '3870013217', '2601399385/4514155790', 0),
(433, '3649108511', 224, 1046, '3870013400', '2601403343', 0),
(434, '3649109286', 195, 1030, '3870013527', '2601409366/4514028554', 0),
(435, '3649127721', 206, 1806, '3870016857', '2601535242', 0),
(436, '3649110793', 184, 966, '3870013780', '2601426637', 0),
(437, '3870013343/3870013349', 212, 1499, '3649108226/', '4513968245', 0),
(438, '3649123949', 206, 1490, '3870016430', '2601516228', 0),
(439, '3649100909', 200, 960, '3649100909', '2601351180/', 0),
(440, '3649116292', 224, 1618, '3870015007', '2601464490', 0),
(441, '3649120710', 199, 910, '3870015874', '2601498326', 0),
(442, '3649111332', 215, 1641, '3870013906', '2601427637', 0),
(443, '3649117523', 224, 1285, '3870015221', '2601470303', 0),
(444, '3649105936', 193, 1450, '3870012877', '2601388709/4514115609', 0),
(445, '3649106529', 224, 1433, '3870012901', '2601389731/4514113459', 0),
(446, '3649118536', 207, 1854, '3870015425', '2601480895', 0),
(447, '3649121037/3649121039/3649121038', 207, 1292, '3870015865/', '2601498329', 0),
(448, '3649130735', 183, 1375, '3870017281', '2601555292', 0),
(449, '3649110236', 193, 1442, '3870013696', '2601421102', 0),
(450, '3870012374', 193, 1756, '2601373897', '4513907211', 0),
(451, '3649111173', 199, 1958, '3870013895', '2601430670', 0),
(452, '3649108748', 184, 934, '3870013258', '2601389360/4514113459', 0),
(453, '3649105520', 196, 1505, '3870012740', '2601386029/4513962086', 0),
(454, '3649126408', 204, 1745, '3870016720', '2601530872', 0),
(455, '3649126233', 215, 1891, '3870016699', '2601527591', 0),
(456, '3649114050', 214, 1497, '3870014425', '2601443496', 0),
(457, '3649105469', 224, 944, '3870012748', '2601373894/4513908012', 0),
(458, '3649127531', 195, 1874, '3870016861', '2601532403', 0),
(459, '3649099012', 184, 1363, '3870011741', '2601341155/4513699495', 0),
(460, '3649114988/3649114983', 219, 1095, '3870014733/3870014733', '2601454421', 0),
(461, '3649101279', 215, 1301, '3870011932', '2601353241/4513750753', 0),
(462, '3649114674', 184, 1742, '2601443320', '4514615856', 0),
(463, '3649112813', 214, 1733, '3870014285', '2601441703', 0),
(464, '3649114944', 200, 1501, '1601359982', '2601456734', 0),
(465, '3649110283', 214, 914, '3870013716', '2601421554', 0),
(466, '3649105515', 199, 1397, '2601380917', '4514037721', 0),
(467, '3649105582', 224, 1576, '3870012801', '2601365870/4513908012', 0),
(468, '3649105467', 215, 1758, '3870012808', '2601386424', 0),
(469, '3649113109', 224, 1730, '3870014377', '2601442429', 0),
(470, '3649120398', 206, 1805, '3870015772', '2601495471', 0),
(471, '3649106811', 215, 1408, '3870013054/', '2601390207/4514084629', 0),
(472, '3649105281', 193, 1864, '3870012730', '2601369714/4513908028', 0),
(473, '3649115542', 224, 1154, '3870014887', '2601460877', 0),
(474, '3649130859', 219, 1422, '3870017413', '2601546667', 0),
(475, '3649122176/3649122175', 224, 1191, '26014506876/2601505725', '2601505725/2601506876', 0),
(476, '3649107313', 193, 1658, '3870013216', '2601398045/4514199823', 0),
(477, '3649124407', 195, 1158, '3870016533', '2601505480', 0),
(478, '3649101578', 224, 1718, 'nan', '2601355458/4513737394', 0),
(479, '3649104858', 184, 1492, '3870012536', '2601377345/4513929283', 0),
(480, '3649117767', 219, 1116, '3870015243', '2601476597', 0),
(481, '3649107289', 193, 1571, '3870013215', '260139242/4514052942', 0),
(482, '3679101172', 200, 1338, '1601294888', '2601376499', 0),
(483, '3649113636', 195, 1568, '3870014469', '260149717/451448311', 0),
(484, '3649125971', 193, 1938, '3870016681', '2601527598', 0),
(485, '3649123772', 206, 1545, '3870016344', '2601508286', 0),
(486, '3649105513/3649105514', 214, 1130, '3870012805/3870012806', '2601377607/2601383895', 0),
(487, '3649118400', 188, 1476, '3870015437', '2601478982', 0),
(488, '3649104939', 207, 1091, '3870012606', '2601380261/4513968490', 0),
(489, '3649109607', 214, 863, '3870013585', '2601415030/4514036110', 0),
(490, '3649126485/3649126484', 184, 1134, '3870016725/', '2601531280/2601530156', 0),
(491, '3649120456', 206, 1445, '3870015805', '2601495472', 0),
(492, '3649107288', 224, 1311, '3870013163', '2601393704/4513907000', 0),
(493, '3649100895', 195, 1334, '3870011885', '2601351815/4513736971', 0),
(494, '3649113773', 224, 1280, '3870014548', '2601450079', 0),
(495, '3649120459', 195, 1308, '3870015838', '2601486032', 0),
(496, '3649118331', 195, 1661, '3870015470', '2601472942', 0),
(497, '3649112316', 199, 1613, '3870014136', '2601439516', 0),
(498, '3649119579', 199, 1822, '3870015623', '2601481658', 0),
(499, '3649101468', 184, 1122, '3870011985', '2601343982/4513699495', 0),
(500, '3649124517', 200, 1407, '1601404548', '2601511411', 0),
(501, '3649101206', 214, 1018, 'nan', '2601355393/4513827861', 0),
(502, '3649121346/3649121115', 188, 1222, '2601500143/2601497377', 'nan', 0),
(503, '3649120981', 224, 1111, '3870015895', '2601499277/4515149811', 0),
(504, '3649124290', 206, 1679, '3870016492', '2601516038', 0),
(505, '3649123460/3649123375', 195, 983, '3870016282/3870016282', '2601505741/2601510312', 0),
(506, '3649108234', 195, 1120, '2601402172', '4514029700', 0),
(507, '3649109616', 214, 1181, '3870013604', '2601417491/4514076765', 0),
(508, '3649123043', 224, 874, '3870016134', '2601511705', 0),
(509, '3649118254', 184, 1426, '3870015482', '2601478120', 0),
(510, '3649110716', 214, 948, '3870013791', '2601423902', 0),
(511, '3649118934', 215, 1131, '3870015578', '2601483264', 0),
(512, '3649104478', 206, 1586, '3870012494/2601377378', '4513908437', 0),
(513, '3649105280', 224, 1165, '3870012721', '2601383024/4513936024', 0),
(514, '3649106045', 195, 1790, '3870012905', '2601389650/4513935640', 0),
(515, '3649127720', 206, 1138, '3870016922', '2601534788', 0),
(516, '3649114788', 214, 1196, '3870014695', '2601455859', 0),
(517, '3649104350', 193, 1013, '3870012473', '2601374770/4513908028', 0),
(518, '3649120348', 196, 1558, '3870015778', '2601495485', 0),
(519, '3649113270', 215, 1213, '3870014386', '2601443829', 0),
(520, '3649118540', 200, 906, '2601481651', '1601379856', 0),
(521, '3649113788', 200, 1339, '1601354688', '2601449861', 0),
(522, '3649118149', 195, 1748, '3870015446', '2601472353', 0),
(523, '3649109613', 199, 1345, '3870013592', '2601413312/4513923666', 0),
(524, '3649128565', 200, 1885, '1601432984', '2601545614', 0),
(525, '3649118646', 214, 895, '3870015551', '2601476475', 0),
(526, '3649108973', 224, 1779, '3870013457', '2601408775/4514029575', 0),
(527, '3649118560', 215, 856, '3870015441', '2601479837', 0),
(528, '3649114462', 224, 1910, '3870014653', '4514486186', 0),
(529, '3649129558/364912959', 195, 899, '3870017121/3870017121', '2601551609/2601549645', 0),
(530, '3649103460', 186, 980, '3870012269', '2601368271/4513921293', 0),
(531, '3649124409', 186, 1579, '3870016467', '2601519992', 0),
(532, '3649112019', 222, 1102, '3870014060', '2601436113', 0),
(533, '3649101587', 193, 1330, '3870012024', '2601355516/4513737405', 0),
(534, '3649106117', 224, 988, '3870012904', '2601384390/4513908023', 0),
(535, '3649120327', 188, 1922, '3870015692', '2601491693', 0),
(536, '3649127887', 219, 1205, '3870016936', '2601530853', 0),
(537, '3649116022', 204, 1626, '3870014968', '4514883488', 0),
(538, '3649118936', 184, 1915, '3870015576', '2601484887', 0),
(539, '3649125753', 200, 1866, '1601415808', '2601527086', 0),
(540, '2601371649', 224, 1489, '4513908012', '2601371649', 0),
(541, '3649104859', 184, 905, '3870012532', '2601369552/4513930412', 0),
(542, '3649126707', 193, 891, '3870016750', '2601531130', 0),
(543, '3649125750', 200, 1287, '1601415807', '2601527088', 0),
(544, '3649107444', 215, 1511, '3870013236', '2601398412/4514084615', 0),
(545, '3649107233', 195, 1861, '3870013147', '2601395953', 0),
(546, '3649130661', 200, 1747, '1601444137', '2601559193', 0),
(547, '3649124405', 206, 956, '3870016516', '2601520695', 0),
(548, '3649104816', 193, 1251, '3870012538', '2601373895/4513913117', 0),
(549, '3649109603', 200, 1691, '2601415134', 'nan', 0),
(550, '3679110072', 184, 939, '3870013732', '2601423949', 0),
(551, '3649106781/3649106782/3649106780', 195, 977, '3870013078/3870013078', '2601394924/2601396203/2601393705', 0),
(552, '3649109331', 199, 958, '3870013511', '2601411509/4513923666', 0),
(553, '3649103003', 193, 1454, '3870012242', '4513908112/2601366508', 0),
(554, '3649116291', 215, 1136, '2601467865', '4514886163', 0),
(555, '3649115941', 215, 1318, '2601461973', '4514765466', 0),
(556, '3649127104', 206, 862, '3870016756', '2601534797', 0),
(557, '3649119983/3649119984/3649119992/3649119993', 195, 1550, '38700157513870015751/3870015751/3870015751', '2601493335/2601491364', 0),
(558, '3649105518', 196, 1113, '3870012785', '2601377357', 0),
(559, '3649105714', 224, 1168, '3870012845', '2601387636/4513936021', 0),
(560, '3694117485', 184, 1319, '2601474813', '4514954933', 0),
(561, '3649120857', 186, 909, '3870015844', '2601496792', 0),
(562, '3649111098', 200, 1459, '3870013858', '2601427291', 0),
(563, '3649104588/3649104534', 215, 1759, '3870012424/3870012424', '2601373902/2602601376169', 0),
(564, '3649113686', 206, 929, '3870014574', '2601446251', 0),
(565, '3649126381/3649126380/3649126383', 195, 1329, '2601531265/2601531269/2601530336', '4515332086', 0),
(566, '3649116447', 184, 1421, '2601462293', '4514765458', 0),
(567, '3649130300', 200, 1540, '1601442142', '2601556505', 0),
(568, '3649104457', 196, 1159, '3870012451', '2601376975/4513998496', 0),
(569, '3649110394', 186, 1614, '3870013703', '2601417521', 0),
(570, '3649101758', 193, 861, '2601357205', '4513737405', 0),
(571, '3649114816', 188, 918, '3870014786', '2601455111', 0),
(572, '3649101725', 184, 900, '3870012091', '2601356553/4513778085', 0),
(573, '3649104354', 199, 1664, '3870012482', '2601371650/4513923675', 0),
(574, '3649116820', 224, 1043, '3870015060', '2601470890', 0),
(575, '3649101676', 198, 1743, '3870012005', '2601355279/4513801967', 0),
(576, '3649113823', 214, 1352, '3870014556', '2601450682', 0),
(577, '3649099301', 215, 1371, '3870011742', '2601341156/4513426124', 0),
(578, '3649113770', 217, 1152, '3870014493', '2601450053', 0),
(579, '3649107238/3649107296', 195, 1036, '3870013198/3870013198', '2601398044/2601398727', 0),
(580, '3649117373', 224, 1323, '3870015187', '2601473764', 0),
(581, '3649126825', 206, 1634, '3870016757', '2601533389', 0),
(582, '3649117524', 206, 1475, '3870015203', '2601473027', 0),
(583, '3649130858', 200, 1819, '1601445364', '2601560479', 0),
(584, '3649120130', 215, 1599, '3870015724', '2601491742', 0),
(585, '3649118533', 206, 1720, '3870015509', '2601472292', 0),
(586, '3649124549', 184, 977, '3870016564', '2601516723', 0),
(587, '5200125780/3870011803', 221, 1669, '5000039653', '4513750378', 0),
(588, '3649123378', 195, 1176, '3870016278', '2601509533', 0),
(589, '3649112020', 214, 1643, '3870014079', '2601435819', 0),
(590, '3649112042', 195, 1385, '3870014081', '2601426534/4514208264', 0),
(591, '3649106810', 184, 1795, '3870013090', '2601395271/4514090350', 0),
(592, '3649104036', 195, 1034, '3870012422', '2601370286/4513956587', 0),
(593, '3649100378', 184, 904, '3870011830', '2601342913/4513426140', 0),
(594, '3649103073', 186, 1682, '3870012196', '2601368265/4513921296', 0),
(595, '3649110252', 224, 1724, '3870013712', '2601420711', 0),
(596, '3649124283', 195, 1884, '3870016494', '2601518794', 0),
(597, '3649102660', 214, 1226, '4513907760', '2601365801', 0),
(598, '3679135045', 200, 1597, '16014535736', '2601548982', 0),
(599, '3649112412', 200, 1359, '1601347018', '2601440438', 0),
(600, '3649130308', 200, 1907, '1601441455', '2601555683', 0),
(601, '2601374683', 214, 1058, '4513908116', 'nan', 0),
(602, '3649111588', 190, 1256, '38700013997', '2601427259/4514239837', 0),
(603, '3649123675', 206, 1067, '3870016319', '2601508285', 0),
(604, '3649107268/3649107269/3649107265/3649107267/3649107266', 200, 1491, '2601396024/2601396292/2601396314/2601397318/2601396318', '1601311448/1601311082/1601303577/16013035544', 0),
(605, '3649113680', 193, 1086, '3870014468', '2601449146', 0),
(606, '3649104944', 193, 1783, '3870012664', '2601376740/4513908028', 0),
(607, '3649124473', 183, 1430, '3870016537', '2601517033', 0),
(608, '3649100379', 186, 1210, '3870011810', '2601349024/4513236173', 0),
(609, '3649103012', 224, 1047, '4513907369', '2601367510', 0),
(610, '3649103013', 195, 1647, '3870012234', '2601366023/4513907675', 0),
(611, '3649111601', 214, 1605, '3870013988', '2601426567', 0),
(612, '3649120326', 196, 1689, '3870015759', '2601494880', 0),
(613, '3649118253', 195, 897, '3870015443', '2601481345', 0),
(614, '3649115193', 215, 1137, '2601458793', '4514760147', 0),
(615, '3649111233', 184, 1042, '3870013905', '2601431483', 0),
(616, '3649113269', 200, 1811, '1601352168', '2601447835', 0),
(617, '3649111096/364911097', 184, 1584, '3870013862/3870013862', '2601425505/2601427640', 0),
(618, '3649115252', 184, 1276, '2601460837', '4514760149', 0),
(619, '3649112510', 193, 1326, '3870014181', '2601440231', 0),
(620, '3649100851', 200, 1846, 'nan', '1601265952', 0),
(621, '3649123773', 189, 1734, '3870016314', '2601513715', 0),
(622, '3649106596', 184, 1768, '3870013013', '2601392126/4514113456', 0),
(623, '3649108505/3870013316', 196, 1368, '2601406144', '4514287421', 0),
(624, '3649125455', 215, 866, '870016620', '2601525744', 0),
(625, '3649101872', 184, 1583, '3870012114', '2601358359/4513755908', 0),
(626, '3649116343', 219, 1161, '3870015038', '2601466359', 0),
(627, '3649104916', 199, 1125, '3870012602', '2601380087/4513923671', 0),
(628, '3649104690', 224, 1477, '4513907000', '2601372693', 0),
(629, '3649126625', 200, 1341, '1601423076', '201533554', 0),
(630, '3649128680', 200, 1075, '1601433246', '2601546722', 0),
(631, '3649101756', 215, 1714, '3870012072', '2601366987/4513756535', 0),
(632, '3649130334', 183, 1456, '3870017151', '2601553683', 0),
(633, '3649115683', 207, 976, '3870014923', '2601460781', 0),
(634, '3649113538', 200, 1195, '1601349683', '2601443844', 0),
(635, '3649126633', 193, 1765, '3870016741', '2601530031', 0),
(636, '3649101769', 195, 937, '3870012075', '2601358348/4513736970', 0),
(637, '2601369711', 224, 1530, '4513908023', 'nan', 0),
(638, '3649126703', 204, 867, '4515484149', '2601534805', 0),
(639, '3649117531', 214, 1395, '3870015207', '2601473714', 0),
(640, '3649130191', 198, 1821, '3870017226', '2601549544', 0),
(641, '3649102298', 196, 1534, '3870012137', '2601362367/4513386890', 0),
(642, '3649117525', 200, 1857, '2601476714', '1601375941', 0),
(643, '3649118626', 206, 1690, '3870015541', '2601480844', 0),
(644, '3649109602', 186, 1760, '3870013590', '2601403724/4513956673', 0),
(645, '3649113534', 186, 1762, '2601447741', '4514580633', 0),
(646, '3649101588', 195, 1099, '3870012030', '2601355366/4513736971', 0),
(647, '3649106696', 191, 1332, '3870013015', '2601368220/4513931343', 0),
(648, '3649130307', 186, 1631, '3870017283', '2601555508', 0),
(649, '3649105510/3649105521', 196, 1567, '3870012787/3870012786', '2601386187/2601377130', 0),
(650, '3649100682/3649100681', 199, 1629, '3870011857/3870011856', '2601347839/2601350381', 0),
(651, '3649110395', 224, 1220, '3870013739', '2601422344', 0),
(652, '3649127260', 200, 1144, '1601424900', '2601535841', 0),
(653, '3649112760', 184, 1100, '3870014210', '2601440715', 0),
(654, '3870013770', 186, 1147, '2601424817', '4514441767', 0),
(655, '3649106553/3649106552', 207, 973, '3870013009/3870013008', '2601384198/2601380262', 0),
(656, '3649107705', 214, 1458, '3870013265', '2601401635/4514036110', 0),
(657, '3649114977', 200, 1598, '1601360548', '2601458383', 0),
(658, '3649127103', 206, 1245, '3870016758', '2601534876', 0),
(659, '3649120460', 224, 1839, '3870015804', '2601495775', 0),
(660, '3649109535', 224, 1840, '3870013573', '2601415918', 0),
(661, '3649106315', 195, 1770, '3870012970', '2601390104', 0),
(662, '3649109161', 200, 1427, '2601411452', 'nan', 0),
(663, '3649121040', 207, 1637, '3870015931', '2601499272', 0),
(664, '3649124282', 189, 1156, '3870016464', '2601506623', 0),
(665, '3649120717', 206, 1772, '2601498325', '4515097629', 0),
(666, '3649101142/3649101143', 199, 1170, '3870011917/3870000000', '2601353985/4513503205', 0),
(667, '3649120457', 200, 1660, '1601392570', '2601496581', 0),
(668, '3649104480', 196, 1909, '3870012452', '260137684/4513998497', 0),
(669, '3649107234', 184, 1291, '3870013138', '2601396955/4514113459', 0),
(670, '3649120454', 200, 946, '1601392580', '2601496582', 0),
(671, '3649107303', 183, 1277, '3870013133', '2601394931', 0),
(672, '3649119950', 207, 1778, '3870015711', '2601492858', 0),
(673, '3649110559', 193, 1325, '3870013759', '2601423915', 0),
(674, '3649123678', 195, 1068, '3870016342', '2601514108', 0),
(675, '3649115033', 209, 1502, '3870014810', '2601457139/4514787382', 0),
(676, '3649103784', 214, 1033, '4513907760', '2601370685', 0),
(677, '3649116207/3649116203/3649116206/3649116206/3649116204/3649116205', 200, 854, '1601363837/1601363839/1601363838/', '2601462129/2601462217/2601462130/2601462130/2601462131/2601462216', 0),
(678, '3649108975', 212, 1509, '3870013442', '2601411628/4513968248', 0),
(679, '3649109643', 224, 1133, '3870013617', '2601417731/4514384569', 0),
(680, '3649118599/3649118598', 195, 1312, '3870015569/3870015569', '2601483795/2601484089', 0),
(681, '3649123373', 195, 1300, '3870016283', '2601510259', 0),
(682, '3649100656', 195, 1094, '3870011863', '2601351217/4513736971', 0),
(683, '3649130193', 183, 1231, '3870017241', '2601554799', 0),
(684, '3649101702', 224, 1358, 'nan', '2601358387/4513737402', 0),
(685, '3649121034', 206, 1585, '3870015943', '2601498451', 0),
(686, '3649107438', 214, 1250, '3870013210', '2601399247/4513908116', 0),
(687, '3649104955', 195, 1003, '3870012667', '2601381770/4513908437', 0),
(688, '3870014742', 214, 969, '3870014742', '2601456424', 0),
(689, '3649112912', 184, 1921, '3870014304', '2601441910', 0),
(690, '3649109612', 196, 1876, '3870013595/4514183149', '2601397252', 0),
(691, '3649114523', 206, 1215, '3870014659', '2601453537', 0),
(692, '3649117521', 200, 1611, '2601475716', '1601375082', 0),
(693, '3649109329', 191, 1848, '3870013519', '2601413065/4514241511', 0),
(694, '3649112486', 193, 1465, '3870014180', '2601438846', 0),
(695, '3649113633', 215, 919, '3870014423', '2601443959', 0),
(696, '3649122172/3649122188', 189, 890, '3870016040/', '26014508369/2601508391', 0),
(697, '3649119845', 200, 1563, '1601385232', '2601492843', 0),
(698, '3649106017/3649106016', 199, 1782, '3870012882/3870012881', '2601380449/2601380444/2601380449/4514031298/4514031298', 0),
(699, '3649103143', 199, 1678, '3870012248', '2601366866/451366866', 0),
(700, '3649115446', 200, 1651, '1601363601', '1601363601', 0),
(701, '3649114655', 193, 924, '2601453650', '3870014702', 0),
(702, '3649105947', 195, 1513, '3870012879', '2601386940/4513906999', 0),
(703, '3649112602', 224, 1600, '3870014207', '2601441056', 0),
(704, '3870015132', 199, 1536, '2601473712', '4514757329', 0),
(705, '3649109163', 200, 1589, '1601324454', 'nan', 0),
(706, '3649108826', 199, 885, '3870013409', '2601406061/4513923666', 0),
(707, '3649116029', 224, 1254, '3870014989', '2601455848', 0),
(708, '3649128872', 200, 1705, '1601435708', '2601548924', 0),
(709, '3649131163', 183, 1804, '3870017397', '2601546733', 0),
(710, '3649118537', 200, 1823, '1601379857', '2601481652', 0),
(711, '3649127712', 206, 1838, '3870016897', '4515491528', 0),
(712, '3649111213', 215, 1303, '2601426636', '4514456145', 0),
(713, '3649099811/', 199, 1238, '3870011771', '2601343630/4513503204', 0),
(714, '2601376736', 195, 1800, '3870012656', '4513908437', 0),
(715, '3649111219', 224, 1945, '3870013893', '2601427853', 0),
(716, '3649124198/3649124199', 195, 930, '3870016462/3870016462', '2601516045/2601512776', 0),
(717, '3649107443/', 214, 1620, '3870013199', '2601397795/4514168312', 0),
(718, '3649123883', 188, 1266, '3870016303', '2601514241', 0),
(719, '364911399', 195, 1814, '38700014542', '2601449719/4514486311', 0),
(720, '3649118401', 195, 1369, '3870015471', '2601470306', 0),
(721, '3649126137', 200, 1871, '1601419576', '2601529540', 0),
(722, '3649119285/3649100000', 224, 1248, '3870015615', '2601486004', 0),
(723, '3649110869', 199, 1316, '3870013842', '2601426545/4513923666', 0),
(724, '3649118219', 193, 1916, '3870015429', '2601476563', 0),
(725, '3649109609', 195, 1827, '3870013605', '2601417692/4514028558', 0),
(726, '3649112751', 224, 1356, '2601441711', '3870014259', 0),
(727, '3649108506', 215, 1149, '3870013382', '2601407469/451424816', 0),
(728, '3649111886', 183, 1135, '38700014065', '2601436134/4514572001', 0),
(729, '3649106480/3649106481', 191, 1278, '3870012975/', '2601392618/2601390116', 0),
(730, '3649117148', 184, 1178, '2601469450', '4514760149', 0),
(731, '3649111974', 195, 1200, '3870014046', '2601418360/4514028554', 0),
(732, '3649117538', 215, 1588, '2601476564', '4514934728', 0),
(733, '3649107021', 199, 954, '3870013109', '2601394311/4513923665', 0),
(734, '3649104479', 196, 1324, '3870012487', '2601377126/4513962084', 0),
(735, '3649114594', 224, 1703, '3870014678', '2601453648', 0),
(736, '3649124197', 206, 1150, '3870016455', '2601519492', 0),
(737, '3649101051', 214, 1360, 'nan', '2601353924/4513737407', 0),
(738, '3649105826', 184, 1739, '3870012847', '2601388777', 0),
(739, '3870012146', 193, 903, '2601355747/4513737405', 'nan', 0),
(740, '3870012321', 212, 1519, '2601372126', '4513968237', 0),
(741, '3649103002', 184, 1072, '3870012207', '2601366380/4513930412', 0),
(742, '3649104811', 186, 1893, '2601376181', '4513921293', 0),
(743, '3649104167', 195, 1547, '3870012416/', '2601375144/4513912511', 0),
(744, '36491010602', 195, 1012, '3870012029', '2601357730/4513736970', 0),
(745, '3649119964', 206, 1006, '3870015739', '2601487016', 0),
(746, '3649101159', 215, 1807, '3870011821', '2601343095/4513428129', 0),
(747, '3649128652', 183, 1016, '3870017013', '2601546538', 0),
(748, '3649119697', 189, 1616, '3870015649', '2601490579', 0),
(749, '3649123882', 196, 1926, '3870016332', '2601516718', 0),
(750, '3649107877', 193, 1596, '3870013290', '2601398932/4514052942', 0),
(751, '3649124285', 200, 1810, '1601405647', '2601513435', 0),
(752, '3649117996', 200, 1179, '1601378354', '2601479330', 0),
(753, '3649119421/3649119421', 214, 1529, '3870015626', '2601486059/', 0),
(754, '3649117539', 206, 1127, '3870015223', '2601476873', 0),
(755, '3649100380', 214, 1286, '3870011814', '2601344681/45137370407', 0);
INSERT INTO `invoice` (`id`, `num`, `client`, `exportCertificate`, `performa`, `systemRef`, `bankReciete`) VALUES
(756, '3870016608', 199, 1398, '2601525459', '4515440558', 0),
(757, '3649100643', 195, 1282, '3870011849', '2601345743/4513736970', 0),
(758, '3649115211', 200, 1900, '1601362295', '2601459837', 0),
(759, '3649114973', 206, 1725, '3870014722', '2601456006/4514692548', 0),
(760, '3649119870', 224, 1633, '3870015666', '2601485843', 0),
(761, '3649105466', 184, 1610, '3870012809', '2601386441', 0),
(762, '3649109617', 200, 1028, '2601413441', 'nan', 0),
(763, '3649108974', 193, 1514, '3870013466', '2601411609', 0),
(764, '3649116815', 193, 1559, '3870015057', '2601470925', 0),
(765, '3649115942', 184, 1069, '2601459813', '4514764900', 0),
(766, '3649116893', 224, 1890, '3870015059', '2601470891', 0),
(767, '3649103788', 224, 1862, '4513908012', '2601371842', 0),
(768, '3649104817', 214, 911, '4513908116', '2601377026', 0),
(769, '3870012825', 212, 1270, '2601384593', '4513968238', 0),
(770, '3649107107', 194, 1081, '3870013070', '2601390740/4513956541', 0),
(771, '3649102951', 195, 1204, '3870012194', '2601364926/4513912511', 0),
(772, '3649112758', 214, 1562, '3870014206', '2601438822', 0),
(773, '3649121062/3649121061', 207, 993, '3870015936/', '2601500041', 0),
(774, '3649118645', 219, 1685, '3870015562', '2601480843', 0),
(775, '3649121338', 206, 1923, '3870015961', '2601499270', 0),
(776, '3649113648', 214, 1817, '3870014458', '2601449257', 0),
(777, '3649112064', 188, 1701, '3870014001', '2601424157', 0),
(778, '3649130079', 183, 1879, '3870017241', '2601554799', 0),
(779, '3649126411', 206, 1037, '3870016729', '2601532161', 0),
(780, '3649108251', 193, 1124, '3870013378', '2601406193', 0),
(781, '3649112763', 195, 1607, '2601443003/451448631', 'nan', 0),
(782, '3649101035', 214, 1834, 'nan', '2601351789/4513737407', 0),
(783, '3649116074', 214, 1007, '2601461974', '4514606247', 0),
(784, '3649126481/3649126482', 206, 1865, '3870016730/2601532841', '4515491521/4515491521', 0),
(785, '3649117826', 224, 1078, '3870015267', '2601478458', 0),
(786, '3649118398', 199, 1439, '3870015457', '2601477310', 0),
(787, '3649102303', 196, 1820, '3870012136', '2601363042/4513386888', 0),
(788, '3649119433', 206, 962, '3870015630', '2601480958', 0),
(789, '3649100899/3649100898', 199, 880, '3870011870/3870011869', '2601352633/260132629', 0),
(790, '3649120075/3649120064', 215, 1799, '3870015723/3870015723', '2601491368/2601492174', 0),
(791, '3649111462', 198, 1073, '3870013946', '2601429189', 0),
(792, '3649120273/3649120317/', 199, 920, '2601494015', '4515097631', 0),
(793, '3649107706', 215, 1117, '3870013255', '2601382234/4513921753', 0),
(794, '3649104812', 195, 1357, '3870012567', '2601377637/4513908437', 0),
(795, '3649101838', 194, 1253, '3870012047', '2601353127/4513721784', 0),
(796, '3649113354', 195, 1211, '3870014417', '2601445015/4514606439', 0),
(797, '3649115944', 206, 1390, '3870014952', '2601465703/4514878719', 0),
(798, '36491147006', 206, 1942, '3870014698', '2601456129', 0),
(799, '3649128865', 206, 1815, '3870017051', '2601549000', 0),
(800, '3649116333', 206, 1500, '3870015011', '2601468572', 0),
(801, '3649127353', 206, 1928, '3870016806', '2601535730', 0),
(802, '3649118358', 207, 1872, '3870015442', '2601481387', 0),
(803, '3649109760', 184, 1750, '3870013572', '260141598/4514249231', 0),
(804, '3649118597', 186, 1543, '3870015418', '2601474821', 0),
(805, '3649122190', 206, 913, '3870016037', '2601505485', 0),
(806, '3649109738', 184, 964, '2601415145', '4514242814', 0),
(807, '3649113274', 206, 1859, '3870014421', '2601444875', 0),
(808, '3649101745', 215, 1628, '3870012073', '2601359378/4513778083', 0),
(809, '3649130392', 189, 1881, '3870017284', '2601544985', 0),
(810, '3649128061', 195, 1063, '3870016962', '2601534616', 0),
(811, '3649104353', 193, 1729, '2601374771', '4513907211', 0),
(812, '3649120091', 215, 1219, '3870015770', '2601493304', 0),
(813, '3649104352', 195, 1295, '3870012470', '2601374267/4513908316', 0),
(814, '3649106530', 184, 877, '2601388783', '4514113456', 0),
(815, '3649104915', 224, 1025, '3870012666', '2601375147/4513907000', 0),
(816, '3649117993', 206, 1106, '3870015396', '2601480920', 0),
(817, '3649118239', 195, 1684, '3870015447', '2601476703', 0),
(818, '3649106751', 193, 1630, '3870013101', '2601395081/4514155790', 0),
(819, '3649109282', 184, 1377, '3870013526', '2601414583/4514249231', 0),
(820, '3649124286', 200, 1957, '1601406650', '2601514054', 0),
(821, '3649124370', 206, 1031, '3870016493', '2601518801', 0),
(822, '3649119438', 199, 1305, '3870015618', '4515097631', 0),
(823, '3649127537', 206, 1935, '3870016865', '2601538808', 0),
(824, '3649108815', 193, 1717, '3870013433', '2601409373', 0),
(825, '3649124541', 189, 1904, '3870016535', '2601517895', 0),
(826, '3649112016', 193, 1221, '3870014083', '2601436245', 0),
(827, '3649103787', 195, 1802, '3870012340', '2601372064/4513912511', 0),
(828, '3649121035', 199, 961, '3870015968', '2601502124', 0),
(829, '3649109219', 200, 1315, '1601322653', 'nan', 0),
(830, '3649108814', 215, 1850, '2601408055', '4514283110', 0),
(831, '3649103075', 186, 1635, '3870012197', '2601368264/4513921290', 0),
(832, '3649110861', 214, 896, '3870013792', '2601426530', 0),
(833, '3649109718', 199, 1322, '3870013621', '2601418652/4513923666', 0),
(834, '3649103994', 199, 1225, '3870012364', '2601372876/4513923675', 0),
(835, '3649116332', 185, 1201, '3870015036', '2601465203', 0),
(836, '3649116491', 215, 1239, '2601467713', '4514886163', 0),
(837, '3649104898', 194, 1146, '3870012593', '2601369763/4513956541', 0),
(838, '3649113281', 224, 1777, '3870014416', '2601446520', 0),
(839, '3649115682', 200, 1851, '1601365456', '2601463793', 0),
(840, '3649129506', 206, 889, '3870017120', '2601551209', 0),
(841, '3649103414/36494103396//3649103395', 215, 1464, '3870012212', '2601366358', 0),
(842, '3649123552', 183, 1752, '3870016311', '2601512989', 0),
(843, '3649101589', 193, 1446, '3870012022', '4513737405/2601356270', 0),
(844, '3649106476', 224, 1032, '3870012973', '2601384911/4513936024', 0),
(845, '3649100440', 193, 989, '3870011829', '2601346158/4513737405', 0),
(846, '3649129550/', 206, 1349, '3870017130', '2601456724', 0),
(847, '3649112708', 195, 1214, '3870014261', '2601438805/4514486311', 0),
(848, '3649102819', 214, 1008, '4513908116', '2601364202', 0),
(849, '3649104351', 193, 1382, '3870012471', '2601376203/4513908028', 0),
(850, '3649109726', 201, 1121, '3870013565', '2601407396/4514289312', 0),
(851, '3649104625', 188, 1387, '3870012468', '2601372153', 0),
(852, '3649115179', 184, 1792, '2601459774', '4514760149', 0),
(853, '3649101125', 195, 1299, '3870011919', '2601353993/4513736970', 0),
(854, '3649114939', 215, 1373, '2601455923', '4514765466', 0),
(855, '3649130488', 185, 1869, '3870017355', '2601549541', 0),
(856, '3649101910', 191, 1315, '3870012016', '2601355981/4512863958', 0),
(857, '3649117419', 184, 1939, '2601475020', '4514946200', 0),
(858, '3649113113', 215, 1481, '3870014311', '2601444684', 0),
(859, '3649127886', 206, 1541, '3870016929', '2601536823', 0),
(860, '3649130176/3649130459', 188, 1290, '3870017216/3870017215', '2601553773/2601551616', 0),
(861, '3649114796', 183, 1771, '3870014668', '2601454162', 0),
(862, '3649113272', 200, 1575, '1601352690', '2601447834', 0),
(863, '3649129212', 199, 1449, '3870017038', '2601545889', 0),
(864, '3649107312', 224, 860, '3870013213', '2601393685/4513936021', 0),
(865, '3649117768', 214, 1560, '3870015249', '2601471127', 0),
(866, '3649101579', 214, 1027, 'nan', '2601356550/4513737407', 0),
(867, '3649105944', 215, 1123, '3870012870', '2601388081/4514084615', 0),
(868, '3649124547', 184, 881, '3870016553', '2601521162', 0),
(869, '3649110847', 207, 1533, '2601428411', '4514007373', 0),
(870, '3649130958', 185, 1766, '3870017415', '2601559748', 0),
(871, '3649112840', 186, 1892, '2601443763', '4514580633', 0),
(872, '3649112917', 207, 1825, '3870014273', '2601442785', 0),
(873, '3649111465', 184, 1208, '3870013985', '2601425741', 0),
(874, '3649099704', 195, 1258, '3870011764', '2601344936/4513736971', 0),
(875, '3649113632', 214, 1667, '3870014560', '2601448001', 0),
(876, '3649118539', 224, 1526, '3870015492', '2601481633', 0),
(877, '3649121314', 189, 1803, '3870015972', '2601500561', 0),
(878, '3649108231', 215, 1026, '3870013317', '2601406213/4514242816', 0),
(879, '3649123576', 206, 1271, '3870016317', '2601510903', 0),
(880, '3649117536', 214, 1415, '3870015208', '2601470304', 0),
(881, '3649107113/', 193, 1234, '3870013149', '2601392139/4514141892', 0),
(882, '3649131211', 189, 1665, '3870017442', '2601561361', 0),
(883, '3649120325', 183, 1835, '3870015743', '2601485999', 0),
(884, '3649101198', 193, 959, '3870011959', '2601354793/4513737405', 0),
(885, '3870011799/3870011798', 199, 1302, 'nan', '2601347841/4513503205', 0),
(886, '3649100684', 224, 1005, 'nan', '2601344938/4513737402', 0),
(887, '3649118265/3649118264/3649118256', 215, 1383, '2601479851/2601478125/2601478121', '4514934729/451446189', 0),
(888, '3649109434', 206, 1493, '3870013570', '260141095/4514028558', 0),
(889, '3649112957', 193, 1695, '3870014352', '2601436902', 0),
(890, '3649129036/3649129209', 195, 1064, '3870017086/3870017086', '2601549423/2601549436', 0),
(891, '3649112707', 199, 1902, '3870014211', '4514629439', 0),
(892, '3649107235', 184, 880, '3870013174', '2601397951/4514113455', 0),
(893, '3649113631', 193, 1948, '3870014428', '2601447799', 0),
(894, '3649115172', 184, 1000, '2601460642', '4514765496', 0),
(895, '3649126626', 200, 1380, '1601423074', '2601533543', 0),
(896, '3649104163', 188, 1348, '3870012447', '2601373899', 0),
(897, '3649107236', 214, 1257, '3870013190', '2601396308/4514176113', 0),
(898, '3649111757', 188, 1289, '3870013949', '2601427240/4514427611', 0),
(899, '3649120210', 198, 1580, '3870015748', '2601494606', 0),
(900, '3649104536', 215, 947, '3870012512', '2601370287', 0),
(901, '3649105790', 214, 1736, '3870012857', '2601387638/451393621', 0),
(902, '3649130192', 198, 1333, '3870017210', '2601549540', 0),
(903, '3649109610', 193, 1307, '3870013608', '2601411498', 0),
(904, '3649127807', 206, 1169, '3870016908', '2601539639', 0),
(905, '3649116154', 193, 1487, '3870014990', '2601462183', 0),
(906, '3649106533', 199, 1269, '3870012997', '2601392621/4513923665', 0),
(907, '3649114715', 224, 1183, '3870014699', '2601453737', 0),
(908, '3649103436', 195, 1657, '3870012280', '2601371516/4513912511', 0),
(909, '3649115540', 200, 1944, '1601361762', '2601460639', 0),
(910, '3649112411', 200, 1832, '1601347138', '2601440722', 0),
(911, '3649114780', 212, 1581, '3870014731', '2601445090', 0),
(912, '3649120131', 206, 855, '3870015764', '2601491235', 0),
(913, '3649118594', 206, 1763, '3870015565', '2601484503', 0),
(914, '3649115255', 214, 1723, '3870014880', '2601460361', 0),
(915, '3649100219', 199, 1710, '3870011813', '2601349015/451303204', 0),
(916, '3649102829', 224, 974, 'nan', '2601364031', 0),
(917, '3649116445', 188, 1153, '3870015040', '2601469462', 0),
(918, '3649118435', 214, 1148, '3870015476', '2601481388', 0),
(919, '3649111758', 206, 970, '3870014002', '2601433125', 0),
(920, '3649115709', 206, 1604, '3870014927', '2601459770', 0),
(921, '3649121339/3649121325', 199, 1035, '3870015980', '2601502669', 0),
(922, '3649130120', 189, 1776, '3870017225', '2601554561', 0),
(923, '3649120496', 188, 1053, '3870015767', '2601494970', 0),
(924, '3649113801', 217, 1617, '3870014528', '2601448658', 0),
(925, '3649115171', 224, 1416, '3870014831', '2601458591', 0),
(926, '3649130517', 200, 1132, '1601442595', '2601557171', 0),
(927, '3649119258/3649119399/3649119259', 224, 1235, '3870015610/', '2601486724', 0),
(928, '3649126624', 204, 1506, '3870016742', '2601532969', 0),
(929, '3649104623/1601295568', 200, 1897, '2601377221', 'nan', 0),
(930, '3649115379', 186, 1912, '3870014667', '2601455994', 0),
(931, '3649106051', 214, 1663, '2601386653/4513935483', 'nan', 0),
(932, '3649112919', 219, 1704, '3870014341', '2601441377', 0),
(933, '3649120400', 187, 1467, '3870015747', '26014909929', 0),
(934, '3649126338', 195, 1789, '3870016710', '2601530328', 0),
(935, '3649126708', 193, 1365, '3870016749', '2601528816', 0),
(936, '3649119599', 206, 1162, '3870015673', '2601482523', 0),
(937, '3649113127', 187, 1092, '3870014346', '2601442473', 0),
(938, '3649108920/3649108919', 184, 1592, '3870013454', '2601410268', 0),
(939, '3649130730', 206, 1160, '3870017321', '2601551941', 0),
(940, '3649112940', 193, 898, '3870013676', '2601419916', 0),
(941, '3649128755', 200, 1649, '1601434750', '2601547756', 0),
(942, '3649105785', 199, 986, '3870012850', '2601388449/4513923665', 0),
(943, '3649130317', 186, 1668, '3870017282', '2601553643', 0),
(944, '3649114943', 200, 1640, '1601359981', '2601456733', 0),
(945, '3649108546', 191, 1929, '3870013396', '2601404254/4514241511', 0),
(946, '3649128063', 199, 1273, '3870016946', '2601534593', 0),
(947, '3649124406', 206, 1182, '3870016466', '2601519924', 0),
(948, '3649115943', 186, 1914, '3870014922', '2601461056', 0),
(949, '3870017023', 212, 1079, '2601537846', '4515537769', 0),
(950, '3649109156', 200, 1889, '1601322655', '2601410737', 0),
(951, '3649106698', 199, 1098, '3870013035', '2601394920/4513923665', 0),
(952, '3649114942', 200, 1732, '1601456735', '2601456735', 0),
(953, '3649104899', 215, 942, '3870012610', '2601380394/4513921764', 0),
(954, '3649109291', 206, 1029, '3870013492', '2601411506/4514304553', 0),
(955, '3649107020/3649106953/3649107019/', 191, 1621, '3870013113', '2601393184/2601395400', 0),
(956, '3649110632', 199, 1573, '3870013744', '2601424918/4513923666', 0),
(957, '3649118625', 188, 1435, '3870015496', '2601481362', 0),
(958, '3649104622', 200, 1267, '2601375267', '1601293267', 0),
(959, '3649107711/3870013264', 206, 1602, '2601400398', '4514141746', 0),
(960, '3649125117', 215, 1017, '3870016590', '2601504099', 0),
(961, '3649119701', 188, 1463, '3870015659', '2601490974', 0),
(962, '3649100872', 200, 1420, '3649100872', '2601349527/1601265951', 0),
(963, '3649128071', 206, 1653, '3870016948', '2601541837', 0),
(964, '3649111092', 200, 1460, '1601337125', '2601427991', 0),
(965, '3649120985', 224, 916, '3870015906', '2601494407', 0),
(966, '3649118534', 214, 1115, '3870015477', '2601479306', 0),
(967, '3649115746', 219, 1615, '2601459767', 'nan', 0),
(968, '3649118635', 215, 1386, '3870015547', '2601482531', 0),
(969, '3649101757', 207, 1706, '3870011994', '2601350907/4513785746', 0),
(970, '3649109419', 200, 1901, '1601325086', '2601413442', 0),
(971, '3649101220', 215, 864, '3870011951', '2601352619/4513778083', 0),
(972, '3649127333', 183, 1366, '3870016807', '2601535018', 0),
(973, '3649105478', 195, 1077, '3870012800', '2601384908/4513936015', 0),
(974, '3649109284/3649109285', 207, 1746, '3870013517/3870013524', '2601403727', 0),
(975, '3649111172/', 206, 1829, '3870013896', '2601426544/45144448625', 0),
(976, '3649121113', 224, 1262, '3870015960', '2601499509', 0),
(977, '3649109714', 224, 937, '3870013574', '2601414290/4514029188', 0),
(978, '3649107882/3870013291', 214, 1797, '2601402102', '4514037052', 0),
(979, '3649124284', 206, 1015, '3870016480', '2601519964', 0),
(980, '3649109611', 196, 1554, '2601416949', '4514364020', 0),
(981, '3649114060', 215, 999, '3870014622', '2601447732', 0),
(982, '3649130353', 206, 1313, '3870017268', '2601553644', 0),
(983, '3649113114', 183, 1361, '3870014356', '2601445034', 0),
(984, '3649116894', 206, 1512, '3870015058', '2601470893', 0),
(985, '3649105480', 199, 1010, '3870012776', '2601379208/4513923675', 0),
(986, '3649130555', 200, 1521, '1601443457', '2601558485', 0),
(987, '3649104349', 214, 1355, '4513907760', '2601375508', 0),
(988, '3649101586', 200, 871, 'nan', '2601355487', 0),
(989, '3649101762', 215, 1441, '3870012071', '2601358357/4513758835', 0),
(990, '3649101200', 198, 1546, '3870011907', '2601354792/4513801967', 0),
(991, '3649128062', 195, 963, '3870016961', '2601538787', 0),
(992, '3649117486', 200, 979, '2601475715', '1601375081', 0),
(993, '2601368275', 182, 1845, '3870012548', '4513928881', 0),
(994, '3649107992/3649107991', 224, 1394, '3870013293/3870013200', '2601402789/2601402738', 0),
(995, '3649130662', 200, 992, '1601444136', '2601559192', 0),
(996, '3649108851', 193, 926, '3870013434', '2601408887', 0),
(997, '3649124542', 200, 1842, '1601404547', '2601511415', 0),
(998, '3649109604', 200, 953, '2601415133', 'nan', 0),
(999, '3870012261', 214, 1230, '4513908116', '2601366870', 0),
(1000, '3649112706', 195, 925, '3870014260', '2601441053', 0),
(1001, '3649117522/3649117528', 215, 1240, '2601474221/2601474982', '4514934728/4514934740', 0),
(1002, '3649117280/3649117107', 224, 1275, '3870015139', '2601463268', 0),
(1003, '3649129224', 186, 1328, '3870017066', '2601547513', 0),
(1004, '3649130296', 200, 1120, '1601442037', '2601556502', 0),
(1005, '3649121315', 207, 1268, '3870015928', '2601501258', 0),
(1006, '3649111830', 184, 955, '3870014018', '2601429560', 0),
(1007, '3649107309/3649107306/3649107308/3649107307/', 200, 1144, 'nan', '1601311447/1601303649/1601303604/', 0),
(1008, '3649112023', 193, 1406, '3870013578', '2601416267', 0),
(1009, '3649104624', 200, 1833, '2601375282', '1601293735', 0),
(1010, '3679103851', 199, 1189, '3870012950', '2601392179/4514141687', 0),
(1011, '3649119673/3649119672/3649119671', 224, 1438, '3870015667', '2601485844', 0),
(1012, '3649117155/3649117156', 215, 1294, '2601473797/2601473797', '4514934728/4514946190', 0),
(1013, '3649116298', 200, 1773, '2601468627', '1601366386', 0),
(1014, '3649107109', 224, 1841, '3870013167', '2601394923/4514167492', 0),
(1015, '3649115390', 206, 1623, '3870014839', '2601461045', 0),
(1016, '3649128564', 200, 1343, '1601432983', '2601545613', 0),
(1017, '3649101459', 184, 1320, '3870011987', '2601349012/4513778085', 0),
(1018, '3649112012', 215, 1114, '2601436090', '4514448253', 0),
(1019, '3649117374', 185, 1410, '3870015144', '2601469456', 0),
(1020, '3649119844', 186, 1473, '3870015714', '2601489488', 0),
(1021, '3649128422', 182, 1448, '3870016977', '2601544575', 0),
(1022, '3649109758', 215, 1376, '2601414532', '2601414532', 0),
(1023, '3649117270', 188, 1870, '3870015157', '2601474885', 0),
(1024, '3649105943', 186, 1241, '3870012861', '2601386544/4513920720', 0),
(1025, '3649101218', 184, 1443, '3870011952', '2601352012/4513778099', 0),
(1026, '3870013999', 212, 1680, '2601434735', '4513968248', 0),
(1027, '3649113273', 207, 1863, '3870014387', '2601440280', 0),
(1028, '3649120971', 195, 1088, '3870015898', '2601494083', 0),
(1029, '3649105516', 196, 1104, '3870012779', '2601386031/4513962643', 0),
(1030, '3649105739/3649105740', 214, 1265, '3870012835/', '2601385070/2601386943', 0),
(1031, '3649124078', 216, 1298, '2601519946', '4514621460', 0),
(1032, '3649129766', 189, 1905, '3870017156', '2601552612', 0),
(1033, '3649113543', 224, 1578, '3870014426', '2601445019', 0),
(1034, '3649106814', 184, 1342, '3870013062', '2601389744', 0),
(1035, '3649106031', 207, 1687, '3870012859', '2601386025/4514070585', 0),
(1036, '3649113715/3649113822', 184, 1184, '3870014526/', '2601449891', 0),
(1037, '3649101202', 186, 1019, '3870011966', '2601355746/4513829101', 0),
(1038, '3649109136', 199, 1297, '3870013510', '4513923666', 0),
(1039, '3649117681', 215, 1412, '2601476699', '4514946189', 0),
(1040, '3649117529', 188, 1224, '2601472284', '387001197', 0),
(1041, '3649128814', 187, 1434, '3870017010', '2601545754', 0),
(1042, '3694124507', 200, 927, '1601404550', '2601511414', 0),
(1043, '3649123557', 195, 1310, '3870016286', '2601510900', 0),
(1044, '3649111972', 193, 957, '3870014066', '2601425599', 0),
(1045, '3649113809', 217, 873, '3870014525', '2601441719', 0),
(1046, '3649113790', 198, 1532, '3870014452', '2601449868', 0),
(1047, '3649105933', 214, 1024, '3870012878', '2601388707/4514115783', 0),
(1048, '3649102954', 193, 1374, '2601358347', '4513737405', 0),
(1049, '3649109135', 202, 1886, '3870013472', '/4513998152', 0),
(1050, '3649122058', 206, 1247, '3870016006', '2601505488', 0),
(1051, '3649116398', 214, 951, '3870015041', '2601468738', 0),
(1052, '3649105335', 184, 1753, '3870012715', '2601376481', 0),
(1053, '3649126135', 186, 1699, '3870016673', '2601528836', 0),
(1054, '3870012277', 193, 1646, '3649103456', '4513907211', 0),
(1055, '3649112334', 224, 1737, '3870014157', '2601438810', 0),
(1056, '3649114457', 193, 1677, '2601453557', '3870014650', 0),
(1057, '3649125350/3649125351', 215, 1601, '3870016596/3870016597', '2601525882/2601525443', 0),
(1058, '3649101197', 193, 1480, '3870011958', '2601355092/4513737405', 0),
(1059, '3649106119/3649106120', 199, 1164, '3870012881/3870012930', '2601389727/2601380446/4514031298/4513923665', 0),
(1060, '3649112017', 199, 888, '3870014048', '2601435056/4514208264', 0),
(1061, '3649113260', 200, 1786, '1601353046', '2601447846', 0),
(1062, '3649126704', 206, 1828, '3870016731', '2601530335', 0),
(1063, '3649104589', 215, 1727, '3870012483', '2601375148/4513930436', 0),
(1064, '3649120863', 186, 887, '3870015879', '2360149903', 0),
(1065, '3649108917', 215, 1525, '3870013461', '2601411499/4514283110', 0),
(1066, '3649119284', 206, 1243, '2601486720', '4515016557', 0),
(1067, '3649111970', 209, 1683, '3870014012', '2601433980/4514446824', 0),
(1068, '3649124392', 189, 1263, '3870016506', '2601512802', 0),
(1069, '3649121348', 199, 1937, '3870015979', '2601502425', 0),
(1070, '3649100441', 195, 1321, '3870011825', '2601346152/4513736970', 0),
(1071, '3649110797', 224, 1188, '3870013787', '2601423912', 0),
(1072, '3649111816', 184, 1119, '3870014013', '2601435560', 0),
(1073, '3649109647', 214, 1023, '3870013586', '2601415446/4514076765', 0),
(1074, '3649104200/3649104201/3649104199', 184, 1097, '2601369566/3870012326/3870012325', 'nan', 0),
(1075, '3649105268/3649105267', 195, 901, '3870012720/3870012719', '2601379758/2601384202', 0),
(1076, '3649110631', 206, 1055, '3870013743', '2601424893/4514448625', 0),
(1077, '3649115251', 215, 1466, '2601460836', '4514760147', 0),
(1078, '3649106314', 195, 1103, '3870012969', '2601387442', 0),
(1079, '3649120848', 186, 1317, '3870015846', '2601497249', 0),
(1080, '3649111089', 200, 1722, '1601337127', '2601427993', 0),
(1081, '3649107108', 217, 1350, '2601397517', '3870013137', 0),
(1082, '3649123948', 186, 1101, '3870016426', '2601508293', 0),
(1083, '3649104719', 186, 1524, '3870012476', '4513921297', 0),
(1084, '3649109623', 200, 1744, '2601414604', 'nan', 0),
(1085, '3649105113', 215, 1686, '3870012676', '2601380757', 0),
(1086, '3649101036', 195, 1163, '3870011903', '2601351833/4513736970', 0),
(1087, '3649099800', 195, 1353, '3870011780', '2601345949/4513736970', 0),
(1088, '3649130347', 183, 1051, '3870017314', '2601557093', 0),
(1089, '3649129418', 199, 1940, '3870017115', '2601547969', 0),
(1090, '3649112463', 193, 1496, '3870014182', '2601438843', 0),
(1091, '3649114940', 200, 1856, '1601359985', '2601456736', 0),
(1092, '3649119532/3649119533', 198, 1309, '3870015633/', '2601488336/2601487385', 0),
(1093, '3649117149', 214, 1447, '3870015164', '2601474300', 0),
(1094, '3649113653', 193, 1741, '3870014427', '2601445831', 0),
(1095, '3649118324', 206, 1523, '3870015451', '2601482189', 0),
(1096, '3649117992', 200, 1171, '1601379293', '2601480880', 0),
(1097, '3649103459', 214, 1061, '4513956589', '2601370279', 0),
(1098, '3649115546', 206, 1603, '3870014871', '2601458077', 0),
(1099, '3649111095', 200, 1423, '1601337101', '2601427989', 0),
(1100, '3649111602', 193, 1004, '3870013986', '2601431863', 0),
(1101, '3649103438', 193, 967, '3870012278', '2601365873/4513908112', 0),
(1102, '3649120978', 183, 1895, '3870015880', '2601499696', 0),
(1103, '3649114465', 208, 1751, '3870014643', '4514751879', 0),
(1104, '3649107310', 200, 990, '1601312962', '2601398399', 0),
(1105, '3649111964', 224, 1557, '3870014056', '2601433510', 0),
(1106, '3649123464', 195, 982, '3870019284', '2601505592', 0),
(1107, '3649109608', 193, 1202, '3870013577', '2601416264', 0),
(1108, '3649112700', 195, 1364, '3870014217', '2601441723', 0),
(1109, '3649119419/3649119418', 193, 1538, '3870015628/', '2601486975/2601486976', 0),
(1110, '3649115025', 184, 1347, '2601458790', '4514765458', 0),
(1111, '3649114932', 184, 1470, '2601458047', '4514785864', 0),
(1112, '3649106174', 204, 1060, '3870012781', '2601377205/45139626454', 0),
(1113, '3649112454', 200, 1878, '1601347172', '2601440721', 0),
(1114, '3649124287', 200, 1693, '2601514441', '1601406648', 0),
(1115, '3649125972', 200, 1180, '1601418315', '2601528397', 0),
(1116, '3649109355', 214, 912, '3870013549', '2601407060/4514037052', 0),
(1117, '3649105691', 195, 1249, '3870012836/4513935634', 'nan', 0),
(1118, '3649118535', 215, 1283, '3870015531', '2601482180', 0),
(1119, '3649125392', 193, 1566, '3870016595', '2601524786', 0),
(1120, '3649112455', 207, 1472, '3870014163', '2601440285', 0),
(1121, '3649117995', 200, 1927, '2601480881', '1601379294', 0),
(1122, '3649112925', 224, 1468, '2601442617', '3870014338', 0),
(1123, '3649130857', 200, 1697, '1601445362', '2601560477', 0),
(1124, '3649120864/3649121010', 207, 1129, '3870015798/3870015798', '2601493714/2601496305', 0),
(1125, '3649118542', 193, 1774, '3870015468', '2601481620', 0),
(1126, '3649118680', 184, 1237, '3870015559', '2601483270', 0),
(1127, '3649113638', 186, 1437, '3870014455', '2601449306/4514302225', 0),
(1128, '3649112747', 195, 1932, '3870014280', '2601441700/4514588640', 0),
(1129, '545', 215, 45646, '5456', '5654656', 0),
(1131, '455545', 215, 45646, '545', '5454554', 0),
(1132, '25445', 184, 1964, '545', '54545', 0),
(1133, 'dfghdgh', 215, 1960, 'dfsqdafa', 'dsfdfsaad', 0),
(1134, '456546', 215, 1960, '8767', '76868', 0),
(1135, '555', 202, 1961, '24', '154', 0),
(1136, '6565', 192, 1963, '5454', '45454', 0);

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
  `supportPercentage` double NOT NULL DEFAULT '0.09',
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedata`
--

INSERT INTO `invoicedata` (`id`, `invoice`, `brand`, `usdVal`, `supportPercentage`) VALUES
(1502, '223', 9, 11246.66, 0.12),
(1503, '459', 9, 10805.51, 0.12),
(1504, '593', 7, 13751.080000000002, 0.12),
(1505, '593', 8, 10513.380000000001, 0.11),
(1506, '593', 13, 3955.58, 0.11),
(1507, '1017', 7, 19083.82, 0.12),
(1508, '499', 9, 18582.84, 0.12),
(1509, '625', 8, 11839.98, 0.11),
(1510, '382', 8, 12193.44, 0.11),
(1511, '298', 9, 12682.14, 0.12),
(1512, '124', 9, 17280.6, 0.12),
(1513, '572', 7, 8902.71, 0.12),
(1514, '572', 8, 15456.14, 0.11),
(1515, '1025', 12, 3794.8, 0.12),
(1516, '1025', 7, 840.96, 0.12),
(1517, '1025', 8, 62311.60999999999, 0.11),
(1518, '856', 7, 350394.54, 0.12),
(1519, '299', 8, 232970.03, 0.11),
(1520, '577', 7, 60864.96, 0.12),
(1521, '194', 9, 21690.75, 0.1),
(1522, '181', 9, 4752, 0.1),
(1523, '843', 11, 9729.92, 0.1),
(1524, '533', 11, 17686.77, 0.1),
(1525, '533', 8, 1559.06, 0.09),
(1526, '184', 9, 9280.89, 0.1),
(1527, '884', 11, 14724.6, 0.1),
(1528, '1058', 9, 4752, 0.1),
(1529, '845', 8, 60736.5, 0.09),
(1530, '845', 11, 3406.99, 0.1),
(1531, '247', 9, 23463, 0.1),
(1532, '375', 12, 338.1, 0.1),
(1533, '375', 8, 1504.8, 0.09),
(1534, '375', 13, 1696.8, 0.09),
(1535, '375', 11, 6616.120000000001, 0.1),
(1536, '201', 12, 428.45, 0.1),
(1537, '201', 6, 999.9, 0.1),
(1538, '201', 9, 16464.48, 0.1),
(1539, '866', 11, 17948.510000000002, 0.1),
(1540, '866', 9, 18691.770000000004, 0.1),
(1541, '501', 11, 24216.85, 0.1),
(1542, '501', 7, 8125.79, 0.1),
(1543, '782', 9, 6058.8, 0.1),
(1544, '275', 12, 6427.9400000000005, 0.1),
(1545, '275', 8, 2260.08, 0.09),
(1546, '275', 7, 9852.15, 0.1),
(1547, '275', 9, 35081.64, 0.1),
(1548, '737', 7, 8158.77, 0.1),
(1549, '737', 13, 48.54, 0.09),
(1550, '737', 11, 34531.77, 0.1),
(1551, '737', 12, 1732.8, 0.1),
(1552, '737', 9, 4833, 0.1),
(1553, '755', 12, 22626.69, 0.1),
(1554, '755', 9, 28889.149999999998, 0.1),
(1555, '121', 11, 45476, 0.1),
(1556, '121', 7, 4491, 0.1),
(1557, '121', 6, 7493.4, 0.1),
(1558, '478', 11, 13221.63, 0.1),
(1559, '478', 8, 10910.26, 0.09),
(1560, '478', 9, 10309.92, 0.1),
(1561, '684', 12, 1308.6, 0.1),
(1562, '684', 8, 2774.1, 0.09),
(1563, '684', 9, 2008.38, 0.1),
(1564, '368', 12, 2105.2, 0.1),
(1565, '368', 11, 7163.33, 0.1),
(1566, '368', 8, 603.14, 0.09),
(1567, '93', 11, 3711.1, 0.1),
(1568, '93', 9, 3893.76, 0.1),
(1569, '886', 7, 11457.93, 0.1),
(1570, '886', 12, 5391.969999999999, 0.1),
(1571, '886', 8, 9987.199999999999, 0.09),
(1572, '886', 11, 271.75, 0.1),
(1573, '372', 7, 4510.89, 0.1),
(1574, '372', 12, 3339.6, 0.1),
(1575, '372', 11, 7701.650000000001, 0.1),
(1576, '372', 13, 9507.2, 0.09),
(1577, '372', 9, 6011.529999999996, 0.1),
(1578, '176', 13, 55606.33, 0.09),
(1579, '176', 8, 16100.419999999998, 0.09),
(1580, '284', 13, 29984.2, 0.09),
(1581, '284', 8, 2084.95, 0.09),
(1582, '104', 13, 35266.5, 0.09),
(1583, '104', 8, 44332.42, 0.09),
(1584, '885', 8, 48396.8, 0.09),
(1585, '885', 13, 18513, 0.09),
(1586, '339', 8, 55003.48, 0.09),
(1587, '339', 13, 50238.5, 0.09),
(1588, '713', 8, 75224.04, 0.09),
(1589, '713', 13, 48559.64, 0.09),
(1590, '666', 13, 73911.73999999999, 0.09),
(1591, '666', 8, 38934.93000000001, 0.09),
(1592, '789', 13, 23541, 0.09),
(1593, '789', 8, 28863.12, 0.09),
(1594, '650', 13, 19213.56, 0.09),
(1595, '650', 8, 4098.07, 0.09),
(1596, '83', 13, 24208.8, 0.09),
(1597, '83', 8, 3060.2, 0.09),
(1598, '915', 13, 27177.3, 0.09),
(1599, '744', 11, 22372.239999999998, 0.12),
(1600, '744', 9, 25261.78, 0.12),
(1601, '636', 12, 8598.26, 0.12),
(1602, '636', 11, 2628.56, 0.12),
(1603, '636', 8, 68.28, 0.11),
(1604, '646', 6, 7632.9, 0.12),
(1605, '646', 12, 1152.4, 0.12),
(1606, '646', 11, 839.8, 0.12),
(1607, '289', 11, 3677.75, 0.12),
(1608, '289', 12, 1809, 0.12),
(1609, '289', 8, 2162.2, 0.11),
(1610, '289', 9, 20575.68, 0.12),
(1611, '1086', 11, 10479.14, 0.12),
(1612, '1087', 11, 1167.48, 0.12),
(1613, '1087', 9, 25575.74, 0.12),
(1614, '757', 11, 2699.5999999999985, 0.12),
(1615, '757', 12, 27375.32, 0.12),
(1616, '757', 9, 3190, 0.12),
(1617, '493', 12, 7348.85, 0.12),
(1618, '853', 11, 135.8, 0.12),
(1619, '853', 9, 42056.28, 0.12),
(1620, '682', 12, 31641.84, 0.12),
(1621, '874', 8, 9707.02, 0.11),
(1622, '874', 12, 5332.42, 0.12),
(1623, '874', 8, 9798.02, 0.11),
(1624, '874', 9, 6239.370000000001, 0.12),
(1625, '962', 8, 188260, 0.11),
(1626, '439', 8, 301623, 0.11),
(1627, '988', 8, 116203.5, 0.11),
(1628, '620', 8, 135525, 0.11),
(1629, '990', 8, 27342, 0.09),
(1630, '575', 8, 13671, 0.09),
(1631, '795', 12, 7407.95, 0.1),
(1632, '608', 8, 45921.6, 0.11),
(1633, '1037', 8, 45921.6, 0.11),
(1634, '969', 8, 20451.38, 0.11),
(1635, '421', 15, 31612.2, 0.09),
(1636, '568', 14, 18244.4, 0.1),
(1637, '668', 14, 9520, 0.1),
(1638, '734', 15, 32132, 0.09),
(1639, '837', 12, 29210.96, 0.1),
(1640, '896', 8, 11542.21, 0.09),
(1641, '399', 8, 24621.64, 0.09),
(1642, '609', 11, 4199.27, 0.1),
(1643, '609', 13, 1051.24, 0.09),
(1644, '609', 9, 4193.64, 0.1),
(1645, '767', 8, 1652.8000000000002, 0.09),
(1646, '767', 11, 362.17, 0.1),
(1647, '767', 9, 8509.59, 0.1),
(1648, '540', 13, 2338.56, 0.09),
(1649, '540', 7, 354.65, 0.1),
(1650, '540', 11, 3261, 0.1),
(1651, '540', 8, 5811.099999999999, 0.09),
(1652, '206', 12, 1132.3, 0.1),
(1653, '206', 8, 5478.23, 0.09),
(1654, '206', 11, 4304.52, 0.1),
(1655, '206', 9, 428.64, 0.1),
(1656, '637', 11, 3739.28, 0.1),
(1657, '637', 7, 1279.95, 0.1),
(1658, '637', 8, 3529.89, 0.09),
(1659, '637', 9, 5414.4, 0.1),
(1660, '628', 12, 5212.8, 0.1),
(1661, '628', 7, 12468.48, 0.1),
(1662, '76', 7, 11378.52, 0.1),
(1663, '76', 12, 4455.89, 0.1),
(1664, '916', 12, 4928.97, 0.1),
(1665, '916', 7, 107221.09, 0.1),
(1666, '916', 8, 10099.42, 0.09),
(1667, '916', 9, 61129.94, 0.1),
(1668, '155', 9, 9813.6, 0.1),
(1669, '417', 9, 11208.66, 0.1),
(1670, '163', 11, 12135.52, 0.1),
(1671, '987', 11, 16611.26, 0.1),
(1672, '987', 9, 6354.48, 0.1),
(1673, '1097', 11, 30245.52, 0.1),
(1674, '768', 11, 2420.1000000000004, 0.1),
(1675, '768', 7, 3430.36, 0.1),
(1676, '768', 9, 17037.809999999998, 0.1),
(1677, '53', 12, 8522.4, 0.1),
(1678, '53', 11, 4872.04, 0.1),
(1679, '53', 7, 1736, 0.1),
(1680, '260', 13, 1219.68, 0.09),
(1681, '260', 9, 27608.84, 0.1),
(1682, '676', 7, 2352.46, 0.1),
(1683, '676', 11, 361.33000000000004, 0.1),
(1684, '676', 9, 7273.24, 0.1),
(1685, '74', 9, 35700.51, 0.1),
(1686, '601', 11, 11937.699999999999, 0.1),
(1687, '601', 12, 12089.859999999999, 0.1),
(1688, '601', 9, 1626.9000000000015, 0.1),
(1689, '848', 7, 3246.21, 0.1),
(1690, '848', 8, 5455.73, 0.09),
(1691, '848', 11, 2347.8, 0.1),
(1692, '848', 9, 9376.11, 0.1),
(1693, '597', 13, 771.84, 0.09),
(1694, '597', 9, 8179.16, 0.1),
(1695, '394', 9, 2584.44, 0.1),
(1696, '999', 7, 405.45, 0.1),
(1697, '999', 11, 3708, 0.1),
(1698, '999', 9, 2679.6, 0.1),
(1699, '212', 7, 24745.500000000015, 0.12),
(1700, '212', 9, 46995.23999999999, 0.12),
(1701, '610', 12, 11934.3, 0.12),
(1702, '610', 9, 11048.4, 0.12),
(1703, '771', 12, 5016.99, 0.12),
(1704, '771', 9, 1686.96, 0.12),
(1705, '320', 12, 10480.51, 0.12),
(1706, '1054', 9, 17894.85, 0.1),
(1707, '253', 9, 4296, 0.1),
(1708, '450', 9, 13199.82, 0.1),
(1709, '811', 9, 4752, 0.1),
(1710, '1048', 8, 8141.15, 0.09),
(1711, '1048', 7, 4721.24, 0.1),
(1712, '1101', 8, 9488.519999999999, 0.09),
(1713, '1101', 11, 18118.4, 0.1),
(1714, '517', 11, 11231.22, 0.1),
(1715, '553', 11, 47488.39, 0.1),
(1716, '553', 8, 462.6, 0.09),
(1717, '57', 11, 11372.96, 0.1),
(1718, '57', 7, 2918.48, 0.1),
(1719, '57', 8, 4305.4, 0.09),
(1720, '849', 11, 43848.37, 0.1),
(1721, '548', 11, 10186.59, 0.1),
(1722, '739', 12, 2468.84, 0.1),
(1723, '739', 8, 9877.35, 0.09),
(1724, '958', 8, 44269.979999999996, 0.11),
(1725, '958', 13, 6946, 0.11),
(1726, '1009', 8, 143310.55, 0.11),
(1727, '30', 8, 71521.82, 0.11),
(1728, '482', 12, 29674, 0.12),
(1729, '929', 8, 37856.5, 0.11),
(1730, '199', 8, 22960.8, 0.11),
(1731, '1083', 8, 22960.8, 0.11),
(1732, '228', 8, 11480.4, 0.11),
(1733, '742', 8, 11289.06, 0.11),
(1734, '513', 8, 2010.17, 0.09),
(1735, '513', 13, 7440.510000000001, 0.09),
(1736, '513', 11, 65.1, 0.1),
(1737, '513', 9, 4900.5, 0.1),
(1738, '392', 13, 1342.94, 0.09),
(1739, '392', 7, 2350.56, 0.1),
(1740, '392', 9, 38465.82, 0.1),
(1741, '993', 8, 19864.25, 0.11),
(1742, '249', 8, 12672, 0.11),
(1743, '787', 14, 18814.95, 0.1),
(1744, '641', 14, 8882.1, 0.1),
(1745, '570', 11, 11201.960000000001, 0.1),
(1746, '310', 9, 8699.4, 0.1),
(1747, '204', 8, 14386.9, 0.09),
(1748, '204', 13, 8500.14, 0.09),
(1749, '376', 13, 77583.75, 0.09),
(1750, '376', 8, 25555.199999999997, 0.09),
(1751, '834', 8, 18259.78, 0.09),
(1752, '834', 13, 47544.920000000006, 0.09),
(1753, '699', 8, 5507.700000000001, 0.09),
(1754, '699', 13, 22521.269999999997, 0.09),
(1755, '341', 12, 19080.27, 0.12),
(1756, '341', 7, 3537.85, 0.12),
(1757, '341', 8, 5597.96, 0.11),
(1758, '827', 12, 8318.76, 0.12),
(1759, '592', 11, 6920.639999999999, 0.12),
(1760, '592', 8, 3605.25, 0.11),
(1761, '592', 12, 22552.789999999997, 0.12),
(1762, '592', 7, 1838.27, 0.12),
(1763, '908', 12, 16712.4, 0.12),
(1764, '813', 12, 2412, 0.12),
(1765, '813', 11, 32096.25, 0.12),
(1766, '157', 11, 12518.4, 0.12),
(1767, '794', 11, 8967.560000000001, 0.12),
(1768, '794', 7, 8729.34, 0.12),
(1769, '851', 8, 22960.76, 0.09),
(1770, '306', 13, 8972.04, 0.11),
(1771, '740', 13, 5356.8, 0.11),
(1772, '530', 8, 23130.54, 0.11),
(1773, '594', 8, 46302.8, 0.11),
(1774, '831', 8, 22960.8, 0.11),
(1775, '488', 8, 1353.7, 0.11),
(1776, '488', 13, 13125.33, 0.11),
(1777, '213', 13, 13973.35, 0.09),
(1778, '627', 13, 2764.2, 0.09),
(1779, '627', 8, 16372.65, 0.09),
(1780, '466', 8, 4068.75, 0.09),
(1781, '466', 13, 4561.4400000000005, 0.09),
(1782, '208', 8, 4496.6, 0.09),
(1783, '244', 8, 8054.41, 0.09),
(1784, '244', 13, 17671.5, 0.09),
(1785, '698', 13, 25667.95, 0.09),
(1786, '1059', 13, 50073.96, 0.09),
(1787, '1059', 8, 2525.04, 0.09),
(1788, '942', 13, 18536.100000000002, 0.09),
(1789, '942', 8, 4263.44, 0.09),
(1790, '221', 13, 67917.84, 0.09),
(1791, '221', 8, 33826.41, 0.09),
(1792, '951', 8, 2468.4, 0.09),
(1793, '951', 13, 25938, 0.09),
(1794, '985', 13, 46952.509999999995, 0.09),
(1795, '985', 8, 19030.749999999996, 0.09),
(1796, '733', 8, 13404.3, 0.09),
(1797, '733', 13, 124678.29, 0.09),
(1798, '906', 8, 34716.270000000004, 0.09),
(1799, '906', 13, 72441.11, 0.09),
(1800, '1010', 12, 152935.94, 0.1),
(1801, '186', 15, 28579.32, 0.09),
(1802, '558', 15, 16066, 0.09),
(1803, '649', 15, 25997.9, 0.09),
(1804, '453', 15, 32132, 0.09),
(1805, '1029', 15, 27644.6, 0.09),
(1806, '770', 12, 8340.99, 0.1),
(1807, '98', 8, 13752.96, 0.09),
(1808, '198', 8, 10664.38, 0.09),
(1809, '702', 8, 2084.64, 0.11),
(1810, '702', 7, 1179.75, 0.12),
(1811, '702', 11, 1125.2, 0.12),
(1812, '702', 12, 24523.050000000003, 0.12),
(1813, '702', 9, 2893.77, 0.12),
(1814, '514', 12, 22900.8, 0.12),
(1815, '514', 7, 119.55, 0.12),
(1816, '1117', 7, 5596.92, 0.12),
(1817, '1117', 11, 11503.54, 0.12),
(1818, '1117', 12, 5263.2, 0.12),
(1819, '1117', 9, 6790.05, 0.12),
(1820, '714', 11, 34459.77, 0.12),
(1821, '551', 12, 6802.5, 0.12),
(1822, '551', 7, 11723.279999999999, 0.12),
(1823, '551', 8, 32963.84, 0.11),
(1824, '551', 13, 16.8, 0.11),
(1825, '330', 12, 2772, 0.12),
(1826, '330', 11, 2086.4, 0.12),
(1827, '330', 7, 4539.6, 0.12),
(1828, '330', 12, 557.48, 0.12),
(1829, '687', 11, 10294.77, 0.12),
(1830, '973', 8, 9850.400000000001, 0.11),
(1831, '973', 12, 2024.87, 0.12),
(1832, '112', 12, 22688.21, 0.12),
(1833, '1075', 8, 3312.9, 0.11),
(1834, '1075', 11, 3181.99, 0.12),
(1835, '1075', 12, 2650.3100000000004, 0.12),
(1836, '815', 12, 4890.2300000000005, 0.1),
(1837, '815', 13, 2256.32, 0.09),
(1838, '815', 7, 11677.5, 0.1),
(1839, '457', 13, 3043.1099999999997, 0.09),
(1840, '457', 12, 3174.06, 0.1),
(1841, '457', 8, 729.96, 0.09),
(1842, '457', 6, 4029.3, 0.1),
(1843, '901', 9, 13290.75, 0.1),
(1844, '931', 8, 3631.92, 0.09),
(1845, '931', 11, 3626.04, 0.1),
(1846, '931', 9, 5402.22, 0.1),
(1847, '1047', 11, 5915.91, 0.1),
(1848, '1047', 9, 12046.32, 0.1),
(1849, '1030', 11, 35220.23, 0.1),
(1850, '1030', 9, 3034.32, 0.1),
(1851, '25', 6, 1782, 0.1),
(1852, '25', 7, 75480.37, 0.1),
(1853, '25', 13, 1673.28, 0.09),
(1854, '25', 8, 27524.31, 0.09),
(1855, '408', 11, 7818.16, 0.1),
(1856, '408', 8, 30544.64, 0.09),
(1857, '408', 13, 84, 0.09),
(1858, '897', 7, 12365.16, 0.1),
(1859, '897', 8, 5797.12, 0.09),
(1860, '897', 11, 5770.1, 0.1),
(1861, '486', 11, 8201.810000000001, 0.1),
(1862, '486', 12, 2314.2, 0.1),
(1863, '486', 8, 7288.38, 0.09),
(1864, '686', 11, 21488.940000000002, 0.1),
(1865, '686', 13, 1001.88, 0.09),
(1866, '686', 7, 12025.36, 0.1),
(1867, '686', 9, 886.05, 0.1),
(1868, '381', 11, 19857.96, 0.1),
(1869, '125', 12, 4569.25, 0.1),
(1870, '125', 13, 13288.5, 0.09),
(1871, '125', 11, 729.36, 0.1),
(1872, '125', 7, 9307.01, 0.1),
(1873, '125', 8, 10.94, 0.09),
(1874, '125', 9, 13534.88, 0.1),
(1875, '717', 11, 29916.46, 0.1),
(1876, '717', 8, 1480.95, 0.09),
(1877, '259', 7, 29876.79, 0.12),
(1878, '647', 7, 367117.47, 0.12),
(1879, '109', 8, 113753.53, 0.11),
(1880, '729', 8, 115333.42, 0.11),
(1881, '955', 8, 141431.75, 0.11),
(1882, '68', 7, 34889.59, 0.12),
(1883, '1024', 8, 42567.32, 0.11),
(1884, '39', 16, 53068.84, 0.12),
(1885, '24', 8, 38340.1, 0.11),
(1886, '238', 8, 9209.48, 0.11),
(1887, '769', 13, 6026.4, 0.11),
(1888, '222', 11, 16977.920000000002, 0.1),
(1889, '222', 7, 9827.91, 0.1),
(1890, '978', 7, 4917.3135, 0.1),
(1891, '978', 11, 22815.579999999998, 0.1),
(1892, '978', 8, 8816.726500000004, 0.09),
(1893, '978', 9, 16502.45, 0.1),
(1894, '489', 12, 4130.15, 0.1),
(1895, '489', 13, 715.44, 0.09),
(1896, '1073', 11, 40226.299999999996, 0.1),
(1897, '1073', 7, 3020.02, 0.1),
(1898, '1073', 9, 1793.31, 0.1),
(1899, '1116', 7, 70.7, 0.1),
(1900, '1116', 11, 975, 0.1),
(1901, '1116', 6, 10393.74, 0.1),
(1902, '656', 12, 8006.479999999999, 0.1),
(1903, '656', 9, 12971.939999999999, 0.1),
(1904, '383', 8, 837.2, 0.09),
(1905, '383', 13, 555.45, 0.09),
(1906, '383', 9, 7356.839999999999, 0.1),
(1907, '954', 8, 7988.36, 0.09),
(1908, '954', 13, 21358.73, 0.09),
(1909, '523', 8, 47844.3, 0.09),
(1910, '523', 13, 9787.470000000001, 0.09),
(1911, '644', 8, 22612.72, 0.11),
(1912, '678', 13, 5615.94, 0.11),
(1913, '243', 8, 14500.08, 0.09),
(1914, '235', 8, 48908.4, 0.09),
(1915, '693', 7, 130011.53, 0.12),
(1916, '291', 8, 23183.3, 0.11),
(1917, '430', 7, 555.93, 0.12),
(1918, '430', 11, 6540, 0.12),
(1919, '430', 9, 9205.38, 0.12),
(1920, '725', 12, 7772.52, 0.12),
(1921, '343', 12, 12899.739999999998, 0.12),
(1922, '343', 11, 3492.7200000000003, 0.12),
(1923, '343', 7, 6491.07, 0.12),
(1924, '434', 11, 5180.02, 0.12),
(1925, '434', 7, 2080.8, 0.12),
(1926, '434', 8, 17173.74, 0.11),
(1927, '147', 12, 187752.08, 0.12),
(1928, '147', 9, 4208.4, 0.12),
(1929, '573', 13, 26050.52, 0.09),
(1930, '953', 7, 5100.21, 0.12),
(1931, '953', 11, 16016, 0.12),
(1932, '953', 13, 2384.64, 0.11),
(1933, '239', 7, 2346.93, 0.1),
(1934, '239', 6, 2118.6, 0.1),
(1935, '239', 9, 4437.18, 0.1),
(1936, '1112', 8, 29209.32, 0.09),
(1937, '1007', 8, 153871.8, 0.11),
(1938, '1104', 8, 48195, 0.11),
(1939, '604', 8, 208441.2, 0.11),
(1940, '358', 8, 82321.5, 0.11),
(1941, '13', 9, 20359.54, 0.12),
(1942, '892', 9, 22336.12, 0.12),
(1943, '302', 9, 31864.59, 0.12),
(1944, '591', 8, 7176.4, 0.11),
(1945, '591', 7, 9303.12, 0.12),
(1946, '72', 11, 15626.08, 0.1),
(1947, '388', 9, 18534.21, 0.1),
(1948, '881', 7, 5959.26, 0.1),
(1949, '881', 11, 3134.33, 0.1),
(1950, '881', 13, 420, 0.09),
(1951, '881', 8, 3040.9500000000003, 0.09),
(1952, '37', 11, 47107.12, 0.12),
(1953, '89', 11, 53450, 0.12),
(1954, '89', 7, 27335.270000000004, 0.12),
(1955, '367', 7, 23030.909999999996, 0.12),
(1956, '367', 12, 6491.120000000001, 0.12),
(1957, '471', 8, 7122.700000000001, 0.11),
(1958, '471', 12, 2403.8, 0.12),
(1959, '471', 7, 43305.399999999994, 0.12),
(1960, '132', 8, 14765.91, 0.11),
(1961, '132', 7, 14458.759999999998, 0.12),
(1962, '950', 8, 48540, 0.11),
(1963, '265', 8, 17395.197, 0.11),
(1964, '829', 8, 54105, 0.11),
(1965, '662', 8, 132824.91, 0.11),
(1966, '705', 8, 97080, 0.11),
(1967, '549', 8, 48195, 0.11),
(1968, '151', 8, 51408, 0.11),
(1969, '762', 8, 52689, 0.11),
(1970, '998', 8, 45189, 0.11),
(1971, '1084', 8, 42162, 0.11),
(1972, '348', 7, 135927.34, 0.12),
(1973, '210', 7, 97121.88, 0.12),
(1974, '506', 8, 6837.04, 0.11),
(1975, '506', 12, 28086.760000000002, 0.12),
(1976, '433', 11, 10577.52, 0.1),
(1977, '433', 7, 1077.83, 0.1),
(1978, '679', 12, 2920.23, 0.1),
(1979, '679', 11, 4384.78, 0.1),
(1980, '679', 7, 10672.7, 0.1),
(1981, '850', 12, 7342.68, 0.1),
(1982, '706', 13, 65573.76000000001, 0.09),
(1983, '706', 8, 148112.13999999998, 0.09),
(1984, '149', 8, 1805.18, 0.09),
(1985, '149', 13, 50742.92, 0.09),
(1986, '833', 8, 20493, 0.09),
(1987, '833', 13, 3484.92, 0.09),
(1988, '878', 7, 34216.799999999996, 0.12),
(1989, '878', 11, 83889.33000000002, 0.12),
(1990, '1065', 13, 42158.29, 0.11),
(1991, '793', 11, 58744.98, 0.12),
(1992, '830', 8, 51594.98, 0.11),
(1993, '481', 11, 35711.91, 0.1),
(1994, '750', 11, 17361.21, 0.1),
(1995, '40', 8, 11208.53, 0.09),
(1996, '476', 11, 19962.04, 0.1),
(1997, '410', 11, 22334.46, 0.1),
(1998, '353', 9, 26022.22, 0.1),
(1999, '119', 9, 29569.53, 0.12),
(2000, '101', 8, 60117.8, 0.11),
(2001, '452', 7, 80849.89, 0.12),
(2002, '819', 9, 20880, 0.12),
(2003, '806', 7, 9869.78, 0.12),
(2004, '806', 13, 18084.620000000003, 0.09),
(2005, '803', 9, 5000.7, 0.12),
(2006, '324', 8, 108337.26, 0.11),
(2007, '631', 11, 38469.87, 0.12),
(2008, '217', 11, 96861.98, 0.12),
(2009, '746', 11, 291283.9, 0.12),
(2010, '971', 11, 87968.1, 0.12),
(2011, '461', 11, 32931.36, 0.12),
(2012, '189', 8, 32437.13, 0.11),
(2013, '989', 8, 10202.98, 0.11),
(2014, '808', 8, 12316.5, 0.11),
(2015, '168', 7, 27207.76, 0.12),
(2016, '1063', 11, 47349.1, 0.12),
(2017, '344', 7, 19041.6, 0.12),
(2018, '46', 7, 38518.25, 0.12),
(2019, '563', 7, 22031.96, 0.12),
(2020, '35', 8, 24890.91, 0.11),
(2021, '900', 8, 54109.02, 0.11),
(2022, '841', 8, 178458.44, 0.11),
(2023, '47', 7, 120106.58, 0.12),
(2024, '174', 8, 55045.41, 0.11),
(2025, '479', 8, 25475, 0.11),
(2026, '106', 8, 24629.47, 0.11),
(2027, '27', 9, 18874.87, 0.12),
(2028, '334', 7, 18550.4, 0.12),
(2029, '541', 9, 24898.3, 0.12),
(2030, '741', 9, 11988, 0.12),
(2031, '327', 8, 29385.58, 0.11),
(2032, '349', 7, 23844.3, 0.12),
(2033, '468', 8, 61402.3, 0.11),
(2034, '317', 8, 28151.5, 0.11),
(2035, '867', 8, 27143.11, 0.11),
(2036, '73', 7, 71459.06, 0.12),
(2037, '1085', 9, 5136.7, 0.12),
(2038, '761', 8, 47946.27, 0.11),
(2039, '1052', 8, 15632.48, 0.11),
(2040, '738', 9, 28645.92, 0.12),
(2041, '92', 8, 55231.47, 0.11),
(2042, '622', 9, 47875.48, 0.12),
(2043, '814', 9, 11506.44, 0.12),
(2044, '52', 9, 4912, 0.12),
(2045, '669', 7, 14821.24, 0.12),
(2046, '534', 7, 15848.75, 0.1),
(2047, '225', 11, 18063.840000000004, 0.1),
(2048, '225', 9, 12046.319999999998, 0.1),
(2049, '844', 12, 187.6, 0.1),
(2050, '844', 11, 2877.93, 0.1),
(2051, '844', 8, 1705.53, 0.09),
(2052, '844', 9, 6771.6, 0.1),
(2053, '1014', 8, 19769.190000000002, 0.09),
(2054, '1014', 13, 48.54, 0.09),
(2055, '1014', 7, 7375, 0.1),
(2056, '1014', 11, 11898.18, 0.1),
(2057, '492', 12, 6448.860000000001, 0.1),
(2058, '492', 7, 958.36, 0.1),
(2059, '559', 7, 38159.59, 0.1),
(2060, '559', 9, 25275.93, 0.1),
(2061, '467', 13, 11291.849999999999, 0.09),
(2062, '467', 11, 12168.59, 0.1),
(2063, '445', 7, 34112.4, 0.1),
(2064, '12', 12, 1815.8, 0.1),
(2065, '12', 7, 1888.56, 0.1),
(2066, '12', 11, 16840.46, 0.1),
(2067, '114', 12, 2473.22, 0.1),
(2068, '114', 7, 8664.766166000001, 0.1),
(2069, '114', 9, 17499.513833999998, 0.1),
(2070, '818', 9, 10680.93, 0.1),
(2071, '350', 11, 20848.88, 0.1),
(2072, '99', 8, 10652.06, 0.09),
(2073, '444', 11, 11447.8, 0.1),
(2074, '472', 11, 39451.01, 0.1),
(2075, '606', 11, 43726.65, 0.1),
(2076, '305', 8, 23364.22, 0.11),
(2077, '1035', 8, 22598.84, 0.11),
(2078, '245', 8, 21167.48, 0.11),
(2079, '544', 11, 40713.06, 0.12),
(2080, '432', 9, 8081.85, 0.1),
(2081, '331', 9, 10315.2, 0.12),
(2082, '671', 7, 23335.1, 0.12),
(2083, '207', 11, 9651.6, 0.1),
(2084, '207', 9, 766.08, 0.1),
(2085, '864', 11, 19577.8, 0.1),
(2086, '864', 9, 1580.04, 0.1),
(2087, '526', 11, 24910.47, 0.1),
(2088, '977', 7, 13618.32, 0.1),
(2089, '1049', 8, 11780.34, 0.11),
(2090, '103', 8, 9870.38, 0.11),
(2091, '266', 11, 6389.389999999999, 0.1),
(2092, '266', 7, 6262.6, 0.1),
(2093, '507', 11, 17016.32, 0.1),
(2094, '295', 11, 30942.650000000005, 0.1),
(2095, '295', 13, 2282.76, 0.09),
(2096, '295', 8, 3351.16, 0.09),
(2097, '295', 6, 316.83, 0.1),
(2098, '295', 12, 4963.04, 0.1),
(2099, '295', 7, 2976.47, 0.1),
(2100, '295', 9, 36262.95, 0.1),
(2101, '898', 12, 2819.97, 0.1),
(2102, '379', 7, 16176.55, 0.1),
(2103, '1070', 11, 7044.8, 0.12),
(2104, '1070', 9, 27303.44, 0.12),
(2105, '587', 8, 26880, 0.11),
(2106, '512', 11, 10744.96, 0.12),
(2107, '743', 12, 14359.59, 0.12),
(2108, '318', 8, 32812.11, 0.11),
(2109, '552', 8, 65002.46, 0.09),
(2110, '888', 12, 8203.49, 0.12),
(2111, '980', 8, 12410.46, 0.09),
(2112, '329', 8, 23520.58, 0.09),
(2113, '690', 8, 14736.84, 0.09),
(2114, '332', 15, 27692.28, 0.09),
(2115, '1038', 13, 27538.84, 0.09),
(2116, '271', 13, 59360.98, 0.09),
(2117, '54', 13, 118841.45, 0.09),
(2118, '313', 13, 26342.4, 0.09),
(2119, '959', 11, 3532.14, 0.12),
(2120, '959', 12, 5271.24, 0.12),
(2121, '959', 9, 35814.79, 0.12),
(2122, '60', 11, 21838.54, 0.12),
(2123, '60', 9, 460.92, 0.12),
(2124, '86', 15, 28205.74, 0.09),
(2125, '623', 15, 29272.96, 0.09),
(2126, '945', 7, 33394.24, 0.12),
(2127, '18', 8, 43020.24, 0.11),
(2128, '727', 7, 14025.93, 0.12),
(2129, '250', 13, 37161.79, 0.09),
(2130, '242', 13, 26168.58, 0.09),
(2131, '322', 13, 52315.92, 0.09),
(2132, '365', 13, 38717.75, 0.09),
(2133, '723', 13, 37058.44, 0.09),
(2134, '956', 13, 28050.01, 0.09),
(2135, '261', 13, 32079.59, 0.09),
(2136, '1060', 9, 41403.57, 0.1),
(2137, '113', 12, 70585.24, 0.12),
(2138, '590', 12, 3967.92, 0.12),
(2139, '152', 12, 46011.05, 0.12),
(2140, '1076', 8, 24901.38, 0.09),
(2141, '45', 8, 11052.28, 0.09),
(2142, '975', 8, 20331.66, 0.09),
(2143, '654', 16, 14129.64, 0.12),
(2144, '362', 8, 12315, 0.11),
(2145, '1026', 13, 20275.14, 0.11),
(2146, '728', 9, 10526.31, 0.12),
(2147, '1067', 13, 23647.95, 0.09),
(2148, '602', 12, 7094.22, 0.1),
(2149, '731', 12, 28017.06, 0.12),
(2150, '1108', 8, 11310.74, 0.11),
(2151, '891', 8, 41492, 0.09),
(2152, '424', 9, 10427.96, 0.12),
(2153, '719', 12, 7331.37, 0.12),
(2154, '183', 12, 16636.92, 0.12),
(2155, '483', 12, 16000.74, 0.12),
(2156, '796', 12, 14724.34, 0.12),
(2157, '177', 12, 12766.75, 0.12),
(2158, '420', 12, 14350.38, 0.12),
(2159, '1128', 12, 21793.95, 0.12),
(2160, '123', 9, 18293.46, 0.12),
(2161, '781', 12, 90147.73, 0.12),
(2162, '1000', 12, 36851.91, 0.12),
(2163, '847', 9, 56657.5, 0.12),
(2164, '675', 8, 205476.1, 0.09),
(2165, '797', 8, 97350.09, 0.09),
(2166, '396', 8, 52136.87, 0.11),
(2167, '32', 8, 8706.87, 0.09),
(2168, '173', 8, 26673.3, 0.11),
(2169, '460', 13, 6478.8, 0.09),
(2170, '967', 13, 1645.67, 0.09),
(2171, '735', 13, 14152.93, 0.09),
(2172, '528', 13, 20120.03, 0.09),
(2173, '925', 13, 15127.85, 0.09),
(2174, '925', 9, 416.57, 0.1),
(2175, '283', 13, 13530.72, 0.09),
(2176, '283', 9, 5574.92, 0.1),
(2177, '159', 7, 4703.52, 0.1),
(2178, '159', 9, 7301.32, 0.1),
(2179, '293', 9, 38824.5, 0.1),
(2180, '907', 7, 33379.15, 0.1),
(2181, '907', 9, 7809.72, 0.1),
(2182, '241', 11, 9055.600000000002, 0.1),
(2183, '241', 9, 21656.23, 0.1),
(2184, '473', 12, 25571.56, 0.1),
(2185, '303', 7, 41957.77, 0.1),
(2186, '633', 8, 47740.87, 0.11),
(2187, '165', 8, 48942.58, 0.11),
(2188, '264', 8, 34454.08, 0.11),
(2189, '128', 8, 12064.92, 0.11),
(2190, '402', 8, 78006.8, 0.11),
(2191, '574', 11, 2377.9300000000003, 0.1),
(2192, '574', 9, 3564.8, 0.1),
(2193, '440', 12, 8727.28, 0.1),
(2194, '766', 12, 7454.65, 0.1),
(2195, '835', 8, 3933.6, 0.09),
(2196, '1019', 8, 5013, 0.09),
(2197, '626', 8, 341.76, 0.09),
(2198, '287', 8, 25750.47, 0.11),
(2199, '571', 8, 8340.77, 0.09),
(2200, '1127', 8, 22656.36, 0.11),
(2201, '156', 8, 11506, 0.11),
(2202, '398', 8, 11232, 0.11),
(2203, '871', 8, 79497.6, 0.11),
(2204, '164', 8, 20920, 0.11),
(2205, '645', 8, 21228, 0.11),
(2206, '167', 7, 120216.96, 0.12),
(2207, '1074', 7, 66331.67, 0.12),
(2208, '1034', 12, 54355.22, 0.12),
(2209, '1081', 13, 59967.36, 0.09),
(2210, '655', 13, 19723.65, 0.11),
(2211, '252', 9, 23908.5, 0.1),
(2212, '203', 11, 11332.79, 0.1),
(2213, '579', 12, 24620.28, 0.12),
(2214, '36', 11, 9680, 0.12),
(2215, '1078', 12, 7922.47, 0.12),
(2216, '661', 12, 9065.73, 0.12),
(2217, '545', 7, 11187.08, 0.12),
(2218, '660', 11, 21620.61, 0.1),
(2219, '405', 8, 2460.06, 0.09),
(2220, '405', 9, 21182.629999999997, 0.1),
(2221, '377', 9, 46653.11, 0.1),
(2222, '994', 11, 25069.170000000002, 0.1),
(2223, '994', 9, 15257.09, 0.1),
(2224, '117', 8, 8247.279999999999, 0.09),
(2225, '117', 9, 7240.830000000002, 0.1),
(2226, '65', 8, 38822.3, 0.11),
(2227, '437', 13, 32619.95, 0.11),
(2228, '780', 9, 2827.64, 0.1),
(2229, '268', 13, 33736.44, 0.11),
(2230, '938', 13, 23373.1, 0.11),
(2231, '307', 13, 40018.77, 0.11),
(2232, '970', 8, 50967, 0.11),
(2233, '599', 8, 36800, 0.11),
(2234, '791', 13, 28926.51, 0.09),
(2235, '134', 13, 51160.84, 0.09),
(2236, '100', 13, 108206.16, 0.09),
(2237, '451', 13, 61772.51, 0.09),
(2238, '23', 13, 68983.81, 0.09),
(2239, '651', 12, 16739.15, 0.1),
(2240, '158', 12, 9042.83, 0.1),
(2241, '595', 11, 89881.48, 0.1),
(2242, '595', 9, 1428.3, 0.1),
(2243, '16', 11, 22800.039999999997, 0.1),
(2244, '16', 9, 16006.95, 0.1),
(2245, '1071', 12, 13909.02, 0.1),
(2246, '1071', 9, 2322.56, 0.1),
(2247, '314', 8, 11512.8, 0.11),
(2248, '414', 8, 91181.75, 0.11),
(2249, '777', 8, 8113.64, 0.09),
(2250, '355', 8, 25058.98, 0.09),
(2251, '532', 8, 27336.96, 0.09),
(2252, '120', 8, 12712.44, 0.09),
(2253, '569', 8, 20920, 0.11),
(2254, '145', 8, 26775, 0.11),
(2255, '616', 8, 51360.3, 0.11),
(2256, '862', 8, 52070.7, 0.11),
(2257, '1061', 8, 52526.25, 0.11),
(2258, '267', 8, 51298.62, 0.11),
(2259, '634', 8, 24566, 0.11),
(2260, '419', 8, 44847.93, 0.11),
(2261, '10', 8, 36800, 0.11),
(2262, '187', 8, 36800, 0.11),
(2263, '43', 8, 48795.46, 0.11),
(2264, '1113', 8, 50967, 0.11),
(2265, '910', 8, 50967, 0.11),
(2266, '428', 8, 35144, 0.11),
(2267, '726', 9, 4780, 0.1),
(2268, '282', 12, 29102.489999999998, 0.1),
(2269, '282', 9, 33236.14, 0.1),
(2270, '1122', 12, 2431.94, 0.1),
(2271, '1122', 9, 8694.78, 0.1),
(2272, '494', 12, 5819, 0.1),
(2273, '494', 9, 5739.78, 0.1),
(2274, '409', 12, 17561.78, 0.1),
(2275, '1033', 12, 18377.43, 0.1),
(2276, '838', 11, 17129.75, 0.1),
(2277, '469', 11, 22442.61, 0.1),
(2278, '308', 11, 14189.61, 0.1),
(2279, '1055', 11, 69653.82, 0.1),
(2280, '703', 11, 10167.92, 0.1),
(2281, '924', 13, 25856.9, 0.09),
(2282, '1045', 13, 31149.85, 0.09),
(2283, '578', 13, 7998.5, 0.09),
(2284, '115', 13, 21829.2, 0.09),
(2285, '1046', 13, 41842.6, 0.09),
(2286, '28', 8, 17411.3, 0.09),
(2287, '387', 8, 8305.48, 0.09),
(2288, '429', 8, 16437.9, 0.09),
(2289, '807', 7, 38129.52, 0.1),
(2290, '564', 11, 20451.99, 0.1),
(2291, '932', 13, 12957.64, 0.09),
(2292, '1120', 8, 65283.18, 0.11),
(2293, '1027', 8, 23452, 0.11),
(2294, '872', 8, 25061.28, 0.11),
(2295, '983', 8, 12315, 0.11),
(2296, '262', 13, 21649.57, 0.09),
(2297, '948', 8, 19268.24, 0.11),
(2298, '930', 8, 11950.48, 0.11),
(2299, '537', 8, 28788.48, 0.09),
(2300, '85', 8, 29355.48, 0.09),
(2301, '917', 8, 29787, 0.09),
(2302, '1040', 8, 19882.74, 0.09),
(2303, '326', 8, 39662.82, 0.09),
(2304, '66', 8, 24809.4, 0.09),
(2305, '1023', 8, 24809.4, 0.09),
(2306, '97', 8, 24809.4, 0.09),
(2307, '804', 8, 35809.36, 0.11),
(2308, '1064', 8, 24141.52, 0.11),
(2309, '1079', 8, 22996.16, 0.11),
(2310, '561', 8, 12654.56, 0.11),
(2311, '1020', 8, 47722.56, 0.11),
(2312, '337', 8, 23584, 0.11),
(2313, '328', 8, 20376, 0.11),
(2314, '802', 8, 11262.36, 0.11),
(2315, '642', 8, 28259.1, 0.11),
(2316, '274', 8, 48540, 0.11),
(2317, '142', 8, 26775, 0.11),
(2318, '752', 8, 29124, 0.11),
(2319, '1121', 8, 36800, 0.11),
(2320, '1096', 8, 48540, 0.11),
(2321, '710', 8, 36305, 0.11),
(2322, '520', 8, 48540, 0.11),
(2323, '311', 8, 6870.26, 0.11),
(2324, '315', 12, 6990, 0.1),
(2325, '309', 8, 28117.5, 0.09),
(2326, '861', 8, 26221.44, 0.11),
(2327, '1103', 8, 41092.45, 0.09),
(2328, '42', 8, 16215, 0.09),
(2329, '759', 13, 81397.11, 0.09),
(2330, '1098', 13, 47989, 0.09),
(2331, '920', 13, 21375.01, 0.09),
(2332, '800', 13, 12901.5, 0.09),
(2333, '296', 13, 8998.35, 0.09),
(2334, '170', 12, 22556.64, 0.12),
(2335, '798', 12, 22556.64, 0.12),
(2336, '691', 9, 28455.85, 0.12),
(2337, '218', 9, 25494, 0.12),
(2338, '229', 8, 55340.28, 0.09),
(2339, '415', 8, 41194.8, 0.09),
(2340, '150', 8, 31170, 0.09),
(2341, '19', 8, 28834.32, 0.09),
(2342, '369', 8, 18541.03, 0.11),
(2343, '407', 11, 24187.27, 0.12),
(2344, '131', 12, 10527.7, 0.1),
(2345, '1107', 9, 21212.9, 0.1),
(2346, '321', 9, 4221.42, 0.1),
(2347, '903', 9, 8085.6, 0.1),
(2348, '31', 9, 3762.51, 0.1),
(2349, '919', 8, 24824.87, 0.09),
(2350, '449', 11, 6293.34, 0.1),
(2351, '449', 8, 2829.12, 0.09),
(2352, '449', 13, 1588.98, 0.09),
(2353, '96', 9, 8880.67, 0.1),
(2354, '257', 9, 20511.57, 0.1),
(2355, '108', 9, 4503.6, 0.1),
(2356, '351', 11, 9164.02, 0.1),
(2357, '1100', 11, 10483.38, 0.1),
(2358, '161', 11, 5250.9, 0.1),
(2359, '161', 8, 16026.4, 0.09),
(2360, '673', 9, 4782.43, 0.1),
(2361, '510', 12, 6271.259999999999, 0.1),
(2362, '510', 7, 664.58, 0.1),
(2363, '510', 11, 3301.9199999999996, 0.1),
(2364, '510', 13, 5979.53, 0.09),
(2365, '510', 9, 7004.73, 0.1),
(2366, '465', 8, 7094.96, 0.09),
(2367, '465', 11, 7607.07, 0.1),
(2368, '465', 6, 2033.78, 0.1),
(2369, '465', 9, 3607.7799999999997, 0.1),
(2370, '611', 12, 12147.84, 0.1),
(2371, '611', 8, 369.93, 0.09),
(2372, '404', 11, 14164.280000000002, 0.1),
(2373, '404', 13, 993.03, 0.09),
(2374, '404', 9, 6966.34, 0.1),
(2375, '832', 11, 10815, 0.1),
(2376, '832', 9, 3594, 0.1),
(2377, '357', 8, 14601.5, 0.11),
(2378, '357', 13, 17365, 0.11),
(2379, '964', 8, 36800, 0.11),
(2380, '378', 8, 48540, 0.11),
(2381, '1080', 8, 41055, 0.11),
(2382, '562', 8, 13987.95, 0.11),
(2383, '712', 11, 32476.290000000005, 0.12),
(2384, '712', 13, 19383.62, 0.11),
(2385, '442', 11, 45567.94, 0.12),
(2386, '29', 11, 28787.22, 0.12),
(2387, '352', 13, 54122.33, 0.11),
(2388, '232', 7, 118781.4, 0.12),
(2389, '617', 13, 10030.89, 0.11),
(2390, '615', 13, 40245, 0.11),
(2391, '873', 9, 6656.45, 0.12),
(2392, '550', 12, 17830.099, 0.12),
(2393, '436', 9, 7573.5, 0.12),
(2394, '118', 9, 44113.62, 0.12),
(2395, '400', 7, 103721.48, 0.12),
(2396, '8', 13, 10746.35, 0.09),
(2397, '1018', 7, 13863.43, 0.12),
(2398, '61', 7, 55934.79, 0.12),
(2399, '386', 7, 174800, 0.12),
(2400, '858', 7, 59846.92, 0.12),
(2401, '519', 7, 13895.55, 0.12),
(2402, '1006', 8, 23257.82, 0.11),
(2403, '1072', 9, 2199.16, 0.12),
(2404, '653', 9, 57032.29, 0.12),
(2405, '143', 9, 7244.64, 0.12),
(2406, '689', 9, 5953.53, 0.12),
(2407, '390', 13, 18698.94, 0.11),
(2408, '84', 7, 20743.51, 0.12),
(2409, '521', 8, 50904, 0.11),
(2410, '589', 11, 4564.7, 0.1),
(2411, '589', 9, 2224.44, 0.1),
(2412, '41', 12, 4278.699999999997, 0.1),
(2413, '41', 9, 37069.07, 0.1),
(2414, '347', 11, 30627.34, 0.1),
(2415, '77', 8, 2140.84, 0.09),
(2416, '77', 9, 3886.92, 0.1),
(2417, '463', 13, 16768.15, 0.09),
(2418, '463', 9, 6025.94, 0.1),
(2419, '1044', 7, 15604.06, 0.1),
(2420, '826', 10, 1658.3, 0.1),
(2421, '826', 11, 15519.16, 0.1),
(2422, '273', 11, 79205.41, 0.1),
(2423, '270', 11, 30498.96, 0.1),
(2424, '1008', 11, 6648.88, 0.1),
(2425, '889', 7, 14897.11, 0.1),
(2426, '940', 7, 17446.63, 0.1),
(2427, '893', 11, 8621.6, 0.1),
(2428, '1094', 8, 36805.52, 0.09),
(2429, '605', 11, 9813.9, 0.1),
(2430, '1090', 9, 32447.38, 0.1),
(2431, '619', 9, 33852.46, 0.1),
(2432, '694', 9, 34914, 0.1),
(2433, '397', 9, 8249.74, 0.1),
(2434, '824', 11, 17361.21, 0.1),
(2435, '122', 11, 44667.87, 0.1),
(2436, '122', 9, 3864.3900000000003, 0.1),
(2437, '354', 13, 77313.26, 0.11),
(2438, '1105', 7, 32078.29, 0.1),
(2439, '715', 7, 25794.95, 0.1),
(2440, '360', 8, 36800, 0.11),
(2441, '333', 8, 33120, 0.11),
(2442, '1099', 8, 50384.52, 0.11),
(2443, '869', 8, 66196.24, 0.11),
(2444, '1022', 7, 43042.81, 0.12),
(2445, '102', 8, 9879, 0.11),
(2446, '389', 8, 15778.4, 0.09),
(2447, '277', 9, 27289.38, 0.12),
(2448, '200', 13, 13952.6, 0.09),
(2449, '772', 11, 56734.92, 0.1),
(2450, '234', 11, 16844.34, 0.1),
(2451, '251', 9, 4008, 0.1),
(2452, '996', 9, 20541, 0.1),
(2453, '763', 11, 27633.7, 0.1),
(2454, '974', 13, 11443.75, 0.11),
(2455, '139', 8, 38561, 0.11),
(2456, '518', 8, 12619.5, 0.09),
(2457, '612', 8, 26133.23, 0.09),
(2458, '961', 8, 16866.26, 0.09),
(2459, '535', 8, 15807.36, 0.09),
(2460, '923', 8, 24593.87, 0.09),
(2461, '502', 8, 60112.46, 0.09),
(2462, '957', 8, 20625.89, 0.09),
(2463, '487', 8, 46311.68, 0.09),
(2464, '503', 7, 18414.4, 0.1),
(2465, '503', 12, 297.6, 0.1),
(2466, '446', 8, 23279.16, 0.11),
(2467, '14', 8, 29590.74, 0.11),
(2468, '447', 8, 59058.95, 0.11),
(2469, '1124', 8, 25148.37, 0.11),
(2470, '663', 8, 53955.48, 0.11),
(2471, '773', 8, 40265.58, 0.11),
(2472, '1005', 8, 40265.58, 0.11),
(2473, '285', 8, 48540, 0.11),
(2474, '876', 8, 13425.75, 0.09),
(2475, '718', 8, 33913.08, 0.09),
(2476, '418', 8, 11836.44, 0.09),
(2477, '237', 8, 31955.88, 0.09),
(2478, '749', 8, 24822.32, 0.09),
(2479, '356', 8, 71622.4, 0.11),
(2480, '1082', 8, 22211.28, 0.11),
(2481, '531', 8, 17122.56, 0.11),
(2482, '395', 8, 10891.96, 0.11),
(2483, '1015', 13, 13869.39, 0.09),
(2484, '9', 12, 10106.04, 0.1),
(2485, '188', 13, 11380, 0.09),
(2486, '720', 13, 28987.93, 0.11),
(2487, '720', 7, 28987.93, 0.12),
(2488, '786', 8, 35501.1, 0.09),
(2489, '680', 12, 14648, 0.12),
(2490, '496', 12, 18753.61, 0.12),
(2491, '361', 12, 64487.52, 0.12),
(2492, '817', 9, 27816.53, 0.12),
(2493, '105', 9, 53335.92, 0.12),
(2494, '522', 9, 17274.05, 0.12),
(2495, '613', 8, 613, 0.11),
(2496, '613', 12, 87336.02, 0.12),
(2497, '913', 8, 11443.2, 0.09),
(2498, '278', 8, 25137.15, 0.09),
(2499, '816', 13, 84802.48, 0.09),
(2500, '15', 13, 22265.2, 0.09),
(2501, '754', 13, 17806.36, 0.09),
(2502, '585', 13, 27209.36, 0.09),
(2503, '63', 13, 26165.06, 0.09),
(2504, '67', 13, 29733.52, 0.09),
(2505, '224', 13, 35014.82, 0.09),
(2506, '254', 7, 31041.95, 0.12),
(2507, '557', 12, 9011.75, 0.12),
(2508, '557', 8, 58705.57000000001, 0.11),
(2509, '1028', 12, 15876.78, 0.12),
(2510, '1028', 8, 7414.9, 0.11),
(2511, '33', 9, 9597.56, 0.12),
(2512, '748', 12, 16988.96, 0.12),
(2513, '877', 7, 11041.83, 0.12),
(2514, '48', 8, 37796.3, 0.09),
(2515, '745', 13, 41080.83, 0.09),
(2516, '665', 8, 16945.2, 0.09),
(2517, '75', 13, 14644.84, 0.09),
(2518, '775', 8, 20514.78, 0.09),
(2519, '883', 8, 26213.5, 0.11),
(2520, '1066', 9, 29694.72, 0.12),
(2521, '788', 8, 15364.220000000001, 0.11),
(2522, '788', 12, 3048.93, 0.12),
(2523, '20', 9, 11261.55, 0.12),
(2524, '685', 7, 3486.72, 0.12),
(2525, '406', 12, 23137.08, 0.12),
(2526, '822', 8, 43756.53, 0.09),
(2527, '179', 8, 20421.12, 0.09),
(2528, '498', 8, 16638.96, 0.09),
(2529, '172', 8, 48064.44, 0.09),
(2530, '1069', 8, 9514.78, 0.09),
(2531, '441', 8, 28354.95, 0.09),
(2532, '191', 8, 15104.28, 0.09),
(2533, '828', 8, 12270.05, 0.09),
(2534, '34', 8, 23564.16, 0.09),
(2535, '162', 8, 19738.54, 0.09),
(2536, '304', 8, 54807.12, 0.09),
(2537, '899', 13, 60806.76, 0.09),
(2538, '411', 13, 19006.26, 0.09),
(2539, '1092', 13, 41613.86, 0.09),
(2540, '195', 10, 16299.6, 0.1),
(2541, '286', 12, 11386.36, 0.12),
(2542, '756', 8, 325.2, 0.09),
(2543, '462', 9, 4681.19, 0.12),
(2544, '555', 7, 20553.75, 0.12),
(2545, '1036', 13, 11312.82, 0.11),
(2546, '371', 9, 6941.76, 0.12),
(2547, '1111', 8, 49654.149999999994, 0.11),
(2548, '1111', 7, 2188.7600000000093, 0.12),
(2549, '560', 8, 35615.19, 0.11),
(2550, '695', 7, 13515.76, 0.12),
(2551, '1077', 8, 28704.35, 0.11),
(2552, '576', 7, 5430.48, 0.1),
(2553, '576', 9, 4008, 0.1),
(2554, '875', 11, 13978.99, 0.1),
(2555, '425', 7, 7706.46, 0.1),
(2556, '215', 9, 41284.09, 0.12),
(2557, '148', 9, 25456.56, 0.12),
(2558, '1110', 9, 23207.5, 0.12),
(2559, '154', 7, 122931.65, 0.12),
(2560, '914', 7, 9047.35, 0.1),
(2561, '44', 7, 65614.96, 0.12),
(2562, '401', 11, 36650.86, 0.1),
(2563, '401', 9, 13655.26, 0.1),
(2564, '880', 13, 9247.3, 0.09),
(2565, '880', 11, 9641.7, 0.1),
(2566, '732', 8, 24901.89, 0.11),
(2567, '927', 7, 3185.6, 0.1),
(2568, '927', 13, 1938.72, 0.09),
(2569, '927', 11, 9024.6, 0.1),
(2570, '927', 9, 11777.57, 0.1),
(2571, '279', 13, 28372.68, 0.09),
(2572, '554', 7, 48591.28, 0.12),
(2573, '359', 9, 4328, 0.1),
(2574, '785', 11, 31896.460000000003, 0.1),
(2575, '785', 9, 2038.62, 0.1),
(2576, '280', 11, 47531.53, 0.1),
(2577, '1002', 8, 11195.8, 0.09),
(2578, '1002', 11, 11579.780000000002, 0.1),
(2579, '1002', 9, 747.9100000000001, 0.1),
(2580, '138', 8, 52897.97, 0.09),
(2581, '722', 8, 9918.09, 0.09),
(2582, '965', 12, 5872.5, 0.1),
(2583, '965', 11, 17732, 0.1),
(2584, '965', 8, 2077.2, 0.09),
(2585, '965', 9, 135.25, 0.1),
(2586, '659', 8, 41842.95, 0.09),
(2587, '933', 8, 23472.36, 0.11),
(2588, '921', 8, 49901.64, 0.09),
(2589, '792', 13, 75714.01, 0.09),
(2590, '1102', 9, 21332, 0.12),
(2591, '491', 8, 17577.09, 0.09),
(2592, '470', 8, 54403, 0.09),
(2593, '495', 12, 7930.78, 0.12),
(2594, '495', 8, 10911.6, 0.11),
(2595, '335', 13, 21380.4, 0.11),
(2596, '233', 13, 4987.29, 0.11),
(2597, '497', 8, 74590.48, 0.09),
(2598, '26', 13, 119442.66, 0.09),
(2599, '1031', 8, 19433.6, 0.11),
(2600, '205', 12, 99923.82, 0.1),
(2601, '1043', 8, 25406.71, 0.11),
(2602, '588', 9, 62401.3, 0.12),
(2603, '681', 9, 10888.76, 0.12),
(2604, '94', 9, 52408.02, 0.12),
(2605, '1106', 9, 35038.56, 0.12),
(2606, '137', 11, 38908.18, 0.12),
(2607, '505', 7, 50942.24, 0.12),
(2608, '842', 7, 12015.099999999999, 0.12),
(2609, '842', 9, 6910, 0.12),
(2610, '169', 12, 5131.89, 0.12),
(2611, '345', 12, 7418.15, 0.12),
(2612, '972', 7, 36722.61, 0.12),
(2613, '338', 8, 48540, 0.11),
(2614, '202', 8, 36800, 0.11),
(2615, '700', 8, 21805, 0.11),
(2616, '839', 8, 46492.5, 0.11),
(2617, '363', 8, 11463.3, 0.11),
(2618, '336', 8, 50967, 0.11),
(2619, '944', 8, 42670, 0.11),
(2620, '70', 8, 44917.52, 0.11),
(2621, '464', 8, 36800, 0.11),
(2622, '758', 8, 60675, 0.11),
(2623, '909', 8, 28832.76, 0.11),
(2624, '230', 12, 23431.8, 0.12),
(2625, '657', 8, 51549.48, 0.11),
(2626, '952', 8, 51765, 0.11),
(2627, '1091', 8, 36800, 0.11),
(2628, '677', 8, 122278.5, 0.11),
(2629, '144', 7, 25334.5, 0.12),
(2630, '894', 9, 53606.85, 0.12),
(2631, '374', 9, 9284.8, 0.12),
(2632, '765', 8, 46478.24, 0.11),
(2633, '765', 7, 22708.659999999996, 0.12),
(2634, '852', 8, 18196.4, 0.11),
(2635, '618', 8, 18189.73, 0.11),
(2636, '618', 7, 1944.03, 0.12),
(2637, '614', 8, 80148.5428, 0.11),
(2638, '614', 7, 10121.227200000001, 0.12),
(2639, '701', 8, 4780.53, 0.09),
(2640, '1056', 7, 9736.4, 0.1),
(2641, '80', 7, 8916.93, 0.1),
(2642, '783', 12, 12335.19, 0.1),
(2643, '776', 12, 27443.93, 0.1),
(2644, '776', 9, 10521, 0.1),
(2645, '393', 11, 8632.89, 0.1),
(2646, '393', 9, 4629.24, 0.1),
(2647, '456', 7, 58074.689999999995, 0.1),
(2648, '456', 9, 101.83, 0.1),
(2649, '79', 8, 17768.52, 0.09),
(2650, '992', 8, 51765, 0.11),
(2651, '692', 8, 53973, 0.11),
(2652, '1013', 8, 20652.45, 0.11),
(2653, '566', 9, 4910.81, 0.12),
(2654, '91', 8, 14583.97, 0.11),
(2655, '55', 12, 8229.560000000001, 0.12),
(2656, '55', 13, 5668.68, 0.11),
(2657, '730', 13, 11106.660000000003, 0.11),
(2658, '730', 7, 24042.53, 0.12),
(2659, '1001', 8, 24806.96, 0.11),
(2660, '1001', 12, 62705.100000000006, 0.12),
(2661, '836', 13, 44276.729999999996, 0.11),
(2662, '836', 11, 23192.7, 0.12),
(2663, '1012', 11, 60192.13, 0.12),
(2664, '1012', 13, 60192.13, 0.11),
(2665, '431', 11, 31470.48, 0.12),
(2666, '764', 11, 35047.85, 0.1),
(2667, '82', 11, 44822.25, 0.1),
(2668, '370', 9, 16706.08, 0.1),
(2669, '227', 11, 8368.82, 0.1),
(2670, '1125', 11, 34669.25, 0.1),
(2671, '166', 8, 2563.7200000000003, 0.09),
(2672, '166', 9, 3213.28, 0.1),
(2673, '525', 7, 5148.78, 0.1),
(2674, '525', 8, 1249.82, 0.09),
(2675, '525', 8, 436.1, 0.09),
(2676, '966', 7, 20648.78, 0.1),
(2677, '171', 12, 15137.40648533, 0.1),
(2678, '171', 9, 4400.15351467, 0.1),
(2679, '403', 7, 18275.88, 0.1),
(2680, '918', 9, 19948.21, 0.1),
(2681, '178', 11, 13519.35, 0.1),
(2682, '1093', 7, 2963.01, 0.1),
(2683, '1093', 9, 19906.33, 0.1),
(2684, '1095', 13, 80325.62, 0.09),
(2685, '670', 8, 48540, 0.11),
(2686, '185', 8, 34354, 0.11),
(2687, '697', 8, 56560.7, 0.11),
(2688, '667', 8, 41389, 0.11),
(2689, '538', 8, 40753.7, 0.11),
(2690, '1109', 9, 9865.64, 0.1),
(2691, '71', 11, 31113.49, 0.1),
(2692, '380', 11, 20690.32, 0.1),
(2693, '753', 13, 15254.28, 0.09),
(2694, '269', 8, 1197.15, 0.09),
(2695, '269', 12, 8069.3, 0.1),
(2696, '643', 13, 11011.08, 0.09),
(2697, '936', 8, 22813.21, 0.09),
(2698, '1011', 12, 10381.74, 0.1),
(2699, '1011', 13, 7614.890000000001, 0.09),
(2700, '760', 12, 8989.5, 0.1),
(2701, '774', 13, 4201.23, 0.09),
(2702, '716', 12, 34648.84, 0.12),
(2703, '688', 7, 4810.429999999993, 0.1),
(2704, '688', 8, 4830.55, 0.09),
(2705, '688', 9, 35528.61, 0.1),
(2706, '854', 7, 31372.915, 0.12),
(2707, '854', 8, 31372.915, 0.11),
(2708, '516', 8, 2134.05, 0.09),
(2709, '516', 9, 18766.280000000002, 0.1),
(2710, '509', 13, 2324.3199999999997, 0.11),
(2711, '509', 12, 408, 0.12),
(2712, '509', 7, 7480.32, 0.12),
(2713, '857', 9, 134205.83, 0.12),
(2714, '17', 9, 15250.6, 0.12),
(2715, '95', 8, 55109.36, 0.11),
(2716, '887', 7, 59489.01, 0.12),
(2717, '511', 8, 5941.5, 0.11),
(2718, '511', 11, 27329.85, 0.12),
(2719, '527', 8, 7992.8, 0.11),
(2720, '527', 7, 61330.87999999999, 0.12),
(2721, '1039', 7, 23754.38, 0.12),
(2722, '865', 13, 1032.12, 0.09),
(2723, '865', 7, 10499.01, 0.1),
(2724, '639', 8, 7184.36, 0.09),
(2725, '639', 7, 13882.57, 0.1),
(2726, '639', 9, 5700.45, 0.1),
(2727, '724', 8, 21982.18, 0.09),
(2728, '364', 8, 7403.75, 0.09),
(2729, '364', 11, 3722.4500000000007, 0.1),
(2730, '153', 9, 27738, 0.12),
(2731, '1118', 11, 15407.5, 0.12),
(2732, '968', 13, 18256.4, 0.11),
(2733, '968', 7, 26291.699999999997, 0.12),
(2734, '1126', 13, 91904.8, 0.11),
(2735, '716', 13, 4414.41, 0.11),
(2736, '716', 12, 34648.84, 0.12),
(2737, '596', 9, 23313.2, 0.12),
(2738, '240', 9, 41434.78, 0.12),
(2739, '69', 9, 4438, 0.12),
(2740, '38', 9, 28261.8, 0.12),
(2741, '477', 8, 38382.53, 0.11),
(2742, '674', 12, 19625.66, 0.12),
(2743, '423', 11, 11148.61, 0.12),
(2744, '607', 7, 10655.869999999999, 0.12),
(2745, '607', 9, 2312.87, 0.12),
(2746, '272', 12, 11859.34, 0.12),
(2747, '485', 13, 28509.4, 0.09),
(2748, '603', 8, 28917.47, 0.09),
(2749, '1068', 12, 8001.6, 0.1),
(2750, '621', 13, 41744.45, 0.09),
(2751, '319', 11, 41677.4, 0.1),
(2752, '825', 8, 23946.37, 0.09),
(2753, '664', 13, 27398.97, 0.09),
(2754, '366', 8, 105515.28, 0.09),
(2755, '192', 8, 37365.37, 0.09),
(2756, '696', 8, 48272.78, 0.09),
(2757, '62', 8, 50961.92, 0.09),
(2758, '111', 8, 13450.5, 0.09),
(2759, '736', 8, 11001.55, 0.09),
(2760, '979', 8, 8616.78, 0.09),
(2761, '547', 8, 48225.32, 0.09),
(2762, '947', 8, 49466.85, 0.09),
(2763, '438', 8, 94051.04, 0.09),
(2764, '1050', 8, 20665.26, 0.09),
(2765, '182', 8, 21778.08, 0.09),
(2766, '130', 8, 182243.39, 0.09),
(2767, '140', 8, 22521.48, 0.09),
(2768, '22', 8, 23587.2, 0.11),
(2769, '87', 8, 9379.64, 0.11),
(2770, '1053', 8, 17139.6, 0.11),
(2771, '928', 8, 13931.54, 0.09),
(2772, '258', 8, 23672.88, 0.09),
(2773, '638', 8, 31181.15, 0.09),
(2774, '454', 8, 14977.45, 0.09),
(2775, '946', 8, 16801.44, 0.09),
(2776, '981', 8, 63490.79, 0.11),
(2777, '246', 12, 95019, 0.12),
(2778, '707', 8, 5379.45, 0.09),
(2779, '707', 13, 1243.2, 0.09),
(2780, '707', 12, 23889.789999999997, 0.1),
(2781, '905', 11, 2509.08, 0.1),
(2782, '905', 13, 4459.1, 0.09),
(2783, '905', 7, 4152.5, 0.1),
(2784, '911', 13, 18190.2, 0.11),
(2785, '1051', 11, 20315.04, 0.1),
(2786, '580', 9, 20415.71, 0.1),
(2787, '443', 13, 12657.41, 0.09),
(2788, '480', 13, 3776.71, 0.09),
(2789, '373', 13, 4476.04, 0.09),
(2790, '256', 13, 26707.6, 0.09),
(2791, '984', 7, 40291.57, 0.1),
(2792, '984', 9, 21371.07, 0.1),
(2793, '582', 7, 10016.64, 0.1),
(2794, '582', 9, 1551.79, 0.1),
(2795, '56', 8, 52120.17, 0.11),
(2796, '704', 8, 10761, 0.09),
(2797, '912', 9, 24106.3, 0.1),
(2798, '976', 7, 8256.17, 0.1),
(2799, '412', 8, 12883.88, 0.09),
(2800, '790', 8, 61076.11, 0.11),
(2801, '290', 8, 1528.64, 0.09),
(2802, '812', 8, 74013.9, 0.11),
(2803, '584', 8, 23137.3, 0.11),
(2804, '126', 8, 28448.28, 0.11),
(2805, '288', 8, 30673.63, 0.11),
(2806, '300', 11, 19064.41, 0.1),
(2807, '300', 12, 19306.679999999997, 0.1),
(2808, '672', 8, 67835.78, 0.11),
(2809, '384', 8, 3186.88, 0.09),
(2810, '384', 12, 5533.2, 0.1),
(2811, '1114', 9, 9825.99, 0.12),
(2812, '312', 12, 11911.9, 0.12),
(2813, '426', 12, 20850, 0.12),
(2814, '820', 9, 11449.2, 0.12),
(2815, '281', 8, 49132.4, 0.11),
(2816, '475', 7, 8363.6, 0.1),
(2817, '475', 9, 23469.469999999998, 0.1),
(2818, '90', 8, 15183.98, 0.09),
(2819, '413', 8, 3904.08, 0.09),
(2820, '325', 8, 528.88, 0.09),
(2821, '508', 11, 44744.54, 0.1),
(2822, '508', 9, 7087.18, 0.1),
(2823, '879', 13, 9313.34, 0.09),
(2824, '805', 8, 10637.560000000001, 0.09),
(2825, '805', 11, 69247.44, 0.1),
(2826, '751', 8, 41870, 0.11),
(2827, '652', 8, 53414.5, 0.11),
(2828, '721', 8, 43429.05, 0.11),
(2829, '1042', 8, 37343.7, 0.11),
(2830, '997', 8, 47399.31, 0.11),
(2831, '500', 8, 32788.8, 0.11),
(2832, '214', 8, 21244.5, 0.11),
(2833, '385', 8, 18158.4, 0.11),
(2834, '276', 8, 50238.9, 0.11),
(2835, '543', 8, 38562.18, 0.11),
(2836, '539', 8, 50641.32, 0.11),
(2837, '180', 8, 37984.8, 0.11),
(2838, '197', 8, 24122.16, 0.11),
(2839, '629', 8, 24122.16, 0.11),
(2840, '1115', 8, 28115.91, 0.11),
(2841, '133', 8, 26313.73, 0.11),
(2842, '895', 8, 44352, 0.11),
(2843, '236', 13, 49030.92, 0.09),
(2844, '711', 13, 9231.36, 0.09),
(2845, '59', 13, 26964.71, 0.09),
(2846, '991', 11, 14887.1, 0.12),
(2847, '810', 6, 10219.63, 0.12),
(2848, '88', 6, 23301, 0.12),
(2849, '934', 8, 2118.53, 0.11),
(2850, '565', 11, 77927.12, 0.12),
(2851, '458', 11, 30913.91, 0.12),
(2852, '1062', 8, 43887.75, 0.09),
(2853, '263', 8, 10250.24, 0.09),
(2854, '323', 8, 19893.7, 0.09),
(2855, '292', 8, 46458.3, 0.09),
(2856, '209', 13, 29138.48, 0.09),
(2857, '801', 13, 29815.76, 0.09),
(2858, '556', 13, 112645.77, 0.09),
(2859, '779', 8, 37590.62, 0.09),
(2860, '963', 8, 9946.09, 0.09),
(2861, '784', 8, 75242.11, 0.09),
(2862, '81', 8, 47608.92, 0.09),
(2863, '515', 8, 20463.02, 0.09),
(2864, '219', 8, 10734.24, 0.09),
(2865, '435', 8, 52416.45, 0.09),
(2866, '658', 11, 20953.38, 0.1),
(2867, '823', 11, 64194.72, 0.1),
(2868, '581', 8, 86818.04, 0.09),
(2869, '416', 7, 1585.26, 0.1),
(2870, '416', 9, 3828, 0.1),
(2871, '129', 9, 19840.86, 0.1),
(2872, '904', 9, 11045.84, 0.1),
(2873, '211', 12, 22173.16, 0.1),
(2874, '882', 12, 6322.5, 0.1),
(2875, '196', 13, 62344.9, 0.09),
(2876, '863', 13, 92828.35, 0.09),
(2877, '1089', 13, 15419.3, 0.09),
(2878, '58', 13, 29229.32, 0.09),
(2879, '846', 13, 11577.74, 0.09),
(2880, '1016', 8, 21846.6, 0.11),
(2881, '630', 8, 62390.93, 0.11),
(2882, '524', 8, 40857.6, 0.11),
(2883, '136', 8, 47399.31, 0.11),
(2884, '536', 8, 1124.88, 0.09),
(2885, '632', 12, 15317.7, 0.12),
(2886, '709', 13, 10189.7, 0.11),
(2887, '448', 13, 702.66, 0.11),
(2888, '190', 12, 856.8, 0.12),
(2889, '1041', 8, 6836.6, 0.11),
(2890, '455', 7, 66959.43, 0.12),
(2891, '455', 8, 86502.44, 0.11),
(2892, '1057', 7, 176582.94, 0.12),
(2893, '624', 12, 6831.91, 0.12),
(2894, '624', 8, 10375.3, 0.11),
(2895, '64', 7, 26546.8, 0.12),
(2896, '64', 8, 11995.2, 0.11),
(2897, '316', 7, 26492.6, 0.12),
(2898, '316', 8, 19070.71, 0.11),
(2899, '490', 8, 42101.2, 0.11),
(2900, '635', 11, 19135.45, 0.1),
(2901, '635', 8, 6604.42, 0.09),
(2902, '1088', 8, 24959.34, 0.09),
(2903, '1088', 12, 4098.22, 0.1),
(2904, '1088', 11, 3244.09, 0.1),
(2905, '1088', 9, 3896.58, 0.1),
(2906, '747', 9, 30838.84, 0.1),
(2907, '683', 9, 7114.8, 0.1),
(2908, '778', 9, 30228, 0.1),
(2909, '49', 8, 37885.16, 0.09),
(2910, '160', 13, 10859.7, 0.11),
(2911, '600', 8, 22935.15, 0.11),
(2912, '598', 8, 36496.59, 0.11),
(2913, '116', 8, 45460.1, 0.11),
(2914, '342', 8, 45217.4, 0.11),
(2915, '146', 8, 47326.5, 0.11),
(2916, '986', 8, 42591, 0.11),
(2917, '297', 8, 47326.5, 0.11),
(2918, '995', 8, 47326.5, 0.11),
(2919, '926', 8, 47326.5, 0.11),
(2920, '294', 8, 23404, 0.11),
(2921, '21', 8, 26004.1, 0.09),
(2922, '1003', 8, 65353.78, 0.11),
(2923, '860', 8, 39459.84, 0.09),
(2924, '107', 8, 44029.44, 0.11),
(2925, '50', 8, 44029.44, 0.11),
(2926, '648', 8, 18631.38, 0.11),
(2927, '943', 8, 22014.72, 0.11),
(2928, '11', 11, 9489.45, 0.1),
(2929, '11', 9, 8073.200000000001, 0.1),
(2930, '840', 12, 12957.14, 0.1),
(2931, '840', 11, 4876.639999999999, 0.1),
(2932, '193', 8, 27597.839999999997, 0.09),
(2933, '193', 13, 11350.93, 0.09),
(2934, '193', 12, 48542.630000000005, 0.1),
(2935, '193', 6, 3129.75, 0.1),
(2936, '135', 9, 22440, 0.1),
(2937, '859', 7, 58963.32, 0.1),
(2938, '346', 8, 2390.7, 0.09),
(2939, '346', 7, 3134.02, 0.1),
(2940, '346', 11, 2426.2, 0.1),
(2941, '346', 9, 794.64, 0.1),
(2942, '248', 9, 38227.2, 0.1),
(2943, '340', 13, 4122.75, 0.09),
(2944, '340', 11, 70716.81, 0.1),
(2945, '340', 9, 7999.2, 0.1),
(2946, '799', 9, 5228.02, 0.1),
(2947, '51', 8, 35805.3, 0.09),
(2948, '226', 11, 9560.28, 0.1),
(2949, '504', 11, 22386.98, 0.1),
(2950, '821', 11, 12077.7, 0.1),
(2951, '821', 11, 12077.7, 0.1),
(2952, '1021', 8, 25564.77, 0.11),
(2953, '546', 8, 47326.5, 0.11),
(2954, '216', 8, 42189, 0.11),
(2955, '141', 8, 32788.8, 0.11),
(2956, '474', 13, 740.04, 0.09),
(2957, '855', 13, 5745, 0.09),
(2958, '870', 13, 19831.6, 0.09),
(2959, '935', 9, 7600.77, 0.1),
(2960, '542', 8, 380.79999999999995, 0.09),
(2961, '542', 13, 1390.7, 0.09),
(2962, '542', 11, 14212.88, 0.1),
(2963, '484', 9, 10564.4, 0.1),
(2964, '1119', 7, 28708.53, 0.1),
(2965, '868', 9, 16341.6, 0.12),
(2966, '586', 8, 14416.28, 0.11),
(2967, '960', 8, 5315.22, 0.11),
(2968, '960', 7, 11740.009999999998, 0.12),
(2969, '127', 8, 48848.8, 0.11),
(2970, '937', 8, 11845.24, 0.11),
(2971, '529', 8, 19627.82, 0.11),
(2972, '529', 7, 11924.76, 0.12),
(2973, '890', 11, 127808.81000000001, 0.12),
(2974, '890', 8, 10722.42, 0.11),
(2975, '391', 13, 28599.9, 0.11),
(2976, '1123', 13, 45217.4, 0.11),
(2977, '583', 13, 45460.1, 0.11),
(2978, '567', 13, 31904.8, 0.11),
(2979, '231', 13, 47399.31, 0.11),
(2980, '301', 13, 40857.6, 0.11),
(2981, '708', 13, 34278.51, 0.11),
(2982, '941', 13, 36988, 0.11),
(2983, '1004', 12, 13606.7, 0.12),
(2984, '255', 8, 18928.02, 0.09),
(2985, '640', 8, 14332.91, 0.09),
(2986, '902', 8, 41011.44, 0.09),
(2987, '982', 13, 38741.78, 0.09),
(2988, '78', 13, 36645.58, 0.09),
(2989, '220', 12, 17315.1, 0.1),
(2990, '422', 12, 16278.36, 0.1),
(2991, '427', 13, 142499.15, 0.09),
(2992, '1032', 13, 25332.08, 0.09),
(2993, '809', 13, 98714.86, 0.09),
(2994, '922', 13, 58251.46, 0.09),
(2995, '110', 13, 35464.37, 0.09),
(2996, '949', 13, 23487.2, 0.11),
(2997, '939', 8, 27289.01, 0.11),
(2998, '175', 12, 13057.04, 0.11),
(2999, '1133', 19, 6558, 0.9),
(3000, '1133', 20, 555, 0.89),
(3001, '1132', 21, 54654, 0.26),
(3002, '1134', 20, 924224, 0.89),
(3003, '1135', 20, 565, 0.89),
(3004, '1136', 20, 6565, 0.89),
(3005, '1136', 19, 500, 0.9);

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
,`submitDate` date
,`accrualDate` date
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`id`, `name`, `notes`) VALUES
(4, 'sosdi', ''),
(5, 'air port', ''),
(6, 'oct', ''),
(7, 'يلالاب', ''),
(8, 'يلالابلابالب', ''),
(9, 'يلالابلابالبسيقفثسق', ''),
(10, 'ىؤتننتؤتتؤ', '');

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
,`Manifesto Support` double
,`bankreciete` varchar(5)
,`notes` varchar(1000)
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingcompany`
--

INSERT INTO `shippingcompany` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`) VALUES
(4, 'UTI', '', '', '', '', ''),
(5, '3A', '', '', '', '', ''),
(6, 'Cop', '', '', '', '', ''),
(7, 'mesco', '', '', '', '', ''),
(8, 'air port', '', '', '', '', ''),
(9, 'ةينينين', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `submission`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `submission`;
CREATE TABLE IF NOT EXISTS `submission` (
`submitDate` date
,`dat` date
,`PTR` double
,`manifestoSupport` double
,`nolonSupport` double
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `submissiondata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `submissiondata`;
CREATE TABLE IF NOT EXISTS `submissiondata` (
`submitDate` date
,`expDate` date
,`PTR` double
,`nolonSupport` double
,`manifestoSupport` double
,`company` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `t`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `t`;
CREATE TABLE IF NOT EXISTS `t` (
`cheque` int(11)
,`chdataId` int(11)
,`chequeDate` date
,`fileNo` int(20)
,`export` int(11)
,`exportDate` date
,`country` int(11)
,`company` int(11)
,`PTR` double
,`nolon` double
,`manifesto` double
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
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pass`, `company`, `admin`, `edit`) VALUES
(1, 'fgvhcadmin', 'admin@admin', '123', 0, 1, 0),
(2, 'gsdfgddsfdsf', 'faf', 'fsadfsdf', 1, 0, 0),
(3, 'fgsdfgdgsfdg', 'قsdgdfdfgdfgsdfgdsfg', 'fdsgdfsdfgsdfg', 3, 0, 0),
(5, 'gdffgsd', 'gsdfg', 'sdfdgfg', 0, 1, 0),
(6, 'sdfgsdgsdfgddsfdsf', 'sfgsddffaf', 'fsadfsdf', 1, 0, 0),
(19, 'gser', 'erte', 'raserfdsgdfsdfgsdfg', 1, 0, 0),
(20, 'fweqwefewfwe', 'wfefwefwef', 'fe', 1, 0, 0),
(22, 'fwmcmcmeqwefewfwe', 'mdmdmdwfefwefwef', 'mendkjdjdjfe', 1, 0, 0),
(23, 'fwmcmcmeqwefewfwe', 'mdmdmdwfefwefwef', 'mendkjdjdjfe', 1, 0, 0),
(24, 'gser', 'erte', 'raserfdsgdfsdfgsdfg', 1, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `warning`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `warning`;
CREATE TABLE IF NOT EXISTS `warning` (
`export` varchar(100)
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
-- Structure for view `alldetailed`
--
DROP TABLE IF EXISTS `alldetailed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `alldetailed`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `dat`,`e`.`usdToEgp` AS `usdToEgp`,`shco`.`name` AS `shippingCompany`,`e`.`boles` AS `boles`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`submitDate` AS `submitDate`,`e`.`accrualDate` AS `accrualDate`,`e`.`nolon` AS `nolon`,`e`.`manifesto` AS `manifesto`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.5),0) AS `nolonSupport`,if((`cr`.`manifest` and `e`.`manifesto`),(((`e`.`usdToEgp` * `id`.`usdVal`) * `id`.`supportPercentage`) * 0.5),0) AS `manifestoSupport`,`e`.`notes` AS `notes` from (((((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) left join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) left join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) left join `port` on((`port`.`id` = `e`.`port`))) order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `allrecords`
--
DROP TABLE IF EXISTS `allrecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `allrecords`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `exportDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cr`.`name` AS `country`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.05),0) AS `nolon`,if(`cr`.`manifest`,(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) * 0.5),0) AS `manifesto` from (((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) left join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) order by `e`.`num` ;

-- --------------------------------------------------------

--
-- Structure for view `chequerecieved`
--
DROP TABLE IF EXISTS `chequerecieved`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `chequerecieved`  AS  select `ch`.`num` AS `cheque`,`ch`.`dat` AS `chequeDate`,`fno`.`num` AS `fileNo`,`br`.`num` AS `bankreceipt`,`e`.`num` AS `export`,`e`.`dat` AS `exportDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cr`.`name` AS `country`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.05),0) AS `nolon`,if(`cr`.`manifest`,(sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) * 0.5),0) AS `manifesto` from ((((((((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `brand` `b` on((`b`.`id` = `id`.`brand`))) join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) join `client` `cl` on((`cl`.`id` = `i`.`client`))) join `bankreceiptdata` `brdata` on((`brdata`.`exportCertificate` = `e`.`id`))) join `bankreceipt` `br` on((`br`.`id` = `brdata`.`bankReceipt`))) join `fileno` `fno` on((`fno`.`exportCertificate` = `e`.`id`))) join `chequedata` `chdata` on((`chdata`.`fileNo` = `fno`.`id`))) join `cheque` `ch` on((`ch`.`id` = `chdata`.`cheque`))) group by `e`.`id`,`nolon` order by `e`.`num` ;

-- --------------------------------------------------------

--
-- Structure for view `estivareport`
--
DROP TABLE IF EXISTS `estivareport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `estivareport`  AS  select `e`.`num` AS `export`,`shco`.`name` AS `shippingCompany`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`submitDate` AS `submitDate`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.5),0) AS `nolon`,if((`cr`.`manifest` and `e`.`manifesto`),(((`e`.`usdToEgp` * `id`.`usdVal`) * `id`.`supportPercentage`) * 0.5),0) AS `manifesto`,`estiva`.`note` AS `note` from ((((((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `brand` `b` on((`b`.`id` = `id`.`brand`))) join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) join `client` `cl` on((`cl`.`id` = `i`.`client`))) join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) join `port` on((`port`.`id` = `e`.`port`))) join `estiva` on((`e`.`id` = `estiva`.`exportCertificate`))) order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `notsubmitted`
--
DROP TABLE IF EXISTS `notsubmitted`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `notsubmitted`  AS  select `e`.`id` AS `id`,`e`.`num` AS `export`,`e`.`dat` AS `dat`,`e`.`usdToEgp` AS `usdToEgp`,`shco`.`name` AS `shippingCompany`,`e`.`boles` AS `boles`,`port`.`name` AS `PORT`,`e`.`dat` AS `exportDate`,`e`.`submitDate` AS `submitDate`,`e`.`accrualDate` AS `accrualDate`,`e`.`nolon` AS `nolon`,`e`.`manifesto` AS `manifesto`,`i`.`num` AS `Invoice`,`i`.`performa` AS `performa`,`i`.`systemRef` AS `systemRef`,`cl`.`name` AS `CLIENT`,`cr`.`name` AS `country`,`cr`.`nolon` AS `Cnolon`,`cr`.`manifest` AS `Cmanifest`,`cn`.`name` AS `company`,`b`.`name` AS `brand`,`bc`.`name` AS `entity`,`id`.`usdVal` AS `usdVal`,((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`) AS `PTR`,if(`cr`.`nolon`,((`e`.`nolon` * `e`.`usdToEgp`) * 0.5),0) AS `nolonSupport`,if((`cr`.`manifest` and `e`.`manifesto`),(((`e`.`usdToEgp` * `id`.`usdVal`) * `id`.`supportPercentage`) * 0.5),0) AS `manifestoSupport`,if(`e`.`id` in (select `bankreceiptdata`.`exportCertificate` from `bankreceiptdata`),'TRUE','FALSE') AS `bankreciete`,`e`.`notes` AS `notes` from (((((((((`exportcertificate` `e` left join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) left join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) left join `brand` `b` on((`b`.`id` = `id`.`brand`))) left join `brandcat` `bc` on((`bc`.`id` = `b`.`brandCat`))) left join `client` `cl` on((`cl`.`id` = `i`.`client`))) left join `shippingcompany` `shco` on((`e`.`shippingCompany` = `shco`.`id`))) left join `port` on((`port`.`id` = `e`.`port`))) where ((if(`cr`.`nolon`,`e`.`nolon`,1) = 0) or (if(`cr`.`manifest`,`e`.`manifesto`,1) = 0) or (`e`.`notes` <> '') or (not(`e`.`id` in (select `bdata2`.`exportCertificate` from `bankreceiptdata` `bdata2`)))) order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `repoerror`
--
DROP TABLE IF EXISTS `repoerror`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `repoerror`  AS  select `notsubmitted`.`export` AS `exportCertificate`,`notsubmitted`.`company` AS `company`,`notsubmitted`.`dat` AS `dat`,`notsubmitted`.`Invoice` AS `Invoice`,`notsubmitted`.`PORT` AS `PORT`,`notsubmitted`.`shippingCompany` AS `shippingCompany`,sum(`notsubmitted`.`usdVal`) AS `Export (USD)`,sum(`notsubmitted`.`PTR`) AS `PTR`,`notsubmitted`.`nolonSupport` AS `Nolon Support`,sum(`notsubmitted`.`manifestoSupport`) AS `Manifesto Support`,`notsubmitted`.`bankreciete` AS `bankreciete`,`notsubmitted`.`notes` AS `notes` from `notsubmitted` group by `notsubmitted`.`export` ;

-- --------------------------------------------------------

--
-- Structure for view `submission`
--
DROP TABLE IF EXISTS `submission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `submission`  AS  select `submissiondata`.`submitDate` AS `submitDate`,`submissiondata`.`expDate` AS `dat`,sum(`submissiondata`.`PTR`) AS `PTR`,sum(`submissiondata`.`manifestoSupport`) AS `manifestoSupport`,sum(`submissiondata`.`nolonSupport`) AS `nolonSupport`,`submissiondata`.`company` AS `company` from `submissiondata` group by month(`submissiondata`.`expDate`) ;

-- --------------------------------------------------------

--
-- Structure for view `submissiondata`
--
DROP TABLE IF EXISTS `submissiondata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `submissiondata`  AS  select `fileno`.`dat` AS `submitDate`,`alldetailed`.`dat` AS `expDate`,sum(`alldetailed`.`PTR`) AS `PTR`,`alldetailed`.`nolonSupport` AS `nolonSupport`,sum(`alldetailed`.`manifestoSupport`) AS `manifestoSupport`,`alldetailed`.`company` AS `company` from (`alldetailed` join `fileno` on((`fileno`.`exportCertificate` = `alldetailed`.`id`))) group by `alldetailed`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `t`
--
DROP TABLE IF EXISTS `t`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t`  AS  select `ch`.`id` AS `cheque`,`chdata`.`id` AS `chdataId`,`ch`.`dat` AS `chequeDate`,`fno`.`id` AS `fileNo`,`e`.`id` AS `export`,`e`.`dat` AS `exportDate`,`cr`.`id` AS `country`,`cn`.`id` AS `company`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) AS `PTR`,if(`cr`.`nolon`,sum(((`e`.`nolon` * `e`.`usdToEgp`) * 0.05)),0) AS `nolon`,if(`cr`.`manifest`,(sum(((`id`.`usdVal` * `id`.`supportPercentage`) * `e`.`usdToEgp`)) * 0.5),0) AS `manifesto` from (((((((`exportcertificate` `e` join `invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) join `invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `country` `cr` on((`e`.`country` = `cr`.`id`))) join `company` `cn` on((`cn`.`id` = `e`.`company`))) join `fileno` `fno` on((`fno`.`exportCertificate` = `e`.`id`))) join `chequedata` `chdata` on((`chdata`.`fileNo` = `fno`.`id`))) join `cheque` `ch` on((`ch`.`id` = `chdata`.`cheque`))) group by `fno`.`id` order by `e`.`dat` ;

-- --------------------------------------------------------

--
-- Structure for view `warning`
--
DROP TABLE IF EXISTS `warning`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `warning`  AS  select `notsubmitted`.`export` AS `export`,`notsubmitted`.`dat` AS `dat`,`notsubmitted`.`Invoice` AS `Invoice`,`notsubmitted`.`PORT` AS `PORT`,`notsubmitted`.`shippingCompany` AS `shippingCompany`,sum(`notsubmitted`.`usdVal`) AS `Export (USD)`,sum(`notsubmitted`.`PTR`) AS `PTR`,`notsubmitted`.`nolonSupport` AS `Nolon Support`,sum(`notsubmitted`.`manifestoSupport`) AS `Manifesto Support`,`notsubmitted`.`bankreciete` AS `bankreciete` from `notsubmitted` where (cast((now() - interval 9 month) as date) >= `notsubmitted`.`dat`) group by `notsubmitted`.`export` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
