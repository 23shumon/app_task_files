-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2020 at 04:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esellers_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_profile_photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `admin_profile_photo`, `password`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Helal Uddin', 'helaluddin1995@gmail.com', '01815752377', NULL, '$2y$10$KisiVONdW9KfsLAEA9mihu7257EUD7alRTuSfuWmZ5rXc1DtDsnJy', 1, NULL, NULL, NULL, NULL),
(4, 'Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'http://e-sellers.000webhostapp.com/uploads/admin-profile-image/app_1579013695.jpg', '$2y$10$D6Q5dm3pNrMvoFHVSAqn8eBzImGsCdYWgMdcj3fmDAyQVHDtLchzO', 1, NULL, '72EprF4XbIfrOm6L5h8OPix6rZEGm0gnz32nHahm', '2020-01-14 08:54:55', '2020-01-14 08:54:55'),
(5, 'Salauddin', 'salauddin@mail.com', '01840840985', NULL, '$2y$10$ZJl5zD.yrGI4bikG/RSjE./DlJLKvTa6ZVsnred/LI5wwW08jnmeW', 1, NULL, 'j67nD3yVYVVNSZzr3al54MB2yHxmVJ7CJoeogHvy', '2020-01-29 07:43:50', '2020-01-29 07:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_description`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Clothing', 'This is man Men\'s Clothing category description.', 1, '2019-11-21 01:15:09', '2019-11-22 04:29:19'),
(2, 'Women\'s Clothing', 'Women Category description', 1, '2019-11-21 07:11:08', '2019-11-22 04:29:35'),
(3, 'Winter Collection', 'Winter Collection Description', 1, '2019-11-22 04:32:27', '2019-11-22 04:32:27'),
(4, 'Mobile & Electronics', 'Mobile & Electronics Description', 1, '2019-11-22 04:33:04', '2019-11-22 04:33:04'),
(5, 'Kid\'s Item', 'This is Kids item category', 1, '2019-12-01 07:00:00', '2019-12-01 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `mobile`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '$2y$10$G5JmttGLY/W9CRVZegc4Ke7fsNYC8mCahG9osvdnUKiqCXp/N6PIm', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-11-27 07:50:42', '2019-11-27 07:50:42'),
(2, 'Mahmudul Hasan Shimul', 'dhushorshimul@gmail.com', '$2y$10$jupCsroYEv8JvUSxpjVtZOqhQO4eh051K5CnTsOgktzEeqksg/oCW', '01521259014', 'Jatrabari, Dhaka', '2019-12-02 13:26:59', '2019-12-02 13:26:59'),
(3, 'Umme Honey', 'designerhoneyy@gmail.com', '$2y$10$U3AToI49UB1AT1u6b.vzYu8u14p1X9o6han4QuVcQwC941cpLayUe', '01997010279', 'Ajimpur, Dhaka', '2020-01-06 00:18:54', '2020-01-06 00:18:54'),
(4, 'Prince Mahmud', 'ummehoney909@gmail.com', '$2y$10$GXIwkXBnVnUd7hfAnJg.T.zzjIqAUuz1uEBxKDBMhLBihjJ8HKAOu', '01738958726', 'Azimpur Koborsthan, Dhaka', '2020-01-16 01:39:04', '2020-01-16 01:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `manufacturer_name`, `manufacturer_description`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'PriyoShop', 'PriyoShop.com is the ultimate online shopping destination for Bangladesh offering completely hassle-free shopping experience through secure and trusted gateways.', 1, '2019-11-23 03:45:08', '2019-11-23 03:45:08'),
(2, 'Daraz', 'Daraz is the ultimate online shopping destination for Bangladesh offering completely hassle-free shopping experience through secure and trusted gateways.', 1, '2019-11-23 03:45:50', '2019-11-23 03:45:50'),
(3, 'Samsung', 'Samsung is a South Korean multinational conglomerate headquartered in Samsung Town, Seoul.[1] It comprises numerous affiliated businesses,[1] most of them united under the Samsung brand, and is the largest South Korean chaebol (business conglomerate).', 1, '2019-11-23 03:48:13', '2019-11-23 03:48:13'),
(4, 'Zara Fashion', 'Zara Fashion is the biggest company.', 1, '2019-12-02 13:07:16', '2019-12-02 13:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_20_092247_create_categories_table', 1),
(4, '2019_04_22_094152_create_manufacturers_table', 1),
(5, '2019_11_21_164755_create_products_table', 2),
(6, '2019_11_25_113505_create_customers_table', 3),
(7, '2019_11_26_181156_create_shippings_table', 4),
(8, '2019_11_26_192345_create_orders_table', 5),
(9, '2019_11_26_192408_create_payments_table', 5),
(10, '2019_11_26_192442_create_order_details_table', 6),
(11, '2020_01_09_174456_create_admins_table', 7),
(13, '2014_10_12_000000_create_users_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `order_total` double(10,2) NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `shipping_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 3599.00, 'Pending', '2019-11-27 02:58:07', '2019-11-27 02:58:07'),
(2, 7, 2, 3599.00, 'Pending', '2019-11-27 02:58:36', '2019-11-27 02:58:36'),
(3, 7, 2, 3599.00, 'Pending', '2019-11-27 02:59:33', '2019-11-27 02:59:33'),
(4, 1, 2, 146288.00, 'Pending', '2019-11-27 03:12:29', '2019-11-27 03:12:29'),
(5, 1, 4, 1160.00, 'Pending', '2019-12-02 12:34:59', '2019-12-02 12:34:59'),
(6, 2, 5, 2340.00, 'Pending', '2019-12-02 13:28:46', '2019-12-02 13:28:46'),
(7, 2, 6, 1160.00, 'Pending', '2019-12-03 06:03:34', '2019-12-03 06:03:34'),
(8, 1, 7, 580.00, 'Pending', '2019-12-03 06:22:31', '2019-12-03 06:22:31'),
(9, 3, 8, 3530.00, 'Pending', '2020-01-06 00:21:30', '2020-01-06 00:21:30'),
(10, 1, 9, 520.00, 'Pending', '2020-01-15 10:41:33', '2020-01-15 10:41:33'),
(11, 4, 10, 6639.00, 'Pending', '2020-01-16 01:41:51', '2020-01-16 01:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 15, 'Stylish Round Neck Full Sleeve T-shirt for Men - 14', 300.00, 2, '2019-11-27 02:59:33', '2019-11-27 02:59:33'),
(2, 3, 12, 'Stylish Full Sleeve Sweater for Men Win', 750.00, 2, '2019-11-27 02:59:33', '2019-11-27 02:59:33'),
(3, 3, 9, 'Fashionable Jacket for Men W3', 1499.00, 1, '2019-11-27 02:59:33', '2019-11-27 02:59:33'),
(4, 4, 13, 'Stylish Casual Top for Ladies - SL132', 1290.00, 1, '2019-11-27 03:12:29', '2019-11-27 03:12:29'),
(5, 4, 9, 'Fashionable Jacket for Men W3', 1499.00, 2, '2019-11-27 03:12:29', '2019-11-27 03:12:29'),
(6, 4, 14, 'DELL G5 15 5590 Core i7 8th Gen 15.6 Inch Full HD Laptop', 142000.00, 1, '2019-11-27 03:12:29', '2019-11-27 03:12:29'),
(7, 5, 22, 'Cotton Frock for Baby Girl', 580.00, 2, '2019-12-02 12:35:00', '2019-12-02 12:35:00'),
(8, 6, 28, 'Cotton Embroidered Salwar', 1390.00, 1, '2019-12-02 13:28:47', '2019-12-02 13:28:47'),
(9, 6, 25, 'Women-Nighty', 950.00, 1, '2019-12-02 13:28:47', '2019-12-02 13:28:47'),
(10, 7, 22, 'Cotton Frock for Baby Girl', 580.00, 2, '2019-12-03 06:03:35', '2019-12-03 06:03:35'),
(11, 8, 27, 'Kids Socks', 580.00, 1, '2019-12-03 06:22:31', '2019-12-03 06:22:31'),
(12, 9, 29, 'Baby Frog', 790.00, 2, '2020-01-06 00:21:30', '2020-01-06 00:21:30'),
(13, 9, 26, 'Boy Casual Shoe', 650.00, 3, '2020-01-06 00:21:30', '2020-01-06 00:21:30'),
(14, 10, 33, 'Baby\'s Dress', 520.00, 1, '2020-01-15 10:41:34', '2020-01-15 10:41:34'),
(15, 11, 33, 'Baby\'s Dress', 520.00, 2, '2020-01-16 01:41:51', '2020-01-16 01:41:51'),
(16, 11, 34, 'Girl Casual shoe', 550.00, 2, '2020-01-16 01:41:51', '2020-01-16 01:41:51'),
(17, 11, 1, 'Sweat Shirt for Men', 500.00, 1, '2020-01-16 01:41:51', '2020-01-16 01:41:51'),
(18, 11, 30, 'Womens Trops', 1099.00, 1, '2020-01-16 01:41:51', '2020-01-16 01:41:51'),
(19, 11, 27, 'Kids Socks', 580.00, 5, '2020-01-16 01:41:51', '2020-01-16 01:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_type`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Cash', 'Pending', '2019-11-27 02:58:36', '2019-11-27 02:58:36'),
(2, 3, 'Cash', 'Pending', '2019-11-27 02:59:33', '2019-11-27 02:59:33'),
(3, 4, 'Cash', 'Pending', '2019-11-27 03:12:29', '2019-11-27 03:12:29'),
(4, 5, 'Cash', 'Pending', '2019-12-02 12:35:00', '2019-12-02 12:35:00'),
(5, 6, 'Cash', 'Pending', '2019-12-02 13:28:46', '2019-12-02 13:28:46'),
(6, 7, 'Cash', 'Pending', '2019-12-03 06:03:34', '2019-12-03 06:03:34'),
(7, 8, 'Cash', 'Pending', '2019-12-03 06:22:31', '2019-12-03 06:22:31'),
(8, 9, 'Cash', 'Pending', '2020-01-06 00:21:30', '2020-01-06 00:21:30'),
(9, 10, 'Cash', 'Pending', '2020-01-15 10:41:34', '2020-01-15 10:41:34'),
(10, 11, 'Cash', 'Pending', '2020-01-16 01:41:51', '2020-01-16 01:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `product_name`, `product_price`, `product_quantity`, `short_description`, `long_description`, `product_image`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sweat Shirt for Men', 500.00, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579006780.jpg', 1, '2019-11-23 03:52:37', '2020-01-14 08:24:53'),
(2, 1, 1, 'Winter Jeans Shirt', 850.00, 10, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579009617.jpeg', 1, '2019-11-23 03:57:26', '2020-01-14 08:24:34'),
(3, 1, 1, 'Stretchable Jeans Pant', 850.00, 10, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579009829.jpeg', 1, '2019-11-23 03:58:22', '2020-01-14 08:24:17'),
(4, 2, 2, 'Cotton Ladies Kurti', 1190.00, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010086.jpeg', 1, '2019-11-23 04:10:25', '2020-01-14 08:23:59'),
(5, 3, 2, 'Cotton Full Sleeve Jacket', 750.00, 6, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010128.jpeg', 1, '2019-11-23 04:12:06', '2020-01-14 08:23:40'),
(7, 2, 1, 'Deshi Cotton Saree', 1150.00, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010025.jpeg', 1, '2019-11-23 04:16:26', '2020-01-14 08:23:21'),
(8, 4, 3, 'DELL Inspiron Core i5', 57000.00, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010177.jpeg', 1, '2019-11-23 04:18:24', '2020-01-14 08:23:03'),
(9, 1, 2, 'Fashionable Jacket Men', 1499.00, 6, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010211.jpeg', 1, '2019-11-23 04:19:38', '2020-01-14 08:22:27'),
(12, 3, 1, 'Stylish Sweater for Men', 750.00, 8, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010267.jpeg', 1, '2019-11-23 04:23:40', '2020-01-14 08:22:45'),
(13, 2, 2, 'Casual Top for Ladies', 1290.00, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010566.jpeg', 1, '2019-11-23 04:24:39', '2020-01-14 08:22:09'),
(14, 4, 3, 'DELL G5 Core i7', 142000.00, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010595.jpeg', 1, '2019-11-23 04:25:43', '2020-01-14 08:21:48'),
(15, 3, 2, 'Stylish T-shirt for Men', 300.00, 6, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010318.jpeg', 1, '2019-11-23 04:26:39', '2020-01-14 08:21:24'),
(24, 2, 4, 'Women-Multicolor Top', 1250.00, 5, 'Short Description', 'Long Description', 'http://192.168.0.103/searching/uploads/pi_1579010647.jpg', 1, '2019-12-02 13:11:21', '2020-01-14 08:04:07'),
(25, 2, 4, 'Women-Nighty', 950.00, 6, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010688.jpg', 1, '2019-12-02 13:15:36', '2020-01-14 08:04:48'),
(26, 5, 4, 'Boy Casual Shoe', 650.00, 10, 'This is short description', 'This is Long description', 'http://192.168.0.103/searching/uploads/pi_1579010732.jpg', 1, '2019-12-02 13:17:49', '2020-01-14 08:05:32'),
(27, 5, 4, 'Kids Socks', 580.00, 6, 'This is short description', 'This is short description', 'http://192.168.0.103/searching/uploads/pi_1579010788.jpg', 1, '2019-12-02 13:19:13', '2020-01-14 08:06:28'),
(28, 2, 4, 'Cotton Embroidered Salwar', 1390.00, 4, 'This is short description', 'This is short description', 'http://192.168.0.103/searching/uploads/pi_1579010834.jpg', 1, '2019-12-02 13:22:52', '2020-01-14 08:07:14'),
(29, 5, 4, 'Baby Frog', 790.00, 10, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010503.jpg', 1, '2020-01-05 04:10:37', '2020-01-14 08:01:43'),
(30, 2, 4, 'Womens Trops', 1099.00, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010463.jpg', 1, '2020-01-14 05:33:44', '2020-01-14 08:01:03'),
(31, 1, 1, 'T-Shirt for Man\'s', 890.00, 10, 'Short Description', 'Long Description', 'http://192.168.0.103/searching/uploads/pi_1579010372.jpg', 1, '2020-01-14 05:39:01', '2020-01-14 07:59:32'),
(33, 5, 1, 'Baby\'s Dress', 520.00, 10, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579004119.jpg', 1, '2020-01-14 06:15:19', '2020-01-14 06:15:19'),
(34, 5, 1, 'Girl Casual shoe', 550.00, 5, 'Short description', 'Long description', 'http://192.168.0.103/searching/uploads/pi_1579011172.jpg', 1, '2020-01-14 08:12:52', '2020-01-14 08:12:52'),
(35, 5, 1, 'Kid Bike', 1500.00, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579012074.jpg', 1, '2020-01-14 08:27:54', '2020-01-14 08:27:54');

-- --------------------------------------------------------

--
-- Stand-in structure for view `searchable`
-- (See below for the actual view)
--
CREATE TABLE `searchable` (
`id` bigint(20) unsigned
,`category` varchar(255)
,`manufacturer` varchar(255)
,`name` varchar(255)
,`price` double(10,2)
,`quantity` int(11)
,`short_dec` text
,`long_dec` text
,`image` text
);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `email`, `mobile`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-11-26 12:33:22', '2019-11-26 12:33:22'),
(2, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-11-27 02:55:09', '2019-11-27 02:55:09'),
(3, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-11-27 08:55:36', '2019-11-27 08:55:36'),
(4, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-12-02 12:34:50', '2019-12-02 12:34:50'),
(5, 'Marjiya Akter', 'marjiya1122@gmail.com', '01621259014', 'Mohakhali, Dhaka', '2019-12-02 13:28:20', '2019-12-02 13:28:20'),
(6, 'Marzia Akter', 'marziamahmud@gmail.com', '01521485236', 'Mohakhali, Dhaka', '2019-12-03 06:03:07', '2019-12-03 06:03:07'),
(7, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2019-12-03 06:22:20', '2019-12-03 06:22:20'),
(8, 'Umme Honey', 'designerhoneyy@gmail.com', '01997010279', 'Ajimpur, Dhaka', '2020-01-06 00:21:14', '2020-01-06 00:21:14'),
(9, 'Md. Shakil Hossain', 'mdshakilhossain091@gmail.com', '01738620241', 'State guest house, Padma, Meghna, Ramna, Dhaka-1000', '2020-01-15 10:41:27', '2020-01-15 10:41:27'),
(10, 'Umme Honey', 'ummehoney909@gmail.com', '01738958726', 'Azimpur Koborsthan, Dhaka', '2020-01-16 01:40:51', '2020-01-16 01:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_profile_photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `user_profile_photo`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'mdshakilhossain091@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$jVHgDZMp1iTFI4dPTmevCOFDiFlkQMoxBBWb1/WK5I5lzg35fEuNu', NULL, '2020-01-20 05:03:44', '2020-01-20 05:03:44'),
(2, NULL, '456@mail.com', NULL, NULL, NULL, NULL, '$2y$10$YRwudHyq8UEH.LExMs3H7u7hOPhkm35unUQx9lo.7y3rcYtuM2kmS', NULL, '2020-01-20 11:16:49', '2020-01-20 11:16:49'),
(3, NULL, 'shamim@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$cKmF2yfPKdS1KoU.WRlVbu2MAZoBjPmc3ognddMcmb6K9OJX5FA46', NULL, '2020-01-20 11:18:50', '2020-01-20 11:18:50'),
(4, NULL, 'new@mail.com', NULL, NULL, NULL, NULL, '$2y$10$6mIT9lgvSBy3ZEeGjjlqwOkdR1jfv4AB7gPY0fJEb8w5zV/xcPoW2', NULL, '2020-01-20 11:31:31', '2020-01-20 11:31:31'),
(5, NULL, '8989@mail.com', NULL, NULL, NULL, NULL, '$2y$10$GjOSha5.0ne8lrHrHQY6iemgDvxa6/gNz7c/xdWqfAuEjKPdQbTGG', NULL, '2020-01-20 11:40:04', '2020-01-20 11:40:04'),
(6, NULL, '222@mail.com', NULL, NULL, NULL, NULL, '$2y$10$t4SCPLKwpsiKFMEhgjZENeDC6/9dsQc4mqKU8/mw2IMXjwsJZBfC6', NULL, '2020-01-20 12:06:46', '2020-01-20 12:06:46'),
(7, NULL, 'new22@mail.com', NULL, NULL, NULL, NULL, '$2y$10$s.zehi9Tm1dj1Jz/qke0IOMcQbl5koAdgeSPR9I7KJc6Bvx2aG2/i', NULL, '2020-01-20 12:48:33', '2020-01-20 12:48:33'),
(8, NULL, 'new44@mail.com', NULL, NULL, NULL, NULL, '$2y$10$mCa5Cz4UwLsUTRBi/aMQGOmmEAx89QHJY2OoQshMZWOM06FqdJ.Fy', NULL, '2020-01-20 13:05:10', '2020-01-20 13:05:10'),
(9, NULL, '777@mail.com', NULL, NULL, NULL, NULL, '$2y$10$cAFtC8UzAcwDOXGWFTVghu33YIWW8/ueKd.qc17SsS8bCMSUZveOi', NULL, '2020-01-20 13:10:13', '2020-01-20 13:10:13'),
(10, NULL, 'new66@mail.com', NULL, NULL, NULL, NULL, '$2y$10$UEQqTVA1F6SSLPm/V6s07uqbum5cNRA6ru4VSie9sRMT2HRPaTY4.', NULL, '2020-01-20 13:18:37', '2020-01-20 13:18:37'),
(11, NULL, 'new88@mail.com', NULL, NULL, NULL, NULL, '$2y$10$BbP5xwB.HB3LfNSbmU.poOKByPZM1MJiuaga8IUuSnCsXcz1zDZn6', NULL, '2020-01-20 13:25:59', '2020-01-20 13:25:59'),
(12, NULL, 'eee@mail.com', NULL, NULL, NULL, NULL, '$2y$10$gLoB3oz7G2wHnUQCeUWBeOfX6cq8TbmViFRHDXK6kd8nUJpqOOYx2', NULL, '2020-01-20 18:06:32', '2020-01-20 18:06:32'),
(13, NULL, '555@mail.com', NULL, NULL, NULL, NULL, '$2y$10$qAC6WbTDp37s3r9P2uN09ugzTeJ2Fh3cB5QAgGPOL2UqVCjtO9w7a', NULL, '2020-01-20 18:33:29', '2020-01-20 18:33:29'),
(14, NULL, 'mobile@mail.com', NULL, NULL, NULL, NULL, '$2y$10$eLe5kWFTS4SS4H1q/Qy71uW/PcNf2HLFMCj9.TidxG6gtmVywJMS.', NULL, '2020-01-21 03:51:29', '2020-01-21 03:51:29'),
(15, NULL, 'habib@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$XNQNaL68i2h7NUOueAyNLecjs3AtoJk5YjBPaDK9XBgkjCxMA8GP2', NULL, '2020-01-21 05:30:31', '2020-01-21 05:30:31'),
(16, NULL, 'testing@mail.com', NULL, NULL, NULL, NULL, '$2y$10$usCPliGLpQrNdLnuHRUbceDgLeadGowrwE1hsK7.xrnmVMmqktxLm', NULL, '2020-01-21 06:27:33', '2020-01-21 06:27:33'),
(17, NULL, 'ssd@mail.com', NULL, NULL, NULL, NULL, '$2y$10$zCk1.FY9BZAvFJf71bTQJeWDmR9IkNO0FXrwvLAqfo4gtx1b.jc7q', NULL, '2020-01-21 17:28:07', '2020-01-21 17:28:07'),
(18, NULL, '1234@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$sXfR8vY2JD/eeAUkI/4UQuCs3Nmy9.4ZpEIBOP61A4KCtpRPNQBfS', NULL, '2020-01-23 05:25:15', '2020-01-23 05:25:15');

-- --------------------------------------------------------

--
-- Structure for view `searchable`
--
DROP TABLE IF EXISTS `searchable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `searchable`  AS  select `products`.`id` AS `id`,`categories`.`category_name` AS `category`,`manufacturers`.`manufacturer_name` AS `manufacturer`,`products`.`product_name` AS `name`,`products`.`product_price` AS `price`,`products`.`product_quantity` AS `quantity`,`products`.`short_description` AS `short_dec`,`products`.`long_description` AS `long_dec`,`products`.`product_image` AS `image` from ((`categories` join `products` on(`categories`.`id` = `products`.`category_id`)) join `manufacturers` on(`manufacturers`.`id` = `products`.`manufacturer_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_mobile_unique` (`mobile`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
