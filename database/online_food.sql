-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 03:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_delivery`
--
CREATE DATABASE IF NOT EXISTS `food_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `food_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `email`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `order_number`, `status`, `added_on`) VALUES
(1, 'Drinks', 1, 1, '2020-06-16 12:06:33'),
(2, 'Chinese', 2, 1, '2020-06-16 12:06:41'),
(3, 'South Indian', 3, 1, '2020-06-16 12:06:59'),
(4, 'Desserts', 4, 1, '2020-06-16 12:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_type` enum('P','F') NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `expired_on` date NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dish` varchar(100) NOT NULL,
  `dish_detail` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish_details`
--

CREATE TABLE `dish_details` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_details_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `gst` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `total_price` float NOT NULL,
  `gst` float NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish_details`
--
ALTER TABLE `dish_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `online_food`
--
CREATE DATABASE IF NOT EXISTS `online_food` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `online_food`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `email`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin@gmail.com'),
(2, 'Maha', 'mahazubair', 'mahazubair', 'mahazubair@gmail.com'),
(3, 'Warisha', 'warishaaftab', 'warishaaftab', 'warishaaftab@gmail.com'),
(4, 'Tooba', 'toobaumer', 'toobaumer', 'toobaumer@gmail.com'),
(5, 'Yusra', 'yusrashahnawaz', 'yusrashahnawaz', 'yusrashahnawaz@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `order_number`, `status`, `added_on`) VALUES
(1, 'SOUPS', 6, 1, '2023-07-17 19:27:17'),
(2, 'SEA FOOD', 2, 1, '2023-07-17 19:27:41'),
(3, 'SALADS', 3, 1, '2023-07-17 19:28:11'),
(4, 'DESSERTS', 4, 1, '2023-07-17 19:29:11'),
(5, 'SMOOTHIES', 5, 1, '2023-07-17 19:31:39'),
(6, 'BEVERAGES', 1, 1, '2023-07-17 19:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `subject`, `message`, `added_on`) VALUES
(2, 'sara ali', 'sara456@gmail.com', '123567890', 'Food Delivery Complaint.', 'This is Sara Ali, an old and loyal customer of the Food Valley.\r\nThe experience with your restaurant and services has always been great but the last time my order got delivered half an hour late.\r\nKindly look into the matter.', '2023-07-17 02:52:01'),
(3, 'Yusra Shahnawaz', 'yusrashahnawaz@gmail.com', '03014835298', 'Appreciation Mail', 'Hey, this is to appreciate the top notch services provided by the my favourite online food ordering service, The Food Valley. Love your food and customer service. Keep up the good work.', '2023-07-18 01:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_type` enum('P','F') NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `expired_on` date NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupon_code`
--

INSERT INTO `coupon_code` (`id`, `coupon_code`, `coupon_type`, `coupon_value`, `cart_min_value`, `expired_on`, `status`, `added_on`) VALUES
(1, 'Flat20', 'F', 200, 500, '2023-07-31', 0, '2023-07-18 11:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `name`, `mobile`, `password`, `status`, `added_on`) VALUES
(1, 'Muhammad Ali', '033356134880', 'muhammadali', 1, '2023-07-17 14:31:26'),
(2, 'Asim Muneer', '03356123845', 'asimmuneer', 1, '2023-07-18 01:31:06'),
(3, 'Mohsin Raza', '03329561298', 'mohsinraza', 1, '2023-07-18 01:32:30'),
(4, 'Safdar Ali', '03321781234', 'safdarali', 1, '2023-07-18 01:33:16'),
(5, 'Zain Baig', '03356129045', 'zainbaig', 1, '2023-07-18 01:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dish` varchar(100) NOT NULL,
  `dish_detail` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` enum('veg','non-veg') NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`id`, `category_id`, `dish`, `dish_detail`, `image`, `type`, `status`, `added_on`) VALUES
(1, 1, 'Chicken Corn Soup', 'Chicken corn soup is a soup made from chicken and sweetcorn.', 'chicken corn.jpg', 'non-veg', 1, '2023-07-17 20:50:12'),
(2, 1, ' Schezwan Soup', 'Szechuan Soup is a delicious Chinese recipe served as a Soups-Stews', 'schewan soup.jpg', 'non-veg', 1, '2023-07-17 20:56:45'),
(3, 1, 'Creamy Mushroom Soup', 'Cream of mushroom soup is a simple type of soup where a basic roux is thinned with cream or milk and then mushrooms and/or mushroom broth are added.', 'creamy mushroom.jpg', 'veg', 1, '2023-07-17 23:33:59'),
(4, 1, 'Vegetable Hot and Sour Soup', 'There are two seasonings to bring out the iconic flavors of hot and sour soup: soy sauce and vinegar.\r\n', 'hotandsour.jpg', 'veg', 1, '2023-07-17 23:39:33'),
(5, 1, 'Loaded Veggie Soup', 'Loaded Veggie is prepared using vegetables, leafy greens, mushrooms, and roots as the main ingredients.', 'loadedveggie.jpg', 'non-veg', 1, '2023-07-17 23:48:24'),
(6, 3, 'Detox Avacado Salad', 'This salad is a delightful combination of fresh, ripe avocados, crisp and cool cucumbers, complemented by a light lime dressing.', 'Detox Avacado Salad.jpg', 'non-veg', 1, '2023-07-18 00:03:17'),
(7, 3, 'Black Bean and Mango Salad', 'This Black Bean Mango Salad is bursting with super sweet mangoes and savory black beans tossed together with a bounty of fresh vegetables and homemade lime dressing. It\'s a healthy, colorful, crunchy and refreshing salad ready in 15 minutes, that\'s both striking to the eye and palate!\r\n\r\n', 'Blackbeanandmangosalad.jpg', 'veg', 1, '2023-07-17 15:06:15'),
(8, 3, 'Fattoush Salad', 'Fattoush is a Levantine salad made from toasted or fried pieces of khubz combined with mixed greens and other vegetables, such as radishes and tomatoes. ', 'Fattoushsalad.jpg', 'veg', 1, '2023-07-18 00:10:55'),
(9, 3, 'Chicken Caesar Salad', 'A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic.', 'chickencaesarsalad.jpg', 'non-veg', 1, '2023-07-18 00:14:08'),
(10, 3, 'Turkish Salad', 's with all salads based on fresh vegetables, Turkish ezme salad is best freshly chopped, using vegetables in season. As such, this salad is best served during the summer months or early autumn, when tomatoes are full of flavour.\r\n\r\n', 'turkishsalad.jpg', 'veg', 1, '2023-07-18 00:19:02'),
(11, 2, 'Dynamite Prawns', 'Dynamite Shrimp It is a Japanese appetizer comprising of battered shrimp coated in a mixture of mayonnaise and sriracha sauce.', 'dynamiteprawns.jpg', 'non-veg', 1, '2023-07-18 00:48:10'),
(12, 2, 'Fish Steak', 'A fish steak, alternatively known as a fish cutlet, is a cut of fish which is cut perpendicular to the spine and can either include the bones or be boneless. ', 'fishsteak.jpg', 'non-veg', 1, '2023-07-18 00:53:00'),
(13, 2, 'Chilli Fish', ' A delicious, tangy Indo-fusion dish, Chilli Fish is everything an appetizer or a side dish should be. It is crunchy, tasty, filling and full of aromatic flavours to have your taste buds tantalizing. ', 'fishchilli.jpg', 'non-veg', 1, '2023-07-18 00:54:36'),
(14, 2, 'Sushi', 'A staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar and a variety of vegetable, egg, or raw seafood garnishes and served cold.', 'sushi.jpg', 'non-veg', 1, '2023-07-18 00:57:04'),
(15, 2, 'Spicy Green Prawns', 'Chinese-style prawn stir fry with its clean and steady flavours, or the heart-stopping (in more ways than one) fried and sweet deliciousness of Honey Prawns.', 'spicygreenprawns.jpg', 'non-veg', 1, '2023-07-18 00:58:52'),
(16, 6, 'Pina Colada', 'he piña colada is a drink made with cream of coconut or coconut milk, and pineapple juice, usually served either blended or shaken with ice.', 'pina colada.jpg', 'veg', 1, '2023-07-18 01:02:03'),
(17, 6, 'Lemon Twist', 'Used in an assortment of different drinks, the basic lemon twist is a floating garnish consisting of a wafer-thin piece of lemon peel.', 'lemontwist.jpg', 'veg', 1, '2023-07-18 01:04:20'),
(18, 6, 'Blue Colada', 'Blue Pina Colada is a unique take on the classic summer drinks. This fun and funky take on everybody\'s favorite island drink combines pineapple juice, cream of coconut.', 'bluecolada.jpg', 'veg', 1, '2023-07-18 01:07:17'),
(19, 6, 'Fruit Punch', 'Made with a combination of cranberry, pineapple, orange, and lime give you a fruity punch recipe that is incredibly delicious and simple!', 'fruitpunch.jpg', 'veg', 1, '2023-07-18 01:17:38'),
(20, 6, 'Mint Mojito', 'Classic Mint Mojito made with fresh squeezed limes and mint leaves. Refreshing drink for a hot summer night!', 'mintmojito.jpg', 'veg', 1, '2023-07-18 01:19:45'),
(21, 4, 'Kunafa', 'Kunafa is a sugar-soaked pastry that is common in a number of Arabic countries and territories, especially during Ramadan.', 'kunafa.jpg', 'veg', 1, '2023-07-18 01:23:04'),
(22, 4, 'Peanut Butter Cheesecake', 'Made with an easy graham cracker and peanut crust, creamy peanut butter cheesecake filling, and a delicious peanut butter topping!', 'peanutbuttercheesecake.jpg', 'veg', 1, '2023-07-18 01:26:30'),
(23, 4, 'Pumpkin Tres leches Cake', 'A tres leches cake, dulce de tres leches, also known as pan tres leches or simply tres leches, is a sponge cake—soaked in three kinds of milk: evaporated milk, condensed milk, and whole milk', 'pumpkin tres leches cake.jpg', 'veg', 1, '2023-07-18 01:29:26'),
(24, 4, 'Vanilla Frozen Yogurt', 'Frozen yogurt is a frozen dessert made with yogurt and sometimes other dairy and non-dairy products. Frozen yogurt is a frozen product containing the same basic ingredients as ice cream,but contains live bacterial cultures.', 'Vanillafrozenyougurt.jpg', 'veg', 1, '2023-07-18 01:31:12'),
(25, 4, 'Zucchini Coffee Cake', 'Zucchini makes for a gorgeously moist texture!Zucchini is wonderful to add to baked goods because it adds flavorless moisture. It’s truely magical!', 'zucchinicoffeecake.jpg', 'veg', 1, '2023-07-18 01:34:21'),
(26, 5, 'Blueberry Smoothie', 'Basic Blueberry Smoothie. Cold, creamy, and completely delicious', 'blueberrysmoothie.jpg', 'veg', 1, '2023-07-18 01:36:52'),
(27, 5, 'Green Veggie Smoothie', 'Green smoothies are smoothies that often contain green leafy vegetables such as kale. The nutritional content of green smoothies varies, but they typically provide protein and fibre.', 'greenveggiesmoothie.jpg', 'veg', 1, '2023-07-18 01:40:00'),
(28, 5, 'Strawberry smoothie', 'Basic Strawberry smoothie with a twist of healthy sweetness to kickstart your day.', 'strawberrysmoothie.jpg', 'veg', 1, '2023-07-18 01:44:07'),
(29, 5, 'Mix Berry Smoothie', 'A combination of multiple berries rich in nutrition along with delicious taste.', 'mixberrysmoothie.jpg', 'veg', 1, '2023-07-18 01:45:47'),
(30, 5, 'Peach Smoothie', 'This peach smoothie is juicy and refreshing and provides a burst of delicious flavor! The texture is just perfect, the color is delighful.', 'peachsmoothie.jpg', 'veg', 1, '2023-07-18 01:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `dish_cart`
--

CREATE TABLE `dish_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dish_detail_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dish_cart`
--

INSERT INTO `dish_cart` (`id`, `user_id`, `dish_detail_id`, `qty`, `added_on`) VALUES
(81, 11, 40, 2, '2023-07-18 12:42:00'),
(82, 11, 15, 1, '2023-07-18 12:42:17'),
(83, 11, 35, 3, '2023-07-18 12:42:27'),
(84, 6, 39, 2, '2023-07-18 12:45:02'),
(85, 6, 17, 3, '2023-07-18 12:45:32'),
(86, 6, 34, 2, '2023-07-18 12:45:56'),
(87, 6, 42, 5, '2023-07-18 12:46:05'),
(88, 6, 36, 6, '2023-07-18 12:46:23'),
(89, 6, 2, 5, '2023-07-18 12:47:34'),
(90, 6, 35, 1, '2023-07-18 12:49:37'),
(91, 6, 31, 1, '2023-07-18 12:49:49'),
(92, 6, 29, 1, '2023-07-18 12:50:10'),
(93, 6, 15, 1, '2023-07-18 12:50:34'),
(94, 7, 40, 1, '2023-07-18 12:51:58'),
(95, 7, 3, 1, '2023-07-18 12:52:16'),
(96, 7, 9, 1, '2023-07-18 12:52:37'),
(97, 7, 1, 1, '2023-07-18 12:52:47'),
(98, 7, 13, 1, '2023-07-18 12:53:01'),
(99, 7, 25, 1, '2023-07-18 12:53:28'),
(100, 7, 32, 1, '2023-07-18 12:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `dish_details`
--

CREATE TABLE `dish_details` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dish_details`
--

INSERT INTO `dish_details` (`id`, `dish_id`, `attribute`, `price`, `status`, `added_on`) VALUES
(1, 2, 'Per Serving', 425, 1, '2023-07-17 21:01:07'),
(2, 1, 'Per Serving', 530, 1, '2023-07-18 09:41:43'),
(3, 3, 'Per Serving', 600, 1, '2023-07-18 09:43:27'),
(5, 5, 'Per Serving', 560, 1, '2023-07-18 09:46:08'),
(6, 4, 'Per Serving', 470, 1, '2023-07-18 09:45:36'),
(7, 6, 'Half', 520, 1, '2023-07-18 09:49:41'),
(8, 6, 'Full ', 900, 1, '2023-07-18 09:51:08'),
(9, 7, 'Half', 430, 1, '2023-07-18 09:51:46'),
(10, 7, 'Full', 730, 1, '2023-07-18 09:52:03'),
(11, 8, 'Half', 480, 1, '2023-07-18 09:52:22'),
(12, 8, 'Full', 850, 1, '2023-07-18 09:52:47'),
(13, 9, 'Half', 550, 1, '2023-07-18 09:53:28'),
(14, 9, 'Full', 950, 1, '2023-07-18 09:53:51'),
(15, 10, 'Half', 450, 1, '2023-07-18 09:54:11'),
(16, 10, 'Full', 870, 1, '2023-07-18 09:54:36'),
(17, 11, '500gm ', 1200, 1, '2023-07-18 10:01:25'),
(18, 11, '1Kg', 2400, 1, '2023-07-18 10:02:03'),
(19, 12, '500gm', 1050, 1, '2023-07-18 10:04:08'),
(20, 12, '1Kg', 2100, 1, '2023-07-18 10:04:37'),
(21, 13, '500gm', 1200, 1, '2023-07-18 10:05:27'),
(22, 13, '1Kg', 2400, 1, '2023-07-18 10:06:13'),
(23, 14, '500gm', 1500, 1, '2023-07-18 10:06:32'),
(24, 14, '1Kg', 3000, 1, '2023-07-18 10:07:04'),
(25, 15, '500gm', 900, 1, '2023-07-18 10:07:47'),
(26, 15, '1Kg', 1850, 1, '2023-07-18 10:08:17'),
(27, 16, 'Per Glass', 320, 1, '2023-07-18 10:09:23'),
(28, 17, 'Per Glass', 350, 1, '2023-07-18 10:10:00'),
(29, 18, 'Per Glass', 420, 1, '2023-07-18 10:10:22'),
(31, 19, 'Per Glass', 280, 1, '2023-07-18 10:11:09'),
(32, 20, 'Per Glass', 420, 1, '2023-07-18 10:11:31'),
(33, 21, 'Per Slice', 530, 1, '2023-07-18 10:13:34'),
(34, 22, 'Per Slice', 480, 1, '2023-07-18 10:13:57'),
(35, 23, 'Per Slice', 580, 1, '2023-07-18 10:14:15'),
(36, 24, 'Per Serving', 370, 1, '2023-07-18 10:14:34'),
(37, 25, 'Per Slice', 600, 1, '2023-07-18 10:15:51'),
(38, 26, 'Per Serving', 720, 1, '2023-07-18 10:16:27'),
(39, 27, 'Per Serving', 560, 1, '2023-07-18 10:17:06'),
(40, 28, 'Per Serving', 650, 1, '2023-07-18 10:17:23'),
(41, 29, 'Per Serving', 480, 1, '2023-07-18 10:17:53'),
(42, 30, 'Per Serving', 500, 1, '2023-07-18 10:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_details_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `dish_details_id`, `price`, `qty`) VALUES
(1, 5, 1, 425, 1),
(9, 6, 6, 470, 1),
(10, 6, 26, 1850, 2),
(11, 6, 34, 480, 3),
(12, 6, 28, 350, 1),
(13, 7, 19, 1050, 3),
(14, 7, 27, 320, 2),
(15, 8, 12, 850, 1),
(16, 8, 37, 600, 2),
(17, 9, 33, 530, 1),
(18, 9, 7, 520, 3),
(19, 9, 22, 2400, 1),
(20, 10, 32, 420, 2),
(21, 10, 5, 560, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `total_price` float NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`id`, `user_id`, `name`, `email`, `mobile`, `address`, `total_price`, `zipcode`, `delivery_boy_id`, `payment_status`, `order_status`, `added_on`) VALUES
(1, 5, 'Tooba', 'toobau13@gmail.com', '1234567890', ' House # 302 Gulshan e Iqbal, Karachi.', 840, '73350', 0, 'pending', 1, '2023-07-16 11:26:49'),
(2, 5, 'Tooba', 'toobau13@gmail.com', '1234567890', 'H# 567 Askari Housing Society.', 170, '4567', 0, 'pending', 1, '2023-07-17 12:00:05'),
(3, 5, 'Tooba Umer', 'toobaumer@gmail.com', '03331968521', ' House #  43 Darakshan Society, Karachi.', 425, '73650', 0, 'pending', 1, '2023-07-18 02:10:35'),
(4, 6, 'Maha Zubair', 'toobau13@gmail.com', '03330600385', 'House # 309 Green Society Main Rashid Minhas Road, Karachi.', 5960, '45670', 0, 'pending', 1, '2023-07-18 11:05:17'),
(5, 7, 'Warisha Aftab', 'warishaaftab@gmail.com', '030017866510', ' House # 102 Falak Naaz Residency, Karachi.', 3790, '7480', 0, 'pending', 1, '2023-07-18 11:09:25'),
(6, 9, 'Farhan Iqbal', 'toobau13@gmail.com', '03330600385', 'Jail Chowrangi Road Building # 53, Karachi.', 2050, '53370', 0, 'pending', 1, '2023-07-18 12:12:08'),
(7, 10, 'Hasan Rahim', 'hasanrahim@gmail.com', '03015628945', 'Street # 4 Clifton Phase 2, Near 2 Talwaar ,Karachi.', 4490, '46280', 0, 'pending', 1, '2023-07-18 12:16:07'),
(10, 11, 'Talha Khan', 'toobau13@gmail.com', '03330600385', 'House # 54 DHA Phase 4, Karachi.', 1400, '49570', 0, 'pending', 1, '2023-07-18 12:39:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `email_verify` int(11) NOT NULL,
  `rand_str` varchar(20) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobile`, `password`, `status`, `email_verify`, `rand_str`, `added_on`) VALUES
(1, 'Sara Ali', 'saraali65@gmail.com', '03012356789', '$2y$10$p3xJ0/ewZAe63uw9/ZcRjOcIGDsbhVMb8lGER2qigUn3Hxw7084tO', 0, 0, 'txihbgslucyjdmr', '2023-07-16 09:09:33'),
(2, 'Ali Hasan', 'alihasan98@gmail.com', '03398745797', '$2y$10$i9nzzUi8L4BPh7M3n6hOKuIReavRJ830TEyAiC9O0bcmyEwyVuihW', 1, 0, 'znottqympfwjfmh', '2023-07-16 09:40:53'),
(3, 'Tooba Umer', 'toobaumer@gmail.com', '03331968521', '$2y$10$mEnrZILx4MEHN0ORYcqCuuHKYgWn11mbH5oUT5PjsZ.iZiS0PLlY6', 1, 0, 'tpevuiwmliblugg', '2023-07-16 11:02:01'),
(4, 'Maha Zubair', 'mahazubair@gmail.com', '03321786290', '$2y$10$T9KjjquuZnhvNGK44jV1OOA3kFDq0ZHqVvs3K8FSUcmw4KvWfz.C.', 1, 0, 'kpuxyceaxhgcyfh', '2023-07-17 02:36:33'),
(5, 'Warisha Aftab', 'warishaaftab@gmail.com', '03001786651', '$2y$10$C1AZ.T7Nz93ePI3tk9xD0.P1xbylxT5zctcmlNHlQnv1R9Z5ADzMu', 1, 0, 'qvcnfeilpmbhsku', '2023-07-17 02:37:30'),
(6, 'Yusra Shahnawaz ', 'yusrashahnawaz@gmail.com', '03451786031', '$2y$10$oAJZeiA90Y.clcWlR8oX9.aycW9OGpNy7ktGnOMobQlRuI0JBhJb2', 1, 0, 'yzsyiemrqubknzj', '2023-07-17 02:38:44'),
(7, 'Farhan Iqbal', 'farhaniqbal@gmail.com', '03356123845', '$2y$10$RTDiP/AF0PjMAneMghtgvejmBzpU4L7ltraVzpJPGsRX/OlBIiIHO', 1, 0, 'vkxuoehzdsfpbcz', '2023-07-18 12:08:30'),
(8, 'Hasan Rahim', 'hasanrahim@gmail.com', '03015628945', '$2y$10$cnsupKpCjngx2pVl2W95Q.qiL3Mk05TV6TbivLT0A8iOjUAfi5dYK', 1, 0, 'blwfhdywjrzdyov', '2023-07-18 12:13:17'),
(11, 'Talha Khan', 'talhakhan@gmail', '03334561298', '$2y$10$1JGAbtLeKFyzvrWR3N3mEee6zjGNH6gNbJ6yeBP.lo8FJ9YFrX6ce', 1, 0, 'bxiepqukmyluzdq', '2023-07-18 12:38:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_cart`
--
ALTER TABLE `dish_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `dish_cart`
--
ALTER TABLE `dish_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `dish_details`
--
ALTER TABLE `dish_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"online_food\",\"table\":\"user\"},{\"db\":\"online_food\",\"table\":\"admin\"},{\"db\":\"online_food\",\"table\":\"order_status\"},{\"db\":\"online_food\",\"table\":\"category\"},{\"db\":\"online_food\",\"table\":\"contact_us\"},{\"db\":\"online_food\",\"table\":\"coupon_code\"},{\"db\":\"online_food\",\"table\":\"delivery_boy\"},{\"db\":\"online_food\",\"table\":\"dish\"},{\"db\":\"online_food\",\"table\":\"dish_cart\"},{\"db\":\"online_food\",\"table\":\"order_master\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-07-18 13:39:34', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `restaurant`
--
CREATE DATABASE IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `restaurant`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE `category_tbl` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_tbl`
--

CREATE TABLE `food_tbl` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_tbl`
--
ALTER TABLE `food_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_tbl`
--
ALTER TABLE `food_tbl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
