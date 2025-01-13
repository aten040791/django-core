-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 13, 2025 at 07:36 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `events_django`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_users`
--

CREATE TABLE `api_users` (
  `id` int NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_users`
--

INSERT INTO `api_users` (`id`, `email`, `password`) VALUES
(10, 'nguyenhuucam91@gmail.com', 'bcrypt_sha256$$2b$12$/PJU/Pi5hMe.JrMuR8/UT.lUC9Rz8XVKolQbeeYVDiN1GbrH0gq26');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add participant', 7, 'add_participant'),
(26, 'Can change participant', 7, 'change_participant'),
(27, 'Can delete participant', 7, 'delete_participant'),
(28, 'Can view participant', 7, 'view_participant'),
(29, 'Can add event', 8, 'add_event'),
(30, 'Can change event', 8, 'change_event'),
(31, 'Can delete event', 8, 'delete_event'),
(32, 'Can view event', 8, 'view_event'),
(33, 'Can add event participant', 9, 'add_eventparticipant'),
(34, 'Can change event participant', 9, 'change_eventparticipant'),
(35, 'Can delete event participant', 9, 'delete_eventparticipant'),
(36, 'Can view event participant', 9, 'view_eventparticipant'),
(37, 'Can add auth user api', 10, 'add_authuserapi'),
(38, 'Can change auth user api', 10, 'change_authuserapi'),
(39, 'Can delete auth user api', 10, 'delete_authuserapi'),
(40, 'Can view auth user api', 10, 'view_authuserapi');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'event_management', 'authuserapi'),
(8, 'event_management', 'event'),
(9, 'event_management', 'eventparticipant'),
(7, 'event_management', 'participant'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-01-01 06:20:42.254582'),
(2, 'auth', '0001_initial', '2025-01-01 06:20:42.337872'),
(3, 'admin', '0001_initial', '2025-01-01 06:20:42.360441'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-01-01 06:20:42.362917'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-01 06:20:42.365159'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-01-01 06:20:42.379537'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-01-01 06:20:42.388894'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-01-01 06:20:42.395749'),
(9, 'auth', '0004_alter_user_username_opts', '2025-01-01 06:20:42.398232'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-01-01 06:20:42.407689'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-01-01 06:20:42.408206'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-01 06:20:42.410777'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-01-01 06:20:42.421821'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-01 06:20:42.433194'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-01-01 06:20:42.439216'),
(16, 'auth', '0011_update_proxy_permissions', '2025-01-01 06:20:42.442084'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-01 06:20:42.452672'),
(18, 'sessions', '0001_initial', '2025-01-01 06:20:42.458324'),
(20, 'event_management', '0001_initial', '2025-01-01 07:41:54.424043'),
(21, 'event_management', '0002_alter_event_table_alter_eventparticipant_table_and_more', '2025-01-01 07:41:54.439061'),
(22, 'event_management', '0003_rename_event_id_eventparticipant_event_and_more', '2025-01-01 07:45:41.857601'),
(23, 'event_management', '0004_alter_eventparticipant_unique_together', '2025-01-03 10:40:40.450017'),
(24, 'event_management', '0005_alter_eventparticipant_unique_together', '2025-01-03 10:40:40.454301'),
(25, 'event_management', '0006_alter_event_event_name', '2025-01-03 10:40:40.466377'),
(26, 'event_management', '0007_authuserapi_alter_event_cover_image', '2025-01-12 15:22:46.940699'),
(27, 'event_management', '0008_alter_authuserapi_email', '2025-01-12 15:23:35.526205'),
(28, 'event_management', '0009_alter_authuserapi_email', '2025-01-13 06:12:43.071184');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int NOT NULL,
  `event_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `cover_image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `start_date`, `end_date`, `cover_image`) VALUES
(1, 'Ikeda Yamato', '2006-07-04 17:19:40.000000', '2020-04-19 09:22:21.000000', 'nnFALH88cb'),
(2, 'Bryan Gonzalez', '2023-12-22 07:25:40.000000', '2003-08-06 17:56:00.000000', '9djL8YspwC'),
(3, 'Ronald Roberts', '2009-10-06 00:15:49.000000', '2020-05-16 13:19:34.000000', 'Jj0BaDsgCJ'),
(4, 'Tang Jialun', '2001-01-16 01:22:19.000000', '2001-07-02 06:09:36.000000', 'xeVwEsebsA'),
(5, 'Ye Lu', '2013-05-05 17:45:27.000000', '2022-08-06 07:45:50.000000', 'VWd2UBNXmu'),
(6, 'Andrea Kelley', '2002-12-14 00:42:50.000000', '2017-04-21 15:51:13.000000', 'fTTnYDPHIt'),
(7, 'Tina Black', '2012-10-02 12:12:54.000000', '2023-04-05 09:17:42.000000', 'KpLIVxDpAo'),
(8, 'Robin Davis', '2011-01-24 00:46:06.000000', '2014-07-19 07:42:49.000000', 'HGcN2QIwx4'),
(9, 'Herbert Davis', '2008-10-06 17:02:10.000000', '2006-06-12 10:58:14.000000', '5Lj3Ww1emO'),
(10, 'Sato Nanami', '2023-10-25 01:32:30.000000', '2006-03-25 17:50:34.000000', 'qbLJYo7f5Y'),
(11, 'Yu Jiehong', '2018-07-26 07:34:32.000000', '2019-06-18 04:46:57.000000', 'ZJUJIR6mpH'),
(12, 'Roger Moore', '2006-03-12 13:15:32.000000', '2017-01-11 02:15:44.000000', 'W551Fh21cU'),
(13, 'Angela Ramos', '2018-04-28 03:28:55.000000', '2007-03-31 07:27:01.000000', 'V4coJjBpAe'),
(14, 'Murata Akina', '2004-04-29 10:57:18.000000', '2011-10-19 21:45:56.000000', 'djEdB2dP1t'),
(15, 'Hasegawa Airi', '2008-08-07 05:58:55.000000', '2010-08-19 21:04:41.000000', 'LNXauVUZyM'),
(16, 'Chiang Tin Lok', '2018-04-19 12:32:54.000000', '2019-11-07 14:25:50.000000', 'CpcZj74cm6'),
(17, 'Martin Ryan', '2008-11-01 05:46:53.000000', '2008-09-10 22:48:40.000000', 'X8H0uWKXPU'),
(18, 'Carmen Evans', '2007-10-25 11:13:59.000000', '2020-10-13 12:34:10.000000', 'HirKbGuLe1'),
(19, 'Barry Jordan', '2019-11-29 11:05:32.000000', '2011-10-01 04:14:47.000000', '3ovSexFOQZ'),
(20, 'Ma Ming Sze', '2002-07-09 21:41:29.000000', '2002-01-21 10:35:26.000000', 'A78JmK7ncO'),
(21, 'Liang Ziyi', '2018-05-29 01:27:55.000000', '2019-09-10 18:03:26.000000', 'bTscBeqtS4'),
(22, 'Zhu Rui', '2000-10-30 00:26:01.000000', '2004-11-26 12:13:42.000000', 'LLAa24DMmY'),
(23, 'Frank Palmer', '2021-09-01 07:14:54.000000', '2013-10-10 17:13:53.000000', 'swEir5TGbm'),
(24, 'Chang Chiu Wai', '2005-06-18 02:25:22.000000', '2023-07-20 05:07:40.000000', 'ak3VwmjwWy'),
(25, 'Sasaki Yamato', '2013-03-12 09:23:21.000000', '2022-11-03 06:09:29.000000', 'GrC3gMJbSO'),
(26, 'Shibata Akina', '2002-12-27 23:26:25.000000', '2012-04-04 06:02:35.000000', 'vcxepDX8a1'),
(27, 'Yang Shihan', '2018-09-12 13:11:08.000000', '2019-05-21 12:00:12.000000', 'hT7N22x4z3'),
(28, 'Liao Lu', '2012-06-23 18:51:29.000000', '2022-09-05 11:09:18.000000', 'ghb7FN0QHC'),
(29, 'Lisa Dixon', '2004-04-10 15:36:16.000000', '2011-01-23 05:37:10.000000', 'p1uTnSxgnG'),
(30, 'Yung Chun Yu', '2016-03-15 04:16:34.000000', '2003-10-05 05:49:10.000000', 'gM78ksPAO0'),
(31, 'Yan Yunxi', '2005-10-05 03:21:06.000000', '2023-08-13 01:30:07.000000', '6axgsqhidZ'),
(32, 'Lai Ka Fai', '2022-07-21 08:10:20.000000', '2018-03-27 17:29:51.000000', '4713Sb9ckX'),
(33, 'Joan Brown', '2014-09-05 10:58:54.000000', '2005-12-31 22:16:21.000000', 'BzQhTHeq0x'),
(34, 'So Wing Fat', '2004-08-19 02:01:17.000000', '2012-07-29 17:23:51.000000', 'yFZxaYNwKD'),
(35, 'Shimada Hina', '2005-11-24 09:41:15.000000', '2018-01-14 09:32:03.000000', 'WpWRI4YJFj'),
(36, 'Tamura Rena', '2000-10-22 05:04:02.000000', '2019-02-19 05:25:23.000000', 'wb2AtbbQUF'),
(37, 'Scott Ortiz', '2024-11-12 23:49:13.000000', '2004-11-25 08:41:07.000000', 'Y6GL6NbhjI'),
(38, 'Jiang Zhiyuan', '2007-12-15 22:42:28.000000', '2002-03-27 10:27:43.000000', 'ELzQnfAKmZ'),
(39, 'Kaneko Yuito', '2006-02-08 04:56:25.000000', '2022-02-26 12:28:23.000000', 'BFHGxaX0ao'),
(40, 'Siu Wai Lam', '2024-12-18 17:21:15.000000', '2000-03-15 18:47:41.000000', 'SULuwVMm1V'),
(41, 'Hazel Wood', '2019-08-10 08:10:47.000000', '2006-08-10 15:58:02.000000', '1fwW89abuG'),
(42, 'Yin Sze Kwan', '2024-05-12 03:41:04.000000', '2017-12-06 17:37:38.000000', '7puG9W3yDM'),
(43, 'He Anqi', '2014-06-28 23:07:38.000000', '2000-11-13 12:16:25.000000', 'QKfYlHWuWJ'),
(44, 'Yuen Hui Mei', '2003-09-07 21:42:59.000000', '2011-03-24 15:23:33.000000', 'qfl7XF1Q77'),
(45, 'Nomura Rin', '2012-06-18 03:05:36.000000', '2007-05-26 05:29:31.000000', 'LGIvvqzjS4'),
(46, 'Jiang Anqi', '2003-12-08 23:51:31.000000', '2006-08-15 11:48:39.000000', 'NnYUc0Ep8S'),
(47, 'Kam Sze Kwan', '2000-12-20 14:50:24.000000', '2013-09-27 13:33:41.000000', '8oYBC4aYu5'),
(48, 'Sakurai Nanami', '2017-11-11 19:53:39.000000', '2000-10-09 00:18:11.000000', '4AM1Aaz1Jb'),
(49, 'Mo Wai Man', '2001-01-24 07:22:12.000000', '2013-04-18 20:31:49.000000', 'mkzANGSrjw'),
(50, 'Ding Zhiyuan', '2007-08-01 01:21:23.000000', '2004-06-25 07:36:04.000000', 'iiXs7pc1Kc'),
(51, 'Yamamoto Misaki', '2014-05-07 04:46:13.000000', '2006-03-19 08:27:59.000000', 'zFI1Te8gip'),
(52, 'Tang Tin Wing', '2020-01-01 18:22:26.000000', '2007-12-01 09:05:01.000000', 'VCMmXBSu2u'),
(53, 'Ying Kwok Yin', '2010-07-06 12:05:32.000000', '2001-06-15 00:23:56.000000', '96p6T1SHph'),
(54, 'Tamura Sakura', '2008-02-16 20:44:51.000000', '2022-11-06 05:54:36.000000', 'bdft8qoqbA'),
(55, 'Deng Yuning', '2024-05-31 21:12:40.000000', '2000-07-18 05:01:34.000000', 'F54JDZ0QF9'),
(56, 'Anna Rodriguez', '2024-06-29 18:40:38.000000', '2018-08-18 11:06:28.000000', 'vM77brZNvB'),
(57, 'Koon Wing Kuen', '2022-11-26 00:52:07.000000', '2005-04-19 00:35:22.000000', 'I6W9sjSWZL'),
(58, 'Wong Ka Man', '2011-07-05 15:41:08.000000', '2017-01-29 05:35:53.000000', 'bOod5tvXrd'),
(59, 'Yin Zitao', '2017-10-13 17:24:30.000000', '2010-03-20 05:40:32.000000', 'lRUZHH55Ww'),
(60, 'Lei Xiaoming', '2013-11-23 02:12:37.000000', '2015-10-23 18:57:50.000000', 'x9Xj8cNscF'),
(61, 'Jimmy Powell', '2011-11-28 04:49:26.000000', '2017-11-02 12:46:32.000000', '4ZUc0LBxsg'),
(62, 'Carrie Jimenez', '2024-12-06 03:27:20.000000', '2019-04-09 09:06:52.000000', 'x0efdr00s7'),
(63, 'Aoki Hana', '2019-08-21 23:32:38.000000', '2020-03-16 17:29:42.000000', '8CeRHp5RRz'),
(64, 'Zou Jiehong', '2020-09-10 11:54:50.000000', '2012-03-31 07:51:24.000000', 'OgfFhBHSF0'),
(65, 'Hasegawa Rena', '2023-04-10 04:03:48.000000', '2002-09-30 12:34:34.000000', 'pSy9gBAv9y'),
(66, 'Au Wing Sze', '2024-01-26 19:41:28.000000', '2001-05-29 01:45:43.000000', 'H6qqe20VEW'),
(67, 'Matsui Takuya', '2001-05-10 14:02:54.000000', '2023-08-07 04:33:23.000000', 'IXPWcmjO6w'),
(68, 'Tang Ziyi', '2010-05-08 03:58:12.000000', '2003-05-01 00:26:22.000000', 'SFCGAJeavW'),
(69, 'Matsuda Ayato', '2000-05-24 04:10:49.000000', '2017-07-06 22:47:47.000000', 'YTSZnv7pxT'),
(70, 'Zhang Xiaoming', '2017-07-03 23:10:02.000000', '2007-11-22 17:03:33.000000', '2F2FWwN8mw'),
(71, 'Song Zhiyuan', '2023-07-17 21:01:02.000000', '2006-02-03 00:00:41.000000', 'QPG4kl1PsZ'),
(72, 'Ito Minato', '2018-02-20 06:09:26.000000', '2008-08-27 05:51:50.000000', 'bu275c0ThT'),
(73, 'Marjorie Jimenez', '2014-10-05 07:22:31.000000', '2002-10-15 11:05:31.000000', 'Sjko50R9zO'),
(74, 'Wan Sze Yu', '2022-03-13 13:05:50.000000', '2017-11-07 00:22:51.000000', 'mFkx7jc1CE'),
(75, 'Goto Ren', '2016-12-03 02:23:03.000000', '2001-02-01 16:49:59.000000', 'fBDObM6lME'),
(76, 'Wang Yuning', '2007-09-07 01:03:57.000000', '2004-05-16 14:46:09.000000', '1FBxVm7F8p'),
(77, 'Tian Yunxi', '2010-06-23 09:07:31.000000', '2019-12-21 16:41:03.000000', 'i8xikYRerM'),
(78, 'Fan Kar Yan', '2007-03-06 13:23:19.000000', '2017-04-23 16:22:54.000000', 'WNsPd3LtnY'),
(79, 'Tracy Rose', '2017-09-28 08:54:20.000000', '2009-09-22 23:59:02.000000', 'cN8OOuW5HS'),
(80, 'Diana Tucker', '2021-01-15 14:36:35.000000', '2010-01-23 18:21:19.000000', 'M5T1NCfA0v'),
(81, 'Lam Wai Man', '2019-01-03 09:44:11.000000', '2009-07-15 19:23:23.000000', 'Q45kY1NgVW'),
(82, 'Arimura Yota', '2022-09-06 10:49:59.000000', '2023-05-11 09:37:43.000000', 'bVfCytc0Ge'),
(83, 'Linda Clark', '2011-08-02 10:45:26.000000', '2023-11-01 06:53:25.000000', '7hdQ3SIJAc'),
(84, 'Shimada Yuto', '2010-07-28 13:36:20.000000', '2022-10-10 06:36:46.000000', 'A9453ekyeC'),
(85, 'Matsumoto Ren', '2002-07-09 21:56:33.000000', '2022-03-25 09:38:39.000000', 'aKgRrfdOym'),
(86, 'Yeow Kwok Wing', '2024-02-27 11:59:54.000000', '2004-12-06 16:50:27.000000', 'M0DBzR4CQ5'),
(87, 'Xiao Lan', '2015-12-17 02:45:20.000000', '2016-09-27 18:55:03.000000', 'Wz8wPke9oE'),
(88, 'Todd Alvarez', '2004-11-30 10:32:40.000000', '2009-11-11 14:39:50.000000', 'Eipp6DKhUq'),
(89, 'Tian Anqi', '2000-02-24 10:52:36.000000', '2011-07-29 08:55:52.000000', '2WLfPkx63V'),
(90, 'Mark Rose', '2021-01-03 20:20:02.000000', '2010-08-18 15:05:44.000000', 'QGc38SWNgO'),
(91, 'Nancy Johnson', '2009-05-25 21:24:03.000000', '2010-11-12 19:58:49.000000', 'GkdfDQv5e6'),
(92, 'Elizabeth Hall', '2022-07-28 01:11:48.000000', '2004-05-07 15:18:30.000000', 'lfdxFmxRP4'),
(93, 'Elaine Garcia', '2019-07-20 18:49:00.000000', '2007-05-29 12:55:18.000000', 'YxWHPhlqhj'),
(94, 'Yamaguchi Yuna', '2014-08-18 07:27:42.000000', '2020-11-16 09:29:49.000000', 'EUB1mKaq7C'),
(95, 'Liao Yuning', '2017-02-28 23:22:46.000000', '2004-11-23 07:52:55.000000', 'rx5rdirUBi'),
(96, 'Cheung Wai Man', '2010-03-31 18:14:14.000000', '2003-10-06 05:13:44.000000', 'CRJx5UjXAa'),
(97, 'Wu Zhiyuan', '2012-04-22 21:13:00.000000', '2012-02-20 14:42:47.000000', 'qZK4jZki1g'),
(98, 'Howard Freeman', '2015-09-21 08:14:14.000000', '2023-12-29 13:33:26.000000', 'dcJoPKYyuJ'),
(99, 'Wada Takuya', '2014-08-01 05:01:04.000000', '2019-04-09 08:30:08.000000', 'Q50rgfMd7O'),
(100, 'Gu Jialun', '2016-08-16 01:24:23.000000', '2012-05-14 18:50:01.000000', '8m1RxU0LM9'),
(101, 'Ho Tin Lok', '2007-08-14 08:20:30.000000', '2009-10-17 10:24:49.000000', 'dROTkHD7CF'),
(102, 'Tang Anqi', '2008-04-19 01:53:36.000000', '2020-10-22 10:43:21.000000', '3SS6jCndq6'),
(103, 'Sugawara Riku', '2006-08-03 11:53:20.000000', '2003-01-15 09:07:55.000000', 'lkVKjh9KmE'),
(104, 'Walter Nelson', '2000-03-28 18:10:27.000000', '2015-12-03 13:38:51.000000', 'qaWTZSiJt7'),
(105, 'Ueda Sakura', '2006-08-07 21:56:41.000000', '2024-11-26 11:31:42.000000', 'R3038Obv1I'),
(106, 'Wang Jiehong', '2009-08-18 00:57:32.000000', '2022-01-09 01:40:37.000000', 'ni0d1E5Mxf'),
(107, 'Sugiyama Momoe', '2005-07-13 04:33:35.000000', '2020-09-22 07:04:05.000000', 'JNWRfIK3er'),
(108, 'Okamoto Eita', '2023-03-17 04:19:56.000000', '2004-10-04 04:47:14.000000', 'BQBJvcKcuk'),
(109, 'Mario Foster', '2005-09-22 18:44:56.000000', '2006-11-29 19:02:00.000000', 'yeXmDID82v'),
(110, 'Jia Jiehong', '2001-07-17 10:52:35.000000', '2010-10-04 12:04:17.000000', 'sEERoHA13l'),
(111, 'Yan Xiuying', '2015-10-06 16:10:56.000000', '2023-06-28 07:57:22.000000', 'Jrae3GQ77M'),
(112, 'Sano Kazuma', '2011-12-03 14:23:09.000000', '2004-08-18 18:02:07.000000', 'Rw3jnHRfkP'),
(113, 'Kam Sai Wing', '2018-04-17 21:55:06.000000', '2006-06-20 21:15:07.000000', 'regI1JWqfM'),
(114, 'Leonard Brooks', '2012-08-28 06:37:56.000000', '2012-04-28 20:36:12.000000', 'cisJ5NobWv'),
(115, 'Otsuka Ryota', '2010-07-18 13:39:56.000000', '2011-09-07 18:43:44.000000', 'bZdh4L9Dre'),
(116, 'Jiang Zitao', '2021-10-18 11:11:00.000000', '2020-11-01 05:37:20.000000', 'XbUeYktHh6'),
(117, 'Cho Ka Ling', '2001-10-16 04:03:53.000000', '2015-12-05 02:00:06.000000', 'QWdVfn09ox'),
(118, 'Lu Lan', '2005-09-18 02:56:27.000000', '2019-11-14 16:22:03.000000', 'stVBKwS0a1'),
(119, 'Kobayashi Hikari', '2020-03-27 06:51:44.000000', '2009-03-09 18:12:46.000000', '1zMbdpOcbz'),
(120, 'Kojima Misaki', '2019-08-02 01:40:23.000000', '2017-09-24 07:38:18.000000', '8BibYV70Gs'),
(121, 'Kong Wai Yee', '2020-09-25 02:59:09.000000', '2018-11-18 11:17:37.000000', 'zU4Ya6mq9O'),
(122, 'Lo Ka Ming', '2018-05-15 18:07:02.000000', '2003-09-19 20:03:44.000000', 'vRSM7UIiTD'),
(123, 'Takagi Ikki', '2000-09-13 08:56:46.000000', '2012-02-19 19:49:23.000000', 'BjDvmIuBHd'),
(124, 'Wong Tak Wah', '2005-04-11 11:54:52.000000', '2015-10-31 17:06:41.000000', 'hHqqv6uE12'),
(125, 'Craig Wood', '2010-06-06 11:12:03.000000', '2015-12-02 22:31:11.000000', 'ToD6kgLJPK'),
(126, 'Ren Jialun', '2001-03-29 23:29:56.000000', '2024-02-10 14:16:09.000000', 'H6sEtXZpBb'),
(127, 'Juanita Jackson', '2023-11-30 11:32:48.000000', '2013-05-08 01:56:16.000000', 'la3vSCNrAx'),
(128, 'Shimizu Riku', '2020-05-11 00:44:40.000000', '2018-09-24 09:06:50.000000', '0y4L1LzUUZ'),
(129, 'Walter Rose', '2006-07-01 13:53:08.000000', '2001-02-01 09:18:11.000000', '95Wr6MXwR9'),
(130, 'Andrew Palmer', '2003-06-13 04:27:47.000000', '2023-03-24 01:42:49.000000', 'F6BbvHt7gD'),
(131, 'Qin Xiuying', '2012-05-28 03:02:37.000000', '2022-05-17 22:12:33.000000', 'XAbZ6y2aDW'),
(132, 'Lin Zhennan', '2019-10-31 08:54:20.000000', '2024-10-02 02:47:11.000000', 'AaxwXBnDlx'),
(133, 'Mori Ikki', '2004-03-06 11:54:57.000000', '2017-12-25 07:44:02.000000', '0UBnMi8rD7'),
(134, 'Ishida Yuna', '2009-02-07 14:16:21.000000', '2013-10-05 05:29:55.000000', '4U05I03mGG'),
(135, 'Cao Anqi', '2003-11-04 11:51:58.000000', '2002-09-25 17:29:48.000000', '3Mz7uAWpkB'),
(136, 'Ishikawa Airi', '2006-03-04 10:43:56.000000', '2012-07-22 21:24:56.000000', 'PieKKYDKk5'),
(137, 'Masuda Kasumi', '2019-09-02 00:50:21.000000', '2021-08-26 01:55:27.000000', 'TD9nT0QFxX'),
(138, 'Wu Zhennan', '2016-03-11 19:52:05.000000', '2014-01-11 01:58:47.000000', '1WPhNl3mpg'),
(139, 'Yung Kwok Ming', '2010-06-28 20:02:13.000000', '2016-02-05 04:07:40.000000', 'k60Gs9O1ec'),
(140, 'Ellen Dunn', '2021-06-16 12:21:58.000000', '2019-12-26 17:56:51.000000', 'Y4m9hCC9h9'),
(141, 'Shimada Momoe', '2000-01-05 11:07:24.000000', '2024-01-20 00:07:28.000000', 'Rlt487Xt27'),
(142, 'Rachel Stephens', '2001-04-06 03:54:53.000000', '2009-04-16 12:41:05.000000', 'g6n9yNiUxC'),
(143, 'Zhu Lan', '2014-10-23 22:01:00.000000', '2017-03-30 14:38:37.000000', 'EJjBCkoEWq'),
(144, 'Sandra Guzman', '2008-07-05 13:36:02.000000', '2009-06-12 14:15:45.000000', 'AtRdSH7fXs'),
(145, 'Fan Siu Wai', '2014-10-29 17:18:51.000000', '2004-01-12 01:43:32.000000', '9f5hDAytrv'),
(146, 'Kathleen Daniels', '2000-07-06 21:32:26.000000', '2002-12-04 09:34:38.000000', 'CiLaPJkTru'),
(147, 'Duan Zhennan', '2015-11-17 14:11:33.000000', '2003-05-18 06:04:09.000000', 'QoJQ7IOQdP'),
(148, 'Watanabe Rin', '2013-06-30 12:53:26.000000', '2022-03-18 17:39:38.000000', 't0KOQn7HyL'),
(149, 'Siu Sum Wing', '2018-12-04 16:27:03.000000', '2012-11-14 23:09:29.000000', '4WY7MeaHuC'),
(150, 'Chu Wing Suen', '2022-12-10 02:47:44.000000', '2023-06-19 18:20:31.000000', '4p70HKPbzG'),
(151, 'Yung Hiu Tung', '2011-06-05 08:10:05.000000', '2022-01-31 09:45:36.000000', 'eZxltCmKbA'),
(152, 'Murakami Mio', '2001-11-27 03:11:33.000000', '2005-04-27 18:38:44.000000', '0gwthCWR1n'),
(153, 'Laura Payne', '2020-03-19 06:06:15.000000', '2020-04-10 01:20:42.000000', 'yCNuTteBse'),
(154, 'Hirano Ayano', '2014-11-30 10:45:36.000000', '2021-09-04 13:54:10.000000', 'hkyen2r3ow'),
(155, 'Wu Lu', '2013-05-08 00:56:52.000000', '2024-04-18 14:20:00.000000', 'XAk7wrM2an'),
(156, 'Nakagawa Daichi', '2013-12-05 03:15:51.000000', '2021-05-13 04:20:35.000000', 'SWCJezPNvl'),
(157, 'Carmen Palmer', '2004-10-02 04:33:39.000000', '2001-04-04 14:44:46.000000', 'nUoNKvX9ck'),
(158, 'Shimizu Akina', '2001-03-03 15:58:10.000000', '2012-09-12 21:01:54.000000', '0rb8Szq7Qw'),
(159, 'Zeng Yuning', '2016-10-19 04:57:52.000000', '2024-05-02 12:38:01.000000', '1IicmSIYgl'),
(160, 'Wan Chieh Lun', '2008-12-25 12:15:26.000000', '2003-01-26 02:11:53.000000', '27qunVltmn'),
(161, 'Kondo Rin', '2020-11-01 11:36:35.000000', '2009-07-17 13:21:40.000000', 'DcUY3Twzl8'),
(162, 'Fang Zitao', '2001-11-07 21:24:55.000000', '2017-12-17 22:11:44.000000', 'M529e56aJ3'),
(163, 'Murata Daichi', '2021-12-10 22:24:00.000000', '2017-11-25 12:01:10.000000', 'QUrb8fQgOJ'),
(164, 'Wei Xiuying', '2019-10-06 21:22:49.000000', '2015-10-07 07:17:16.000000', 'IRHok7WbKF'),
(165, 'Man Wai San', '2005-05-31 15:24:45.000000', '2009-02-23 10:32:47.000000', 'zd2CAw7qsg'),
(166, 'Wang Zitao', '2017-01-11 09:56:31.000000', '2008-01-18 11:26:39.000000', 'XahiR1sZXE'),
(167, 'To Hiu Tung', '2007-11-09 08:34:05.000000', '2019-03-16 07:20:27.000000', 'SE8jjd0zSb'),
(168, 'Zhu Lu', '2014-08-01 00:45:57.000000', '2023-05-30 22:08:24.000000', 'QpUgccuSdH'),
(169, 'Xie Xiaoming', '2018-08-18 15:27:00.000000', '2014-09-04 14:03:28.000000', '2BveZvi7s5'),
(170, 'Chow Wing Suen', '2015-05-13 11:22:27.000000', '2001-12-01 11:09:39.000000', 'rs8KFjplH0'),
(171, 'Cho Wing Fat', '2000-05-10 06:58:54.000000', '2022-08-28 14:43:14.000000', 'ZIX7HaF8Gd'),
(172, 'Ono Mai', '2001-09-29 02:19:07.000000', '2023-12-27 20:59:24.000000', 'hwVJfaQSIO'),
(173, 'Wong Wai Man', '2020-02-20 16:09:30.000000', '2024-10-09 22:50:06.000000', 'ePXAXrSBX7'),
(174, 'Du Yunxi', '2002-09-06 22:52:12.000000', '2017-03-15 20:27:57.000000', 'dD6wuhxzGv'),
(175, 'Michael Rivera', '2011-10-15 23:52:25.000000', '2002-10-17 03:57:16.000000', 'jmutnYJaiI'),
(176, 'So Kwok Wing', '2023-03-30 20:40:05.000000', '2007-09-04 17:02:56.000000', 'zjX5nQBgwg'),
(177, 'Stanley Mcdonald', '2002-06-02 01:32:52.000000', '2020-05-13 01:09:41.000000', 'wYOKM5KKVC'),
(178, 'Raymond Wright', '2007-10-29 01:15:31.000000', '2014-04-28 13:06:30.000000', 'TFzmwemUWG'),
(179, 'Katherine Olson', '2017-11-27 12:49:22.000000', '2006-09-28 22:54:41.000000', 'WXEcAvhJAy'),
(180, 'Xie Zitao', '2014-10-20 15:24:32.000000', '2013-03-09 07:47:56.000000', 'tYdVOjDodg'),
(181, 'Kyle Robinson', '2004-10-19 04:59:47.000000', '2003-02-09 09:29:35.000000', 'EQArDfxhVD'),
(182, 'Joan Phillips', '2012-05-29 05:31:33.000000', '2006-01-21 05:45:59.000000', 'X5sS2QEr4P'),
(183, 'Eddie Kennedy', '2022-09-06 08:52:58.000000', '2004-10-11 20:41:18.000000', '2qi7xTNW4A'),
(184, 'Qiu Rui', '2003-10-03 02:02:08.000000', '2000-06-09 17:53:42.000000', 'gxZ3GNMH0T'),
(185, 'Kojima Ryota', '2019-12-20 03:04:16.000000', '2003-02-23 23:57:08.000000', 'IpcWRJQazM'),
(186, 'Feng Xiaoming', '2018-01-09 03:32:03.000000', '2013-12-03 16:36:11.000000', 'LyW20sZLJW'),
(187, 'Miura Miu', '2017-11-20 10:42:59.000000', '2010-09-23 06:47:03.000000', 'wOuSHF43p5'),
(188, 'Chen Anqi', '2012-07-03 07:25:07.000000', '2008-08-08 17:22:09.000000', '0cLVeQjkX8'),
(189, 'Lui Wing Suen', '2011-02-14 23:04:56.000000', '2002-11-27 10:57:44.000000', 'W9cjBQD0Jl'),
(190, 'Siu Fat', '2011-06-01 07:14:08.000000', '2018-05-30 12:41:29.000000', 'JrYh8onXBP'),
(191, 'Ishikawa Daisuke', '2013-08-19 04:30:52.000000', '2011-09-12 21:12:35.000000', 'IW4qhUh8cW'),
(192, 'Matsumoto Daichi', '2016-10-04 02:32:19.000000', '2017-01-31 06:53:44.000000', 'mIC7pvtyp2'),
(193, 'Hsuan Wai Lam', '2002-05-17 22:33:47.000000', '2001-12-23 01:26:34.000000', 'rUhnorefnt'),
(194, 'Stephanie Brooks', '2001-11-12 21:11:27.000000', '2008-07-29 20:51:17.000000', '0lMkhhFX9O'),
(195, 'Kojima Ayano', '2009-05-22 06:05:36.000000', '2011-03-23 18:51:44.000000', 'pQRRnLubb3'),
(196, 'Zhong Zhennan', '2024-05-10 02:34:23.000000', '2022-04-16 16:34:26.000000', 'rPYZ8C64LC'),
(197, 'Wendy Nguyen', '2000-09-26 16:33:15.000000', '2010-03-14 08:47:14.000000', 'eOQbesArBm'),
(198, 'Nishimura Daisuke', '2003-10-24 10:49:37.000000', '2005-07-13 15:13:06.000000', '3ZjqYVo2YQ'),
(199, 'Hao Anqi', '2004-07-19 12:54:27.000000', '2015-12-26 05:02:39.000000', '6T2xr4BAJL'),
(200, 'He Zitao', '2023-05-10 07:06:56.000000', '2018-09-11 15:47:37.000000', 'CZ8gpo8xHG'),
(201, 'event', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', '1'),
(202, 'event', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', '1'),
(203, 'event', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', '1'),
(204, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', '1'),
(208, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', ''),
(209, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', ''),
(210, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', ''),
(211, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', ''),
(213, 'event_formdata', '2006-07-04 10:19:40.000000', '2006-07-04 10:19:40.000000', ''),
(216, 'f', '2006-07-04 10:19:40.000000', '2006-07-01 10:19:40.000000', '/8-1945.jpg'),
(217, 'f', '2006-07-04 10:19:40.000000', '2006-07-01 10:19:40.000000', 'storage/8-1945.jpg'),
(218, 'f', '2006-07-04 10:19:40.000000', '2006-07-01 10:19:40.000000', '/event_management/storage/8-1945.jpg'),
(219, 'f', '2006-07-04 10:19:40.000000', '2006-07-01 10:19:40.000000', '/event_management/storage/8-1945.jpg'),
(220, 'f', '2006-07-04 10:19:40.000000', '2006-07-01 10:19:40.000000', '/event_management/storage/8-1945.jpg'),
(309, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(310, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(311, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(312, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(313, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(314, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(315, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(316, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '1.png'),
(317, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(318, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(319, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(320, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(321, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(322, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(323, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(324, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', '8-1945.jpg'),
(325, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', 'event_management/storage/event_covers/8-1945.jpg'),
(326, 'ghi ghi', '2006-07-04 10:19:40.000000', '2006-07-08 10:19:40.000000', 'event_management/storage/event_covers/8-1945_0Blrgfs.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `event_participant`
--

CREATE TABLE `event_participant` (
  `id` bigint NOT NULL,
  `event_id` int NOT NULL,
  `participant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_participant`
--

INSERT INTO `event_participant` (`id`, `event_id`, `participant_id`) VALUES
(3001, 10, 1),
(3006, 21, 3),
(3009, 27, 40),
(3005, 52, 8),
(3008, 53, 9),
(3004, 59, 25),
(3007, 104, 6),
(3003, 105, 33),
(3010, 139, 8),
(3002, 170, 51);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `participant_id` int NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`participant_id`, `full_name`, `email`, `phone_number`) VALUES
(1, 'Yokoyama Hana', 'hanayok@outlook.com', '312-633-4754'),
(2, 'Fan Tin Lok', 'ftinlok@gmail.com', '70-8679-6021'),
(3, 'Ishikawa Misaki', 'mishikawa@icloud.com', '90-5488-8026'),
(4, 'Arai Tsubasa', 'tsubasaa@outlook.com', '52-384-2757'),
(5, 'Martin Mendoza', 'mam@icloud.com', '718-922-5302'),
(6, 'Cindy Nelson', 'cindy728@outlook.com', '838-178-2686'),
(7, 'Fong Sum Wing', 'sumwingfo@yahoo.com', '132-9662-6222'),
(8, 'Huang Jialun', 'huanjia@gmail.com', '74-142-8274'),
(9, 'Chiang Ching Wan', 'cwchiang@icloud.com', '769-5081-2506'),
(10, 'Kwok Ka Fai', 'kwokkafai@icloud.com', '195-3610-5046'),
(11, 'Lam Tsz Ching', 'lam6@mail.com', '(116) 319 1756'),
(12, 'He Zhennan', 'hz1@outlook.com', '5105 387187'),
(13, 'Hu Jiehong', 'jiehonghu@yahoo.com', '755-769-6956'),
(14, 'Yoshida Riku', 'yoshriku@outlook.com', '70-5532-7921'),
(15, 'Liu Zhennan', 'zheliu@icloud.com', '7599 200433'),
(16, 'Raymond Moore', 'moore9@outlook.com', '838-677-0348'),
(17, 'Matsuda Kazuma', 'kazumamatsuda@mail.com', '147-4783-0747'),
(18, 'Matsuda Yota', 'matsuda9@hotmail.com', '755-420-2390'),
(19, 'Murakami Kasumi', 'kasumi1958@mail.com', '(116) 611 2698'),
(20, 'Xiang Xiaoming', 'xiangxiaoming3@mail.com', '330-652-2117'),
(21, 'Yuen Chiu Wai', 'yucw@outlook.com', '(1865) 94 3412'),
(22, 'Hsuan Wai Han', 'whh@yahoo.com', '70-1060-9916'),
(23, 'Lin Xiaoming', 'lix@mail.com', '154-2239-9777'),
(24, 'Shimizu Hazuki', 'shihazuk623@gmail.com', '3-1533-0610'),
(25, 'Takada Kenta', 'keta98@outlook.com', '7278 971098'),
(26, 'Sarah Robertson', 'sarahrobertson@gmail.com', '718-694-7691'),
(27, 'Kim Bennett', 'kimb9@yahoo.com', '(116) 095 1417'),
(28, 'Chiang Chi Ming', 'chiang104@yahoo.com', '5570 769371'),
(29, 'Ying Wai Man', 'waimanying@outlook.com', '5268 335330'),
(30, 'Benjamin Ross', 'rossbe@outlook.com', '7463 292635'),
(31, 'Yung Chi Ming', 'chimingyung10@gmail.com', '330-999-3823'),
(32, 'Wada Miu', 'wada609@hotmail.com', '838-492-3131'),
(33, 'Koyama Mio', 'koyamamio@mail.com', '(161) 962 7087'),
(34, 'Brenda Russell', 'russell4@mail.com', '74-895-4957'),
(35, 'Karen Flores', 'florekaren@gmail.com', '312-633-1480'),
(36, 'Chin Kwok Yin', 'kwokyin4@gmail.com', '7623 790075'),
(37, 'Sean James', 'seanjames@outlook.com', '(151) 202 3319'),
(38, 'Ma Lu', 'malu@outlook.com', '(20) 2185 4197'),
(39, 'Chang Yu Ling', 'chang3@hotmail.com', '(121) 485 4027'),
(40, 'Yamada Kasumi', 'ykasumi130@icloud.com', '213-776-8488'),
(41, 'Jane Ortiz', 'ortizjane@gmail.com', '760-6207-6932'),
(42, 'Dennis Marshall', 'mdennis@yahoo.com', '718-801-9986'),
(43, 'Goto Airi', 'gotoai75@gmail.com', '212-205-6741'),
(44, 'Eleanor Stone', 'stoneeleanor@icloud.com', '(116) 322 9431'),
(45, 'Ono Nanami', 'nanao2@gmail.com', '212-867-2254'),
(46, 'Xia Shihan', 'shihan7@icloud.com', '10-699-7234'),
(47, 'Watanabe Sakura', 'saw@outlook.com', '614-113-1294'),
(48, 'Janice Cole', 'janiccol@gmail.com', '312-219-3400'),
(49, 'Loui Hui Mei', 'louihm7@icloud.com', '(1223) 55 8559'),
(51, 'Dennis Mason', 'dem7@outlook.com', '838-854-8891');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_users`
--
ALTER TABLE `api_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_users_email_c3b6f246_uniq` (`email`);

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
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

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
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

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
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_participant`
--
ALTER TABLE `event_participant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_participant_event_id_participant_id_f1cc0cd9_uniq` (`event_id`,`participant_id`),
  ADD KEY `event_participant_participant_id_f6109b23_fk_participa` (`participant_id`),
  ADD KEY `event_participant_event_id_d45c3465` (`event_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`participant_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_users`
--
ALTER TABLE `api_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `event_participant`
--
ALTER TABLE `event_participant`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3011;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `participant_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `event_participant`
--
ALTER TABLE `event_participant`
  ADD CONSTRAINT `event_participant_event_id_d45c3465_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `event_participant_participant_id_f6109b23_fk_participa` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
