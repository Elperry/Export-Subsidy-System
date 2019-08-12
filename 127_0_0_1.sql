-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 11, 2019 at 08:26 PM
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brandcat`
--

INSERT INTO `brandcat` (`id`, `name`) VALUES
(1, 'dffvdvfdf'),
(2, '2fdfb');

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
-- Table structure for table `exportcertificate`
--

DROP TABLE IF EXISTS `exportcertificate`;
CREATE TABLE IF NOT EXISTS `exportcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `company` int(11) NOT NULL,
  `dat` datetime NOT NULL,
  `country` int(11) NOT NULL,
  `port` int(11) NOT NULL,
  `shippingCompany` int(11) NOT NULL,
  `boles` tinyint(1) NOT NULL DEFAULT '0',
  `bankReciete` tinyint(1) NOT NULL DEFAULT '0',
  `nolon` tinyint(1) NOT NULL DEFAULT '0',
  `manifesto` tinyint(1) NOT NULL DEFAULT '0',
  `estifa` tinyint(1) NOT NULL DEFAULT '0',
  `usdToEgp` double NOT NULL DEFAULT '0',
  `submitDate` date DEFAULT NULL,
  `accrualDate` date DEFAULT NULL,
  `notes` varchar(500) NOT NULL DEFAULT '   ',
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

INSERT INTO `exportcertificate` (`id`, `num`, `company`, `dat`, `country`, `port`, `shippingCompany`, `boles`, `bankReciete`, `nolon`, `manifesto`, `estifa`, `usdToEgp`, `submitDate`, `accrualDate`, `notes`) VALUES
(1, '5465', 1, '2019-08-30 00:00:00', 3, 1, 2, 0, 0, 0, 0, 0, 55, '2019-08-08', '2019-08-08', '   '),
(2, '554', 1, '2019-08-11 00:00:00', 3, 1, 2, 0, 0, 0, 0, 0, 20, NULL, NULL, '   ');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `exportCertificate` (`exportCertificate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `num`, `client`, `exportCertificate`, `performa`, `systemRef`) VALUES
(1, '888', 2, '1', '5488', '88454'),
(2, '5464577', 2, '1', '56450', '54654'),
(3, '56546', 2, '2', '654654', '54654');

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
  `egpVal` double NOT NULL,
  `PTREgp` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedata`
--

INSERT INTO `invoicedata` (`id`, `invoice`, `brand`, `usdVal`, `egpVal`, `PTREgp`) VALUES
(1, '1', 1, 521542, 0, 0),
(2, '3', 2, 55, 275, 63.25),
(3, '3', 3, 5784, 31790, 4768.5),
(4, '2', 1, 2651, 5300, 2650);

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
  PRIMARY KEY (`id`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pass`, `company`, `admin`) VALUES
(1, 'admin', 'admin@admin', '123', 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`brandCat`) REFERENCES `brandcat` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);

--
-- Constraints for table `exportcertificate`
--
ALTER TABLE `exportcertificate`
  ADD CONSTRAINT `exportcertificate_ibfk_1` FOREIGN KEY (`company`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `exportcertificate_ibfk_2` FOREIGN KEY (`country`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `exportcertificate_ibfk_3` FOREIGN KEY (`port`) REFERENCES `port` (`id`),
  ADD CONSTRAINT `exportcertificate_ibfk_4` FOREIGN KEY (`shippingCompany`) REFERENCES `shippingcompany` (`id`);

--
-- Constraints for table `invoicedata`
--
ALTER TABLE `invoicedata`
  ADD CONSTRAINT `invoicedata_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`company`) REFERENCES `company` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
