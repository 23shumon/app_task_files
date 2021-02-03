-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2020 at 08:17 PM
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
-- Database: `search_db`
--

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
(1, 'Men\'s Clothing', 'This is man Men\'s Clothing category description.', 1, '2019-11-20 19:15:09', '2019-11-21 22:29:19'),
(2, 'Women\'s Clothing', 'Women Category description', 1, '2019-11-21 01:11:08', '2019-11-21 22:29:35'),
(3, 'Winter Collection', 'Winter Collection Description', 1, '2019-11-21 22:32:27', '2019-11-21 22:32:27'),
(4, 'Mobile & Electronics', 'Mobile & Electronics Description', 1, '2019-11-21 22:33:04', '2019-11-21 22:33:04'),
(5, 'Kid\'s Item', 'This is Kids item category', 1, '2019-12-01 01:00:00', '2019-12-01 01:00:00');

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
(1, 'PriyoShop', 'PriyoShop.com is the ultimate online shopping destination for Bangladesh offering completely hassle-free shopping experience through secure and trusted gateways.', 1, '2019-11-22 21:45:08', '2019-11-22 21:45:08'),
(2, 'Daraz', 'Daraz is the ultimate online shopping destination for Bangladesh offering completely hassle-free shopping experience through secure and trusted gateways.', 1, '2019-11-22 21:45:50', '2019-11-22 21:45:50'),
(3, 'Samsung', 'Samsung is a South Korean multinational conglomerate headquartered in Samsung Town, Seoul.[1] It comprises numerous affiliated businesses,[1] most of them united under the Samsung brand, and is the largest South Korean chaebol (business conglomerate).', 1, '2019-11-22 21:48:13', '2019-11-22 21:48:13'),
(4, 'Zara Fashion', 'Zara Fashion is the biggest company.', 1, '2019-12-02 07:07:16', '2019-12-02 07:07:16'),
(5, 'Apple', 'apple inc 2020', 1, '2020-02-13 18:00:00', '2020-02-20 18:00:00');

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
  `status_id` int(64) NOT NULL DEFAULT 2,
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

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `product_name`, `product_price`, `product_quantity`, `status_id`, `short_description`, `long_description`, `product_image`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sweat Shirt for Men', 500.00, 5, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579006780.jpg', 1, '2019-11-22 21:52:37', '2020-01-14 02:24:53'),
(2, 1, 1, 'Winter Jeans Shirt', 850.00, 10, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579009617.jpeg', 1, '2019-11-22 21:57:26', '2020-01-14 02:24:34'),
(3, 1, 1, 'Stretchable Jeans Pant', 850.00, 10, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579009829.jpeg', 1, '2019-11-22 21:58:22', '2020-01-14 02:24:17'),
(4, 2, 2, 'Cotton Ladies Kurti', 1190.00, 5, 1, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010086.jpeg', 1, '2019-11-22 22:10:25', '2020-01-14 02:23:59'),
(5, 3, 2, 'Cotton Full Sleeve Jacket', 750.00, 6, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010128.jpeg', 1, '2019-11-22 22:12:06', '2020-01-14 02:23:40'),
(7, 2, 1, 'Deshi Cotton Saree', 1150.00, 4, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010025.jpeg', 1, '2019-11-22 22:16:26', '2020-01-14 02:23:21'),
(8, 4, 3, 'DELL Inspiron Core i5', 57000.00, 2, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010177.jpeg', 1, '2019-11-22 22:18:24', '2020-01-14 02:23:03'),
(9, 1, 2, 'Fashionable Jacket Men', 1499.00, 6, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010211.jpeg', 1, '2019-11-22 22:19:38', '2020-01-14 02:22:27'),
(12, 3, 1, 'Stylish Sweater for Men', 750.00, 8, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010267.jpeg', 1, '2019-11-22 22:23:40', '2020-01-14 02:22:45'),
(13, 2, 2, 'Casual Top for Ladies', 1290.00, 2, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010566.jpeg', 1, '2019-11-22 22:24:39', '2020-01-14 02:22:09'),
(14, 4, 3, 'DELL G5 Core i7', 142000.00, 2, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010595.jpeg', 1, '2019-11-22 22:25:43', '2020-01-14 02:21:48'),
(15, 3, 2, 'Stylish T-shirt for Men', 300.00, 6, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010318.jpeg', 1, '2019-11-22 22:26:39', '2020-01-14 02:21:24'),
(24, 2, 4, 'Women-Multicolor Top', 1250.00, 5, 5, 'Short Description', 'Long Description', 'http://192.168.0.103/searching/uploads/pi_1579010647.jpg', 1, '2019-12-02 07:11:21', '2020-01-14 02:04:07'),
(25, 2, 4, 'Women-Nighty', 950.00, 6, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010688.jpg', 1, '2019-12-02 07:15:36', '2020-01-14 02:04:48'),
(26, 5, 4, 'Boy Casual Shoe', 650.00, 10, 4, 'This is short description', 'This is Long description', 'http://192.168.0.103/searching/uploads/pi_1579010732.jpg', 1, '2019-12-02 07:17:49', '2020-01-14 02:05:32'),
(27, 5, 4, 'Kids Socks', 580.00, 6, 3, 'This is short description', 'This is short description', 'http://192.168.0.103/searching/uploads/pi_1579010788.jpg', 1, '2019-12-02 07:19:13', '2020-01-14 02:06:28'),
(28, 2, 4, 'Cotton Embroidered Salwar', 1390.00, 4, 3, 'This is short description', 'This is short description', 'http://192.168.0.103/searching/uploads/pi_1579010834.jpg', 1, '2019-12-02 07:22:52', '2020-01-14 02:07:14'),
(29, 5, 4, 'Baby Frock', 790.00, 10, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010503.jpg', 1, '2020-01-04 22:10:37', '2020-01-14 02:01:43'),
(30, 2, 4, 'Womens Trops', 1099.00, 5, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579010463.jpg', 1, '2020-01-13 23:33:44', '2020-01-14 02:01:03'),
(31, 1, 1, 'T-Shirt for Man\'s', 890.00, 10, 2, 'Short Description', 'Long Description', 'http://192.168.0.103/searching/uploads/pi_1579010372.jpg', 1, '2020-01-13 23:39:01', '2020-01-14 01:59:32'),
(33, 5, 1, 'Baby\'s Dress', 520.00, 10, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579004119.jpg', 1, '2020-01-14 00:15:19', '2020-01-14 00:15:19'),
(34, 5, 1, 'Girl Casual shoe', 550.00, 5, 5, 'Short description', 'Long description', 'http://192.168.0.103/searching/uploads/pi_1579011172.jpg', 1, '2020-01-14 02:12:52', '2020-01-14 02:12:52'),
(35, 5, 1, 'Kid Bike', 1500.00, 5, 3, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579012074.jpg', 1, '2020-01-14 02:27:54', '2020-01-14 02:27:54'),
(37, 5, 2, 'Kid Frock', 2500.00, 5, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579012214.jpg', 1, '2020-01-13 20:27:54', '2020-01-13 20:27:54'),
(38, 5, 4, 'Kid Frock', 4500.00, 8, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579892214.jpg', 1, '2020-01-13 20:27:54', '2020-01-13 20:27:54'),
(39, 5, 1, 'Sneaker', 6500.00, 18, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579896514.jpg', 1, '2020-01-13 20:27:54', '2020-01-13 20:27:54'),
(40, 4, 5, 'Apple iPhone 8 Plus', 65000.00, 6, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1329896514.jpg', 1, '2020-01-13 20:27:54', '2020-01-13 20:27:54'),
(41, 4, 5, 'Apple iPad Pro', 95000.00, 4, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1329856514.jpg', 1, '2020-01-13 20:27:54', '2020-01-13 20:27:54'),
(42, 2, 1, 'Deshi Floral Saree', 1690.00, 4, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1579045025.jpeg', 1, '2019-11-22 16:16:26', '2020-01-13 20:23:21'),
(44, 3, 2, 'Winter Hoodie', 2750.00, 8, 2, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1969010267.jpeg', 1, '2019-11-22 16:23:40', '2020-01-13 20:22:45'),
(45, 3, 2, 'Hand Gloves', 275.00, 40, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1969230267.jpeg', 1, '2019-11-22 16:23:40', '2020-01-13 20:22:45'),
(46, 4, 3, 'samsung galaxy s10', 97000.00, 12, 4, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1235010179.jpeg', 1, '2019-11-22 16:18:24', '2020-01-13 20:23:03'),
(47, 4, 3, 'samsung galaxy s11', 107000.00, 4, 5, 'This is short description', 'This is long description', 'http://192.168.0.103/searching/uploads/pi_1235010177.jpeg', 1, '2019-11-22 16:18:24', '2020-01-13 20:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `id` int(255) NOT NULL,
  `status_name` varchar(128) NOT NULL,
  `publication_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`id`, `status_name`, `publication_status`) VALUES
(1, 'Normal', 1),
(2, 'Latest', 1),
(3, 'Popular', 1),
(4, 'Offer', 1),
(5, 'Featured', 1),
(6, 'Out of Stock', 1),
(7, 'Upcoming', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_view`
-- (See below for the actual view)
--
CREATE TABLE `product_view` (
`id` bigint(20) unsigned
,`category` varchar(255)
,`manufacturer` varchar(255)
,`name` varchar(255)
,`price` double(10,2)
,`quantity` int(11)
,`status` varchar(128)
,`short_dec` text
,`long_dec` text
,`image` text
);

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
-- Table structure for table `slider_images`
--

CREATE TABLE `slider_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_images`
--

INSERT INTO `slider_images` (`id`, `slider_image`, `publication_status`, `created_at`, `updated_at`) VALUES
(2, 'http://192.168.0.103/searching/slider/si_1580931161.jpg', 1, '2020-02-05 01:32:42', '2020-02-05 01:32:42'),
(4, 'http://192.168.0.103/searching/slider/si_1580932090.jpg', 1, '2020-02-05 01:48:11', '2020-02-05 01:48:11'),
(5, 'http://192.168.0.103/searching/slider/si_1580932120.jpg', 1, '2020-02-05 01:48:42', '2020-02-05 01:48:42'),
(6, 'http://192.168.0.103/searching/slider/si_1580932152.jpg', 0, '2020-02-05 01:49:13', '2020-02-09 00:39:27'),
(9, 'http://192.168.0.103/searching/slider/si_1580933630.jpg', 1, '2020-02-05 02:13:51', '2020-02-05 02:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `country`, `zip`) VALUES
(1, 'Plato Floydo', '424-5255', 'neque.vitae@purussapiengravida.ca', 'Canada', '60289'),
(2, 'Sawyer Gonzalez', '183-5014', 'Aliquam.rutrum@auctorvitaealiquet.edu', 'Northern Mariana Islands', '55373'),
(3, 'Zachary Schmidt', '331-1971', 'pharetra.ut@nisisem.ca', 'Paraguay', '07675-182'),
(4, 'Cyrus Mason', '762-9762', 'risus.at@arcuSed.ca', 'Dominican Republic', '32432'),
(5, 'Julian Houston', '761-8798', 'mauris.Suspendisse@semconsequatnec.com', 'Sierra Leone', '23498'),
(6, 'Kane Mcdowell', '707-4157', 'ac.feugiat@id.co.uk', 'Cyprus', '996879'),
(7, 'Isaac Fowler', '1-863-774-4301', 'neque.sed.sem@et.ca', 'Tuvalu', '2593'),
(8, 'Galvin Austin', '444-4604', 'iaculis@ridiculusmus.net', 'Cambodia', '9665'),
(9, 'Thor Cabrera', '202-5120', 'vestibulum.lorem@Donecnon.co.uk', 'Greece', '9206'),
(10, 'Kieran Foster', '1-708-317-3861', 'eget.dictum.placerat@Maurisvelturpis.co.uk', 'Chad', '12184-540'),
(11, 'Norman Stephens', '622-8554', 'commodo.hendrerit.Donec@montes.edu', 'Ukraine', '9027'),
(12, 'Ulric Richard', '304-8041', 'dapibus@velturpis.edu', 'Saint Vincent and The Grenadines', '51516'),
(13, 'Cyrus Lee', '1-522-635-3160', 'varius.et.euismod@Nulla.edu', 'Burkina Faso', '5729'),
(14, 'Lucas Acosta', '822-1931', 'primis.in@anteblanditviverra.org', 'Northern Mariana Islands', 'A9T 2X0'),
(15, 'Damian Gutierrez', '1-794-152-3131', 'mauris.Integer@molestiein.net', 'Marshall Islands', '40666'),
(16, 'Declan Gray', '843-5246', 'Sed.eu.eros@arcu.ca', 'Heard Island and Mcdonald Islands', 'V0J 0AN'),
(17, 'Trevor Koch', '1-557-742-5299', 'malesuada.ut.sem@euturpis.ca', 'Liechtenstein', '826527'),
(18, 'Odysseus Reese', '1-825-117-1197', 'quam.quis@etultricesposuere.com', 'Sierra Leone', '441358'),
(19, 'Thomas Willis', '1-181-779-7026', 'leo.in.lobortis@Aliquamgravida.ca', 'Nigeria', '6883'),
(20, 'Gary Mercado', '755-8929', 'mi.felis.adipiscing@nibhsitamet.ca', 'Pitcairn Islands', 'P4E 3T7'),
(21, 'Roth Carver', '1-700-665-3529', 'mollis@pedenecante.com', 'Cambodia', '9656'),
(22, 'Ryan Ashley', '454-8350', 'placerat.orci.lacus@Fuscealiquetmagna.net', 'Niger', '86406'),
(23, 'Quentin Berger', '1-444-597-1147', 'tincidunt@urnanecluctus.edu', 'Kuwait', '72748'),
(24, 'Griffin Cervantes', '1-280-743-6194', 'sit.amet.consectetuer@utpellentesque.com', 'Turks and Caicos Islands', '14661-170'),
(25, 'Cade Mckee', '596-4158', 'Mauris.vel@arcu.ca', 'Burkina Faso', '66504'),
(26, 'Martin Erickson', '1-143-240-1529', 'nisi.a@esttempor.net', 'Philippines', '78677'),
(27, 'Tanner Hale', '1-275-631-0515', 'risus.varius@convalliserat.com', 'Nauru', 'A8Y 5ZA'),
(28, 'Dillon Levine', '1-421-552-9790', 'Aenean.euismod@ipsumnon.co.uk', 'Hong Kong', '48936'),
(29, 'Bevis West', '342-9346', 'Quisque.varius.Nam@nuncsitamet.ca', 'Nigeria', '80-002'),
(30, 'Giacomo Hensley', '1-825-752-1251', 'Integer@justonec.ca', 'Timor-Leste', '09-228'),
(31, 'Palmer Gross', '279-1643', 'tincidunt@Pellentesque.net', 'Mauritius', '6804'),
(32, 'Castor Vance', '534-0954', 'amet.dapibus@massarutrummagna.co.uk', 'Belarus', '102236'),
(33, 'Warren Case', '724-8695', 'Nunc.lectus@vulputate.edu', 'Samoa', 'EM98 3HS'),
(34, 'Dalton Tillman', '1-363-183-2965', 'leo.Vivamus.nibh@Fusce.net', 'Mayotte', '841215'),
(35, 'Hu Clayton', '1-103-448-8707', 'et.euismod@at.org', 'Gibraltar', '31779-698'),
(36, 'Sylvester Nolan', '766-0405', 'Proin.velit@sagittissemperNam.com', 'Montenegro', '953376'),
(37, 'Harper Palmer', '795-4129', 'Nunc.sed@faucibus.ca', 'Saudi Arabia', '13926'),
(38, 'Zeph Washington', '1-438-421-1183', 'pretium.neque.Morbi@Nulla.org', 'Latvia', '92951'),
(39, 'Julian Neal', '667-3837', 'Nunc@diamvel.net', 'Congo, the Democratic Republic of the', '48047-942'),
(40, 'Hiram Newton', '338-0419', 'primis.in@sedorcilobortis.com', 'Kuwait', '669913'),
(41, 'August Banks', '896-1889', 'odio.Etiam@urna.org', 'Tajikistan', 'WE0 4UA'),
(42, 'Basil Garrison', '1-913-485-7917', 'elit@enimsit.edu', 'Congo (Brazzaville)', '81-919'),
(43, 'Buckminster Nelson', '1-435-773-9781', 'quis.turpis.vitae@adipiscing.com', 'Mayotte', '37338-489'),
(44, 'Lane Benjamin', '1-795-272-6414', 'aliquam@semper.net', 'Cuba', '3455'),
(45, 'Burke Gordon', '838-7357', 'ac@vulputateduinec.net', 'Fiji', '70556'),
(46, 'Logan Harris', '1-104-716-4832', 'gravida@Curabituregestas.edu', 'Bosnia and Herzegovina', '9658'),
(47, 'Barry Hansen', '1-111-784-9890', 'Donec.dignissim@ornarelectus.org', 'Mozambique', 'M3T 1N0'),
(48, 'Jared Mckenzie', '885-7853', 'ante.dictum@duiFusce.edu', 'Jersey', '3153'),
(49, 'Timon Bruce', '506-1261', 'neque.pellentesque@quistristiqueac.edu', 'American Samoa', '25504'),
(50, 'Jordan Gross', '131-9063', 'Proin.vel.arcu@felispurus.net', 'French Polynesia', '6990'),
(51, 'Rudyard Sparks', '787-9775', 'montes@maurisid.com', 'Marshall Islands', '13-862'),
(52, 'Abraham Wong', '1-750-246-8977', 'orci.Phasellus.dapibus@Proin.org', 'Turks and Caicos Islands', '85448'),
(53, 'Barrett Glenn', '655-7453', 'suscipit@nunc.ca', 'Kiribati', '9037'),
(54, 'Ciaran Snyder', '1-452-437-0003', 'ipsum@turpisAliquam.edu', 'Norway', '264951'),
(55, 'Carl Golden', '599-2392', 'Aliquam@atsem.co.uk', 'Israel', '167781'),
(56, 'Leroy Pollard', '579-7085', 'Etiam@loremipsumsodales.com', 'Sri Lanka', '3902'),
(57, 'Garth Burch', '1-886-597-2383', 'est.congue@Namconsequat.com', 'Tunisia', 'N00 2KB'),
(58, 'Lane Huff', '447-5237', 'malesuada.vel.venenatis@dolorDonec.co.uk', 'Argentina', '7100'),
(59, 'Gray Kirkland', '517-1816', 'et.eros.Proin@nonantebibendum.com', 'Guinea', '97251'),
(60, 'Bert Forbes', '800-5787', 'adipiscing@gravida.com', 'Mauritania', '39919'),
(61, 'Elvis Jenkins', '1-949-995-1788', 'arcu.Vivamus@aliquetvel.ca', 'Guyana', '03474'),
(62, 'Mark Knox', '773-7852', 'leo.Vivamus.nibh@arcuVestibulumut.net', 'Slovakia', '9852'),
(63, 'Lance Colon', '331-4761', 'congue@ipsumporta.org', 'Curaçao', '5572'),
(64, 'Vladimir Hansen', '1-123-468-5848', 'et.commodo@torquentperconubia.co.uk', 'Djibouti', '8508'),
(65, 'Wade Barton', '123-2351', 'nibh@DuisgravidaPraesent.co.uk', 'American Samoa', '11466'),
(66, 'Dante Molina', '494-2513', 'consectetuer.adipiscing@ipsumdolorsit.co.uk', 'Saint Barthélemy', 'X2J 1X6'),
(67, 'Charles Hudson', '957-7461', 'tempor@turpisnonenim.edu', 'Turkmenistan', '82193-669'),
(68, 'Elton Kane', '534-4250', 'Sed@luctusutpellentesque.co.uk', 'Netherlands', '5535ZX'),
(69, 'Abel Frank', '344-9871', 'posuere.vulputate.lacus@etmagnis.com', 'French Southern Territories', '113411'),
(70, 'Garrett Aguilar', '1-252-893-4375', 'aliquet.odio.Etiam@nibhdolornonummy.ca', 'Malta', '1182'),
(71, 'Lester Hendricks', '491-8905', 'mauris@ategestas.edu', 'Mauritius', '20912'),
(72, 'Elmo Franks', '1-593-219-5069', 'Sed.eu.nibh@venenatislacusEtiam.com', 'Holy See (Vatican City State)', '84765-876'),
(73, 'Randall Anderson', '1-602-518-6198', 'Mauris.vestibulum@sapien.ca', 'Mexico', '72961'),
(74, 'Jackson Buckley', '1-908-884-2334', 'dui.Cum.sociis@nonleoVivamus.edu', 'Mexico', '66477'),
(75, 'George Mercado', '144-2643', 'non.lacinia@sitamet.com', 'Cape Verde', '8663'),
(76, 'Prescott Bradley', '200-8182', 'a.odio@inconsectetuer.edu', 'Ethiopia', '42333'),
(77, 'Wallace Downs', '1-262-102-0510', 'odio.auctor@ornare.edu', 'Timor-Leste', '03929'),
(78, 'Vladimir Mcintosh', '1-471-906-1160', 'eget.massa@enimgravida.org', 'Taiwan', '786091'),
(79, 'Dennis Hull', '934-9410', 'Mauris.non.dui@leo.ca', 'Bahamas', '78700'),
(80, 'Keefe Short', '1-359-116-9849', 'fermentum.vel.mauris@Phasellusvitaemauris.org', 'South Sudan', '31311'),
(81, 'Xanthus Hampton', '1-903-542-7529', 'Sed@Etiam.com', 'Kazakhstan', 'K7B 7C5'),
(82, 'Gregory Bishop', '1-753-226-0863', 'magnis@Sedeget.com', 'Macedonia', '1712'),
(83, 'Basil Acosta', '1-910-135-7994', 'enim.diam.vel@purusactellus.net', 'United States', '1110'),
(84, 'Griffith Weiss', '487-9532', 'ante@rhoncusNullam.com', 'Bosnia and Herzegovina', '01190'),
(85, 'Nash Mcdowell', '781-6160', 'commodo@ante.ca', 'Guernsey', '57521'),
(86, 'Phelan Gilbert', '318-3186', 'natoque.penatibus.et@fames.com', 'Malaysia', '61754'),
(87, 'Devin Gregory', '1-780-473-6239', 'sed.hendrerit@bibendumDonecfelis.edu', 'Virgin Islands, United States', '12819'),
(88, 'Jelani Marquez', '1-756-676-2511', 'leo@mollis.ca', 'New Caledonia', '8982'),
(89, 'Kadeem Harper', '1-297-495-5859', 'sapien@enimEtiamimperdiet.net', 'Guernsey', '8494'),
(90, 'Shad Tyson', '1-717-517-3785', 'mauris@duiCum.net', 'Saint Helena, Ascension and Tristan da Cunha', '70985'),
(91, 'Nigel Cole', '110-3887', 'aliquet.odio.Etiam@dictumeu.net', 'Costa Rica', '39263'),
(92, 'Jerry Short', '1-984-981-6766', 'Nam@sitametconsectetuer.ca', 'Jersey', '2081'),
(93, 'Josiah Chase', '1-841-505-3651', 'Aenean.massa.Integer@in.net', 'Sri Lanka', '7863'),
(94, 'Chaim Alvarado', '1-372-952-3359', 'ultricies@varius.net', 'Sri Lanka', '99065'),
(95, 'Victor Manning', '122-4169', 'est.Mauris@blandit.ca', 'Singapore', '2053'),
(96, 'Caldwell Marks', '1-619-957-9122', 'a.nunc@amet.com', 'Panama', '958394'),
(97, 'Burke Colon', '1-412-420-3269', 'lacus.vestibulum.lorem@euelit.co.uk', 'South Africa', '3171'),
(98, 'Keane Molina', '1-637-251-4552', 'adipiscing.Mauris@dolornonummy.org', 'Iraq', '668109'),
(99, 'Theodore Hutchinson', '1-159-902-4323', 'id@dignissimmagna.edu', 'Saint Martin', '41347'),
(100, 'Griffin Gates', '1-740-323-5296', 'imperdiet.nec@Donec.net', 'Thailand', '51016'),
(107, 'Haerul Muttaqins', NULL, 'haerul@mail.com', NULL, NULL),
(108, 'testing', '0188015465', 'test@mail.com', 'bd', '1205'),
(109, 'again', '0189454564', 'again@gmail.com', 'bd', '1204');

-- --------------------------------------------------------

--
-- Structure for view `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view`  AS  select `products`.`id` AS `id`,`categories`.`category_name` AS `category`,`manufacturers`.`manufacturer_name` AS `manufacturer`,`products`.`product_name` AS `name`,`products`.`product_price` AS `price`,`products`.`product_quantity` AS `quantity`,`product_status`.`status_name` AS `status`,`products`.`short_description` AS `short_dec`,`products`.`long_description` AS `long_dec`,`products`.`product_image` AS `image` from (((`manufacturers` join `products` on(`manufacturers`.`id` = `products`.`manufacturer_id`)) join `categories` on(`categories`.`id` = `products`.`category_id`)) join `product_status` on(`product_status`.`id` = `products`.`status_id`)) ;

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_images`
--
ALTER TABLE `slider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
