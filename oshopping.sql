-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2021 at 02:59 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(8) NOT NULL,
  `fk_user_id` int(7) NOT NULL,
  `fk_product_id` int(9) NOT NULL,
  `quantity` int(255) NOT NULL,
  `total_price` double NOT NULL,
  `activity_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `fk_user_id`, `fk_product_id`, `quantity`, `total_price`, `activity_type`) VALUES
(1, 1, 1, 2, 1000, 'buy'),
(2, 1, 18, 1, 222, 'buy'),
(3, 1, 20, 1, 30000, 'sell'),
(4, 1, 22, 1, 230, 'buy'),
(5, 1, 22, 1, 22, 'buy'),
(6, 1, 22, 1, 230, 'buy'),
(7, 1, 9, 1, 300, 'buy'),
(8, 2, 1, 1, 40, 'buy'),
(9, 2, 20, 1, 100, 'buy'),
(10, 35, 15, 1, 900, 'buy'),
(11, 37, 22, 1, 22, 'buy'),
(12, 37, 22, 1, 22, 'buy'),
(13, 37, 22, 1, 22, 'buy'),
(14, 1, 9, 1, 300, 'buy'),
(15, 2, 9, 1, 300, 'buy');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(9) NOT NULL,
  `fk_product_id` int(8) NOT NULL,
  `fk_user_id` int(7) NOT NULL,
  `cart_statuse` int(1) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `yrial_price` float NOT NULL,
  `dollar_price` float NOT NULL,
  `vendor_id` int(7) NOT NULL,
  `cat_id` int(4) NOT NULL,
  `product_details` text DEFAULT NULL,
  `product_img` text DEFAULT NULL,
  `product_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_quantity` int(5) NOT NULL,
  `product_discount` int(3) DEFAULT NULL,
  `color` text DEFAULT 'black'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `fk_product_id`, `fk_user_id`, `cart_statuse`, `product_name`, `yrial_price`, `dollar_price`, `vendor_id`, `cat_id`, `product_details`, `product_img`, `product_date`, `product_quantity`, `product_discount`, `color`) VALUES
(18, 9, 1, 0, 'new bed', 25000, 300, 21, 1, 'my pr details', 'uploads/6008504974330.jpg', '2021-01-23 00:13:44', 1, 0, 'black'),
(19, 20, 33, 0, 'new sofa', 62000, 100, 1, 2, 'made in Yemen', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-24 02:43:10', 1, 0, 'Grey'),
(20, 1, 33, 0, 'chair', 4000, 40, 1, 1, 'details', 'uploads/5fff63d635ed1.jpg', '2021-01-24 07:25:43', 1, 20, 'black'),
(27, 1, 2, 0, 'chair', 4000, 40, 1, 1, 'details', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-25 14:17:09', 1, 20, 'black'),
(28, 22, 2, 0, 'carpet', 44, 22, 1, 1, 'aa', 'uploads/600d5a3c7bc2f.jpg:uploads/600d5a3c9112b.jpg:uploads/600d5a3c9af2b.jpg:uploads/600d5a3c9b057.jpg:uploads/600d5a3ca0dd1.jpeg:uploads/600d5a3ca0ce3.jpg:uploads/600d5a3ca0de1.jpg:uploads/600d5a3ca4c77.jpg:', '2021-01-25 21:46:22', 1, 4455, 'White'),
(30, 9, 1, 0, 'Modern bed', 25000, 300, 21, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-26 00:02:34', 1, 0, 'black'),
(31, 20, 1, 0, 'new sofa', 62000, 100, 2, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/sofa1.jpg:uploads/sofa2.jpg:uploads/sofa3.jpg:uploads/sofa4.jpg:', '2021-01-26 06:50:56', 1, 0, 'Grey'),
(34, 15, 35, 0, 'classic room', 1222, 900, 1, 2, 'a', 'uploads/6008519c95c1111.jpg', '2021-01-26 10:36:31', 1, 22, 'grey'),
(35, 9, 35, 0, 'Modern bed', 25000, 300, 21, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-26 11:57:54', 1, 0, 'black'),
(37, 18, 37, 0, 'sofa', 13000, 200, 1, 2, 'lither sofa made in Japan', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-27 10:23:46', 1, 0, 'Grey'),
(38, 18, 37, 0, 'sofa', 13000, 200, 1, 2, 'lither sofa made in Japan', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-27 10:23:54', 1, 0, 'Grey'),
(41, 18, 1, 0, 'sofa', 13000, 200, 1, 2, 'lither sofa made in Japan', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-27 23:23:06', 1, 0, 'Grey'),
(43, 9, 2, 0, 'Modern bed', 25000, 300, 37, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-28 12:35:27', 1, 0, 'black');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(4) NOT NULL,
  `cat_name` varchar(30) NOT NULL,
  `category_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `category_image`) VALUES
