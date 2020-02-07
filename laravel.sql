-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2020 at 05:24 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_photo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `code`, `identity_photo`, `created_at`, `updated_at`) VALUES
(7, 'Customer_1579500670', 'IDENTITY_1580360384.png', '2020-01-19 22:11:38', '2020-01-29 20:59:44'),
(9, 'Customer_1579501062', 'default.jpg', '2020-01-19 22:17:42', '2020-01-19 22:17:42'),
(10, 'Customer_1579678677', 'default.jpg', '2020-01-21 23:37:57', '2020-01-21 23:37:57'),
(11, 'Customer_1580023902', 'default.jpg', '2020-01-25 23:31:42', '2020-01-25 23:31:42'),
(12, 'Customer_1580024718', 'default.jpg', '2020-01-25 23:45:18', '2020-01-25 23:45:18'),
(13, 'Customer_1580025579', 'IDENTITY_1580364180.png', '2020-01-25 23:59:39', '2020-01-29 22:03:00'),
(14, 'Customer_1580025603', 'default.jpg', '2020-01-26 00:00:03', '2020-01-26 00:00:03'),
(15, 'Customer_1580184408', 'default.jpg', '2020-01-27 20:07:02', '2020-01-27 20:07:02'),
(16, 'Customer_1580370979', 'IDENTITY_1580371100.png', '2020-01-29 23:56:19', '2020-01-29 23:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `code`, `created_at`, `updated_at`) VALUES
(5, 'Driver_1579501076', '2020-01-19 22:18:51', '2020-01-19 22:18:51'),
(6, 'Driver_1579501202', '2020-01-19 22:20:02', '2020-01-19 22:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `list_id` varchar(200) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(4) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_id`, `name`, `link`, `list_id`, `icon`, `status`, `position`, `description`) VALUES
(16, 1, 'Beranda', 's-admin', 's-admin', 'home', 1, 1, '-'),
(21, 1, 'Menus', 'menus', 'menus', 'bars', 1, 1, '-'),
(22, 1, 'Role', 'roles', 'roles', 'user', 1, 1, '-'),
(23, 1, 'Users', 'users', 'users', 'users', 1, 1, '-'),
(24, 2, 'Beranda', 'home', 'home', 'home', 1, 0, 'Beranda'),
(25, 2, 'Users', 'users', 'users', 'users', 0, 100, 'users'),
(26, 2, 'Price List', 'pricelists', 'pricelists', 'credit-card', 1, 0, 'pricelist'),
(27, 2, 'Customer', 'customers', 'customers', 'users', 1, 1, 'customers'),
(28, 2, 'Driver', 'drivers', 'drivers', 'users', 1, 1, 'drivers'),
(29, 2, 'LAPORAN', 'header', 'home', 'home', 1, 1, 'LAPORAN'),
(30, 2, 'Kas Keluar', 'outcome', 'outcome', 'share-square', 1, 3, 'outcome'),
(31, 2, 'Penjualan', 'selling', 'selling', 'shopping-cart', 1, 1, 'selling'),
(32, 2, 'Daftar Pembayaran', 'invoice', 'invoice', 'file', 1, 1, 'invoice'),
(33, 14, 'Beranda', 'home', 'home', 'home', 1, 1, 'home'),
(34, 14, 'Penjemputan', 'requests', 'requests', 'truck', 0, 1, 'requests'),
(35, 14, 'Penjemputan Sampah', 'pickups', 'pickups', 'truck', 1, 1, 'pickups'),
(36, 13, 'Beranda', 'home', 'home', 'home', 1, 1, 'home'),
(37, 13, 'Request Penjemputan', 'requests', 'requests', 'truck', 1, 1, 'requests'),
(38, 13, 'Penjemputan di Terima', 'pickups', 'pickups', 'truck', 1, 1, 'pickups'),
(39, 13, 'Mutasi', 'mutations', 'mutations', 'credit-card', 1, 1, 'mutations'),
(40, 14, 'Transaksi', 'transactions', 'transactions', 'credit-card', 1, 1, 'transactions'),
(41, 2, 'Penjemputan', 'requests', 'reque', 'truck', 1, 0, 'truck'),
(42, 41, 'Request Masuk', 'requests', 'requests', 'truck', 1, 1, 'requests'),
(43, 41, 'Request Diproses', 'pickups', 'pickups', 'truck', 1, 1, '-');

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
(61, '2014_10_12_000000_create_users_table', 1),
(62, '2014_10_12_100000_create_password_resets_table', 1),
(63, '2020_01_07_171747_create_roles_table', 1),
(64, '2020_01_07_171850_create_user_roles_table', 1),
(65, '2020_01_09_025853_create_menus_table', 2),
(66, '2020_01_11_160655_create_price_lists_table', 2),
(67, '2020_01_14_055213_create_pick_ups_table', 3),
(68, '2020_01_14_122148_create_customers_table', 3),
(69, '2020_01_14_122335_create_drivers_table', 3),
(70, '2020_01_14_130918_create_requests_table', 3),
(71, '2020_01_17_054513_create_transactions_table', 4),
(72, '2020_01_17_055152_create_mutations_table', 4),
(73, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(74, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(75, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(76, '2016_06_01_000004_create_oauth_clients_table', 5),
(77, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mutations`
--

CREATE TABLE `mutations` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `nominal` double NOT NULL,
  `position` tinyint(4) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutations`
--

INSERT INTO `mutations` (`id`, `customer_id`, `transaction_id`, `nominal`, `position`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 20000, 1, 'transaction to customer 1579011827: plastik,1000,kg,qty:20driver:Alfalah', '2020-01-16 16:00:00', '2020-01-16 23:16:16'),
(2, 2, 2, 15000, 1, 'transaction to customer 1579011827: Besi,5000,kg,qty:3driver:Alfalah', '2020-01-16 16:00:00', '2020-01-16 23:16:16'),
(3, 2, 3, 4000, 1, 'transaction to customer 1579011827: plastik,1000,kg,qty:4driver:Alfalah', '2020-01-16 16:00:00', '2020-01-16 23:16:16'),
(4, 2, 4, 20000, 1, 'transaction to customer 1579011827: plastik,1000,kg,qty:20driver:Alfalah', '2020-01-17 16:00:00', '2020-01-18 00:29:57'),
(5, 3, 0, 0, 1, '-', NULL, NULL),
(7, 6, 0, 0, 1, 'initial', '2020-01-18 16:00:00', '2020-01-19 01:37:44'),
(8, 2, 0, 5000, 2, 'withdrawal to customer 1579011827', '2020-01-18 16:00:00', '2020-01-19 08:25:15'),
(9, 2, 0, 30000, 2, 'withdrawal to customer 1579011827', '2020-01-18 16:00:00', '2020-01-19 08:39:45'),
(10, 2, 0, 500, 2, 'withdrawal to customer 1579011827', '2020-01-18 16:00:00', '2020-01-19 08:52:27'),
(11, 7, 0, 0, 1, 'initial', '2020-01-19 16:00:00', '2020-01-19 22:11:38'),
(12, 9, 0, 0, 1, 'initial', '2020-01-19 16:00:00', '2020-01-19 22:17:42'),
(13, 7, 5, 4000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:4driver:c alin', '2020-01-19 16:00:00', '2020-01-19 22:39:04'),
(14, 7, 6, 15000, 1, 'transaction to customer Customer_1579500670: Besi,5000,kg,qty:3driver:c alin', '2020-01-19 16:00:00', '2020-01-19 22:39:04'),
(15, 7, 0, 1000, 2, 'withdrawal to customer Customer_1579500670', '2020-01-19 16:00:00', '2020-01-19 22:41:27'),
(16, 7, 7, 120000, 1, 'transaction to customer Customer_1579500670: Kardus,4000,kg,qty:30driver:c alin', '2020-01-19 16:00:00', '2020-01-20 06:38:27'),
(17, 7, 8, 250000, 1, 'transaction to customer Customer_1579500670: Besi,5000,kg,qty:50driver:c alin', '2020-01-19 16:00:00', '2020-01-20 06:38:27'),
(18, 7, 0, 50000, 2, 'withdrawal to customer Customer_1579500670', '2020-01-19 16:00:00', '2020-01-20 06:41:04'),
(19, 7, 9, 5000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:5driver:c alin', '2020-01-20 16:00:00', '2020-01-21 08:52:26'),
(20, 7, 10, 240000, 1, 'transaction to customer Customer_1579500670: Kardus,4000,kg,qty:60driver:c alin', '2020-01-20 16:00:00', '2020-01-21 09:06:25'),
(21, 7, 0, 500000, 2, 'withdrawal to customer Customer_1579500670', '2020-01-20 16:00:00', '2020-01-21 09:12:13'),
(22, 10, 0, 0, 1, 'initial', '2020-01-21 16:00:00', '2020-01-21 23:37:58'),
(23, 7, 11, 3000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:3driver:c alin', '2020-01-22 16:00:00', '2020-01-23 07:03:53'),
(24, 7, 12, 20000, 1, 'transaction to customer Customer_1579500670: Besi,5000,kg,qty:4driver:c alin', '2020-01-22 16:00:00', '2020-01-23 07:03:53'),
(25, 7, 13, 3000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:3driver:c alin', '2020-01-22 16:00:00', '2020-01-23 07:07:01'),
(26, 7, 14, 20000, 1, 'transaction to customer Customer_1579500670: Besi,5000,kg,qty:4driver:c alin', '2020-01-22 16:00:00', '2020-01-23 07:07:01'),
(27, 11, 0, 0, 1, 'initial', '2020-01-25 16:00:00', '2020-01-25 23:31:42'),
(28, 12, 0, 0, 1, 'initial', '2020-01-25 16:00:00', '2020-01-25 23:45:18'),
(29, 13, 0, 0, 1, 'initial', '2020-01-25 16:00:00', '2020-01-25 23:59:39'),
(30, 14, 0, 0, 1, 'initial', '2020-01-25 16:00:00', '2020-01-26 00:00:03'),
(31, 7, 15, 50000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:50driver:d alin', '2020-01-26 16:00:00', '2020-01-27 06:07:45'),
(32, 7, 0, 100000, 2, 'withdrawal to customer Customer_1579500670', '2020-01-26 16:00:00', '2020-01-27 06:40:32'),
(33, 15, 0, 0, 1, 'initial', '2020-01-27 16:00:00', '2020-01-27 20:07:02'),
(34, 16, 0, 0, 1, 'initial', '2020-01-29 23:56:19', '2020-01-29 23:56:19'),
(35, 7, 16, 3000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:3driver:c alin', '2020-01-31 04:10:46', '2020-01-31 04:10:46'),
(36, 7, 17, 5000, 1, 'transaction to customer Customer_1579500670: Besi,5000,kg,qty:1driver:c alin', '2020-01-31 04:10:46', '2020-01-31 04:10:46'),
(37, 7, 18, 2000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:2driver:c alin', '2020-01-31 05:11:28', '2020-01-31 05:11:28'),
(38, 13, 19, 15000, 1, 'transaction to customer Customer_1580025579: Besi,5000,kg,qty:3driver:c alin', '2020-01-31 05:11:40', '2020-01-31 05:11:40'),
(39, 7, 20, 10000, 1, 'transaction to customer Customer_1579500670: plastik,1000,kg,qty:10driver:c alin', '2020-01-31 07:24:27', '2020-01-31 07:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06c428488a658c89140b098663fe1c4082acf78b6ae24ecf14f8b7f71f9912f075847a1a37b0f76c', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-30 09:18:25', '2020-01-30 09:18:25', '2021-01-30 17:18:25'),
('081f86630aa326ecd3c899e9d9d9f6f3ff8dfdfa2c7adf64e94662bcf0c9ff151ac9a3ecdf1139d5', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-29 21:53:45', '2020-01-29 21:53:45', '2021-01-30 05:53:45'),
('086e9be785c2120f7906c4a24e2dcd20126819d0f6166e71e31306d9f9da04d31dd020534dbc46ee', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-26 00:20:35', '2020-01-26 00:20:35', '2021-01-26 08:20:35'),
('09bde23622cdc04f8515686d58d472f55a0b8c1ce43c0c2d686aa34abdf1873ed97bb23b931d0531', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 05:13:27', '2020-01-25 05:13:27', '2021-01-25 13:13:27'),
('14362357742075bcf0b434d5054040ff8c7f2ca6aa4a21ca6960f1b9c24a2d4d4d388e8c5c24f62e', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 10:07:27', '2020-01-25 10:07:27', '2021-01-25 18:07:27'),
('1492299dbe9a47503c99ba3fa89c00ca81c337fc2d7136f7e8c18b646064fa82ea0a824012fcfcf3', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-27 06:33:44', '2020-01-27 06:33:44', '2021-01-27 14:33:44'),
('16662620af8d0038aaee2730a791ce653c18df84e05ad289d6defeb1654c99668caf90c09ff87284', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-28 03:14:45', '2020-01-28 03:14:45', '2021-01-28 11:14:45'),
('1b217045c590367a4f56154cbfc00545ec7e48c5d85c1f16c62d693bcb62aa3dcee8ecdde72142d5', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-23 07:25:29', '2020-01-23 07:25:29', '2021-01-23 15:25:29'),
('1fe8f3ea79f50fc5147049077a05d676488411808338a9fa67acb277a47a6030a573735fb9a38284', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:19:21', '2020-01-25 04:19:21', '2021-01-25 12:19:21'),
('20696d709c020a6dc31e4bf5dc07e6e7d6cbd565d69323e3af2f3b2fb540d9657a087ea39ba2fcf4', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 23:50:42', '2020-01-25 23:50:42', '2021-01-26 07:50:42'),
('23f15d6c158c13d02b96941dec8b3024cc6ca42d372c99aa260a8bec2811a667d33a4fcda3a5076f', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-31 04:49:13', '2020-01-31 04:49:13', '2021-01-31 12:49:13'),
('27882074645779f1e5ead6f29b0efb15dfc3c77318b3e01465f81d82ddad60319472f9f34af4183f', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-23 00:37:41', '2020-01-23 00:37:41', '2021-01-23 08:37:41'),
('27fabc5dc4e7be1701e1562b325995b161e690052f42fc29dfdb7453f337837140902be9cde2fe24', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 21:04:43', '2020-01-29 21:04:43', '2021-01-30 05:04:43'),
('2b025be5ae8f30268208ff5e792f18fc75d96bcb25786965980ab3a63df62ecfed02df2e2fae4f09', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-27 06:14:39', '2020-01-27 06:14:39', '2021-01-27 14:14:39'),
('2c2209ff32914085284d7282772120c5308cf20aaee9d475f39c1dd161dd4403c4096fb64b31a948', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-31 07:16:00', '2020-01-31 07:16:00', '2021-01-31 15:16:00'),
('2ce48e7938af84895e28e7bf240f4f4af5868198cc483c864cd35d07a14013ff72654341a2fb25a5', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-29 22:50:58', '2020-01-29 22:50:58', '2021-01-30 06:50:58'),
('309b7f649f8cfe5a6b0f7651b8c4adf45a2f98ea1ad18ac39bbdc33ad2b73f1a9fc00a83d226d66e', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-30 00:04:29', '2020-01-30 00:04:29', '2021-01-30 08:04:29'),
('3248a97ad04da9f27daa5e4128cb8219496fb389b2fc853beb560fa048bec6e13bde4b1015a26b39', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 04:02:57', '2020-01-29 04:02:57', '2021-01-29 12:02:57'),
('32b2127a96c077989abfe3f2b089a99814c102a8e10851c7ed79d95095c798d6b3080fd4cefa1084', 42, 1, 'YABO_BANK', '[]', 0, '2020-01-25 23:45:18', '2020-01-25 23:45:18', '2021-01-26 07:45:18'),
('3891d17bbc8350a36536ca9549b7b24c945ad2f87902fcc154c7344e9a5c2f12777ca68de70ccc9f', 45, 1, 'YABO_BANK', '[]', 0, '2020-01-30 00:05:16', '2020-01-30 00:05:16', '2021-01-30 08:05:16'),
('3a5892679f85fffa17c425317856982b4933b41d2810b09e21b9fdeb7de64f3e9bb4892d68dd3c20', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-25 23:59:40', '2020-01-25 23:59:40', '2021-01-26 07:59:40'),
('49914c1967fdc8ef26de9b3d181d739dba73c561b688087db73d1da6d8b1a727eb89d79d1735a151', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-23 00:22:50', '2020-01-23 00:22:50', '2021-01-23 08:22:50'),
('5067781a622d7b3c0f7f58195ef09694fab7735cee327247bee0c38a6aa53f04c791c0aa32fd7d20', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-31 04:06:21', '2020-01-31 04:06:21', '2021-01-31 12:06:21'),
('55c07a487fa634f40c84820976a09f85314f3cad57d71d90c61d6a1f994b0ae38b3320bbe18e888a', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-29 20:04:10', '2020-01-29 20:04:10', '2021-01-30 04:04:10'),
('586ca2ca8f3b702803cca3f2d5c357f289ca1d10e3034b8c54447c232261d474db42659a13dcf4f5', 44, 1, 'YABO_BANK', '[]', 0, '2020-01-26 00:00:03', '2020-01-26 00:00:03', '2021-01-26 08:00:03'),
('58c00bf743cbb457e63056a15e43abeaa0bdd5778fc9119fde5bb57fb3812be2ed9e572244934d1b', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-23 06:55:23', '2020-01-23 06:55:23', '2021-01-23 14:55:23'),
('5ced80668e7f93bd7e6818b27c4f2169debb8e70c397ab004937078cc21a442fd3c2d891eb5f55cf', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 05:30:50', '2020-01-29 05:30:50', '2021-01-29 13:30:50'),
('5d7c5aa05b6c676f4bbb0d2512f1ccbce631dce5fe36ff714ac7f0a78cadd78bde4e3198b571d32a', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-29 21:04:24', '2020-01-29 21:04:24', '2021-01-30 05:04:24'),
('5e81f433223758e08e072613e115fd8449ce4a1c5034c7e064a55a2d126344849c8f99700745015d', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-30 08:38:54', '2020-01-30 08:38:54', '2021-01-30 16:38:54'),
('6588478869941d23d4374cbc6782af91a3118f059520f88b932f8971c45147ce48884d976ca27464', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 23:59:53', '2020-01-29 23:59:53', '2021-01-30 07:59:53'),
('6b751e768274ffd212bf3875884eee2c21fdcbf31fdfe34e4f1738078294ee0fdc8d6035e3525de4', 43, 1, 'YABO_BANK', '[]', 0, '2020-01-29 23:40:15', '2020-01-29 23:40:15', '2021-01-30 07:40:15'),
('6d08587e11c296a2e001e2b90a97756b3ea101cb253fb2dede6da05e09058c5f0907d37f8ada86db', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-29 21:41:53', '2020-01-29 21:41:53', '2021-01-30 05:41:53'),
('72bd6bf14e7cb9bfcb55b7b89cdf7bf23e2ecc0e02bbd5c38475463bc7f2e6861491b05ce27e0bee', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-25 10:17:02', '2020-01-25 10:17:02', '2021-01-25 18:17:02'),
('78cc901daa511e8927f476eeb3aad72347280df5d9b6e15462e74f61ca4b5e40fd5ff60832d74515', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-27 06:15:52', '2020-01-27 06:15:52', '2021-01-27 14:15:52'),
('7f1550baabee3228ab0c418485993be0759b57bb205b613c135b8d274a338a50cf0147dbdfaa0690', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:14:06', '2020-01-25 04:14:06', '2021-01-25 12:14:06'),
('84647e62f01f9cf35311a284aecfb671e8612c3cdd4bddd0a7e30260d13cc93123cc3f0390d31545', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 03:28:59', '2020-01-25 03:28:59', '2021-01-25 11:28:59'),
('84df74a4f5acaffbcc8237f7d7e063be5353d051fe7722b55b265613ed2ae2fea000f5b1e1cf6789', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-29 03:23:48', '2020-01-29 03:23:48', '2021-01-29 11:23:48'),
('876e4b5dc318e2d1281abfdbd83ee4180c7423b173da424948ba78abcffc73be665cd7c955f27fa3', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-23 05:09:54', '2020-01-23 05:09:54', '2021-01-23 13:09:54'),
('8bff8c0d86fd984aed6bf462b8745fa3e9b361e2671a0380d72f89cb7b8f66efc291b648d4868d28', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:11:22', '2020-01-25 04:11:22', '2021-01-25 12:11:22'),
('8fd3641a9d2089ffa97e81b29cb65d2dc39b36c656dba08a9f21d1899b3a4dcde31fd9a617b3b4f7', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 05:40:07', '2020-01-25 05:40:07', '2021-01-25 13:40:07'),
('90e32d80f40fdbe0b615aa10bad9cfeecc9a544654904a3124e2f77572ffee41fe3f247897369254', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:22:34', '2020-01-25 04:22:34', '2021-01-25 12:22:34'),
('95431d7dfa8cb82f3903947857a0d9781b62b210e00a2f78dd3d606c233468cc2828fee078106387', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-25 10:18:03', '2020-01-25 10:18:03', '2021-01-25 18:18:03'),
('969a872d1f24dc0fc590b323c2022225ab4b48a474e88019b66ab5ed57493da46b9a12eee8b8c63d', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-26 06:09:20', '2020-01-26 06:09:20', '2021-01-26 14:09:20'),
('9a5ea65540aff00f90150a295e2de86c0ee11529d20fd41e1dd1893670ebaaa5fc9b2a68e5ed5bd7', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:31:15', '2020-01-25 04:31:15', '2021-01-25 12:31:15'),
('9b38b6fed0f657d9a820011b3e38e3c6b38e09c148ff26142f486ed34acfae96283edc005ccff2c0', 43, 1, 'YABO_BANK', '[]', 0, '2020-01-26 00:26:38', '2020-01-26 00:26:38', '2021-01-26 08:26:38'),
('a5d7672431920921a25fdfd9313da42eacdc6a872228f9fc3a58cdc870e5b805f97c7dfefd9f0656', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-29 23:54:57', '2020-01-29 23:54:57', '2021-01-30 07:54:57'),
('a5d7d9d897c9fa8a5863b41e825deceb09200b7f0342e12a83e831cbbe2eb0682fdd88dc8e547990', 41, 1, 'YABO_BANK', '[]', 0, '2020-01-25 23:31:43', '2020-01-25 23:31:43', '2021-01-26 07:31:43'),
('a7eecabec60163b455e1b9adb095293403671c9eaa07119dedb9edb5287d1f814e983c308c41533e', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-26 00:23:11', '2020-01-26 00:23:11', '2021-01-26 08:23:11'),
('a89a13bfb12c9b13840aea60aacc7fe33915dc2e234898e1c3f97dcdf6c81b8633435caa6f1bc4bd', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-27 06:04:00', '2020-01-27 06:04:00', '2021-01-27 14:04:00'),
('af6b629fa23d5c188811b8fd7ee65f1744ac2853aae2a301f5387c431a3285d0de479d774766eb79', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-26 05:31:43', '2020-01-26 05:31:43', '2021-01-26 13:31:43'),
('af8253624d5dd138aa3e5114943fc7d7033f5512a107c24d1a59e5c28dc45d29bae8c2433871b3a8', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-23 01:10:53', '2020-01-23 01:10:53', '2021-01-23 09:10:53'),
('b068b96046ed1978a6aa45f84a497268bfeeb42d0fda14aecdaed8f5747486042859de05e598ff78', 45, 1, 'YABO_BANK', '[]', 1, '2020-01-29 23:56:20', '2020-01-29 23:56:20', '2021-01-30 07:56:20'),
('b2a17d112c88d047d4e0013b167ddf12e81b2a703ce692de5e345c824b10a31b9abdab84f9cdec55', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:24:04', '2020-01-25 04:24:04', '2021-01-25 12:24:04'),
('b4c29a4bafb14f4a3b96a78ab239250a00fb3f2b067fd8b57234b13edc167e1ca426d18000e90696', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-25 23:45:02', '2020-01-25 23:45:02', '2021-01-26 07:45:02'),
('b51011d763c489e167e5599b1d0d229dd48d3e16de9c7d808b9959a931c03ff0a9ed54f82a540fd4', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 05:24:41', '2020-01-29 05:24:41', '2021-01-29 13:24:41'),
('b663588c5e275845880bdd9e854d180cb7fb4eb3cdea4f275d44fe92d41de78461291424c4276c1d', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:34:04', '2020-01-25 04:34:04', '2021-01-25 12:34:04'),
('bb4977d75b5180969ffd7cc903860c6382343d9cbfcc94168dbd47777af8ad3bc652fb08b30714dd', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:12:31', '2020-01-25 04:12:31', '2021-01-25 12:12:31'),
('bde8f69a53875ed145a0ead26c817222326b935973558d2d2fadcd932eed4bf15037291c2b625408', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-30 21:12:40', '2020-01-30 21:12:40', '2021-01-31 05:12:40'),
('c25fac14b78f77fed2350d0a458b7276b49bad24fb7437ff0f9ccd72445fffc2a18ff3c4c06c157d', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 05:18:14', '2020-01-29 05:18:14', '2021-01-29 13:18:14'),
('c2c7890395b6e67314fdb27f83cbebba0c4f80b9a8f65c8194ca5b37ac0056279552f6e9cc6d6752', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-25 10:21:09', '2020-01-25 10:21:09', '2021-01-25 18:21:09'),
('c337628dd95eee39a305b460e98bb9670f866bdc0de16d2c52136ce2e82e5e9f6f0f24e227022fa0', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-23 01:05:53', '2020-01-23 01:05:53', '2021-01-23 09:05:53'),
('c958700d1e30a0b737fbec14978447411d0702067c64547fb6121bdba54d46841764dd932a332049', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-23 01:10:12', '2020-01-23 01:10:12', '2021-01-23 09:10:12'),
('ce85027d63744887879ccf5238ef0b7419b7cc1d2c71287b2521973933d4bc2aa24f28c25cf92324', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-27 06:24:20', '2020-01-27 06:24:20', '2021-01-27 14:24:20'),
('d6dc0b81ced0157796607e17edd2bf1e7375997f9fd2df34aa827a8939d22e743bd6ee7362eb3ee5', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-23 01:00:36', '2020-01-23 01:00:36', '2021-01-23 09:00:36'),
('d7199a5e2598d7939a442c31a4c4598b2b0b4e6587dbb570cfac34420a578d0c167098d92e9c0136', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:09:05', '2020-01-25 04:09:05', '2021-01-25 12:09:05'),
('d9be99deb4f0a33c1e3be27f095b7babf38c60acb38eda23c090f4af8e98fe3f3ea4f69be02782a1', 41, 1, 'YABO_BANK', '[]', 1, '2020-01-25 23:36:43', '2020-01-25 23:36:43', '2021-01-26 07:36:43'),
('e0a60196d9696571d64943f72126b17a71b4131b299b5976728487d6779623b33a2241cd0188e870', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 03:00:01', '2020-01-25 03:00:01', '2021-01-25 11:00:01'),
('e51d0305c54637e3a94f3fb131fe07be5aee2551585b6dfb39bd8af5537ca814c60f1ef7f8408363', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:28:44', '2020-01-25 04:28:44', '2021-01-25 12:28:44'),
('ea3ddc441b87fe309b91ea80591e5553aa6b317774ad461ac11c19dd4fb6ed0304052f7099a2bbe3', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 05:26:12', '2020-01-25 05:26:12', '2021-01-25 13:26:12'),
('eafa2684d34dacdb567066d3b0d753f5f8c5e65a00b08e9efbbbed485a3454fce0fbcb152af1cac6', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:33:07', '2020-01-25 04:33:07', '2021-01-25 12:33:07'),
('f134caa5979d8c984cf4c96b39d2a55cd7941ee8d2c5e2f3bc3b46d84444ef4dc0bcea5f6e61c01f', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-30 08:35:59', '2020-01-30 08:35:59', '2021-01-30 16:35:59'),
('f56ea78df833dbd2fc8ed2754b8a1c4bc45e455b0499f6b46dee510d537887127ecaae3f01b69b80', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-30 08:17:19', '2020-01-30 08:17:19', '2021-01-30 16:17:19'),
('f5ea34314e7395996db926ce2f6634f774b0778c80eef7ec7be696445a7df70400987cb1a6c978df', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 10:15:24', '2020-01-25 10:15:24', '2021-01-25 18:15:24'),
('f7787bb7e4d429d7488a50bf78a11b4b9360f4e91efe95dc7386cd84783c87572a390918f4518b9f', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-29 21:42:17', '2020-01-29 21:42:17', '2021-01-30 05:42:17'),
('f7d96ea9fce5d5b2e7d9ab46351d27a5a9ffe17d1dc85427f0f022af5db618ab0ad33ed86d6e814d', 34, 1, 'YABO_BANK', '[]', 0, '2020-01-25 04:15:04', '2020-01-25 04:15:04', '2021-01-25 12:15:04'),
('f927961d080954980138d0ec52820bed35cbb5987444f995a611816fede5c1cdc4293f05d4d43fca', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-30 06:58:52', '2020-01-30 06:58:52', '2021-01-30 14:58:52'),
('f95f0379fac6e1692a9bdc41f9e0fc2f85f226f916a0506da515ab2303e2435912ef1dfaa393b702', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-25 05:26:20', '2020-01-25 05:26:20', '2021-01-25 13:26:20'),
('fb19231db279f020a1f3d7cfcc9372adfd6c945ba319813a7d561e8706ddcbc289c71be75b131adb', 31, 1, 'YABO_BANK', '[]', 1, '2020-01-29 20:56:14', '2020-01-29 20:56:14', '2021-01-30 04:56:14'),
('fb19aa2a1697fb446dfe187835050c479aa5ad7aa1742b00d72ef164864861e98efca068d9fc879c', 43, 1, 'YABO_BANK', '[]', 1, '2020-01-26 05:56:59', '2020-01-26 05:56:59', '2021-01-26 13:56:59'),
('fcda86ad96beca4f9192d161fc291a8ee64257117d9821882164e5b8719094490510ccf2624c7843', 31, 1, 'YABO_BANK', '[]', 0, '2020-01-29 23:02:49', '2020-01-29 23:02:49', '2021-01-30 07:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'YABO_BANK Personal Access Client', '4oBU2PEUIL3xHBN7mzNzejlWGMytVmP6yY3doTPu', 'http://localhost', 1, 0, 0, '2020-01-21 22:51:30', '2020-01-21 22:51:30'),
(2, NULL, 'YABO_BANK Password Grant Client', 'dK1Y5kbInrzK6S3TRgu9qNS23b49oKmUoLNkGz0F', 'http://localhost', 0, 1, 0, '2020-01-21 22:51:30', '2020-01-21 22:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-21 22:51:30', '2020-01-21 22:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pick_ups`
--

CREATE TABLE `pick_ups` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pick_ups`
--

INSERT INTO `pick_ups` (`id`, `request_id`, `driver_id`, `status`, `created_at`, `updated_at`) VALUES
(5, 5, 5, 1, '2020-01-19 22:37:31', '2020-01-19 22:39:04'),
(6, 6, 5, 1, '2020-01-20 06:35:21', '2020-01-20 06:38:27'),
(7, 7, 5, 1, '2020-01-21 08:43:12', '2020-01-21 08:52:26'),
(8, 8, 5, 1, '2020-01-21 08:43:12', '2020-01-21 09:06:25'),
(9, 9, 5, 1, '2020-01-23 04:56:39', '2020-01-23 07:03:53'),
(10, 10, 5, 1, '2020-01-23 05:00:00', '2020-01-31 05:11:28'),
(11, 16, 5, 1, '2020-01-26 08:22:35', '2020-01-31 05:11:40'),
(12, 20, 6, 1, '2020-01-27 06:06:20', '2020-01-27 06:07:45'),
(13, 21, 6, 0, '2020-01-27 06:06:20', '2020-01-27 06:06:20'),
(14, 30, 6, 0, '2020-01-29 09:52:46', '2020-01-29 09:52:46'),
(15, 33, 5, 1, '2020-01-31 07:19:25', '2020-01-31 07:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `price_lists`
--

CREATE TABLE `price_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_lists`
--

INSERT INTO `price_lists` (`id`, `name`, `price`, `unit`, `created_at`, `updated_at`) VALUES
(2, 'plastik', 1000, 'kg', '2020-01-11 08:41:22', '2020-01-11 08:41:22'),
(3, 'Besi', 5000, 'kg', '2020-01-11 08:42:09', '2020-01-11 08:42:09'),
(4, 'Kardus', 4000, 'kg', '2020-01-19 22:35:00', '2020-01-19 22:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `customer_id`, `code`, `status`, `info`, `photo`, `created_at`, `updated_at`) VALUES
(5, 7, 'Request_1579502165', 2, 'plastik dan besi !', '', '2020-01-19 22:36:19', '2020-01-19 22:39:04'),
(6, 7, 'Request_1579530615', 2, 'kardus dan besi', '', '2020-01-20 06:30:32', '2020-01-20 06:38:27'),
(7, 7, 'Request_1579621946', 2, '1', '', '2020-01-21 07:52:35', '2020-01-21 08:52:26'),
(8, 7, 'Request_1579621955', 2, '2', '', '2020-01-21 07:52:40', '2020-01-21 09:06:25'),
(9, 7, 'Request_1579783126', 2, 'plastik', '', '2020-01-23 04:38:46', '2020-01-23 07:03:53'),
(10, 7, 'Request_1579784371', 2, 'plastik 2', '', '2020-01-23 04:59:31', '2020-01-31 05:11:28'),
(16, 13, 'Request_1580055696', 2, 'dhkdbmykhkb', '', '2020-01-26 08:21:36', '2020-01-31 05:11:40'),
(20, 7, 'Request_1580117573', 2, 'asdfjasghdkf', 'REQUEST_1580118025.JPG', '2020-01-27 01:40:25', '2020-01-27 06:07:45'),
(21, 7, 'Request_1580133885', 1, 'plastik', 'REQUEST_1580133911.JPG', '2020-01-27 06:05:11', '2020-01-27 06:06:20'),
(30, 7, 'Request_1580319099', 1, 'plastik', 'REQUEST_1580319099.png', '2020-01-29 09:31:39', '2020-01-29 09:52:46'),
(31, 13, 'Request_1580363118', 0, 'sampah besi', 'REQUEST_1580363118.png', '2020-01-29 21:45:18', '2020-01-29 21:45:18'),
(32, 16, 'Request_1580371025', 0, 'besi', 'REQUEST_1580371025.png', '2020-01-29 23:57:05', '2020-01-29 23:57:05'),
(33, 7, 'Request_1580483944', 2, 'Tes 10Kg Plastik', 'REQUEST_1580483944.png', '2020-01-31 07:19:04', '2020-01-31 07:24:27'),
(36, 7, 'Request_1580485677', 0, 'tes', 'REQUEST_1580485677.png', '2020-01-31 15:47:57', '2020-01-31 15:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'uadmin', NULL, NULL),
(13, 'customer', NULL, NULL),
(14, 'driver', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(6, 1),
(8, 2),
(14, 13),
(15, 13),
(16, 13),
(17, 13),
(18, 13),
(19, 13),
(20, 13),
(25, 13),
(26, 13),
(29, 14),
(31, 13),
(32, 13),
(33, 13),
(34, 14),
(35, 14),
(40, 13),
(43, 13),
(44, 13),
(45, 13);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_id`, `driver_id`, `product`, `unit`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(5, 7, 5, 'plastik', 'kg', '4', 1000, '2020-01-19 22:39:04', '2020-01-19 22:39:04'),
(6, 7, 5, 'Besi', 'kg', '3', 5000, '2020-01-19 22:39:04', '2020-01-19 22:39:04'),
(7, 7, 5, 'Kardus', 'kg', '30', 4000, '2020-01-20 06:38:27', '2020-01-20 06:38:27'),
(8, 7, 5, 'Besi', 'kg', '50', 5000, '2020-01-20 06:38:27', '2020-01-20 06:38:27'),
(9, 7, 5, 'plastik', 'kg', '5', 1000, '2020-01-21 08:52:26', '2020-01-21 08:52:26'),
(10, 7, 5, 'Kardus', 'kg', '60', 4000, '2020-01-21 09:06:25', '2020-01-21 09:06:25'),
(11, 7, 5, 'plastik', 'kg', '3', 1000, '2020-01-23 07:03:53', '2020-01-23 07:03:53'),
(12, 7, 5, 'Besi', 'kg', '4', 5000, '2020-01-23 07:03:53', '2020-01-23 07:03:53'),
(13, 7, 5, 'plastik', 'kg', '3', 1000, '2020-01-23 07:07:01', '2020-01-23 07:07:01'),
(14, 7, 5, 'Besi', 'kg', '4', 5000, '2020-01-23 07:07:01', '2020-01-23 07:07:01'),
(15, 7, 6, 'plastik', 'kg', '50', 1000, '2020-01-27 06:07:45', '2020-01-27 06:07:45'),
(16, 7, 5, 'plastik', 'kg', '3', 1000, '2020-01-31 04:10:46', '2020-01-31 04:10:46'),
(17, 7, 5, 'Besi', 'kg', '1', 5000, '2020-01-31 04:10:46', '2020-01-31 04:10:46'),
(18, 7, 5, 'plastik', 'kg', '2', 1000, '2020-01-31 05:11:28', '2020-01-31 05:11:28'),
(19, 13, 5, 'Besi', 'kg', '3', 5000, '2020-01-31 05:11:40', '2020-01-31 05:11:40'),
(20, 7, 5, 'plastik', 'kg', '10', 1000, '2020-01-31 07:24:27', '2020-01-31 07:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_point` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userable_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `identity_photo`, `phone`, `address`, `map_point`, `remember_token`, `created_at`, `updated_at`, `userable_type`, `userable_id`) VALUES
(6, 'muhammad Alfalah', 'alan@alan.com', 'alan@alan.com', NULL, '$2y$10$uyaV09dX4tnt/4SY36twW.FACqQdaOcXjCxiGJUt337gZT9FWTAei', '', '', '', '', '', NULL, '2020-01-07 11:46:43', '2020-01-11 07:24:11', 'a', 1),
(8, 'alin', 'alin@alin.com', 'alin@alin.com', NULL, '$2y$10$VFXgl5BHOKJkbfyBOBNcWugmCMywhrlyk24.qwYzZqGXf9rjjiiKi', 'PROFILE_1580182493.png', 'default.jpg', '0', 'jalan jalan', '', NULL, '2020-01-11 05:25:50', '2020-01-27 19:34:53', '', NULL),
(31, 'muhammad alfalah madukubah', 'a@a.com', 'a@a.com', NULL, '$2y$10$kLk.tQpFfNwuIrS42rm4ae44kVOSeNUCi1ouyNvWdUGl222iRYB36', 'PROFILE_1580360631.png', 'default.jpg', '1', 'jln mutiara', '0,0', NULL, '2020-01-19 22:11:38', '2020-01-29 21:03:51', 'App\\Model\\Customer', 7),
(33, 'b alan', 'b@b.com', 'b@b.com', NULL, '$2y$10$H8X2OcEI0APNEt4vD/oJPuJzTaGLEiCUzQSjwePSPdgHnCrS/6b1W', 'default.jpg', 'default.jpg', '1234', 'qwer', '0,0', NULL, '2020-01-19 22:17:42', '2020-01-19 22:31:49', 'App\\Model\\Customer', 9),
(34, 'c alin', 'c@c.com', 'c@c.com', NULL, '$2y$10$vYQRlrZ097bL/3vUpmSRQOFJcnaw82SdwnuLadJc9WxLtdJBVs4Cu', 'PROFILE_1580209419.PNG', 'default.jpg', '1234', 'qwer', '0,0', NULL, '2020-01-19 22:18:51', '2020-01-28 03:03:39', 'App\\Model\\Driver', 5),
(35, 'd alin', 'd@d.com', 'd@d.com', NULL, '$2y$10$WiG.vdNRJbbRi/4YmaUbse8mnMbgreoiEOLALo5ljSrL4G7TfEcd.', 'PROFILE_1580184701.png', 'default.jpg', '1234', 'qwer', '0,0', NULL, '2020-01-19 22:20:02', '2020-01-27 20:11:41', 'App\\Model\\Driver', 6),
(40, 'a', 'a', 'z@z.com', NULL, '$2y$10$4iUYUI5mPGe48AVrZMsyceb5DHPvJexxRaMlIQw3p9o75pHnDb/t.', 'default.jpg', 'default.jpg', '0', '-', '0,0', NULL, '2020-01-21 23:37:57', '2020-01-21 23:37:58', 'App\\Model\\Customer', 10),
(43, 'alan madukubah', 'name', 'alan@gmail.com', NULL, '$2y$10$KiS1e55mG0a3DJrjIumS8uqifiAcdeNzRx1Ck5rWQobF9lAag8CZe', 'PROFILE_1580366479.png', 'default.jpg', '081342989100', '-', '0,0', NULL, '2020-01-25 23:59:39', '2020-01-29 22:41:19', 'App\\Model\\Customer', 13),
(44, 'q', 'q@q.com', 'q@q.com', NULL, '$2y$10$6CsUoks7WppOvP0RhcwCVueaakIz0z5YXn0SiYuEMaEfxfegaK5KO', 'default.jpg', 'default.jpg', '1', '-', '0,0', NULL, '2020-01-27 20:07:02', '2020-01-27 20:07:02', 'App\\Model\\Customer', 15),
(45, 'yuhu', 'name', 'r@r.com', NULL, '$2y$10$PtKUTH6uTpFzThX5Z/h4v.p5PjwYS7iY0RkNpyqV2iQcozNMNcwBq', 'PROFILE_1580371090.png', 'default.jpg', '2', 'alamat', '0,0', NULL, '2020-01-29 23:56:19', '2020-01-29 23:58:10', 'App\\Model\\Customer', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutations`
--
ALTER TABLE `mutations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pick_ups`
--
ALTER TABLE `pick_ups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_lists`
--
ALTER TABLE `price_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `mutations`
--
ALTER TABLE `mutations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pick_ups`
--
ALTER TABLE `pick_ups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `price_lists`
--
ALTER TABLE `price_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
