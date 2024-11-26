-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2024 at 05:11 AM
-- Server version: 5.6.20-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vegitabledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `addressLine1` varchar(255) NOT NULL,
  `addressLine2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `userId`, `isDefault`, `title`, `addressLine1`, `addressLine2`, `city`, `state`, `landmark`, `postalCode`, `country`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(3, 'giplanand@gmail.com', 1, '', 'JAUNPUR', 'MUNGRA BADSHAPUR', 'JAUNPUR', '', 'NH31', 22202, 'INDIA', '2024-11-18 20:40:03', '0000-00-00 00:00:00', 'Admin', ''),
(4, 'giplanand@gmail.coms', 0, '', 'Mumn', 'hj', '', '', '', 0, '', '2024-11-20 23:26:39', '0000-00-00 00:00:00', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(100,2) DEFAULT NULL,
  `total` float(100,2) NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `quantity`, `price`, `total`, `size`, `color`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(146, 'giplanand@gmail.com', '202', 2, 50.00, 100.00, '', '', '2024-11-18 04:05:34', NULL, 'giplanand@gmail.com', ''),
(143, 'giplanand@gmail.com', '209', 1, 5.00, 5.00, '', '', '2024-11-17 07:24:21', NULL, 'giplanand@gmail.com', ''),
(140, 'giplanand@gmail.com', '209', 1, 5.00, 5.00, '', '', '2024-11-17 06:50:54', NULL, 'giplanand@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoriesImage` varchar(255) NOT NULL,
  `commision` float(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `categoriesImage`, `commision`, `description`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(128, 'Vegetables', '128', 5.00, 'BEST QUALITY PRODUCTE', 1, '2024-11-11 03:03:45', '2024-11-21 06:04:15', 'Admin', ''),
(129, 'Fruits', '129', 5.00, 'jjjj', 1, '2024-11-11 03:06:55', '0000-00-00 00:00:00', 'Admin', ''),
(130, 'Flower', '130', 5.00, 'Flower and decoration', 1, '2024-11-21 05:50:17', '2024-11-21 05:59:43', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `commision`
--

CREATE TABLE IF NOT EXISTS `commision` (
`id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `commissionhistory`
--

CREATE TABLE IF NOT EXISTS `commissionhistory` (
  `id` int(11) NOT NULL DEFAULT '0',
  `categoriesId` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliverybankdetails`
--

CREATE TABLE IF NOT EXISTS `deliverybankdetails` (
`id` int(11) NOT NULL,
  `deliveryId` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `accountHolderName` varchar(255) NOT NULL,
  `ifscCode` varchar(255) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `deliverybankdetails`
--

INSERT INTO `deliverybankdetails` (`id`, `deliveryId`, `bankName`, `accountHolderName`, `ifscCode`, `accountNo`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`) VALUES
(15, '75', 'STATE BANK OF INDIA', 'RAHUL KUMAR PATEL', 'SBIN0003617', 999888888888, '2024-11-05 04:36:50', 'Admin', '0000-00-00 00:00:00', ''),
(16, '88', '', '', '', 0, '2024-11-05 05:16:34', 'Admin', '0000-00-00 00:00:00', ''),
(17, '89', 'sbi', 'RAJESH KUMAR', 'SBIN00003655', 32654987, '2024-11-05 06:22:09', 'Admin', '0000-00-00 00:00:00', ''),
(18, '90', '', '', '', 0, '2024-11-05 06:43:43', 'Admin', '0000-00-00 00:00:00', ''),
(19, '91', '', '', '', 0, '2024-11-04 21:06:06', 'Admin', '0000-00-00 00:00:00', ''),
(20, '92', '', '', '', 0, '2024-11-11 05:48:55', 'Admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryboy`
--

CREATE TABLE IF NOT EXISTS `deliveryboy` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNo` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `workingAddress` varchar(255) NOT NULL,
  `regidenceAddress` varchar(255) NOT NULL,
  `workingPincode` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `aadhar` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `deliveryboy`
--

INSERT INTO `deliveryboy` (`id`, `name`, `phoneNo`, `email`, `password`, `workingAddress`, `regidenceAddress`, `workingPincode`, `status`, `aadhar`, `pan`, `image`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(75, 'RAHUL KUMAR PATEL', 9999999999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR MADHUPUR MARKET', 'MADARDEEH MUNGRA BADSHAPUR', 222201, 1, '8888888888', 'ABCDEDB888', '../img/delivery/', '2024-11-05 10:06:50', '2024-11-21 12:09:05', 'Admin', ''),
(88, 'RAJESH', 999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR', 'JAUNPUR BADSHAHPUR', 2222209, 2, '6666666', '66666666', '../img/delivery/', '2024-11-05 10:46:34', '2024-11-21 12:06:25', 'Admin', ''),
(89, 'RAJESH KUMAR', 5555555, 'GGG2@GMAIL.COM', '123', 'KKKKKK', 'KKKKK', 222202, 2, '88888', 'KKKK', '../img/delivery/', '2024-11-05 11:52:09', '2024-11-23 09:40:23', 'Admin', ''),
(90, 'RAKESH', 55555, 'ABC@GMAIL.COM', '6723', 'RAJESH', 'JJJJ', 0, 1, 'KKKK', 'KKKK', '../img/delivery/', '2024-11-05 12:13:43', '2024-11-21 12:04:04', 'Admin', ''),
(91, 'DELIVERY BOY', 1233211233, 'NEW@GMAIL.COM', '5153', 'JAUNAPUR', 'JAUNPUR BADSHAHPUR', 2222202, 1, '1236547899888', '555', '../img/delivery/', '2024-11-05 02:36:06', '2024-11-21 12:05:19', 'Admin', ''),
(92, 'RAJESH YADAV', 55555, '55SSLD@GMAL..COM', '1328', '55555', '5555', 55, 2, '55', '5555', '../img/delivery/', '2024-11-11 11:18:55', '2024-11-21 12:09:20', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryincome`
--

CREATE TABLE IF NOT EXISTS `deliveryincome` (
`id` int(11) NOT NULL,
  `deliveryId` varchar(255) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `commission` float(10,2) NOT NULL,
  `otherCommision` float(10,2) NOT NULL,
  `fuelCharges` float(10,2) NOT NULL,
  `tipAmount` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` varchar(255) NOT NULL,
  `updateOn` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `deliveryincome`
--

INSERT INTO `deliveryincome` (`id`, `deliveryId`, `sellarId`, `orderId`, `amount`, `commission`, `otherCommision`, `fuelCharges`, `tipAmount`, `createdOn`, `updatedBy`, `updateOn`, `createdBy`) VALUES
(10, '89', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 06:22:09', '', '', 'Admin'),
(11, '90', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 06:43:43', '', '', 'Admin'),
(12, '91', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-04 21:06:06', '', '', 'Admin'),
(9, '88', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 05:16:34', '', '', 'Admin'),
(8, '75', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 04:36:50', '', '', 'Admin'),
(13, '92', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:48:55', '', '', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE IF NOT EXISTS `offer` (
`id` int(11) NOT NULL,
  `offerId` varchar(255) NOT NULL,
  `offerAmount` float(10,2) NOT NULL,
  `offerName` varchar(255) NOT NULL,
  `offerDuration` varchar(255) NOT NULL,
  `offerCode` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
`id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `sellerId` varchar(255) NOT NULL,
  `deliveryId` varchar(255) DEFAULT NULL,
  `paymentId` varchar(255) NOT NULL,
  `total` double(100,2) NOT NULL,
  `sgst` float(10,2) NOT NULL,
  `cgst` float(10,2) NOT NULL,
  `totalCommision` float(10,2) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `userId`, `orderId`, `sellerId`, `deliveryId`, `paymentId`, `total`, `sgst`, `cgst`, `totalCommision`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(3, '123', '465', '103', '345', 'payment75894375', 799.00, 0.00, 0.00, 475.00, 1, '2024-11-25 08:26:39', '0000-00-00 00:00:00', 'Admin', '345'),
(4, '123', '8', '103', 'delivery8457', 'payment75894375', 799.00, 10.00, 580.00, 475.00, 3, '2024-11-24 01:42:19', '0000-00-00 00:00:00', 'Admin', 'JWT');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE IF NOT EXISTS `orderitem` (
`id` int(11) NOT NULL,
  `userId` varchar(999) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `productSkuId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `price` float(10,2) NOT NULL,
  `adminCommision` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `userId`, `orderId`, `productId`, `productSkuId`, `quantity`, `discount`, `price`, `adminCommision`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(52, '', '345egr45', '75876', 'productSkuId56', 34, 6.00, 677.00, 0.00, '0000-00-00 00:00:00', NULL, 'Admin', NULL),
(53, '', '345egr452', '758762', 'productSkuId562', 32, 62.00, 6727.00, 0.00, '0000-00-00 00:00:00', NULL, 'POstman', NULL),
(54, '', '', '', '', 0, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', NULL, '', NULL),
(55, '232', '123', '4324', 'skuir478', 43, 43.00, 344.00, 123.00, '2012-12-20 18:30:00', NULL, 'Admin', NULL),
(56, '232', '123', '432344', 'skuir478', 43, 43.00, 344.00, 123.00, '2012-12-20 18:30:00', NULL, 'Admin', NULL),
(57, '153', '867', '6867685', 'productSkuId5622', 2323, 1.00, 6727.00, 234.00, '0000-00-00 00:00:00', NULL, 'POstman', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paymentdetails`
--

CREATE TABLE IF NOT EXISTS `paymentdetails` (
`id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `refundId` varchar(255) DEFAULT NULL,
  `paymentMode` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `popularity`
--

CREATE TABLE IF NOT EXISTS `popularity` (
`id` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `popularityhistory`
--

CREATE TABLE IF NOT EXISTS `popularityhistory` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productattributes`
--

CREATE TABLE IF NOT EXISTS `productattributes` (
`id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `skuId` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `producthistory`
--

CREATE TABLE IF NOT EXISTS `producthistory` (
`id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `sizeAttributeId` varchar(255) NOT NULL,
  `colorAttributeId` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `producthistory`
--

INSERT INTO `producthistory` (`id`, `productId`, `sizeAttributeId`, `colorAttributeId`, `skuId`, `price`, `quantity`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(78, '196', '', '', '33302', 50, 20, '2024-11-11 00:15:00', NULL, 'Admin', NULL),
(79, '197', '', '', '58199', 50, 20, '2024-11-11 00:17:10', NULL, 'Admin', NULL),
(80, '198', '', '', '58199', 50, 20, '2024-11-11 00:18:53', NULL, 'Admin', NULL),
(81, '199', '', '', '58199', 50, 20, '2024-11-11 00:19:30', NULL, 'Admin', NULL),
(82, '200', '', '', '58199', 50, 20, '2024-11-11 00:20:01', NULL, 'Admin', NULL),
(83, '200', '', '', '58199', 50, 20, '2024-11-11 00:20:05', NULL, 'Admin', NULL),
(84, '202', '', '', '58199', 50, 20, '2024-11-11 00:21:40', NULL, 'Admin', NULL),
(85, '203', '', '', '58199', 50, 20, '2024-11-11 00:24:01', NULL, 'Admin', NULL),
(86, '204', '', '', '58199', 50, 20, '2024-11-11 00:24:31', NULL, 'Admin', NULL),
(87, '205', '', '', '90744', 50, 20, '2024-11-11 00:26:06', NULL, 'Admin', NULL),
(74, '192', '55', '5', '59529', 34, 6, '2024-11-10 20:53:02', NULL, 'Admin', NULL),
(89, '207', '', '', '81987', 55, 555, '2024-11-11 00:29:04', NULL, 'Admin', NULL),
(90, '209', '', '', '16108', 5, 5, '2024-11-11 00:31:30', NULL, 'Admin', NULL),
(88, '207', '', '', '86124', 5555, 8, '2024-11-11 00:27:20', NULL, 'Admin', NULL),
(77, '195', '555', '', '59018', 5, 7, '2024-11-11 00:09:20', NULL, 'Admin', NULL),
(76, '194', '555', '', '59018', 5, 7, '2024-11-11 00:08:26', NULL, 'Admin', NULL),
(75, '193', '555', '', '59018', 5, 7, '2024-11-11 00:04:48', NULL, 'Admin', NULL),
(91, '210', '', '', '16108', 5, 5, '2024-11-11 01:21:27', NULL, 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `mainImage` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `trending` varchar(255) NOT NULL,
  `arrival` varchar(255) NOT NULL,
  `bestselling` varchar(255) NOT NULL,
  `popular` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `shippingCharge` float NOT NULL,
  `rating` varchar(255) NOT NULL,
  `categoriesId` varchar(255) NOT NULL,
  `subcategaryId` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sellarId`, `name`, `description`, `image`, `mainImage`, `skuId`, `trending`, `arrival`, `bestselling`, `popular`, `price`, `discount`, `status`, `shippingCharge`, `rating`, `categoriesId`, `subcategaryId`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(210, '103', 'APPLEPPOO', 'HHHHHHHHHHH', '', '', '16108', '', '', '', '', 5, 5.00, 0, 20, '', '128', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(202, '102', 'ANAND', 'sds', '', '', '58199', '', '', '', '', 50, 54.00, 0, 20, '', '128', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(209, '103', 'Dharm', 'HHHHHHHHHHH', '', '', '16108', '', '', '', '', 5, 5.00, 0, 20, '', '129', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `productskuid`
--

CREATE TABLE IF NOT EXISTS `productskuid` (
`id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `sizeAttributeId` varchar(255) NOT NULL,
  `colorAttributeId` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `price` float(100,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `productskuid`
--

INSERT INTO `productskuid` (`id`, `productId`, `sizeAttributeId`, `colorAttributeId`, `skuId`, `price`, `quantity`, `createdOn`, `UpdatedOn`, `createdBy`, `updatedBy`) VALUES
(85, '210', '', '', '16108', 5.00, 16, '2024-11-16 19:27:05', '2024-11-17 07:27:05', 'Admin', '210'),
(84, '209', '', '', '16108', 5.00, 19, '2024-11-16 18:47:34', '2024-11-17 06:47:34', 'Admin', '209'),
(83, '207', '', '', '81987', 55.00, 554, '2024-11-11 00:29:04', '2024-11-12 07:20:03', 'Admin', NULL),
(82, '207', '', '', '86124', 5555.00, 7, '2024-11-11 00:27:20', '2024-11-12 07:20:03', 'Admin', NULL),
(80, '204', '', '', '58199', 50.00, 20, '2024-11-11 00:24:31', NULL, 'Admin', NULL),
(81, '205', '', '', '90744', 50.00, 20, '2024-11-11 00:26:06', NULL, 'Admin', NULL),
(77, '200', '', '', '58199', 50.00, 20, '2024-11-11 00:20:05', NULL, 'Admin', NULL),
(78, '202', '', '', '58199', 50.00, 21, '2024-11-16 19:27:56', '2024-11-17 07:27:56', 'Admin', NULL),
(79, '203', '', '', '58199', 50.00, 20, '2024-11-11 00:24:01', NULL, 'Admin', NULL),
(76, '200', '', '', '58199', 50.00, 20, '2024-11-11 00:20:01', NULL, 'Admin', NULL),
(75, '199', '', '', '58199', 50.00, 20, '2024-11-11 00:19:30', NULL, 'Admin', NULL),
(74, '198', '', '', '58199', 50.00, 20, '2024-11-11 00:18:53', NULL, 'Admin', NULL),
(73, '197', '', '', '58199', 50.00, 20, '2024-11-11 00:17:10', NULL, 'Admin', NULL),
(72, '196', '', '', '33302', 50.00, 0, '2024-11-11 00:15:00', NULL, 'Admin', NULL),
(71, '195', '555', '', '59018', 5.00, 7, '2024-11-11 00:09:20', NULL, 'Admin', NULL),
(70, '194', '555', '', '59018', 5.00, 7, '2024-11-11 00:08:26', NULL, 'Admin', NULL),
(69, '193', '555', '', '59018', 5.00, 7, '2024-11-11 00:04:48', NULL, 'Admin', NULL),
(68, '128', '55', '5', '59529', 34.00, -9, '2024-11-15 12:22:00', '2024-11-11 20:36:08', 'Admin', '192');

-- --------------------------------------------------------

--
-- Table structure for table `refunddetails`
--

CREATE TABLE IF NOT EXISTS `refunddetails` (
`id` int(11) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `totalAmount` float(10,2) NOT NULL,
  `createdBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sellar`
--

CREATE TABLE IF NOT EXISTS `sellar` (
`id` int(11) NOT NULL,
  `sellarName` varchar(255) NOT NULL,
  `counterName` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `gst` varchar(255) NOT NULL,
  `aadhar` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `phoneNo` bigint(11) NOT NULL,
  `regFee` float(10,2) NOT NULL,
  `depositAmount` float(10,2) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `sellar`
--

INSERT INTO `sellar` (`id`, `sellarName`, `counterName`, `pan`, `gst`, `aadhar`, `image`, `phoneNo`, `regFee`, `depositAmount`, `password`, `email`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(102, 'ANAND', 'SSSSS', 'KK', 'KKKK', 'KK', '', 999999, 50.00, 500.00, '6980', 'KKK', 2, '2024-09-11 04:40:28', '0000-00-00 00:00:00', 'Admin', ''),
(103, 'RAKESH', 'SABJI SHOP', 'ABDKKII44', '5255DD55', '889955665544', '', 55555555, 50.00, 500.00, '123', 'GIPLANAND@GMAIL.COM', 2, '2024-09-11 04:50:38', '0000-00-00 00:00:00', 'Admin', ''),
(75, 'AMITABH', 'KESHAV', '55A5A5A5A5', '888hhhhhhh', '5588555522222', '', 888888888888, 50.00, 500.00, '28605', 'hhhhhhhhhhhhhh@GMAIL.COM', 1, '2024-05-11 02:38:15', '2024-11-05 04:41:38', 'Admin', 'Admin'),
(101, 'RAKESH', 'GOLA SABJI MARKET', 'AKKKBK55', '555D5D5D5', '55555', '', 999999, 50.00, 500.00, '21591', 'ABC@GMAIL.COM', 1, '2024-09-11 04:38:53', '0000-00-00 00:00:00', 'Admin', ''),
(96, 'AMAN', 'AMAMM', 'GGHHFF', 'GST', '55558', '', 99999, 50.00, 500.00, '11788', 'KDKDK@GMAIL.COM', 1, '2024-05-11 11:13:31', '0000-00-00 00:00:00', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `sellaraddress`
--

CREATE TABLE IF NOT EXISTS `sellaraddress` (
`id` int(11) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `customerCareNo` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `teamMembers` varchar(11) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `sellaraddress`
--

INSERT INTO `sellaraddress` (`id`, `sellarId`, `address`, `city`, `pincode`, `customerCareNo`, `feedback`, `teamMembers`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(42, '102', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:10:29', '', '0000-00-00 00:00:00'),
(40, '103', 'ADDRESS', 'JAUNPUR', 222202, NULL, NULL, NULL, 'Admin', '2024-11-23 09:46:30', 'Admin', '2024-11-05 04:09:15'),
(43, '103', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:20:40', '', '0000-00-00 00:00:00'),
(36, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:43:40', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sellarbankdetails`
--

CREATE TABLE IF NOT EXISTS `sellarbankdetails` (
`id` int(11) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `AccountHolderName` varchar(255) DEFAULT NULL,
  `ifscCode` varchar(255) DEFAULT NULL,
  `upiId` varchar(255) DEFAULT NULL,
  `accountNo` bigint(20) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `sellarbankdetails`
--

INSERT INTO `sellarbankdetails` (`id`, `sellarId`, `bankName`, `AccountHolderName`, `ifscCode`, `upiId`, `accountNo`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(39, '102', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:10:29', NULL, NULL),
(37, '75', 'sksksksk', NULL, 'kkkk', '555', 5555555, 'Admin', '2024-11-04 21:08:16', 'Admin', '2024-11-04 22:36:04'),
(40, '103', 'ssds', NULL, '5s5sa5d', '55s5d5', 5555, 'Admin', '2024-11-08 23:20:40', 'Admin', '2024-11-09 05:58:43'),
(33, '', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:43:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE IF NOT EXISTS `subcategories` (
`id` int(11) NOT NULL,
  `parentId` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `subcategoriesImage` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `parentId`, `name`, `description`, `subcategoriesImage`, `createdOn`, `createdBy`, `updatedBy`, `updatedOn`) VALUES
(70, '111', 'CENT', 'KKKK', '69', '2024-11-05 12:26:21', '', '', '2024-11-05 12:26:21'),
(69, '111', 'AGARBATTI', 'BEST FLEWAR', '65', '2024-11-05 12:24:11', '', '', '2024-11-05 12:24:11'),
(71, '111', 'SONA', 'BEST QUALITY', '70', '2024-11-05 01:39:17', '', '', '2024-11-05 01:39:17'),
(72, '128', 'Eat Second Quqlity', 'JJKKJJ', '71', '2024-11-11 03:16:11', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `useracountdetails`
--

CREATE TABLE IF NOT EXISTS `useracountdetails` (
`id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `AccountHolderName` varchar(255) NOT NULL,
  `ifscCode` varchar(255) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `phoneNo` bigint(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `lastLogin` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userId`, `name`, `userName`, `email`, `password`, `dateOfBirth`, `phoneNo`, `status`, `lastLogin`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(6, '', 'ANAND', '', 'giplanand@gmail.com', '123', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '2024-11-15 08:32:02', '', ''),
(19, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'giplanand@gmail.com', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(18, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(17, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(16, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(20, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(21, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(22, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(23, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(24, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(25, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(26, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(27, 'GIPLANANDW@GMAIL.COM', 'ANAND', 'GIPLANANDW@GMAIL.COM', 'GIPLANANDW@GMAIL.COM', '222', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
`id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `commision`
--
ALTER TABLE `commision`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverybankdetails`
--
ALTER TABLE `deliverybankdetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryincome`
--
ALTER TABLE `deliveryincome`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `orderId` (`orderId`,`productId`);

--
-- Indexes for table `paymentdetails`
--
ALTER TABLE `paymentdetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popularity`
--
ALTER TABLE `popularity`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productattributes`
--
ALTER TABLE `productattributes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producthistory`
--
ALTER TABLE `producthistory`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productskuid`
--
ALTER TABLE `productskuid`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunddetails`
--
ALTER TABLE `refunddetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellar`
--
ALTER TABLE `sellar`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellaraddress`
--
ALTER TABLE `sellaraddress`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellarbankdetails`
--
ALTER TABLE `sellarbankdetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
 ADD PRIMARY KEY (`id`), ADD KEY `parentId` (`parentId`);

--
-- Indexes for table `useracountdetails`
--
ALTER TABLE `useracountdetails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `commision`
--
ALTER TABLE `commision`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deliverybankdetails`
--
ALTER TABLE `deliverybankdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `deliveryincome`
--
ALTER TABLE `deliveryincome`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `paymentdetails`
--
ALTER TABLE `paymentdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `popularity`
--
ALTER TABLE `popularity`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productattributes`
--
ALTER TABLE `productattributes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `producthistory`
--
ALTER TABLE `producthistory`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `productskuid`
--
ALTER TABLE `productskuid`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `refunddetails`
--
ALTER TABLE `refunddetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sellar`
--
ALTER TABLE `sellar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `sellaraddress`
--
ALTER TABLE `sellaraddress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `sellarbankdetails`
--
ALTER TABLE `sellarbankdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `useracountdetails`
--
ALTER TABLE `useracountdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
