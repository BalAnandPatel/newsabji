-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 05:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegitabledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `addressLine1` varchar(255) NOT NULL,
  `addressLine2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `postalCode` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `userId`, `isDefault`, `name`, `mobile`, `addressLine1`, `addressLine2`, `city`, `state`, `landmark`, `postalCode`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(3, 'giplanand@gmail.com', 1, '', '', 'JAUNPUR', 'MUNGRA BADSHAPUR', 'JAUNPUR', '', 'NH31', 22202, '2024-11-18 20:40:03', '0000-00-00 00:00:00', 'Admin', ''),
(4, 'giplanand@gmail.coms', 0, '', '', 'Mumn', 'hj', '', '', '', 0, '2024-11-20 23:26:39', '0000-00-00 00:00:00', 'Admin', ''),
(5, 'giplanand@gmail.com', 0, 'ANAND', '1', '1', '1', '1', 'Uttar Pradesh', '1', 1, '2024-11-25 18:01:16', NULL, 'ANAND', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(100,2) DEFAULT NULL,
  `total` float(100,2) NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoriesImage` varchar(255) NOT NULL,
  `commision` float(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `categoriesImage`, `commision`, `description`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(128, 'Vegetables', '128', 10.00, 'BEST QUALITY PRODUCTE', 1, '2024-11-11 03:03:45', '2024-11-11 03:09:30', 'Admin', ''),
(129, 'Fruits', '129', 5.00, 'Fruits', 1, '2024-11-11 03:06:55', '0000-00-00 00:00:00', 'Admin', ''),
(130, 'Havan Samagri', '', 2.00, 'Havan Samagri', 1, '2024-11-25 05:44:05', '2024-11-25 05:44:05', '', ''),
(131, 'Building Material', '', 7.00, 'Building Material', 1, '2024-11-25 05:44:05', '2024-11-25 05:44:05', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `commision`
--

CREATE TABLE `commision` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissionhistory`
--

CREATE TABLE `commissionhistory` (
  `id` int(11) NOT NULL DEFAULT 0,
  `categoriesId` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverybankdetails`
--

CREATE TABLE `deliverybankdetails` (
  `id` int(11) NOT NULL,
  `deliveryId` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `accountHolderName` varchar(255) NOT NULL,
  `ifscCode` varchar(255) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE `deliveryboy` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNo` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `workingAddress` varchar(255) NOT NULL,
  `regidenceAddress` varchar(255) NOT NULL,
  `workingPincode` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `aadhar` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deliveryboy`
--

INSERT INTO `deliveryboy` (`id`, `name`, `phoneNo`, `email`, `password`, `workingAddress`, `regidenceAddress`, `workingPincode`, `status`, `aadhar`, `pan`, `image`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(75, 'RAHUL KUMAR PATEL', 9999999999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR MADHUPUR MARKET', 'MADARDEEH MUNGRA BADSHAPUR', 222201, 0, '8888888888', 'ABCDEDB888', '../img/delivery/', '2024-11-05 10:06:50', '0000-00-00 00:00:00', 'Admin', ''),
(88, 'RAJESH', 999999, 'GIPLANAND@GMAIL.COM', '0', 'JAUNPUR', 'JAUNPUR BADSHAHPUR', 2222209, 0, '6666666', '66666666', '../img/delivery/', '2024-11-05 10:46:34', '0000-00-00 00:00:00', 'Admin', ''),
(89, 'RAJESH KUMAR', 5555555, 'GGG2@GMAIL.COM', '123', 'KKKKKK', 'KKKKK', 22222, 0, '88888', 'KKKK', '../img/delivery/', '2024-11-05 11:52:09', '0000-00-00 00:00:00', 'Admin', ''),
(90, 'RAKESH', 55555, 'ABC@GMAIL.COM', '6723', 'RAJESH', 'JJJJ', 0, 0, 'KKKK', 'KKKK', '../img/delivery/', '2024-11-05 12:13:43', '0000-00-00 00:00:00', 'Admin', ''),
(91, 'DELIVERY BOY', 1233211233, 'NEW@GMAIL.COM', '5153', 'JAUNAPUR', 'JAUNPUR BADSHAHPUR', 2222202, 0, '1236547899888', '555', '../img/delivery/', '2024-11-05 02:36:06', '0000-00-00 00:00:00', 'Admin', ''),
(92, 'RAJESH YADAV', 55555, '55SSLD@GMAL..COM', '1328', '55555', '5555', 55, 0, '55', '5555', '../img/delivery/', '2024-11-11 11:18:55', '0000-00-00 00:00:00', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryincome`
--

CREATE TABLE `deliveryincome` (
  `id` int(11) NOT NULL,
  `deliveryId` varchar(255) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `commission` float(10,2) NOT NULL,
  `otherCommision` float(10,2) NOT NULL,
  `fuelCharges` float(10,2) NOT NULL,
  `tipAmount` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` varchar(255) NOT NULL,
  `updateOn` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `offerId` varchar(255) NOT NULL,
  `offerAmount` float(10,2) NOT NULL,
  `offerName` varchar(255) NOT NULL,
  `offerDuration` varchar(255) NOT NULL,
  `offerCode` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `sellerId` varchar(255) NOT NULL,
  `deliveryId` varchar(255) DEFAULT NULL,
  `paymentId` varchar(255) NOT NULL,
  `paymentResponse` varchar(100) NOT NULL DEFAULT 'PAID',
  `total` double(100,2) NOT NULL,
  `adminCommision` float(10,2) NOT NULL,
  `deliveryAddress` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NULL DEFAULT current_timestamp(),
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `userId`, `orderId`, `sellerId`, `deliveryId`, `paymentId`, `paymentResponse`, `total`, `adminCommision`, `deliveryAddress`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(222, 'giplanand@gmail.com', 'ORD_17325632861836', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:34:46', '2024-11-25 19:34:46', 'giplanand@gmail.com', NULL),
(223, 'giplanand@gmail.com', 'ORD_17325636469579', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:40:46', '2024-11-25 19:40:46', 'giplanand@gmail.com', NULL),
(224, 'giplanand@gmail.com', 'ORD_17325636989019', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:41:38', '2024-11-25 19:41:38', 'giplanand@gmail.com', NULL),
(225, 'giplanand@gmail.com', 'ORD_17325637716821', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:42:51', '2024-11-25 19:42:51', 'giplanand@gmail.com', NULL),
(226, 'giplanand@gmail.com', 'ORD_17325637896455', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:43:09', '2024-11-25 19:43:09', 'giplanand@gmail.com', NULL),
(227, 'giplanand@gmail.com', 'ORD_17325639607766', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:46:00', '2024-11-25 19:46:00', 'giplanand@gmail.com', NULL),
(228, 'giplanand@gmail.com', 'ORD_17325640076605', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:46:47', '2024-11-25 19:46:47', 'giplanand@gmail.com', NULL),
(229, 'giplanand@gmail.com', 'ORD_17325640525552', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:47:32', '2024-11-25 19:47:32', 'giplanand@gmail.com', NULL),
(230, 'giplanand@gmail.com', 'ORD_17325640885181', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '3', '2024-11-25 19:48:08', '2024-11-25 19:48:08', 'giplanand@gmail.com', NULL),
(231, 'giplanand@gmail.com', 'ORD_17325640971799', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '', '2024-11-25 19:48:17', '2024-11-25 19:48:17', 'giplanand@gmail.com', NULL),
(232, 'giplanand@gmail.com', 'ORD_17325644638154', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '3', '2024-11-25 19:54:23', '2024-11-25 19:54:23', 'giplanand@gmail.com', NULL),
(233, 'giplanand@gmail.com', 'ORD_17325644929663', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '3', '2024-11-25 19:54:52', '2024-11-25 19:54:52', 'giplanand@gmail.com', NULL),
(234, 'giplanand@gmail.com', 'ORD_17325645227693', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '3', '2024-11-25 19:55:22', '2024-11-25 19:55:22', 'giplanand@gmail.com', NULL),
(235, 'giplanand@gmail.com', 'ORD_17325645292984', '', NULL, 'GLINTEL', 'PAID', 60.00, 0.00, '3', '2024-11-25 19:55:29', '2024-11-25 19:55:29', 'giplanand@gmail.com', NULL),
(236, 'giplanand@gmail.com', 'ORD_17325647229972', '', NULL, 'GLINTEL', 'order_PPf4lumvvLl5u2', 60.00, 0.00, '3', '2024-11-25 19:58:43', '2024-11-25 19:58:42', 'giplanand@gmail.com', NULL),
(237, 'giplanand@gmail.com', 'ORD_17325962948448', '', NULL, 'GLINTEL', 'order_PPo2dp9D366ONJ', 60.00, 0.00, '3', '2024-11-26 04:44:56', '2024-11-26 04:44:54', 'giplanand@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `userId` varchar(999) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `productSkuId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `price` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `sgst` float(10,2) NOT NULL,
  `cgst` float(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `userId`, `orderId`, `productId`, `productSkuId`, `quantity`, `discount`, `price`, `total`, `sgst`, `cgst`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(111, 'giplanand@gmail.com', 'ORD_17325637716821', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:42:51', NULL, 'giplanand@gmail.com', NULL),
(110, 'giplanand@gmail.com', 'ORD_17325637716821', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:42:51', NULL, 'giplanand@gmail.com', NULL),
(109, 'giplanand@gmail.com', 'ORD_17325636989019', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:41:38', NULL, 'giplanand@gmail.com', NULL),
(108, 'giplanand@gmail.com', 'ORD_17325636989019', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:41:38', NULL, 'giplanand@gmail.com', NULL),
(107, 'giplanand@gmail.com', 'ORD_17325636469579', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:40:46', NULL, 'giplanand@gmail.com', NULL),
(106, 'giplanand@gmail.com', 'ORD_17325636469579', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:40:46', NULL, 'giplanand@gmail.com', NULL),
(105, 'giplanand@gmail.com', 'ORD_17325632861836', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:34:46', NULL, 'giplanand@gmail.com', NULL),
(104, 'giplanand@gmail.com', 'ORD_17325632861836', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:34:46', NULL, 'giplanand@gmail.com', NULL),
(103, 'giplanand@gmail.com', 'ORD_17325631995823', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:33:19', NULL, 'giplanand@gmail.com', NULL),
(102, 'giplanand@gmail.com', 'ORD_17325631995823', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:33:19', NULL, 'giplanand@gmail.com', NULL),
(112, 'giplanand@gmail.com', 'ORD_17325637896455', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:43:09', NULL, 'giplanand@gmail.com', NULL),
(113, 'giplanand@gmail.com', 'ORD_17325637896455', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:43:09', NULL, 'giplanand@gmail.com', NULL),
(114, 'giplanand@gmail.com', 'ORD_17325639607766', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:46:00', NULL, 'giplanand@gmail.com', NULL),
(115, 'giplanand@gmail.com', 'ORD_17325639607766', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:46:00', NULL, 'giplanand@gmail.com', NULL),
(116, 'giplanand@gmail.com', 'ORD_17325640076605', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:46:47', NULL, 'giplanand@gmail.com', NULL),
(117, 'giplanand@gmail.com', 'ORD_17325640076605', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:46:47', NULL, 'giplanand@gmail.com', NULL),
(118, 'giplanand@gmail.com', 'ORD_17325640525552', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:47:32', NULL, 'giplanand@gmail.com', NULL),
(119, 'giplanand@gmail.com', 'ORD_17325640525552', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:47:32', NULL, 'giplanand@gmail.com', NULL),
(120, 'giplanand@gmail.com', 'ORD_17325640885181', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:48:08', NULL, 'giplanand@gmail.com', NULL),
(121, 'giplanand@gmail.com', 'ORD_17325640885181', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:48:08', NULL, 'giplanand@gmail.com', NULL),
(122, 'giplanand@gmail.com', 'ORD_17325640971799', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:48:17', NULL, 'giplanand@gmail.com', NULL),
(123, 'giplanand@gmail.com', 'ORD_17325640971799', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:48:17', NULL, 'giplanand@gmail.com', NULL),
(124, 'giplanand@gmail.com', 'ORD_17325644638154', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:54:23', NULL, 'giplanand@gmail.com', NULL),
(125, 'giplanand@gmail.com', 'ORD_17325644638154', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:54:23', NULL, 'giplanand@gmail.com', NULL),
(126, 'giplanand@gmail.com', 'ORD_17325644929663', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:54:52', NULL, 'giplanand@gmail.com', NULL),
(127, 'giplanand@gmail.com', 'ORD_17325644929663', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:54:52', NULL, 'giplanand@gmail.com', NULL),
(128, 'giplanand@gmail.com', 'ORD_17325645227693', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:55:22', NULL, 'giplanand@gmail.com', NULL),
(129, 'giplanand@gmail.com', 'ORD_17325645227693', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:55:22', NULL, 'giplanand@gmail.com', NULL),
(130, 'giplanand@gmail.com', 'ORD_17325645292984', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:55:29', NULL, 'giplanand@gmail.com', NULL),
(131, 'giplanand@gmail.com', 'ORD_17325645292984', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:55:29', NULL, 'giplanand@gmail.com', NULL),
(132, 'giplanand@gmail.com', 'ORD_17325647229972', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-25 19:58:42', NULL, 'giplanand@gmail.com', NULL),
(133, 'giplanand@gmail.com', 'ORD_17325647229972', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-25 19:58:42', NULL, 'giplanand@gmail.com', NULL),
(134, 'giplanand@gmail.com', 'ORD_17325962948448', '209', ' 16108', 2, 1.00, 5.00, 10.00, 0.20, 0.20, '2024-11-26 04:44:54', NULL, 'giplanand@gmail.com', NULL),
(135, 'giplanand@gmail.com', 'ORD_17325962948448', '202', ' 58199', 1, 5.00, 50.00, 60.00, 1.20, 1.20, '2024-11-26 04:44:54', NULL, 'giplanand@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paymentdetails`
--

CREATE TABLE `paymentdetails` (
  `id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `refundId` varchar(255) DEFAULT NULL,
  `paymentMode` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popularity`
--

CREATE TABLE `popularity` (
  `id` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popularityhistory`
--

CREATE TABLE `popularityhistory` (
  `id` int(11) NOT NULL DEFAULT 0,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updateOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productattributes`
--

CREATE TABLE `productattributes` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `skuId` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producthistory`
--

CREATE TABLE `producthistory` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `sizeAttributeId` varchar(255) NOT NULL,
  `colorAttributeId` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sellerId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `mainImage` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `trending` varchar(255) NOT NULL,
  `arrival` varchar(255) NOT NULL,
  `categoriesId` varchar(255) NOT NULL,
  `subCategoryId` varchar(255) NOT NULL,
  `bestselling` varchar(255) NOT NULL,
  `popular` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `shippingCharge` float NOT NULL,
  `rating` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sellerId`, `name`, `description`, `image`, `mainImage`, `skuId`, `trending`, `arrival`, `categoriesId`, `subCategoryId`, `bestselling`, `popular`, `price`, `discount`, `status`, `shippingCharge`, `rating`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(210, '103', 'Palak', 'HHHHHHHHHHH', '', '', '16108', '', '', '128', '70', '', '', 5, 1.00, 0, 20, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(202, '102', 'Mango', 'sds', '', '', '58199', '', '', '129', '75', '', '', 50, 5.00, 0, 20, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(209, '103', 'Apple', 'HHHHHHHHHHH', '', '', '16108', '', '', '129', '75', '', '', 5, 1.00, 0, 20, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `productskuid`
--

CREATE TABLE `productskuid` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `sizeAttributeId` varchar(255) NOT NULL,
  `colorAttributeId` varchar(255) NOT NULL,
  `skuId` varchar(255) NOT NULL,
  `price` float(100,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE `refunddetails` (
  `id` int(11) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `totalAmount` float(10,2) NOT NULL,
  `createdBy` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellaraddress`
--

CREATE TABLE `sellaraddress` (
  `id` int(11) NOT NULL,
  `sellarId` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `customerCareNo` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `teamMembers` varchar(11) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sellaraddress`
--

INSERT INTO `sellaraddress` (`id`, `sellarId`, `address`, `city`, `pincode`, `customerCareNo`, `feedback`, `teamMembers`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(44, '104', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:23:35', '', '0000-00-00 00:00:00'),
(42, '102', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:10:29', '', '0000-00-00 00:00:00'),
(40, '75', 'ADDRESS', 'JAUNPUR', 222202, NULL, NULL, NULL, 'Admin', '2024-11-04 21:08:16', 'Admin', '2024-11-05 04:09:15'),
(43, '103', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:20:40', '', '0000-00-00 00:00:00'),
(36, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:43:40', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sellarbankdetails`
--

CREATE TABLE `sellarbankdetails` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sellarbankdetails`
--

INSERT INTO `sellarbankdetails` (`id`, `sellarId`, `bankName`, `AccountHolderName`, `ifscCode`, `upiId`, `accountNo`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES
(39, '102', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:10:29', NULL, NULL),
(37, '75', 'sksksksk', NULL, 'kkkk', '555', 5555555, 'Admin', '2024-11-04 21:08:16', 'Admin', '2024-11-04 22:36:04'),
(41, '104', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-08 23:23:35', NULL, NULL),
(40, '103', 'ssds', NULL, '5s5sa5d', '55s5d5', 5555, 'Admin', '2024-11-08 23:20:40', 'Admin', '2024-11-09 05:58:43'),
(33, '', NULL, NULL, NULL, NULL, NULL, 'Admin', '2024-11-05 05:43:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `sellerName` varchar(255) NOT NULL,
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
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `sellerName`, `counterName`, `pan`, `gst`, `aadhar`, `image`, `phoneNo`, `regFee`, `depositAmount`, `password`, `email`, `status`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(102, 'ANAND', 'SSSSS', 'KK', 'KKKK', 'KK', '', 999999, 50.00, 500.00, '6980', 'KKK', 1, '2024-09-11 04:40:28', '0000-00-00 00:00:00', 'Admin', ''),
(103, 'RAKESH', 'SABJI SHOP', 'ABDKKII44', '5255DD55', '889955665544', '', 55555555, 50.00, 500.00, '123', 'GIPLANAND@GMAIL.COM', 1, '2024-09-11 04:50:38', '0000-00-00 00:00:00', 'Admin', ''),
(104, 'DEENA NATH', 'MUNGRA SABJI BANDARA', 'ABDC', 'GSTNO', '5555', '', 888555, 50.00, 500.00, '1069', 'GIPLANAND@GMAIL.COM', 1, '2024-09-11 04:53:29', '0000-00-00 00:00:00', 'Admin', ''),
(75, 'AMITABH', 'KESHAV', '55A5A5A5A5', '888hhhhhhh', '5588555522222', '', 888888888888, 50.00, 500.00, '28605', 'hhhhhhhhhhhhhh@GMAIL.COM', 1, '2024-05-11 02:38:15', '2024-11-05 04:41:38', 'Admin', 'Admin'),
(101, 'RAKESH', 'GOLA SABJI MARKET', 'AKKKBK55', '555D5D5D5', '55555', '', 999999, 50.00, 500.00, '21591', 'ABC@GMAIL.COM', 1, '2024-09-11 04:38:53', '0000-00-00 00:00:00', 'Admin', ''),
(69, 'AMAN', 'AMAMM', 'GGHHFF', 'GST', '55558', '', 99999, 50.00, 500.00, '11788', 'KDKDK@GMAIL.COM', 1, '2024-05-11 11:13:31', '0000-00-00 00:00:00', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `parentId` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `subcategoriesImage` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `createdOn` datetime NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `parentId`, `name`, `description`, `subcategoriesImage`, `status`, `createdOn`, `createdBy`, `updatedBy`, `updatedOn`) VALUES
(70, '128', 'Green Vegitable', 'KKKK', '69', 1, '2024-11-05 12:26:21', '', '', '2024-11-05 12:26:21'),
(69, '128', 'Dry Vegitables', 'BEST FLEWAR', '65', 1, '2024-11-05 12:24:11', '', '', '2024-11-05 12:24:11'),
(71, '128', 'Seasonal ', 'BEST QUALITY', '70', 1, '2024-11-05 01:39:17', '', '', '2024-11-05 01:39:17'),
(72, '129', 'Seasonal', 'JJKKJJ', '71', 1, '2024-11-11 03:16:11', '', '', '0000-00-00 00:00:00'),
(75, '129', 'Dry', '', '', 1, '2024-11-25 05:49:29', '', '', '2024-11-25 05:49:29'),
(76, '130', 'Imported', '', '', 1, '2024-11-25 05:49:29', '', '', '2024-11-25 05:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `useracountdetails`
--

CREATE TABLE `useracountdetails` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `AccountHolderName` varchar(255) NOT NULL,
  `ifscCode` varchar(255) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
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
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` varchar(255) NOT NULL,
  `updatedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userId`, `name`, `userName`, `email`, `password`, `dateOfBirth`, `phoneNo`, `status`, `lastLogin`, `createdOn`, `updatedOn`, `createdBy`, `updatedBy`) VALUES
(6, '', 'ANAND', '', 'giplanand@gmail.com', '123', '0000-00-00', 0, 0, '', '0000-00-00 00:00:00', '2024-11-15 08:32:02', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updateOn` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `productId`, `userId`, `createdOn`, `updateOn`) VALUES
(2, 'yu', '33', '2024-11-24 18:30:00', NULL),
(3, '1', '2', '2024-11-25 04:34:37', NULL),
(4, '1', '2', '2024-11-25 04:36:50', NULL),
(5, '1', '2', '2024-11-25 04:37:04', NULL),
(6, '1', '2', '2024-11-25 04:37:16', NULL),
(7, '1', '2', '2024-11-25 05:13:33', NULL),
(8, '1', '2', '2024-11-25 05:15:25', NULL),
(9, '1', '2', '2024-11-25 05:16:34', NULL),
(10, '1', '2', '2024-11-25 05:16:37', NULL),
(11, '1', '2', '2024-11-25 05:16:53', NULL),
(12, '1', '2', '2024-11-25 05:17:43', NULL),
(13, '1', '2', '2024-11-25 05:20:45', NULL),
(14, '1', '2', '2024-11-25 05:21:23', NULL),
(15, '1', '2', '2024-11-25 05:21:27', NULL),
(16, '1', '2', '2024-11-25 05:23:14', NULL),
(17, '1', '2', '2024-11-25 05:27:39', NULL),
(18, '1', '2', '2024-11-25 05:27:55', NULL),
(19, '1', '2', '2024-11-25 05:29:46', NULL),
(20, '1', '2', '2024-11-25 05:30:31', NULL),
(21, '1', '2', '2024-11-25 05:30:44', NULL),
(22, '1', '2', '2024-11-25 05:31:05', NULL),
(23, '1', '2', '2024-11-25 05:31:41', NULL),
(24, '1', '2', '2024-11-25 05:32:25', NULL),
(25, '1', '2', '2024-11-25 05:32:29', NULL),
(26, '1', '2', '2024-11-25 05:32:55', NULL),
(27, '1', '2', '2024-11-25 05:35:03', NULL),
(28, '1', '2', '2024-11-25 05:35:43', NULL),
(29, '1', '2', '2024-11-25 05:36:07', NULL),
(30, '1', '2', '2024-11-25 05:37:34', NULL),
(31, '1', '2', '2024-11-25 05:38:53', NULL),
(32, '1', '2', '2024-11-25 05:39:36', NULL),
(33, '1', '2', '2024-11-25 05:39:48', NULL),
(34, '1', '2', '2024-11-25 05:40:09', NULL),
(35, '1', '2', '2024-11-25 05:40:19', NULL),
(36, '1', '2', '2024-11-25 05:40:28', NULL),
(37, '1', '2', '2024-11-25 05:40:58', NULL),
(38, '1', '2', '2024-11-25 05:41:53', NULL),
(39, '1', '2', '2024-11-25 05:42:56', NULL),
(40, '1', '2', '2024-11-25 05:43:14', NULL),
(41, '1', '2', '2024-11-25 05:43:34', NULL),
(42, '1', '2', '2024-11-25 05:43:53', NULL),
(43, '1', '2', '2024-11-25 05:44:21', NULL),
(44, '1', '2', '2024-11-25 05:46:35', NULL),
(45, '1', '2', '2024-11-25 05:46:59', NULL),
(46, '1', '2', '2024-11-25 05:47:52', NULL),
(47, '1', '2', '2024-11-25 05:48:15', NULL),
(48, '1', '2', '2024-11-25 05:49:00', NULL),
(49, '1', '2', '2024-11-25 05:49:09', NULL),
(50, '1', '2', '2024-11-25 05:50:05', NULL),
(51, '1', '2', '2024-11-25 05:50:14', NULL),
(52, '1', '2', '2024-11-25 05:51:46', NULL),
(53, '1', '2', '2024-11-25 05:52:22', NULL),
(54, '1', '2', '2024-11-25 05:55:12', NULL),
(55, '1', '2', '2024-11-25 05:57:18', NULL),
(56, '1', '2', '2024-11-25 05:58:05', NULL),
(57, '1', '2', '2024-11-25 06:01:00', NULL),
(58, '1', '2', '2024-11-25 06:01:10', NULL),
(59, '1', '2', '2024-11-25 06:01:30', NULL),
(60, '1', '2', '2024-11-25 06:02:28', NULL),
(61, '1', '2', '2024-11-25 06:02:51', NULL),
(62, '1', '2', '2024-11-25 06:03:29', NULL),
(63, '1', '2', '2024-11-25 06:03:42', NULL),
(64, '1', '2', '2024-11-25 06:05:07', NULL),
(65, '1', '2', '2024-11-25 06:05:36', NULL),
(66, '1', '2', '2024-11-25 06:07:56', NULL),
(67, '1', '2', '2024-11-25 06:08:29', NULL),
(68, '1', '2', '2024-11-25 06:09:02', NULL),
(69, '1', '2', '2024-11-25 06:10:06', NULL),
(70, '1', '2', '2024-11-25 06:15:00', NULL),
(71, '1', '2', '2024-11-25 06:15:39', NULL),
(72, '1', '2', '2024-11-25 06:16:07', NULL),
(73, '1', '2', '2024-11-25 06:16:27', NULL),
(74, '1', '2', '2024-11-25 06:16:52', NULL),
(75, '1', '2', '2024-11-25 06:17:07', NULL),
(76, '1', '2', '2024-11-25 06:17:18', NULL),
(77, '1', '2', '2024-11-25 06:18:05', NULL),
(78, '1', '2', '2024-11-25 06:18:22', NULL),
(79, '1', '2', '2024-11-25 06:18:55', NULL),
(80, '1', '2', '2024-11-25 06:20:29', NULL),
(81, '1', '2', '2024-11-25 06:20:47', NULL),
(82, '1', '2', '2024-11-25 06:26:03', NULL),
(83, '1', '2', '2024-11-25 06:31:41', NULL),
(84, '1', '2', '2024-11-25 06:34:27', NULL),
(85, '1', '2', '2024-11-25 06:34:55', NULL),
(86, '1', '2', '2024-11-25 06:35:12', NULL),
(87, '1', '2', '2024-11-25 06:35:40', NULL),
(88, '1', '2', '2024-11-25 06:36:34', NULL),
(89, '1', '2', '2024-11-25 06:48:28', NULL),
(90, '1', '2', '2024-11-25 06:48:48', NULL),
(91, '1', '2', '2024-11-25 06:49:08', NULL),
(92, '1', '2', '2024-11-25 06:49:35', NULL),
(93, '1', '2', '2024-11-25 06:50:14', NULL),
(94, '1', '2', '2024-11-25 06:50:55', NULL),
(95, '1', '2', '2024-11-25 06:51:08', NULL),
(96, '1', '2', '2024-11-25 06:51:35', NULL),
(97, '1', '2', '2024-11-25 06:52:07', NULL),
(98, '1', '2', '2024-11-25 06:52:26', NULL),
(99, '1', '2', '2024-11-25 06:54:07', NULL),
(100, '1', '2', '2024-11-25 14:34:07', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`,`productId`);

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
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`parentId`);

--
-- Indexes for table `useracountdetails`
--
ALTER TABLE `useracountdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12236;

--
-- AUTO_INCREMENT for table `commision`
--
ALTER TABLE `commision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverybankdetails`
--
ALTER TABLE `deliverybankdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `deliveryincome`
--
ALTER TABLE `deliveryincome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `productskuid`
--
ALTER TABLE `productskuid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `refunddetails`
--
ALTER TABLE `refunddetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellaraddress`
--
ALTER TABLE `sellaraddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `sellarbankdetails`
--
ALTER TABLE `sellarbankdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `useracountdetails`
--
ALTER TABLE `useracountdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
