-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 12:01 AM
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
(43, 9, 2, 0, 'Modern bed', 25000, 300, 37, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-28 12:35:27', 1, 0, 'black'),
(44, 22, 2, 0, 'carpet', 44, 22, 1, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/600d5a3c7bc2f.jpg:uploads/600d5a3c9112b.jpg:uploads/600d5a3c9af2b.jpg:uploads/600d5a3c9b057.jpg:uploads/600d5a3ca0dd1.jpeg:uploads/600d5a3ca0ce3.jpg:uploads/600d5a3ca0de1.jpg:uploads/600d5a3ca4c77.jpg:', '2021-01-28 15:24:25', 1, 4455, 'White'),
(45, 9, 2, 0, 'Modern bed', 25000, 300, 37, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-28 19:37:02', 1, 0, 'black');

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
(1, 'Bed', 'uploads/600f13e054f16.jpg'),
(2, 'Sofa', 'uploads/600f13e054f16.jpg'),
(3, 'chair', 'uploads/600e0ddeec26a.jpeg'),
(23, 'Table', 'uploads/600f13e054f16.jpg'),
(24, 'Rug', 'uploads/601462fd8b66a.jpg'),
(25, 'Pillow', 'uploads/6014639ed8096.jpg');

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
  `hide` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `yrial_price`, `dollar_price`, `vendor_id`, `cat_id`, `product_details`, `product_img`, `product_date`, `product_quantity`, `product_discount`, `color`, `hide`) VALUES
(1, 'rug', 4000, 40, 2, 24, 'details', 'uploads/600a8da4197f6.jpg:uploads/600a8da41d10d.jpg:uploads/600a8da429bd0.jpg:uploads/600a8da42c5d0.jpg:', '2021-01-07 19:55:31', 6, 20, 'black', 1),
(2, 'modern chair', 33, 22, 21, 3, 'details', 'uploads/6007fc8c131b0.jpg', '2021-01-17 17:18:29', 22, 33, 'black', 0),
(9, 'Modern bed', 25000, 300, 37, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/bedroom1.jpg:uploads/bedroom2.jpg:uploads/bedroom3.jpg:uploads/bedroom4.jpg:', '2021-01-20 15:46:29', 3, 0, 'black', 0),
(11, 'modern bedroom', 20000, 50, 37, 1, 'pro det', 'uploads/600a7a7a373fe.jpg', '2021-01-20 15:04:29', 2, 0, 'black', 0),
(15, 'classic room', 1222, 900, 1, 2, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/6008519c95c1111.jpg', '2021-01-21 07:23:44', 5, 22, 'grey', 0),
(18, 'sofa', 313000, 600, 1, 2, 'If style is the question, then the Altari sofa sleeper is the answer. Sporting clean lines and sleek track arms, the decidedly contemporary profile is enhanced with plump cushioning and a chenille-feel upholstery, so pleasing to the touch. Sure to play well with so many color schemes, this sofa sleeper in slate gray includes a pair of understated floral pattern pillows for fashionably fresh appeal. Pull-out queen mattress in quality memory foam comfortably accommodates overnight guests.', 'uploads/60144b1a45291.jpg:uploads/60144b1a4d835.jpg:uploads/60144b1a56aed.jpg:uploads/60144b1a5aa7a.jpg:uploads/60144b1a60732.jpg:uploads/60144b1a3a234.jpg:uploads/60144b1a3f7d6.jpg:', '2021-01-21 19:18:19', 2, 0, 'Grey', 0),
(20, 'new sofa', 62000, 100, 37, 2, 'An Amazon brand - This charming sofa features a streamlined modern look, Mid-century inspired design touches and durable construction that stands up to daily life. Its simplicity coordinates with most décor styles, making it the perfect piece for any living room.', 'uploads/sofa1.jpg:uploads/sofa2.jpg:uploads/sofa3.jpg:uploads/sofa4.jpg:', '2021-01-22 08:32:48', 1, 0, 'Grey', 1),
(22, 'carpet', 44, 22, 1, 1, 'Called \"the bed of the future\", The Executive Smart Bed is your fully-loaded high-end lounge & bedroom solution. It\'s packed with ultra-modern features & accessories for convenient leisure, including an electronic massage chair, hidden steel lockbox safe, Bluetooth speaker & power ports, adjustable headboards & reading lights, extractable computer desk, and multiple built-in storage compartments. Our beds are made from sustainably sourced premium material and designed for maximum comfort. With microfiber leather, high-density sponge, and a solid pinewood frame, each bed is uniquely built and custom constructed to provide a look & feel like no other. The Executive Smart Bed has a \"distinguished design\". Built for home beauty, our beds provide a modern look paired with classic elements, creating an elegant & refined bedroom aesthetic. It\'s perfect for comfortable laptop working, daytime lounging, and of course your nighttime slumber.', 'uploads/600d5a3c7bc2f.jpg:uploads/600d5a3c9112b.jpg:uploads/600d5a3c9af2b.jpg:uploads/600d5a3c9b057.jpg:uploads/600d5a3ca0dd1.jpeg:uploads/600d5a3ca0ce3.jpg:uploads/600d5a3ca0de1.jpg:uploads/600d5a3ca4c77.jpg:', '2021-01-24 11:30:20', 1, 4455, 'White', 0),
(27, 'Dining  Table', 350000, 584.99, 1, 23, 'Cheers to the Chadoni dining room extension table for serving up high-end design, minus the attitude. The look might be might be ultra sleek and contemporary, but with an easy-on-the eyes “smoky” finish, it exudes a casually cool vibe that feels at home.\nMade of veneers, wood and engineered wood\nSeparate extension leaf\nTable extends by pulling both ends and dropping in leaf\nSeats up to 8\nAssembly required\nDining chairs sold separately\nEstimated Assembly Time: 30 Minutes', 'uploads/6013df7235cb6.jpg:uploads/6013df723a53b.jpg:uploads/6013df7248a79.jpg:uploads/6013df7247d05.jpg:uploads/6013df7259f86.jpg:uploads/6013df725f0f3.jpg:', '2021-01-29 10:15:42', 5, 0, 'Grey', 0),
(28, 'Sofa Sleeper', 484000, 807.49, 1, 2, 'If style is the question, then the Altari sofa sleeper is the answer. Sporting clean lines and sleek track arms, the decidedly contemporary profile is enhanced with plump cushioning and a chenille-feel upholstery, so pleasing to the touch. Sure to play well with so many color schemes, this sofa sleeper in slate gray includes a pair of understated floral pattern pillows for fashionably fresh appeal. Pull-out queen mattress in quality memory foam comfortably accommodates overnight guests.', 'uploads/60144b1a4d835.jpg:uploads/60144b1a56aed.jpg:uploads/60144b1a5aa7a.jpg:uploads/60144b1a60732.jpg:uploads/60144b1a3a234.jpg:uploads/60144b1a3f7d6.jpg:uploads/60144b1a45291.jpg:', '2021-01-29 17:51:35', 4, 0, 'Black', 0),
(29, 'Upholstered Bed', 161000, 269.99, 1, 1, 'Foundation/box spring required, sold separately\nMattress available, sold separately\nAssembly required\nEstimated Assembly Time: 60 Minutes', 'uploads/60145785d15d1.jpg:uploads/60145785db327.jpg:uploads/60145785e40da.jpg:uploads/60145785f2079.jpg:uploads/6014578600e61.jpg:uploads/6014578601cf1.jpg:', '2021-01-29 18:44:28', 3, 0, 'Grey', 0),
(30, 'Surya Rug', 76200, 127, 1, 24, 'Simply timeless and beautifully on trend, this masterfully crafted Moroccan style area rug is dressed to impress. Easy elegant and casually cool, it looks right at home whether your furnishings are classic or contemporary.', 'uploads/601464ad72d75.jpg:uploads/601464ad788fe.jpg:uploads/601464ad7a9be.jpg:uploads/601464ad824b0.jpg:uploads/601464ad87a29.jpg:uploads/601464ad91f07.jpg:', '2021-01-29 19:40:32', 3, 0, 'Grey', 0),
(31, 'TV Stand', 40700, 679.99, 1, 23, 'Bathed in a rich, dark and wonderfully “weathered” finish, the Noorbrook TV stand captures that rustic cottage feel, but with clean-lined refinement. For added viewing pleasure: the electric infrared fireplace insert (sold separately) brings the cozy feeling of a fireplace without the work or worry. Just the thing for the perfect night in.', 'uploads/60146587c262d.jpg:uploads/60146587c814f.jpg:uploads/60146587ce4cb.jpg:uploads/60146587d290a.jpg:uploads/60146587d64c3.jpg:uploads/60146587d9b95.jpg:uploads/60146587e21c3.jpg:', '2021-01-29 19:44:11', 3, 0, 'Black', 0),
(32, 'Liviah Pillow', 20000, 34, 1, 25, 'A natural treat for the eyes and the hands. The Liviah throw pillow brings a global appeal to your home. Diamond design in neutral tones is abounding with various textures. Perfect for the bohemian abode.', 'uploads/601467ae9b7bb.jpg:uploads/601467aea1e97.jpg:uploads/601467aea6e71.jpg:', '2021-01-29 19:53:19', 10, 0, 'White', 0),
(33, 'Sofa Sleeper', 713400, 1189, 1, 2, 'Dramatically transform your living space with the rustic look of weathered leather you love—at a fraction of the cost. That’s the beauty of the Larkinhurst faux leather sofa sleeper. Washed in earthy Southwestern tones, with generous back and seating support and jumbo window-pane stitching, it envelops you in comfort and quality. Classic elements such as roll arms and turned feet bring in just enough traditional touch, while an easy-glide pull-out queen mattress makes for modern convenience.', 'uploads/601468d8f12ea.jpg:uploads/601468d8e0a8f.jpg:uploads/601468d8ef68f.jpg:uploads/601468d8ef30f.jpg:', '2021-01-29 19:58:18', 4, 0, '', 0),
(34, 'Queen  Bed', 356000, 594, 1, 1, 'Coralayne queen upholstered bed allures with the glitz and glam befitting silver screen queens. Textured gray vinyl upholstery channels that upscale flair you\'ve been dreaming of. Generously scaled headboard with crystalline buttons will have you feeling sheltered in comfort and luxury. Mattress and foundation/box spring available, sold separately', 'uploads/6014709cccd04.jpg:uploads/6014709cd3f8f.jpg:uploads/6014709ce576c.jpg:uploads/6014709ce9cfa.jpg:uploads/6014709d00c51.jpg:uploads/6014709d0fe27.jpg:', '2021-01-29 20:31:27', 5, 0, 'Grey', 0),
(35, 'Outdoor Table', 1308600, 2181, 1, 23, 'Turn your backyard space into your own piece of paradise with the Paradise Trail 7-piece outdoor fire pit table set. Though this outdoor table looks remarkably like wood, it’s made of sturdy, rust-proof aluminum that’s perfectly suited for al fresco living. Enhancing the rustically refined aesthetic: all-weather, handwoven resin wicker. The result may look high maintenance, but rest assured, this outdoor fire pit table set is anything but. With the press of a button, ignite a flickering flame that dances over a bed of glass beads. And with six high-style bar stools, it’s one highly accommodating outdoor bar table set.', 'uploads/60147180732b3.jpg:uploads/6014718082a7d.jpg:uploads/6014718086034.jpg:uploads/601471808c99c.jpg:uploads/6014718095f01.jpg:uploads/6014718097ebc.jpg:uploads/601471809de82.jpg:uploads/60147180a1395.jpg:uploads/60147180a8870.jpg:uploads/60147180b17fb.jpg:', '2021-01-29 20:35:14', 9, 0, 'Grey', 0),
(36, 'Tv Stand', 300000, 499, 1, 23, 'A brilliant rendition of modern farmhouse style (sliding barn doors and all), the Carynhurst TV stand is right in tune with your richly relaxed sense of style. The TV stand’s clean yet hearty profile is enhanced with a complex whitewash finish with charming distressing and plank-effect styling. Antiqued gray metal hardware is a sophisticated complement.', 'uploads/6014734ca8b87.jpg:uploads/6014734c91192.jpg:uploads/6014734c9e10b.jpg:uploads/6014734ca4ab3.jpg:uploads/6014734cb09a4.jpg:uploads/6014734cb5101.jpg:', '2021-01-29 20:42:54', 5, 0, 'White', 0),
(37, 'Grey Chair', 230000, 424, 1, 3, 'If style is the question, then the Altari chair is the answer. Its decidedly contemporary profile is enhanced with plump cushioning and a chenille-feel upholstery, so pleasing to the touch. Rest assured, this chair in slate gray is sure to play well with so many color schemes.', 'uploads/60147430860cc.jpg:uploads/6014743098490.jpg:uploads/6014743099969.jpg:uploads/601474309acc4.jpg:uploads/601474309ffa2.jpg:', '2021-01-29 20:46:41', 4, 0, 'Grey', 0),
(38, 'Grey Table', 320000, 514, 1, 23, 'Cheers to the Chadoni dining room extension table for serving up high-end design, minus the attitude. The look might be might be ultra sleek and contemporary, but with an easy-on-the eyes “smoky” finish, it exudes a casually cool vibe that feels at home.\r\nMade of veneers, wood and engineered wood\r\nSeparate extension leaf\r\nTable extends by pulling both ends and dropping in leaf\r\nSeats up to 8\r\nAssembly required\r\nDining chairs sold separately\r\nEstimated Assembly Time: 30 Minutes', 'uploads/6013df7248a79.jpg:uploads/6013df7247d05.jpg:uploads/6013df723a53b.jpg:uploads/6013df7235cb6.jpg:uploads/6013df7259f86.jpg:uploads/6013df725f0f3.jpg:', '2021-01-29 10:15:42', 5, 0, 'Grey', 0),
(39, 'Tv Table', 240000, 399, 1, 23, 'A brilliant rendition of modern farmhouse style (sliding barn doors and all), the Carynhurst TV stand is right in tune with your richly relaxed sense of style. The TV stand’s clean yet hearty profile is enhanced with a complex whitewash finish with charming distressing and plank-effect styling. Antiqued gray metal hardware is a sophisticated complement.', 'uploads/6014734ca4ab3.jpg:uploads/6014734ca8b87.jpg:uploads/6014734c91192.jpg:uploads/6014734c9e10b.jpg:uploads/6014734cb09a4.jpg:uploads/6014734cb5101.jpg:', '2021-01-29 20:42:54', 5, 0, 'Grey', 0),
(40, 'Rug', 70000, 110, 1, 24, 'Simply timeless and beautifully on trend, this masterfully crafted Moroccan style area rug is dressed to impress. Easy elegant and casually cool, it looks right at home whether your furnishings are classic or contemporary.', 'uploads/601464ad824b0.jpg:uploads/601464ad87a29.jpg:uploads/601464ad91f07.jpg:uploads/601464ad72d75.jpg:uploads/601464ad788fe.jpg:uploads/601464ad7a9be.jpg:', '2021-01-29 19:40:32', 3, 0, 'White', 0);

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
(7, 1, 1, 1, '2021-01-28 22:28:05', 0),
(8, 1, 1, 1, '2021-01-28 22:28:05', 0),
(9, 1, 1, 1, '2021-01-28 22:28:05', 0),
(10, 1, 2, 1, '2021-01-28 22:28:05', 0),
(11, 1, 2, 1, '2021-01-28 22:28:05', 0),
(12, 1, 1, 30, '2021-01-28 22:28:05', 0),
(13, 2, 1, 15, '2021-01-25 05:13:31', 0),
(14, 20, 1, 23, '2021-01-28 22:59:26', 0);

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
(14, 20, 2, 4),
(15, 22, 2, 4),
(16, 9, 2, 4);

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
(4, 'Fake product');

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
(3, 'Ahmid ', 'Ali', 'alaiz.hashim', '123', 'my detailss', 'my addresss', 0, 0, 0, 'default image link', '2021-01-19 22:11:16', NULL, NULL),
(33, 'guist', '3', 'aaab@gmail.com', '+96777119920', 'supplyer', 'Santa\'s', 0, 0, 0, 'uploads/600a21c3c3c20.jpg', '2021-01-24 02:15:30', NULL, NULL),
(34, 'alaiz', 'alaiz', 'alaiz@gmail.com', '771133133', 'supplier', 'Sanaa', 0, 0, 0, 'uploads/600f5e6a1fdea.jpeg', '2021-01-26 00:13:51', NULL, NULL),
(35, 'Nora', 'Saeed', 'abcabc123@gmail.com', '+967775301780', 'student', 'Ibb', 0, 0, 0, 'uploads/600fe539110e6.jpg', '2021-01-26 09:45:00', 'o2UJtkfOqaSHeeqEDZZZ4hT1VJQ2', 'n'),
(37, 'Amal', 'Qassem', 'guist6@gmail.com', '222222', 'furneture supplier', 'Aden, Alshikh Othman', 0, 1, 0, 'uploads/600fe539110e6.jpg', '2021-01-26 22:45:24', 'r5WF5oIHHzQqqac8I5ho584CMqe2', 'guist6');

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
  MODIFY `cart_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