(1, 'bed', 'uploads/600f13e054f16.jpg'),
(2, 'Sofas', 'uploads/600f13e054f16.jpg'),
(3, 'chairs', 'uploads/600e0ddeec26a.jpeg'),
(22, 'coffee tables', 'uploads/600f13e054f16.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(8) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `yrial_price` float NOT NULL,
  `dollar_price` float NOT NULL,
  `vendor_id` int(7) NOT NULL,
  `cat_id` int(4) NOT NULL,
  `product_details` text DEFAULT NULL,
  `product_img` text DEFAULT NULL,
  `product_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_quantity` int(5) NOT NULL,
  `product_discount` int(3) DEFAULT NULL,
  `color` text DEFAULT 'black',
  `hide` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `yrial_price`, `dollar_price`, `vendor_id`, `cat_id`, `product_details`, `product_img`, `product_date`, `product_quantity`, `product_discount`, `color`, `hide`) VALUES
(1, 'chair', 4000, 40, 2, 1, 'details', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-07 19:55:31', 6, 20, 'black', 0),
(2, 'modern chair', 33, 22, 21, 3, 'details', 'uploads/6007fc8c131b0.jpg', '2021-01-17 17:18:29', 22, 33, 'black', 0),
(9, 'Modern bed', 25000, 300, 37, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-20 15:46:29', 3, 0, 'black', 0),
(11, 'modern bedroom', 20000, 50, 37, 1, 'pro det', 'uploads/600a7a7a373fe.jpg', '2021-01-20 15:04:29', 2, 0, 'black', 0),
(13, 'Carpet', 2455, 35, 21, 3, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/6008519c95c1.jpg', '2021-01-20 15:52:04', 2, 0, 'black', 0),
(14, 'a updated', 1222, 1, 1, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/600a8da4197f6.jpg', '2021-01-21 07:23:20', 0, 22, 'White', 0),
(15, 'classic room', 1222, 900, 1, 2, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/6008519c95c1111.jpg', '2021-01-21 07:23:44', 5, 22, 'grey', 0),
(18, 'sofa', 13000, 200, 1, 2, 'lither sofa made in Japan', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-21 19:18:19', 2, 0, 'Grey', 0),
(19, 'living room carpet', 1, 1, 1, 1, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/6009d459830a6.jpg', '2021-01-21 19:22:11', 1, 1, 'Grey', 0),
(20, 'new sofa', 62000, 100, 37, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/sofa1.jpg:uploads/sofa2.jpg:uploads/sofa3.jpg:uploads/sofa4.jpg:', '2021-01-22 08:32:48', 1, 0, 'Grey', 1),
(21, 'new carpet', 120000, 200, 1, 1, 'carpet details', 'uploads/600d2895b430f.jpg:uploads/600d2895c2263.jpg:uploads/600d2895d68b4.jpg:uploads/600d2895d696b.jpg:', '2021-01-24 07:59:27', 2, 0, 'Black', 0),
(22, 'carpet', 44, 22, 1, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/600d5a3c7bc2f.jpg:uploads/600d5a3c9112b.jpg:uploads/600d5a3c9af2b.jpg:uploads/600d5a3c9b057.jpg:uploads/600d5a3ca0dd1.jpeg:uploads/600d5a3ca0ce3.jpg:uploads/600d5a3ca0de1.jpg:uploads/600d5a3ca4c77.jpg:', '2021-01-24 11:30:20', 1, 4455, 'White', 0),
(24, 'new product', 60000, 100, 35, 4, 'product details', 'uploads/600feba22e565.jpg:uploads/600feba24448e.jpg:uploads/600feba245734.jpg:uploads/600feba246d57.jpg:', '2021-01-26 10:15:03', 2, 0, '', NULL),
(25, 'new sofa2', 62000, 100, 37, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/sofa1.jpg:uploads/sofa2.jpg:uploads/sofa3.jpg:uploads/sofa4.jpg:', '2021-01-22 08:32:48', 1, 0, 'Grey', 1),
(26, 'new sofa3', 62000, 100, 37, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/sofa1.jpg:uploads/sofa2.jpg:uploads/sofa3.jpg:uploads/sofa4.jpg:', '2021-01-22 08:32:48', 1, 0, 'Grey', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_report`
--

CREATE TABLE `product_report` (
  `product_r_id` int(11) NOT NULL,
  `product_r_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_report`
--

INSERT INTO `product_report` (`product_r_id`, `product_r_type`) VALUES
(1, 'AAA'),
(2, 'BBB');

-- --------------------------------------------------------

--
-- Table structure for table `product_report_details`
--

CREATE TABLE `product_report_details` (
  `product_r_d_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_r_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `checked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_report_details`
--

INSERT INTO `product_report_details` (`product_r_d_id`, `product_id`, `product_r_id`, `sender_id`, `created_at`, `checked`) VALUES
(7, 1, 1, 1, '2021-01-28 13:33:03', 0),
(8, 1, 1, 1, '2021-01-28 13:33:03', 0),
(9, 1, 1, 1, '2021-01-28 13:33:03', 0),
(10, 1, 2, 1, '2021-01-28 13:33:03', 0),
(11, 1, 2, 1, '2021-01-28 13:33:03', 0),
(12, 1, 1, 30, '2021-01-28 13:33:03', 0),
(13, 2, 1, 15, '2021-01-25 05:13:31', 0),
(14, 20, 1, 23, '2021-01-25 16:31:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `product_id`, `user_id`, `rating`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 4),
(8, 1, 3, 2),
(9, 1, 4, 2),
(10, 1, 7, 3),
(11, 20, 7, 4),
(12, 9, 7, 4),
(13, 15, 35, 4),
(14, 20, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(4) NOT NULL,
  `report_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `report_name`) VALUES
(1, 'Late deliver'),
(2, 'Not Healthy'),
(3, 'Fake product');

-- --------------------------------------------------------

--
-- Table structure for table `report_details`
--

CREATE TABLE `report_details` (
  `report_D_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `against` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `checked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_details`
--

INSERT INTO `report_details` (`report_D_id`, `report_id`, `sender`, `against`, `created_at`, `checked`) VALUES
(1, 1, 1, 2, '2021-01-21 11:34:43', 0),
(2, 1, 1, 2, '2021-01-21 11:34:43', 0),
(3, 2, 2, 3, '2021-01-21 12:15:43', 0),
(4, 2, 2, 3, '2021-01-21 12:15:49', 0),
(6, 4, 3, 2, '2021-01-21 21:20:01', 0),
(7, 1, 2, 3, '2021-01-22 21:32:32', 0),
(8, 3, 1, 2, '2021-01-22 21:33:32', 0),
(9, 1, 1, 2, '2021-01-22 21:34:43', 0),
(10, 1, 1, 2, '2021-01-23 11:37:02', 0),
(12, 2, 1, 2, '2021-01-23 11:39:01', 0),
(13, 1, 1, 2, '2021-01-23 13:50:23', 0),
(14, 2, 1, 2, '2021-01-23 15:56:41', 0),
(15, 3, 1, 2, '2021-01-23 16:43:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(7) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `vendor` tinyint(1) NOT NULL DEFAULT 0,
  `block` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `firebase_user_id` text DEFAULT NULL,
  `firebase_user_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `phone_number`, `details`, `address`, `vendor`, `block`, `admin`, `image`, `created_at`, `firebase_user_id`, `firebase_user_name`) VALUES
(1, 'alaiz ', 'Hashim', 'alaiz.hashim@gmail.com', '+967775301780', 'details of alaiz', '', 0, 0, 0, '600dc73f55221.jpg', '2021-01-07 23:13:40', '5tcYjENPd6TcWIUqkwKZiefmIEo1', 'Alaiz Hashim'),
(2, 'admin ', 'admin', 'yemenoshopping@gmail.com', '+967775301780', 'admin of the application', '', 0, 0, 1, '', '2021-01-12 10:13:53', NULL, NULL),
(3, 'Ahmid ', 'Ali', 'alaiz.hashim', '123', 'my detailss', 'my addresss', 0, 1, 0, 'default image link', '2021-01-19 22:11:16', NULL, NULL),
(33, 'guist', '3', 'aaab@gmail.com', '+96777119920', 'supplyer', 'Santa\'s', 0, 0, 0, 'uploads/600a21c3c3c20.jpg', '2021-01-24 02:15:30', NULL, NULL),
(34, 'alaiz', 'alaiz', 'alaiz@gmail.com', '771133133', 'supplier', 'Sanaa', 0, 0, 0, 'uploads/600f5e6a1fdea.jpeg', '2021-01-26 00:13:51', NULL, NULL),
(35, 'Nora', 'Saeed', 'abcabc123@gmail.com', '+967775301780', 'student', 'Ibb', 0, 0, 0, 'uploads/600fe539110e6.jpg', '2021-01-26 09:45:00', 'o2UJtkfOqaSHeeqEDZZZ4hT1VJQ2', 'n'),
(37, 'Amal', 'Qassem', 'guist6@gmail.com', '222222', 'furneture supplier', 'Aden, Alshikh Othman', 0, 0, 0, 'uploads/600fe539110e6.jpg', '2021-01-26 22:45:24', 'r5WF5oIHHzQqqac8I5ho584CMqe2', 'guist6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_cart` (`fk_product_id`),
  ADD KEY `user_cart` (`fk_user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_report`
--
ALTER TABLE `product_report`
  ADD PRIMARY KEY (`product_r_id`);

--
-- Indexes for table `product_report_details`
--
ALTER TABLE `product_report_details`
  ADD PRIMARY KEY (`product_r_d_id`),
  ADD KEY `product_report_id_const` (`product_r_id`),
  ADD KEY `product_user_const` (`sender_id`),
  ADD KEY `produt_id_const` (`product_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `product_to_rating_const` (`product_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `report_id_2` (`report_id`),
  ADD KEY `report_id_3` (`report_id`);

--
-- Indexes for table `report_details`
--
ALTER TABLE `report_details`
  ADD PRIMARY KEY (`report_D_id`),
  ADD KEY `report_reportD_const` (`report_id`),
  ADD KEY `report_reportD_const1` (`sender`),
  ADD KEY `report_reportD_const2` (`against`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_report`
--
ALTER TABLE `product_report`
  MODIFY `product_r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_report_details`
--
ALTER TABLE `product_report_details`
  MODIFY `product_r_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report_details`
--
ALTER TABLE `report_details`
  MODIFY `report_D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product_cart` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_cart` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `product_to_rating_const` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
