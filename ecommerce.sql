-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2017 at 02:52 AM
-- Server version: 5.7.15-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(15, 1, 22),
(16, 1, 23),
(17, 1, 24),
(18, 1, 25),
(19, 1, 26),
(20, 1, 28),
(21, 1, 29),
(22, 1, 31),
(13, 1, 32),
(14, 1, 33);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add categorie', 7, 'add_categorie'),
(20, 'Can change categorie', 7, 'change_categorie'),
(21, 'Can delete categorie', 7, 'delete_categorie'),
(22, 'Can add product', 8, 'add_product'),
(23, 'Can change product', 8, 'change_product'),
(24, 'Can delete product', 8, 'delete_product'),
(25, 'Can add cart', 9, 'add_cart'),
(26, 'Can change cart', 9, 'change_cart'),
(27, 'Can delete cart', 9, 'delete_cart'),
(28, 'Can add rating product', 10, 'add_ratingproduct'),
(29, 'Can change rating product', 10, 'change_ratingproduct'),
(30, 'Can delete rating product', 10, 'delete_ratingproduct'),
(31, 'Can add comment product', 11, 'add_commentproduct'),
(32, 'Can change comment product', 11, 'change_commentproduct'),
(33, 'Can delete comment product', 11, 'delete_commentproduct');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$pKoIKDkxrKlH$SR4Hc67JOZDZsOei1VbBEZTgsFbqpnnEXd+03PXSZIE=', '2017-02-27 01:22:21.532984', 1, 'admin', 'Ismail', 'EL FAQIR', 'elfaqir963@gmail.com', 1, 1, '2017-02-21 20:30:32.000000'),
(3, 'pbkdf2_sha256$20000$Wh5gjfjV35Sw$WMmelipz0AJW+1AVRmQekv6QrQafI3X+/0ipKJGGYxU=', '2017-02-26 17:02:09.441371', 0, 'ismail', 'ismail', 'ELFAQIR', 'elfaqir963@gmail.com', 0, 1, '2017-02-22 22:29:43.119788'),
(4, 'pbkdf2_sha256$20000$3oGE3tt1e30W$0cUNlGXS6IKvomgSkiYyA/7g9u1QbSd7D1XMXH1+4x4=', '2017-02-25 20:14:34.767008', 0, 'adam123', 'adam', 'BENJBARA', '', 0, 1, '2017-02-25 20:11:09.709230'),
(6, 'pbkdf2_sha256$20000$mikG8esisLcR$KMl0St3XigKL30Wfy4/3mHMhQ2hECz9HKMVb9tU1K7A=', '2017-02-26 17:08:56.070047', 0, 'adam', 'adam', 'Benjbara', 'adam@gmail.com', 0, 1, '2017-02-26 17:08:55.653735'),
(7, 'pbkdf2_sha256$20000$OBjll9ERfPNc$gxhaKSs5T/nWZ+jtBB4WGv6WfNKvHIoDv/Gfeq9y8iE=', '2017-02-27 01:16:01.709388', 0, 'uti', 'ismail', 'elfaqir', 'elfaqir963@gmail.com', 0, 1, '2017-02-27 01:15:26.297658');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 3, 1),
(3, 4, 1),
(4, 6, 1),
(5, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `client_cart`
--

CREATE TABLE `client_cart` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `buyed` tinyint(1) NOT NULL,
  `adding_date` datetime(6) NOT NULL,
  `buyed_date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_cart`
--

INSERT INTO `client_cart` (`id`, `quantity`, `buyed`, `adding_date`, `buyed_date`, `product_id`, `user_id`) VALUES
(1, 2, 1, '2017-02-23 02:44:17.960380', '2017-02-25 03:07:11.951989', 5, 1),
(2, 1, 1, '2017-02-24 01:22:17.353408', '2017-02-25 03:07:12.209610', 6, 1),
(3, 2, 1, '2017-02-24 01:48:11.670523', '2017-02-25 03:07:12.268749', 9, 1),
(7, 2, 0, '2017-02-24 22:02:23.801728', '2017-02-26 17:07:42.870322', 9, 3),
(8, 1, 0, '2017-02-24 22:02:25.147531', '2017-02-24 22:46:11.002371', 8, 3),
(10, 1, 0, '2017-02-25 03:50:14.544522', '2017-02-25 03:50:57.526132', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_categorie`
--

CREATE TABLE `client_categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_categorie`
--

INSERT INTO `client_categorie` (`id`, `name`) VALUES
(1, 'Multimedia'),
(2, 'Books & Audible'),
(3, 'Sports & Outdoors'),
(4, 'Automotive & Industrial'),
(5, 'Toys, Kids & Baby'),
(6, 'Clothing, Shoes & Jewelry'),
(7, 'Electronics & Computers');

-- --------------------------------------------------------

--
-- Table structure for table `client_commentproduct`
--

CREATE TABLE `client_commentproduct` (
  `id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_bin NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adding_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_commentproduct`
--

INSERT INTO `client_commentproduct` (`id`, `comment`, `product_id`, `user_id`, `adding_date`) VALUES
(1, 'ooooook  okkk ookkk k k k k k k  k k k', 6, 3, '2017-02-23 21:25:17.657234'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum', 6, 1, '2017-02-23 21:50:25.214076'),
(3, 'hello word !', 6, 1, '2017-02-23 21:54:51.798333'),
(4, 'oooooooooooook', 6, 1, '2017-02-23 22:20:18.233797'),
(5, 'Is an E-commerce apllication developed using Django 1.8 and JavaScript', 7, 1, '2017-02-27 00:19:09.460749');

-- --------------------------------------------------------

--
-- Table structure for table `client_product`
--

CREATE TABLE `client_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `images` longtext COLLATE utf8_bin,
  `price` decimal(12,2) NOT NULL,
  `adding_date` datetime(6) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_bin,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_product`
--

INSERT INTO `client_product` (`id`, `name`, `images`, `price`, `adding_date`, `categorie_id`, `owner_id`, `description`, `active`) VALUES
(5, 'PC HP i5', 'PC HP i51487813870752.gif;PC HP i51487813870752.jpg;PC HP i51487813870753.jpeg;', '500.24', '2017-02-23 01:37:50.757368', 5, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?', 1),
(6, 'Echo Portable', 'Echo Portable1487868397672.gif;Echo Portable1487868397673.jpg;Echo Portable1487868397673.jpeg;', '60.99', '2017-02-23 16:46:37.675079', 7, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?', 1),
(7, 'Fire, 17.7 cm (7") Display', 'Fire, 17.7 cm (7") Display1487900635694._SL1000_;Fire, 17.7 cm (7") Display1487900635694_2iIGx9a._SL1000_;', '59.99', '2017-02-24 01:43:55.695395', 7, 1, '\r\nSpecial offers and sponsored screensavers display when your device is in sleep mode. Learn more\r\n\r\n    Beautiful 17.7 cm IPS display (7" - 171 ppi / 1024 x 600). Available in four colours.\r\n    Fast 1.3 GHz quad-core processor and rear- and front-facing cameras.\r\n    Amazon Underground: All-new, one-of-a-kind app store experience where thousands of apps, games and in-app items are actually free -- including extra lives, unlocked levels, unlimited add-on packs and more\r\n    Prime members can stream thousands of Prime Video titles, access over 950,000 book titles, thousands of audiobooks and over a million songs\r\n    Prime members can download thousands of Prime Video movies and TV shows to watch offline anywhere\r\n    Enjoy more than 38 million songs, movies, TV shows, books, apps and games\r\n    Free unlimited cloud storage for all Amazon content and photos taken with Fire devices. Add a microSD card for up to 128GB of additional storage', 1),
(8, 'Lenovo Miix 310 10.1', 'Lenovo Miix 310 10.11487900756101._SL1500_;Lenovo Miix 310 10.11487900756101_2lHktS2._SL1500_;Lenovo Miix 310 10.11487900756102._SL1500_;', '199.00', '2017-02-24 01:45:56.103332', 7, 1, ' Prozessor: Intel Atom x5-Z8350 (1,44GHz, bis zu 1,92GHz, 2MB Cache)\r\nBesonderheiten: abnehmbares Tastatur-Cover macht aus dem Miix 310 ein Tablet und Notebook in einem Gerät\r\nAkku: bis zu 10 Stunden Akkulaufzeit (Videowiedergabe), 33 Wh, 2 Zellen\r\nHerstellergarantie: 12 Monate bei Verkauf und Versand durch Amazon. Bei Verkauf und Versand durch einen Drittanbieter gelten die Angaben des jeweiligen Verkäufers\r\nLieferumfang: Lenovo Miix 310 25,65cm (10,1 Zoll) Tablet silber, abnehmbarem Tastatur-Cover, Netzteil, USB-Kabel, Dokumentation\r\nBluetooth\r\nWXGA\r\n16:9 ', 1),
(9, 'Benq 9H. Leelb QBC 27 inch', 'Benq 9H. Leelb QBC 27 inch1487900852709._SL1500_;Benq 9H. Leelb QBC 27 inch1487900852709_Ae7m3sc._SL1500_;Benq 9H. Leelb QBC 27 inch1487900852709_KdFP9kH._SL1500_;', '189.00', '2017-02-24 01:47:32.711083', 7, 1, ' 16: 9 – Full HD LED monitor\r\nResolution 1920 x 1080\r\nLED + va panel, to HDMI with MHL Support ', 1),
(10, 'Kettler Laufrad Speedy', 'Kettler Laufrad Speedy1487903883402.jpg;Kettler Laufrad Speedy1487903883402._SL1000_;', '35.99', '2017-02-24 02:38:03.403503', 3, 3, '    ENDLICH MOBIL: Unser Laufrad ab 2 Jahren ist ein absolutes Highlight vom Kindergarten bis ins Vorschulalter. Egal wohin es ab sofort geht – das neue Laufrad für Kinder muss mit!    LERNEN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_ratingproduct`
--

CREATE TABLE `client_ratingproduct` (
  `id` int(11) NOT NULL,
  `like` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_ratingproduct`
--

INSERT INTO `client_ratingproduct` (`id`, `like`, `product_id`, `user_id`) VALUES
(1, 5, 6, 1),
(2, 5, 5, 1),
(3, 6, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-02-22 22:20:19.714673', '1', 'client', 1, '', 3, 1),
(2, '2017-02-22 22:29:02.578067', '2', 'ismail', 3, '', 4, 1),
(3, '2017-02-23 00:29:42.768836', '1', 'Multimedia', 1, '', 7, 1),
(4, '2017-02-23 00:31:41.898520', '2', 'Books & Audible', 1, '', 7, 1),
(5, '2017-02-23 00:31:53.575854', '3', 'Sports & Outdoors', 1, '', 7, 1),
(6, '2017-02-23 00:32:05.197649', '4', 'Automotive & Industrial', 1, '', 7, 1),
(7, '2017-02-23 00:32:15.961582', '5', 'Toys, Kids & Baby', 1, '', 7, 1),
(8, '2017-02-23 00:32:27.419147', '6', 'Clothing, Shoes & Jewelry', 1, '', 7, 1),
(9, '2017-02-23 00:32:47.257027', '7', 'Electronics & Computers', 1, '', 7, 1),
(10, '2017-02-23 01:23:25.176983', '1', 'Product oooook', 3, '', 8, 1),
(11, '2017-02-23 01:23:29.742539', '4', 'Product njfiles', 3, '', 8, 1),
(12, '2017-02-23 15:16:37.021540', '1', 'client', 2, 'Changed permissions.', 3, 1),
(13, '2017-02-23 15:59:22.921855', '5', 'Product PC HP i5', 2, 'Changed description.', 8, 1),
(14, '2017-02-23 19:19:07.475070', '1', 'client', 2, 'Changed permissions.', 3, 1),
(15, '2017-02-23 20:41:20.282590', '1', 'client', 2, 'Changed permissions.', 3, 1),
(16, '2017-02-23 20:46:34.225720', '1', 'Echo Portable', 1, '', 11, 1),
(17, '2017-02-24 02:31:22.097957', '9', 'Product Benq 9H. Leelb QBC 27 inch', 2, 'Changed active.', 8, 1),
(18, '2017-02-24 02:31:31.828743', '7', 'Product Fire, 17.7 cm (7") Display', 2, 'Changed active.', 8, 1),
(19, '2017-02-24 23:51:55.820662', '1', 'etudiant', 2, 'Changed first_name and last_name.', 4, 1),
(20, '2017-02-25 02:46:58.102537', '1', 'etudiant', 2, 'Changed buyed.', 9, 1),
(21, '2017-02-25 02:47:03.760438', '2', 'etudiant', 2, 'Changed buyed.', 9, 1),
(22, '2017-02-25 02:47:14.630501', '3', 'etudiant', 2, 'Changed buyed.', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'client', 'cart'),
(7, 'client', 'categorie'),
(11, 'client', 'commentproduct'),
(8, 'client', 'product'),
(10, 'client', 'ratingproduct'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-02-21 20:29:27.341830'),
(2, 'auth', '0001_initial', '2017-02-21 20:29:33.995631'),
(3, 'admin', '0001_initial', '2017-02-21 20:29:35.561431'),
(4, 'contenttypes', '0002_remove_content_type_name', '2017-02-21 20:29:36.559517'),
(5, 'auth', '0002_alter_permission_name_max_length', '2017-02-21 20:29:37.237607'),
(6, 'auth', '0003_alter_user_email_max_length', '2017-02-21 20:29:37.840981'),
(7, 'auth', '0004_alter_user_username_opts', '2017-02-21 20:29:37.896231'),
(8, 'auth', '0005_alter_user_last_login_null', '2017-02-21 20:29:38.397640'),
(9, 'auth', '0006_require_contenttypes_0002', '2017-02-21 20:29:38.431026'),
(10, 'sessions', '0001_initial', '2017-02-21 20:29:38.901723'),
(11, 'client', '0001_initial', '2017-02-22 22:59:50.038205'),
(12, 'client', '0002_auto_20170223_0046', '2017-02-23 00:46:22.595343'),
(13, 'client', '0003_auto_20170223_0109', '2017-02-23 01:09:50.689820'),
(14, 'client', '0004_product_description', '2017-02-23 01:27:09.188526'),
(15, 'client', '0005_product_number', '2017-02-23 01:34:07.211486'),
(16, 'client', '0006_auto_20170223_0234', '2017-02-23 02:34:34.550830'),
(17, 'client', '0007_auto_20170223_1556', '2017-02-23 15:56:52.387907'),
(18, 'client', '0008_ratingproduct', '2017-02-23 19:18:28.073190'),
(19, 'client', '0009_auto_20170223_1928', '2017-02-23 19:28:42.702181'),
(20, 'client', '0010_commentproduct', '2017-02-23 20:40:10.592349'),
(21, 'client', '0011_commentproduct_adding_date', '2017-02-23 21:25:22.483588'),
(22, 'client', '0012_product_active', '2017-02-24 02:14:12.536878');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bbc9hpuuwfufzvi6pxd58ozxfkcfu6ve', 'Y2RiZTdmZTMxMTdhMzkxZGI3Yjc4YjgwNTk1NGJhNjc1ODkxNjMxNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyY2QxYTU5OTQ3NzMzODNkNzkzNTlkNGQ4N2E4ZjRlN2YyN2FjNzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-13 01:22:21.600637'),
('mb4n9in0oj6o6hy05vkv4wmfrdzkketn', 'N2ZkNmIzMGNhMWM5NmU2M2I4MDU0M2IzYzZjMDgxYmQxMWI3MmExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmZmYxMmM1NmNlMDA5MTRlYTdkYzM0YWIzZDBkNTM0MGExN2VkOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-11 20:15:43.759049'),
('r72kd4ghw9l0tycr77qho6g1rs9krv95', 'ZGEzYmUyOGUzNjA3Zjk1ZmJmMjNkNjZlMGIyYzY0MTllYjUzMjU4MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYjU0Yzg3MWUzN2MxYzQyNTQ1ZTllYTdjNWE5ZDBhNDgzZTczNGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=', '2017-03-12 17:08:56.159418');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  ADD KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `client_cart`
--
ALTER TABLE `client_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_cart_9bea82de` (`product_id`),
  ADD KEY `client_cart_e8701ad4` (`user_id`);

--
-- Indexes for table `client_categorie`
--
ALTER TABLE `client_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_commentproduct`
--
ALTER TABLE `client_commentproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_commentp_product_id_70eaba33d3cf00e1_fk_client_product_id` (`product_id`),
  ADD KEY `client_commentproduct_user_id_44cb5f079c02133e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `client_product`
--
ALTER TABLE `client_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_prod_categorie_id_78e53a01a8632da5_fk_client_categorie_id` (`categorie_id`),
  ADD KEY `client_product_owner_id_54a3bbf7bed14037_fk_auth_user_id` (`owner_id`);

--
-- Indexes for table `client_ratingproduct`
--
ALTER TABLE `client_ratingproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_ratingpr_product_id_2b44e0f7d491abfc_fk_client_product_id` (`product_id`),
  ADD KEY `client_ratingproduct_user_id_7adb8a8ca3f73259_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_cart`
--
ALTER TABLE `client_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `client_categorie`
--
ALTER TABLE `client_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `client_commentproduct`
--
ALTER TABLE `client_commentproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_product`
--
ALTER TABLE `client_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `client_ratingproduct`
--
ALTER TABLE `client_ratingproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_cart`
--
ALTER TABLE `client_cart`
  ADD CONSTRAINT `client_cart_product_id_33f302e501d64351_fk_client_product_id` FOREIGN KEY (`product_id`) REFERENCES `client_product` (`id`),
  ADD CONSTRAINT `client_cart_user_id_732b3762a84062d2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_commentproduct`
--
ALTER TABLE `client_commentproduct`
  ADD CONSTRAINT `client_commentp_product_id_70eaba33d3cf00e1_fk_client_product_id` FOREIGN KEY (`product_id`) REFERENCES `client_product` (`id`),
  ADD CONSTRAINT `client_commentproduct_user_id_44cb5f079c02133e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_product`
--
ALTER TABLE `client_product`
  ADD CONSTRAINT `client_prod_categorie_id_78e53a01a8632da5_fk_client_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `client_categorie` (`id`),
  ADD CONSTRAINT `client_product_owner_id_54a3bbf7bed14037_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_ratingproduct`
--
ALTER TABLE `client_ratingproduct`
  ADD CONSTRAINT `client_ratingpr_product_id_2b44e0f7d491abfc_fk_client_product_id` FOREIGN KEY (`product_id`) REFERENCES `client_product` (`id`),
  ADD CONSTRAINT `client_ratingproduct_user_id_7adb8a8ca3f73259_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
