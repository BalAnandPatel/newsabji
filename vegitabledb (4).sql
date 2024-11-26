-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 09, 2024 at 07:27 AM
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
  `title` varchar(255) NOT NULL,
  `addressLine1` varchar(255) NOT NULL,
  `addressLine2` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `userId`, `title`, `addressLine1`, `addressLine2`, `country`, `city`, `landmark`, `postalCode`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(3, 'giplanand@gmail.com', '', 'JAUNPUR', 'MUNGRA BADSHAPUR', 'INDIA', 'JAUNPUR', 'NH31', 22202, '2024-11-05 22:22:15', '0000-00-00 00:00:00', 'Admin', ''),
(4, 'GIPLANANDW@GMAIL.COM', '', '', '', '', '', '', 0, '2024-11-05 22:23:16', '0000-00-00 00:00:00', 'Admin', '');

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
  `total` float NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `quantity`, `total`, `size`, `color`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(55, 'giplanand@gmail.com', '163', 1, 0, '', '', '2024-11-09 05:04:54', '0000-00-00 00:00:00', 'Admin', ''),
(53, 'giplanand@gmail.com', '161', 1, 0, '', '', '2024-11-09 04:59:36', '0000-00-00 00:00:00', 'Admin', ''),
(54, 'giplanand@gmail.com', '165', 1, 0, '', '', '2024-11-09 05:00:10', '0000-00-00 00:00:00', 'Admin', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `categoriesImage`, `commision`, `description`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(113, 'Fruits', '113', 5.00, 'Best Quality Fruits', 0, '2024-11-08 11:03:04', '2024-11-08 11:03:04', '', ''),
(112, 'new category', '112', 15.00, 'ddd', 0, '2024-11-05 01:31:31', '2024-11-05 01:31:31', '', ''),
(111, 'HAWAN SAMGRI', '111', 15.00, 'BEST QUALITY PRODUCT', 0, '2024-11-05 12:22:31', '2024-11-05 12:22:31', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `commision`
--

CREATE TABLE IF NOT EXISTS `commision` (
`id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createdOn` timestamp NOT NULL,
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
  `createdOn` timestamp NOT NULL,
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
  `createdOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `deliverybankdetails`
--

INSERT INTO `deliverybankdetails` (`id`, `deliveryId`, `bankName`, `accountHolderName`, `ifscCode`, `accountNo`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`) VALUES
(15, '75', 'STATE BANK OF INDIA', 'RAHUL KUMAR PATEL', 'SBIN0003617', 999888888888, '2024-11-05 04:36:50', 'Admin', '0000-00-00 00:00:00', ''),
(16, '88', '', '', '', 0, '2024-11-05 05:16:34', 'Admin', '0000-00-00 00:00:00', ''),
(17, '89', '', '', '', 0, '2024-11-05 06:22:09', 'Admin', '0000-00-00 00:00:00', ''),
(18, '90', '', '', '', 0, '2024-11-05 06:43:43', 'Admin', '0000-00-00 00:00:00', ''),
(19, '91', '', '', '', 0, '2024-11-04 21:06:06', 'Admin', '0000-00-00 00:00:00', '');

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
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `aadhar` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `deliveryboy`
--

INSERT INTO `deliveryboy` (`id`, `name`, `phoneNo`, `email`, `password`, `workingAddress`, `regidenceAddress`, `workingPincode`, `status`, `aadhar`, `pan`, `image`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(75, 'RAHUL KUMAR PATEL', 9999999999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR MADHUPUR MARKET', 'MADARDEEH MUNGRA BADSHAPUR', 222201, 0, '8888888888', 'ABCDEDB888', '../img/delivery/', '2024-11-05 10:06:50', '0000-00-00 00:00:00', 'Admin', ''),
(88, 'RAJESH', 999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR', 'JAUNPUR BADSHAHPUR', 2222209, 0, '6666666', '66666666', '../img/delivery/', '2024-11-05 10:46:34', '0000-00-00 00:00:00', 'Admin', ''),
(89, 'RAJESH KUMAR', 5555555, 'GGG2@GMAIL.COM', '1879', 'KKKKKK', 'KKKKK', 22222, 0, '88888', 'KKKK', '../img/delivery/', '2024-11-05 11:52:09', '0000-00-00 00:00:00', 'Admin', ''),
(90, 'RAKESH', 55555, 'ABC@GMAIL.COM', '6723', 'RAJESH', 'JJJJ', 0, 0, 'KKKK', 'KKKK', '../img/delivery/', '2024-11-05 12:13:43', '0000-00-00 00:00:00', 'Admin', ''),
(91, 'DELIVERY BOY', 1233211233, 'NEW@GMAIL.COM', '5153', 'JAUNAPUR', 'JAUNPUR BADSHAHPUR', 2222202, 0, '1236547899888', '555', '../img/delivery/', '2024-11-05 02:36:06', '0000-00-00 00:00:00', 'Admin', '');

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
  `createdOn` timestamp NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `updateOn` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `deliveryincome`
--

INSERT INTO `deliveryincome` (`id`, `deliveryId`, `sellarId`, `orderId`, `amount`, `commission`, `otherCommision`, `fuelCharges`, `tipAmount`, `createdOn`, `updatedBy`, `updateOn`, `createdBy`) VALUES
(10, '89', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 06:22:09', '', '', 'Admin'),
(11, '90', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 06:43:43', '', '', 'Admin'),
(12, '91', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-04 21:06:06', '', '', 'Admin'),
(9, '88', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 05:16:34', '', '', 'Admin'),
(8, '75', '', '', 0.00, 0.00, 0.00, 0.00, 0.00, '2024-11-05 04:36:50', '', '', 'Admin');

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
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
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
  `sellarId` varchar(255) NOT NULL,
  `deliveryId` varchar(255) NOT NULL,
  `paymentId` varchar(255) NOT NULL,
  `total` double(100,2) NOT NULL,
  `adminCommision` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE IF NOT EXISTS `orderitem` (
`id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `productSkuId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `price` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `sgst` float(10,2) NOT NULL,
  `cgst` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `createdOn` timestamp NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL,
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
  `createdOn` timestamp NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `popularityhistory`
--

CREATE TABLE IF NOT EXISTS `popularityhistory` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updateOn` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productattributes`
--

CREATE TABLE IF NOT EXISTS `productattributes` (
`id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
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
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sellarId`, `name`, `description`, `image`, `mainImage`, `skuId`, `trending`, `arrival`, `bestselling`, `popular`, `price`, `discount`, `status`, `shippingCharge`, `rating`, `categoriesId`, `subcategaryId`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(161, '18', 'PRODUCT1', 'FECYVTYVRYR7GUT 7T7ETRG', '', '', 'SKUID232', '', '', '', '', 200, 5.00, 0, 0, '', '111', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(163, '96', 'PRODUCT 3', 'FDHFIDNFEF', '', '', '555555FH', '', '', '', '', 500, 54.00, 0, 0, '', '112', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(164, '4678', 'PRODUCT 4', 'FIOENGERYG VGRYT', '', '', '555555FH1', '', '', '', '', 501, 53.00, 0, 0, '', '112', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(165, '58645', 'PRODUCT 5', 'FHCRVR', '', '', '30019', '', '', '', '', 30, 55.00, 0, 20, '', '112', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

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
  `createdOn` timestamp NOT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `productskuid`
--

INSERT INTO `productskuid` (`id`, `productId`, `sizeAttributeId`, `colorAttributeId`, `skuId`, `price`, `quantity`, `createdOn`, `UpdatedOn`, `createdBy`, `updatedBy`) VALUES
(45, '165', '66', 'red', '30019', 30.00, 43, '2024-11-07 00:23:15', NULL, 'Admin', NULL),
(44, '163', '8', 'color3', '555555FH1', 501.00, 11, '2024-11-07 00:20:01', NULL, 'Admin', NULL),
(42, '164', '6', 'color', '555555FH', 5000.00, 13, '2024-11-07 00:14:51', NULL, 'Admin', NULL),
(41, '161', '12', 'black', 'SKUID232', 200.00, 50, '2024-11-07 00:10:35', NULL, 'Admin', NULL),
(40, '162', '2', 'white', 'SKUID22222', 600.00, 12, '2024-11-04 21:03:17', NULL, 'Admin', NULL);

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
  `createdBy` timestamp NOT NULL,
  `createdOn` timestamp NOT NULL,
  `updatedOn` timestamp NOT NULL,
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
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `sellar`
--

INSERT INTO `sellar` (`id`, `sellarName`, `counterName`, `pan`, `gst`, `aadhar`, `image`, `phoneNo`, `regFee`, `depositAmount`, `password`, `email`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(98, 'ABI', 'AKKKA', '555', 'GST', '5555', '', 8888, 50.00, 500.00, '29525', 'GIPLANAND@GMAIL.COM', 1, '2024-05-11 11:28:12', '0000-00-00 00:00:00', 'Admin', ''),
(99, 'RAJESH', 'ANAND', '999', '', 'JJJJ', '', 9999, 50.00, 500.00, '7928', '9999', 1, '2024-05-11 12:14:26', '0000-00-00 00:00:00', 'Admin', ''),
(75, 'AMITABH', 'KESHAV', '55A5A5A5A5', '888hhhhhhh', '5588555522222', '', 888888888888, 50.00, 500.00, '28605', 'hhhhhhhhhhhhhh@GMAIL.COM', 1, '2024-05-11 02:38:15', '2024-11-05 04:41:38', 'Admin', 'Admin'),
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
  `createdOn` timestamp NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `sellaraddress`
--

INSERT INTO `sellaraddress` (`id`, `sellarId`, `address`, `city`, `pincode`, `customerCareNo`, `feedback`, `teamMembers`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(40, '75', 'ADDRESS', 'JAUNPUR', 222202, NULL, NULL, NULL, 'Admin', '2024-11-04 21:08:16', 'Admin', '2024-11-05 04:09:15'),
(39, '99', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 06:44:31', '', '0000-00-00 00:00:00'),
(38, '98', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:58:16', '', '0000-00-00 00:00:00'),
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `sellarbankdetails`
--

INSERT INTO `sellarbankdetails` (`id`, `sellarId`, `bankName`, `AccountHolderName`, `ifscCode`, `upiId`, `accountNo`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(37, '75', 'sksksksk', NULL, 'kkkk', '555', 5555555, 'Admin', '2024-11-04 21:08:16', 'Admin', '2024-11-04 22:36:04'),
(36, '99', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 06:44:31', NULL, NULL),
(35, '98', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:58:16', NULL, NULL),
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `parentId`, `name`, `description`, `subcategoriesImage`, `createdOn`, `createdBy`, `updatedBy`, `updatedOn`) VALUES
(70, '111', 'CENT', 'KKKK', '69', '2024-11-05 12:26:21', '', '', '2024-11-05 12:26:21'),
(69, '111', 'AGARBATTI', 'BEST FLEWAR', '65', '2024-11-05 12:24:11', '', '', '2024-11-05 12:24:11'),
(71, '111', 'SONA', 'BEST QUALITY', '70', '2024-11-05 01:39:17', '', '', '2024-11-05 01:39:17');

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
  `createdOn` timestamp NOT NULL,
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
  `updatedOn` timestamp NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userId`, `name`, `userName`, `email`, `password`, `dateOfBirth`, `phoneNo`, `status`, `lastLogin`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(6, '', 'ANAND', '', 'giplanand@gmail.comhh', '123', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
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
  `createdOn` timestamp NOT NULL,
  `updateOn` timestamp NOT NULL
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
 ADD PRIMARY KEY (`id`);

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
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
 ADD PRIMARY KEY (`id`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `commision`
--
ALTER TABLE `commision`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deliverybankdetails`
--
ALTER TABLE `deliverybankdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `deliveryincome`
--
ALTER TABLE `deliveryincome`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `productskuid`
--
ALTER TABLE `productskuid`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `refunddetails`
--
ALTER TABLE `refunddetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sellar`
--
ALTER TABLE `sellar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `sellaraddress`
--
ALTER TABLE `sellaraddress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `sellarbankdetails`
--
ALTER TABLE `sellarbankdetails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
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
