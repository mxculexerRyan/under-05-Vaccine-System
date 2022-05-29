-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2022 at 06:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uvmis_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `birth_facilitator`
--

DROP TABLE IF EXISTS `birth_facilitator`;
CREATE TABLE `birth_facilitator` (
  `facilitator_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `birth_facilitator`
--

INSERT INTO `birth_facilitator` (`facilitator_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 'Mtumishi wa Afya', 'Mtumishi wa Afya', 1, '2022-04-07 08:38:52', NULL, NULL, 0, NULL, NULL, NULL, '0ea0b9f4-044d-4e35-94a6-d62ef01647fd'),
(2, 'TBA', 'TBA', 1, '2022-04-07 08:38:52', NULL, NULL, 0, NULL, NULL, NULL, '48bac62f-8f39-4505-a3c8-6144c266739d'),
(3, 'Wengineo', 'Wengineo', 1, '2022-04-07 08:38:52', NULL, NULL, 0, NULL, NULL, NULL, '093bbef5-ea99-4c51-857f-d5ce68c7fb2d');

-- --------------------------------------------------------

--
-- Table structure for table `birth_place`
--

DROP TABLE IF EXISTS `birth_place`;
CREATE TABLE `birth_place` (
  `place_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(250) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `birth_place`
--

INSERT INTO `birth_place` (`place_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 'Hospitalini', 'Hospitalini', 1, '2022-04-07 08:06:16', NULL, NULL, 0, NULL, NULL, NULL, '6b80f484-8e16-45da-b08b-f84ed7186acc'),
(2, 'Nyumbani', 'Nyumbani', 1, '2022-04-07 08:06:16', NULL, NULL, 0, NULL, NULL, NULL, '64cbf7da-3a84-4d2c-afe6-66ee1166009d'),
(3, 'Njiani', 'Njiani', 1, '2022-04-07 08:06:16', NULL, NULL, 0, NULL, NULL, NULL, '20198589-39d2-4b90-82f9-7558fe0cc0f8');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` datetime NOT NULL,
  `birth_no` varchar(58) DEFAULT NULL,
  `birth_place` int(11) NOT NULL,
  `birth_facilitator` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `first_name`, `middle_name`, `last_name`, `gender`, `dob`, `birth_no`, `birth_place`, `birth_facilitator`, `creator`, `date_created`, `change_by`, `date_changed`, `uuid`) VALUES
(1, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-31 06:01:00', '', 1, 1, 1, '2022-04-13 15:00:52', NULL, NULL, 'b0279e07-c7db-44e2-8405-7e1c7a0df41b'),
(2, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-30 11:35:00', '', 1, 1, 1, '2022-04-18 08:36:32', NULL, NULL, 'dafa4550-c59e-4e9f-8d95-a89ab4159d86'),
(3, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-30 11:35:00', '', 1, 1, 1, '2022-04-18 08:40:00', NULL, NULL, 'e89e17de-3d67-4efd-a02a-e2259326079e'),
(4, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-30 11:35:00', '', 1, 1, 1, '2022-04-18 08:40:06', NULL, NULL, '96c7fac7-99c6-46ed-ab99-8f36c547ba18'),
(5, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-30 11:35:00', '', 1, 1, 1, '2022-04-18 08:40:20', NULL, NULL, 'fc8dcaf8-813d-4319-87fa-273948cfe33a'),
(6, 'Mwayinga', 'Patrick', 'Jickson', 1, '2022-03-30 11:35:00', '', 1, 1, 1, '2022-04-18 08:41:26', NULL, NULL, 'cab7c864-688b-469b-8def-7a86e8221275'),
(7, 'kimeme', 'ray', 'kimomo', 2, '2022-04-28 10:28:00', '', 2, 3, 1, '2022-04-27 07:29:35', NULL, NULL, '55b87130-b832-44e0-be71-53aaa4aef45b'),
(8, 'kimeme', 'ray', 'kimomo', 2, '2022-04-28 10:28:00', '', 2, 3, 1, '2022-04-27 07:29:48', NULL, NULL, '700b9483-b954-44ab-b6b9-27537ef4910a'),
(9, 'kimeme', 'ray', 'kimomo', 2, '2022-04-28 10:28:00', '', 2, 3, 1, '2022-04-27 07:29:56', NULL, NULL, '5a852b89-2f35-49e1-a39f-226ea860188f'),
(12, 'hussein', 'sida', 'pamela', 1, '2022-05-01 16:08:00', '', 1, 1, 1, '2022-05-01 15:09:13', NULL, NULL, 'ea327dc1-626a-4df6-a988-d52e1a05a627'),
(13, 'adelina', 'ade', 'patr', 2, '2022-05-01 17:16:00', '098751', 1, 1, 1, '2022-05-01 16:18:00', NULL, NULL, '00be7f0c-cd72-46f9-be95-7b3ea7f5f90d');

-- --------------------------------------------------------

--
-- Table structure for table `client_location`
--

DROP TABLE IF EXISTS `client_location`;
CREATE TABLE `client_location` (
  `location_id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `mtaa` varchar(100) NOT NULL,
  `kijiji` varchar(100) NOT NULL,
  `kitongoji` varchar(100) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_location`
--

INSERT INTO `client_location` (`location_id`, `client`, `mtaa`, `kijiji`, `kitongoji`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 1, 'chonyoya', 'kinyoozi', 'kitongo', 1, '2022-04-13 18:00:52', NULL, NULL, 'b0279e07-c7db-44e2-8405-7e1c7a0df41b'),
(2, 2, 'chonyoya1', 'kinyoozi1', 'kitongo1', 1, '2022-04-18 11:36:32', NULL, NULL, 'dafa4550-c59e-4e9f-8d95-a89ab4159d86'),
(3, 3, 'chonyoya1', 'kinyoozi1', 'kitongo1', 1, '2022-04-18 11:40:00', NULL, NULL, 'e89e17de-3d67-4efd-a02a-e2259326079e'),
(4, 4, 'chonyoya1', 'kinyoozi1', 'kitongo1', 1, '2022-04-18 11:40:06', NULL, NULL, '96c7fac7-99c6-46ed-ab99-8f36c547ba18'),
(5, 5, 'chonyoya1', 'kinyoozi1', 'kitongo1', 1, '2022-04-18 11:40:20', NULL, NULL, 'fc8dcaf8-813d-4319-87fa-273948cfe33a'),
(6, 6, 'chonyoya1', 'kinyoozi1', 'kitongo1', 1, '2022-04-18 11:41:26', NULL, NULL, 'cab7c864-688b-469b-8def-7a86e8221275'),
(7, 7, 'kashai', 'igoma', 'kagera', 1, '2022-04-27 10:29:35', NULL, NULL, '55b87130-b832-44e0-be71-53aaa4aef45b'),
(8, 8, 'kashai', 'igoma', 'kagera', 1, '2022-04-27 10:29:48', NULL, NULL, '700b9483-b954-44ab-b6b9-27537ef4910a'),
(9, 9, 'kashai', 'igoma', 'kagera', 1, '2022-04-27 10:29:56', NULL, NULL, '5a852b89-2f35-49e1-a39f-226ea860188f'),
(12, 12, 'kijitonyama', 'kigogo', 'busisi', 1, '2022-05-01 18:09:13', NULL, NULL, 'ea327dc1-626a-4df6-a988-d52e1a05a627'),
(13, 13, 'ilala', 'kilima', 'kitonga', 1, '2022-05-01 19:18:00', NULL, NULL, '00be7f0c-cd72-46f9-be95-7b3ea7f5f90d');

-- --------------------------------------------------------

--
-- Table structure for table `client_parent`
--

DROP TABLE IF EXISTS `client_parent`;
CREATE TABLE `client_parent` (
  `client_parent_id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `relation` int(11) NOT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_parent`
--

INSERT INTO `client_parent` (`client_parent_id`, `client`, `parent`, `relation`, `uuid`) VALUES
(1, 1, 1, 2, '85b3a0ad-d9cf-4096-9341-7bc7a3a94407'),
(2, 1, 2, 1, '10380982-c3a5-4fd9-8e97-ec1aeb487148'),
(3, 2, 3, 2, 'dade44e2-5985-4c8c-8453-14c964dca6d7'),
(4, 2, 4, 2, 'dc3093bb-b9c3-4cc5-9a02-1f08a78394b2'),
(5, 3, 5, 2, '98243525-1d94-4ecd-b787-5b12ad4de364'),
(6, 3, 6, 2, '2c563974-96f0-4c21-96fd-cf222821478d'),
(7, 4, 7, 2, '976323d2-77b2-4325-867b-8f77c668a878'),
(8, 4, 8, 2, '59d90bd1-8c1e-4c87-823d-4d6c4730162b'),
(9, 5, 9, 2, '9e55e3ca-7608-4148-a174-2ab2a61d8a6b'),
(10, 5, 10, 2, 'd533d216-d600-43f6-9e01-a1c82dec6316'),
(11, 6, 11, 2, '34e6a563-0304-4a9e-a6ed-0dee52e648ee'),
(12, 6, 12, 2, '8550f1fb-7154-4f21-a801-4aea9d95f41e'),
(13, 7, 13, 2, '79b66d1b-1963-4516-bc05-4aa4a719c271'),
(14, 7, 14, 1, 'a229ffbd-9514-4ee8-a87d-caed767de9a0'),
(15, 8, 15, 2, '387bb812-b59d-436b-8b51-9a01f0695743'),
(16, 8, 16, 1, 'f97c56b2-b163-43d0-b21c-a08967a74a13'),
(17, 9, 17, 2, '46f467f9-897a-4dd8-8a40-427dc617563b'),
(18, 9, 18, 1, 'cee9e3e0-724e-498a-bb80-21cbc9e94cc7'),
(23, 12, 23, 2, 'f4adf21e-6a49-4fa2-8d1c-111eb57d8bd9'),
(24, 12, 24, 1, 'ade5df85-71d3-4181-bfc3-4cda0f2ee561'),
(25, 13, 25, 2, 'bae82fb2-3951-4432-acb1-a6bf6c2a1a05'),
(26, 13, 26, 1, '7888c632-46ef-4c44-be46-7e5d8a3db36d');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'Male', 'Male', 1, '2022-04-03 06:57:55', NULL, NULL, 'c9521bb2-0a59-4d2a-874b-c29754947119'),
(2, 'Female', 'Female', 1, '2022-04-03 06:57:55', NULL, NULL, '684fcc5f-6ab0-4622-b644-ebeca1cd1e65');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `item_units_id` int(11) DEFAULT NULL,
  `batch_no` varchar(25) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` double DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1= stockin , 2 = stockout',
  `stock_from` varchar(100) NOT NULL COMMENT 'sales/receiving',
  `form_id` int(30) NOT NULL,
  `expiry_date` date NOT NULL,
  `expired_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `other_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`other_details`)),
  `remarks` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(65, 425, 11, '21020', 11, 500, 1, 'receiving', 65, '2023-03-01', 0, '{\"price\":\"500\",\"qty\":\"11\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:56'),
(66, 356, 11, '21003', 5, 500, 1, 'receiving', 65, '2023-12-01', 0, '{\"price\":\"500\",\"qty\":\"5\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:57'),
(67, 808, 11, '10201100', 1, 5380, 1, 'receiving', 65, '2022-05-01', 0, '{\"price\":\"5380\",\"qty\":\"1\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:57'),
(68, 1023, 11, '02002', 3, 580, 1, 'receiving', 65, '2022-07-01', 0, '{\"price\":\"580\",\"qty\":\"3\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:57'),
(69, 309, 11, '21054', 9, 1100, 1, 'receiving', 65, '2025-05-01', 0, '{\"price\":\"1100\",\"qty\":\"9\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:58'),
(70, 683, 11, '21009', 3, 6000, 1, 'receiving', 65, '2023-02-01', 0, '{\"price\":\"6000\",\"qty\":\"3\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:58'),
(71, 2497, 11, '21040', 8, 700, 1, 'receiving', 65, '2023-04-01', 0, '{\"price\":\"700\",\"qty\":\"8\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:58'),
(72, 874, 11, '21163', 6, 520, 1, 'receiving', 65, '2023-02-01', 0, '{\"price\":\"520\",\"qty\":\"6\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:58'),
(73, 717, 11, '21014', 4, 520, 1, 'receiving', 65, '2023-01-01', 0, '{\"price\":\"520\",\"qty\":\"4\"}', 'Stock from Receiving-57361682\n', '2021-09-01 22:18:58'),
(74, 919, 1, 'PW1917TA', 30, 700, 1, 'receiving', 66, '2022-01-08', 0, '{\"price\":\"700\",\"qty\":\"30\"}', 'Stock from Receiving-19106233\n', '2021-09-02 22:19:46'),
(75, 1298, 1, '1A20C1', 30, 700, 1, 'receiving', 67, '2023-01-01', 0, '{\"price\":\"700\",\"qty\":\"30\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:14'),
(76, 1300, 1, '24709', 60, 3600, 1, 'receiving', 67, '2022-01-07', 0, '{\"price\":\"3600\",\"qty\":\"60\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:15'),
(77, 1303, 2, '098521AA', 30, 800, 1, 'receiving', 67, '2022-01-07', 0, '{\"price\":\"800\",\"qty\":\"30\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:15'),
(78, 1302, 1, 'QB139753', 20, 700, 1, 'receiving', 67, '2021-01-12', 0, '{\"price\":\"700\",\"qty\":\"20\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:15'),
(79, 1301, 2, 'OT2018AA', 30, 700, 1, 'receiving', 67, '2024-01-06', 0, '{\"price\":\"700\",\"qty\":\"30\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:16'),
(80, 1304, 2, '078044AX', 60, 850, 1, 'receiving', 67, '2022-01-02', 0, '{\"price\":\"850\",\"qty\":\"60\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:16'),
(81, 694, 2, 'P80672', 180, 720, 1, 'receiving', 67, '2022-01-08', 0, '{\"price\":\"720\",\"qty\":\"180\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:16'),
(82, 1305, 1, '0F17F3', 20, 450, 1, 'receiving', 67, '2023-01-06', 0, '{\"price\":\"450\",\"qty\":\"20\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:16'),
(83, 1307, 1, '8K28G3', 30, 980, 1, 'receiving', 67, '2021-01-11', 0, '{\"price\":\"980\",\"qty\":\"30\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:16'),
(84, 1308, 1, '1B01F1', 30, 650, 1, 'receiving', 67, '2023-01-01', 0, '{\"price\":\"650\",\"qty\":\"30\"}', 'Stock from Receiving-76347965\n', '2021-09-02 22:39:17'),
(85, 1297, 1, 'PA09750', 49, 260, 1, 'receiving', 68, '2023-01-08', 0, '{\"price\":\"260\",\"qty\":\"49\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(86, 1239, 2, '1950438', 25, 600, 1, 'receiving', 68, '2022-01-07', 0, '{\"price\":\"600\",\"qty\":\"25\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(87, 2592, 2, '206770', 46, 600, 1, 'receiving', 68, '2022-01-12', 0, '{\"price\":\"600\",\"qty\":\"46\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(88, 952, 2, 'P013', 30, 700, 1, 'receiving', 68, '2022-01-10', 0, '{\"price\":\"700\",\"qty\":\"30\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(89, 2593, 1, '0K05A6', 37, 1400, 1, 'receiving', 68, '2022-01-11', 0, '{\"price\":\"1400\",\"qty\":\"37\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(90, 2519, 2, '1C14B1', 162, 280, 1, 'receiving', 68, '2023-01-03', 0, '{\"price\":\"280\",\"qty\":\"162\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(91, 2520, 1, '1B27F1', 60, 120, 1, 'receiving', 68, '2023-01-02', 0, '{\"price\":\"120\",\"qty\":\"60\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(92, 636, 2, '78308', 160, 50, 1, 'receiving', 68, '2024-01-02', 0, '{\"price\":\"50\",\"qty\":\"160\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(93, 662, 2, '9L73', 235, 40, 1, 'receiving', 68, '2022-01-11', 0, '{\"price\":\"40\",\"qty\":\"235\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(94, 2590, 27, 'MN209', 40, 100, 1, 'receiving', 68, '2022-01-07', 0, '{\"price\":\"100\",\"qty\":\"40\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(95, 917, 2, '0B89', 193, 110, 1, 'receiving', 68, '2022-01-07', 0, '{\"price\":\"110\",\"qty\":\"193\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(96, 1252, 2, 'ET 339', 460, 50, 1, 'receiving', 68, '2023-01-06', 0, '{\"price\":\"50\",\"qty\":\"460\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(97, 1291, 251, 'U5U1', 4, 14000, 1, 'receiving', 68, '2023-01-02', 0, '{\"price\":\"14000\",\"qty\":\"4\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(98, 1292, 274, '14894400', 1, 12000, 1, 'receiving', 68, '2023-01-01', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(99, 2588, 274, '15018600', 1, 12000, 1, 'receiving', 68, '2023-01-02', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(100, 2589, 274, '14894500', 1, 12000, 1, 'receiving', 68, '2023-01-01', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(101, 1294, 2, '6745/2016', 120, 280, 1, 'receiving', 68, '2022-01-04', 0, '{\"price\":\"280\",\"qty\":\"120\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(102, 1295, 27, '0043', 48, 1100, 1, 'receiving', 68, '2022-01-08', 0, '{\"price\":\"1100\",\"qty\":\"48\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(103, 2594, 35, '2003325', 5, 10000, 1, 'receiving', 68, '2022-01-06', 0, '{\"price\":\"10000\",\"qty\":\"5\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(104, 1261, 2, 'WX001', 60, 89, 1, 'receiving', 68, '2022-01-22', 0, '{\"price\":\"89\",\"qty\":\"60\"}', 'Stock from Receiving-89730406\r\n', '2021-09-02 23:45:40'),
(105, 1309, 1, '', 81, 260, 1, 'receiving', 68, '0000-00-00', 0, '{\"price\":\"260\",\"qty\":\"81\"}', 'Stock from Receiving-89730406\r\n', '2021-09-03 21:15:23'),
(106, 2597, 2, '', 52, 600, 1, 'receiving', 68, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"52\"}', 'Stock from Receiving-89730406\r\n', '2021-09-03 21:15:46'),
(107, 1257, 2, '', 60, 760, 1, 'receiving', 68, '0000-00-00', 0, '{\"price\":\"760\",\"qty\":\"60\"}', 'Stock from Receiving-89730406\r\n', '2021-09-03 21:16:23'),
(108, 1314, 1, '14278900', 20, 580, 1, 'receiving', 69, '2022-01-12', 0, '{\"price\":\"580\",\"qty\":\"20\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:27'),
(109, 1311, 2, '14277300', 13, 600, 1, 'receiving', 69, '2022-01-12', 0, '{\"price\":\"600\",\"qty\":\"13\"}', 'Stock from Receiving-31390471\n', '2021-09-03 21:13:43'),
(110, 1312, 2, '13535000', 20, 480, 1, 'receiving', 69, '2022-01-02', 0, '{\"price\":\"480\",\"qty\":\"20\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(111, 1315, 1, '14902500', 25, 690, 1, 'receiving', 69, '2023-01-07', 0, '{\"price\":\"690\",\"qty\":\"25\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(112, 1313, 2, '14902300', 20, 750, 1, 'receiving', 69, '2023-01-07', 0, '{\"price\":\"750\",\"qty\":\"20\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(113, 2595, 30, '26031131', 7, 28000, 1, 'receiving', 69, '2022-01-08', 0, '{\"price\":\"28000\",\"qty\":\"7\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(114, 2598, 30, 'GLD07162', 3, 28000, 1, 'receiving', 69, '2022-01-07', 0, '{\"price\":\"28000\",\"qty\":\"3\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(115, 536, 11, '1811191908', 9, 990, 1, 'receiving', 69, '2021-01-11', 0, '{\"price\":\"990\",\"qty\":\"9\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:28'),
(116, 535, 11, '07907321', 5, 1650, 1, 'receiving', 69, '2023-01-09', 0, '{\"price\":\"1650\",\"qty\":\"5\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(117, 1126, 11, '06496', 10, 990, 1, 'receiving', 69, '2023-01-11', 0, '{\"price\":\"990\",\"qty\":\"10\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(118, 1123, 11, '31710421', 7, 1400, 1, 'receiving', 69, '2024-01-02', 0, '{\"price\":\"1400\",\"qty\":\"7\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(119, 1121, 11, '1A10478', 4, 990, 1, 'receiving', 69, '2023-01-12', 0, '{\"price\":\"990\",\"qty\":\"4\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(120, 2605, 30, '000101572', 1, 24000, 1, 'receiving', 69, '2090-01-02', 0, '{\"price\":\"24000\",\"qty\":\"1\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(121, 2601, 18, '20160028', 4, 125000, 1, 'receiving', 69, '2090-01-01', 0, '{\"price\":\"125000\",\"qty\":\"4\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(122, 2604, 30, '46204EN', 1, 7500, 1, 'receiving', 69, '2090-01-01', 0, '{\"price\":\"7500\",\"qty\":\"1\"}', 'Stock from Receiving-31390471\n', '2021-09-03 00:14:29'),
(123, 2606, 287, 'E16UP19018', 2, 2720, 1, 'receiving', 70, '2022-06-30', 0, '{\"price\":\"2720\",\"qty\":\"2\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:06'),
(124, 2607, 287, '2102022', 3, 3350, 1, 'receiving', 70, '2022-06-30', 0, '{\"price\":\"3350\",\"qty\":\"3\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:06'),
(125, 2608, 287, 'HT.202', 1, 1950, 1, 'receiving', 70, '2022-01-31', 0, '{\"price\":\"1950\",\"qty\":\"1\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:06'),
(126, 1100, 11, 'Y013UJ', 2, 3650, 1, 'receiving', 70, '2022-07-31', 0, '{\"price\":\"3650\",\"qty\":\"2\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:06'),
(127, 2515, 11, 'Y046UF', 2, 3550, 1, 'receiving', 70, '2022-05-31', 0, '{\"price\":\"3550\",\"qty\":\"2\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:06'),
(128, 878, 11, 'TN080006', 2, 2950, 1, 'receiving', 70, '2023-05-31', 0, '{\"price\":\"2950\",\"qty\":\"2\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:07'),
(129, 782, 11, 'EU0005', 3, 3900, 1, 'receiving', 70, '2023-07-31', 0, '{\"price\":\"3900\",\"qty\":\"3\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:07'),
(130, 2499, 11, 'LB20004', 1, 3900, 1, 'receiving', 70, '2022-09-30', 0, '{\"price\":\"3900\",\"qty\":\"1\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:07'),
(131, 2609, 11, '21042', 2, 2800, 1, 'receiving', 70, '2024-06-30', 0, '{\"price\":\"2800\",\"qty\":\"2\"}', 'Stock from Receiving-75672813\n', '2021-09-03 22:08:07'),
(132, 565, 11, 'CCC31A1', 4, 6710, 1, 'receiving', 71, '2022-08-31', 0, '{\"price\":\"6710\",\"qty\":\"4\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:00'),
(133, 2611, 11, '1002', 1, 1760, 1, 'receiving', 71, '2023-08-31', 0, '{\"price\":\"1760\",\"qty\":\"1\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:00'),
(134, 1253, 11, 'LG1004', 4, 950, 1, 'receiving', 71, '2023-02-28', 0, '{\"price\":\"950\",\"qty\":\"4\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:00'),
(135, 2612, 287, 'LF1006', 4, 1850, 1, 'receiving', 71, '2023-02-28', 0, '{\"price\":\"1850\",\"qty\":\"4\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:00'),
(136, 918, 11, '2102142', 4, 1100, 1, 'receiving', 71, '2023-01-31', 0, '{\"price\":\"1100\",\"qty\":\"4\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:00'),
(137, 2610, 11, 'C000030', 1, 3650, 1, 'receiving', 71, '2022-01-31', 0, '{\"price\":\"3650\",\"qty\":\"1\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:01'),
(138, 2461, 11, 'OH67', 1, 1500, 1, 'receiving', 71, '2022-07-31', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:01'),
(139, 2460, 11, 'J043', 1, 1570, 1, 'receiving', 71, '2023-09-30', 0, '{\"price\":\"1570\",\"qty\":\"1\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:01'),
(140, 2458, 11, '10210690', 5, 1430, 1, 'receiving', 71, '2025-02-28', 0, '{\"price\":\"1430\",\"qty\":\"5\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:01'),
(141, 2459, 11, '10202195', 5, 3300, 1, 'receiving', 71, '2024-10-31', 0, '{\"price\":\"3300\",\"qty\":\"5\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:01'),
(142, 242, 11, 'G3307', 2, 5780, 1, 'receiving', 71, '2023-07-31', 0, '{\"price\":\"5780\",\"qty\":\"2\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:02'),
(143, 962, 1, 'OP20029', 88, 33, 1, 'receiving', 71, '2023-11-30', 0, '{\"price\":\"33\",\"qty\":\"88\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:02'),
(144, 1059, 2, 'AR18E0014', 39, 4700, 1, 'receiving', 71, '2022-05-31', 0, '{\"price\":\"4700\",\"qty\":\"39\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:02'),
(145, 990, 2, 'PSM20131-40A', 163, 213, 1, 'receiving', 71, '2022-09-30', 0, '{\"price\":\"213\",\"qty\":\"163\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:03'),
(146, 785, 1, 'Y19198', 70, 158, 1, 'receiving', 71, '2021-11-30', 0, '{\"price\":\"158\",\"qty\":\"70\"}', 'Stock from Receiving-10578609\n', '2021-09-03 23:02:03'),
(147, 2655, 2, 'ERW21001B', 88, 183, 1, 'receiving', 72, '2023-02-28', 0, '{\"price\":\"183\",\"qty\":\"88\"}', 'Stock from Receiving-24462483\n', '2021-09-03 23:09:08'),
(148, 1269, 2, '2105098', 80, 110, 1, 'receiving', 73, '2024-04-30', 0, '{\"price\":\"110\",\"qty\":\"80\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:18'),
(149, 913, 2, 'KUSA20011', 52, 580, 1, 'receiving', 73, '2022-11-30', 0, '{\"price\":\"580\",\"qty\":\"52\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:18'),
(150, 2450, 2, 'BRA08077A', 101, 320, 1, 'receiving', 73, '2022-07-31', 0, '{\"price\":\"320\",\"qty\":\"101\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:18'),
(151, 523, 2, 'G000301', 2, 510, 1, 'receiving', 73, '2021-12-31', 0, '{\"price\":\"510\",\"qty\":\"2\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:18'),
(152, 2493, 2, '2103810002', 20, 410, 1, 'receiving', 73, '2023-02-28', 0, '{\"price\":\"410\",\"qty\":\"20\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:18'),
(153, 428, 2, 'TP0076', 35, 25, 1, 'receiving', 73, '2022-11-30', 0, '{\"price\":\"25\",\"qty\":\"35\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:19'),
(154, 2465, 2, 'ST.335', 300, 45, 1, 'receiving', 73, '2023-05-31', 0, '{\"price\":\"45\",\"qty\":\"300\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:19'),
(155, 525, 2, 'E5A028', 534, 90, 1, 'receiving', 73, '2026-01-31', 0, '{\"price\":\"90\",\"qty\":\"534\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:19'),
(156, 2494, 2, '88353', 13, 90, 1, 'receiving', 73, '2025-06-30', 0, '{\"price\":\"90\",\"qty\":\"13\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:19'),
(157, 208, 2, '10G0028', 100, 45, 1, 'receiving', 73, '2022-06-30', 0, '{\"price\":\"45\",\"qty\":\"100\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:19'),
(158, 1084, 2, '200174', 130, 30, 1, 'receiving', 73, '2024-05-31', 0, '{\"price\":\"30\",\"qty\":\"130\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:20'),
(159, 1029, 2, '211056', 305, 35, 1, 'receiving', 73, '2025-04-30', 0, '{\"price\":\"35\",\"qty\":\"305\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:20'),
(160, 415, 2, 'CCT20002E', 75, 48, 1, 'receiving', 73, '2022-09-30', 0, '{\"price\":\"48\",\"qty\":\"75\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:20'),
(161, 818, 2, 'CA05561', 100, 110, 1, 'receiving', 73, '2023-04-30', 0, '{\"price\":\"110\",\"qty\":\"100\"}', 'Stock from Receiving-03775693\n', '2021-09-04 00:08:20'),
(162, 2656, 2, 'FOX2021', 180, 40, 1, 'receiving', 74, '2022-05-31', 0, '{\"price\":\"40\",\"qty\":\"180\"}', 'Stock from Receiving-35281783\n', '2021-09-04 00:23:27'),
(163, 2477, 170, '21010', 4, 450, 1, 'receiving', 74, '2023-05-04', 0, '{\"price\":\"450\",\"qty\":\"4\"}', 'Stock from Receiving-35281783\n', '2021-09-04 00:23:27'),
(164, 968, 27, '2011045', 22, 210, 1, 'receiving', 74, '2023-10-31', 0, '{\"price\":\"210\",\"qty\":\"22\"}', 'Stock from Receiving-35281783\n', '2021-09-04 00:23:27'),
(165, 2657, 170, '2010015', 3, 450, 1, 'receiving', 75, '2023-09-30', 0, '{\"price\":\"450\",\"qty\":\"3\"}', 'Stock from Receiving-08609757\n', '2021-09-04 00:29:15'),
(166, 2633, 11, '2101045', 4, 2100, 1, 'receiving', 76, '2023-12-31', 0, '{\"price\":\"2100\",\"qty\":\"4\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:28'),
(167, 2632, 11, '2007278', 6, 2100, 1, 'receiving', 76, '2022-06-30', 0, '{\"price\":\"2100\",\"qty\":\"6\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:28'),
(168, 2634, 11, '2008221', 4, 2100, 1, 'receiving', 76, '2023-07-31', 0, '{\"price\":\"2100\",\"qty\":\"4\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:28'),
(169, 2635, 11, '2009154', 3, 1700, 1, 'receiving', 76, '2023-08-31', 0, '{\"price\":\"1700\",\"qty\":\"3\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(170, 347, 11, 'HE189012', 2, 2670, 1, 'receiving', 76, '2022-10-31', 0, '{\"price\":\"2670\",\"qty\":\"2\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(171, 2629, 11, '9K2111', 3, 10000, 1, 'receiving', 76, '2022-08-31', 0, '{\"price\":\"10000\",\"qty\":\"3\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(172, 2631, 11, '0K1592', 5, 10000, 1, 'receiving', 76, '2022-08-31', 0, '{\"price\":\"10000\",\"qty\":\"5\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(173, 2630, 11, '479', 4, 10000, 1, 'receiving', 76, '2023-02-28', 0, '{\"price\":\"10000\",\"qty\":\"4\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(174, 2627, 11, 'KR9007', 1, 1900, 1, 'receiving', 76, '2022-09-30', 0, '{\"price\":\"1900\",\"qty\":\"1\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:29'),
(175, 2626, 11, '1VA21001', 2, 2900, 1, 'receiving', 76, '2024-02-29', 0, '{\"price\":\"2900\",\"qty\":\"2\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:30'),
(176, 862, 11, '508Y1', 3, 5200, 1, 'receiving', 76, '2023-04-30', 0, '{\"price\":\"5200\",\"qty\":\"3\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:30'),
(177, 2492, 11, '325691', 2, 8990, 1, 'receiving', 76, '2023-07-31', 0, '{\"price\":\"8990\",\"qty\":\"2\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:30'),
(178, 488, 11, '324905', 3, 9000, 1, 'receiving', 76, '2023-05-31', 0, '{\"price\":\"9000\",\"qty\":\"3\"}', 'Stock from Receiving-39688922\n', '2021-09-04 15:23:30'),
(179, 2615, 11, '210880', 2, 2100, 1, 'receiving', 77, '2024-03-31', 0, '{\"price\":\"2100\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:06'),
(180, 2617, 11, '202246', 2, 2100, 1, 'receiving', 77, '2023-10-31', 0, '{\"price\":\"2100\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(181, 2616, 11, '200876', 2, 2100, 1, 'receiving', 77, '2023-06-30', 0, '{\"price\":\"2100\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(182, 2619, 11, '88305', 3, 1800, 1, 'receiving', 77, '2023-01-31', 0, '{\"price\":\"1800\",\"qty\":\"3\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(183, 2618, 11, 'SE914', 1, 1800, 1, 'receiving', 77, '2021-11-30', 0, '{\"price\":\"1800\",\"qty\":\"1\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(184, 2621, 11, 'SK301', 2, 1900, 1, 'receiving', 77, '2022-12-31', 0, '{\"price\":\"1900\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(185, 2620, 11, 'LD1038', 4, 2100, 1, 'receiving', 77, '2023-03-31', 0, '{\"price\":\"2100\",\"qty\":\"4\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:07'),
(186, 2622, 11, 'PZF21008', 5, 1400, 1, 'receiving', 77, '2024-01-31', 0, '{\"price\":\"1400\",\"qty\":\"5\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:08'),
(187, 2623, 11, '21001', 4, 1400, 1, 'receiving', 77, '2023-03-31', 0, '{\"price\":\"1400\",\"qty\":\"4\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:08'),
(188, 2625, 11, '2003199', 1, 1600, 1, 'receiving', 77, '2022-02-28', 0, '{\"price\":\"1600\",\"qty\":\"1\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:08'),
(189, 2624, 11, 'LZ0024', 3, 2100, 1, 'receiving', 77, '2022-09-30', 0, '{\"price\":\"2100\",\"qty\":\"3\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:09'),
(190, 2636, 11, '2106100', 4, 1400, 1, 'receiving', 77, '2023-01-31', 0, '{\"price\":\"1400\",\"qty\":\"4\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:09'),
(191, 2637, 11, '2012002', 3, 1400, 1, 'receiving', 77, '2022-11-30', 0, '{\"price\":\"1400\",\"qty\":\"3\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:09'),
(192, 83, 287, 'EA210', 2, 2150, 1, 'receiving', 77, '2022-11-30', 0, '{\"price\":\"2150\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:10'),
(193, 82, 287, 'EM304', 2, 2150, 1, 'receiving', 77, '2023-03-31', 0, '{\"price\":\"2150\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:10'),
(194, 2613, 11, '21017', 5, 950, 1, 'receiving', 77, '2024-03-31', 0, '{\"price\":\"950\",\"qty\":\"5\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:10'),
(195, 2614, 11, '301', 2, 1450, 1, 'receiving', 77, '2022-12-31', 0, '{\"price\":\"1450\",\"qty\":\"2\"}', 'Stock from Receiving-36703321\n', '2021-09-04 16:05:10'),
(196, 2658, 287, '190004', 2, 1000, 1, 'receiving', 78, '2022-05-31', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:52'),
(197, 1175, 283, 'CC21', 3, 620, 1, 'receiving', 78, '2024-01-31', 0, '{\"price\":\"620\",\"qty\":\"3\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:52'),
(198, 424, 10, 'C135', 4, 450, 1, 'receiving', 78, '2023-10-31', 0, '{\"price\":\"450\",\"qty\":\"4\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:52'),
(199, 2425, 10, 'C023', 2, 3850, 1, 'receiving', 78, '2022-10-31', 0, '{\"price\":\"3850\",\"qty\":\"2\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:52'),
(200, 2511, 283, 'AH20005', 5, 650, 1, 'receiving', 78, '2022-09-30', 0, '{\"price\":\"650\",\"qty\":\"5\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(201, 2463, 11, 'F11079F', 1, 1800, 1, 'receiving', 78, '2022-11-30', 0, '{\"price\":\"1800\",\"qty\":\"1\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(202, 2422, 11, '20E07GB', 1, 8500, 1, 'receiving', 78, '2022-02-28', 0, '{\"price\":\"8500\",\"qty\":\"1\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(203, 2420, 11, '68K01120', 2, 1300, 1, 'receiving', 78, '2023-10-31', 0, '{\"price\":\"1300\",\"qty\":\"2\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(204, 423, 11, 'CYB010', 3, 450, 1, 'receiving', 78, '2022-11-30', 0, '{\"price\":\"450\",\"qty\":\"3\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(205, 2423, 11, '080E087', 3, 2850, 1, 'receiving', 78, '2022-04-30', 0, '{\"price\":\"2850\",\"qty\":\"3\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(206, 2419, 11, 'SSG2007003', 3, 3400, 1, 'receiving', 78, '2022-06-30', 0, '{\"price\":\"3400\",\"qty\":\"3\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:53'),
(207, 1187, 11, 'KJ001F', 2, 1550, 1, 'receiving', 78, '2023-05-31', 0, '{\"price\":\"1550\",\"qty\":\"2\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:54'),
(208, 2421, 11, 'JW0012', 3, 2950, 1, 'receiving', 78, '2022-08-31', 0, '{\"price\":\"2950\",\"qty\":\"3\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:54'),
(209, 1183, 11, 'BA0003', 2, 2850, 1, 'receiving', 78, '2023-06-30', 0, '{\"price\":\"2850\",\"qty\":\"2\"}', 'Stock from Receiving-65120429\n', '2021-09-04 16:49:54'),
(210, 2659, 11, '080F019', 2, 1550, 1, 'receiving', 79, '2022-05-31', 0, '{\"price\":\"1550\",\"qty\":\"2\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:29'),
(211, 2472, 11, '20057', 3, 980, 1, 'receiving', 79, '2022-10-31', 0, '{\"price\":\"980\",\"qty\":\"3\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:29'),
(212, 279, 11, 'EM120', 2, 6500, 1, 'receiving', 79, '2023-09-30', 0, '{\"price\":\"6500\",\"qty\":\"2\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:29'),
(213, 2476, 11, 'KT0002', 3, 2550, 1, 'receiving', 79, '2022-07-31', 0, '{\"price\":\"2550\",\"qty\":\"3\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(214, 2469, 11, '212348', 2, 1500, 1, 'receiving', 79, '2022-04-30', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(215, 2432, 11, '20014', 3, 980, 1, 'receiving', 79, '2022-09-30', 0, '{\"price\":\"980\",\"qty\":\"3\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(216, 682, 11, 'GNC009', 7, 450, 1, 'receiving', 79, '2022-08-31', 0, '{\"price\":\"450\",\"qty\":\"7\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(217, 2429, 11, 'DRC010', 3, 1100, 1, 'receiving', 79, '2022-08-31', 0, '{\"price\":\"1100\",\"qty\":\"3\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(218, 2428, 11, 'KS0004', 2, 2350, 1, 'receiving', 79, '2022-07-31', 0, '{\"price\":\"2350\",\"qty\":\"2\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:30'),
(219, 2427, 11, '10193042', 3, 4200, 1, 'receiving', 79, '2021-11-30', 0, '{\"price\":\"4200\",\"qty\":\"3\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:31'),
(220, 2426, 11, '46DT', 2, 8151, 1, 'receiving', 79, '2023-05-31', 0, '{\"price\":\"8151\",\"qty\":\"2\"}', 'Stock from Receiving-90921208\n', '2021-09-04 17:29:31'),
(221, 2660, 11, 'SCD2007009', 2, 2200, 1, 'receiving', 80, '2022-06-30', 0, '{\"price\":\"2200\",\"qty\":\"2\"}', 'Stock from Receiving-54577390\n', '2021-09-04 17:44:50'),
(222, 2436, 11, '58F02320', 5, 1540, 1, 'receiving', 80, '2023-05-31', 0, '{\"price\":\"1540\",\"qty\":\"5\"}', 'Stock from Receiving-54577390\n', '2021-09-04 17:44:50'),
(223, 2437, 11, '8C6K', 4, 11000, 1, 'receiving', 80, '2023-05-31', 0, '{\"price\":\"11000\",\"qty\":\"4\"}', 'Stock from Receiving-54577390\n', '2021-09-04 17:44:51'),
(224, 2470, 11, '202257', 3, 1750, 1, 'receiving', 80, '2023-10-31', 0, '{\"price\":\"1750\",\"qty\":\"3\"}', 'Stock from Receiving-54577390\n', '2021-09-04 17:44:51'),
(225, 2471, 11, '192432', 3, 1540, 1, 'receiving', 80, '2022-09-30', 0, '{\"price\":\"1540\",\"qty\":\"3\"}', 'Stock from Receiving-54577390\n', '2021-09-04 17:44:51'),
(226, 2642, 11, '325488', 1, 7750, 1, 'receiving', 81, '2022-07-31', 0, '{\"price\":\"7750\",\"qty\":\"1\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:02'),
(227, 2643, 11, '324437', 1, 8100, 1, 'receiving', 81, '2022-04-30', 0, '{\"price\":\"8100\",\"qty\":\"1\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:03'),
(228, 2639, 11, '77362', 2, 1600, 1, 'receiving', 81, '2023-10-31', 0, '{\"price\":\"1600\",\"qty\":\"2\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:03'),
(229, 2638, 11, 'LB1008', 3, 1600, 1, 'receiving', 81, '2023-02-28', 0, '{\"price\":\"1600\",\"qty\":\"3\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:03'),
(230, 2641, 11, '10210141', 4, 2500, 1, 'receiving', 81, '2022-12-31', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:03'),
(231, 2640, 11, 'EMPL204134', 3, 1820, 1, 'receiving', 81, '2022-10-31', 0, '{\"price\":\"1820\",\"qty\":\"3\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(232, 202, 11, 'EMPC211125', 4, 1600, 1, 'receiving', 81, '2023-08-31', 0, '{\"price\":\"1600\",\"qty\":\"4\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(233, 2644, 288, 'CN1019', 2, 850, 1, 'receiving', 81, '2024-03-31', 0, '{\"price\":\"850\",\"qty\":\"2\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(234, 2645, 11, '200635', 5, 1550, 1, 'receiving', 81, '2023-02-28', 0, '{\"price\":\"1550\",\"qty\":\"5\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(235, 2646, 288, '201760', 1, 1300, 1, 'receiving', 81, '2023-08-31', 0, '{\"price\":\"1300\",\"qty\":\"1\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(236, 2417, 11, 'Y069UH', 2, 2350, 1, 'receiving', 81, '2023-06-30', 0, '{\"price\":\"2350\",\"qty\":\"2\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(237, 2416, 11, 'Y002UJ', 2, 4500, 1, 'receiving', 81, '2023-07-31', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-46770965\n', '2021-09-06 21:14:04'),
(238, 730, 288, 'LK1008', 3, 1550, 1, 'receiving', 82, '2023-04-30', 0, '{\"price\":\"1550\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:50'),
(239, 2661, 206, 'SKF016', 1, 1850, 1, 'receiving', 82, '2023-06-30', 0, '{\"price\":\"1850\",\"qty\":\"1\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:50'),
(240, 2506, 11, 'MO305', 3, 1250, 1, 'receiving', 82, '2023-01-31', 0, '{\"price\":\"1250\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:51'),
(241, 2505, 11, 'MO217', 2, 4300, 1, 'receiving', 82, '2022-10-31', 0, '{\"price\":\"4300\",\"qty\":\"2\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:51'),
(242, 717, 11, '21023', 6, 980, 1, 'receiving', 82, '2023-02-28', 0, '{\"price\":\"980\",\"qty\":\"6\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:51'),
(243, 161, 287, 'LW0011', 4, 1450, 1, 'receiving', 82, '2022-01-31', 0, '{\"price\":\"1450\",\"qty\":\"4\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:51'),
(244, 162, 287, 'L10019', 3, 1400, 1, 'receiving', 82, '2022-07-31', 0, '{\"price\":\"1400\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:51'),
(245, 48, 287, '0K01', 2, 1400, 1, 'receiving', 82, '2022-10-31', 0, '{\"price\":\"1400\",\"qty\":\"2\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:52'),
(246, 66, 287, '190005', 4, 1450, 1, 'receiving', 82, '2022-02-28', 0, '{\"price\":\"1450\",\"qty\":\"4\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:52'),
(247, 65, 287, '2103041', 3, 1850, 1, 'receiving', 82, '2024-02-29', 0, '{\"price\":\"1850\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:52'),
(248, 50, 287, '21001', 5, 980, 1, 'receiving', 82, '2023-05-31', 0, '{\"price\":\"980\",\"qty\":\"5\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:52'),
(249, 46, 287, 'BL1004', 3, 1420, 1, 'receiving', 82, '2023-03-31', 0, '{\"price\":\"1420\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:52'),
(250, 47, 287, '1A10280', 1, 1220, 1, 'receiving', 82, '2024-03-31', 0, '{\"price\":\"1220\",\"qty\":\"1\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:53'),
(251, 151, 287, '200848', 2, 3450, 1, 'receiving', 82, '2021-03-31', 0, '{\"price\":\"3450\",\"qty\":\"2\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:53'),
(252, 353, 11, 'GB91095', 2, 14550, 1, 'receiving', 82, '2022-03-31', 0, '{\"price\":\"14550\",\"qty\":\"2\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:53'),
(253, 145, 5, 'AE209', 3, 1450, 1, 'receiving', 82, '2022-11-30', 0, '{\"price\":\"1450\",\"qty\":\"3\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:53'),
(254, 150, 287, 'L890096', 20, 1320, 1, 'receiving', 82, '2022-01-31', 0, '{\"price\":\"1320\",\"qty\":\"20\"}', 'Stock from Receiving-99970608\n', '2021-09-06 22:05:53'),
(255, 91, 287, '191862', 2, 2580, 1, 'receiving', 83, '2022-07-31', 0, '{\"price\":\"2580\",\"qty\":\"2\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:52'),
(256, 110, 287, '78183', 2, 4590, 1, 'receiving', 83, '2023-12-31', 0, '{\"price\":\"4590\",\"qty\":\"2\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:52'),
(257, 2599, 287, '2011010', 2, 890, 1, 'receiving', 83, '2023-10-31', 0, '{\"price\":\"890\",\"qty\":\"2\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:52'),
(258, 2600, 287, 'PB303', 4, 1350, 1, 'receiving', 83, '2023-01-31', 0, '{\"price\":\"1350\",\"qty\":\"4\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:52'),
(259, 92, 287, '200407', 1, 1650, 1, 'receiving', 83, '2023-05-31', 0, '{\"price\":\"1650\",\"qty\":\"1\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:53'),
(260, 88, 287, '14920', 3, 1850, 1, 'receiving', 83, '2023-02-28', 0, '{\"price\":\"1850\",\"qty\":\"3\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:53'),
(261, 2440, 11, '78413', 1, 1220, 1, 'receiving', 83, '2024-02-29', 0, '{\"price\":\"1220\",\"qty\":\"1\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:53'),
(262, 2441, 11, '201023', 2, 1320, 1, 'receiving', 83, '2023-09-30', 0, '{\"price\":\"1320\",\"qty\":\"2\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:53'),
(263, 159, 2, 'N359', 325, 80, 1, 'receiving', 83, '2025-06-30', 0, '{\"price\":\"80\",\"qty\":\"325\"}', 'Stock from Receiving-71162792\n', '2021-09-06 22:25:53'),
(264, 356, 11, 'SBCO26', 6, 950, 1, 'receiving', 84, '2023-10-31', 0, '{\"price\":\"950\",\"qty\":\"6\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:08'),
(265, 2579, 11, '21032', 12, 680, 1, 'receiving', 84, '2024-05-31', 0, '{\"price\":\"680\",\"qty\":\"12\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:08'),
(266, 2496, 11, '21018', 3, 1300, 1, 'receiving', 84, '2023-05-31', 0, '{\"price\":\"1300\",\"qty\":\"3\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:08'),
(267, 2497, 11, '21040', 5, 950, 1, 'receiving', 84, '2023-04-30', 0, '{\"price\":\"950\",\"qty\":\"5\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:08'),
(268, 683, 11, '21009', 3, 650, 1, 'receiving', 84, '2023-02-28', 0, '{\"price\":\"650\",\"qty\":\"3\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(269, 309, 11, '21054', 8, 1100, 1, 'receiving', 84, '2023-05-31', 0, '{\"price\":\"1100\",\"qty\":\"8\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(270, 1022, 11, '02002', 2, 580, 1, 'receiving', 84, '2022-07-31', 0, '{\"price\":\"580\",\"qty\":\"2\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(271, 808, 11, '10201100', 1, 7000, 1, 'receiving', 84, '2022-05-31', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(272, 874, 11, '21062', 4, 520, 1, 'receiving', 84, '2023-02-28', 0, '{\"price\":\"520\",\"qty\":\"4\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(273, 715, 11, 'SBH2100', 12, 950, 1, 'receiving', 84, '2024-05-31', 0, '{\"price\":\"950\",\"qty\":\"12\"}', 'Stock from Receiving-60628044\n', '2021-09-15 22:16:09'),
(274, 2663, 11, 'RS9800', 2, 3500, 1, 'receiving', 85, '2025-02-28', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:15'),
(275, 2665, 11, 'RS3025', 3, 1750, 1, 'receiving', 85, '2023-02-28', 0, '{\"price\":\"1750\",\"qty\":\"3\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:15'),
(276, 2662, 11, 'KZ226', 1, 4500, 1, 'receiving', 85, '2024-07-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:15'),
(277, 2664, 11, 'KS880', 2, 2050, 1, 'receiving', 85, '2024-04-30', 0, '{\"price\":\"2050\",\"qty\":\"2\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:16'),
(278, 2473, 0, 'PA1260', 2, 4750, 1, 'receiving', 85, '2023-09-30', 0, '{\"price\":\"4750\",\"qty\":\"2\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:16'),
(279, 1149, 2, '1F51', 11, 1250, 1, 'receiving', 85, '2025-05-31', 0, '{\"price\":\"1250\",\"qty\":\"11\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:16'),
(280, 2516, 2, '0D07', 6, 1250, 1, 'receiving', 85, '2024-03-31', 0, '{\"price\":\"1250\",\"qty\":\"6\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:16'),
(281, 1151, 2, '79164', 6, 950, 1, 'receiving', 85, '2024-05-31', 0, '{\"price\":\"950\",\"qty\":\"6\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:16'),
(282, 2517, 2, '2011015', 10, 850, 1, 'receiving', 85, '2022-10-31', 0, '{\"price\":\"850\",\"qty\":\"10\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:17'),
(283, 1055, 2, 'MF0003', 1000, 135, 1, 'receiving', 85, '2023-07-31', 0, '{\"price\":\"135\",\"qty\":\"1000\"}', 'Stock from Receiving-39419277\n', '2021-09-15 23:01:17'),
(284, 2666, 2, '2107032', 3, 900, 1, 'receiving', 86, '2025-06-30', 0, '{\"price\":\"900\",\"qty\":\"3\"}', 'Stock from Receiving-05077368\n', '2021-09-15 23:01:31'),
(285, 2667, 274, 'AR21024', 4, 1500, 1, 'receiving', 87, '2023-05-31', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-11643565\n', '2021-09-16 20:57:59'),
(286, 253, 275, 'PA0789K', 2, 1500, 1, 'receiving', 87, '2022-10-31', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-11643565\n', '2021-09-16 20:57:59'),
(287, 256, 2, '20200601', 3, 5450, 1, 'receiving', 87, '2023-05-31', 0, '{\"price\":\"5450\",\"qty\":\"3\"}', 'Stock from Receiving-11643565\n', '2021-09-16 20:57:59'),
(288, 2582, 273, '20051801', 3, 3400, 1, 'receiving', 87, '2022-05-31', 0, '{\"price\":\"3400\",\"qty\":\"3\"}', 'Stock from Receiving-11643565\n', '2021-09-16 20:57:59'),
(289, 561, 290, '200707', 2, 4500, 1, 'receiving', 87, '2022-07-16', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-11643565\n', '2021-09-16 20:57:59'),
(290, 2669, 273, 'NAA9290A', 3, 1450, 1, 'receiving', 88, '2022-07-16', 0, '{\"price\":\"1450\",\"qty\":\"3\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:45'),
(291, 2668, 273, 'PA1529J', 1, 1500, 1, 'receiving', 88, '2022-09-30', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:45'),
(292, 2670, 11, 'AD00B7', 5, 3450, 1, 'receiving', 88, '2022-06-30', 0, '{\"price\":\"3450\",\"qty\":\"5\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:45'),
(293, 2671, 11, 'AD0007', 1, 1250, 1, 'receiving', 88, '2022-06-30', 0, '{\"price\":\"1250\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:45'),
(294, 2578, 11, '184986', 1, 6450, 1, 'receiving', 88, '2021-10-31', 0, '{\"price\":\"6450\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:45'),
(295, 71, 284, 'D11120', 5, 2000, 1, 'receiving', 88, '2023-06-30', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:46'),
(296, 471, 10, 'BE21006', 1, 1500, 1, 'receiving', 88, '2023-12-31', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:46'),
(297, 2488, 10, 'BE20137', 4, 2100, 1, 'receiving', 88, '2023-09-30', 0, '{\"price\":\"2100\",\"qty\":\"4\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:46'),
(298, 62, 284, '0F61', 4, 1450, 1, 'receiving', 88, '2023-05-31', 0, '{\"price\":\"1450\",\"qty\":\"4\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:46'),
(299, 34, 284, 'GNTR0A020', 5, 2350, 1, 'receiving', 88, '2023-04-30', 0, '{\"price\":\"2350\",\"qty\":\"5\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:46'),
(300, 56, 284, 'A2103', 3, 1650, 1, 'receiving', 88, '2022-12-31', 0, '{\"price\":\"1650\",\"qty\":\"3\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:47'),
(301, 157, 283, '202267', 3, 850, 1, 'receiving', 88, '2022-10-31', 0, '{\"price\":\"850\",\"qty\":\"3\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:47'),
(302, 59, 284, 'G1903', 1, 560, 1, 'receiving', 88, '2022-09-30', 0, '{\"price\":\"560\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:47'),
(303, 152, 284, 'G04421', 4, 1350, 1, 'receiving', 88, '2022-12-31', 0, '{\"price\":\"1350\",\"qty\":\"4\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:47'),
(304, 70, 284, 'DM214', 2, 1500, 1, 'receiving', 88, '2022-06-30', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:48'),
(305, 63, 284, '10201191', 2, 3500, 1, 'receiving', 88, '2022-05-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:48'),
(306, 36, 284, 'AD103', 4, 1550, 1, 'receiving', 88, '2023-02-28', 0, '{\"price\":\"1550\",\"qty\":\"4\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:48'),
(307, 23, 283, 'OD39', 4, 1150, 1, 'receiving', 88, '2023-03-31', 0, '{\"price\":\"1150\",\"qty\":\"4\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:48'),
(308, 22, 284, 'OG111', 2, 1150, 1, 'receiving', 88, '2023-06-30', 0, '{\"price\":\"1150\",\"qty\":\"2\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:48'),
(309, 53, 0, '1427C807', 2, 4700, 1, 'receiving', 88, '2021-12-31', 0, '{\"price\":\"4700\",\"qty\":\"2\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:49'),
(310, 98, 284, 'O2112905', 3, 3150, 1, 'receiving', 88, '2022-02-28', 0, '{\"price\":\"3150\",\"qty\":\"3\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:49'),
(311, 64, 284, '10191537', 1, 2450, 1, 'receiving', 88, '2022-05-31', 0, '{\"price\":\"2450\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:49'),
(312, 99, 284, '660620', 1, 2350, 1, 'receiving', 88, '2023-06-30', 0, '{\"price\":\"2350\",\"qty\":\"1\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:49'),
(313, 78, 284, '2107009', 3, 1550, 1, 'receiving', 88, '2024-06-30', 0, '{\"price\":\"1550\",\"qty\":\"3\"}', 'Stock from Receiving-77015676\n', '2021-09-16 22:05:49'),
(314, 25, 284, '2107', 5, 2800, 1, 'receiving', 89, '2024-03-31', 0, '{\"price\":\"2800\",\"qty\":\"5\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:05'),
(315, 72, 284, 'PD70040', 5, 700, 1, 'receiving', 89, '2023-11-30', 0, '{\"price\":\"700\",\"qty\":\"5\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:05'),
(316, 2648, 284, 'DN903', 6, 2200, 1, 'receiving', 89, '2022-07-31', 0, '{\"price\":\"2200\",\"qty\":\"6\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:05'),
(317, 61, 284, 'DCC013', 8, 1200, 1, 'receiving', 89, '2024-05-31', 0, '{\"price\":\"1200\",\"qty\":\"8\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:05'),
(318, 30, 284, '201571', 3, 1400, 1, 'receiving', 89, '2023-06-30', 0, '{\"price\":\"1400\",\"qty\":\"3\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:06'),
(319, 29, 283, '202324', 2, 1400, 1, 'receiving', 89, '2023-11-30', 0, '{\"price\":\"1400\",\"qty\":\"2\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:06'),
(320, 143, 283, '201897', 7, 1000, 1, 'receiving', 89, '2023-08-31', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:06'),
(321, 245, 283, 'T4291', 5, 12000, 1, 'receiving', 89, '2023-11-30', 0, '{\"price\":\"12000\",\"qty\":\"5\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:06'),
(322, 2649, 284, 'AW001', 3, 1300, 1, 'receiving', 89, '2023-02-28', 0, '{\"price\":\"1300\",\"qty\":\"3\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(323, 2651, 1, '202381', 6, 5800, 1, 'receiving', 89, '2023-08-31', 0, '{\"price\":\"5800\",\"qty\":\"6\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(324, 2650, 273, 'T0447', 7, 1200, 1, 'receiving', 89, '2023-07-31', 0, '{\"price\":\"1200\",\"qty\":\"7\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(325, 712, 284, '0I49', 2, 1450, 1, 'receiving', 89, '2023-08-31', 0, '{\"price\":\"1450\",\"qty\":\"2\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(326, 127, 283, 'H004', 5, 6200, 1, 'receiving', 89, '2022-11-30', 0, '{\"price\":\"6200\",\"qty\":\"5\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(327, 24, 284, '21002', 4, 2450, 1, 'receiving', 89, '2024-03-04', 0, '{\"price\":\"2450\",\"qty\":\"4\"}', 'Stock from Receiving-10258121\n', '2021-09-16 23:15:07'),
(328, 2673, 283, '9F12', 2, 950, 1, 'receiving', 90, '2022-05-31', 0, '{\"price\":\"950\",\"qty\":\"2\"}', 'Stock from Receiving-63892623\n', '2021-09-16 23:19:35'),
(329, 2672, 273, 'OGO2', 3, 1350, 1, 'receiving', 90, '2023-06-30', 0, '{\"price\":\"1350\",\"qty\":\"3\"}', 'Stock from Receiving-63892623\n', '2021-09-16 23:19:35'),
(330, 1419, 30, '00', 13, 800, 1, 'receiving', 91, '2025-11-18', 0, '{\"price\":\"800\",\"qty\":\"13\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:26'),
(331, 1420, 30, '0621', 4, 1000, 1, 'receiving', 91, '2025-12-31', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(332, 1451, 11, '918484', 2, 8500, 1, 'receiving', 91, '2024-09-30', 0, '{\"price\":\"8500\",\"qty\":\"2\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(333, 1448, 11, '0307001S', 2, 5000, 1, 'receiving', 91, '2026-03-31', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(334, 1437, 11, 'L2PP', 3, 8000, 1, 'receiving', 91, '2023-08-31', 0, '{\"price\":\"8000\",\"qty\":\"3\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(335, 1424, 0, '0061002', 2, 10500, 1, 'receiving', 91, '2025-12-31', 0, '{\"price\":\"10500\",\"qty\":\"2\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(336, 1426, 11, '12136674', 1, 8000, 1, 'receiving', 91, '2024-12-31', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(337, 1513, 11, '02341874', 2, 5000, 1, 'receiving', 91, '2022-11-30', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:27'),
(338, 1422, 11, '34420', 1, 10500, 1, 'receiving', 91, '2022-11-30', 0, '{\"price\":\"10500\",\"qty\":\"1\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:28'),
(339, 1443, 11, 'QO173', 6, 1500, 1, 'receiving', 91, '2024-06-18', 0, '{\"price\":\"1500\",\"qty\":\"6\"}', 'Stock from Receiving-61243115\n', '2021-09-18 21:11:28'),
(340, 2674, 11, '0000', 7, 1500, 1, 'receiving', 92, '2022-03-31', 0, '{\"price\":\"1500\",\"qty\":\"7\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:04'),
(341, 1445, 11, '01', 2, 4000, 1, 'receiving', 92, '2022-09-30', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:04'),
(342, 1434, 11, '036', 2, 1500, 1, 'receiving', 92, '2022-11-30', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:04'),
(343, 2544, 11, '1760E01', 3, 3500, 1, 'receiving', 92, '2023-01-31', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:05'),
(344, 1453, 11, '50932921-012A', 5, 4000, 1, 'receiving', 92, '2025-06-30', 0, '{\"price\":\"4000\",\"qty\":\"5\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:05'),
(345, 1447, 11, 'CR14009', 1, 7100, 1, 'receiving', 92, '2023-12-31', 0, '{\"price\":\"7100\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:05'),
(346, 2541, 11, 'CR133333', 2, 15000, 1, 'receiving', 92, '2023-06-30', 0, '{\"price\":\"15000\",\"qty\":\"2\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:05'),
(347, 1446, 11, 'CR33045', 1, 4500, 1, 'receiving', 92, '2024-11-30', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(348, 2550, 289, 'A2515-C', 4, 1500, 1, 'receiving', 92, '2024-01-31', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(349, 2546, 11, '02090001S', 2, 4500, 1, 'receiving', 92, '2022-02-28', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(350, 1458, 289, 'G/0045', 1, 9000, 1, 'receiving', 92, '2023-01-31', 0, '{\"price\":\"9000\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(351, 1454, 11, '00000', 5, 1000, 1, 'receiving', 92, '2023-06-30', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(352, 2548, 11, '840035', 3, 1200, 1, 'receiving', 92, '2024-01-31', 0, '{\"price\":\"1200\",\"qty\":\"3\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(353, 1471, 289, '003SR', 4, 1700, 1, 'receiving', 92, '2023-01-31', 0, '{\"price\":\"1700\",\"qty\":\"4\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:06'),
(354, 1470, 289, '027RC', 4, 2000, 1, 'receiving', 92, '2022-09-30', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:07'),
(355, 1474, 289, '746', 6, 1250, 1, 'receiving', 92, '2023-11-30', 0, '{\"price\":\"1250\",\"qty\":\"6\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:07'),
(356, 1484, 289, '911247', 3, 7500, 1, 'receiving', 92, '2024-09-24', 0, '{\"price\":\"7500\",\"qty\":\"3\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:07'),
(357, 1475, 289, '032AG', 1, 3500, 1, 'receiving', 92, '2022-09-30', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:07'),
(358, 1546, 30, 'CD00043', 1, 9000, 1, 'receiving', 92, '2023-06-30', 0, '{\"price\":\"9000\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:07'),
(359, 1462, 10, '887923', 2, 6500, 1, 'receiving', 92, '2024-06-30', 0, '{\"price\":\"6500\",\"qty\":\"2\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:08'),
(360, 1440, 11, '200308', 1, 3500, 1, 'receiving', 92, '2023-04-30', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-80568155\n', '2021-09-18 22:00:08'),
(361, 2676, 11, '033RR', 4, 2000, 1, 'receiving', 93, '2022-09-30', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(362, 2675, 11, '47', 3, 1500, 1, 'receiving', 93, '2024-04-30', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(363, 1457, 11, '068', 6, 1250, 1, 'receiving', 93, '2023-09-21', 0, '{\"price\":\"1250\",\"qty\":\"6\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(364, 2545, 11, '094', 4, 1250, 1, 'receiving', 93, '2023-09-15', 0, '{\"price\":\"1250\",\"qty\":\"4\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(365, 1463, 43, 'CBTOO190806', 1, 1500, 1, 'receiving', 93, '2024-08-05', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(366, 1460, 10, '0000000', 5, 1000, 1, 'receiving', 93, '2024-10-18', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(367, 1468, 30, '211', 3, 1500, 1, 'receiving', 93, '2023-07-29', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:08'),
(368, 1467, 30, '339', 2, 3800, 1, 'receiving', 93, '2022-12-05', 0, '{\"price\":\"3800\",\"qty\":\"2\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:09'),
(369, 1465, 289, '2507201010', 2, 2000, 1, 'receiving', 93, '2023-07-31', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:09'),
(370, 1466, 273, '00', 11, 500, 1, 'receiving', 93, '2030-10-31', 0, '{\"price\":\"500\",\"qty\":\"11\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:09'),
(371, 1469, 30, '000', 12, 500, 1, 'receiving', 93, '2030-11-26', 0, '{\"price\":\"500\",\"qty\":\"12\"}', 'Stock from Receiving-06396795\n', '2021-09-18 22:35:09'),
(372, 1461, 43, '00000', 1, 1800, 1, 'receiving', 94, '2022-03-31', 0, '{\"price\":\"1800\",\"qty\":\"1\"}', 'Stock from Receiving-19694303\n', '2021-09-18 22:48:19'),
(373, 2677, 30, '00921', 10, 600, 1, 'receiving', 94, '2024-07-31', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock from Receiving-19694303\n', '2021-09-18 22:48:20'),
(374, 1542, 11, 'RN203', 1, 6500, 1, 'receiving', 94, '2022-07-31', 0, '{\"price\":\"6500\",\"qty\":\"1\"}', 'Stock from Receiving-19694303\n', '2021-09-18 22:48:20'),
(375, 1540, 11, '00000', 1, 10000, 1, 'receiving', 94, '2024-12-31', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock from Receiving-19694303\n', '2021-09-18 22:48:20'),
(376, 1539, 11, 'YC5422', 2, 5000, 1, 'receiving', 94, '2023-11-23', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock from Receiving-19694303\n', '2021-09-18 22:48:20'),
(377, 2679, 11, 'FN1076612', 1, 4500, 1, 'receiving', 95, '2024-05-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:56'),
(378, 2680, 11, '26983', 7, 4500, 1, 'receiving', 95, '2026-05-31', 0, '{\"price\":\"4500\",\"qty\":\"7\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:56'),
(379, 2559, 11, '110/3245', 3, 4500, 1, 'receiving', 95, '2023-11-30', 0, '{\"price\":\"4500\",\"qty\":\"3\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(380, 1522, 11, 'FN1057784', 10, 4500, 1, 'receiving', 95, '2025-04-30', 0, '{\"price\":\"4500\",\"qty\":\"10\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(381, 2561, 11, '204997', 2, 5000, 1, 'receiving', 95, '2025-04-16', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(382, 2562, 11, '18N', 1, 4500, 1, 'receiving', 95, '2024-06-30', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(383, 1528, 11, 'JSF/3789/19', 1, 4500, 1, 'receiving', 95, '2024-10-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(384, 2574, 11, '0000', 2, 3500, 1, 'receiving', 95, '2026-10-20', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(385, 1518, 11, '94E428', 4, 1500, 1, 'receiving', 95, '2025-03-31', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(386, 2575, 11, 'SMO722141', 2, 2000, 1, 'receiving', 95, '2023-11-30', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:57'),
(387, 2558, 11, '10953', 1, 4500, 1, 'receiving', 95, '2026-03-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(388, 2570, 11, '194501', 1, 4500, 1, 'receiving', 95, '2024-11-30', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(389, 2566, 11, '94611611MC', 5, 4500, 1, 'receiving', 95, '2022-10-31', 0, '{\"price\":\"4500\",\"qty\":\"5\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(390, 1519, 11, 'W324210094', 1, 3500, 1, 'receiving', 95, '2024-02-29', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(391, 1517, 11, '0035TNJ2', 1, 15000, 1, 'receiving', 95, '2022-01-31', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(392, 1502, 11, 'P21012802', 4, 6000, 1, 'receiving', 95, '2024-01-27', 0, '{\"price\":\"6000\",\"qty\":\"4\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(393, 1520, 11, '880106', 2, 6000, 1, 'receiving', 95, '2023-06-30', 0, '{\"price\":\"6000\",\"qty\":\"2\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:58'),
(394, 1508, 11, '913327', 1, 4000, 1, 'receiving', 95, '2024-08-31', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:59'),
(395, 1507, 11, 'BGP018', 1, 6000, 1, 'receiving', 95, '2023-12-17', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:39:59'),
(396, 1511, 11, '656390', 1, 6000, 1, 'receiving', 95, '2025-10-14', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock from Receiving-30442749\n', '2021-09-19 18:40:00'),
(397, 2554, 11, 'W308X90359', 3, 5000, 1, 'receiving', 96, '2022-10-31', 0, '{\"price\":\"5000\",\"qty\":\"3\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:37'),
(398, 1486, 11, '2105008', 1, 7000, 1, 'receiving', 96, '2024-05-31', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:37'),
(399, 1554, 11, 'CHLO96-1', 1, 5000, 1, 'receiving', 96, '2023-11-30', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:37'),
(400, 2549, 11, '840337', 1, 7000, 1, 'receiving', 96, '2023-11-30', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:37'),
(401, 1493, 11, '2003948', 2, 7000, 1, 'receiving', 96, '2023-06-30', 0, '{\"price\":\"7000\",\"qty\":\"2\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:37'),
(402, 1491, 11, 'HW/53ML/RED/2020-10', 3, 2200, 1, 'receiving', 96, '2022-10-31', 0, '{\"price\":\"2200\",\"qty\":\"3\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:38'),
(403, 2553, 11, '2434', 2, 2500, 1, 'receiving', 96, '2024-05-09', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:38'),
(404, 1492, 11, '62000', 4, 2500, 1, 'receiving', 96, '2022-11-30', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:38'),
(405, 1488, 11, '1821', 9, 580, 1, 'receiving', 96, '2024-07-31', 0, '{\"price\":\"580\",\"qty\":\"9\"}', 'Stock from Receiving-54998190\n', '2021-09-19 19:31:38'),
(406, 1316, 30, 'T1', 1, 13500, 1, 'receiving', 97, '2024-08-06', 0, '{\"price\":\"13500\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:42'),
(407, 1319, 30, 'T2', 2, 13500, 1, 'receiving', 97, '2024-07-31', 0, '{\"price\":\"13500\",\"qty\":\"2\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:43'),
(408, 1351, 11, '000', 2, 3500, 1, 'receiving', 97, '2023-01-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:43'),
(409, 1549, 11, '0000', 3, 8000, 1, 'receiving', 97, '2023-01-31', 0, '{\"price\":\"8000\",\"qty\":\"3\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:43'),
(410, 1352, 30, 'AHO:10/19', 1, 5000, 1, 'receiving', 97, '2025-01-31', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:43'),
(411, 1353, 30, '00-00', 1, 6500, 1, 'receiving', 97, '2030-10-31', 0, '{\"price\":\"6500\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:44'),
(412, 1355, 289, '021SH', 2, 6000, 1, 'receiving', 97, '2023-10-31', 0, '{\"price\":\"6000\",\"qty\":\"2\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:44'),
(413, 1354, 289, '003SH', 3, 2500, 1, 'receiving', 97, '2024-03-31', 0, '{\"price\":\"2500\",\"qty\":\"3\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:44'),
(414, 1357, 11, '0421OL', 5, 3500, 1, 'receiving', 97, '2023-10-31', 0, '{\"price\":\"3500\",\"qty\":\"5\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:44'),
(415, 1361, 11, 'HCYI-19', 1, 7500, 1, 'receiving', 97, '2023-02-28', 0, '{\"price\":\"7500\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:45'),
(416, 1360, 11, 'HCLI-03', 3, 3500, 1, 'receiving', 97, '2023-01-31', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:45'),
(417, 1359, 11, 'HCLI-05', 1, 1500, 1, 'receiving', 97, '2023-01-31', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:45'),
(418, 1356, 11, 'PS26231', 3, 3500, 1, 'receiving', 97, '2026-04-30', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:45'),
(419, 2530, 289, 'L11PP', 12, 4200, 1, 'receiving', 97, '2022-12-31', 0, '{\"price\":\"4200\",\"qty\":\"12\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:45'),
(420, 2529, 289, 'L4PP', 10, 2000, 1, 'receiving', 97, '2023-12-31', 0, '{\"price\":\"2000\",\"qty\":\"10\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:46'),
(421, 598, 11, '98667P220720', 1, 20000, 1, 'receiving', 97, '2022-07-17', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:46'),
(422, 1377, 289, '008HJ', 3, 3500, 1, 'receiving', 97, '2024-03-31', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:46'),
(423, 1382, 289, 'M240620', 2, 2500, 1, 'receiving', 97, '2023-06-30', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:46'),
(424, 1379, 289, 'M120419', 2, 1500, 1, 'receiving', 97, '2022-04-30', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:47'),
(425, 2534, 289, 'N0181', 1, 2800, 1, 'receiving', 97, '2024-05-31', 0, '{\"price\":\"2800\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:47'),
(426, 2533, 289, 'N:082', 1, 4000, 1, 'receiving', 97, '2025-01-31', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock from Receiving-98781286\n', '2021-09-19 21:54:47'),
(427, 1387, 30, '20113001', 9, 4600, 1, 'receiving', 98, '2023-11-30', 0, '{\"price\":\"4600\",\"qty\":\"9\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:20'),
(428, 1557, 30, '2101001', 1, 3500, 1, 'receiving', 98, '2024-01-31', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:20'),
(429, 1385, 30, 'FDM25', 5, 2000, 1, 'receiving', 98, '2023-11-30', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:21'),
(430, 1386, 30, 'TTF8015E', 10, 2000, 1, 'receiving', 98, '2022-05-31', 0, '{\"price\":\"2000\",\"qty\":\"10\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:21'),
(431, 1404, 30, '1960FZ22359', 6, 2000, 1, 'receiving', 98, '2023-06-30', 0, '{\"price\":\"2000\",\"qty\":\"6\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:21'),
(432, 1390, 30, '5M12', 10, 3000, 1, 'receiving', 98, '2024-01-31', 0, '{\"price\":\"3000\",\"qty\":\"10\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:21'),
(433, 1392, 30, '23239', 15, 1300, 1, 'receiving', 98, '2024-06-30', 0, '{\"price\":\"1300\",\"qty\":\"15\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:21'),
(434, 1393, 30, '323E', 11, 2100, 1, 'receiving', 98, '2022-11-30', 0, '{\"price\":\"2100\",\"qty\":\"11\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:22'),
(435, 1391, 30, '0551', 6, 1000, 1, 'receiving', 98, '2024-06-30', 0, '{\"price\":\"1000\",\"qty\":\"6\"}', 'Stock from Receiving-10446831\n', '2021-09-19 22:21:22'),
(436, 2683, 30, 'M11', 2, 2000, 1, 'receiving', 99, '2030-10-24', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:28'),
(437, 2682, 289, '102020BJA', 2, 3500, 1, 'receiving', 99, '2022-10-08', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:29'),
(438, 2681, 11, '011RSS', 1, 5000, 1, 'receiving', 99, '2024-04-30', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:29'),
(439, 1408, 30, '6401-09', 12, 3500, 1, 'receiving', 99, '2026-10-31', 0, '{\"price\":\"3500\",\"qty\":\"12\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:29'),
(440, 1412, 30, '052021SZ100', 6, 500, 1, 'receiving', 99, '2024-06-30', 0, '{\"price\":\"500\",\"qty\":\"6\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:30'),
(441, 1413, 30, '06100HS19', 5, 1500, 1, 'receiving', 99, '2022-05-31', 0, '{\"price\":\"1500\",\"qty\":\"5\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:30'),
(442, 1411, 30, '005H8', 4, 1000, 1, 'receiving', 99, '2022-11-30', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:30'),
(443, 1406, 30, '02-1540', 1, 2000, 1, 'receiving', 99, '2027-06-30', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:30'),
(444, 1407, 30, ' 02-1540', 6, 3500, 1, 'receiving', 99, '2027-11-30', 0, '{\"price\":\"3500\",\"qty\":\"6\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:30'),
(445, 1405, 30, '00-00', 2, 1000, 1, 'receiving', 99, '2032-10-19', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:31'),
(446, 1403, 30, '19188B', 2, 3000, 1, 'receiving', 99, '2022-11-30', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:31'),
(447, 1399, 30, '384', 3, 2000, 1, 'receiving', 99, '2025-07-31', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:31'),
(448, 2583, 30, 'B95215411V', 2, 2000, 1, 'receiving', 99, '2022-06-01', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:31'),
(449, 1397, 30, '10-1-6100035982', 2, 1500, 1, 'receiving', 99, '2024-04-30', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:31'),
(450, 1402, 30, '000-000', 3, 700, 1, 'receiving', 99, '2035-10-25', 0, '{\"price\":\"700\",\"qty\":\"3\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:32'),
(451, 1400, 30, '0000-0000', 3, 500, 1, 'receiving', 99, '2036-10-29', 0, '{\"price\":\"500\",\"qty\":\"3\"}', 'Stock from Receiving-41475000\n', '2021-09-19 22:56:32'),
(452, 1415, 30, '0000', 14, 1500, 1, 'receiving', 100, '2036-10-29', 0, '{\"price\":\"1500\",\"qty\":\"14\"}', 'Stock from Receiving-92297383\n', '2021-09-19 23:00:31'),
(453, 2552, 18, '000-000', 7, 1000, 1, 'receiving', 100, '2039-11-30', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock from Receiving-92297383\n', '2021-09-19 23:00:31'),
(454, 1417, 18, '00000-0000', 8, 1200, 1, 'receiving', 100, '2043-10-29', 0, '{\"price\":\"1200\",\"qty\":\"8\"}', 'Stock from Receiving-92297383\n', '2021-09-19 23:00:31'),
(455, 1317, 30, 'T2', 3, 13000, 1, 'receiving', 101, '2024-08-31', 0, '{\"price\":\"13000\",\"qty\":\"3\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:25'),
(456, 2525, 30, '095159', 2, 14000, 1, 'receiving', 101, '2025-04-30', 0, '{\"price\":\"14000\",\"qty\":\"2\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:25'),
(457, 1322, 30, '1108-4', 6, 3800, 1, 'receiving', 101, '2024-04-13', 0, '{\"price\":\"3800\",\"qty\":\"6\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:26'),
(458, 1320, 30, 'AICL201933202', 14, 5000, 1, 'receiving', 101, '2023-11-30', 0, '{\"price\":\"5000\",\"qty\":\"14\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:26'),
(459, 1328, 30, '350360039300044', 6, 3800, 1, 'receiving', 101, '2024-07-05', 0, '{\"price\":\"3800\",\"qty\":\"6\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:26'),
(460, 1329, 30, '0907T3', 10, 1300, 1, 'receiving', 101, '2024-07-08', 0, '{\"price\":\"1300\",\"qty\":\"10\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:26'),
(461, 1331, 30, 'TMC19-002', 4, 1500, 1, 'receiving', 101, '2022-11-20', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:26'),
(462, 1332, 30, 'TMC19-001', 7, 2200, 1, 'receiving', 101, '2022-09-18', 0, '{\"price\":\"2200\",\"qty\":\"7\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(463, 1333, 30, '2804T3', 8, 1500, 1, 'receiving', 101, '2024-04-27', 0, '{\"price\":\"1500\",\"qty\":\"8\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(464, 1334, 30, 'MAPR1R0621', 5, 1200, 1, 'receiving', 101, '2024-04-10', 0, '{\"price\":\"1200\",\"qty\":\"5\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(465, 1340, 30, '10022020', 3, 3500, 1, 'receiving', 101, '2023-02-10', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(466, 1335, 30, '000', 16, 500, 1, 'receiving', 101, '2028-06-28', 0, '{\"price\":\"500\",\"qty\":\"16\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(467, 1339, 30, '0000-0000', 7, 1000, 1, 'receiving', 101, '2029-06-13', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:27'),
(468, 2528, 30, 'EG4849', 2, 1200, 1, 'receiving', 101, '2029-06-20', 0, '{\"price\":\"1200\",\"qty\":\"2\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:28'),
(469, 1567, 30, '00.00', 4, 600, 1, 'receiving', 101, '2037-10-13', 0, '{\"price\":\"600\",\"qty\":\"4\"}', 'Stock from Receiving-88777451\n', '2021-09-20 22:00:28'),
(470, 2689, 30, '0621', 13, 2800, 1, 'receiving', 102, '2024-06-21', 0, '{\"price\":\"2800\",\"qty\":\"13\"}', 'Stock from Receiving-13106581\n', '2021-09-20 22:16:57'),
(471, 2686, 30, '00000', 4, 3500, 1, 'receiving', 102, '2024-11-27', 0, '{\"price\":\"3500\",\"qty\":\"4\"}', 'Stock from Receiving-13106581\n', '2021-09-20 22:16:58'),
(472, 2687, 30, '00900', 4, 3500, 1, 'receiving', 102, '2024-07-25', 0, '{\"price\":\"3500\",\"qty\":\"4\"}', 'Stock from Receiving-13106581\n', '2021-09-20 22:16:58'),
(473, 2688, 30, '008000', 2, 3500, 1, 'receiving', 102, '2024-05-19', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-13106581\n', '2021-09-20 22:16:58'),
(474, 2690, 30, '9000', 13, 3500, 1, 'receiving', 103, '2026-06-20', 0, '{\"price\":\"3500\",\"qty\":\"13\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:02'),
(475, 2691, 18, '000', 15, 1000, 1, 'receiving', 103, '2025-11-20', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:02'),
(476, 1389, 30, '00800', 7, 1500, 1, 'receiving', 103, '2025-10-30', 0, '{\"price\":\"1500\",\"qty\":\"7\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:02'),
(477, 1336, 30, '10090', 2, 1000, 1, 'receiving', 103, '2025-11-30', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:02'),
(478, 1342, 11, '1821DS17.35', 2, 1600, 1, 'receiving', 103, '2023-05-22', 0, '{\"price\":\"1600\",\"qty\":\"2\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:03'),
(479, 1341, 11, '220220', 3, 1500, 1, 'receiving', 103, '2024-02-22', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock from Receiving-24267879\n', '2021-09-20 22:32:03'),
(480, 2699, 18, '0259', 390, 1, 1, 'receiving', 104, '2023-10-02', 0, '{\"price\":\"1\",\"qty\":\"390\"}', 'Stock from Receiving-68900560\n', '2021-10-01 20:59:59'),
(481, 2695, 18, '2565KJ', 13, 550, 1, 'receiving', 104, '0000-00-00', 0, '{\"price\":\"550\",\"qty\":\"13\"}', 'Stock from Receiving-68900560\n', '2021-10-01 20:59:59'),
(482, 2700, 10, '3351', 3, 3000, 1, 'receiving', 105, '2023-12-31', 0, '{\"price\":\"3000\",\"qty\":\"3\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:21'),
(483, 1579, 10, '2525', 5, 2200, 1, 'receiving', 105, '2024-12-31', 0, '{\"price\":\"2200\",\"qty\":\"5\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:21'),
(484, 1581, 10, 'NL01255', 2, 1900, 1, 'receiving', 105, '2023-01-09', 0, '{\"price\":\"1900\",\"qty\":\"2\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:22'),
(485, 1575, 10, 'CN122H', 3, 2000, 1, 'receiving', 105, '2023-01-02', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:22'),
(486, 1573, 10, '22121', 2, 4500, 1, 'receiving', 105, '2024-01-12', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:22'),
(487, 1571, 10, 'H002', 1, 8000, 1, 'receiving', 105, '2023-01-10', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:23'),
(488, 1568, 10, 'CN123V', 6, 2800, 1, 'receiving', 105, '2023-01-11', 0, '{\"price\":\"2800\",\"qty\":\"6\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:23'),
(489, 1570, 10, 'B02', 4, 3166, 1, 'receiving', 105, '2023-01-09', 0, '{\"price\":\"3166\",\"qty\":\"4\"}', 'Stock from Receiving-39441962\n', '2021-10-01 21:31:23'),
(490, 2692, 115, '1871002', 22, 280, 1, 'receiving', 106, '2023-08-13', 0, '{\"price\":\"280\",\"qty\":\"22\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:45'),
(491, 40, 2, 'TD1011', 19, 350, 1, 'receiving', 106, '2024-03-31', 0, '{\"price\":\"350\",\"qty\":\"19\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:45'),
(492, 2693, 115, 'HLM-107', 15, 250, 1, 'receiving', 106, '2022-07-31', 0, '{\"price\":\"250\",\"qty\":\"15\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:45'),
(493, 2697, 1, '2010063', 60, 100, 1, 'receiving', 106, '2023-09-30', 0, '{\"price\":\"100\",\"qty\":\"60\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:46'),
(494, 2696, 115, 'KDM20010', 6, 125, 1, 'receiving', 106, '2025-09-30', 0, '{\"price\":\"125\",\"qty\":\"6\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:46'),
(495, 2694, 115, 'W3782', 23, 320, 1, 'receiving', 106, '2022-02-28', 0, '{\"price\":\"320\",\"qty\":\"23\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:46'),
(496, 41, 1, '44420063', 80, 230, 1, 'receiving', 106, '2024-02-29', 0, '{\"price\":\"230\",\"qty\":\"80\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:46'),
(497, 2698, 11, '20200208', 23, 500, 1, 'receiving', 106, '2025-07-02', 0, '{\"price\":\"500\",\"qty\":\"23\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:46'),
(498, 837, 1, '(10)10019', 40, 55, 1, 'receiving', 106, '2023-08-31', 0, '{\"price\":\"55\",\"qty\":\"40\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:47'),
(499, 117, 2, 'SKY0180', 68, 250, 1, 'receiving', 106, '2024-02-29', 0, '{\"price\":\"250\",\"qty\":\"68\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:47'),
(500, 116, 2, 'MBCH20005', 20, 168, 1, 'receiving', 106, '2023-06-30', 0, '{\"price\":\"168\",\"qty\":\"20\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:47'),
(501, 69, 2, 'UM1010', 50, 130, 1, 'receiving', 106, '2024-02-29', 0, '{\"price\":\"130\",\"qty\":\"50\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:47'),
(502, 1018, 1, 'J0152', 137, 29, 1, 'receiving', 106, '2024-03-31', 0, '{\"price\":\"29\",\"qty\":\"137\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:47'),
(503, 723, 2, '210735', 120, 170, 1, 'receiving', 106, '2025-04-30', 0, '{\"price\":\"170\",\"qty\":\"120\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:48'),
(504, 166, 2, '0L19', 20, 120, 1, 'receiving', 106, '2023-08-31', 0, '{\"price\":\"120\",\"qty\":\"20\"}', 'Stock from Receiving-69062152\n', '2021-10-01 21:53:48'),
(505, 2706, 10, '10705', 2, 3400, 1, 'receiving', 107, '2024-04-07', 0, '{\"price\":\"3400\",\"qty\":\"2\"}', 'Stock from Receiving-45537064\n', '2021-10-01 22:10:55'),
(506, 2707, 10, '3166', 2, 1500, 1, 'receiving', 107, '2024-12-03', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock from Receiving-45537064\n', '2021-10-01 22:10:55'),
(507, 2705, 10, '1131', 4, 7500, 1, 'receiving', 107, '2022-07-12', 0, '{\"price\":\"7500\",\"qty\":\"4\"}', 'Stock from Receiving-45537064\n', '2021-10-01 22:10:55'),
(508, 2708, 10, 'CN123K', 2, 1300, 1, 'receiving', 108, '2024-01-03', 0, '{\"price\":\"1300\",\"qty\":\"2\"}', 'Stock from Receiving-40597921\n', '2021-10-01 22:30:16'),
(509, 2702, 18, '20210305', 11, 1000, 1, 'receiving', 108, '2026-04-03', 0, '{\"price\":\"1000\",\"qty\":\"11\"}', 'Stock from Receiving-40597921\n', '2021-10-01 22:30:16'),
(510, 1266, 11, '10023', 23, 50, 1, 'receiving', 108, '2023-01-12', 0, '{\"price\":\"50\",\"qty\":\"23\"}', 'Stock from Receiving-40597921\n', '2021-10-01 22:30:17'),
(511, 1223, 2, 'X26E9008', 24, 1020, 1, 'receiving', 109, '2023-08-31', 0, '{\"price\":\"1020\",\"qty\":\"24\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(512, 176, 2, '2108040', 10, 550, 1, 'receiving', 109, '2023-07-31', 0, '{\"price\":\"550\",\"qty\":\"10\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(513, 998, 2, 'BRB05137A', 50, 95, 1, 'receiving', 109, '2023-04-30', 0, '{\"price\":\"95\",\"qty\":\"50\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(514, 2, 2, 'AXF2009001', 25, 55, 1, 'receiving', 109, '2022-08-31', 0, '{\"price\":\"55\",\"qty\":\"25\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(515, 3, 2, '76757', 27, 105, 1, 'receiving', 109, '2023-03-31', 0, '{\"price\":\"105\",\"qty\":\"27\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(516, 109, 2, 'T022801', 18, 1400, 1, 'receiving', 109, '2022-03-31', 0, '{\"price\":\"1400\",\"qty\":\"18\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:05'),
(517, 76, 2, 'PS1018', 75, 55, 1, 'receiving', 109, '2024-05-31', 0, '{\"price\":\"55\",\"qty\":\"75\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:06'),
(518, 1186, 2, '206453', 5, 650, 1, 'receiving', 109, '2023-12-31', 0, '{\"price\":\"650\",\"qty\":\"5\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:06'),
(519, 738, 1, 'CL1002', 175, 40, 1, 'receiving', 109, '2022-12-31', 0, '{\"price\":\"40\",\"qty\":\"175\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:06'),
(520, 74, 2, '1850415', 4, 900, 1, 'receiving', 109, '2023-05-31', 0, '{\"price\":\"900\",\"qty\":\"4\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:06'),
(521, 2442, 2, '1C38', 141, 28, 1, 'receiving', 109, '2024-02-29', 0, '{\"price\":\"28\",\"qty\":\"141\"}', 'Stock from Receiving-95135630\n', '2021-10-01 22:33:06'),
(522, 2709, 18, '1102', 590, 80, 1, 'receiving', 110, '2024-01-11', 0, '{\"price\":\"80\",\"qty\":\"590\"}', 'Stock from Receiving-22203000\n', '2021-10-01 22:35:44'),
(523, 2712, 21, 'CJ20593', 12, 900, 1, 'receiving', 111, '2023-01-11', 0, '{\"price\":\"900\",\"qty\":\"12\"}', 'Stock from Receiving-24163510\n', '2021-10-01 22:41:50'),
(524, 2715, 18, '111912', 195, 30, 1, 'receiving', 112, '2022-10-12', 0, '{\"price\":\"30\",\"qty\":\"195\"}', 'Stock from Receiving-87258620\n', '2021-10-01 22:50:52'),
(525, 2710, 1, '1D23C1', 67, 70, 1, 'receiving', 113, '2023-04-22', 0, '{\"price\":\"70\",\"qty\":\"67\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:54'),
(526, 94, 2, 'AB52892', 65, 175, 1, 'receiving', 113, '2023-06-30', 0, '{\"price\":\"175\",\"qty\":\"65\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:54'),
(527, 2713, 2, '210611', 630, 24, 1, 'receiving', 113, '2025-06-30', 0, '{\"price\":\"24\",\"qty\":\"630\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:54'),
(528, 2711, 2, '2007111', 282, 65, 1, 'receiving', 113, '2022-06-30', 0, '{\"price\":\"65\",\"qty\":\"282\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:55'),
(529, 993, 2, 'Y0B3UL', 130, 80, 1, 'receiving', 113, '2022-05-31', 0, '{\"price\":\"80\",\"qty\":\"130\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:55'),
(530, 2512, 2, 'Y140XN', 140, 70, 1, 'receiving', 113, '2023-10-31', 0, '{\"price\":\"70\",\"qty\":\"140\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:55'),
(531, 1, 2, '2103004', 10, 1270, 1, 'receiving', 113, '2023-02-28', 0, '{\"price\":\"1270\",\"qty\":\"10\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:55'),
(532, 77, 2, '2106094', 125, 40, 1, 'receiving', 113, '2025-05-31', 0, '{\"price\":\"40\",\"qty\":\"125\"}', 'Stock from Receiving-39038295\n', '2021-10-01 23:07:55'),
(533, 2718, 2, 'FPX2003', 100, 55, 1, 'receiving', 114, '2023-09-30', 0, '{\"price\":\"55\",\"qty\":\"100\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:15'),
(534, 2719, 2, '710094', 104, 750, 1, 'receiving', 114, '2022-03-31', 0, '{\"price\":\"750\",\"qty\":\"104\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:15'),
(535, 2702, 18, '20210305', 1, 1020, 1, 'receiving', 114, '2026-04-03', 0, '{\"price\":\"1020\",\"qty\":\"1\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:16'),
(536, 2716, 11, '202006', 1, 500, 1, 'receiving', 114, '2025-07-06', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:16'),
(537, 2720, 2, 'PX001', 100, 20, 1, 'receiving', 114, '2022-12-31', 0, '{\"price\":\"20\",\"qty\":\"100\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:16'),
(538, 163, 2, '2001060', 52, 110, 1, 'receiving', 114, '2025-01-31', 0, '{\"price\":\"110\",\"qty\":\"52\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:16'),
(539, 4, 2, 'OK69', 53, 130, 1, 'receiving', 114, '2024-10-31', 0, '{\"price\":\"130\",\"qty\":\"53\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:16'),
(540, 42, 27, 'Y094XC', 13, 255, 1, 'receiving', 114, '2023-02-28', 0, '{\"price\":\"255\",\"qty\":\"13\"}', 'Stock from Receiving-56436883\n', '2021-10-02 17:40:17'),
(541, 2721, 2, 'Y095UH', 200, 75, 1, 'receiving', 115, '2025-06-30', 0, '{\"price\":\"75\",\"qty\":\"200\"}', 'Stock from Receiving-28525426\n', '2021-10-02 18:24:48'),
(542, 164, 2, '2011115', 55, 100, 1, 'receiving', 115, '2023-10-31', 0, '{\"price\":\"100\",\"qty\":\"55\"}', 'Stock from Receiving-28525426\n', '2021-10-02 18:24:48'),
(543, 2502, 2, '1902061', 17, 50, 1, 'receiving', 115, '2022-02-28', 0, '{\"price\":\"50\",\"qty\":\"17\"}', 'Stock from Receiving-28525426\n', '2021-10-02 18:24:48'),
(544, 439, 2, '91734', 90, 150, 1, 'receiving', 115, '2025-12-31', 0, '{\"price\":\"150\",\"qty\":\"90\"}', 'Stock from Receiving-28525426\n', '2021-10-02 18:24:48'),
(545, 111, 2, '210919', 117, 20, 1, 'receiving', 115, '2025-03-31', 0, '{\"price\":\"20\",\"qty\":\"117\"}', 'Stock from Receiving-28525426\n', '2021-10-02 18:24:49'),
(546, 2724, 18, '20191210', 36, 180, 1, 'receiving', 116, '2024-12-09', 0, '{\"price\":\"180\",\"qty\":\"36\"}', 'Stock from Receiving-32006104\n', '2021-10-02 21:46:20'),
(547, 2725, 18, '0000-00', 1, 7000, 1, 'receiving', 117, '2030-11-29', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock from Receiving-74950139\n', '2021-10-02 21:48:53'),
(548, 2726, 18, 'VC190350601', 2, 3500, 1, 'receiving', 118, '2024-05-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-36433640\n', '2021-10-02 21:56:54'),
(549, 2727, 18, 'JC202855', 3, 2000, 1, 'receiving', 119, '2025-11-30', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-52549805\n', '2021-10-02 21:59:26'),
(550, 2728, 18, '20210128-2', 3, 2000, 1, 'receiving', 120, '2024-01-31', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-59429536\n', '2021-10-02 22:02:02'),
(551, 14, 2, '1A27', 28, 180, 1, 'receiving', 121, '2024-12-31', 0, '{\"price\":\"180\",\"qty\":\"28\"}', 'Stock from Receiving-03728554\n', '2021-10-02 22:14:22'),
(552, 2722, 292, 'HCG201015', 53, 180, 1, 'receiving', 121, '2022-10-14', 0, '{\"price\":\"180\",\"qty\":\"53\"}', 'Stock from Receiving-03728554\n', '2021-10-02 22:14:23'),
(553, 1106, 281, '36175', 3, 5900, 1, 'receiving', 121, '2025-06-30', 0, '{\"price\":\"5900\",\"qty\":\"3\"}', 'Stock from Receiving-03728554\n', '2021-10-02 22:14:23'),
(554, 108, 1, 'EPRH0761', 78, 70, 1, 'receiving', 121, '2023-01-31', 0, '{\"price\":\"70\",\"qty\":\"78\"}', 'Stock from Receiving-03728554\n', '2021-10-02 22:14:23'),
(555, 2729, 18, '20210128-7', 8, 3500, 1, 'receiving', 122, '2024-01-31', 0, '{\"price\":\"3500\",\"qty\":\"8\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:54'),
(556, 121, 2, '0004', 145, 95, 1, 'receiving', 122, '2023-04-17', 0, '{\"price\":\"95\",\"qty\":\"145\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:54'),
(557, 335, 2, '190560', 33, 60, 1, 'receiving', 122, '2022-09-30', 0, '{\"price\":\"60\",\"qty\":\"33\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:54'),
(558, 1042, 2, 'G2546', 110, 30, 1, 'receiving', 122, '2022-11-30', 0, '{\"price\":\"30\",\"qty\":\"110\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:55'),
(559, 132, 2, 'KZ9002', 10, 250, 1, 'receiving', 122, '2022-04-30', 0, '{\"price\":\"250\",\"qty\":\"10\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:55'),
(560, 115, 2, '1360003', 10, 320, 1, 'receiving', 122, '2023-11-30', 0, '{\"price\":\"320\",\"qty\":\"10\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:55'),
(561, 80, 2, 'BHL6E001', 3, 200, 1, 'receiving', 122, '2022-08-31', 0, '{\"price\":\"200\",\"qty\":\"3\"}', 'Stock from Receiving-64350458\n', '2021-10-02 22:25:56'),
(562, 2731, 18, '932009', 8, 350, 1, 'receiving', 123, '2025-08-31', 0, '{\"price\":\"350\",\"qty\":\"8\"}', 'Stock from Receiving-29211445\n', '2021-10-02 23:18:05'),
(563, 2733, 18, '282010', 15, 350, 1, 'receiving', 123, '2025-09-30', 0, '{\"price\":\"350\",\"qty\":\"15\"}', 'Stock from Receiving-29211445\n', '2021-10-02 23:18:05'),
(564, 2730, 18, '621805', 8, 350, 1, 'receiving', 123, '2023-04-30', 0, '{\"price\":\"350\",\"qty\":\"8\"}', 'Stock from Receiving-29211445\n', '2021-10-02 23:18:05'),
(565, 2732, 18, '272010', 18, 350, 1, 'receiving', 123, '2025-09-30', 0, '{\"price\":\"350\",\"qty\":\"18\"}', 'Stock from Receiving-29211445\n', '2021-10-02 23:18:05'),
(566, 2739, 18, '152104', 10, 1000, 1, 'receiving', 124, '2026-04-15', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:27'),
(567, 2741, 18, 'C-97', 2, 3300, 1, 'receiving', 124, '2024-03-31', 0, '{\"price\":\"3300\",\"qty\":\"2\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:27'),
(568, 2742, 18, '20200818', 2, 850, 1, 'receiving', 124, '2025-08-17', 0, '{\"price\":\"850\",\"qty\":\"2\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:28'),
(569, 2740, 18, '122104', 9, 1000, 1, 'receiving', 124, '2026-04-17', 0, '{\"price\":\"1000\",\"qty\":\"9\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:28'),
(570, 2734, 18, '20190822', 135, 100, 1, 'receiving', 124, '2024-08-21', 0, '{\"price\":\"100\",\"qty\":\"135\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:28'),
(571, 2735, 18, 'CMPL0305', 22, 550, 1, 'receiving', 124, '2024-03-04', 0, '{\"price\":\"550\",\"qty\":\"22\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:29'),
(572, 2736, 18, '20200507', 3, 2000, 1, 'receiving', 124, '2025-05-06', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:29'),
(573, 2737, 18, '2019-12', 4, 2000, 1, 'receiving', 124, '2024-12-31', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:30'),
(574, 2738, 18, 'CMPJ0801', 7, 1500, 1, 'receiving', 124, '2025-07-31', 0, '{\"price\":\"1500\",\"qty\":\"7\"}', 'Stock from Receiving-87872108\n', '2021-10-03 16:17:30'),
(575, 2746, 18, '20201114', 75, 150, 1, 'receiving', 125, '2025-11-13', 0, '{\"price\":\"150\",\"qty\":\"75\"}', 'Stock from Receiving-19324726\n', '2021-10-03 17:14:14'),
(576, 2743, 18, '2101XT5', 52, 86, 1, 'receiving', 125, '2025-12-31', 0, '{\"price\":\"86\",\"qty\":\"52\"}', 'Stock from Receiving-19324726\n', '2021-10-03 17:14:14'),
(577, 2745, 18, '170908', 26, 86, 1, 'receiving', 125, '2022-09-07', 0, '{\"price\":\"86\",\"qty\":\"26\"}', 'Stock from Receiving-19324726\n', '2021-10-03 17:14:14'),
(578, 2744, 18, '200801', 83, 86, 1, 'receiving', 125, '2025-07-31', 0, '{\"price\":\"86\",\"qty\":\"83\"}', 'Stock from Receiving-19324726\n', '2021-10-03 17:14:14'),
(579, 2747, 18, '180126', 107, 86, 1, 'receiving', 125, '2023-01-25', 0, '{\"price\":\"86\",\"qty\":\"107\"}', 'Stock from Receiving-19324726\n', '2021-10-03 17:14:15'),
(580, 1290, 11, 'S2016012', 26, 1700, 1, 'receiving', 126, '2022-06-30', 0, '{\"price\":\"1700\",\"qty\":\"26\"}', 'Stock from Receiving-32581631\n', '2021-10-03 20:28:59'),
(581, 2748, 18, '1072008', 27, 600, 1, 'receiving', 127, '2023-07-31', 0, '{\"price\":\"600\",\"qty\":\"27\"}', 'Stock from Receiving-44081047\n', '2021-10-03 20:35:40'),
(582, 2749, 18, '4767', 11, 230, 1, 'receiving', 128, '2025-10-31', 0, '{\"price\":\"230\",\"qty\":\"11\"}', 'Stock from Receiving-12963823\n', '2021-10-03 20:39:38'),
(583, 2750, 18, '0100104/TZNG/21', 64, 300, 1, 'receiving', 129, '2026-08-31', 0, '{\"price\":\"300\",\"qty\":\"64\"}', 'Stock from Receiving-89635528\n', '2021-10-03 21:02:11'),
(584, 2756, 18, '171202227313', 4, 1000, 1, 'receiving', 130, '2022-11-30', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock from Receiving-98553057\n', '2021-10-03 21:21:09'),
(585, 2753, 18, '190125', 5, 1000, 1, 'receiving', 130, '2024-01-24', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock from Receiving-98553057\n', '2021-10-03 21:21:10'),
(586, 2752, 18, '190529', 5, 1000, 1, 'receiving', 130, '2024-08-25', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock from Receiving-98553057\n', '2021-10-03 21:21:10'),
(587, 2754, 18, '1708011356', 7, 1000, 1, 'receiving', 130, '2022-07-31', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock from Receiving-98553057\n', '2021-10-03 21:21:10'),
(588, 2755, 10, '190506', 10, 1000, 1, 'receiving', 130, '2024-05-15', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock from Receiving-98553057\n', '2021-10-03 21:21:11'),
(589, 2760, 18, '190808', 4, 1000, 1, 'receiving', 131, '2024-11-15', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock from Receiving-93566301\n', '2021-10-03 21:32:02'),
(590, 2759, 10, '40051', 1, 750, 1, 'receiving', 131, '2024-12-31', 0, '{\"price\":\"750\",\"qty\":\"1\"}', 'Stock from Receiving-93566301\n', '2021-10-03 21:32:03'),
(591, 2758, 10, '40050', 3, 750, 1, 'receiving', 131, '2023-12-31', 0, '{\"price\":\"750\",\"qty\":\"3\"}', 'Stock from Receiving-93566301\n', '2021-10-03 21:32:03'),
(592, 2757, 10, '40052', 2, 750, 1, 'receiving', 131, '2024-05-31', 0, '{\"price\":\"750\",\"qty\":\"2\"}', 'Stock from Receiving-93566301\n', '2021-10-03 21:32:03'),
(593, 2751, 18, '200530', 6, 2450, 1, 'receiving', 131, '2025-05-29', 0, '{\"price\":\"2450\",\"qty\":\"6\"}', 'Stock from Receiving-93566301\n', '2021-10-03 21:32:04'),
(594, 2761, 2, 'BT1912125B', 60, 500, 1, 'receiving', 132, '2022-11-30', 0, '{\"price\":\"500\",\"qty\":\"60\"}', 'Stock from Receiving-12806245\n', '2021-10-09 17:06:31'),
(595, 633, 2, 'DY1719', 55, 500, 1, 'receiving', 132, '2022-09-30', 0, '{\"price\":\"500\",\"qty\":\"55\"}', 'Stock from Receiving-12806245\n', '2021-10-09 17:06:31'),
(596, 197, 2, '84514', 30, 250, 1, 'receiving', 132, '2024-11-30', 0, '{\"price\":\"250\",\"qty\":\"30\"}', 'Stock from Receiving-12806245\n', '2021-10-09 17:06:32'),
(597, 198, 2, '81722', 440, 150, 1, 'receiving', 132, '2024-05-31', 0, '{\"price\":\"150\",\"qty\":\"440\"}', 'Stock from Receiving-12806245\n', '2021-10-09 17:06:32'),
(598, 2762, 2, 'NR00648A', 25, 2100, 1, 'receiving', 133, '2024-01-31', 0, '{\"price\":\"2100\",\"qty\":\"25\"}', 'Stock from Receiving-00021960\n', '2021-10-09 17:14:27'),
(599, 854, 2, 'S4W2', 40, 800, 1, 'receiving', 133, '2023-12-31', 0, '{\"price\":\"800\",\"qty\":\"40\"}', 'Stock from Receiving-00021960\n', '2021-10-09 17:14:27'),
(600, 2763, 2, '84235', 30, 500, 1, 'receiving', 134, '2024-10-31', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock from Receiving-62994401\n', '2021-10-09 17:17:31'),
(601, 2764, 2, 'BT1901089A', 7, 1500, 1, 'receiving', 135, '2021-12-31', 0, '{\"price\":\"1500\",\"qty\":\"7\"}', 'Stock from Receiving-86021789\n', '2021-10-09 17:19:41'),
(602, 2765, 293, 'TL670001', 6, 1000, 1, 'receiving', 136, '2022-11-30', 0, '{\"price\":\"1000\",\"qty\":\"6\"}', 'Stock from Receiving-57609114\n', '2021-10-09 17:33:09'),
(603, 2766, 293, '8105870', 5, 1000, 1, 'receiving', 136, '2023-04-30', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock from Receiving-57609114\n', '2021-10-09 17:33:09'),
(604, 1162, 1, 'TSSA21003', 106, 500, 1, 'receiving', 136, '2022-12-31', 0, '{\"price\":\"500\",\"qty\":\"106\"}', 'Stock from Receiving-57609114\n', '2021-10-09 17:33:09'),
(605, 2767, 1, 'BTC1913A', 10, 400, 1, 'receiving', 137, '2022-09-30', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock from Receiving-14440949\n', '2021-10-09 17:36:24'),
(606, 2768, 2, 'IA960001', 66, 400, 1, 'receiving', 138, '2022-01-31', 0, '{\"price\":\"400\",\"qty\":\"66\"}', 'Stock from Receiving-96448252\n', '2021-10-09 17:39:41'),
(607, 2772, 2, 'KA03109', 9, 1250, 1, 'receiving', 139, '2023-08-09', 0, '{\"price\":\"1250\",\"qty\":\"9\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:37'),
(608, 2773, 2, 'KA03237', 9, 1500, 1, 'receiving', 139, '2023-08-31', 0, '{\"price\":\"1500\",\"qty\":\"9\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:37'),
(609, 2771, 2, '2105016', 15, 1000, 1, 'receiving', 139, '2023-04-30', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:38'),
(610, 2775, 2, 'PA1959I', 3, 1000, 1, 'receiving', 139, '2022-08-31', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:38'),
(611, 2774, 2, 'PA1059L', 3, 1250, 1, 'receiving', 139, '2022-11-30', 0, '{\"price\":\"1250\",\"qty\":\"3\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:38'),
(612, 2770, 2, '13520', 2, 5500, 1, 'receiving', 139, '2023-02-28', 0, '{\"price\":\"5500\",\"qty\":\"2\"}', 'Stock from Receiving-26405454\n', '2021-10-09 18:15:39'),
(613, 2769, 2, 'PA1420A', 2, 2500, 1, 'receiving', 140, '2022-12-31', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock from Receiving-51166070\n', '2021-10-09 18:16:48'),
(614, 350, 2, 'E3L012', 100, 500, 1, 'receiving', 141, '2024-11-30', 0, '{\"price\":\"500\",\"qty\":\"100\"}', 'Stock from Receiving-21784771\n', '2021-10-10 17:53:25'),
(615, 461, 2, 'CWB007', 20, 500, 1, 'receiving', 141, '2023-05-31', 0, '{\"price\":\"500\",\"qty\":\"20\"}', 'Stock from Receiving-21784771\n', '2021-10-10 17:53:25'),
(616, 788, 2, 'LET120604D', 23, 1000, 1, 'receiving', 141, '2023-03-31', 0, '{\"price\":\"1000\",\"qty\":\"23\"}', 'Stock from Receiving-21784771\n', '2021-10-10 17:53:25'),
(617, 2776, 2, '362492', 161, 1850, 1, 'receiving', 141, '2025-04-10', 0, '{\"price\":\"1850\",\"qty\":\"161\"}', 'Stock from Receiving-21784771\n', '2021-10-10 17:53:26'),
(618, 2777, 2, '220C', 20, 500, 1, 'receiving', 142, '2021-11-30', 0, '{\"price\":\"500\",\"qty\":\"20\"}', 'Stock from Receiving-07592319\n', '2021-10-10 17:55:59'),
(619, 947, 2, '93902', 871, 500, 1, 'receiving', 143, '2026-03-31', 0, '{\"price\":\"500\",\"qty\":\"871\"}', 'Stock from Receiving-87301639\n', '2021-10-10 18:02:01'),
(620, 950, 2, 'KU1001', 10, 230, 1, 'receiving', 144, '2023-12-30', 0, '{\"price\":\"230\",\"qty\":\"10\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:52'),
(621, 441, 2, 'CIR2012002', 30, 560, 1, 'receiving', 144, '2024-11-30', 0, '{\"price\":\"560\",\"qty\":\"30\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:53'),
(622, 649, 1, 'FU0010', 43, 500, 1, 'receiving', 144, '2023-06-30', 0, '{\"price\":\"500\",\"qty\":\"43\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:53'),
(623, 186, 2, 'G000108', 110, 130, 1, 'receiving', 144, '2023-12-31', 0, '{\"price\":\"130\",\"qty\":\"110\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:53'),
(624, 485, 2, '70122', 30, 120, 1, 'receiving', 144, '2023-12-31', 0, '{\"price\":\"120\",\"qty\":\"30\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:53'),
(625, 769, 1, 'CA08508', 76, 950, 1, 'receiving', 144, '2023-07-31', 0, '{\"price\":\"950\",\"qty\":\"76\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:54'),
(626, 700, 2, '1B30', 72, 220, 1, 'receiving', 144, '2024-01-31', 0, '{\"price\":\"220\",\"qty\":\"72\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:54'),
(627, 1170, 2, '(10)A0F0T004', 5, 700, 1, 'receiving', 144, '2023-06-30', 0, '{\"price\":\"700\",\"qty\":\"5\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:54'),
(628, 2778, 1, '5806468', 20, 6500, 1, 'receiving', 144, '2022-05-31', 0, '{\"price\":\"6500\",\"qty\":\"20\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:54'),
(629, 2779, 2, '050G020', 10, 6500, 1, 'receiving', 144, '2023-06-30', 0, '{\"price\":\"6500\",\"qty\":\"10\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:54'),
(630, 451, 278, 'M2108109', 9, 24500, 1, 'receiving', 144, '2023-04-30', 0, '{\"price\":\"24500\",\"qty\":\"9\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:55'),
(631, 1184, 2, 'OL0004', 62, 1350, 1, 'receiving', 144, '2023-11-30', 0, '{\"price\":\"1350\",\"qty\":\"62\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:55'),
(632, 969, 2, 'SKU0202', 90, 400, 1, 'receiving', 144, '2022-01-31', 0, '{\"price\":\"400\",\"qty\":\"90\"}', 'Stock from Receiving-23483601\n', '2021-10-10 18:53:55'),
(633, 1101, 2, 'DYC006', 3, 2300, 1, 'receiving', 145, '2024-08-31', 0, '{\"price\":\"2300\",\"qty\":\"3\"}', 'Stock from Receiving-97735511\n', '2021-10-10 19:07:03'),
(634, 2780, 2, 'CS20079', 95, 100, 1, 'receiving', 145, '2023-09-30', 0, '{\"price\":\"100\",\"qty\":\"95\"}', 'Stock from Receiving-97735511\n', '2021-10-10 19:07:03'),
(635, 2480, 2, 'XB073', 125, 100, 1, 'receiving', 146, '2022-05-31', 0, '{\"price\":\"100\",\"qty\":\"125\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:41'),
(636, 2782, 1, '36821002', 100, 100, 1, 'receiving', 146, '2024-01-31', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:41'),
(637, 890, 2, 'TK0048', 100, 45, 1, 'receiving', 146, '2022-09-30', 0, '{\"price\":\"45\",\"qty\":\"100\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:41'),
(638, 2781, 1, 'MP19525', 34, 100, 1, 'receiving', 146, '2022-11-30', 0, '{\"price\":\"100\",\"qty\":\"34\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:41'),
(639, 2456, 1, 'AX667', 285, 50, 1, 'receiving', 146, '2023-06-30', 0, '{\"price\":\"50\",\"qty\":\"285\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:41'),
(640, 889, 2, 'PM620021', 788, 100, 1, 'receiving', 146, '2023-10-31', 0, '{\"price\":\"100\",\"qty\":\"788\"}', 'Stock from Receiving-15299497\n', '2021-10-10 19:24:42'),
(641, 2784, 2, '21070287', 100, 2650, 1, 'receiving', 147, '2023-06-30', 0, '{\"price\":\"2650\",\"qty\":\"100\"}', 'Stock from Receiving-57579350\n', '2021-10-10 19:32:34'),
(642, 2783, 2, '2101037', 43, 45, 1, 'receiving', 147, '2024-12-31', 0, '{\"price\":\"45\",\"qty\":\"43\"}', 'Stock from Receiving-57579350\n', '2021-10-10 19:32:34'),
(643, 2786, 31, 'M003', 1, 14300, 1, 'receiving', 148, '2023-06-30', 0, '{\"price\":\"14300\",\"qty\":\"1\"}', 'Stock from Receiving-80795392\n', '2021-10-10 19:39:47'),
(644, 2785, 31, '22743', 18, 4500, 1, 'receiving', 148, '2022-04-30', 0, '{\"price\":\"4500\",\"qty\":\"18\"}', 'Stock from Receiving-80795392\n', '2021-10-10 19:39:47'),
(645, 290, 288, 'AL1008', 4, 2500, 1, 'receiving', 149, '2023-05-31', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:45'),
(646, 608, 288, '2012068', 4, 1800, 1, 'receiving', 149, '2022-11-30', 0, '{\"price\":\"1800\",\"qty\":\"4\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:45'),
(647, 2789, 288, '1A68A', 2, 1240, 1, 'receiving', 149, '2022-12-31', 0, '{\"price\":\"1240\",\"qty\":\"2\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:45'),
(648, 236, 11, '911757', 1, 5460, 1, 'receiving', 149, '2022-11-30', 0, '{\"price\":\"5460\",\"qty\":\"1\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:46'),
(649, 2787, 287, 'MP19448', 2, 1430, 1, 'receiving', 149, '2021-10-31', 0, '{\"price\":\"1430\",\"qty\":\"2\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:46'),
(650, 2788, 288, '21520134', 3, 3500, 1, 'receiving', 149, '2023-02-28', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-60789188\n', '2021-10-10 20:02:46'),
(651, 887, 5, 'PIX20050', 17, 1000, 1, 'receiving', 150, '2023-04-30', 0, '{\"price\":\"1000\",\"qty\":\"17\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:13'),
(652, 79, 288, '2004634', 1, 5500, 1, 'receiving', 150, '2023-06-30', 0, '{\"price\":\"5500\",\"qty\":\"1\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:13'),
(653, 421, 288, '1912051', 2, 1650, 1, 'receiving', 150, '2022-11-30', 0, '{\"price\":\"1650\",\"qty\":\"2\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:14'),
(654, 235, 11, 'S0765', 4, 1650, 1, 'receiving', 150, '2023-04-30', 0, '{\"price\":\"1650\",\"qty\":\"4\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:14'),
(655, 2792, 254, '536453', 1, 4500, 1, 'receiving', 150, '2022-08-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:14'),
(656, 2793, 287, 'IIP20143', 1, 4500, 1, 'receiving', 150, '2022-10-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:14'),
(657, 2790, 288, 'A1ALK006', 1, 3500, 1, 'receiving', 150, '2023-05-31', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:15'),
(658, 651, 254, 'A490674', 5, 1650, 1, 'receiving', 150, '2022-10-31', 0, '{\"price\":\"1650\",\"qty\":\"5\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:15');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(659, 2791, 288, '1C71', 9, 1000, 1, 'receiving', 150, '2024-02-29', 0, '{\"price\":\"1000\",\"qty\":\"9\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:15'),
(660, 12, 288, '078322', 4, 1500, 1, 'receiving', 150, '2023-07-31', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-28405746\n', '2021-10-10 20:45:16'),
(661, 123, 288, '2105134', 2, 1000, 1, 'receiving', 151, '2024-04-30', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock from Receiving-71767742\n', '2021-10-10 21:00:13'),
(662, 2797, 288, 'ODXDA20009A', 1, 4500, 1, 'receiving', 151, '2023-05-31', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock from Receiving-71767742\n', '2021-10-10 21:00:13'),
(663, 2796, 288, '1326002', 8, 4560, 1, 'receiving', 151, '2023-03-31', 0, '{\"price\":\"4560\",\"qty\":\"8\"}', 'Stock from Receiving-71767742\n', '2021-10-10 21:00:14'),
(664, 2795, 288, 'C4561008', 2, 2500, 1, 'receiving', 151, '2022-12-31', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock from Receiving-71767742\n', '2021-10-10 21:00:14'),
(665, 2794, 288, '21015', 8, 1100, 1, 'receiving', 151, '2024-04-30', 0, '{\"price\":\"1100\",\"qty\":\"8\"}', 'Stock from Receiving-71767742\n', '2021-10-10 21:00:14'),
(666, 2800, 2, 'BRB011234B', 8, 100, 1, 'receiving', 152, '2025-12-31', 0, '{\"price\":\"100\",\"qty\":\"8\"}', 'Stock from Receiving-29727529\n', '2021-10-10 21:09:50'),
(667, 2798, 1, 'CA03621', 400, 100, 1, 'receiving', 153, '2022-02-28', 0, '{\"price\":\"100\",\"qty\":\"400\"}', 'Stock from Receiving-48864728\n', '2021-10-10 21:15:31'),
(668, 2799, 1, '2108090', 100, 100, 1, 'receiving', 153, '2024-10-05', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock from Receiving-48864728\n', '2021-10-10 21:15:32'),
(669, 949, 2, 'EW199006', 92, 100, 1, 'receiving', 154, '2022-06-30', 0, '{\"price\":\"100\",\"qty\":\"92\"}', 'Stock from Receiving-10077924\n', '2021-10-10 21:31:15'),
(670, 442, 2, 'T0100', 310, 100, 1, 'receiving', 154, '2023-03-30', 0, '{\"price\":\"100\",\"qty\":\"310\"}', 'Stock from Receiving-10077924\n', '2021-10-10 21:31:15'),
(671, 945, 2, '200127', 91, 100, 1, 'receiving', 154, '2022-12-30', 0, '{\"price\":\"100\",\"qty\":\"91\"}', 'Stock from Receiving-10077924\n', '2021-10-10 21:31:15'),
(672, 1005, 160, '210721', 85, 50, 1, 'receiving', 154, '2024-02-29', 0, '{\"price\":\"50\",\"qty\":\"85\"}', 'Stock from Receiving-10077924\n', '2021-10-10 21:31:15'),
(673, 411, 1, 'C3210014', 165, 100, 1, 'receiving', 155, '2023-02-28', 0, '{\"price\":\"100\",\"qty\":\"165\"}', 'Stock from Receiving-14618541\n', '2021-10-10 21:43:39'),
(674, 396, 1, '0104003', 40, 250, 1, 'receiving', 155, '2023-09-30', 0, '{\"price\":\"250\",\"qty\":\"40\"}', 'Stock from Receiving-14618541\n', '2021-10-10 21:43:40'),
(675, 412, 1, '0101021', 428, 100, 1, 'receiving', 155, '2023-06-30', 0, '{\"price\":\"100\",\"qty\":\"428\"}', 'Stock from Receiving-14618541\n', '2021-10-10 21:43:40'),
(676, 2467, 2, 'TITC20003', 7, 500, 1, 'receiving', 155, '2022-11-30', 0, '{\"price\":\"500\",\"qty\":\"7\"}', 'Stock from Receiving-14618541\n', '2021-10-10 21:43:40'),
(677, 607, 2, 'EK21009', 124, 100, 1, 'receiving', 156, '2024-01-30', 0, '{\"price\":\"100\",\"qty\":\"124\"}', 'Stock from Receiving-21049476\n', '2021-10-10 21:55:08'),
(678, 1177, 1, '2003065', 55, 100, 1, 'receiving', 156, '2023-02-28', 0, '{\"price\":\"100\",\"qty\":\"55\"}', 'Stock from Receiving-21049476\n', '2021-10-10 21:55:08'),
(679, 420, 1, '2010220', 200, 100, 1, 'receiving', 156, '2023-11-30', 0, '{\"price\":\"100\",\"qty\":\"200\"}', 'Stock from Receiving-21049476\n', '2021-10-10 21:55:09'),
(680, 2484, 2, 'PA03900', 40, 750, 1, 'receiving', 156, '2023-06-30', 0, '{\"price\":\"750\",\"qty\":\"40\"}', 'Stock from Receiving-21049476\n', '2021-10-10 21:55:09'),
(681, 2485, 2, 'EV10220', 2, 750, 1, 'receiving', 156, '2024-01-30', 0, '{\"price\":\"750\",\"qty\":\"2\"}', 'Stock from Receiving-21049476\n', '2021-10-10 21:55:09'),
(682, 420, 1, '2012017', 200, 100, 1, 'receiving', 157, '2023-11-30', 0, '{\"price\":\"100\",\"qty\":\"200\"}', 'Stock from Receiving-08553106\n', '2021-10-10 21:58:25'),
(683, 2804, 2, 'PT723', 200, 55, 1, 'receiving', 158, '2022-10-31', 0, '{\"price\":\"55\",\"qty\":\"200\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:17'),
(684, 2803, 2, 'NFSIG907E', 12, 850, 1, 'receiving', 158, '2022-07-31', 0, '{\"price\":\"850\",\"qty\":\"12\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:18'),
(685, 221, 1, '78815', 20, 10000, 1, 'receiving', 158, '2024-03-31', 0, '{\"price\":\"10000\",\"qty\":\"20\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:18'),
(686, 647, 1, '0220291', 80, 500, 1, 'receiving', 158, '2023-02-28', 0, '{\"price\":\"500\",\"qty\":\"80\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:18'),
(687, 646, 1, '20493001', 100, 550, 1, 'receiving', 158, '2022-01-31', 0, '{\"price\":\"550\",\"qty\":\"100\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:18'),
(688, 2802, 1, 'SC1025', 85, 100, 1, 'receiving', 158, '2023-04-30', 0, '{\"price\":\"100\",\"qty\":\"85\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:19'),
(689, 2801, 1, 'CL1042', 420, 100, 1, 'receiving', 158, '2023-05-31', 0, '{\"price\":\"100\",\"qty\":\"420\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:19'),
(690, 287, 2, 'ZLM2103004', 12, 400, 1, 'receiving', 158, '2024-02-29', 0, '{\"price\":\"400\",\"qty\":\"12\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:19'),
(691, 285, 2, '2105071', 572, 400, 1, 'receiving', 158, '2023-05-31', 0, '{\"price\":\"400\",\"qty\":\"572\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:19'),
(692, 286, 2, '4171A06', 131, 400, 1, 'receiving', 158, '2024-04-30', 0, '{\"price\":\"400\",\"qty\":\"131\"}', 'Stock from Receiving-74992894\n', '2021-10-10 22:28:20'),
(693, 2806, 2, 'ZA129', 14, 550, 1, 'receiving', 159, '2022-09-30', 0, '{\"price\":\"550\",\"qty\":\"14\"}', 'Stock from Receiving-68651702\n', '2021-10-10 22:39:14'),
(694, 2805, 2, 'T1040004TA', 196, 550, 1, 'receiving', 159, '2022-11-30', 0, '{\"price\":\"550\",\"qty\":\"196\"}', 'Stock from Receiving-68651702\n', '2021-10-10 22:39:14'),
(695, 225, 2, 'EN2520012-A', 155, 550, 1, 'receiving', 159, '2022-09-30', 0, '{\"price\":\"550\",\"qty\":\"155\"}', 'Stock from Receiving-68651702\n', '2021-10-10 22:39:14'),
(696, 1079, 2, 'BRA01161C', 30, 250, 1, 'receiving', 160, '2021-12-31', 0, '{\"price\":\"250\",\"qty\":\"30\"}', 'Stock from Receiving-03722451\n', '2021-10-12 20:17:48'),
(697, 934, 2, 'DY1536', 30, 300, 1, 'receiving', 160, '2022-09-30', 0, '{\"price\":\"300\",\"qty\":\"30\"}', 'Stock from Receiving-03722451\n', '2021-10-12 20:17:49'),
(698, 1046, 2, '87674', 35, 100, 1, 'receiving', 160, '2025-05-31', 0, '{\"price\":\"100\",\"qty\":\"35\"}', 'Stock from Receiving-03722451\n', '2021-10-12 20:17:49'),
(699, 1080, 2, 'D2101037', 210, 400, 1, 'receiving', 161, '2024-03-31', 0, '{\"price\":\"400\",\"qty\":\"210\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:51'),
(700, 276, 2, 'AO11820B', 80, 100, 1, 'receiving', 161, '2023-06-30', 0, '{\"price\":\"100\",\"qty\":\"80\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:51'),
(701, 2482, 2, 'ESL139011', 10, 400, 1, 'receiving', 161, '2021-10-31', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:51'),
(702, 2468, 2, 'BCSH20004', 30, 400, 1, 'receiving', 161, '2023-02-28', 0, '{\"price\":\"400\",\"qty\":\"30\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:52'),
(703, 2481, 2, 'B0519010', 28, 250, 1, 'receiving', 161, '2021-11-30', 0, '{\"price\":\"250\",\"qty\":\"28\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:52'),
(704, 366, 2, 'PA11480', 90, 400, 1, 'receiving', 161, '2022-09-30', 0, '{\"price\":\"400\",\"qty\":\"90\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:52'),
(705, 367, 2, 'PA11400', 40, 250, 1, 'receiving', 161, '2022-09-30', 0, '{\"price\":\"250\",\"qty\":\"40\"}', 'Stock from Receiving-66234437\n', '2021-10-12 20:35:52'),
(706, 2474, 2, 'RT0620002C', 260, 150, 1, 'receiving', 162, '2023-08-31', 0, '{\"price\":\"150\",\"qty\":\"260\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:05'),
(707, 388, 2, 'TU0003', 32, 150, 1, 'receiving', 162, '2023-07-31', 0, '{\"price\":\"150\",\"qty\":\"32\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:05'),
(708, 390, 2, 'B786G003', 30, 150, 1, 'receiving', 162, '2023-05-31', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:06'),
(709, 389, 2, 'CBY150004', 39, 150, 1, 'receiving', 162, '2021-12-31', 0, '{\"price\":\"150\",\"qty\":\"39\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:06'),
(710, 274, 2, 'S7338001', 74, 50, 1, 'receiving', 162, '2021-11-30', 0, '{\"price\":\"50\",\"qty\":\"74\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:06'),
(711, 180, 2, 'AR015G', 439, 60, 1, 'receiving', 162, '2024-04-30', 0, '{\"price\":\"60\",\"qty\":\"439\"}', 'Stock from Receiving-63330436\n', '2021-10-12 21:00:06'),
(712, 708, 2, '81026', 300, 150, 1, 'receiving', 163, '2022-03-31', 0, '{\"price\":\"150\",\"qty\":\"300\"}', 'Stock from Receiving-30095818\n', '2021-10-12 21:03:45'),
(713, 765, 2, '90138', 56, 150, 1, 'receiving', 164, '2025-10-30', 0, '{\"price\":\"150\",\"qty\":\"56\"}', 'Stock from Receiving-74045302\n', '2021-10-12 21:14:31'),
(714, 875, 2, '88791', 60, 150, 1, 'receiving', 164, '2025-07-31', 0, '{\"price\":\"150\",\"qty\":\"60\"}', 'Stock from Receiving-74045302\n', '2021-10-12 21:14:32'),
(715, 1139, 2, '91194', 138, 100, 1, 'receiving', 164, '2025-11-30', 0, '{\"price\":\"100\",\"qty\":\"138\"}', 'Stock from Receiving-74045302\n', '2021-10-12 21:14:32'),
(716, 1, 2, '2103004', 4, 2000, 2, 'Sales', 78, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock out from Sales-00000000\n', '2021-10-12 21:20:56'),
(717, 2807, 2, '200015', 115, 50, 1, 'receiving', 165, '2024-12-31', 0, '{\"price\":\"50\",\"qty\":\"115\"}', 'Stock from Receiving-26496021\n', '2021-10-12 21:38:11'),
(718, 300, 2, '200337', 190, 80, 1, 'receiving', 165, '2024-05-31', 0, '{\"price\":\"80\",\"qty\":\"190\"}', 'Stock from Receiving-26496021\n', '2021-10-12 21:38:12'),
(719, 2808, 2, 'BT190069B', 70, 320, 1, 'receiving', 166, '2022-09-30', 0, '{\"price\":\"320\",\"qty\":\"70\"}', 'Stock from Receiving-44883251\n', '2021-10-12 21:55:52'),
(720, 2462, 2, 'E16P020007', 135, 80, 1, 'receiving', 166, '2023-05-31', 0, '{\"price\":\"80\",\"qty\":\"135\"}', 'Stock from Receiving-44883251\n', '2021-10-12 21:55:53'),
(721, 2810, 2, 'D00865', 150, 30, 1, 'receiving', 167, '2023-09-30', 0, '{\"price\":\"30\",\"qty\":\"150\"}', 'Stock from Receiving-88585622\n', '2021-10-12 22:01:30'),
(722, 214, 2, '015A0', 20, 75, 1, 'receiving', 168, '2023-01-31', 0, '{\"price\":\"75\",\"qty\":\"20\"}', 'Stock from Receiving-72451917\n', '2021-10-12 22:26:59'),
(723, 1165, 2, 'D2101257', 157, 500, 1, 'receiving', 168, '2024-03-31', 0, '{\"price\":\"500\",\"qty\":\"157\"}', 'Stock from Receiving-72451917\n', '2021-10-12 22:26:59'),
(724, 1164, 2, 'D2000640', 25, 200, 1, 'receiving', 168, '2023-04-30', 0, '{\"price\":\"200\",\"qty\":\"25\"}', 'Stock from Receiving-72451917\n', '2021-10-12 22:26:59'),
(725, 938, 2, 'G004732', 130, 50, 1, 'receiving', 169, '2023-09-30', 0, '{\"price\":\"50\",\"qty\":\"130\"}', 'Stock from Receiving-31881340\n', '2021-10-12 22:31:13'),
(726, 2811, 2, 'BRA12083A', 10, 500, 1, 'receiving', 170, '2022-11-30', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock from Receiving-26416894\n', '2021-10-12 22:43:46'),
(727, 1163, 2, 'BRAO5210A', 160, 300, 1, 'receiving', 170, '2023-04-30', 0, '{\"price\":\"300\",\"qty\":\"160\"}', 'Stock from Receiving-26416894\n', '2021-10-12 22:43:46'),
(728, 856, 2, '9Y3', 60, 100, 1, 'receiving', 171, '2023-01-31', 0, '{\"price\":\"100\",\"qty\":\"60\"}', 'Stock from Receiving-23678381\n', '2021-10-12 23:51:21'),
(729, 858, 2, 'SKU0584', 90, 350, 1, 'receiving', 171, '2022-05-31', 0, '{\"price\":\"350\",\"qty\":\"90\"}', 'Stock from Receiving-23678381\n', '2021-10-12 23:51:21'),
(730, 861, 2, 'BRA08192A', 120, 350, 1, 'receiving', 171, '2022-07-31', 0, '{\"price\":\"350\",\"qty\":\"120\"}', 'Stock from Receiving-23678381\n', '2021-10-12 23:51:22'),
(731, 860, 2, '9HDREEZYREZ', 150, 250, 1, 'receiving', 171, '2024-02-29', 0, '{\"price\":\"250\",\"qty\":\"150\"}', 'Stock from Receiving-23678381\n', '2021-10-12 23:51:22'),
(732, 857, 2, '210270', 340, 40, 1, 'receiving', 172, '2024-01-31', 0, '{\"price\":\"40\",\"qty\":\"340\"}', 'Stock from Receiving-22909497\n', '2021-10-12 23:54:39'),
(733, 2812, 2, '71373', 330, 100, 1, 'receiving', 173, '2022-02-28', 0, '{\"price\":\"100\",\"qty\":\"330\"}', 'Stock from Receiving-62691438\n', '2021-10-12 23:59:28'),
(734, 684, 2, 'HH0008', 160, 40, 1, 'receiving', 174, '2023-06-30', 0, '{\"price\":\"40\",\"qty\":\"160\"}', 'Stock from Receiving-01175447\n', '2021-10-13 00:03:52'),
(735, 1016, 2, 'M174K019E', 30, 240, 1, 'receiving', 174, '2022-09-30', 0, '{\"price\":\"240\",\"qty\":\"30\"}', 'Stock from Receiving-01175447\n', '2021-10-13 00:03:53'),
(736, 177, 2, '86268', 100, 120, 1, 'receiving', 175, '2025-02-28', 0, '{\"price\":\"120\",\"qty\":\"100\"}', 'Stock from Receiving-83872787\n', '2021-10-13 00:06:24'),
(737, 375, 2, 'CA2520003-A', 116, 100, 1, 'receiving', 176, '2023-05-31', 0, '{\"price\":\"100\",\"qty\":\"116\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:04'),
(738, 879, 2, 'MLT1901', 50, 750, 1, 'receiving', 176, '2022-01-31', 0, '{\"price\":\"750\",\"qty\":\"50\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:04'),
(739, 314, 2, 'UDRA', 33, 550, 1, 'receiving', 176, '2022-02-28', 0, '{\"price\":\"550\",\"qty\":\"33\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:05'),
(740, 592, 2, '87329', 60, 200, 1, 'receiving', 176, '2023-04-30', 0, '{\"price\":\"200\",\"qty\":\"60\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:05'),
(741, 467, 2, 'BGB5G002', 80, 150, 1, 'receiving', 176, '2022-04-30', 0, '{\"price\":\"150\",\"qty\":\"80\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:05'),
(742, 616, 2, 'E16TO20013', 37, 500, 1, 'receiving', 176, '2022-08-31', 0, '{\"price\":\"500\",\"qty\":\"37\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:06'),
(743, 1200, 2, '2002979', 18, 1250, 1, 'receiving', 176, '2023-08-31', 0, '{\"price\":\"1250\",\"qty\":\"18\"}', 'Stock from Receiving-13531857\n', '2021-10-13 22:13:06'),
(744, 2814, 28, '1911530', 4, 1000, 1, 'receiving', 177, '2022-11-30', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock from Receiving-75044979\n', '2021-10-13 22:25:02'),
(745, 301, 28, '20201109', 24, 1000, 1, 'receiving', 177, '2023-10-31', 0, '{\"price\":\"1000\",\"qty\":\"24\"}', 'Stock from Receiving-75044979\n', '2021-10-13 22:25:03'),
(746, 2815, 28, 'KY0120001-A', 2, 5650, 1, 'receiving', 178, '2022-01-31', 0, '{\"price\":\"5650\",\"qty\":\"2\"}', 'Stock from Receiving-01811086\n', '2021-10-13 22:29:27'),
(747, 2816, 28, '58820302', 16, 1000, 1, 'receiving', 179, '2024-03-31', 0, '{\"price\":\"1000\",\"qty\":\"16\"}', 'Stock from Receiving-28329486\n', '2021-10-13 22:34:06'),
(748, 805, 28, 'NL170001', 2, 1450, 1, 'receiving', 180, '2023-08-31', 0, '{\"price\":\"1450\",\"qty\":\"2\"}', 'Stock from Receiving-06980061\n', '2021-10-13 22:39:15'),
(749, 806, 28, 'ID0019', 4, 1450, 1, 'receiving', 180, '2023-09-30', 0, '{\"price\":\"1450\",\"qty\":\"4\"}', 'Stock from Receiving-06980061\n', '2021-10-13 22:39:15'),
(750, 405, 28, '1341Z046', 38, 1250, 1, 'receiving', 181, '2024-04-30', 0, '{\"price\":\"1250\",\"qty\":\"38\"}', 'Stock from Receiving-62830571\n', '2021-10-13 22:46:38'),
(751, 2457, 28, 'BAPM20013', 4, 1250, 1, 'receiving', 181, '2022-06-30', 0, '{\"price\":\"1250\",\"qty\":\"4\"}', 'Stock from Receiving-62830571\n', '2021-10-13 22:46:38'),
(752, 233, 28, '629200701', 11, 1250, 1, 'receiving', 181, '2022-07-31', 0, '{\"price\":\"1250\",\"qty\":\"11\"}', 'Stock from Receiving-62830571\n', '2021-10-13 22:46:38'),
(753, 232, 28, '200501', 10, 1250, 1, 'receiving', 182, '2023-05-31', 0, '{\"price\":\"1250\",\"qty\":\"10\"}', 'Stock from Receiving-48945351\n', '2021-10-13 22:50:34'),
(754, 1251, 28, 'FQ1003', 15, 1350, 1, 'receiving', 183, '2023-04-30', 0, '{\"price\":\"1350\",\"qty\":\"15\"}', 'Stock from Receiving-72459400\n', '2021-10-13 22:56:08'),
(755, 2818, 28, 'BZ1003', 8, 1050, 1, 'receiving', 184, '2024-01-31', 0, '{\"price\":\"1050\",\"qty\":\"8\"}', 'Stock from Receiving-47555232\n', '2021-10-13 23:04:07'),
(756, 2817, 28, 'QD6201002', 12, 550, 1, 'receiving', 184, '2023-10-23', 0, '{\"price\":\"550\",\"qty\":\"12\"}', 'Stock from Receiving-47555232\n', '2021-10-13 23:04:07'),
(757, 2819, 28, 'EF0003', 12, 1350, 1, 'receiving', 185, '2023-04-30', 0, '{\"price\":\"1350\",\"qty\":\"12\"}', 'Stock from Receiving-65641332\n', '2021-10-13 23:10:50'),
(758, 191, 28, 'AB0004', 7, 1000, 1, 'receiving', 185, '2022-08-31', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock from Receiving-65641332\n', '2021-10-13 23:10:50'),
(759, 670, 28, 'XA0B002', 21, 650, 1, 'receiving', 186, '2022-01-31', 0, '{\"price\":\"650\",\"qty\":\"21\"}', 'Stock from Receiving-11168594\n', '2021-10-13 23:16:56'),
(760, 876, 28, 'FS380002', 6, 1000, 1, 'receiving', 186, '2022-12-31', 0, '{\"price\":\"1000\",\"qty\":\"6\"}', 'Stock from Receiving-11168594\n', '2021-10-13 23:16:57'),
(761, 2495, 29, 'EX1001', 2, 1000, 1, 'receiving', 186, '2023-12-31', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock from Receiving-11168594\n', '2021-10-13 23:16:57'),
(762, 989, 28, 'PMC003', 2, 9700, 1, 'receiving', 187, '2022-08-31', 0, '{\"price\":\"9700\",\"qty\":\"2\"}', 'Stock from Receiving-92395774\n', '2021-10-14 21:59:46'),
(763, 1198, 28, 'TR2-0108', 3, 1550, 1, 'receiving', 187, '2022-04-30', 0, '{\"price\":\"1550\",\"qty\":\"3\"}', 'Stock from Receiving-92395774\n', '2021-10-14 21:59:46'),
(764, 542, 29, '203211082', 54, 500, 1, 'receiving', 188, '2023-02-28', 0, '{\"price\":\"500\",\"qty\":\"54\"}', 'Stock from Receiving-63549738\n', '2021-10-14 22:01:42'),
(765, 1205, 28, 'TRIAVA007', 7, 2300, 1, 'receiving', 189, '2025-03-12', 0, '{\"price\":\"2300\",\"qty\":\"7\"}', 'Stock from Receiving-31001629\n', '2021-10-14 22:08:45'),
(766, 2430, 29, 'DHD2113B', 4, 1650, 1, 'receiving', 189, '2023-12-31', 0, '{\"price\":\"1650\",\"qty\":\"4\"}', 'Stock from Receiving-31001629\n', '2021-10-14 22:08:45'),
(767, 207, 28, 'V20221', 5, 1550, 1, 'receiving', 189, '2023-03-31', 0, '{\"price\":\"1550\",\"qty\":\"5\"}', 'Stock from Receiving-31001629\n', '2021-10-14 22:08:45'),
(768, 2820, 29, '9009A', 5, 2750, 1, 'receiving', 190, '2023-12-31', 0, '{\"price\":\"2750\",\"qty\":\"5\"}', 'Stock from Receiving-16043188\n', '2021-10-14 22:17:27'),
(769, 827, 28, 'ELR9AC0039', 1, 20000, 1, 'receiving', 190, '2022-10-31', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock from Receiving-16043188\n', '2021-10-14 22:17:27'),
(770, 2821, 29, 'MGF-120A', 5, 7500, 1, 'receiving', 191, '2022-12-31', 0, '{\"price\":\"7500\",\"qty\":\"5\"}', 'Stock from Receiving-91644328\n', '2021-10-14 22:20:37'),
(771, 77, 2, '2106094', 10, 100, 2, 'Sales', 79, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-53270274\n', '2021-10-14 22:25:56'),
(772, 147, 2, 'DY1711', 130, 150, 1, 'receiving', 192, '2022-11-30', 0, '{\"price\":\"150\",\"qty\":\"130\"}', 'Stock from Receiving-11139733\n', '2021-10-14 22:38:41'),
(773, 160, 29, '2639426', 2, 15750, 1, 'receiving', 193, '2022-11-30', 0, '{\"price\":\"15750\",\"qty\":\"2\"}', 'Stock from Receiving-28770026\n', '2021-10-14 23:11:49'),
(774, 657, 29, '2616827', 1, 20000, 1, 'receiving', 193, '2023-03-31', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock from Receiving-28770026\n', '2021-10-14 23:11:49'),
(775, 800, 2, 'BSX0499', 30, 400, 1, 'receiving', 193, '2022-03-31', 0, '{\"price\":\"400\",\"qty\":\"30\"}', 'Stock from Receiving-28770026\n', '2021-10-14 23:11:49'),
(776, 87, 2, '9L104', 480, 55, 1, 'receiving', 193, '2022-11-30', 0, '{\"price\":\"55\",\"qty\":\"480\"}', 'Stock from Receiving-28770026\n', '2021-10-14 23:11:50'),
(777, 17, 2, '85004', 35, 100, 1, 'receiving', 194, '2024-12-31', 0, '{\"price\":\"100\",\"qty\":\"35\"}', 'Stock from Receiving-33329055\n', '2021-10-15 21:22:47'),
(778, 96, 2, '72821', 100, 100, 1, 'receiving', 194, '2022-06-30', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock from Receiving-33329055\n', '2021-10-15 21:22:47'),
(779, 57, 2, 'TEL33', 114, 500, 1, 'receiving', 195, '2022-05-31', 0, '{\"price\":\"500\",\"qty\":\"114\"}', 'Stock from Receiving-33947949\n', '2021-10-15 21:29:45'),
(780, 431, 2, '80096', 140, 100, 1, 'receiving', 195, '2024-01-31', 0, '{\"price\":\"100\",\"qty\":\"140\"}', 'Stock from Receiving-33947949\n', '2021-10-15 21:29:45'),
(781, 10, 2, '80027', 220, 100, 1, 'receiving', 196, '2024-01-31', 0, '{\"price\":\"100\",\"qty\":\"220\"}', 'Stock from Receiving-34285193\n', '2021-10-15 21:39:36'),
(782, 131, 2, 'OLASD20009', 100, 500, 1, 'receiving', 196, '2022-06-30', 0, '{\"price\":\"500\",\"qty\":\"100\"}', 'Stock from Receiving-34285193\n', '2021-10-15 21:39:36'),
(783, 960, 2, 'HTN0150', 40, 250, 1, 'receiving', 196, '2022-03-31', 0, '{\"price\":\"250\",\"qty\":\"40\"}', 'Stock from Receiving-34285193\n', '2021-10-15 21:39:36'),
(784, 959, 2, 'HTN0120-A', 120, 500, 1, 'receiving', 196, '2022-03-31', 0, '{\"price\":\"500\",\"qty\":\"120\"}', 'Stock from Receiving-34285193\n', '2021-10-15 21:39:37'),
(785, 378, 2, '87092', 170, 100, 1, 'receiving', 197, '2025-04-30', 0, '{\"price\":\"100\",\"qty\":\"170\"}', 'Stock from Receiving-41446198\n', '2021-10-15 21:50:12'),
(786, 345, 2, '0004083', 115, 200, 1, 'receiving', 197, '2023-06-30', 0, '{\"price\":\"200\",\"qty\":\"115\"}', 'Stock from Receiving-41446198\n', '2021-10-15 21:50:12'),
(787, 144, 1, 'BRA03076A', 25, 500, 1, 'receiving', 197, '2022-02-28', 0, '{\"price\":\"500\",\"qty\":\"25\"}', 'Stock from Receiving-41446198\n', '2021-10-15 21:55:52'),
(788, 673, 1, 'ME20H17', 30, 500, 1, 'receiving', 198, '2023-07-31', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock from Receiving-09206082\n', '2021-10-15 22:01:27'),
(789, 464, 2, 'E2454E5', 100, 500, 1, 'receiving', 199, '2024-11-30', 0, '{\"price\":\"500\",\"qty\":\"100\"}', 'Stock from Receiving-04933495\n', '2021-10-15 22:09:04'),
(790, 1003, 2, '78273', 1030, 45, 1, 'receiving', 200, '2024-01-31', 0, '{\"price\":\"45\",\"qty\":\"1030\"}', 'Stock from Receiving-19483672\n', '2021-10-15 22:16:00'),
(791, 1197, 1, 'BR0002', 10, 150, 1, 'receiving', 201, '2023-06-30', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock from Receiving-16867352\n', '2021-10-15 22:23:51'),
(792, 1196, 2, 'CA05549', 30, 150, 1, 'receiving', 201, '2023-04-30', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock from Receiving-16867352\n', '2021-10-15 22:23:51'),
(793, 68, 2, '210337', 270, 50, 1, 'receiving', 201, '2026-02-28', 0, '{\"price\":\"50\",\"qty\":\"270\"}', 'Stock from Receiving-16867352\n', '2021-10-15 22:23:52'),
(794, 1032, 1, '417CD02', 80, 500, 1, 'receiving', 202, '2022-09-30', 0, '{\"price\":\"500\",\"qty\":\"80\"}', 'Stock from Receiving-09759700\n', '2021-10-15 22:26:25'),
(795, 1196, 2, 'CA05549', 30, 150, 1, 'receiving', 203, '2023-04-30', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock from Receiving-39955481\n', '2021-10-15 22:28:19'),
(796, 158, 5, 'BSA02010A', 5, 1500, 1, 'receiving', 204, '2022-01-31', 0, '{\"price\":\"1500\",\"qty\":\"5\"}', 'Stock from Receiving-00265216\n', '2021-10-15 22:29:50'),
(797, 67, 5, 'FH901', 79, 1000, 1, 'receiving', 205, '2022-03-31', 0, '{\"price\":\"1000\",\"qty\":\"79\"}', 'Stock from Receiving-87809684\n', '2021-10-15 22:33:34'),
(798, 783, 2, 'B660G001', 237, 200, 1, 'receiving', 206, '2022-11-30', 0, '{\"price\":\"200\",\"qty\":\"237\"}', 'Stock from Receiving-10539596\n', '2021-10-15 22:41:19'),
(799, 821, 2, '81052', 9, 300, 1, 'receiving', 206, '2024-03-31', 0, '{\"price\":\"300\",\"qty\":\"9\"}', 'Stock from Receiving-10539596\n', '2021-10-15 22:41:19'),
(800, 137, 5, 'EP852001', 3, 1350, 1, 'receiving', 206, '2021-12-31', 0, '{\"price\":\"1350\",\"qty\":\"3\"}', 'Stock from Receiving-10539596\n', '2021-10-15 22:41:20'),
(801, 2822, 5, 'F0041', 4, 5000, 1, 'receiving', 207, '2023-01-31', 0, '{\"price\":\"5000\",\"qty\":\"4\"}', 'Stock from Receiving-53771174\n', '2021-10-15 22:46:48'),
(802, 2823, 2, 'EK2009', 7, 15000, 1, 'receiving', 208, '2022-05-31', 0, '{\"price\":\"15000\",\"qty\":\"7\"}', 'Stock from Receiving-83559516\n', '2021-10-17 22:25:48'),
(803, 899, 2, 'EOSGDT001', 19, 10000, 1, 'receiving', 209, '2022-03-31', 0, '{\"price\":\"10000\",\"qty\":\"19\"}', 'Stock from Receiving-39270448\n', '2021-10-17 22:30:22'),
(804, 2824, 2, 'GE12E1001', 25, 2750, 1, 'receiving', 210, '2024-02-29', 0, '{\"price\":\"2750\",\"qty\":\"25\"}', 'Stock from Receiving-26033076\n', '2021-10-17 22:34:07'),
(805, 2824, 2, 'GE12E1001', 98, 2750, 1, 'receiving', 211, '2024-02-29', 0, '{\"price\":\"2750\",\"qty\":\"98\"}', 'Stock from Receiving-06754124\n', '2021-10-17 22:38:32'),
(806, 2825, 1, '00319', 76, 850, 1, 'receiving', 212, '2022-08-31', 0, '{\"price\":\"850\",\"qty\":\"76\"}', 'Stock from Receiving-26452068\n', '2021-10-17 22:46:32'),
(807, 656, 1, '1902111', 30, 850, 1, 'receiving', 212, '2022-02-28', 0, '{\"price\":\"850\",\"qty\":\"30\"}', 'Stock from Receiving-26452068\n', '2021-10-17 22:46:32'),
(808, 2500, 2, 'G00LQU', 90, 60, 1, 'receiving', 213, '2022-04-30', 0, '{\"price\":\"60\",\"qty\":\"90\"}', 'Stock from Receiving-36832629\n', '2021-10-17 22:51:12'),
(809, 801, 2, 'G00TMW', 90, 100, 1, 'receiving', 213, '2022-07-31', 0, '{\"price\":\"100\",\"qty\":\"90\"}', 'Stock from Receiving-36832629\n', '2021-10-17 22:51:12'),
(810, 2501, 2, 'G00LR6', 90, 170, 1, 'receiving', 213, '2022-03-31', 0, '{\"price\":\"170\",\"qty\":\"90\"}', 'Stock from Receiving-36832629\n', '2021-10-17 22:51:13'),
(811, 1012, 28, 'IPMDA2014', 9, 4500, 1, 'receiving', 214, '2022-09-30', 0, '{\"price\":\"4500\",\"qty\":\"9\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:38'),
(812, 863, 2, 'T-21549', 100, 500, 1, 'receiving', 214, '2022-01-31', 0, '{\"price\":\"500\",\"qty\":\"100\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:38'),
(813, 768, 2, 'ZD20873', 50, 400, 1, 'receiving', 214, '2022-07-31', 0, '{\"price\":\"400\",\"qty\":\"50\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:38'),
(814, 1265, 2, '04876', 84, 200, 1, 'receiving', 214, '2022-08-31', 0, '{\"price\":\"200\",\"qty\":\"84\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:38'),
(815, 243, 31, '1897', 3, 1500, 1, 'receiving', 214, '2024-05-31', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:39'),
(816, 1010, 29, '32', 11, 4500, 1, 'receiving', 214, '2021-12-31', 0, '{\"price\":\"4500\",\"qty\":\"11\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:39'),
(817, 2475, 285, 'SA03637', 2, 3000, 1, 'receiving', 214, '2022-09-30', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock from Receiving-11350412\n', '2021-10-17 23:17:39'),
(818, 2826, 2, 'BSX1507A', 8, 5600, 1, 'receiving', 215, '2022-09-30', 0, '{\"price\":\"5600\",\"qty\":\"8\"}', 'Stock from Receiving-00255167\n', '2021-10-17 23:38:40'),
(819, 2832, 29, '80620', 1, 5760, 1, 'receiving', 215, '2022-07-31', 0, '{\"price\":\"5760\",\"qty\":\"1\"}', 'Stock from Receiving-00255167\n', '2021-10-17 23:38:40'),
(820, 2830, 10, '2050590', 1, 25000, 1, 'receiving', 215, '2023-02-28', 0, '{\"price\":\"25000\",\"qty\":\"1\"}', 'Stock from Receiving-00255167\n', '2021-10-17 23:38:40'),
(821, 2829, 10, '328', 7, 7500, 1, 'receiving', 215, '2030-02-02', 0, '{\"price\":\"7500\",\"qty\":\"7\"}', 'Stock from Receiving-00255167\n', '2021-10-17 23:38:40'),
(822, 2827, 11, '026783', 2, 25000, 1, 'receiving', 215, '2022-09-30', 0, '{\"price\":\"25000\",\"qty\":\"2\"}', 'Stock from Receiving-00255167\n', '2021-10-17 23:38:41'),
(824, 69, 2, 'UM1010', 15, 250, 2, 'Sales', 81, '0000-00-00', 0, '{\"price\":\"250\",\"qty\":\"15\"}', 'Stock out from Sales-95751407\n', '2021-10-22 21:27:42'),
(825, 2697, 1, '1288', 5, 2200, 1, 'receiving', 216, '2022-05-30', 0, '{\"price\":\"2200\",\"qty\":\"5\"}', 'Stock from Receiving-01015505\n', '2021-10-22 21:31:36'),
(826, 2667, 274, 'AR21024', 16, 0, 1, 'reconciliation', 8, '0000-00-00', 0, '{\"price\":\"\",\"qty\":16}', 'Stock from Reconciliation', '2021-10-23 19:59:44'),
(829, 788, 2, 'LET120604D', 5, 2000, 2, 'Sales', 84, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-88660180\n', '2021-10-26 17:26:30'),
(830, 2773, 2, 'KA03237', 1, 3000, 2, 'Sales', 85, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-18095789\n', '2021-10-26 17:54:16'),
(831, 919, 1, 'PW1917TA', 0, 0, 3, 'expire', 7, '2022-01-08', 1, '{\"batch_no\":\"PW1917TA\",\"qty\":\"0\"}', 'Stock from Expiring-7', '2021-10-26 21:14:28'),
(832, 1300, 1, '24709', 60, 0, 3, 'expire', 8, '2022-01-07', 1, '{\"batch_no\":\"24709\",\"qty\":\"60\"}', 'Stock from Expiring-8', '2021-10-26 21:15:18'),
(833, 919, 1, 'PW1917TA', 0, 0, 3, 'expire', 9, '2022-01-08', 1, '{\"batch_no\":\"PW1917TA\",\"qty\":\"0\"}', 'Stock from Expiring-9', '2021-10-26 21:19:20'),
(834, 2787, 287, 'MP19448', 0, 0, 3, 'expire', 10, '2021-10-31', 1, '{\"batch_no\":\"MP19448\",\"qty\":\"0\"}', 'Stock from Expiring-10', '2021-10-26 21:28:52'),
(835, 2482, 2, 'ESL139011', 0, 0, 3, 'expire', 11, '2021-10-31', 1, '{\"batch_no\":\"ESL139011\",\"qty\":\"0\"}', 'Stock from Expiring-11', '2021-10-26 21:29:15'),
(836, 2838, 18, '0000', 3, 7000, 1, 'receiving', 217, '2023-12-31', 0, '{\"price\":\"7000\",\"qty\":\"3\"}', 'Stock from Receiving-65278633\n', '2021-10-26 23:14:57'),
(837, 2833, 30, '20210501', 9, 2000, 1, 'receiving', 217, '2023-05-01', 0, '{\"price\":\"2000\",\"qty\":\"9\"}', 'Stock from Receiving-65278633\n', '2021-10-26 23:14:57'),
(838, 2836, 289, '0000', 11, 3500, 1, 'receiving', 217, '2023-10-03', 0, '{\"price\":\"3500\",\"qty\":\"11\"}', 'Stock from Receiving-65278633\n', '2021-10-26 23:14:58'),
(839, 2837, 18, '0000', 6, 15000, 1, 'receiving', 217, '2023-10-31', 0, '{\"price\":\"15000\",\"qty\":\"6\"}', 'Stock from Receiving-65278633\n', '2021-10-26 23:14:58'),
(840, 2835, 18, '0000', 22, 1500, 1, 'receiving', 218, '2023-12-25', 0, '{\"price\":\"1500\",\"qty\":\"22\"}', 'Stock from Receiving-02163948\n', '2021-10-26 23:24:47'),
(841, 2842, 11, '0000', 5, 3000, 1, 'receiving', 219, '2025-12-31', 0, '{\"price\":\"3000\",\"qty\":\"5\"}', 'Stock from Receiving-30410893\n', '2021-10-26 23:46:49'),
(842, 2841, 10, 'BSKZ756', 5, 3500, 1, 'receiving', 220, '2023-02-20', 0, '{\"price\":\"3500\",\"qty\":\"5\"}', 'Stock from Receiving-72567547\n', '2021-10-26 23:51:49'),
(843, 2840, 16, '19K13281', 2, 18000, 1, 'receiving', 221, '2022-10-29', 0, '{\"price\":\"18000\",\"qty\":\"2\"}', 'Stock from Receiving-43328805\n', '2021-10-26 23:55:36'),
(844, 2839, 10, 'DL9T', 2, 7000, 1, 'receiving', 222, '2022-08-30', 0, '{\"price\":\"7000\",\"qty\":\"2\"}', 'Stock from Receiving-34558316\n', '2021-10-26 23:57:54'),
(845, 2844, 206, 'FSL-001', 5, 7000, 1, 'receiving', 223, '2023-09-30', 0, '{\"price\":\"7000\",\"qty\":\"5\"}', 'Stock from Receiving-99277485\n', '2021-10-27 00:06:04'),
(846, 2845, 1, '1E12B2', 4, 13000, 1, 'receiving', 224, '2023-11-05', 0, '{\"price\":\"13000\",\"qty\":\"4\"}', 'Stock from Receiving-47922266\n', '2021-10-27 00:19:49'),
(847, 2846, 18, 'LK-87', 3, 15000, 1, 'receiving', 224, '2028-11-30', 0, '{\"price\":\"15000\",\"qty\":\"3\"}', 'Stock from Receiving-47922266\n', '2021-10-27 00:19:49'),
(848, 2847, 115, 'KX220001A', 24, 300, 1, 'receiving', 224, '2021-12-31', 0, '{\"price\":\"300\",\"qty\":\"24\"}', 'Stock from Receiving-47922266\n', '2021-10-27 00:19:50'),
(849, 2739, 18, '152104', 1, 2000, 2, 'Sales', 86, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-58961842\n', '2021-10-27 07:18:34'),
(850, 2739, 18, '152104', 1, 2000, 2, 'Sales', 87, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-32426895\n', '2021-10-27 08:19:51'),
(851, 1239, 2, '1950438', 10, 1000, 2, 'Sales', 88, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-31468259\n', '2021-10-27 09:30:16'),
(852, 1239, 2, '1950438', 10, 1000, 2, 'Sales', 89, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-63619271\n', '2021-10-27 09:58:17'),
(853, 109, 2, 'T022801', 2, 2000, 2, 'Sales', 90, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-53684320\n', '2021-10-27 10:20:03'),
(854, 87, 2, '9L104', 60, 150, 2, 'Sales', 91, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"60\"}', 'Stock out from Sales-81105507\n', '2021-10-27 10:22:34'),
(855, 1386, 30, 'TTF8015E', 1, 3500, 2, 'Sales', 92, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-12496899\n', '2021-10-27 10:27:42'),
(856, 2644, 288, 'CN1019', 1, 2000, 2, 'Sales', 93, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-51795814\n', '2021-10-27 10:30:03'),
(857, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 94, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-47505480\n', '2021-10-27 10:31:12'),
(858, 990, 2, 'PSM20131-40A', 10, 400, 2, 'Sales', 95, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-77294606\n', '2021-10-27 10:32:04'),
(859, 2713, 2, '210611', 20, 50, 2, 'Sales', 96, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-48434031\n', '2021-10-27 11:40:45'),
(860, 561, 290, '200707', 1, 10000, 2, 'Sales', 97, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-80552730\n', '2021-10-27 11:43:23'),
(861, 285, 2, '2105071', 12, 750, 2, 'Sales', 98, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-22032535\n', '2021-10-27 12:25:19'),
(862, 285, 2, '2105071', 6, 750, 2, 'Sales', 99, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-94018468\n', '2021-10-27 12:52:03'),
(863, 2713, 2, '210611', 20, 50, 2, 'Sales', 100, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-91267070\n', '2021-10-27 12:53:55'),
(864, 2442, 2, '1C38', 10, 100, 2, 'Sales', 101, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-77780079\n', '2021-10-27 13:00:31'),
(865, 723, 2, '210735', 3, 300, 2, 'Sales', 102, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"3\"}', 'Stock out from Sales-90541839\n', '2021-10-27 13:51:13'),
(866, 290, 288, 'AL1008', 1, 5000, 2, 'Sales', 103, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-30167595\n', '2021-10-27 14:46:32'),
(867, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 104, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-23331554\n', '2021-10-27 14:50:05'),
(868, 2641, 11, '10210141', 1, 5000, 2, 'Sales', 105, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-02960412\n', '2021-10-27 14:51:02'),
(869, 2641, 11, '10210141', 1, 5000, 2, 'Sales', 106, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-80970547\n', '2021-10-27 14:51:07'),
(870, 253, 275, 'PA0789K', 1, 3000, 2, 'Sales', 107, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-40426392\n', '2021-10-27 15:18:50'),
(871, 253, 275, '', 1, 3000, 2, 'Sales', 108, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-63327118\n', '2021-10-27 15:19:47'),
(872, 2713, 2, '210611', 20, 50, 2, 'Sales', 109, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-66632165\n', '2021-10-27 15:22:00'),
(873, 1327, 282, 'B1002', 3, 4600, 1, 'receiving', 225, '2023-02-11', 0, '{\"price\":\"4600\",\"qty\":\"3\"}', 'Stock from Receiving-55273629\n', '2021-10-27 15:28:03'),
(874, 2590, 27, 'MNC211', 90, 150, 1, 'receiving', 226, '2022-02-07', 0, '{\"price\":\"150\",\"qty\":\"90\"}', 'Stock from Receiving-78072343\n', '2021-10-27 15:34:43'),
(875, 87, 2, '95593', 500, 83.5, 1, 'receiving', 227, '2026-06-30', 0, '{\"price\":\"83.5\",\"qty\":\"500\"}', 'Stock from Receiving-19740791\n', '2021-10-27 15:39:20'),
(876, 2770, 2, '13520', 3, 4650, 1, 'receiving', 228, '2023-02-28', 0, '{\"price\":\"4650\",\"qty\":\"3\"}', 'Stock from Receiving-64383058\n', '2021-10-27 15:43:20'),
(877, 1205, 28, 'TRIAVA008', 10, 2999, 1, 'receiving', 229, '2025-03-13', 0, '{\"price\":\"2999\",\"qty\":\"10\"}', 'Stock from Receiving-54403173\n', '2021-10-27 15:47:39'),
(878, 2497, 11, '21097', 10, 1080, 1, 'receiving', 230, '2023-08-23', 0, '{\"price\":\"1080\",\"qty\":\"10\"}', 'Stock from Receiving-25089229\n', '2021-10-27 15:53:09'),
(879, 2420, 11, '68G00620', 5, 1250, 1, 'receiving', 231, '2023-06-30', 0, '{\"price\":\"1250\",\"qty\":\"5\"}', 'Stock from Receiving-16202285\n', '2021-10-27 15:58:12'),
(880, 74, 2, '1950392', 20, 883, 1, 'receiving', 232, '2024-05-31', 0, '{\"price\":\"883\",\"qty\":\"20\"}', 'Stock from Receiving-02340257\n', '2021-10-27 16:05:00'),
(881, 75, 2, '1950539', 10, 1500, 1, 'receiving', 233, '2022-04-30', 0, '{\"price\":\"1500\",\"qty\":\"10\"}', 'Stock from Receiving-04916038\n', '2021-10-27 16:06:13'),
(882, 2697, 1, '2101089', 60, 110, 1, 'receiving', 234, '2023-12-27', 0, '{\"price\":\"110\",\"qty\":\"60\"}', 'Stock from Receiving-48165797\n', '2021-10-27 16:12:12'),
(883, 113, 11, 'E105', 5, 950, 1, 'receiving', 235, '2024-04-27', 0, '{\"price\":\"950\",\"qty\":\"5\"}', 'Stock from Receiving-75931283\n', '2021-10-27 16:13:56'),
(884, 192, 11, 'E110', 5, 700, 1, 'receiving', 236, '2024-04-27', 0, '{\"price\":\"700\",\"qty\":\"5\"}', 'Stock from Receiving-91069506\n', '2021-10-27 16:15:18'),
(885, 773, 11, '10210071', 2, 7700, 1, 'receiving', 237, '2022-12-31', 0, '{\"price\":\"7700\",\"qty\":\"2\"}', 'Stock from Receiving-94334528\n', '2021-10-27 16:17:36'),
(886, 2717, 0, '32092527', 100, 170, 1, 'receiving', 238, '2026-04-30', 0, '{\"price\":\"170\",\"qty\":\"100\"}', 'Stock from Receiving-36054291\n', '2021-10-27 16:22:12'),
(887, 424, 10, 'C135', 1, 2000, 2, 'Sales', 110, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-49235945\n', '2021-10-27 16:51:18'),
(888, 424, 10, 'C135', 1, 2000, 2, 'Sales', 111, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-13669268\n', '2021-10-27 16:51:28'),
(889, 467, 2, 'BGB5G002', 10, 300, 2, 'Sales', 113, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-17571168\n', '2021-10-27 17:23:20'),
(890, 467, 2, 'BGB5G002', 10, 300, 2, 'Sales', 114, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-23076139\n', '2021-10-27 17:23:31'),
(891, 2644, 11, '', 1, 2000, 2, 'Sales', 115, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-61799446\n', '2021-10-27 18:24:24'),
(892, 2795, 288, 'C4561008', 1, 4000, 2, 'Sales', 116, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-74142268\n', '2021-10-27 18:27:35'),
(893, 2795, 288, '', 1, 4000, 2, 'Sales', 117, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-81669089\n', '2021-10-27 18:27:39'),
(894, 65, 287, '2103041', 1, 4000, 2, 'Sales', 118, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-17071958\n', '2021-10-27 18:29:07'),
(895, 65, 287, '2103041', 1, 4000, 2, 'Sales', 119, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-32126508\n', '2021-10-27 18:29:12'),
(896, 2694, 115, 'W3782', 3, 600, 2, 'Sales', 120, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-78272987\n', '2021-10-27 18:30:11'),
(897, 2694, 115, 'W3782', 3, 600, 2, 'Sales', 121, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-59106318\n', '2021-10-27 18:30:16'),
(898, 2436, 11, '58F02320', 1, 5000, 2, 'Sales', 122, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-35014675\n', '2021-10-27 18:37:04'),
(899, 1106, 281, '36175', 1, 10000, 2, 'Sales', 123, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-32979633\n', '2021-10-27 18:39:51'),
(900, 113, 287, 'E105', 1, 2000, 2, 'Sales', 124, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-00000000\n', '2021-10-27 19:22:02'),
(901, 2684, 30, '0000-00', 4, 1500, 1, 'receiving', 239, '2022-08-31', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock from Receiving-98847954\n', '2021-10-27 19:26:00'),
(902, 2684, 30, '0000-00', 2, 3000, 2, 'Sales', 125, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock out from Sales-23601872\n', '2021-10-27 19:26:38'),
(903, 2628, 11, '519Y1', 5, 5500, 1, 'receiving', 240, '2023-06-01', 0, '{\"price\":\"5500\",\"qty\":\"5\"}', 'Stock from Receiving-89993598\n', '2021-10-27 19:32:24'),
(904, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 126, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-94668236\n', '2021-10-27 19:34:09'),
(905, 192, 287, '(10) E110', 7, 700, 1, 'receiving', 241, '2024-04-30', 0, '{\"price\":\"700\",\"qty\":\"7\"}', 'Stock from Receiving-72953313\n', '2021-10-27 19:42:12'),
(906, 192, 287, 'E110', 1, 2000, 2, 'Sales', 127, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-42865362\n', '2021-10-27 19:43:55'),
(907, 889, 2, 'PM620021', 1055, 35, 1, 'receiving', 242, '2023-10-27', 0, '{\"price\":\"35\",\"qty\":\"1055\"}', 'Stock from Receiving-54685983\n', '2021-10-27 19:49:55'),
(908, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 128, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-99761861\n', '2021-10-27 19:52:30'),
(909, 2660, 11, '081E040', 3, 2250, 1, 'receiving', 243, '2022-07-31', 0, '{\"price\":\"2250\",\"qty\":\"3\"}', 'Stock from Receiving-30110381\n', '2021-10-27 19:58:40'),
(910, 2468, 2, 'BCSH20004', 30, 420, 1, 'receiving', 244, '2023-02-27', 0, '{\"price\":\"420\",\"qty\":\"30\"}', 'Stock from Receiving-33884445\n', '2021-10-27 20:08:14'),
(911, 2468, 2, 'BCSH20004', 10, 800, 2, 'Sales', 129, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"10\"}', 'Stock out from Sales-25871066\n', '2021-10-27 20:09:11'),
(912, 2644, 288, '21014', 8, 1100, 1, 'receiving', 245, '2024-02-29', 0, '{\"price\":\"1100\",\"qty\":\"8\"}', 'Stock from Receiving-13976851\n', '2021-10-27 20:25:45'),
(913, 2644, 0, '21014', 1, 2000, 2, 'Sales', 130, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-32093465\n', '2021-10-27 20:26:23'),
(914, 486, 11, '1A68', 7, 950, 1, 'receiving', 246, '2022-12-31', 0, '{\"price\":\"950\",\"qty\":\"7\"}', 'Stock from Receiving-47327895\n', '2021-10-27 20:33:29'),
(915, 2789, 11, '1A68A', 1, 2000, 2, 'Sales', 131, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-95713631\n', '2021-10-27 20:34:37'),
(916, 11, 1, '1E19', 570, 40, 1, 'receiving', 247, '2024-04-30', 0, '{\"price\":\"40\",\"qty\":\"570\"}', 'Stock from Receiving-62326296\n', '2021-10-27 20:45:25'),
(917, 11, 1, '1E19', 5, 100, 2, 'Sales', 132, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-64989676\n', '2021-10-27 20:46:59'),
(918, 993, 2, 'Y0B3UL', 10, 150, 2, 'Sales', 133, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-13244517\n', '2021-10-27 20:52:05'),
(919, 2848, 281, 'RK02721222 17', 17, 2500, 1, 'receiving', 248, '2022-07-27', 0, '{\"price\":\"2500\",\"qty\":\"17\"}', 'Stock from Receiving-92815120\n', '2021-10-27 21:01:13'),
(920, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 134, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-92180059\n', '2021-10-27 21:02:28'),
(921, 2502, 2, '1902061', 4, 200, 2, 'Sales', 135, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"4\"}', 'Stock out from Sales-85413221\n', '2021-10-27 21:03:43'),
(922, 2519, 1, '1C14B1', 15, 500, 2, 'Sales', 136, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"15\"}', 'Stock out from Sales-20631743\n', '2021-10-27 21:06:28'),
(923, 1313, 2, '14902300', 15, 1000, 2, 'Sales', 137, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock out from Sales-89453571\n', '2021-10-27 21:08:41'),
(924, 301, 28, '202011109', 1, 750, 1, 'receiving', 249, '2023-10-27', 0, '{\"price\":\"750\",\"qty\":\"1\"}', 'Stock from Receiving-25994251\n', '2021-10-27 21:19:28'),
(925, 301, 28, '20201109', 1, 2000, 2, 'Sales', 138, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-21435335\n', '2021-10-27 21:20:19'),
(926, 2802, 1, 'SC1025', 15, 200, 2, 'Sales', 139, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-60090220\n', '2021-10-27 21:21:42'),
(927, 77, 2, '2106094', 5, 100, 2, 'Sales', 140, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-00336917\n', '2021-10-27 21:22:50'),
(928, 27, 284, 'T004590', 4, 11000, 1, 'receiving', 250, '2023-01-31', 0, '{\"price\":\"11000\",\"qty\":\"4\"}', 'Stock from Receiving-79185372\n', '2021-10-27 21:30:56'),
(929, 27, 284, 'T004590', 1, 17000, 2, 'Sales', 141, '0000-00-00', 0, '{\"price\":\"17000\",\"qty\":\"1\"}', 'Stock out from Sales-64307377\n', '2021-10-27 21:32:12'),
(930, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 142, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-18792499\n', '2021-10-27 21:33:58'),
(931, 968, 27, '2011045', 1, 500, 2, 'Sales', 143, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-20945536\n', '2021-10-27 21:35:10'),
(932, 1502, 11, 'P21012802', 1, 8000, 2, 'Sales', 144, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-02138321\n', '2021-10-27 21:36:20'),
(933, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 145, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-41569202\n', '2021-10-27 21:37:18'),
(934, 2692, 115, '1871002', 10, 1000, 2, 'Sales', 146, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-82790638\n', '2021-10-27 21:38:51'),
(935, 41, 1, '44420063', 15, 500, 2, 'Sales', 147, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"15\"}', 'Stock out from Sales-58870389\n', '2021-10-27 22:06:04'),
(936, 962, 1, 'OP20029', 10, 100, 2, 'Sales', 148, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-58647493\n', '2021-10-27 22:11:55'),
(937, 2711, 2, '2007111', 10, 150, 2, 'Sales', 149, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-87381931\n', '2021-10-27 22:26:29'),
(938, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 150, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-78195569\n', '2021-10-27 22:30:52'),
(939, 486, 11, '1A68', 1, 2000, 2, 'Sales', 151, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-87492023\n', '2021-10-27 22:35:03'),
(940, 1029, 2, '211056', 20, 100, 2, 'Sales', 152, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-68268235\n', '2021-10-27 22:37:26'),
(941, 2634, 11, '2008221', 1, 3500, 2, 'Sales', 153, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-87220196\n', '2021-10-27 22:49:23'),
(942, 2653, 284, 'CX113', 4, 1750, 1, 'receiving', 251, '2024-04-30', 0, '{\"price\":\"1750\",\"qty\":\"4\"}', 'Stock from Receiving-95025161\n', '2021-10-27 23:29:20'),
(943, 2849, 18, '21289', 10, 500, 1, 'receiving', 252, '2023-02-09', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock from Receiving-36638388\n', '2021-10-27 23:31:52'),
(944, 2850, 2, 'SR1013', 550, 20, 1, 'receiving', 253, '2024-05-31', 0, '{\"price\":\"20\",\"qty\":\"550\"}', 'Stock from Receiving-66087727\n', '2021-10-27 23:38:41'),
(945, 2852, 18, '2001721616', 9, 1500, 1, 'receiving', 254, '2024-12-31', 0, '{\"price\":\"1500\",\"qty\":\"9\"}', 'Stock from Receiving-83189913\n', '2021-10-27 23:44:04'),
(946, 2851, 18, '00-000', 1, 450, 1, 'receiving', 255, '2023-11-28', 0, '{\"price\":\"450\",\"qty\":\"1\"}', 'Stock from Receiving-63464419\n', '2021-10-27 23:44:54'),
(947, 2653, 284, 'CX113', 1, 3500, 2, 'Sales', 154, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-31121236\n', '2021-10-27 23:49:18'),
(948, 2849, 18, '21289', 3, 1000, 2, 'Sales', 155, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-95251255\n', '2021-10-27 23:50:16'),
(949, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 156, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-28759961\n', '2021-10-27 23:52:25'),
(950, 2851, 18, '', 1, 1000, 2, 'Sales', 157, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-51715857\n', '2021-10-27 23:53:05'),
(951, 2852, 18, '2001721616', 1, 3500, 2, 'Sales', 158, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-58301330\n', '2021-10-27 23:53:43'),
(952, 1318, 30, '09-00', 2, 12500, 1, 'receiving', 256, '2024-11-29', 0, '{\"price\":\"12500\",\"qty\":\"2\"}', 'Stock from Receiving-12806431\n', '2021-10-28 00:01:08'),
(953, 1318, 30, '09-00', 1, 16000, 2, 'Sales', 159, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-49389499\n', '2021-10-28 06:24:42'),
(954, 2644, 288, '21014', 1, 2000, 2, 'Sales', 160, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-59092589\n', '2021-10-28 06:26:55'),
(955, 285, 2, '2105071', 6, 750, 2, 'Sales', 161, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-18614099\n', '2021-10-28 06:36:04'),
(956, 428, 2, 'TP0076', 5, 100, 2, 'Sales', 162, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-09441940\n', '2021-10-28 06:37:16'),
(957, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 163, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-67088630\n', '2021-10-28 06:44:58'),
(958, 2835, 18, '0000', 1, 3000, 2, 'Sales', 164, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-78184641\n', '2021-10-28 08:15:33'),
(959, 442, 2, 'T0100', 10, 200, 2, 'Sales', 165, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-10252343\n', '2021-10-28 08:27:09');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(960, 1502, 11, 'P21012802', 1, 8000, 2, 'Sales', 166, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-05168120\n', '2021-10-28 08:29:02'),
(961, 2805, 2, 'T1040004TA', 7, 1000, 2, 'Sales', 167, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock out from Sales-59569025\n', '2021-10-28 08:56:49'),
(962, 2618, 11, 'SE914', 0, 0, 3, 'expire', 12, '2021-11-30', 1, '{\"batch_no\":\"SE914\",\"qty\":\"0\"}', 'Stock from Expiring-12', '2021-10-28 12:16:44'),
(963, 137, 5, 'EP852001', 0, 0, 3, 'expire', 13, '2021-12-31', 1, '{\"batch_no\":\"EP852001\",\"qty\":\"0\"}', 'Stock from Expiring-13', '2021-10-28 12:17:00'),
(964, 1, 2, '2103004', 1, 2000, 2, 'Sales', 168, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-28622746\n', '2021-10-28 13:30:31'),
(965, 65, 287, '', 1, 4000, 2, 'Sales', 169, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-85198159\n', '2021-10-28 13:31:22'),
(966, 2694, 115, 'W3782', 3, 600, 2, 'Sales', 170, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-83951040\n', '2021-10-28 13:32:18'),
(967, 375, 2, 'CA2520003-A', 10, 200, 2, 'Sales', 171, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-58212878\n', '2021-10-28 13:33:06'),
(968, 857, 2, '210270', 10, 100, 2, 'Sales', 172, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-23546937\n', '2021-10-28 13:34:27'),
(969, 94, 2, 'AB52892', 10, 400, 2, 'Sales', 173, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-64720564\n', '2021-10-28 13:37:02'),
(970, 949, 2, 'EW199006', 20, 200, 2, 'Sales', 174, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-52036927\n', '2021-10-28 13:37:55'),
(971, 6, 2, '2107042', 30, 320, 1, 'receiving', 257, '2025-06-28', 0, '{\"price\":\"320\",\"qty\":\"30\"}', 'Stock from Receiving-06963464\n', '2021-10-28 13:45:33'),
(972, 6, 2, '2107042', 1, 1000, 2, 'Sales', 175, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-87256095\n', '2021-10-28 13:46:35'),
(973, 2720, 2, 'PX001', 10, 50, 2, 'Sales', 176, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-00094198\n', '2021-10-28 13:47:48'),
(974, 2781, 1, 'MP19525', 5, 200, 2, 'Sales', 177, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-69106333\n', '2021-10-28 13:49:54'),
(975, 1454, 11, '00000', 1, 2000, 2, 'Sales', 178, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-09956864\n', '2021-10-28 13:50:33'),
(976, 98, 284, 'O2112905', 1, 7000, 2, 'Sales', 179, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-36552216\n', '2021-10-28 13:51:25'),
(977, 18, 283, '21095', 1, 970, 1, 'receiving', 258, '2024-05-28', 0, '{\"price\":\"970\",\"qty\":\"1\"}', 'Stock from Receiving-71234479\n', '2021-10-28 13:58:45'),
(978, 18, 286, '', 1, 2000, 2, 'Sales', 180, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-52198179\n', '2021-10-28 14:05:04'),
(979, 2436, 11, '58F02320', 1, 5000, 2, 'Sales', 181, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-50046970\n', '2021-10-28 14:05:49'),
(980, 1029, 2, '211056', 10, 100, 2, 'Sales', 182, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-57092078\n', '2021-10-28 14:06:53'),
(981, 117, 2, 'SKY0180', 5, 400, 2, 'Sales', 183, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-51974011\n', '2021-10-28 14:08:03'),
(982, 2805, 2, 'T1040004TA', 7, 1000, 2, 'Sales', 184, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock out from Sales-36881474\n', '2021-10-28 14:10:15'),
(983, 131, 2, 'OLASD20009', 60, 1000, 2, 'Sales', 185, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"60\"}', 'Stock out from Sales-21257794\n', '2021-10-28 14:11:31'),
(984, 2853, 11, '91357774', 2, 8000, 1, 'receiving', 259, '2024-04-28', 0, '{\"price\":\"8000\",\"qty\":\"2\"}', 'Stock from Receiving-52270764\n', '2021-10-28 14:28:22'),
(985, 2853, 11, '91357774', 1, 10000, 2, 'Sales', 186, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-50991675\n', '2021-10-28 14:30:47'),
(986, 700, 2, '1B30', 30, 400, 2, 'Sales', 187, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"30\"}', 'Stock out from Sales-70971523\n', '2021-10-28 14:31:40'),
(987, 2751, 282, '200530', 2, 1000, 2, 'Sales', 188, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-40342836\n', '2021-10-28 14:33:56'),
(988, 1412, 30, '052021SZ100', 1, 1500, 2, 'Sales', 189, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-72473110\n', '2021-10-28 14:35:02'),
(989, 2622, 11, 'PZF21008', 1, 3000, 2, 'Sales', 190, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-10582029\n', '2021-10-28 14:36:56'),
(990, 1, 2, '2103004', 1, 2000, 2, 'Sales', 191, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-00074326\n', '2021-10-28 14:38:15'),
(991, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 192, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-94298245\n', '2021-10-28 14:39:46'),
(992, 2802, 1, 'SC1025', 15, 200, 2, 'Sales', 193, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-80640272\n', '2021-10-28 15:19:11'),
(993, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 194, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-45769486\n', '2021-10-28 15:20:24'),
(994, 2488, 10, 'BE20137', 1, 4000, 2, 'Sales', 195, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-95894228\n', '2021-10-28 15:21:10'),
(995, 1461, 43, '', 1, 3000, 2, 'Sales', 196, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-54962058\n', '2021-10-28 15:55:49'),
(996, 730, 288, 'LK1008', 1, 3500, 2, 'Sales', 197, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-83630083\n', '2021-10-28 15:56:32'),
(997, 1029, 2, '211056', 10, 100, 2, 'Sales', 198, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-71933801\n', '2021-10-28 15:57:22'),
(998, 1516, 11, '0011108', 1, 3500, 1, 'receiving', 260, '2023-05-28', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-90411334\n', '2021-10-28 17:03:33'),
(999, 1516, 11, '', 1, 5000, 2, 'Sales', 199, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-42419900\n', '2021-10-28 17:04:16'),
(1000, 2698, 11, '20200208', 1, 1000, 2, 'Sales', 200, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-59672154\n', '2021-10-28 17:05:11'),
(1001, 821, 2, '89365', 60, 280, 1, 'receiving', 261, '2025-08-28', 0, '{\"price\":\"280\",\"qty\":\"60\"}', 'Stock from Receiving-30330989\n', '2021-10-28 17:08:42'),
(1002, 821, 2, '89365', 60, 600, 2, 'Sales', 201, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"60\"}', 'Stock out from Sales-81617298\n', '2021-10-28 17:10:57'),
(1003, 1012, 28, 'IPMDA2014', 1, 8000, 2, 'Sales', 202, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-38272868\n', '2021-10-28 17:12:48'),
(1004, 192, 287, 'E110', 1, 2000, 2, 'Sales', 203, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-96760880\n', '2021-10-28 17:13:43'),
(1005, 2773, 2, 'KA03237', 1, 3000, 2, 'Sales', 204, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-75743133\n', '2021-10-28 17:14:28'),
(1006, 2637, 11, '2012002', 1, 3000, 2, 'Sales', 205, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-21730833\n', '2021-10-28 17:16:07'),
(1007, 2854, 35, '15516100', 90, 400, 1, 'receiving', 262, '2024-01-28', 0, '{\"price\":\"400\",\"qty\":\"90\"}', 'Stock from Receiving-85746586\n', '2021-10-28 17:32:40'),
(1008, 2854, 35, '15516100', 15, 1000, 2, 'Sales', 206, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock out from Sales-30323732\n', '2021-10-28 17:33:37'),
(1009, 2488, 10, 'BE20137', 1, 4000, 2, 'Sales', 207, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-66024262\n', '2021-10-28 17:36:10'),
(1010, 1424, 11, '0061002', 1, 13000, 2, 'Sales', 208, '0000-00-00', 0, '{\"price\":\"13000\",\"qty\":\"1\"}', 'Stock out from Sales-88952716\n', '2021-10-28 18:32:08'),
(1011, 1497, 11, '83220495', 3, 3500, 1, 'receiving', 263, '2022-10-28', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-22038542\n', '2021-10-28 19:01:56'),
(1012, 1497, 11, '83220495', 1, 5000, 2, 'Sales', 209, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-67304486\n', '2021-10-28 19:03:03'),
(1013, 2711, 2, '2007111', 10, 150, 2, 'Sales', 210, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-75982696\n', '2021-10-28 19:03:45'),
(1014, 1558, 282, 'L-357 J', 6, 1000, 1, 'receiving', 264, '2023-12-28', 0, '{\"price\":\"1000\",\"qty\":\"6\"}', 'Stock from Receiving-72044366\n', '2021-10-28 19:23:12'),
(1015, 1558, 282, 'L-357 J', 1, 1500, 2, 'Sales', 211, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-18766636\n', '2021-10-28 19:25:18'),
(1016, 2855, 11, 'CRJAY01', 5, 2200, 1, 'receiving', 265, '2022-07-28', 0, '{\"price\":\"2200\",\"qty\":\"5\"}', 'Stock from Receiving-80501971\n', '2021-10-28 19:37:36'),
(1017, 2855, 11, 'CRJAY01', 1, 5000, 2, 'Sales', 214, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-73840568\n', '2021-10-28 19:38:48'),
(1018, 1388, 30, '1EB36E', 8, 2200, 1, 'receiving', 266, '2023-12-28', 0, '{\"price\":\"2200\",\"qty\":\"8\"}', 'Stock from Receiving-25270879\n', '2021-10-28 19:46:38'),
(1019, 1388, 30, '1EB36E', 1, 4000, 2, 'Sales', 215, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-40878287\n', '2021-10-28 19:47:21'),
(1020, 2849, 18, '21289', 1, 1000, 2, 'Sales', 216, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-68148655\n', '2021-10-28 19:48:07'),
(1021, 285, 2, '2105071', 12, 750, 2, 'Sales', 217, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-08696667\n', '2021-10-28 19:49:00'),
(1022, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 218, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-45599002\n', '2021-10-28 19:49:49'),
(1023, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 219, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-94308254\n', '2021-10-28 19:50:21'),
(1024, 2805, 0, 'T1040004TA', 14, 1000, 2, 'Sales', 220, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"14\"}', 'Stock out from Sales-36081843\n', '2021-10-28 19:52:38'),
(1025, 2632, 11, '2007278', 1, 3500, 2, 'Sales', 221, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-72512614\n', '2021-10-28 19:53:25'),
(1026, 442, 2, 'T0100', 10, 200, 2, 'Sales', 222, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-53738694\n', '2021-10-28 19:55:36'),
(1027, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 223, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-45171978\n', '2021-10-28 19:56:36'),
(1028, 286, 2, '4171A06', 4, 1500, 2, 'Sales', 224, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock out from Sales-38859095\n', '2021-10-28 19:58:47'),
(1029, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 225, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-91629196\n', '2021-10-28 19:59:56'),
(1030, 2497, 11, '21040', 1, 2000, 2, 'Sales', 226, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-94873104\n', '2021-10-28 20:00:35'),
(1031, 2749, 18, '4767', 1, 500, 2, 'Sales', 227, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-27376772\n', '2021-10-28 20:01:38'),
(1032, 410, 2, 'A52101', 75, 600, 1, 'receiving', 267, '2022-01-28', 0, '{\"price\":\"600\",\"qty\":\"75\"}', 'Stock from Receiving-09054678\n', '2021-10-28 20:04:00'),
(1033, 410, 2, 'A52101', 6, 1500, 2, 'Sales', 228, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"6\"}', 'Stock out from Sales-35037026\n', '2021-10-28 20:06:19'),
(1034, 29, 286, '202324', 1, 2500, 2, 'Sales', 229, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-44951378\n', '2021-10-28 20:07:05'),
(1035, 2437, 11, '8C6K', 1, 16000, 2, 'Sales', 230, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-23194564\n', '2021-10-28 20:40:59'),
(1036, 192, 287, 'E110', 1, 2000, 2, 'Sales', 231, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-00187882\n', '2021-10-28 20:46:45'),
(1037, 2849, 18, '21289', 1, 1000, 2, 'Sales', 232, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-22284524\n', '2021-10-28 20:54:30'),
(1038, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 233, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-84212492\n', '2021-10-28 20:55:09'),
(1039, 788, 2, 'LET120604D', 5, 2000, 2, 'Sales', 234, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-49471265\n', '2021-10-28 21:13:41'),
(1040, 2805, 2, 'T1040004TA', 14, 1000, 2, 'Sales', 235, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"14\"}', 'Stock out from Sales-54274557\n', '2021-10-28 21:16:46'),
(1041, 712, 284, '0I49', 1, 2500, 2, 'Sales', 236, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-66948356\n', '2021-10-28 21:23:01'),
(1042, 113, 287, 'E105', 1, 2000, 2, 'Sales', 237, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-51012663\n', '2021-10-28 21:31:28'),
(1043, 285, 2, '2105071', 6, 750, 2, 'Sales', 239, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-82281331\n', '2021-10-28 21:46:45'),
(1044, 2856, 43, '21003', 3, 3500, 1, 'receiving', 268, '2024-03-07', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-08788252\n', '2021-10-28 22:04:51'),
(1045, 2857, 11, 'JS301', 3, 1300, 1, 'receiving', 269, '2022-12-28', 0, '{\"price\":\"1300\",\"qty\":\"3\"}', 'Stock from Receiving-50113078\n', '2021-10-28 22:07:10'),
(1046, 2857, 11, 'JS301', 1, 3000, 2, 'Sales', 241, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-75006735\n', '2021-10-28 22:08:04'),
(1047, 2856, 43, '21003', 1, 5000, 2, 'Sales', 245, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-93589117\n', '2021-10-28 22:39:33'),
(1048, 2802, 1, 'SC1025', 21, 200, 2, 'Sales', 246, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"21\"}', 'Stock out from Sales-13193302\n', '2021-10-28 22:40:52'),
(1049, 874, 11, '21163', 1, 1000, 2, 'Sales', 248, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-36092415\n', '2021-10-28 22:47:55'),
(1050, 2590, 30, 'MN209', 10, 200, 2, 'Sales', 249, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-39138273\n', '2021-10-28 22:49:58'),
(1051, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 250, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-03996209\n', '2021-10-28 22:53:32'),
(1052, 2557, 11, '1283', 2, 4000, 1, 'receiving', 270, '2024-06-28', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock from Receiving-73419860\n', '2021-10-28 23:16:56'),
(1053, 2557, 11, '1283', 1, 6000, 2, 'Sales', 251, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-11835087\n', '2021-10-28 23:17:47'),
(1054, 2858, 11, 'LD1049', 5, 2200, 1, 'receiving', 271, '2023-04-28', 0, '{\"price\":\"2200\",\"qty\":\"5\"}', 'Stock from Receiving-76385801\n', '2021-10-28 23:24:55'),
(1055, 2858, 11, 'LD1049', 1, 4000, 2, 'Sales', 252, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-95773100\n', '2021-10-28 23:25:37'),
(1056, 2859, 11, '0002', 9, 4000, 1, 'receiving', 272, '2024-08-28', 0, '{\"price\":\"4000\",\"qty\":\"9\"}', 'Stock from Receiving-34013066\n', '2021-10-28 23:32:07'),
(1057, 2859, 11, '0002', 1, 6000, 2, 'Sales', 253, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-68777116\n', '2021-10-28 23:32:46'),
(1058, 2860, 11, '2477FW', 2, 4000, 1, 'receiving', 273, '2024-07-28', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock from Receiving-85833719\n', '2021-10-28 23:38:15'),
(1059, 2860, 11, '2477FW', 1, 6000, 2, 'Sales', 254, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-71605816\n', '2021-10-28 23:39:01'),
(1060, 2861, 18, 'D28', 5, 3500, 1, 'receiving', 274, '2028-08-31', 0, '{\"price\":\"3500\",\"qty\":\"5\"}', 'Stock from Receiving-97247465\n', '2021-10-28 23:46:25'),
(1061, 235, 11, 'S0765', 1, 3500, 2, 'Sales', 255, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-30008079\n', '2021-10-29 09:09:29'),
(1062, 723, 2, '210735', 10, 300, 2, 'Sales', 256, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-71830345\n', '2021-10-29 09:10:51'),
(1063, 2852, 18, '2001721616', 1, 3500, 2, 'Sales', 257, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-12525263\n', '2021-10-29 09:11:51'),
(1064, 2688, 30, '008000', 1, 5000, 2, 'Sales', 258, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-72463365\n', '2021-10-29 09:13:59'),
(1065, 723, 2, '210735', 10, 300, 2, 'Sales', 259, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-21680468\n', '2021-10-29 09:15:20'),
(1066, 712, 284, '', 1, 2500, 2, 'Sales', 260, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-90857247\n', '2021-10-29 09:16:50'),
(1067, 108, 1, 'EPRH0761', 20, 100, 2, 'Sales', 261, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-21926436\n', '2021-10-29 09:18:33'),
(1068, 4, 2, 'OK69', 3, 300, 2, 'Sales', 262, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"3\"}', 'Stock out from Sales-07657289\n', '2021-10-29 10:05:27'),
(1069, 2853, 11, '', 1, 10000, 2, 'Sales', 263, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-08151885\n', '2021-10-29 10:07:37'),
(1070, 712, 284, '0149', 6, 1200, 1, 'receiving', 275, '2023-08-29', 0, '{\"price\":\"1200\",\"qty\":\"6\"}', 'Stock from Receiving-11698406\n', '2021-10-29 10:11:48'),
(1071, 712, 284, '0149', 1, 2500, 2, 'Sales', 264, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-97814442\n', '2021-10-29 10:13:22'),
(1072, 301, 28, '20201109', 1, 2000, 2, 'Sales', 265, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-42930730\n', '2021-10-29 10:14:37'),
(1073, 2854, 35, '15516100', 10, 1000, 2, 'Sales', 266, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-43688613\n', '2021-10-29 10:16:45'),
(1074, 1003, 2, '78273', 210, 100, 2, 'Sales', 267, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"210\"}', 'Stock out from Sales-88212423\n', '2021-10-29 10:17:53'),
(1075, 87, 2, '9L104', 10, 150, 2, 'Sales', 268, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-58379184\n', '2021-10-29 10:18:51'),
(1076, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 269, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-85224082\n', '2021-10-29 10:20:13'),
(1077, 962, 1, 'OP20029', 10, 100, 2, 'Sales', 270, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-34941581\n', '2021-10-29 10:55:33'),
(1078, 14, 2, '1A27', 6, 200, 2, 'Sales', 271, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"6\"}', 'Stock out from Sales-64503369\n', '2021-10-29 10:57:03'),
(1079, 2862, 11, '05123691', 2, 8000, 1, 'receiving', 276, '2023-06-30', 0, '{\"price\":\"8000\",\"qty\":\"2\"}', 'Stock from Receiving-92323326\n', '2021-10-29 11:50:02'),
(1080, 2862, 11, '05123691', 1, 10000, 2, 'Sales', 272, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-50168566\n', '2021-10-29 11:50:47'),
(1081, 2703, 10, 'G211120CN12 2X', 3, 2250, 1, 'receiving', 277, '2023-11-29', 0, '{\"price\":\"2250\",\"qty\":\"3\"}', 'Stock from Receiving-16778949\n', '2021-10-29 11:56:43'),
(1082, 2703, 10, 'G211120CN12 2X', 1, 3500, 2, 'Sales', 273, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-46943950\n', '2021-10-29 12:05:06'),
(1083, 656, 1, '', 30, 1500, 2, 'Sales', 274, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"30\"}', 'Stock out from Sales-79378064\n', '2021-10-29 12:10:06'),
(1084, 442, 2, 'T0100', 30, 200, 2, 'Sales', 275, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-89127870\n', '2021-10-29 12:20:32'),
(1085, 2710, 1, '1D23C1', 1, 600, 2, 'Sales', 276, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"1\"}', 'Stock out from Sales-12800257\n', '2021-10-29 12:21:23'),
(1086, 1266, 11, '10023', 7, 200, 2, 'Sales', 277, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"7\"}', 'Stock out from Sales-28498645\n', '2021-10-29 14:40:12'),
(1087, 71, 284, 'D11120', 1, 4000, 2, 'Sales', 278, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-54018051\n', '2021-10-29 14:41:53'),
(1088, 1205, 28, 'TRIAVA007', 1, 5000, 2, 'Sales', 279, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-30110553\n', '2021-10-29 14:43:42'),
(1089, 806, 28, 'ID0019', 1, 3000, 2, 'Sales', 280, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-13504715\n', '2021-10-29 15:03:28'),
(1090, 2862, 11, '', 1, 10000, 2, 'Sales', 281, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-41209931\n', '2021-10-29 15:41:57'),
(1091, 2863, 11, '1082JU00BM', 1, 8000, 1, 'receiving', 278, '2024-07-31', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock from Receiving-36235430\n', '2021-10-29 15:57:10'),
(1092, 2863, 11, '', 1, 10000, 2, 'Sales', 282, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-46120786\n', '2021-10-29 15:58:02'),
(1093, 1398, 30, '0508215202', 12, 1700, 1, 'receiving', 279, '2024-08-05', 0, '{\"price\":\"1700\",\"qty\":\"12\"}', 'Stock from Receiving-32576440\n', '2021-10-29 16:21:55'),
(1094, 1570, 10, 'B02', 1, 4000, 2, 'Sales', 283, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-14955493\n', '2021-10-29 16:27:16'),
(1095, 1402, 30, '', 3, 1000, 2, 'Sales', 284, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-07864084\n', '2021-10-29 16:31:37'),
(1096, 24, 284, '21002', 1, 5000, 2, 'Sales', 285, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-78663803\n', '2021-10-29 16:57:11'),
(1097, 700, 2, '1B30', 7, 400, 2, 'Sales', 286, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"7\"}', 'Stock out from Sales-95319620\n', '2021-10-29 16:58:04'),
(1098, 1357, 11, '0421OL', 1, 5000, 2, 'Sales', 287, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-48807553\n', '2021-10-29 16:59:29'),
(1099, 378, 2, '87092', 30, 200, 2, 'Sales', 288, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-39795302\n', '2021-10-29 17:00:34'),
(1100, 2698, 11, '20200208', 1, 1000, 2, 'Sales', 289, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-13106808\n', '2021-10-29 17:01:36'),
(1101, 2723, 115, 'L2001', 16, 280, 1, 'receiving', 280, '2022-08-29', 0, '{\"price\":\"280\",\"qty\":\"16\"}', 'Stock from Receiving-29631148\n', '2021-10-29 17:07:43'),
(1102, 2723, 115, 'L2001', 2, 500, 2, 'Sales', 290, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-06498471\n', '2021-10-29 17:08:44'),
(1103, 2711, 2, '2007111', 6, 150, 2, 'Sales', 291, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"6\"}', 'Stock out from Sales-05812119\n', '2021-10-29 17:10:29'),
(1104, 442, 2, 'T0100', 10, 200, 2, 'Sales', 292, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-11641715\n', '2021-10-29 17:11:27'),
(1105, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 293, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-94838771\n', '2021-10-29 17:13:21'),
(1106, 77, 2, '2106094', 10, 100, 2, 'Sales', 294, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-94158601\n', '2021-10-29 17:42:00'),
(1107, 1332, 30, 'TMC19-001', 1, 3500, 2, 'Sales', 295, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-41340747\n', '2021-10-29 17:43:52'),
(1108, 117, 2, 'SKY0180', 10, 400, 2, 'Sales', 296, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-30805746\n', '2021-10-29 17:44:43'),
(1109, 2802, 1, 'SC1025', 15, 200, 2, 'Sales', 297, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-27641972\n', '2021-10-29 17:47:05'),
(1110, 2496, 11, '21018', 1, 2000, 2, 'Sales', 298, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-03248717\n', '2021-10-29 17:47:58'),
(1111, 2740, 18, '122104', 1, 2500, 2, 'Sales', 299, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-48298362\n', '2021-10-29 17:51:19'),
(1112, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 300, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-47416634\n', '2021-10-29 17:57:27'),
(1113, 2849, 18, '21289', 1, 1000, 2, 'Sales', 301, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-66800263\n', '2021-10-29 19:12:16'),
(1114, 1539, 11, 'YC5422', 1, 7000, 2, 'Sales', 302, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-71151496\n', '2021-10-29 19:13:17'),
(1115, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 303, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-54674519\n', '2021-10-29 19:20:15'),
(1116, 135, 248, 'CB04002', 48, 400, 1, 'receiving', 281, '2024-03-29', 0, '{\"price\":\"400\",\"qty\":\"48\"}', 'Stock from Receiving-63113767\n', '2021-10-29 19:24:56'),
(1117, 135, 248, 'CB04002', 8, 600, 2, 'Sales', 304, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"8\"}', 'Stock out from Sales-69070669\n', '2021-10-29 19:25:31'),
(1118, 442, 2, 'T0100', 20, 200, 2, 'Sales', 305, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-99172226\n', '2021-10-29 19:37:59'),
(1119, 6, 2, '2107042', 3, 1000, 2, 'Sales', 306, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-61948087\n', '2021-10-29 19:38:36'),
(1120, 2496, 11, '21018', 1, 2000, 2, 'Sales', 307, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-86032109\n', '2021-10-29 19:39:17'),
(1121, 81, 2, 'NAR1CC3', 40, 500, 1, 'receiving', 282, '2023-02-28', 0, '{\"price\":\"500\",\"qty\":\"40\"}', 'Stock from Receiving-52652115\n', '2021-10-29 19:44:54'),
(1122, 81, 2, 'NAR1CC3', 4, 1000, 2, 'Sales', 308, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock out from Sales-76535986\n', '2021-10-29 19:45:25'),
(1123, 18, 286, '21095', 4, 940, 1, 'receiving', 283, '2024-05-31', 0, '{\"price\":\"940\",\"qty\":\"4\"}', 'Stock from Receiving-40925093\n', '2021-10-29 19:49:48'),
(1124, 2579, 11, '21032', 1, 2000, 2, 'Sales', 309, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-10316506\n', '2021-10-29 19:53:03'),
(1125, 2802, 1, 'SC1025', 15, 200, 2, 'Sales', 310, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-18796830\n', '2021-10-29 21:09:30'),
(1126, 2714, 2, 'FAZ1KB1', 6, 4200, 1, 'receiving', 284, '2023-10-29', 0, '{\"price\":\"4200\",\"qty\":\"6\"}', 'Stock from Receiving-87623522\n', '2021-10-29 21:22:47'),
(1127, 2703, 10, 'G211120CN12 2X', 1, 3500, 2, 'Sales', 311, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-33443482\n', '2021-10-29 21:25:38'),
(1128, 1334, 30, 'MAPR1R0621', 1, 2000, 2, 'Sales', 312, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-31063865\n', '2021-10-29 21:29:05'),
(1129, 1393, 30, '323E', 1, 3000, 2, 'Sales', 313, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-41397197\n', '2021-10-29 21:30:40'),
(1130, 285, 2, '2105071', 6, 750, 2, 'Sales', 314, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-97279900\n', '2021-10-29 21:36:17'),
(1131, 428, 2, 'TP0076', 5, 100, 2, 'Sales', 315, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-62439190\n', '2021-10-29 21:43:57'),
(1132, 730, 288, 'LK1008', 1, 3500, 2, 'Sales', 316, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-43654321\n', '2021-10-29 21:46:13'),
(1133, 2599, 287, '2011010', 1, 2000, 2, 'Sales', 317, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-99274279\n', '2021-10-29 21:49:42'),
(1134, 717, 11, '21014', 1, 2000, 2, 'Sales', 318, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-73241140\n', '2021-10-29 21:54:31'),
(1135, 2465, 2, 'ST.335', 10, 100, 2, 'Sales', 319, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-60924361\n', '2021-10-29 21:59:18'),
(1136, 405, 28, '1341Z046', 1, 2500, 2, 'Sales', 320, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-90179988\n', '2021-10-29 22:20:53'),
(1137, 2746, 18, '20201114', 1, 500, 2, 'Sales', 321, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-64753301\n', '2021-10-29 22:22:14'),
(1138, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 322, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-16740609\n', '2021-10-29 22:54:48'),
(1139, 2723, 115, 'L2001', 2, 500, 2, 'Sales', 323, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-97645729\n', '2021-10-29 23:27:35'),
(1140, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 324, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-68321738\n', '2021-10-29 23:28:12'),
(1141, 290, 288, 'AL1008', 1, 5000, 2, 'Sales', 325, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-96571836\n', '2021-10-30 08:29:01'),
(1142, 2512, 2, 'Y140XN', 5, 100, 2, 'Sales', 326, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-45992836\n', '2021-10-30 08:30:11'),
(1143, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 327, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-25014175\n', '2021-10-30 08:30:53'),
(1144, 2644, 288, '21014', 1, 2000, 2, 'Sales', 328, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-75053889\n', '2021-10-30 12:29:43'),
(1145, 2530, 289, 'L11PP', 1, 6000, 2, 'Sales', 329, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-36447586\n', '2021-10-30 12:30:50'),
(1146, 2516, 2, '0D07', 1, 3000, 2, 'Sales', 330, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-60451172\n', '2021-10-30 12:33:32'),
(1147, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 331, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-67757753\n', '2021-10-30 12:37:42'),
(1148, 2516, 2, '0D07', 1, 3000, 2, 'Sales', 332, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-27517454\n', '2021-10-30 12:38:20'),
(1149, 2557, 11, '', 1, 6000, 2, 'Sales', 333, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-25272961\n', '2021-10-30 12:38:55'),
(1150, 235, 11, 'S0765', 1, 3500, 2, 'Sales', 334, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-18133368\n', '2021-10-30 12:39:51'),
(1151, 135, 1, 'CB04002', 8, 600, 2, 'Sales', 335, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"8\"}', 'Stock out from Sales-64568085\n', '2021-10-30 12:40:42'),
(1152, 2746, 18, '20201114', 1, 500, 2, 'Sales', 336, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-57049305\n', '2021-10-30 12:41:46'),
(1153, 2746, 18, '20201114', 1, 500, 2, 'Sales', 337, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-70545679\n', '2021-10-30 12:42:32'),
(1154, 2818, 28, 'BZ1003', 1, 2000, 2, 'Sales', 338, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-53758473\n', '2021-10-30 12:44:22'),
(1155, 2818, 28, 'BZ1003', 1, 2000, 2, 'Sales', 339, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-55805623\n', '2021-10-30 12:47:12'),
(1156, 461, 2, 'CWB007', 5, 1000, 2, 'Sales', 340, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock out from Sales-74128913\n', '2021-10-30 12:48:35'),
(1157, 2711, 2, '2007111', 6, 150, 2, 'Sales', 341, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"6\"}', 'Stock out from Sales-53884083\n', '2021-10-30 12:49:41'),
(1158, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 342, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-30720893\n', '2021-10-30 12:51:22'),
(1159, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 343, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-09042247\n', '2021-10-30 12:54:47'),
(1160, 2442, 2, '1C38', 20, 100, 2, 'Sales', 344, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-48526714\n', '2021-10-30 12:55:55'),
(1161, 889, 2, 'PM620021', 20, 100, 2, 'Sales', 345, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-47014313\n', '2021-10-30 12:56:41'),
(1162, 2737, 0, '2019-12', 1, 3500, 2, 'Sales', 346, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-71814540\n', '2021-10-30 12:57:28'),
(1163, 2437, 11, '8C6K', 1, 16000, 2, 'Sales', 347, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-72250205\n', '2021-10-30 13:00:38'),
(1164, 1029, 2, '211056', 40, 100, 2, 'Sales', 348, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"40\"}', 'Stock out from Sales-70883512\n', '2021-10-30 13:01:40'),
(1165, 649, 1, 'FU0010', 10, 1000, 2, 'Sales', 349, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-10831723\n', '2021-10-30 13:02:58'),
(1166, 2750, 18, '0100104/TZNG/21', 1, 1000, 2, 'Sales', 350, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-63026299\n', '2021-10-30 13:03:44'),
(1167, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 351, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-85297051\n', '2021-10-30 13:09:32'),
(1168, 2617, 11, '202246', 1, 4000, 2, 'Sales', 352, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-45665348\n', '2021-10-30 14:42:02'),
(1169, 2720, 2, 'PX001', 10, 50, 2, 'Sales', 353, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-89686065\n', '2021-10-30 14:43:31'),
(1170, 968, 16, '2011045', 2, 500, 2, 'Sales', 354, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-08900987\n', '2021-10-30 15:15:02'),
(1171, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 355, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-08608313\n', '2021-10-30 15:16:21'),
(1172, 2520, 1, '1B27F1', 10, 300, 2, 'Sales', 356, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-77281305\n', '2021-10-30 17:41:21'),
(1173, 1003, 2, '78273', 30, 100, 2, 'Sales', 357, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-63129513\n', '2021-10-30 17:57:45'),
(1174, 180, 2, 'AR015G', 30, 150, 2, 'Sales', 358, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock out from Sales-39701877\n', '2021-10-30 18:14:20'),
(1175, 1, 2, '3106023', 10, 1250, 1, 'receiving', 285, '2023-05-30', 0, '{\"price\":\"1250\",\"qty\":\"10\"}', 'Stock from Receiving-15991500\n', '2021-10-30 18:29:00'),
(1176, 166, 2, '1G22', 100, 6000, 1, 'receiving', 286, '2024-06-30', 0, '{\"price\":\"6000\",\"qty\":\"100\"}', 'Stock from Receiving-36660429\n', '2021-10-30 18:34:46'),
(1177, 2856, 43, '21002', 5, 2700, 1, 'receiving', 287, '2024-03-30', 0, '{\"price\":\"2700\",\"qty\":\"5\"}', 'Stock from Receiving-80472243\n', '2021-10-30 18:41:01'),
(1178, 2722, 292, '20210311', 100, 170, 1, 'receiving', 288, '2024-03-30', 0, '{\"price\":\"170\",\"qty\":\"100\"}', 'Stock from Receiving-88696294\n', '2021-10-30 18:44:31'),
(1179, 2622, 11, 'PZF21028', 10, 1750, 1, 'receiving', 289, '2024-03-30', 0, '{\"price\":\"1750\",\"qty\":\"10\"}', 'Stock from Receiving-15318272\n', '2021-10-30 18:58:47'),
(1180, 2635, 11, '2101095', 10, 1750, 1, 'receiving', 290, '2023-12-30', 0, '{\"price\":\"1750\",\"qty\":\"10\"}', 'Stock from Receiving-35550994\n', '2021-10-30 19:10:49'),
(1181, 65, 11, '2707021', 3, 2050, 1, 'receiving', 291, '2024-06-30', 0, '{\"price\":\"2050\",\"qty\":\"3\"}', 'Stock from Receiving-06797161\n', '2021-10-30 19:15:01'),
(1182, 1126, 287, '06496', 1, 2000, 2, 'Sales', 359, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-29921610\n', '2021-10-30 19:20:35'),
(1183, 2849, 18, '21289', 1, 1000, 2, 'Sales', 360, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-11624680\n', '2021-10-30 19:21:17'),
(1184, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 361, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-58163915\n', '2021-10-30 19:22:59'),
(1185, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 362, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-46206551\n', '2021-10-30 19:23:46'),
(1186, 2495, 29, 'EX1001', 20, 950, 1, 'receiving', 292, '2023-01-30', 0, '{\"price\":\"950\",\"qty\":\"20\"}', 'Stock from Receiving-80336215\n', '2021-10-30 19:35:49'),
(1187, 1266, 11, '2T541067', 100, 129, 1, 'receiving', 293, '2025-02-28', 0, '{\"price\":\"129\",\"qty\":\"100\"}', 'Stock from Receiving-80995576\n', '2021-10-30 19:38:27'),
(1188, 235, 11, '1D86', 10, 1550, 1, 'receiving', 294, '2023-03-30', 0, '{\"price\":\"1550\",\"qty\":\"10\"}', 'Stock from Receiving-01865623\n', '2021-10-30 19:41:43'),
(1189, 2460, 288, 'C101', 1580, 1580, 1, 'receiving', 295, '2024-02-29', 0, '{\"price\":\"1580\",\"qty\":\"1580\"}', 'Stock from Receiving-65479830\n', '2021-10-30 19:54:05'),
(1190, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 363, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-71112283\n', '2021-10-30 19:54:54'),
(1191, 2612, 11, 'LF1006', 4, 1900, 1, 'receiving', 296, '2023-02-28', 0, '{\"price\":\"1900\",\"qty\":\"4\"}', 'Stock from Receiving-56148270\n', '2021-10-30 20:05:57'),
(1192, 2611, 11, 'G109', 5, 1850, 1, 'receiving', 297, '2024-06-30', 0, '{\"price\":\"1850\",\"qty\":\"5\"}', 'Stock from Receiving-57130672\n', '2021-10-30 20:08:59'),
(1193, 2496, 11, '21015', 10, 1200, 1, 'receiving', 298, '2023-05-30', 0, '{\"price\":\"1200\",\"qty\":\"10\"}', 'Stock from Receiving-19575043\n', '2021-10-30 20:38:24'),
(1194, 2420, 11, '68A01621', 5, 1250, 1, 'receiving', 299, '2023-12-30', 0, '{\"price\":\"1250\",\"qty\":\"5\"}', 'Stock from Receiving-57276896\n', '2021-10-30 20:43:31'),
(1195, 424, 10, 'C135', 10, 700, 1, 'receiving', 300, '2023-10-30', 0, '{\"price\":\"700\",\"qty\":\"10\"}', 'Stock from Receiving-03694483\n', '2021-10-30 20:45:43'),
(1196, 1223, 2, 'X26E1006', 30, 750, 1, 'receiving', 301, '2025-04-30', 0, '{\"price\":\"750\",\"qty\":\"30\"}', 'Stock from Receiving-38102525\n', '2021-10-30 20:52:52'),
(1197, 2864, 27, 'WO783', 24, 317, 1, 'receiving', 302, '2022-07-30', 0, '{\"price\":\"317\",\"qty\":\"24\"}', 'Stock from Receiving-55515724\n', '2021-10-30 21:05:38'),
(1198, 2865, 27, 'W3483', 24, 324, 1, 'receiving', 303, '2023-02-28', 0, '{\"price\":\"324\",\"qty\":\"24\"}', 'Stock from Receiving-74272229\n', '2021-10-30 21:08:43'),
(1199, 98, 284, '02112905', 4, 4400, 1, 'receiving', 304, '2022-02-28', 0, '{\"price\":\"4400\",\"qty\":\"4\"}', 'Stock from Receiving-24384125\n', '2021-10-30 21:29:28'),
(1200, 59, 284, 'JO786', 10, 770, 1, 'receiving', 305, '2024-06-30', 0, '{\"price\":\"770\",\"qty\":\"10\"}', 'Stock from Receiving-72918427\n', '2021-10-30 21:32:16'),
(1201, 2426, 11, '46DT', 3, 8150, 1, 'receiving', 306, '2023-05-30', 0, '{\"price\":\"8150\",\"qty\":\"3\"}', 'Stock from Receiving-04963813\n', '2021-10-30 21:36:12'),
(1202, 521, 289, 'BX258', 2, 13200, 1, 'receiving', 307, '2025-03-30', 0, '{\"price\":\"13200\",\"qty\":\"2\"}', 'Stock from Receiving-72675998\n', '2021-10-30 21:42:51'),
(1203, 414, 11, 'C4561007', 5, 1900, 1, 'receiving', 308, '2022-12-30', 0, '{\"price\":\"1900\",\"qty\":\"5\"}', 'Stock from Receiving-24108876\n', '2021-10-30 21:52:35'),
(1204, 378, 2, '87092', 200, 121, 1, 'receiving', 309, '2025-04-30', 0, '{\"price\":\"121\",\"qty\":\"200\"}', 'Stock from Receiving-74272283\n', '2021-10-30 21:56:46'),
(1205, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 364, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-58087714\n', '2021-10-30 21:59:26'),
(1206, 56, 284, 'A2103', 1, 4000, 2, 'Sales', 365, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-89046935\n', '2021-10-30 22:00:11'),
(1207, 918, 11, '2102142', 1, 2000, 2, 'Sales', 366, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-93560386\n', '2021-10-30 22:00:43'),
(1208, 788, 2, 'LET120604D', 5, 2000, 2, 'Sales', 367, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-69669872\n', '2021-10-30 22:02:36'),
(1209, 135, 248, 'CB04002', 3, 600, 2, 'Sales', 368, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-25891466\n', '2021-10-30 22:04:29'),
(1210, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 369, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-81033427\n', '2021-10-30 22:11:59'),
(1211, 111, 2, '210919', 5, 100, 2, 'Sales', 370, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-27994380\n', '2021-10-30 22:13:59'),
(1212, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 371, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-04137854\n', '2021-10-30 22:16:50'),
(1213, 104, 2, 'OL26', 2, 550, 1, 'receiving', 310, '2023-11-30', 0, '{\"price\":\"550\",\"qty\":\"2\"}', 'Stock from Receiving-86162510\n', '2021-10-30 22:51:04'),
(1214, 104, 2, '', 2, 1000, 2, 'Sales', 372, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-52998792\n', '2021-10-30 23:06:58'),
(1215, 192, 287, 'E110', 1, 2000, 2, 'Sales', 373, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-85272974\n', '2021-10-30 23:07:44'),
(1216, 1005, 2, '210721', 10, 100, 2, 'Sales', 374, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-38792064\n', '2021-10-30 23:08:51'),
(1217, 290, 288, 'AL1008', 1, 5000, 2, 'Sales', 375, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-18436816\n', '2021-10-30 23:09:35'),
(1218, 1356, 11, 'PS26231', 1, 5000, 2, 'Sales', 376, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-47683928\n', '2021-10-30 23:10:35'),
(1219, 151, 287, '200848', 1, 6000, 2, 'Sales', 377, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-75361104\n', '2021-10-30 23:11:17'),
(1220, 9, 2, 'C64S', 5, 2700, 1, 'receiving', 311, '2025-02-28', 0, '{\"price\":\"2700\",\"qty\":\"5\"}', 'Stock from Receiving-80792402\n', '2021-10-30 23:17:23'),
(1221, 9, 2, 'C64S', 1, 5000, 2, 'Sales', 378, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-37207137\n', '2021-10-30 23:18:09'),
(1222, 1324, 282, '200021', 2, 3500, 1, 'receiving', 312, '2021-11-30', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-16722420\n', '2021-10-30 23:22:22'),
(1223, 1324, 282, '200021', 1, 5000, 2, 'Sales', 379, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-56566957\n', '2021-10-30 23:30:26'),
(1224, 163, 2, '2001060', 2, 200, 2, 'Sales', 380, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-53979839\n', '2021-10-31 07:17:20'),
(1225, 108, 2, 'EPRH0761', 10, 100, 2, 'Sales', 381, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-24640661\n', '2021-10-31 08:23:55'),
(1226, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 382, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-07233536\n', '2021-10-31 08:24:36'),
(1227, 111, 2, '210919', 5, 100, 2, 'Sales', 383, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-86386937\n', '2021-10-31 08:25:16'),
(1228, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 384, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-55141085\n', '2021-10-31 08:26:14'),
(1229, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 385, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-38540405\n', '2021-10-31 08:27:33'),
(1230, 442, 2, 'T0100', 10, 200, 2, 'Sales', 386, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-80470338\n', '2021-10-31 08:28:34'),
(1231, 1324, 2, '', 1, 5000, 2, 'Sales', 387, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-85902976\n', '2021-10-31 08:29:22'),
(1232, 2849, 18, '21289', 1, 1000, 2, 'Sales', 388, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-05313411\n', '2021-10-31 08:29:55'),
(1233, 2852, 18, '2001721616', 1, 3500, 2, 'Sales', 389, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-69468685\n', '2021-10-31 13:47:20'),
(1234, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 390, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-85461404\n', '2021-10-31 13:47:58'),
(1235, 2651, 1, '202381', 1, 10000, 2, 'Sales', 391, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-12268729\n', '2021-10-31 13:49:09'),
(1236, 2465, 2, 'ST.335', 10, 100, 2, 'Sales', 392, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-65552132\n', '2021-10-31 13:58:55'),
(1237, 2850, 0, 'SR1013', 10, 50, 2, 'Sales', 393, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-14864934\n', '2021-10-31 13:59:53'),
(1238, 887, 5, 'PIX20050', 1, 2000, 2, 'Sales', 394, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-91124184\n', '2021-10-31 14:07:42'),
(1239, 2740, 18, '122104', 1, 2500, 2, 'Sales', 395, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-86333140\n', '2021-10-31 14:12:34'),
(1240, 700, 2, '1B30', 7, 400, 2, 'Sales', 396, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"7\"}', 'Stock out from Sales-70929210\n', '2021-10-31 14:17:30'),
(1241, 874, 11, '21163', 1, 1000, 2, 'Sales', 397, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-37764149\n', '2021-10-31 14:30:39'),
(1242, 285, 2, '2105071', 6, 750, 2, 'Sales', 398, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-82336477\n', '2021-10-31 14:31:19'),
(1243, 2720, 2, 'PX001', 10, 50, 2, 'Sales', 399, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-07820671\n', '2021-10-31 14:32:31'),
(1244, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 400, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-95759023\n', '2021-10-31 14:33:38'),
(1245, 2611, 11, 'G109', 1, 3500, 2, 'Sales', 401, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-06034013\n', '2021-10-31 14:43:48'),
(1246, 235, 11, '1D86', 1, 3500, 2, 'Sales', 402, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-22340235\n', '2021-10-31 14:44:55'),
(1247, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 403, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-06169306\n', '2021-10-31 14:47:07'),
(1248, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 404, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-23428276\n', '2021-10-31 14:49:15'),
(1249, 2714, 2, 'FAZ1KB1', 1, 6000, 2, 'Sales', 405, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-85405042\n', '2021-10-31 15:01:04'),
(1250, 285, 2, '2105071', 12, 750, 2, 'Sales', 407, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-25331683\n', '2021-10-31 15:13:25'),
(1251, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 408, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-00743393\n', '2021-10-31 17:43:17'),
(1252, 962, 1, 'OP20029', 15, 100, 2, 'Sales', 409, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-83509943\n', '2021-10-31 18:32:48'),
(1253, 2808, 2, 'BT190069B', 5, 600, 2, 'Sales', 410, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"5\"}', 'Stock out from Sales-60338888\n', '2021-10-31 18:34:45'),
(1254, 68, 2, '210337', 10, 100, 2, 'Sales', 411, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-01863600\n', '2021-10-31 18:36:00'),
(1255, 415, 2, 'CCT20002E', 10, 100, 2, 'Sales', 412, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-05194906\n', '2021-10-31 18:36:47'),
(1256, 41, 1, '44420063', 2, 500, 2, 'Sales', 413, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-89124419\n', '2021-10-31 18:43:22'),
(1257, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 414, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-09132545\n', '2021-10-31 18:43:51'),
(1258, 1549, 11, '0000', 1, 10000, 2, 'Sales', 415, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-11015040\n', '2021-10-31 18:46:17'),
(1259, 1318, 30, '', 1, 16000, 2, 'Sales', 416, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-21646882\n', '2021-10-31 19:05:57'),
(1260, 2420, 11, '68G00620', 1, 2500, 2, 'Sales', 417, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-19241162\n', '2021-10-31 19:33:59');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(1261, 875, 2, '88791', 30, 250, 2, 'Sales', 418, '0000-00-00', 0, '{\"price\":\"250\",\"qty\":\"30\"}', 'Stock out from Sales-28574981\n', '2021-10-31 21:45:02'),
(1262, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 419, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-17085813\n', '2021-10-31 21:47:34'),
(1263, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 420, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-85842902\n', '2021-10-31 21:49:03'),
(1264, 41, 1, '44420063', 3, 500, 2, 'Sales', 421, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"3\"}', 'Stock out from Sales-29076665\n', '2021-10-31 21:49:39'),
(1265, 824, 2, 'SKX1311', 60, 450, 1, 'receiving', 313, '2023-11-30', 0, '{\"price\":\"450\",\"qty\":\"60\"}', 'Stock from Receiving-99832872\n', '2021-10-31 21:55:52'),
(1266, 824, 2, 'SKX1311', 10, 900, 2, 'Sales', 423, '0000-00-00', 0, '{\"price\":\"900\",\"qty\":\"10\"}', 'Stock out from Sales-50270452\n', '2021-10-31 21:56:34'),
(1267, 24, 284, '21002', 1, 5000, 2, 'Sales', 424, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-79936095\n', '2021-10-31 21:57:56'),
(1268, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 425, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-70962054\n', '2021-10-31 21:58:47'),
(1269, 2516, 2, '0D07', 1, 3000, 2, 'Sales', 426, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-44780814\n', '2021-10-31 21:59:52'),
(1270, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 427, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-94635570\n', '2021-10-31 22:10:25'),
(1271, 2864, 115, 'WO783', 3, 600, 2, 'Sales', 428, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-51612221\n', '2021-10-31 22:14:07'),
(1272, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 429, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-18217959\n', '2021-10-31 22:14:59'),
(1273, 2801, 1, 'CL1042', 10, 200, 2, 'Sales', 430, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-88927633\n', '2021-10-31 22:16:14'),
(1274, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 431, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68364863\n', '2021-10-31 22:18:58'),
(1275, 116, 2, 'MBCH20005', 5, 300, 2, 'Sales', 432, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-26753086\n', '2021-10-31 22:19:41'),
(1276, 378, 2, '87092', 5, 200, 2, 'Sales', 433, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-89114467\n', '2021-10-31 22:30:47'),
(1277, 2866, 284, 'T24', 8, 3000, 1, 'receiving', 314, '2022-02-12', 0, '{\"price\":\"3000\",\"qty\":\"8\"}', 'Stock from Receiving-33717818\n', '2021-10-31 22:38:14'),
(1278, 2866, 284, 'T24', 1, 6000, 2, 'Sales', 434, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-04688652\n', '2021-10-31 22:39:42'),
(1279, 2703, 10, '', 1, 3500, 2, 'Sales', 435, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-71343851\n', '2021-10-31 22:41:06'),
(1280, 2765, 2, 'TL670001', 1, 2000, 2, 'Sales', 436, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-13840423\n', '2021-11-01 08:11:23'),
(1281, 1408, 30, '6401-09', 1, 5000, 2, 'Sales', 437, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-07374456\n', '2021-11-01 08:12:22'),
(1282, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 438, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-07427517\n', '2021-11-01 08:14:44'),
(1283, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 439, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-82855069\n', '2021-11-01 08:15:15'),
(1284, 6, 2, '2107042', 3, 1000, 2, 'Sales', 440, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-49383569\n', '2021-11-01 13:03:03'),
(1285, 2721, 2, 'Y095UH', 10, 150, 2, 'Sales', 441, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-90190919\n', '2021-11-01 13:10:04'),
(1286, 2651, 1, '202381', 1, 10000, 2, 'Sales', 442, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-50119765\n', '2021-11-01 13:10:50'),
(1287, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 443, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-08594869\n', '2021-11-01 13:11:35'),
(1288, 968, 16, '2011045', 2, 500, 2, 'Sales', 444, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-79590046\n', '2021-11-01 13:12:55'),
(1289, 2741, 18, 'C-97', 1, 6000, 2, 'Sales', 445, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-42721774\n', '2021-11-01 13:15:19'),
(1290, 405, 28, '1341Z046', 4, 2500, 2, 'Sales', 446, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock out from Sales-35513128\n', '2021-11-01 13:17:39'),
(1291, 11, 1, '1E19', 10, 100, 2, 'Sales', 447, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-09477568\n', '2021-11-01 13:19:54'),
(1292, 151, 287, '', 1, 6000, 2, 'Sales', 448, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-59247891\n', '2021-11-01 13:20:40'),
(1293, 410, 2, 'A52101', 5, 1500, 2, 'Sales', 449, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"5\"}', 'Stock out from Sales-11279777\n', '2021-11-01 13:22:24'),
(1294, 87, 2, '9L104', 10, 150, 2, 'Sales', 450, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-51602437\n', '2021-11-01 13:23:41'),
(1295, 949, 2, 'EW199006', 10, 200, 2, 'Sales', 451, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-09095102\n', '2021-11-01 13:26:45'),
(1296, 2798, 1, 'CA03621', 10, 200, 2, 'Sales', 452, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-87671059\n', '2021-11-01 13:27:52'),
(1297, 2705, 10, '1131', 1, 10000, 2, 'Sales', 453, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-29916542\n', '2021-11-01 13:28:47'),
(1298, 2529, 289, 'L4PP', 1, 3000, 2, 'Sales', 454, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-85739072\n', '2021-11-01 13:47:30'),
(1299, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 455, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-96698655\n', '2021-11-01 14:43:59'),
(1300, 2856, 284, '21003', 1, 5000, 2, 'Sales', 456, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-65311359\n', '2021-11-01 18:43:57'),
(1301, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 457, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-63670107\n', '2021-11-01 18:44:46'),
(1302, 649, 2, 'FU0010', 19, 1000, 2, 'Sales', 458, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"19\"}', 'Stock out from Sales-92122155\n', '2021-11-01 18:45:29'),
(1303, 715, 11, 'SBH2100', 1, 2000, 2, 'Sales', 459, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-14863926\n', '2021-11-01 18:46:21'),
(1304, 2651, 1, '202381', 1, 10000, 2, 'Sales', 460, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-96554832\n', '2021-11-01 18:47:38'),
(1305, 442, 2, 'T0100', 20, 200, 2, 'Sales', 461, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-96789160\n', '2021-11-01 18:49:44'),
(1306, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 462, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-69397721\n', '2021-11-01 18:50:35'),
(1307, 6, 2, '2107042', 3, 1000, 2, 'Sales', 463, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-19788508\n', '2021-11-01 18:52:21'),
(1308, 962, 1, 'OP20029', 10, 100, 2, 'Sales', 464, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-48470704\n', '2021-11-01 18:53:37'),
(1309, 561, 30, '', 1, 10000, 2, 'Sales', 465, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-99344126\n', '2021-11-01 18:54:11'),
(1310, 1005, 2, '210721', 15, 100, 2, 'Sales', 466, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-39017252\n', '2021-11-01 18:55:14'),
(1311, 962, 1, 'OP20029', 10, 100, 2, 'Sales', 467, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-64894198\n', '2021-11-01 18:55:57'),
(1312, 2722, 292, 'HCG201015', 2, 1000, 2, 'Sales', 468, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-78612051\n', '2021-11-01 18:58:20'),
(1313, 917, 2, '0B89', 10, 200, 2, 'Sales', 469, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-58368597\n', '2021-11-01 18:59:21'),
(1314, 1357, 11, '0421OL', 1, 5000, 2, 'Sales', 470, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-78738783\n', '2021-11-01 18:59:55'),
(1315, 2737, 18, '2019-12', 1, 3500, 2, 'Sales', 471, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-00943871\n', '2021-11-01 19:21:16'),
(1316, 1567, 30, '00.00', 3, 1000, 2, 'Sales', 472, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-42640468\n', '2021-11-01 19:37:19'),
(1317, 1317, 30, 'T2', 1, 15000, 2, 'Sales', 473, '0000-00-00', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock out from Sales-65427374\n', '2021-11-01 19:39:06'),
(1318, 2669, 2, 'NAA9290A', 1, 3000, 2, 'Sales', 476, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-17359275\n', '2021-11-01 21:42:13'),
(1319, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 477, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-81435324\n', '2021-11-01 21:43:12'),
(1320, 662, 2, '9L73', 20, 100, 2, 'Sales', 478, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-67261326\n', '2021-11-01 21:44:03'),
(1321, 2641, 2, '10210141', 1, 5000, 2, 'Sales', 479, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-49116799\n', '2021-11-01 21:45:44'),
(1322, 9, 2, 'C64S', 1, 5000, 2, 'Sales', 480, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-57005306\n', '2021-11-01 21:46:30'),
(1323, 285, 2, '2105071', 6, 750, 2, 'Sales', 481, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-24079852\n', '2021-11-01 21:50:38'),
(1324, 77, 2, '2106094', 10, 100, 2, 'Sales', 482, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-55025323\n', '2021-11-01 21:52:26'),
(1325, 1354, 11, '003SH', 1, 4000, 2, 'Sales', 483, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-99630572\n', '2021-11-01 21:56:01'),
(1326, 2771, 2, '2105016', 1, 2000, 2, 'Sales', 484, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-76872700\n', '2021-11-01 21:56:37'),
(1327, 2640, 11, 'EMPL204134', 1, 4000, 2, 'Sales', 485, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-91803936\n', '2021-11-01 21:57:16'),
(1328, 1327, 282, 'B1002', 1, 10000, 2, 'Sales', 486, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-94103470\n', '2021-11-02 08:00:01'),
(1329, 163, 2, '2001060', 2, 200, 2, 'Sales', 487, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-89522769\n', '2021-11-02 08:03:39'),
(1330, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 488, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-52292781\n', '2021-11-02 08:04:41'),
(1331, 1341, 11, '220220', 1, 2500, 2, 'Sales', 489, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-89221031\n', '2021-11-02 08:05:20'),
(1332, 2776, 2, '362492', 1, 2500, 2, 'Sales', 490, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-61612866\n', '2021-11-02 08:05:57'),
(1333, 968, 27, '2011045', 2, 500, 2, 'Sales', 491, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-30945697\n', '2021-11-02 08:06:50'),
(1334, 2488, 10, 'BE20137', 1, 4000, 2, 'Sales', 492, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-52676521\n', '2021-11-02 10:59:23'),
(1335, 285, 2, '2105071', 6, 750, 2, 'Sales', 494, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-40308357\n', '2021-11-02 11:03:01'),
(1336, 378, 2, '87092', 30, 200, 2, 'Sales', 495, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-20627856\n', '2021-11-02 11:03:41'),
(1337, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 496, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-77348483\n', '2021-11-02 11:04:55'),
(1338, 949, 2, 'EW199006', 15, 200, 2, 'Sales', 497, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-46596158\n', '2021-11-02 11:05:36'),
(1339, 723, 2, '210735', 10, 300, 2, 'Sales', 498, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-70815110\n', '2021-11-02 11:07:37'),
(1340, 2770, 2, '13520', 1, 8000, 2, 'Sales', 499, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-04487835\n', '2021-11-02 11:34:43'),
(1341, 805, 28, 'NL170001', 1, 3000, 2, 'Sales', 500, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-18941088\n', '2021-11-02 11:57:23'),
(1342, 1205, 28, 'TRIAVA007', 1, 5000, 2, 'Sales', 501, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-17462521\n', '2021-11-02 11:58:17'),
(1343, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 502, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-09547132\n', '2021-11-02 12:23:32'),
(1344, 1200, 2, '2002979', 2, 2000, 2, 'Sales', 503, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-37089384\n', '2021-11-02 12:33:55'),
(1345, 1005, 2, '210721', 15, 100, 2, 'Sales', 504, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-93947638\n', '2021-11-02 12:34:53'),
(1346, 2771, 2, '2105016', 1, 2000, 2, 'Sales', 505, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-53712645\n', '2021-11-02 13:08:31'),
(1347, 1003, 2, '78273', 105, 100, 2, 'Sales', 506, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"105\"}', 'Stock out from Sales-80316583\n', '2021-11-02 13:11:51'),
(1348, 2856, 284, '21002', 1, 5000, 2, 'Sales', 507, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-08358052\n', '2021-11-02 14:37:18'),
(1349, 717, 11, '21014', 1, 2000, 2, 'Sales', 508, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-05589334\n', '2021-11-02 14:38:17'),
(1350, 2771, 2, '2105016', 1, 2000, 2, 'Sales', 509, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-26407721\n', '2021-11-02 14:38:47'),
(1351, 2771, 2, '2105016', 1, 2000, 2, 'Sales', 510, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-63532366\n', '2021-11-02 14:43:10'),
(1352, 285, 2, '2105071', 6, 750, 2, 'Sales', 511, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-29907567\n', '2021-11-02 14:43:54'),
(1353, 2488, 10, '', 1, 4000, 2, 'Sales', 512, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-94884233\n', '2021-11-02 14:44:31'),
(1354, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 513, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-12856989\n', '2021-11-02 15:26:01'),
(1355, 2854, 2, '15516100', 15, 1000, 2, 'Sales', 514, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock out from Sales-64398632\n', '2021-11-02 15:26:47'),
(1356, 442, 2, 'T0100', 10, 200, 2, 'Sales', 515, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-85400871\n', '2021-11-02 15:27:32'),
(1357, 285, 2, '2105071', 6, 750, 2, 'Sales', 516, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-59768138\n', '2021-11-02 16:46:02'),
(1358, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 517, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-19829442\n', '2021-11-02 16:47:09'),
(1359, 10, 2, '80027', 10, 200, 2, 'Sales', 518, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-04827698\n', '2021-11-02 16:48:43'),
(1360, 1333, 30, '2804T3', 1, 2500, 2, 'Sales', 519, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-22750644\n', '2021-11-02 16:50:20'),
(1361, 2865, 27, 'W3483', 3, 600, 2, 'Sales', 520, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-52319227\n', '2021-11-02 17:04:07'),
(1362, 2442, 2, '1C38', 10, 100, 2, 'Sales', 521, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-04421142\n', '2021-11-02 17:05:30'),
(1363, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 522, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-70837817\n', '2021-11-02 17:06:00'),
(1364, 2651, 1, '202381', 1, 10000, 2, 'Sales', 523, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-50600076\n', '2021-11-02 18:13:20'),
(1365, 1570, 282, 'B02', 1, 4000, 2, 'Sales', 524, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-94834300\n', '2021-11-02 18:15:28'),
(1366, 889, 2, 'PM620021', 5, 100, 2, 'Sales', 525, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-86362375\n', '2021-11-02 18:28:15'),
(1367, 1139, 2, '91194', 5, 200, 2, 'Sales', 526, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-57508295\n', '2021-11-02 18:54:11'),
(1368, 405, 28, '1341Z046', 8, 2500, 2, 'Sales', 527, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"8\"}', 'Stock out from Sales-36437498\n', '2021-11-02 19:44:24'),
(1369, 1575, 282, 'CN122H', 1, 3500, 2, 'Sales', 528, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-21071336\n', '2021-11-02 20:01:13'),
(1370, 1387, 30, '20113001', 1, 10000, 2, 'Sales', 529, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-96229845\n', '2021-11-02 20:02:20'),
(1371, 1334, 30, 'MAPR1R0621', 1, 2000, 2, 'Sales', 530, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-73015672\n', '2021-11-02 20:02:48'),
(1372, 11, 1, '1E19', 10, 100, 2, 'Sales', 531, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-94599290\n', '2021-11-02 21:16:32'),
(1373, 11, 1, '1E19', 15, 100, 2, 'Sales', 533, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-91205162\n', '2021-11-02 21:18:07'),
(1374, 662, 2, '9L73', 10, 100, 2, 'Sales', 534, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-82136524\n', '2021-11-02 21:18:47'),
(1375, 1003, 2, '78273', 20, 100, 2, 'Sales', 535, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-50084226\n', '2021-11-02 21:19:43'),
(1376, 286, 2, '4171A06', 6, 1500, 2, 'Sales', 536, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"6\"}', 'Stock out from Sales-00169327\n', '2021-11-02 21:20:55'),
(1377, 1184, 2, 'OL0004', 2, 2000, 2, 'Sales', 537, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-49664434\n', '2021-11-02 21:22:31'),
(1378, 2755, 10, '190506', 2, 2000, 2, 'Sales', 538, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-25827293\n', '2021-11-02 21:24:36'),
(1379, 1029, 2, '211056', 50, 100, 2, 'Sales', 539, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"50\"}', 'Stock out from Sales-17059316\n', '2021-11-02 21:29:23'),
(1380, 2864, 27, 'WO783', 3, 600, 2, 'Sales', 540, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-61415037\n', '2021-11-02 21:30:19'),
(1381, 424, 10, 'C135', 1, 2000, 2, 'Sales', 541, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-09734477\n', '2021-11-02 21:31:22'),
(1382, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 542, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-96620137\n', '2021-11-02 21:32:23'),
(1383, 2506, 11, 'MO305', 1, 3500, 2, 'Sales', 543, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-46390887\n', '2021-11-02 21:33:16'),
(1384, 1570, 282, 'B02', 1, 4000, 2, 'Sales', 544, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-79925873\n', '2021-11-02 21:34:04'),
(1385, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 545, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-34246467\n', '2021-11-02 22:44:22'),
(1386, 46, 287, 'BL1004', 1, 3000, 2, 'Sales', 546, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-13342399\n', '2021-11-02 22:45:22'),
(1387, 2441, 11, '201023', 1, 3000, 2, 'Sales', 548, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-50093878\n', '2021-11-02 22:46:40'),
(1388, 1252, 2, 'ET 339', 15, 100, 2, 'Sales', 549, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-59423789\n', '2021-11-02 22:48:03'),
(1389, 2525, 30, '095159', 1, 16000, 2, 'Sales', 550, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-80523462\n', '2021-11-02 22:49:26'),
(1390, 56, 284, 'A2103', 1, 4000, 2, 'Sales', 551, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-80580904\n', '2021-11-02 22:50:31'),
(1391, 2750, 18, '0100104/TZNG/21', 1, 1000, 2, 'Sales', 552, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-27611253\n', '2021-11-03 09:26:29'),
(1392, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 553, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-63581701\n', '2021-11-03 09:35:08'),
(1393, 1570, 282, '', 1, 4000, 2, 'Sales', 554, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-30777265\n', '2021-11-03 09:35:55'),
(1394, 1252, 2, 'ET 339', 20, 100, 2, 'Sales', 555, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-28854745\n', '2021-11-03 09:50:03'),
(1395, 2442, 2, '1C38', 20, 100, 2, 'Sales', 556, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-90091417\n', '2021-11-03 09:51:17'),
(1396, 286, 2, '417IA06', 120, 750, 1, 'receiving', 315, '2024-04-03', 0, '{\"price\":\"750\",\"qty\":\"120\"}', 'Stock from Receiving-41350286\n', '2021-11-03 15:15:13'),
(1397, 661, 11, 'F49L', 5, 11000, 1, 'receiving', 316, '2023-06-03', 0, '{\"price\":\"11000\",\"qty\":\"5\"}', 'Stock from Receiving-18163713\n', '2021-11-03 15:19:34'),
(1398, 27, 284, 'T004590', 5, 10500, 1, 'receiving', 317, '2023-01-03', 0, '{\"price\":\"10500\",\"qty\":\"5\"}', 'Stock from Receiving-32894236\n', '2021-11-03 15:23:07'),
(1399, 338, 2, 'BCSM20002', 150, 230, 1, 'receiving', 318, '2023-02-03', 0, '{\"price\":\"230\",\"qty\":\"150\"}', 'Stock from Receiving-11868771\n', '2021-11-03 15:30:12'),
(1400, 337, 2, 'ESL130003', 150, 400, 1, 'receiving', 319, '2022-03-03', 0, '{\"price\":\"400\",\"qty\":\"150\"}', 'Stock from Receiving-59136658\n', '2021-11-03 15:34:53'),
(1401, 442, 2, '2106040', 400, 85, 1, 'receiving', 320, '2024-05-31', 0, '{\"price\":\"85\",\"qty\":\"400\"}', 'Stock from Receiving-82031161\n', '2021-11-03 15:41:35'),
(1402, 177, 2, '88334', 200, 125, 1, 'receiving', 321, '2025-06-30', 0, '{\"price\":\"125\",\"qty\":\"200\"}', 'Stock from Receiving-78842169\n', '2021-11-03 15:43:07'),
(1403, 2712, 18, 'CJ20593', 1, 2000, 2, 'Sales', 557, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-06077863\n', '2021-11-03 15:44:47'),
(1404, 2749, 18, '4767', 3, 500, 2, 'Sales', 558, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"3\"}', 'Stock out from Sales-41331266\n', '2021-11-03 16:07:40'),
(1405, 117, 2, 'SKY0180', 5, 400, 2, 'Sales', 560, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-07195557\n', '2021-11-03 16:10:14'),
(1406, 1570, 282, 'B02', 6, 2200, 1, 'receiving', 322, '2023-09-01', 0, '{\"price\":\"2200\",\"qty\":\"6\"}', 'Stock from Receiving-10973422\n', '2021-11-03 16:15:26'),
(1407, 1570, 282, 'B02', 1, 4000, 2, 'Sales', 561, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-95054528\n', '2021-11-03 16:16:54'),
(1408, 2597, 35, '', 2, 2000, 2, 'Sales', 562, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-76566364\n', '2021-11-03 16:17:45'),
(1409, 9, 2, 'C64S', 1, 5000, 2, 'Sales', 563, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-16716319\n', '2021-11-03 16:18:57'),
(1410, 968, 27, '2011045', 2, 500, 2, 'Sales', 564, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-24882668\n', '2021-11-03 16:27:28'),
(1411, 2442, 2, '1C38', 30, 100, 2, 'Sales', 565, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-57248287\n', '2021-11-03 16:28:12'),
(1412, 56, 284, 'A2108', 6, 2200, 1, 'receiving', 323, '2022-12-03', 0, '{\"price\":\"2200\",\"qty\":\"6\"}', 'Stock from Receiving-03447319\n', '2021-11-03 16:37:42'),
(1413, 2867, 10, 'G13921', 4, 3150, 1, 'receiving', 324, '2023-02-28', 0, '{\"price\":\"3150\",\"qty\":\"4\"}', 'Stock from Receiving-34654487\n', '2021-11-03 16:44:59'),
(1414, 97, 284, 'C147', 4, 1900, 1, 'receiving', 325, '2023-11-30', 0, '{\"price\":\"1900\",\"qty\":\"4\"}', 'Stock from Receiving-04752559\n', '2021-11-03 16:48:11'),
(1415, 2447, 2, '2103810002', 40, 425, 1, 'receiving', 326, '2023-02-28', 0, '{\"price\":\"425\",\"qty\":\"40\"}', 'Stock from Receiving-78505501\n', '2021-11-03 16:52:57'),
(1416, 2868, 2, 'EY1003', 100, 200, 1, 'receiving', 327, '2024-03-31', 0, '{\"price\":\"200\",\"qty\":\"100\"}', 'Stock from Receiving-83565023\n', '2021-11-03 16:57:46'),
(1417, 723, 2, '210735', 100, 177, 1, 'receiving', 328, '2025-02-28', 0, '{\"price\":\"177\",\"qty\":\"100\"}', 'Stock from Receiving-95311493\n', '2021-11-03 17:01:15'),
(1418, 2869, 28, 'NL130002', 10, 850, 1, 'receiving', 329, '2023-11-30', 0, '{\"price\":\"850\",\"qty\":\"10\"}', 'Stock from Receiving-74294182\n', '2021-11-03 17:11:41'),
(1419, 2870, 2, 'GD91279', 14, 1429, 1, 'receiving', 330, '2022-05-31', 0, '{\"price\":\"1429\",\"qty\":\"14\"}', 'Stock from Receiving-16033802\n', '2021-11-03 17:22:21'),
(1420, 396, 1, '0104003', 30, 250, 1, 'receiving', 331, '2023-09-30', 0, '{\"price\":\"250\",\"qty\":\"30\"}', 'Stock from Receiving-08661432\n', '2021-11-03 17:47:57'),
(1421, 2749, 292, '47', 5, 550, 1, 'receiving', 332, '2023-11-30', 0, '{\"price\":\"550\",\"qty\":\"5\"}', 'Stock from Receiving-55981515\n', '2021-11-03 17:54:55'),
(1422, 2873, 2, 'T0332', 200, 30, 1, 'receiving', 333, '2022-08-31', 0, '{\"price\":\"30\",\"qty\":\"200\"}', 'Stock from Receiving-99396748\n', '2021-11-03 18:01:47'),
(1423, 2641, 11, '10210862', 5, 2600, 1, 'receiving', 334, '2023-03-31', 0, '{\"price\":\"2600\",\"qty\":\"5\"}', 'Stock from Receiving-28591632\n', '2021-11-03 18:04:04'),
(1424, 1104, 11, '10712', 5, 13000, 1, 'receiving', 335, '2023-03-31', 0, '{\"price\":\"13000\",\"qty\":\"5\"}', 'Stock from Receiving-83620295\n', '2021-11-03 18:09:18'),
(1425, 2739, 18, '192108', 5, 700, 1, 'receiving', 336, '2025-08-31', 0, '{\"price\":\"700\",\"qty\":\"5\"}', 'Stock from Receiving-29935609\n', '2021-11-03 18:14:15'),
(1426, 2628, 11, '519Y1', 4, 5700, 1, 'receiving', 337, '2023-06-03', 0, '{\"price\":\"5700\",\"qty\":\"4\"}', 'Stock from Receiving-44748198\n', '2021-11-03 18:29:11'),
(1427, 782, 11, 'EU0006', 4, 4200, 1, 'receiving', 338, '2023-09-30', 0, '{\"price\":\"4200\",\"qty\":\"4\"}', 'Stock from Receiving-07949399\n', '2021-11-03 18:43:14'),
(1428, 2774, 2, 'PA10520', 3, 1450, 1, 'receiving', 339, '2023-10-31', 0, '{\"price\":\"1450\",\"qty\":\"3\"}', 'Stock from Receiving-74902045\n', '2021-11-03 18:58:36'),
(1429, 2742, 18, 'AS2021214', 2, 3100, 1, 'receiving', 340, '2026-03-31', 0, '{\"price\":\"3100\",\"qty\":\"2\"}', 'Stock from Receiving-12093968\n', '2021-11-03 19:17:06'),
(1430, 1137, 1, 'BH1011', 270, 45, 1, 'receiving', 341, '2024-02-29', 0, '{\"price\":\"45\",\"qty\":\"270\"}', 'Stock from Receiving-06707959\n', '2021-11-03 19:35:31'),
(1431, 1137, 1, 'BH1011', 120, 100, 2, 'Sales', 566, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"120\"}', 'Stock out from Sales-47310777\n', '2021-11-03 19:37:42'),
(1432, 442, 2, 'T0100', 20, 200, 2, 'Sales', 567, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-45398828\n', '2021-11-03 19:38:18'),
(1433, 2442, 2, '1C38', 5, 100, 2, 'Sales', 568, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-77306884\n', '2021-11-03 19:38:57'),
(1434, 1137, 1, 'BH1011', 5, 100, 2, 'Sales', 569, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-65884737\n', '2021-11-03 19:39:31'),
(1435, 2441, 11, '', 1, 3000, 2, 'Sales', 570, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-69558074\n', '2021-11-03 19:40:10'),
(1436, 993, 2, 'Y0B3UL', 10, 150, 2, 'Sales', 571, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-66898540\n', '2021-11-03 19:40:46'),
(1437, 647, 1, '0220291', 21, 1000, 2, 'Sales', 572, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"21\"}', 'Stock out from Sales-10444947\n', '2021-11-03 19:41:57'),
(1438, 889, 2, 'PM620021', 60, 100, 2, 'Sales', 573, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"60\"}', 'Stock out from Sales-48904909\n', '2021-11-03 19:49:26'),
(1439, 2849, 18, '21289', 1, 1000, 2, 'Sales', 574, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-40060321\n', '2021-11-03 19:50:01'),
(1440, 1, 2, '2103004', 1, 2000, 2, 'Sales', 575, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-00028393\n', '2021-11-03 19:51:18'),
(1441, 77, 2, '2106094', 5, 100, 2, 'Sales', 576, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-82614168\n', '2021-11-03 19:52:44'),
(1442, 1301, 2, 'OT2018AA', 15, 1000, 2, 'Sales', 577, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock out from Sales-30204843\n', '2021-11-03 19:54:25'),
(1443, 2807, 2, '200015', 15, 100, 2, 'Sales', 578, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-39887035\n', '2021-11-03 19:55:26'),
(1444, 1266, 11, '10023', 5, 200, 2, 'Sales', 579, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-85853041\n', '2021-11-03 19:56:33'),
(1445, 2458, 11, '10210690', 1, 3500, 2, 'Sales', 580, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-39055800\n', '2021-11-03 19:58:10'),
(1446, 2721, 2, 'Y095UH', 10, 150, 2, 'Sales', 581, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-34612270\n', '2021-11-03 19:58:51'),
(1447, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 582, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-04986741\n', '2021-11-03 20:01:00'),
(1448, 9, 2, 'C64S', 1, 5000, 2, 'Sales', 583, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-83970704\n', '2021-11-03 20:05:28'),
(1449, 34, 284, 'GNTR0A020', 2, 5000, 2, 'Sales', 584, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-98966968\n', '2021-11-03 20:06:39'),
(1450, 1328, 30, '350360039300044', 2, 5000, 2, 'Sales', 585, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-00392196\n', '2021-11-03 20:07:14'),
(1451, 730, 288, '', 1, 3500, 2, 'Sales', 586, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-97275998\n', '2021-11-03 20:07:59'),
(1452, 2545, 11, '094', 1, 2000, 2, 'Sales', 587, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-84782732\n', '2021-11-03 20:08:39'),
(1453, 1571, 282, '', 1, 10000, 2, 'Sales', 588, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-66661262\n', '2021-11-03 20:09:20'),
(1454, 2594, 2, '2003325', 1, 15000, 2, 'Sales', 589, '0000-00-00', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock out from Sales-65206989\n', '2021-11-03 20:10:22'),
(1455, 2684, 30, '0000-00', 1, 3000, 2, 'Sales', 590, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-06498799\n', '2021-11-03 20:11:01'),
(1456, 2622, 11, 'PZF21008', 1, 3000, 2, 'Sales', 591, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-69025165\n', '2021-11-03 20:11:45'),
(1457, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 592, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-58549849\n', '2021-11-03 20:12:27'),
(1458, 301, 28, '20201109', 1, 2000, 2, 'Sales', 593, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-87386773\n', '2021-11-03 20:13:04'),
(1459, 2744, 18, '200801', 2, 300, 2, 'Sales', 594, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"2\"}', 'Stock out from Sales-43782960\n', '2021-11-03 20:13:40'),
(1460, 94, 2, 'AB52892', 5, 400, 2, 'Sales', 595, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-59779879\n', '2021-11-03 20:14:25'),
(1461, 899, 2, 'EOSGDT001', 1, 20000, 2, 'Sales', 596, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-30733226\n', '2021-11-03 20:15:03'),
(1462, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 597, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-74752092\n', '2021-11-03 20:16:05'),
(1463, 2722, 292, 'HCG201015', 2, 1000, 2, 'Sales', 598, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-54110926\n', '2021-11-03 20:16:58'),
(1464, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 599, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-95697528\n', '2021-11-03 20:17:33'),
(1465, 2784, 2, '21070287', 1, 5000, 2, 'Sales', 600, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-84284568\n', '2021-11-03 20:20:26'),
(1466, 2711, 2, '2007111', 6, 150, 2, 'Sales', 601, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"6\"}', 'Stock out from Sales-48161271\n', '2021-11-03 20:20:59'),
(1467, 108, 2, 'EPRH0761', 5, 100, 2, 'Sales', 602, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-64358305\n', '2021-11-03 20:21:34'),
(1468, 2869, 28, 'NL130002', 1, 2500, 2, 'Sales', 603, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-08780870\n', '2021-11-03 21:18:23'),
(1469, 2849, 18, '', 1, 1000, 2, 'Sales', 604, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-25262957\n', '2021-11-03 21:19:00'),
(1470, 2417, 11, 'Y069UH', 1, 6000, 2, 'Sales', 605, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-70142203\n', '2021-11-03 21:25:47'),
(1471, 242, 11, 'G3307', 1, 7000, 2, 'Sales', 606, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-21871685\n', '2021-11-03 21:26:50'),
(1472, 2721, 2, 'Y095UH', 10, 150, 2, 'Sales', 607, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-04366481\n', '2021-11-03 21:27:45'),
(1473, 2529, 289, 'L4PP', 1, 3000, 2, 'Sales', 608, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-87687972\n', '2021-11-03 21:29:05'),
(1474, 2736, 18, '20200507', 1, 3500, 2, 'Sales', 609, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-16377514\n', '2021-11-03 21:40:46'),
(1475, 424, 10, 'C135', 1, 2000, 2, 'Sales', 610, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-20878386\n', '2021-11-03 21:45:23'),
(1476, 424, 10, 'C135', 1, 2000, 2, 'Sales', 611, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-73431652\n', '2021-11-03 23:14:11'),
(1477, 285, 2, '2105071', 6, 750, 2, 'Sales', 612, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-10770982\n', '2021-11-03 23:15:43'),
(1478, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 613, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-30398293\n', '2021-11-03 23:16:19'),
(1479, 2578, 287, '213701', 20, 12000, 1, 'receiving', 342, '2024-07-31', 0, '{\"price\":\"12000\",\"qty\":\"20\"}', 'Stock from Receiving-47604305\n', '2021-11-04 09:21:57'),
(1480, 2874, 11, 'Y069XE', 3, 4833, 1, 'receiving', 343, '2022-08-20', 0, '{\"price\":\"4833\",\"qty\":\"3\"}', 'Stock from Receiving-49443321\n', '2021-11-04 09:48:41'),
(1481, 2875, 0, 'Y102XD', 3, 7200, 1, 'receiving', 344, '2022-07-29', 0, '{\"price\":\"7200\",\"qty\":\"3\"}', 'Stock from Receiving-14124772\n', '2021-11-04 10:33:03'),
(1482, 2876, 11, 'Y025X1', 3, 8000, 1, 'receiving', 345, '2022-08-18', 0, '{\"price\":\"8000\",\"qty\":\"3\"}', 'Stock from Receiving-49192184\n', '2021-11-04 10:42:32'),
(1483, 1137, 1, 'BH1011', 10, 100, 2, 'Sales', 614, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-80476093\n', '2021-11-04 11:00:40'),
(1484, 411, 1, 'C3210014', 30, 200, 2, 'Sales', 615, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-40340954\n', '2021-11-04 11:01:30'),
(1485, 176, 2, '2108040', 1, 2000, 2, 'Sales', 616, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-64138457\n', '2021-11-04 11:02:00'),
(1486, 30, 284, '201571', 1, 2500, 2, 'Sales', 617, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-60290730\n', '2021-11-04 11:06:02'),
(1487, 2653, 10, 'CX113', 1, 3500, 2, 'Sales', 618, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-74055413\n', '2021-11-04 11:08:42'),
(1488, 356, 11, 'SBCO26', 1, 2000, 2, 'Sales', 619, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-51344147\n', '2021-11-04 11:09:23'),
(1489, 730, 11, 'LK 1013', 2, 1900, 1, 'receiving', 346, '2023-06-30', 0, '{\"price\":\"1900\",\"qty\":\"2\"}', 'Stock from Receiving-74868289\n', '2021-11-04 11:12:33'),
(1490, 2882, 30, 'T002', 4, 2000, 1, 'receiving', 347, '2023-10-15', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock from Receiving-57420249\n', '2021-11-04 12:15:03'),
(1491, 2528, 30, '1009 2702', 9, 1200, 1, 'receiving', 348, '2022-12-31', 0, '{\"price\":\"1200\",\"qty\":\"9\"}', 'Stock from Receiving-81984539\n', '2021-11-04 12:20:40'),
(1492, 2879, 30, '952-1', 9, 3500, 1, 'receiving', 349, '2024-02-12', 0, '{\"price\":\"3500\",\"qty\":\"9\"}', 'Stock from Receiving-74467696\n', '2021-11-04 13:08:25'),
(1493, 2878, 30, '602-2', 1, 3500, 1, 'receiving', 350, '2023-10-26', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-86170298\n', '2021-11-04 13:14:34'),
(1494, 2880, 30, 'B-2381', 1, 3500, 1, 'receiving', 351, '2023-12-03', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-03597701\n', '2021-11-04 13:16:32'),
(1495, 285, 0, '2105071', 6, 750, 2, 'Sales', 621, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-43848047\n', '2021-11-04 13:30:12'),
(1496, 2696, 115, 'KDM20010', 3, 1000, 2, 'Sales', 622, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-18396811\n', '2021-11-04 13:32:10'),
(1497, 715, 11, 'SBH2100', 1, 2000, 2, 'Sales', 623, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-76680181\n', '2021-11-04 13:33:14'),
(1498, 2714, 2, 'FAZ1KB1', 1, 6000, 2, 'Sales', 624, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-81710600\n', '2021-11-04 13:34:43'),
(1499, 2720, 2, 'PX001', 10, 50, 2, 'Sales', 625, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-53318821\n', '2021-11-04 13:35:43'),
(1500, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 626, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-96269376\n', '2021-11-04 13:36:23'),
(1501, 1223, 2, 'X26E9008', 2, 2000, 2, 'Sales', 627, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-62443612\n', '2021-11-04 14:06:54'),
(1502, 286, 2, '417IA06', 3, 1500, 2, 'Sales', 628, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock out from Sales-94181771\n', '2021-11-04 14:07:46'),
(1503, 2854, 2, '15516100', 14, 1000, 2, 'Sales', 629, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"14\"}', 'Stock out from Sales-90878802\n', '2021-11-04 14:09:02'),
(1504, 821, 2, '89365', 68, 350, 1, 'receiving', 352, '2025-08-31', 0, '{\"price\":\"350\",\"qty\":\"68\"}', 'Stock from Receiving-08428465\n', '2021-11-04 14:14:17'),
(1505, 821, 2, '89365', 28, 600, 2, 'Sales', 630, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"28\"}', 'Stock out from Sales-26593569\n', '2021-11-04 14:15:18'),
(1506, 2698, 11, '20200208', 1, 1000, 2, 'Sales', 631, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-14900870\n', '2021-11-04 14:16:16'),
(1507, 286, 2, '417IA06', 1, 1500, 2, 'Sales', 632, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-68138081\n', '2021-11-04 14:17:06'),
(1508, 1359, 11, '', 1, 3000, 2, 'Sales', 633, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-23934185\n', '2021-11-04 14:17:52'),
(1509, 889, 11, 'PM620021', 84, 100, 2, 'Sales', 634, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"84\"}', 'Stock out from Sales-53363917\n', '2021-11-04 14:18:42'),
(1510, 11, 1, '1E19', 56, 100, 2, 'Sales', 635, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"56\"}', 'Stock out from Sales-63495219\n', '2021-11-04 14:19:28'),
(1511, 1137, 1, 'BH1011', 20, 100, 2, 'Sales', 636, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-39436019\n', '2021-11-04 14:20:51'),
(1512, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 637, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-11613126\n', '2021-11-04 14:21:42'),
(1513, 144, 1, 'BRA03076A', 3, 1000, 2, 'Sales', 638, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-42196319\n', '2021-11-04 14:23:11'),
(1514, 87, 2, '9L104', 30, 150, 2, 'Sales', 639, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock out from Sales-57926410\n', '2021-11-04 14:24:54'),
(1515, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 640, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-66108985\n', '2021-11-04 14:27:47'),
(1516, 2578, 11, '213701', 1, 20000, 2, 'Sales', 641, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-94767972\n', '2021-11-04 14:28:22'),
(1517, 2442, 2, '1C38', 20, 100, 2, 'Sales', 642, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-33558922\n', '2021-11-04 14:29:38'),
(1518, 717, 11, '21014', 1, 2000, 2, 'Sales', 643, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-40149277\n', '2021-11-04 14:30:30'),
(1519, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 644, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-96572109\n', '2021-11-04 14:31:13'),
(1520, 681, 28, 'QD201007', 22, 330, 1, 'receiving', 353, '2023-10-28', 0, '{\"price\":\"330\",\"qty\":\"22\"}', 'Stock from Receiving-40220221\n', '2021-11-04 14:36:19'),
(1521, 681, 28, 'QD201007', 14, 1000, 2, 'Sales', 645, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"14\"}', 'Stock out from Sales-68114295\n', '2021-11-04 14:37:22'),
(1522, 197, 2, '84514', 4, 500, 2, 'Sales', 646, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"4\"}', 'Stock out from Sales-77045214\n', '2021-11-04 14:38:45'),
(1523, 117, 2, 'SKY0180', 5, 400, 2, 'Sales', 647, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-27867150\n', '2021-11-04 14:39:29'),
(1524, 684, 2, 'HH0008', 100, 100, 2, 'Sales', 648, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock out from Sales-44053125\n', '2021-11-04 14:40:08'),
(1525, 1003, 2, '78273', 90, 100, 2, 'Sales', 649, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"90\"}', 'Stock out from Sales-99834714\n', '2021-11-04 14:41:15'),
(1526, 24, 284, '21002', 1, 5000, 2, 'Sales', 650, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-88508642\n', '2021-11-04 16:05:14'),
(1527, 424, 10, 'C135', 1, 2000, 2, 'Sales', 651, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-17640515\n', '2021-11-04 16:06:15'),
(1528, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 652, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-05357657\n', '2021-11-04 16:08:31'),
(1529, 198, 2, '81722', 10, 300, 2, 'Sales', 653, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-86894394\n', '2021-11-04 16:09:05'),
(1530, 75, 1, '1950539', 1, 2000, 2, 'Sales', 654, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-91148195\n', '2021-11-04 16:09:45'),
(1531, 192, 287, '(10) E110', 1, 2000, 2, 'Sales', 655, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-20789158\n', '2021-11-04 16:10:36'),
(1532, 22, 284, 'OG111', 1, 2500, 2, 'Sales', 656, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-36706044\n', '2021-11-04 16:11:59'),
(1533, 71, 284, 'D11120', 1, 4000, 2, 'Sales', 657, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-05412165\n', '2021-11-04 16:12:38'),
(1534, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 658, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-12241377\n', '2021-11-04 16:16:19'),
(1535, 135, 248, 'CB04002', 3, 600, 2, 'Sales', 659, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-21866073\n', '2021-11-04 18:03:56'),
(1536, 286, 2, '417IA06', 7, 1500, 2, 'Sales', 660, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"7\"}', 'Stock out from Sales-36988037\n', '2021-11-04 18:08:15'),
(1537, 116, 2, 'MBCH20005', 5, 300, 2, 'Sales', 661, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-36716922\n', '2021-11-04 18:09:24'),
(1538, 375, 2, 'CA2520003-A', 15, 200, 2, 'Sales', 662, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-85854482\n', '2021-11-04 18:10:47'),
(1539, 2870, 2, 'GD91279', 7, 2000, 2, 'Sales', 663, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"7\"}', 'Stock out from Sales-51531463\n', '2021-11-04 18:38:10'),
(1540, 2848, 18, 'RK02721222 17', 1, 4000, 2, 'Sales', 664, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-69208341\n', '2021-11-04 18:58:45'),
(1541, 6, 2, '2107042', 3, 1000, 2, 'Sales', 665, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-41868545\n', '2021-11-04 18:59:56'),
(1542, 2721, 2, 'Y095UH', 10, 150, 2, 'Sales', 666, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-69835652\n', '2021-11-04 19:00:27'),
(1543, 1328, 30, '350360039300044', 1, 5000, 2, 'Sales', 667, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-36030764\n', '2021-11-04 19:08:38'),
(1544, 378, 2, '87092', 10, 200, 2, 'Sales', 668, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-88703510\n', '2021-11-04 19:14:56'),
(1545, 2515, 11, 'Y046UF', 1, 7000, 2, 'Sales', 669, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-86298969\n', '2021-11-04 19:17:38'),
(1546, 2868, 2, 'EY1003', 30, 400, 2, 'Sales', 670, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"30\"}', 'Stock out from Sales-41593177\n', '2021-11-04 19:47:44'),
(1547, 375, 2, 'CA2520003-A', 10, 200, 2, 'Sales', 671, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-01905744\n', '2021-11-04 19:48:48'),
(1548, 451, 2, 'M2108109', 1, 38000, 2, 'Sales', 672, '0000-00-00', 0, '{\"price\":\"38000\",\"qty\":\"1\"}', 'Stock out from Sales-49445344\n', '2021-11-04 19:49:46'),
(1549, 1453, 11, '50932921-012A', 1, 8000, 2, 'Sales', 673, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-22421101\n', '2021-11-04 19:50:49'),
(1550, 135, 1, 'CB04002', 8, 600, 2, 'Sales', 674, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"8\"}', 'Stock out from Sales-32853285\n', '2021-11-04 20:30:16'),
(1551, 1005, 2, '210721', 15, 100, 2, 'Sales', 675, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-01930693\n', '2021-11-04 20:31:17'),
(1552, 11, 1, '1E19', 30, 100, 2, 'Sales', 676, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-21453500\n', '2021-11-04 20:35:00'),
(1553, 1165, 2, 'D2101257', 3, 1000, 2, 'Sales', 677, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-07482194\n', '2021-11-04 20:36:10'),
(1554, 1290, 11, 'S2016012', 2, 3500, 2, 'Sales', 678, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock out from Sales-46254743\n', '2021-11-04 20:37:24'),
(1555, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 679, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-49239973\n', '2021-11-04 20:38:16'),
(1556, 2722, 292, 'HCG201015', 3, 1000, 2, 'Sales', 680, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-85074344\n', '2021-11-04 20:52:38'),
(1557, 442, 2, 'T0100', 10, 200, 2, 'Sales', 681, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-02026148\n', '2021-11-04 20:53:35'),
(1558, 2776, 2, '362492', 4, 2500, 2, 'Sales', 682, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock out from Sales-15673068\n', '2021-11-04 21:25:20'),
(1559, 2873, 2, 'T0332', 10, 100, 2, 'Sales', 683, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-52870043\n', '2021-11-04 21:27:56'),
(1560, 424, 10, 'C135', 1, 2000, 2, 'Sales', 684, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-99655225\n', '2021-11-04 21:28:51'),
(1561, 2873, 2, 'T0332', 20, 100, 2, 'Sales', 685, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-48023750\n', '2021-11-04 21:39:13'),
(1562, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 686, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-32311395\n', '2021-11-04 21:39:57');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(1563, 2442, 2, '1C38', 10, 100, 2, 'Sales', 687, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-92936934\n', '2021-11-04 21:48:47'),
(1564, 2801, 1, 'CL1042', 5, 200, 2, 'Sales', 688, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-76340603\n', '2021-11-04 21:50:44'),
(1565, 2792, 254, '', 1, 7000, 2, 'Sales', 689, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-75325910\n', '2021-11-04 22:09:13'),
(1566, 2748, 18, '1072008', 1, 1500, 2, 'Sales', 690, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-88365881\n', '2021-11-04 22:09:58'),
(1567, 2760, 18, '190808', 1, 2000, 2, 'Sales', 691, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-70908601\n', '2021-11-04 22:10:54'),
(1568, 2530, 289, 'L11PP', 1, 6000, 2, 'Sales', 692, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-71652992\n', '2021-11-04 22:11:51'),
(1569, 243, 31, '1897', 1, 2500, 2, 'Sales', 693, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-65251253\n', '2021-11-04 23:59:25'),
(1570, 2574, 11, '0000', 1, 5000, 2, 'Sales', 694, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-60015012\n', '2021-11-05 08:08:09'),
(1571, 684, 2, 'HH0014', 400, 28, 1, 'receiving', 354, '2023-11-30', 0, '{\"price\":\"28\",\"qty\":\"400\"}', 'Stock from Receiving-99293027\n', '2021-11-05 10:45:54'),
(1572, 2883, 1, 'CF 1005', 300, 37, 1, 'receiving', 355, '2022-12-31', 0, '{\"price\":\"37\",\"qty\":\"300\"}', 'Stock from Receiving-18888398\n', '2021-11-05 10:49:42'),
(1573, 441, 2, 'CIR20112002', 30, 430, 1, 'receiving', 356, '2023-11-30', 0, '{\"price\":\"430\",\"qty\":\"30\"}', 'Stock from Receiving-50857017\n', '2021-11-05 11:03:43'),
(1574, 700, 2, 'K48', 100, 198, 1, 'receiving', 357, '2023-10-31', 0, '{\"price\":\"198\",\"qty\":\"100\"}', 'Stock from Receiving-57259148\n', '2021-11-05 11:14:29'),
(1575, 2506, 11, 'MO 316', 3, 2800, 1, 'receiving', 358, '2023-07-31', 0, '{\"price\":\"2800\",\"qty\":\"3\"}', 'Stock from Receiving-24044828\n', '2021-11-05 11:18:23'),
(1576, 730, 288, 'LK0007', 4, 1980, 1, 'receiving', 359, '2022-10-31', 0, '{\"price\":\"1980\",\"qty\":\"4\"}', 'Stock from Receiving-74070031\n', '2021-11-05 11:34:20'),
(1577, 107, 43, '10210033', 2, 2985, 1, 'receiving', 360, '2024-12-31', 0, '{\"price\":\"2985\",\"qty\":\"2\"}', 'Stock from Receiving-19694051\n', '2021-11-05 11:41:07'),
(1578, 77, 2, '2106094', 10, 100, 2, 'Sales', 695, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-62045541\n', '2021-11-05 11:47:04'),
(1579, 2873, 2, 'T0332', 10, 100, 2, 'Sales', 696, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-41290530\n', '2021-11-05 11:48:36'),
(1580, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 697, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-58087622\n', '2021-11-05 11:57:39'),
(1581, 2798, 2, 'CA03621', 10, 200, 2, 'Sales', 698, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-14263872\n', '2021-11-05 11:58:28'),
(1582, 111, 2, '210919', 10, 100, 2, 'Sales', 699, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-21173107\n', '2021-11-05 12:00:30'),
(1583, 2879, 30, '952-1', 1, 5000, 2, 'Sales', 700, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-27800888\n', '2021-11-05 12:01:07'),
(1584, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 701, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-09539641\n', '2021-11-05 12:01:51'),
(1585, 2639, 11, '77362', 1, 4000, 2, 'Sales', 702, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-17760342\n', '2021-11-05 12:02:29'),
(1586, 285, 2, '2105071', 6, 750, 2, 'Sales', 703, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-38742727\n', '2021-11-05 12:03:17'),
(1587, 774, 10, '0214A', 12, 5500, 1, 'receiving', 361, '2025-08-31', 0, '{\"price\":\"5500\",\"qty\":\"12\"}', 'Stock from Receiving-90657201\n', '2021-11-05 12:22:27'),
(1588, 774, 10, '0214A', 1, 10000, 2, 'Sales', 705, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-71696105\n', '2021-11-05 12:23:14'),
(1589, 2750, 18, '0100104/TZNG/21', 2, 1000, 2, 'Sales', 706, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-77954248\n', '2021-11-05 12:29:36'),
(1590, 945, 2, '200127', 5, 200, 2, 'Sales', 707, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-66295931\n', '2021-11-05 12:41:33'),
(1591, 858, 2, 'SKU0584', 10, 800, 2, 'Sales', 708, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"10\"}', 'Stock out from Sales-69277153\n', '2021-11-05 12:42:28'),
(1592, 2804, 2, 'PT723', 10, 100, 2, 'Sales', 709, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-44531211\n', '2021-11-05 12:44:01'),
(1593, 2609, 11, '21042', 1, 5000, 2, 'Sales', 710, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-81648618\n', '2021-11-05 12:45:09'),
(1594, 2512, 277, 'Y140XN', 10, 100, 2, 'Sales', 711, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-35540215\n', '2021-11-05 12:45:46'),
(1595, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 712, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-02041559\n', '2021-11-05 12:46:34'),
(1596, 286, 2, '417IA06', 6, 1500, 2, 'Sales', 713, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"6\"}', 'Stock out from Sales-08388334\n', '2021-11-05 12:47:57'),
(1597, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 714, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-06208066\n', '2021-11-05 12:48:49'),
(1598, 2864, 115, 'WO783', 10, 600, 2, 'Sales', 715, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock out from Sales-92378127\n', '2021-11-05 12:49:43'),
(1599, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 716, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-22328096\n', '2021-11-05 12:52:48'),
(1600, 117, 2, 'SKY0180', 10, 400, 2, 'Sales', 718, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-84602233\n', '2021-11-05 12:55:03'),
(1601, 2428, 11, 'KS0004', 1, 4000, 2, 'Sales', 719, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-41427648\n', '2021-11-05 15:34:20'),
(1602, 2722, 292, '20210311', 81, 270, 1, 'receiving', 362, '2024-03-24', 0, '{\"price\":\"270\",\"qty\":\"81\"}', 'Stock from Receiving-40944632\n', '2021-11-05 15:42:51'),
(1603, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 720, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-54498516\n', '2021-11-05 15:44:28'),
(1604, 405, 28, '1341Z046', 3, 2500, 2, 'Sales', 721, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"3\"}', 'Stock out from Sales-35703236\n', '2021-11-05 15:45:16'),
(1605, 2442, 2, '1C38', 10, 100, 2, 'Sales', 722, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-71212722\n', '2021-11-05 15:45:57'),
(1606, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 723, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-51558985\n', '2021-11-05 15:47:12'),
(1607, 2798, 1, 'CA03621', 10, 200, 2, 'Sales', 724, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-09458398\n', '2021-11-05 15:48:13'),
(1608, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 725, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-68810766\n', '2021-11-05 15:57:43'),
(1609, 285, 2, '2105071', 6, 750, 2, 'Sales', 726, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-53702564\n', '2021-11-05 15:58:20'),
(1610, 2852, 18, '2001721616', 1, 3500, 2, 'Sales', 727, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-97135541\n', '2021-11-05 16:00:47'),
(1611, 1568, 282, 'CN123V', 1, 3500, 2, 'Sales', 728, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-02170942\n', '2021-11-05 16:01:32'),
(1612, 274, 2, 'S7338001', 14, 100, 2, 'Sales', 729, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"14\"}', 'Stock out from Sales-49992943\n', '2021-11-05 16:02:04'),
(1613, 2465, 2, 'ST.335', 10, 100, 2, 'Sales', 730, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-75123222\n', '2021-11-05 17:31:58'),
(1614, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 731, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-48383014\n', '2021-11-05 17:40:01'),
(1615, 2798, 1, 'CA03621', 15, 200, 2, 'Sales', 732, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-66237733\n', '2021-11-05 18:30:49'),
(1616, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 733, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-65276851\n', '2021-11-05 18:31:29'),
(1617, 285, 2, '2105071', 6, 750, 2, 'Sales', 734, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-68150200\n', '2021-11-05 18:32:21'),
(1618, 2779, 2, '050G020', 3, 1300, 2, 'Sales', 735, '0000-00-00', 0, '{\"price\":\"1300\",\"qty\":\"3\"}', 'Stock out from Sales-28218996\n', '2021-11-05 18:36:06'),
(1619, 861, 2, 'BRA08192A', 60, 800, 2, 'Sales', 736, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"60\"}', 'Stock out from Sales-41070086\n', '2021-11-05 18:38:40'),
(1620, 2519, 1, '1C14B1', 30, 500, 2, 'Sales', 737, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-65098381\n', '2021-11-05 18:39:37'),
(1621, 77, 2, '2106094', 10, 100, 2, 'Sales', 738, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-08230778\n', '2021-11-05 18:40:30'),
(1622, 2723, 115, 'L2001', 2, 500, 2, 'Sales', 739, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-64396235\n', '2021-11-05 18:41:07'),
(1623, 2866, 284, 'T24', 1, 6000, 2, 'Sales', 740, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-33154764\n', '2021-11-05 19:08:00'),
(1624, 938, 2, 'G004732', 10, 100, 2, 'Sales', 741, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68966619\n', '2021-11-05 19:25:36'),
(1625, 1488, 11, '1821', 1, 1000, 2, 'Sales', 742, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-94210403\n', '2021-11-05 19:26:23'),
(1626, 6, 2, '2107042', 1, 1000, 2, 'Sales', 743, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-13079295\n', '2021-11-05 19:36:19'),
(1627, 2607, 2, '2102022', 1, 5000, 2, 'Sales', 744, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-95101215\n', '2021-11-05 19:52:02'),
(1628, 700, 2, 'K48', 10, 400, 2, 'Sales', 745, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-08750948\n', '2021-11-05 19:57:08'),
(1629, 2499, 11, 'LB20004', 9, 0, 1, 'reconciliation', 9, '0000-00-00', 0, '{\"price\":\"\",\"qty\":9}', 'Stock from Reconciliation', '2021-11-05 21:17:41'),
(1630, 2578, 11, '213701', 1, 20000, 2, 'Sales', 746, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-86075126\n', '2021-11-05 21:39:37'),
(1631, 2849, 18, '10803A', 10, 5000, 1, 'receiving', 363, '2023-02-03', 0, '{\"price\":\"5000\",\"qty\":\"10\"}', 'Stock from Receiving-08862484\n', '2021-11-05 21:41:42'),
(1632, 2849, 18, '10803A', 3, 1000, 2, 'Sales', 747, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-00569384\n', '2021-11-05 21:43:52'),
(1633, 2451, 135, '0201652', 4, 6500, 1, 'receiving', 364, '2022-02-28', 0, '{\"price\":\"6500\",\"qty\":\"4\"}', 'Stock from Receiving-32735303\n', '2021-11-05 21:59:48'),
(1634, 2451, 135, '0201652', 1, 10000, 2, 'Sales', 748, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-67053510\n', '2021-11-05 22:01:33'),
(1635, 2451, 135, '0201652', 1, 0, 1, 'reconciliation', 10, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-05 22:02:38'),
(1636, 2866, 284, 'T24', 1, 6000, 2, 'Sales', 749, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-93758477\n', '2021-11-05 22:05:28'),
(1637, 2884, 43, '21002', 8, 3500, 1, 'receiving', 365, '2024-07-03', 0, '{\"price\":\"3500\",\"qty\":\"8\"}', 'Stock from Receiving-61665106\n', '2021-11-05 22:12:28'),
(1638, 214, 2, '164F1', 130, 70, 1, 'receiving', 366, '2024-06-30', 0, '{\"price\":\"70\",\"qty\":\"130\"}', 'Stock from Receiving-05084255\n', '2021-11-05 22:19:11'),
(1639, 214, 2, '164F1', 30, 150, 2, 'Sales', 750, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock out from Sales-36053831\n', '2021-11-05 22:21:10'),
(1640, 825, 2, 'B6FOT005', 471, 230, 1, 'receiving', 367, '2023-10-31', 0, '{\"price\":\"230\",\"qty\":\"471\"}', 'Stock from Receiving-66030831\n', '2021-11-05 22:25:18'),
(1641, 825, 2, 'B6FOT005', 30, 500, 2, 'Sales', 751, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-38011889\n', '2021-11-05 22:25:48'),
(1642, 1252, 2, 'ET.339', 1200, 35, 1, 'receiving', 368, '2023-06-30', 0, '{\"price\":\"35\",\"qty\":\"1200\"}', 'Stock from Receiving-30512940\n', '2021-11-05 22:37:02'),
(1644, 1252, 2, 'ET.339', 980, 0, 2, 'reconciliation', 11, '0000-00-00', 0, '{\"price\":\"\",\"qty\":980}', 'Stock from Reconciliation', '2021-11-05 22:55:30'),
(1645, 1252, 2, 'ET.339', 20, 100, 2, 'Sales', 753, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-80849112\n', '2021-11-05 22:56:09'),
(1646, 2885, 18, 'l29191102', 4, 650, 1, 'receiving', 369, '2024-10-31', 0, '{\"price\":\"650\",\"qty\":\"4\"}', 'Stock from Receiving-81142671\n', '2021-11-05 22:57:29'),
(1647, 2885, 18, 'l29191102', 1, 1000, 2, 'Sales', 754, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-10372759\n', '2021-11-05 22:58:52'),
(1648, 2885, 18, 'l29191102', 1, 0, 1, 'reconciliation', 12, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-05 23:00:15'),
(1649, 2786, 31, 'M003', 4, 0, 1, 'reconciliation', 13, '0000-00-00', 0, '{\"price\":\"\",\"qty\":4}', 'Stock from Reconciliation', '2021-11-05 23:05:20'),
(1650, 2491, 10, '2107', 4, 3500, 1, 'receiving', 370, '2024-03-01', 0, '{\"price\":\"3500\",\"qty\":\"4\"}', 'Stock from Receiving-15153604\n', '2021-11-05 23:09:27'),
(1651, 2491, 10, '2107', 1, 5000, 2, 'Sales', 755, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-49226892\n', '2021-11-05 23:10:02'),
(1652, 30, 284, '201571', 1, 2500, 2, 'Sales', 756, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-57299735\n', '2021-11-05 23:13:53'),
(1653, 2532, 289, '0000-000', 2, 3500, 1, 'receiving', 371, '2023-11-30', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-19963234\n', '2021-11-05 23:16:27'),
(1654, 2532, 289, '0000-000', 1, 5000, 2, 'Sales', 757, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-22117383\n', '2021-11-05 23:16:44'),
(1655, 2532, 289, '0000-000', 1, 0, 2, 'reconciliation', 14, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-05 23:17:18'),
(1656, 1, 2, '2103004', 2, 2000, 2, 'Sales', 758, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-13730750\n', '2021-11-05 23:24:24'),
(1657, 111, 2, '210919', 10, 100, 2, 'Sales', 759, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-06243658\n', '2021-11-05 23:27:12'),
(1658, 1497, 282, '83220495', 1, 5000, 2, 'Sales', 760, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-26479627\n', '2021-11-05 23:32:48'),
(1659, 1497, 282, '83220495', 1, 0, 1, 'reconciliation', 15, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-05 23:33:11'),
(1660, 2838, 18, '0000', 1, 10000, 2, 'Sales', 761, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-33360800\n', '2021-11-05 23:51:24'),
(1661, 1530, 11, '00-990', 2, 3500, 1, 'receiving', 372, '2023-11-30', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-36794429\n', '2021-11-05 23:53:56'),
(1662, 1530, 11, '', 2, 6000, 2, 'Sales', 762, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"2\"}', 'Stock out from Sales-20664029\n', '2021-11-05 23:54:19'),
(1663, 1416, 18, '00-0000', 12, 650, 1, 'receiving', 373, '2023-11-30', 0, '{\"price\":\"650\",\"qty\":\"12\"}', 'Stock from Receiving-33339375\n', '2021-11-05 23:59:08'),
(1664, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 763, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-87370956\n', '2021-11-05 23:59:51'),
(1665, 2615, 11, '210880', 1, 4000, 2, 'Sales', 764, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-20674639\n', '2021-11-06 06:35:00'),
(1666, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 765, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-44065170\n', '2021-11-06 06:36:12'),
(1667, 1200, 2, '2002979', 1, 2000, 2, 'Sales', 766, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-40685581\n', '2021-11-06 06:36:56'),
(1668, 2776, 2, '362492', 1, 2500, 2, 'Sales', 767, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-78627827\n', '2021-11-06 06:37:26'),
(1669, 2746, 18, '20201114', 1, 500, 2, 'Sales', 768, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-91667811\n', '2021-11-06 06:38:14'),
(1670, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 769, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-37653436\n', '2021-11-06 06:39:05'),
(1671, 2801, 1, 'CL1042', 10, 200, 2, 'Sales', 770, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-27167117\n', '2021-11-06 06:39:47'),
(1672, 717, 11, '21023', 1, 2000, 2, 'Sales', 771, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-23892167\n', '2021-11-06 06:40:24'),
(1673, 1398, 30, '0508215202', 1, 2500, 2, 'Sales', 772, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-45946744\n', '2021-11-06 06:41:02'),
(1674, 1415, 30, '0000', 1, 3000, 2, 'Sales', 773, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-04746014\n', '2021-11-06 06:42:31'),
(1675, 2578, 11, '213701', 1, 20000, 2, 'Sales', 774, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-08433710\n', '2021-11-06 06:44:53'),
(1676, 2578, 11, '213701', 1, 20000, 2, 'Sales', 775, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-28543727\n', '2021-11-06 06:45:15'),
(1677, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 776, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-13928574\n', '2021-11-06 06:45:48'),
(1678, 121, 2, '0004', 20, 200, 2, 'Sales', 777, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-13866697\n', '2021-11-06 06:47:25'),
(1679, 2710, 1, '1D23C1', 5, 600, 2, 'Sales', 778, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"5\"}', 'Stock out from Sales-89092771\n', '2021-11-06 06:47:50'),
(1680, 2848, 281, 'RK02721222 17', 2, 4000, 2, 'Sales', 779, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock out from Sales-70275143\n', '2021-11-06 06:49:03'),
(1681, 6, 2, '2107042', 1, 1000, 2, 'Sales', 780, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-87323525\n', '2021-11-06 06:49:39'),
(1682, 993, 2, 'Y0B3UL', 10, 150, 2, 'Sales', 781, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-32992323\n', '2021-11-06 06:50:15'),
(1683, 1386, 30, 'TTF8015E', 1, 3500, 2, 'Sales', 782, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-40421322\n', '2021-11-06 06:50:47'),
(1684, 2640, 11, 'EMPL204134', 1, 4000, 2, 'Sales', 783, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-61815360\n', '2021-11-06 06:51:19'),
(1685, 730, 11, 'LK0007', 1, 3500, 2, 'Sales', 784, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-82159782\n', '2021-11-06 06:51:58'),
(1686, 2849, 18, '', 7, 1000, 2, 'Sales', 785, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"7\"}', 'Stock out from Sales-52429539\n', '2021-11-06 06:53:08'),
(1687, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 786, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-98152671\n', '2021-11-06 06:54:22'),
(1688, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 787, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-73895820\n', '2021-11-06 08:28:13'),
(1689, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 788, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-07214368\n', '2021-11-06 10:29:29'),
(1690, 2578, 11, '213701', 1, 20000, 2, 'Sales', 789, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-29102392\n', '2021-11-06 10:30:15'),
(1691, 2794, 288, '21015', 1, 2000, 2, 'Sales', 790, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-87953924\n', '2021-11-06 10:31:15'),
(1692, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 791, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-48687976\n', '2021-11-06 10:32:09'),
(1693, 405, 28, '1341Z046', 2, 2500, 2, 'Sales', 792, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock out from Sales-71225263\n', '2021-11-06 10:32:49'),
(1694, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 793, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-73034850\n', '2021-11-06 10:33:48'),
(1695, 2705, 10, '1131', 1, 10000, 2, 'Sales', 794, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-33138991\n', '2021-11-06 10:40:09'),
(1696, 2512, 2, 'Y140XN', 5, 100, 2, 'Sales', 795, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-65320977\n', '2021-11-06 10:40:50'),
(1697, 649, 1, 'FU0010', 5, 1000, 2, 'Sales', 796, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock out from Sales-22461876\n', '2021-11-06 12:54:26'),
(1698, 2883, 1, 'CF 1005', 30, 100, 2, 'Sales', 797, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-63626968\n', '2021-11-06 12:55:24'),
(1699, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 798, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-15059353\n', '2021-11-06 12:57:17'),
(1700, 1029, 2, '211056', 20, 100, 2, 'Sales', 799, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-10773718\n', '2021-11-06 12:58:44'),
(1701, 1546, 30, '', 1, 12000, 2, 'Sales', 800, '0000-00-00', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock out from Sales-53222710\n', '2021-11-06 12:59:42'),
(1702, 2675, 11, '47', 1, 3500, 2, 'Sales', 801, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-20674405\n', '2021-11-06 18:14:02'),
(1703, 2529, 289, 'L4PP', 1, 3000, 2, 'Sales', 802, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-07395179\n', '2021-11-06 18:16:33'),
(1704, 2660, 11, 'SCD2007009', 1, 5000, 2, 'Sales', 803, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-09531323\n', '2021-11-06 18:35:43'),
(1705, 1332, 30, 'TMC19-001', 1, 3500, 2, 'Sales', 804, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-95880505\n', '2021-11-06 18:38:52'),
(1706, 1569, 282, '0333TH112N', 5, 2000, 1, 'receiving', 374, '2023-11-30', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock from Receiving-86046046\n', '2021-11-06 18:41:49'),
(1707, 1569, 282, '0333TH112N', 1, 3500, 2, 'Sales', 805, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-76515449\n', '2021-11-06 18:43:50'),
(1708, 123, 288, '2105134', 1, 2000, 2, 'Sales', 806, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-57210891\n', '2021-11-06 18:45:17'),
(1709, 968, 27, '2011045', 2, 500, 2, 'Sales', 807, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-58555961\n', '2021-11-06 18:46:32'),
(1710, 1, 2, '3106023', 1, 2000, 2, 'Sales', 808, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-90091052\n', '2021-11-06 18:51:04'),
(1711, 180, 2, 'AR015G', 10, 150, 2, 'Sales', 809, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-63036293\n', '2021-11-06 18:51:52'),
(1712, 2762, 2, 'NR00648A', 2, 5000, 2, 'Sales', 810, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-62273199\n', '2021-11-06 18:52:28'),
(1713, 116, 2, '', 10, 300, 2, 'Sales', 811, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-63662535\n', '2021-11-06 19:31:28'),
(1714, 633, 2, 'DY1719', 5, 1000, 2, 'Sales', 812, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock out from Sales-34781537\n', '2021-11-06 19:32:32'),
(1715, 442, 2, 'T0100', 10, 200, 2, 'Sales', 813, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-38017967\n', '2021-11-06 19:50:18'),
(1716, 1104, 11, '10712', 1, 25000, 2, 'Sales', 814, '0000-00-00', 0, '{\"price\":\"25000\",\"qty\":\"1\"}', 'Stock out from Sales-14036248\n', '2021-11-06 20:00:52'),
(1717, 1385, 30, 'FDM25', 1, 3500, 2, 'Sales', 815, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-24840399\n', '2021-11-06 20:03:11'),
(1718, 123, 288, '', 1, 2000, 2, 'Sales', 816, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-04753661\n', '2021-11-06 20:04:14'),
(1719, 208, 2, '10G0028', 10, 100, 2, 'Sales', 817, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-16089235\n', '2021-11-06 20:04:52'),
(1720, 65, 287, '2707021', 1, 4000, 2, 'Sales', 818, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-97660224\n', '2021-11-06 20:06:03'),
(1721, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 819, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-68989777\n', '2021-11-06 20:06:42'),
(1722, 2885, 18, 'l29191102', 1, 1000, 2, 'Sales', 820, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-17985892\n', '2021-11-06 20:48:32'),
(1723, 2885, 18, 'l29191102', 1, 1000, 2, 'Sales', 821, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-56092010\n', '2021-11-06 20:52:28'),
(1724, 1511, 11, '656390', 1, 0, 1, 'reconciliation', 16, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-06 21:25:37'),
(1725, 93, 2, 'HR1003', 270, 45, 1, 'receiving', 375, '2024-04-30', 0, '{\"price\":\"45\",\"qty\":\"270\"}', 'Stock from Receiving-08459957\n', '2021-11-06 22:08:24'),
(1726, 93, 2, 'HR1003', 20, 100, 2, 'Sales', 822, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-49023106\n', '2021-11-06 22:09:12'),
(1727, 93, 2, 'HR1003', 20, 0, 1, 'reconciliation', 17, '0000-00-00', 0, '{\"price\":\"\",\"qty\":20}', 'Stock from Reconciliation', '2021-11-06 22:12:55'),
(1728, 1373, 18, '144E05', 7, 3500, 1, 'receiving', 376, '2024-05-31', 0, '{\"price\":\"3500\",\"qty\":\"7\"}', 'Stock from Receiving-35796938\n', '2021-11-06 22:17:12'),
(1729, 1373, 18, '144E05', 1, 6000, 2, 'Sales', 823, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-42711317\n', '2021-11-06 22:18:01'),
(1730, 50, 287, '21001', 1, 2000, 2, 'Sales', 824, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-84257378\n', '2021-11-06 22:23:08'),
(1731, 61, 284, 'DCC013', 1, 2000, 2, 'Sales', 825, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-57490205\n', '2021-11-06 22:27:44'),
(1732, 65, 287, '2707021', 1, 4000, 2, 'Sales', 826, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-11589024\n', '2021-11-06 22:29:56'),
(1733, 2736, 18, '20200507', 1, 3500, 2, 'Sales', 827, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-82436559\n', '2021-11-06 22:39:47'),
(1734, 163, 2, '2001060', 3, 200, 2, 'Sales', 828, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"3\"}', 'Stock out from Sales-13481035\n', '2021-11-06 22:41:06'),
(1735, 2599, 287, '', 1, 2000, 2, 'Sales', 829, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-74173944\n', '2021-11-06 22:42:15'),
(1736, 2599, 287, '2011010', 1, 2000, 1, 'receiving', 377, '2023-10-31', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock from Receiving-40375586\n', '2021-11-06 22:45:32'),
(1737, 42, 27, 'Y094XC', 2, 500, 2, 'Sales', 830, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-41454181\n', '2021-11-06 22:46:46'),
(1738, 2886, 18, '2004951322', 4, 550, 1, 'receiving', 378, '2025-03-31', 0, '{\"price\":\"550\",\"qty\":\"4\"}', 'Stock from Receiving-71997143\n', '2021-11-06 22:56:30'),
(1739, 2886, 18, '2004951322', 1, 1000, 2, 'Sales', 831, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-60488343\n', '2021-11-06 22:58:18'),
(1740, 2710, 1, '1D23C1', 5, 600, 2, 'Sales', 832, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"5\"}', 'Stock out from Sales-89316674\n', '2021-11-06 23:59:41'),
(1741, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 833, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-13137873\n', '2021-11-07 00:00:50'),
(1742, 2803, 2, 'NFSIG907E', 6, 1800, 2, 'Sales', 834, '0000-00-00', 0, '{\"price\":\"1800\",\"qty\":\"6\"}', 'Stock out from Sales-37533643\n', '2021-11-07 00:02:29'),
(1743, 2721, 2, 'Y095UH', 10, 150, 2, 'Sales', 835, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-99831433\n', '2021-11-07 00:03:20'),
(1744, 1415, 30, '0000', 1, 3000, 2, 'Sales', 836, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-67704693\n', '2021-11-07 00:04:55'),
(1745, 1333, 30, '2804T3', 1, 2500, 2, 'Sales', 837, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-71004858\n', '2021-11-07 00:06:31'),
(1746, 1458, 289, '', 1, 12000, 2, 'Sales', 838, '0000-00-00', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock out from Sales-19666063\n', '2021-11-07 00:07:28'),
(1747, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 839, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-80190133\n', '2021-11-07 00:08:25'),
(1748, 6, 2, '2107042', 1, 1000, 2, 'Sales', 840, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-07598223\n', '2021-11-07 00:09:02'),
(1749, 2720, 2, 'PX001', 20, 50, 2, 'Sales', 841, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-95704079\n', '2021-11-07 00:09:59'),
(1750, 208, 2, '10G0028', 10, 100, 2, 'Sales', 842, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-89261531\n', '2021-11-07 00:10:56'),
(1751, 2829, 10, '328', 1, 15000, 2, 'Sales', 843, '0000-00-00', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock out from Sales-85649924\n', '2021-11-07 00:11:37'),
(1752, 243, 31, '1897', 1, 2500, 2, 'Sales', 844, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-41077040\n', '2021-11-07 00:14:52'),
(1753, 2674, 11, '0000', 1, 2000, 2, 'Sales', 845, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-64800576\n', '2021-11-07 00:20:24'),
(1754, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 846, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-41529222\n', '2021-11-07 09:36:29'),
(1755, 968, 16, '2011045', 2, 500, 2, 'Sales', 847, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-73948797\n', '2021-11-07 09:44:10'),
(1756, 962, 1, 'OP20029', 10, 100, 2, 'Sales', 848, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-01259975\n', '2021-11-07 09:54:23'),
(1757, 2852, 18, '2001721616', 2, 3500, 2, 'Sales', 849, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock out from Sales-17572081\n', '2021-11-07 09:54:58'),
(1758, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 850, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-08744967\n', '2021-11-07 09:55:34'),
(1759, 17, 2, '85004', 10, 200, 2, 'Sales', 851, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-23253187\n', '2021-11-07 09:56:37'),
(1760, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 852, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-37656193\n', '2021-11-07 09:57:17'),
(1761, 2640, 11, '', 1, 4000, 2, 'Sales', 853, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-51298218\n', '2021-11-07 09:59:14'),
(1762, 14, 2, '1A27', 5, 200, 2, 'Sales', 854, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-38738389\n', '2021-11-07 16:53:53'),
(1763, 2458, 11, '10210690', 1, 3500, 2, 'Sales', 855, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-62527322\n', '2021-11-07 16:54:42'),
(1764, 2776, 2, '362492', 4, 2500, 2, 'Sales', 856, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock out from Sales-82560802\n', '2021-11-07 16:55:17'),
(1765, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 857, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-58486621\n', '2021-11-07 16:55:56'),
(1766, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 858, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-95793058\n', '2021-11-07 17:08:36'),
(1767, 990, 2, 'PSM20131-40A', 5, 400, 2, 'Sales', 859, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-72981615\n', '2021-11-07 17:09:23'),
(1768, 607, 2, 'EK21009', 10, 200, 2, 'Sales', 860, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-71948264\n', '2021-11-07 17:10:08'),
(1769, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 861, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-41509709\n', '2021-11-07 17:10:59'),
(1770, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 862, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-13282976\n', '2021-11-07 17:14:21'),
(1771, 889, 2, 'PM620021', 20, 100, 2, 'Sales', 863, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-67078565\n', '2021-11-07 17:14:54'),
(1772, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 864, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-87657535\n', '2021-11-07 17:16:00'),
(1773, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 865, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-50357741\n', '2021-11-07 17:16:44'),
(1774, 723, 2, '210735', 10, 300, 2, 'Sales', 866, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-54448937\n', '2021-11-07 17:17:17'),
(1775, 161, 11, 'LW0011', 1, 3500, 2, 'Sales', 867, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-61513694\n', '2021-11-07 17:18:05'),
(1776, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 868, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-40653103\n', '2021-11-07 17:25:40'),
(1777, 163, 2, '2001060', 5, 200, 2, 'Sales', 869, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-58084764\n', '2021-11-07 17:26:28'),
(1778, 1121, 11, '1A10478', 1, 2000, 2, 'Sales', 870, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-52719182\n', '2021-11-07 17:28:43'),
(1779, 2880, 30, '', 1, 5000, 2, 'Sales', 871, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-81385459\n', '2021-11-07 17:29:13'),
(1780, 2750, 18, '0100104/TZNG/21', 3, 1000, 2, 'Sales', 872, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-65834411\n', '2021-11-07 17:29:58'),
(1781, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 873, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-45902462\n', '2021-11-07 17:30:56'),
(1782, 2722, 292, 'HCG201015', 2, 1000, 2, 'Sales', 874, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-20486233\n', '2021-11-07 17:31:39'),
(1783, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 875, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-19434035\n', '2021-11-07 17:32:36'),
(1784, 2884, 43, '21002', 1, 6000, 2, 'Sales', 876, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-71784044\n', '2021-11-07 17:33:13'),
(1785, 2852, 18, '2001721616', 2, 3500, 2, 'Sales', 877, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock out from Sales-29359830\n', '2021-11-07 17:34:22'),
(1786, 730, 11, 'LK0007', 1, 3500, 2, 'Sales', 878, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-03802318\n', '2021-11-07 17:34:58'),
(1787, 2617, 11, '', 1, 4000, 2, 'Sales', 879, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-98180448\n', '2021-11-07 17:35:29'),
(1788, 607, 277, 'EK21009', 5, 200, 2, 'Sales', 880, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-38901611\n', '2021-11-07 17:36:07'),
(1789, 2697, 1, '2010063', 5, 200, 2, 'Sales', 881, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-28890765\n', '2021-11-07 17:58:17'),
(1790, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 882, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-18377740\n', '2021-11-07 17:58:54'),
(1791, 2597, 2, '', 1, 2000, 2, 'Sales', 883, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-28446937\n', '2021-11-07 17:59:39'),
(1792, 2746, 18, '20201114', 1, 500, 2, 'Sales', 884, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-06727674\n', '2021-11-07 18:00:23'),
(1793, 93, 2, 'HR1003', 5, 100, 2, 'Sales', 885, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-31981357\n', '2021-11-07 18:06:16'),
(1794, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 886, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-38208368\n', '2021-11-07 18:06:51'),
(1795, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 887, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-93524993\n', '2021-11-07 18:20:16'),
(1796, 2850, 2, 'SR1013', 30, 50, 2, 'Sales', 888, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"30\"}', 'Stock out from Sales-23581794\n', '2021-11-07 19:00:34'),
(1797, 2720, 2, 'PX001', 20, 50, 2, 'Sales', 889, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-28032955\n', '2021-11-07 19:02:08'),
(1798, 2621, 11, 'SK301', 1, 3500, 2, 'Sales', 890, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-71276753\n', '2021-11-07 19:03:30'),
(1799, 2639, 11, '', 1, 3500, 2, 'Sales', 891, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-23890589\n', '2021-11-07 19:06:11'),
(1800, 2886, 18, '2004951322', 1, 1000, 2, 'Sales', 892, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-97737457\n', '2021-11-07 19:25:21'),
(1801, 77, 2, '2106094', 10, 100, 2, 'Sales', 893, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-40313136\n', '2021-11-07 19:26:07'),
(1802, 2621, 11, '', 1, 3500, 2, 'Sales', 894, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-24589260\n', '2021-11-07 19:26:39'),
(1803, 2720, 2, '', 20, 50, 2, 'Sales', 895, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-67733948\n', '2021-11-07 19:27:45'),
(1804, 2849, 18, '10803A', 43, 550, 1, 'receiving', 379, '2023-02-03', 0, '{\"price\":\"550\",\"qty\":\"43\"}', 'Stock from Receiving-77013736\n', '2021-11-07 19:30:23'),
(1805, 1516, 11, '28425-01', 5, 3500, 1, 'receiving', 380, '2023-12-05', 0, '{\"price\":\"3500\",\"qty\":\"5\"}', 'Stock from Receiving-14392645\n', '2021-11-07 19:33:48'),
(1806, 1516, 11, '28425-01', 1, 5000, 2, 'Sales', 896, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-66893744\n', '2021-11-07 19:34:02'),
(1807, 2863, 11, '10821JU009BM', 2, 6500, 1, 'receiving', 381, '2024-07-31', 0, '{\"price\":\"6500\",\"qty\":\"2\"}', 'Stock from Receiving-54274374\n', '2021-11-07 19:38:17'),
(1808, 2863, 11, '10821JU009BM', 1, 10000, 2, 'Sales', 897, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-98415016\n', '2021-11-07 19:38:29'),
(1809, 2880, 30, '90999-99', 11, 3500, 1, 'receiving', 382, '2025-11-30', 0, '{\"price\":\"3500\",\"qty\":\"11\"}', 'Stock from Receiving-85741132\n', '2021-11-07 19:42:27'),
(1810, 2880, 30, '90999-99', 1, 5000, 2, 'Sales', 898, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-62307488\n', '2021-11-07 19:42:46'),
(1811, 694, 2, 'P80672', 10, 1000, 2, 'Sales', 899, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-91158154\n', '2021-11-07 19:45:36'),
(1812, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 900, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-64080781\n', '2021-11-07 19:55:20'),
(1813, 9, 2, '', 1, 5000, 2, 'Sales', 901, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-18334574\n', '2021-11-07 21:09:40'),
(1814, 286, 2, '417IA06', 6, 1500, 2, 'Sales', 902, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"6\"}', 'Stock out from Sales-98138838\n', '2021-11-07 21:16:32'),
(1815, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 902, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-98138838\n', '2021-11-07 21:16:32'),
(1816, 46, 11, '', 2, 3000, 2, 'Sales', 902, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock out from Sales-98138838\n', '2021-11-07 21:16:32'),
(1817, 2530, 289, 'L11PP', 1, 6000, 2, 'Sales', 902, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-98138838\n', '2021-11-07 21:16:32'),
(1818, 2791, 11, '1C71', 1, 2000, 2, 'Sales', 902, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-98138838\n', '2021-11-07 21:16:32'),
(1819, 2653, 284, 'CX113', 1, 3500, 2, 'Sales', 903, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-79388686\n', '2021-11-07 21:51:27'),
(1820, 2742, 18, '20200818', 1, 6000, 2, 'Sales', 904, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-87552025\n', '2021-11-07 21:52:15'),
(1821, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 905, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-81056272\n', '2021-11-07 21:57:32'),
(1822, 2773, 2, 'KA03237', 1, 3000, 2, 'Sales', 906, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-55667587\n', '2021-11-08 07:51:28'),
(1823, 1333, 30, '2804T3', 1, 2500, 2, 'Sales', 907, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-23058638\n', '2021-11-08 07:54:22'),
(1824, 235, 11, '1D86', 1, 3500, 2, 'Sales', 908, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-94872109\n', '2021-11-08 07:59:55'),
(1825, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 909, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-34292653\n', '2021-11-08 08:00:46'),
(1826, 2798, 1, 'CA03621', 10, 200, 2, 'Sales', 910, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-22956152\n', '2021-11-08 12:55:39'),
(1827, 442, 2, 'T0100', 10, 200, 2, 'Sales', 911, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-29311787\n', '2021-11-08 12:56:14'),
(1828, 285, 2, '2105071', 18, 750, 2, 'Sales', 912, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"18\"}', 'Stock out from Sales-75725992\n', '2021-11-08 12:57:24'),
(1829, 108, 1, 'EPRH0761', 10, 100, 2, 'Sales', 913, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-91347518\n', '2021-11-08 12:57:51'),
(1830, 2867, 10, 'G13921', 1, 6000, 2, 'Sales', 914, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-02890854\n', '2021-11-08 12:58:38'),
(1831, 1003, 2, '78273', 180, 100, 2, 'Sales', 915, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"180\"}', 'Stock out from Sales-57412244\n', '2021-11-08 12:59:41'),
(1832, 285, 2, '2105071', 6, 750, 2, 'Sales', 916, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-58761177\n', '2021-11-08 13:00:52'),
(1833, 1467, 30, '339', 1, 4500, 2, 'Sales', 917, '0000-00-00', 0, '{\"price\":\"4500\",\"qty\":\"1\"}', 'Stock out from Sales-16551059\n', '2021-11-08 13:01:51'),
(1834, 235, 11, '1D86', 1, 3500, 2, 'Sales', 918, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-77202851\n', '2021-11-08 13:03:23'),
(1835, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 919, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-79984160\n', '2021-11-08 13:04:04'),
(1836, 1003, 2, '78273', 100, 100, 2, 'Sales', 920, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock out from Sales-79094834\n', '2021-11-08 13:07:53'),
(1837, 1, 2, '3106023', 1, 2000, 2, 'Sales', 921, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-16566972\n', '2021-11-08 13:08:34'),
(1838, 1340, 282, '10022020', 1, 5000, 2, 'Sales', 922, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-47905996\n', '2021-11-08 13:09:31'),
(1839, 2854, 2, '15516100', 30, 1000, 2, 'Sales', 923, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"30\"}', 'Stock out from Sales-58325970\n', '2021-11-08 13:10:54'),
(1840, 6, 2, '2107042', 2, 1000, 2, 'Sales', 924, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-47375303\n', '2021-11-08 13:12:19'),
(1841, 2578, 11, '213701', 3, 20000, 2, 'Sales', 925, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"3\"}', 'Stock out from Sales-21827458\n', '2021-11-08 13:13:08'),
(1842, 1269, 2, '2105098', 30, 200, 2, 'Sales', 926, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-31283193\n', '2021-11-08 13:16:21'),
(1843, 2869, 28, 'NL130002', 1, 2500, 2, 'Sales', 927, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-74505038\n', '2021-11-08 13:17:20'),
(1844, 2746, 18, '20201114', 1, 500, 2, 'Sales', 928, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-30045460\n', '2021-11-08 13:18:53'),
(1845, 1223, 2, 'X26E9008', 3, 2000, 2, 'Sales', 929, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock out from Sales-89256427\n', '2021-11-08 13:19:40'),
(1846, 723, 2, '210735', 6, 300, 2, 'Sales', 930, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"6\"}', 'Stock out from Sales-22225007\n', '2021-11-08 13:20:24'),
(1847, 1042, 2, 'G2546', 5, 100, 2, 'Sales', 931, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-90614918\n', '2021-11-08 13:21:09'),
(1848, 108, 1, 'EPRH0761', 5, 100, 2, 'Sales', 932, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-65160053\n', '2021-11-08 13:23:39'),
(1849, 1029, 2, '211056', 30, 100, 2, 'Sales', 933, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-47817974\n', '2021-11-08 13:24:16'),
(1850, 2734, 18, '20190822', 5, 200, 2, 'Sales', 934, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-43498299\n', '2021-11-08 13:24:47'),
(1851, 2737, 18, '', 2, 3500, 2, 'Sales', 935, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock out from Sales-39833387\n', '2021-11-08 13:25:24'),
(1852, 2512, 2, '', 10, 100, 2, 'Sales', 936, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-00639960\n', '2021-11-08 13:25:53'),
(1853, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 937, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-83360021\n', '2021-11-08 15:35:55'),
(1854, 1, 0, '3106023', 1, 2000, 2, 'Sales', 938, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-56942046\n', '2021-11-08 15:53:52'),
(1855, 2863, 11, '', 1, 10000, 2, 'Sales', 939, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-58884480\n', '2021-11-08 15:55:47'),
(1856, 1294, 35, '6745/2016', 12, 500, 2, 'Sales', 940, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"12\"}', 'Stock out from Sales-73172059\n', '2021-11-08 21:17:57'),
(1857, 2810, 2, 'D00865', 10, 100, 2, 'Sales', 941, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-23978527\n', '2021-11-08 21:18:55'),
(1858, 1164, 2, 'D2000640', 10, 500, 2, 'Sales', 942, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock out from Sales-65177304\n', '2021-11-08 21:27:46'),
(1859, 180, 2, 'AR015G', 10, 150, 2, 'Sales', 943, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-83673168\n', '2021-11-08 21:28:44'),
(1860, 2720, 2, 'PX0030', 710, 25, 1, 'receiving', 383, '2023-04-30', 0, '{\"price\":\"25\",\"qty\":\"710\"}', 'Stock from Receiving-23447378\n', '2021-11-08 21:32:57'),
(1861, 2720, 2, 'PX0030', 20, 50, 2, 'Sales', 944, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-94501657\n', '2021-11-08 21:47:08'),
(1862, 93, 2, 'HR1003', 10, 100, 2, 'Sales', 945, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-97240657\n', '2021-11-08 21:47:58'),
(1863, 1290, 2, 'S2016012', 1, 3500, 2, 'Sales', 946, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-43405584\n', '2021-11-08 21:49:09'),
(1864, 2714, 2, 'FAZ1AC1', 100, 409, 1, 'receiving', 384, '2023-12-31', 0, '{\"price\":\"409\",\"qty\":\"100\"}', 'Stock from Receiving-44506387\n', '2021-11-08 22:02:09'),
(1865, 2714, 2, 'FAZ1AC1', 10, 600, 2, 'Sales', 947, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock out from Sales-07163020\n', '2021-11-08 22:05:34');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(1866, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 948, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-01076792\n', '2021-11-08 22:06:24'),
(1867, 2850, 2, 'ZA1011', 600, 8.5, 1, 'receiving', 385, '2024-06-30', 0, '{\"price\":\"8.5\",\"qty\":\"600\"}', 'Stock from Receiving-66516044\n', '2021-11-08 22:22:36'),
(1868, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 949, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-64876999\n', '2021-11-08 22:23:53'),
(1869, 2590, 30, 'MN209', 15, 200, 2, 'Sales', 950, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-65402518\n', '2021-11-08 22:24:39'),
(1870, 18, 286, '21095', 1, 2000, 2, 'Sales', 951, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-31923630\n', '2021-11-08 22:25:38'),
(1871, 192, 287, '(10) E110', 2, 2000, 2, 'Sales', 952, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-41975071\n', '2021-11-08 22:30:21'),
(1872, 192, 287, '(10) E110', 1, 2000, 2, 'Sales', 953, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-98094211\n', '2021-11-08 22:30:55'),
(1873, 565, 11, 'CCC31A1', 1, 10000, 2, 'Sales', 954, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-69492397\n', '2021-11-08 22:32:16'),
(1874, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 955, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-19779702\n', '2021-11-08 22:33:01'),
(1875, 2688, 30, '', 1, 5000, 2, 'Sales', 956, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-67986509\n', '2021-11-08 22:34:28'),
(1876, 11, 1, '1E19', 30, 100, 2, 'Sales', 957, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-92766887\n', '2021-11-08 22:36:34'),
(1877, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 958, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-36436529\n', '2021-11-08 22:37:34'),
(1878, 135, 248, 'CB04002', 3, 600, 2, 'Sales', 959, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"3\"}', 'Stock out from Sales-16940926\n', '2021-11-08 22:39:06'),
(1879, 1568, 282, 'CN123V', 1, 3500, 2, 'Sales', 960, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-39213045\n', '2021-11-08 22:40:12'),
(1880, 2465, 2, 'ST.335', 10, 100, 2, 'Sales', 961, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-52957009\n', '2021-11-08 22:41:25'),
(1881, 2512, 2, 'Y140XN', 520, 65, 1, 'receiving', 386, '2023-10-31', 0, '{\"price\":\"65\",\"qty\":\"520\"}', 'Stock from Receiving-25990700\n', '2021-11-08 22:48:35'),
(1882, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 962, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-94238608\n', '2021-11-08 22:49:54'),
(1883, 2639, 11, '78700', 5, 1509, 1, 'receiving', 387, '2024-03-08', 0, '{\"price\":\"1509\",\"qty\":\"5\"}', 'Stock from Receiving-23668074\n', '2021-11-08 23:00:37'),
(1884, 2638, 11, 'LB 1015', 3, 2100, 1, 'receiving', 388, '2023-04-30', 0, '{\"price\":\"2100\",\"qty\":\"3\"}', 'Stock from Receiving-86167220\n', '2021-11-08 23:02:44'),
(1885, 730, 288, 'LK 1013', 4, 1980, 1, 'receiving', 389, '2023-06-30', 0, '{\"price\":\"1980\",\"qty\":\"4\"}', 'Stock from Receiving-15151181\n', '2021-11-08 23:04:24'),
(1886, 48, 287, '1G77', 5, 1900, 1, 'receiving', 390, '2023-06-30', 0, '{\"price\":\"1900\",\"qty\":\"5\"}', 'Stock from Receiving-28227150\n', '2021-11-08 23:06:17'),
(1887, 65, 287, '2107021', 4, 2050, 1, 'receiving', 391, '2024-06-30', 0, '{\"price\":\"2050\",\"qty\":\"4\"}', 'Stock from Receiving-02251575\n', '2021-11-08 23:07:35'),
(1888, 46, 287, 'BL 1013', 10, 1350, 1, 'receiving', 392, '2023-05-31', 0, '{\"price\":\"1350\",\"qty\":\"10\"}', 'Stock from Receiving-37585219\n', '2021-11-08 23:09:07'),
(1889, 50, 287, '21009', 3, 960, 1, 'receiving', 393, '2023-07-08', 0, '{\"price\":\"960\",\"qty\":\"3\"}', 'Stock from Receiving-45391329\n', '2021-11-08 23:12:32'),
(1890, 299, 11, 'PB  308', 3, 1400, 1, 'receiving', 394, '2023-08-31', 0, '{\"price\":\"1400\",\"qty\":\"3\"}', 'Stock from Receiving-17360642\n', '2021-11-08 23:14:40'),
(1891, 2599, 287, '2103015', 5, 950, 1, 'receiving', 395, '2024-05-31', 0, '{\"price\":\"950\",\"qty\":\"5\"}', 'Stock from Receiving-12399380\n', '2021-11-08 23:16:48'),
(1892, 2441, 11, '201326', 7, 1400, 1, 'receiving', 396, '2023-10-31', 0, '{\"price\":\"1400\",\"qty\":\"7\"}', 'Stock from Receiving-65088494\n', '2021-11-08 23:34:19'),
(1893, 2618, 11, 'SE 315', 3, 2700, 1, 'receiving', 397, '2023-07-31', 0, '{\"price\":\"2700\",\"qty\":\"3\"}', 'Stock from Receiving-53958310\n', '2021-11-08 23:36:32'),
(1894, 2616, 11, '210689', 5, 2310, 1, 'receiving', 398, '2024-02-29', 0, '{\"price\":\"2310\",\"qty\":\"5\"}', 'Stock from Receiving-79590258\n', '2021-11-08 23:42:11'),
(1895, 2574, 11, '', 1, 5000, 2, 'Sales', 963, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-98218683\n', '2021-11-09 13:30:20'),
(1896, 2637, 11, '2012002', 1, 3000, 2, 'Sales', 964, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-20981955\n', '2021-11-09 13:43:04'),
(1897, 356, 11, 'SBCO26', 1, 2000, 2, 'Sales', 965, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-44237077\n', '2021-11-09 13:43:33'),
(1898, 235, 11, '1D86', 1, 3500, 2, 'Sales', 966, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-42619187\n', '2021-11-09 13:44:08'),
(1899, 2780, 2, 'CS20079', 10, 200, 2, 'Sales', 967, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-31203028\n', '2021-11-09 13:45:20'),
(1900, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 968, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-87446151\n', '2021-11-09 13:45:56'),
(1901, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 969, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-42168901\n', '2021-11-09 13:46:31'),
(1902, 2623, 11, '21001', 1, 3000, 2, 'Sales', 970, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-23942338\n', '2021-11-09 13:47:20'),
(1903, 2667, 30, 'AR21024', 1, 3000, 2, 'Sales', 971, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-90832307\n', '2021-11-09 13:55:04'),
(1904, 207, 28, 'V20221', 3, 2500, 2, 'Sales', 972, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"3\"}', 'Stock out from Sales-41433798\n', '2021-11-09 13:55:40'),
(1905, 2746, 18, '20201114', 3, 500, 2, 'Sales', 973, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"3\"}', 'Stock out from Sales-65449544\n', '2021-11-09 13:56:24'),
(1906, 1003, 2, '78273', 120, 100, 2, 'Sales', 974, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"120\"}', 'Stock out from Sales-79756568\n', '2021-11-09 13:57:05'),
(1907, 2739, 18, '192108', 1, 2000, 2, 'Sales', 975, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-74055839\n', '2021-11-09 13:57:44'),
(1908, 2689, 30, '0621', 2, 3500, 2, 'Sales', 976, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock out from Sales-59868733\n', '2021-11-09 13:58:25'),
(1909, 236, 11, '', 1, 10000, 2, 'Sales', 977, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-75740088\n', '2021-11-09 13:59:21'),
(1910, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 978, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-42441908\n', '2021-11-09 14:00:01'),
(1911, 2801, 1, 'CL1042', 5, 200, 2, 'Sales', 979, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-72420102\n', '2021-11-09 14:00:39'),
(1912, 542, 29, '203211082', 1, 1000, 2, 'Sales', 980, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-22101059\n', '2021-11-09 14:01:32'),
(1913, 821, 2, '89365', 14, 600, 2, 'Sales', 981, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"14\"}', 'Stock out from Sales-76763520\n', '2021-11-09 14:02:08'),
(1914, 1252, 2, 'ET.339', 30, 100, 2, 'Sales', 982, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-41458954\n', '2021-11-09 14:03:39'),
(1915, 2519, 1, '1C14B1', 6, 500, 2, 'Sales', 983, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"6\"}', 'Stock out from Sales-57634750\n', '2021-11-09 14:29:20'),
(1916, 837, 1, '(10)10019', 10, 300, 2, 'Sales', 984, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-14358484\n', '2021-11-09 14:30:12'),
(1917, 2887, 2, 'NFS11911E', 1, 6300, 1, 'receiving', 399, '2022-08-09', 0, '{\"price\":\"6300\",\"qty\":\"1\"}', 'Stock from Receiving-71107040\n', '2021-11-09 15:21:50'),
(1918, 2888, 2, '200127', 100, 4800, 1, 'receiving', 400, '2022-12-09', 0, '{\"price\":\"4800\",\"qty\":\"100\"}', 'Stock from Receiving-00427155\n', '2021-11-09 15:30:35'),
(1919, 2889, 2, 'PT723', 300, 40, 1, 'receiving', 401, '2022-10-09', 0, '{\"price\":\"40\",\"qty\":\"300\"}', 'Stock from Receiving-17623662\n', '2021-11-09 15:41:46'),
(1920, 2890, 29, 'TR2010B', 5, 4000, 1, 'receiving', 402, '2022-04-09', 0, '{\"price\":\"4000\",\"qty\":\"5\"}', 'Stock from Receiving-57563406\n', '2021-11-09 15:57:34'),
(1921, 2891, 2, '9M122', 5000, 60, 1, 'receiving', 403, '2022-08-09', 0, '{\"price\":\"60\",\"qty\":\"5000\"}', 'Stock from Receiving-48099676\n', '2021-11-09 16:13:27'),
(1922, 2892, 2, '78273', 5, 40, 1, 'receiving', 404, '2024-01-09', 0, '{\"price\":\"40\",\"qty\":\"5\"}', 'Stock from Receiving-12307762\n', '2021-11-09 16:23:49'),
(1923, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 985, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-09718067\n', '2021-11-09 19:56:26'),
(1924, 356, 11, 'SBCO26', 1, 2000, 2, 'Sales', 985, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-09718067\n', '2021-11-09 19:56:26'),
(1925, 11, 1, '1E19', 10, 100, 2, 'Sales', 985, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-09718067\n', '2021-11-09 19:56:26'),
(1926, 2774, 2, 'PA1059L', 1, 2500, 2, 'Sales', 985, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-09718067\n', '2021-11-09 19:56:26'),
(1927, 390, 2, '', 30, 300, 2, 'Sales', 985, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"30\"}', 'Stock out from Sales-09718067\n', '2021-11-09 19:56:26'),
(1928, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 986, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-09212895\n', '2021-11-09 20:03:14'),
(1929, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 986, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-09212895\n', '2021-11-09 20:03:14'),
(1930, 1139, 2, '91194', 30, 200, 2, 'Sales', 986, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-09212895\n', '2021-11-09 20:03:14'),
(1931, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 986, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-09212895\n', '2021-11-09 20:03:14'),
(1932, 367, 2, 'PA11400', 24, 500, 2, 'Sales', 988, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"24\"}', 'Stock out from Sales-65684813\n', '2021-11-09 20:08:18'),
(1933, 2807, 2, '200015', 30, 100, 2, 'Sales', 990, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-25345261\n', '2021-11-09 20:14:05'),
(1934, 2893, 18, '0000000', 13, 550, 1, 'receiving', 405, '2030-12-31', 0, '{\"price\":\"550\",\"qty\":\"13\"}', 'Stock from Receiving-82688932\n', '2021-11-09 20:18:30'),
(1935, 2893, 18, '0000000', 1, 1000, 2, 'Sales', 991, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-71231614\n', '2021-11-09 20:19:08'),
(1936, 531, 11, '69JO1420', 10, 1200, 1, 'receiving', 406, '2023-03-31', 0, '{\"price\":\"1200\",\"qty\":\"10\"}', 'Stock from Receiving-36195838\n', '2021-11-09 21:26:48'),
(1937, 2425, 10, 'C023', 5, 4100, 1, 'receiving', 407, '2022-10-09', 0, '{\"price\":\"4100\",\"qty\":\"5\"}', 'Stock from Receiving-12980253\n', '2021-11-09 21:28:51'),
(1938, 5, 284, 'AB124', 5, 1650, 1, 'receiving', 408, '2024-03-31', 0, '{\"price\":\"1650\",\"qty\":\"5\"}', 'Stock from Receiving-32594536\n', '2021-11-09 21:30:41'),
(1939, 2855, 11, 'BA0005', 5, 2300, 1, 'receiving', 409, '2023-06-30', 0, '{\"price\":\"2300\",\"qty\":\"5\"}', 'Stock from Receiving-84692661\n', '2021-11-09 21:32:27'),
(1940, 2660, 11, 'SCD2007009', 5, 2500, 1, 'receiving', 410, '2022-06-30', 0, '{\"price\":\"2500\",\"qty\":\"5\"}', 'Stock from Receiving-18740544\n', '2021-11-09 21:44:05'),
(1941, 2607, 287, '2106010', 4, 3300, 1, 'receiving', 411, '2022-11-30', 0, '{\"price\":\"3300\",\"qty\":\"4\"}', 'Stock from Receiving-73088475\n', '2021-11-09 21:47:03'),
(1942, 2608, 287, 'HT 306', 5, 2500, 1, 'receiving', 412, '2023-08-31', 0, '{\"price\":\"2500\",\"qty\":\"5\"}', 'Stock from Receiving-68694954\n', '2021-11-09 21:49:12'),
(1943, 2609, 11, '21041', 2, 3000, 1, 'receiving', 413, '2024-06-30', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock from Receiving-87566667\n', '2021-11-09 22:00:39'),
(1944, 2894, 1, 'PA02341', 90, 160, 1, 'receiving', 414, '2023-01-30', 0, '{\"price\":\"160\",\"qty\":\"90\"}', 'Stock from Receiving-88399219\n', '2021-11-09 22:12:33'),
(1945, 2864, 115, 'WO783', 36, 316, 1, 'receiving', 415, '2022-07-31', 0, '{\"price\":\"316\",\"qty\":\"36\"}', 'Stock from Receiving-57977521\n', '2021-11-09 22:14:58'),
(1946, 2865, 115, 'W3483', 36, 320, 1, 'receiving', 416, '2023-02-28', 0, '{\"price\":\"320\",\"qty\":\"36\"}', 'Stock from Receiving-40371049\n', '2021-11-09 22:16:29'),
(1947, 817, 2, '91124', 300, 70, 1, 'receiving', 417, '2025-11-30', 0, '{\"price\":\"70\",\"qty\":\"300\"}', 'Stock from Receiving-26166217\n', '2021-11-09 22:18:26'),
(1948, 2737, 18, 'CMPA0503', 10, 2000, 1, 'receiving', 418, '2026-05-02', 0, '{\"price\":\"2000\",\"qty\":\"10\"}', 'Stock from Receiving-82172157\n', '2021-11-09 22:20:48'),
(1949, 2895, 2, 'BV1004', 30, 250, 1, 'receiving', 419, '2024-04-30', 0, '{\"price\":\"250\",\"qty\":\"30\"}', 'Stock from Receiving-38302410\n', '2021-11-09 22:58:53'),
(1950, 2896, 11, 'AFG4JB1', 5, 600, 1, 'receiving', 420, '2023-09-30', 0, '{\"price\":\"600\",\"qty\":\"5\"}', 'Stock from Receiving-99776852\n', '2021-11-09 23:00:41'),
(1951, 2879, 27, '952-1', 1, 5000, 2, 'Sales', 992, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-63636815\n', '2021-11-09 23:04:36'),
(1952, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 993, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-12592878\n', '2021-11-09 23:06:01'),
(1953, 286, 2, '417IA06', 3, 1500, 2, 'Sales', 993, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock out from Sales-12592878\n', '2021-11-09 23:06:01'),
(1954, 2660, 11, 'SCD2007009', 1, 5000, 2, 'Sales', 993, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-12592878\n', '2021-11-09 23:06:01'),
(1955, 2665, 11, 'RS3025', 1, 3000, 2, 'Sales', 994, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-87415117\n', '2021-11-09 23:06:34'),
(1956, 135, 1, 'CB04002', 6, 600, 2, 'Sales', 995, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"6\"}', 'Stock out from Sales-66812865\n', '2021-11-09 23:08:19'),
(1957, 1377, 289, '008HJ', 1, 5000, 2, 'Sales', 996, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-82854390\n', '2021-11-09 23:10:06'),
(1958, 1415, 30, '0000', 1, 3000, 2, 'Sales', 997, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-25642173\n', '2021-11-09 23:10:53'),
(1959, 1408, 30, '6401-09', 1, 5000, 2, 'Sales', 998, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-40858325\n', '2021-11-09 23:11:30'),
(1960, 2651, 1, '202381', 1, 10000, 2, 'Sales', 999, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-41300448\n', '2021-11-09 23:13:29'),
(1961, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 999, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-41300448\n', '2021-11-09 23:13:29'),
(1962, 77, 2, '2106094', 10, 100, 2, 'Sales', 999, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-41300448\n', '2021-11-09 23:13:29'),
(1963, 77, 2, '2106094', 10, 100, 2, 'Sales', 1000, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-86187369\n', '2021-11-09 23:15:06'),
(1964, 2720, 2, 'PX0030', 10, 50, 2, 'Sales', 1001, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-73156673\n', '2021-11-09 23:15:49'),
(1965, 1, 2, '3106023', 1, 2000, 2, 'Sales', 1002, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-63241375\n', '2021-11-09 23:17:04'),
(1966, 2895, 2, 'BV1004', 1, 1000, 2, 'Sales', 1002, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-63241375\n', '2021-11-09 23:17:04'),
(1967, 1570, 10, 'B02', 1, 4000, 2, 'Sales', 1003, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-07090715\n', '2021-11-09 23:17:40'),
(1968, 738, 1, 'CL1002', 5, 200, 2, 'Sales', 1004, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-55606538\n', '2021-11-09 23:18:17'),
(1969, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 1005, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-69577684\n', '2021-11-09 23:20:28'),
(1970, 11, 1, '1E19', 30, 100, 2, 'Sales', 1005, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-69577684\n', '2021-11-09 23:20:28'),
(1971, 2630, 11, '479', 1, 16000, 2, 'Sales', 1006, '0000-00-00', 0, '{\"price\":\"16000\",\"qty\":\"1\"}', 'Stock out from Sales-66748256\n', '2021-11-09 23:21:09'),
(1972, 14, 2, '1A27', 2, 200, 2, 'Sales', 1007, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-26702652\n', '2021-11-09 23:21:47'),
(1973, 1570, 10, 'B02', 1, 4000, 2, 'Sales', 1008, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-70221485\n', '2021-11-09 23:22:57'),
(1974, 398, 1, '1108006', 22, 1200, 1, 'receiving', 421, '2023-03-31', 0, '{\"price\":\"1200\",\"qty\":\"22\"}', 'Stock from Receiving-09328374\n', '2021-11-09 23:27:40'),
(1975, 398, 1, '1108006', 5, 2000, 2, 'Sales', 1009, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-61016833\n', '2021-11-09 23:28:44'),
(1976, 565, 11, 'CCC31A1', 1, 10000, 2, 'Sales', 1010, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-99003985\n', '2021-11-09 23:29:16'),
(1977, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 1011, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-33668912\n', '2021-11-09 23:30:00'),
(1978, 163, 2, '2001060', 3, 200, 2, 'Sales', 1012, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"3\"}', 'Stock out from Sales-37962257\n', '2021-11-09 23:30:40'),
(1979, 2886, 18, '2004951322', 1, 1000, 2, 'Sales', 1013, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-19333735\n', '2021-11-09 23:31:09'),
(1980, 2697, 1, '2010063', 5, 200, 2, 'Sales', 1014, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-25161575\n', '2021-11-09 23:31:46'),
(1981, 608, 288, '2012068', 1, 2500, 2, 'Sales', 1015, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-47533287\n', '2021-11-09 23:32:39'),
(1982, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1016, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-62902918\n', '2021-11-09 23:35:38'),
(1983, 14, 2, '1A27', 2, 200, 2, 'Sales', 1016, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-62902918\n', '2021-11-09 23:35:38'),
(1984, 2823, 2, 'EK2009', 1, 30000, 2, 'Sales', 1017, '0000-00-00', 0, '{\"price\":\"30000\",\"qty\":\"1\"}', 'Stock out from Sales-94142932\n', '2021-11-09 23:43:01'),
(1985, 2471, 11, '192432', 1, 3000, 2, 'Sales', 1018, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-56795782\n', '2021-11-09 23:45:35'),
(1986, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1018, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-56795782\n', '2021-11-09 23:45:35'),
(1987, 2463, 11, 'FW024G', 7, 1630, 1, 'receiving', 422, '2023-02-28', 0, '{\"price\":\"1630\",\"qty\":\"7\"}', 'Stock from Receiving-23497185\n', '2021-11-09 23:47:36'),
(1988, 2897, 206, 'IVA21001', 4, 3100, 1, 'receiving', 423, '2024-02-29', 0, '{\"price\":\"3100\",\"qty\":\"4\"}', 'Stock from Receiving-51822689\n', '2021-11-09 23:54:30'),
(1989, 18, 286, '21089', 10, 700, 1, 'receiving', 424, '2024-05-31', 0, '{\"price\":\"700\",\"qty\":\"10\"}', 'Stock from Receiving-77005146\n', '2021-11-09 23:58:36'),
(1990, 2899, 283, '21111', 5, 700, 1, 'receiving', 425, '2024-06-10', 0, '{\"price\":\"700\",\"qty\":\"5\"}', 'Stock from Receiving-93491384\n', '2021-11-10 00:08:11'),
(1991, 77, 2, '2106094', 5, 100, 2, 'Sales', 1019, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-94832163\n', '2021-11-10 06:37:16'),
(1992, 2720, 2, 'PX0030', 10, 50, 2, 'Sales', 1020, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-22615221\n', '2021-11-10 06:38:00'),
(1993, 2750, 18, '0100104/TZNG/21', 4, 1000, 2, 'Sales', 1021, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock out from Sales-50066278\n', '2021-11-10 06:38:45'),
(1994, 2765, 2, 'TL670001', 1, 2000, 2, 'Sales', 1022, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-86184266\n', '2021-11-10 06:39:38'),
(1995, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 1023, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-35806780\n', '2021-11-10 06:40:34'),
(1996, 11, 1, '1E19', 15, 100, 2, 'Sales', 1024, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-66660298\n', '2021-11-10 08:22:07'),
(1997, 2480, 2, 'XB073', 15, 200, 2, 'Sales', 1025, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-68510030\n', '2021-11-10 08:24:21'),
(1998, 2465, 2, 'ST.335', 5, 100, 2, 'Sales', 1026, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-09693125\n', '2021-11-10 08:29:28'),
(1999, 2689, 30, '0621', 1, 3500, 2, 'Sales', 1027, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-32667012\n', '2021-11-10 10:40:39'),
(2000, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 1028, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-20504616\n', '2021-11-10 10:41:16'),
(2001, 889, 30, 'PM620021', 30, 100, 2, 'Sales', 1029, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-25911163\n', '2021-11-10 10:42:25'),
(2002, 2798, 1, 'CA03621', 10, 200, 2, 'Sales', 1030, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-38741367\n', '2021-11-10 10:43:12'),
(2003, 2618, 11, 'SE 315', 1, 3500, 2, 'Sales', 1031, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-92142355\n', '2021-11-10 10:43:51'),
(2004, 2873, 2, 'T0332', 10, 100, 2, 'Sales', 1032, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-21140199\n', '2021-11-10 10:44:54'),
(2005, 2465, 2, 'ST.335', 10, 100, 2, 'Sales', 1033, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-51786178\n', '2021-11-10 10:47:05'),
(2006, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 1034, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-59045607\n', '2021-11-10 10:47:44'),
(2007, 442, 2, 'T0100', 10, 200, 2, 'Sales', 1035, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-09821678\n', '2021-11-10 10:50:19'),
(2008, 22, 43, '', 1, 2500, 2, 'Sales', 1036, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-77052416\n', '2021-11-10 10:50:57'),
(2009, 2761, 2, 'BT1912125B', 30, 1000, 2, 'Sales', 1037, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"30\"}', 'Stock out from Sales-79362442\n', '2021-11-10 10:51:38'),
(2010, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1038, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-46457433\n', '2021-11-10 10:52:23'),
(2011, 2772, 2, 'KA03109', 1, 2500, 2, 'Sales', 1039, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-45978505\n', '2021-11-10 10:52:51'),
(2012, 2675, 11, '47', 1, 3500, 2, 'Sales', 1040, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-59645663\n', '2021-11-10 11:44:16'),
(2013, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 1041, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-13266141\n', '2021-11-10 11:49:08'),
(2014, 11, 1, '1E19', 15, 100, 2, 'Sales', 1042, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-65726486\n', '2021-11-10 11:50:08'),
(2015, 2784, 2, '21070287', 1, 5000, 2, 'Sales', 1043, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-34725279\n', '2021-11-10 11:52:04'),
(2016, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 1044, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-00868628\n', '2021-11-10 11:52:35'),
(2017, 1106, 281, '36175', 1, 10000, 2, 'Sales', 1045, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-76619594\n', '2021-11-10 11:53:23'),
(2018, 968, 27, '2011045', 2, 500, 2, 'Sales', 1046, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-21579879\n', '2021-11-10 11:54:00'),
(2019, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 1047, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-20365298\n', '2021-11-10 11:55:30'),
(2020, 1390, 30, '5M12', 1, 4000, 2, 'Sales', 1048, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-73724225\n', '2021-11-10 11:56:32'),
(2021, 2750, 18, '0100104/TZNG/21', 1, 1000, 2, 'Sales', 1049, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-56014578\n', '2021-11-10 11:57:00'),
(2022, 1137, 2, 'BH1011', 30, 100, 2, 'Sales', 1050, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-21991468\n', '2021-11-10 12:25:46'),
(2023, 2460, 11, 'C101', 1, 3500, 2, 'Sales', 1051, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-80877214\n', '2021-11-10 12:26:18'),
(2024, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1052, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-64454433\n', '2021-11-10 12:26:43'),
(2025, 2776, 2, '362492', 2, 2500, 2, 'Sales', 1053, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock out from Sales-90342862\n', '2021-11-10 12:27:18'),
(2026, 1029, 2, '211056', 30, 100, 2, 'Sales', 1054, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-31839660\n', '2021-11-10 12:27:46'),
(2027, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1055, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-75630925\n', '2021-11-10 12:28:37'),
(2028, 415, 2, 'CCT20002E', 10, 100, 2, 'Sales', 1056, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-28525879\n', '2021-11-10 12:29:21'),
(2029, 93, 2, 'HR1003', 10, 100, 2, 'Sales', 1057, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-40589382\n', '2021-11-10 13:11:35'),
(2030, 2801, 1, 'CL1042', 28, 200, 2, 'Sales', 1058, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"28\"}', 'Stock out from Sales-61111165\n', '2021-11-10 15:22:13'),
(2031, 2592, 2, '206770', 10, 1000, 2, 'Sales', 1059, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-84725750\n', '2021-11-10 15:22:54'),
(2032, 117, 2, 'SKY0180', 5, 400, 2, 'Sales', 1060, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-76629002\n', '2021-11-10 15:23:38'),
(2033, 11, 1, '1E19', 20, 100, 2, 'Sales', 1061, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-11775365\n', '2021-11-10 15:24:46'),
(2034, 889, 2, 'PM620021', 20, 100, 2, 'Sales', 1062, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-02703868\n', '2021-11-10 15:25:28'),
(2035, 889, 2, 'PM620021', 20, 100, 2, 'Sales', 1063, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-56057387\n', '2021-11-10 16:23:18'),
(2036, 2458, 11, '10210690', 1, 3500, 2, 'Sales', 1064, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-11998725\n', '2021-11-10 16:25:26'),
(2037, 1137, 2, 'BH1011', 10, 100, 2, 'Sales', 1065, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-86582279\n', '2021-11-10 16:26:07'),
(2038, 2774, 2, 'PA1059L', 1, 2500, 2, 'Sales', 1066, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-77266878\n', '2021-11-10 16:35:21'),
(2039, 11, 1, '1E19', 10, 100, 2, 'Sales', 1067, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-63292836\n', '2021-11-10 16:39:49'),
(2040, 1137, 2, 'BH1011', 10, 100, 2, 'Sales', 1068, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-31011436\n', '2021-11-10 16:56:47'),
(2041, 2801, 1, 'CL1042', 10, 200, 2, 'Sales', 1069, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-01676251\n', '2021-11-10 16:57:18'),
(2042, 1332, 30, 'TMC19-001', 1, 3500, 2, 'Sales', 1070, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-29188907\n', '2021-11-10 16:57:48'),
(2043, 1446, 11, '', 1, 7000, 2, 'Sales', 1071, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-61354958\n', '2021-11-10 16:59:26'),
(2044, 1443, 11, 'QO173', 1, 2000, 2, 'Sales', 1072, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-27210135\n', '2021-11-10 16:59:55'),
(2045, 2710, 1, '1D23C1', 2, 600, 2, 'Sales', 1073, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"2\"}', 'Stock out from Sales-72608910\n', '2021-11-10 17:57:02'),
(2046, 2691, 18, '000', 1, 1500, 2, 'Sales', 1074, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-26361761\n', '2021-11-10 17:57:40'),
(2047, 1336, 30, '', 2, 1500, 2, 'Sales', 1075, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock out from Sales-41712953\n', '2021-11-10 17:58:19'),
(2048, 2597, 2, '', 4, 2000, 2, 'Sales', 1076, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock out from Sales-77388277\n', '2021-11-10 17:59:48'),
(2049, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 1077, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-78581016\n', '2021-11-10 18:00:30'),
(2050, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1078, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-87033427\n', '2021-11-10 18:00:56'),
(2051, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 1079, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-91085504\n', '2021-11-10 18:01:37'),
(2052, 2721, 0, 'Y095UH', 300, 79, 1, 'receiving', 426, '2023-05-31', 0, '{\"price\":\"79\",\"qty\":\"300\"}', 'Stock from Receiving-90334569\n', '2021-11-10 19:07:46'),
(2053, 2498, 0, 'W0767', 5, 4400, 1, 'receiving', 427, '2022-05-31', 0, '{\"price\":\"4400\",\"qty\":\"5\"}', 'Stock from Receiving-13606546\n', '2021-11-10 19:09:15'),
(2054, 878, 0, 'N081003', 3, 2800, 1, 'receiving', 428, '2023-06-30', 0, '{\"price\":\"2800\",\"qty\":\"3\"}', 'Stock from Receiving-65859106\n', '2021-11-10 19:11:34'),
(2055, 167, 0, 'IB61', 4, 1695, 1, 'receiving', 429, '2024-01-31', 0, '{\"price\":\"1695\",\"qty\":\"4\"}', 'Stock from Receiving-02906368\n', '2021-11-10 19:14:50'),
(2056, 649, 1, 'FUCO13', 50, 350, 1, 'receiving', 430, '2023-06-30', 0, '{\"price\":\"350\",\"qty\":\"50\"}', 'Stock from Receiving-72588753\n', '2021-11-10 19:51:13'),
(2057, 142, 284, '057', 4, 2950, 1, 'receiving', 431, '2022-02-03', 0, '{\"price\":\"2950\",\"qty\":\"4\"}', 'Stock from Receiving-17720030\n', '2021-11-10 19:53:02'),
(2058, 22, 284, 'IB04', 5, 1600, 1, 'receiving', 432, '2024-01-31', 0, '{\"price\":\"1600\",\"qty\":\"5\"}', 'Stock from Receiving-46525265\n', '2021-11-10 19:54:54'),
(2059, 2710, 248, '1D23C1', 60, 400, 1, 'receiving', 433, '2023-04-22', 0, '{\"price\":\"400\",\"qty\":\"60\"}', 'Stock from Receiving-68035533\n', '2021-11-10 20:29:40'),
(2060, 917, 2, '1090', 200, 118, 1, 'receiving', 434, '2023-09-30', 0, '{\"price\":\"118\",\"qty\":\"200\"}', 'Stock from Receiving-78053837\n', '2021-11-10 20:31:55'),
(2061, 1042, 2, 'J0354', 300, 30, 1, 'receiving', 435, '2024-04-30', 0, '{\"price\":\"30\",\"qty\":\"300\"}', 'Stock from Receiving-21271884\n', '2021-11-10 20:34:06'),
(2062, 2852, 18, '1905510316', 10, 2200, 1, 'receiving', 436, '2024-04-30', 0, '{\"price\":\"2200\",\"qty\":\"10\"}', 'Stock from Receiving-64414662\n', '2021-11-10 20:35:31'),
(2063, 2900, 2, 'TR2520027D', 28, 1000, 1, 'receiving', 437, '2022-08-31', 0, '{\"price\":\"1000\",\"qty\":\"28\"}', 'Stock from Receiving-99718284\n', '2021-11-10 20:44:00'),
(2064, 2480, 2, 'XB073', 15, 200, 2, 'Sales', 1080, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-86959154\n', '2021-11-10 21:53:13'),
(2065, 48, 287, '0K01', 1, 3500, 2, 'Sales', 1081, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-56293399\n', '2021-11-10 21:54:05'),
(2066, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1082, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-15039724\n', '2021-11-10 21:56:46'),
(2067, 2530, 289, 'L11PP', 1, 6000, 2, 'Sales', 1082, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-15039724\n', '2021-11-10 21:56:46'),
(2068, 2699, 18, '0259', 1, 3000, 2, 'Sales', 1082, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-15039724\n', '2021-11-10 21:56:46'),
(2069, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 1082, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-15039724\n', '2021-11-10 21:56:46'),
(2070, 290, 288, '', 1, 5000, 2, 'Sales', 1083, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-43114915\n', '2021-11-10 21:59:23'),
(2071, 968, 27, '2011045', 2, 500, 2, 'Sales', 1083, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-43114915\n', '2021-11-10 21:59:23'),
(2072, 738, 1, 'CL1002', 5, 200, 2, 'Sales', 1083, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-43114915\n', '2021-11-10 21:59:24'),
(2073, 2870, 2, '', 7, 2000, 2, 'Sales', 1084, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"7\"}', 'Stock out from Sales-24219446\n', '2021-11-10 22:02:07'),
(2074, 2900, 2, 'TR2520027D', 2, 2000, 2, 'Sales', 1084, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-24219446\n', '2021-11-10 22:02:07'),
(2075, 2884, 10, '21002', 1, 6000, 2, 'Sales', 1084, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-24219446\n', '2021-11-10 22:02:07'),
(2076, 1386, 30, 'TTF8015E', 1, 3500, 2, 'Sales', 1085, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-46445361\n', '2021-11-10 22:02:59'),
(2077, 1488, 11, '1821', 1, 1000, 2, 'Sales', 1086, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-01062091\n', '2021-11-10 22:13:24'),
(2078, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1086, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-01062091\n', '2021-11-10 22:13:24'),
(2079, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1087, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-99738432\n', '2021-11-10 22:22:56'),
(2080, 2493, 2, '2103810002', 2, 800, 2, 'Sales', 1087, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"2\"}', 'Stock out from Sales-99738432\n', '2021-11-10 22:22:56'),
(2081, 2441, 11, '201326', 1, 3000, 2, 'Sales', 1087, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-99738432\n', '2021-11-10 22:22:56'),
(2082, 1569, 282, '0333TH112N', 1, 3500, 2, 'Sales', 1087, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-99738432\n', '2021-11-10 22:22:56'),
(2083, 2865, 27, 'W3483', 4, 600, 2, 'Sales', 1088, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"4\"}', 'Stock out from Sales-58079875\n', '2021-11-10 22:25:15'),
(2084, 2784, 2, '21070287', 1, 5000, 2, 'Sales', 1088, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-58079875\n', '2021-11-10 22:25:15'),
(2085, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 1088, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-58079875\n', '2021-11-10 22:25:15'),
(2086, 41, 1, '44420063', 2, 500, 2, 'Sales', 1089, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-13142726\n', '2021-11-10 22:28:09'),
(2087, 410, 2, 'A52101', 4, 1500, 2, 'Sales', 1089, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"4\"}', 'Stock out from Sales-13142726\n', '2021-11-10 22:28:09'),
(2088, 2801, 11, 'CL1042', 15, 200, 2, 'Sales', 1089, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-13142726\n', '2021-11-10 22:28:09'),
(2089, 2857, 287, 'JS301', 1, 3000, 2, 'Sales', 1090, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-14928933\n', '2021-11-10 22:32:10'),
(2090, 252, 2, 'IN1043', 3, 1800, 1, 'receiving', 438, '2023-06-30', 0, '{\"price\":\"1800\",\"qty\":\"3\"}', 'Stock from Receiving-19026828\n', '2021-11-10 22:36:26'),
(2091, 252, 2, 'IN1043', 1, 3000, 2, 'Sales', 1091, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-10461990\n', '2021-11-10 22:39:36'),
(2092, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 1092, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-38639400\n', '2021-11-10 22:41:14'),
(2093, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1093, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-59312708\n', '2021-11-10 22:42:13'),
(2094, 93, 2, 'HR1003', 20, 100, 2, 'Sales', 1094, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-17761595\n', '2021-11-10 22:43:00'),
(2095, 285, 2, '2105071', 12, 750, 2, 'Sales', 1095, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-24766411\n', '2021-11-10 22:43:33'),
(2096, 252, 2, 'IN1043', 1, 3000, 2, 'Sales', 1096, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-67970034\n', '2021-11-10 22:45:18'),
(2097, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1096, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-67970034\n', '2021-11-10 22:45:18'),
(2098, 723, 2, '210735', 10, 300, 2, 'Sales', 1096, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-67970034\n', '2021-11-10 22:45:18'),
(2099, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 1097, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-85938286\n', '2021-11-10 22:46:47'),
(2100, 2879, 27, '952-1', 2, 5000, 2, 'Sales', 1097, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-85938286\n', '2021-11-10 22:46:47'),
(2101, 918, 11, '2102142', 1, 2000, 2, 'Sales', 1097, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-85938286\n', '2021-11-10 22:46:47'),
(2102, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 1098, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-08366090\n', '2021-11-10 22:48:33'),
(2103, 2436, 11, '58F02320', 1, 5000, 2, 'Sales', 1098, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-08366090\n', '2021-11-10 22:48:33'),
(2104, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 1098, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-08366090\n', '2021-11-10 22:48:33'),
(2105, 2776, 2, '362492', 2, 2500, 2, 'Sales', 1099, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock out from Sales-77522922\n', '2021-11-10 22:57:30'),
(2106, 723, 2, '210735', 3, 300, 2, 'Sales', 1099, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"3\"}', 'Stock out from Sales-77522922\n', '2021-11-10 22:57:30'),
(2107, 837, 2, '(10)10019', 10, 300, 2, 'Sales', 1101, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-22588608\n', '2021-11-10 23:00:48'),
(2108, 22, 284, 'IB04', 1, 2500, 2, 'Sales', 1103, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-04838793\n', '2021-11-10 23:03:02'),
(2109, 818, 2, 'CA05561', 10, 200, 2, 'Sales', 1104, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-58610905\n', '2021-11-10 23:03:31'),
(2110, 2696, 115, 'KDM20010', 2, 1000, 2, 'Sales', 1105, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-92717317\n', '2021-11-10 23:04:07'),
(2111, 968, 27, '2011045', 2, 500, 2, 'Sales', 1106, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-26790849\n', '2021-11-10 23:04:40'),
(2112, 1269, 2, '2105098', 10, 200, 2, 'Sales', 1107, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-41394289\n', '2021-11-10 23:05:22'),
(2113, 1223, 2, 'X26E9008', 5, 2000, 2, 'Sales', 1108, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-73675431\n', '2021-11-10 23:06:46'),
(2114, 301, 28, '20201109', 1, 2000, 2, 'Sales', 1109, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-31047440\n', '2021-11-10 23:07:16'),
(2115, 2746, 18, '20201114', 2, 500, 2, 'Sales', 1110, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-71513554\n', '2021-11-10 23:08:39'),
(2116, 1126, 11, '32010540', 10, 1100, 1, 'receiving', 439, '2026-02-28', 0, '{\"price\":\"1100\",\"qty\":\"10\"}', 'Stock from Receiving-96123974\n', '2021-11-11 10:58:38'),
(2117, 2656, 2, '210355', 700, 20, 1, 'receiving', 440, '2025-01-31', 0, '{\"price\":\"20\",\"qty\":\"700\"}', 'Stock from Receiving-23723391\n', '2021-11-11 11:08:03'),
(2118, 2863, 11, '10821JU009RM', 4, 7500, 1, 'receiving', 441, '2024-04-30', 0, '{\"price\":\"7500\",\"qty\":\"4\"}', 'Stock from Receiving-71976598\n', '2021-11-11 12:05:54'),
(2119, 1003, 2, '78273', 500, 30, 1, 'receiving', 441, '2024-01-31', 0, '{\"price\":\"30\",\"qty\":\"500\"}', 'Stock from Receiving-71976598\n', '2021-11-11 12:05:54'),
(2120, 961, 248, '14276900', 14, 450, 1, 'receiving', 441, '2022-12-31', 0, '{\"price\":\"450\",\"qty\":\"14\"}', 'Stock from Receiving-71976598\n', '2021-11-11 12:05:54'),
(2121, 2662, 11, 'KZ226', 4, 5700, 1, 'receiving', 442, '2024-07-31', 0, '{\"price\":\"5700\",\"qty\":\"4\"}', 'Stock from Receiving-44616802\n', '2021-11-11 12:13:05'),
(2122, 561, 2, '210332', 4, 5800, 1, 'receiving', 442, '2023-03-28', 0, '{\"price\":\"5800\",\"qty\":\"4\"}', 'Stock from Receiving-44616802\n', '2021-11-11 12:13:06'),
(2123, 116, 2, 'ABL1521007A', 20, 180, 1, 'receiving', 442, '2023-03-31', 0, '{\"price\":\"180\",\"qty\":\"20\"}', 'Stock from Receiving-44616802\n', '2021-11-11 12:13:06'),
(2124, 2904, 289, '0062', 4, 7500, 1, 'receiving', 443, '2025-05-31', 0, '{\"price\":\"7500\",\"qty\":\"4\"}', 'Stock from Receiving-41372680\n', '2021-11-11 12:20:19'),
(2125, 2905, 289, '0059', 7, 3500, 1, 'receiving', 443, '2023-03-31', 0, '{\"price\":\"3500\",\"qty\":\"7\"}', 'Stock from Receiving-41372680\n', '2021-11-11 12:20:19'),
(2126, 2907, 30, 'L30191103', 24, 416, 1, 'receiving', 444, '2024-10-31', 0, '{\"price\":\"416\",\"qty\":\"24\"}', 'Stock from Receiving-35576901\n', '2021-11-11 12:43:58'),
(2127, 2762, 2, 'NR00806A', 20, 1100, 1, 'receiving', 445, '2024-07-31', 0, '{\"price\":\"1100\",\"qty\":\"20\"}', 'Stock from Receiving-57681679\n', '2021-11-11 12:46:12'),
(2128, 817, 2, '91124', 10, 100, 2, 'Sales', 1111, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-74209870\n', '2021-11-11 13:26:06'),
(2129, 2895, 2, 'BV1004', 2, 1000, 2, 'Sales', 1111, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-74209870\n', '2021-11-11 13:26:06'),
(2130, 1558, 282, 'L-357 J', 1, 1500, 2, 'Sales', 1111, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-74209870\n', '2021-11-11 13:26:06'),
(2131, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 1112, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-65488793\n', '2021-11-11 13:28:10'),
(2132, 2710, 1, '1D23C1', 10, 600, 2, 'Sales', 1112, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock out from Sales-65488793\n', '2021-11-11 13:28:10'),
(2133, 878, 11, 'TN080006', 1, 5000, 2, 'Sales', 1113, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-47951481\n', '2021-11-11 13:31:47'),
(2134, 730, 288, 'LK0007', 1, 3500, 2, 'Sales', 1113, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-47951481\n', '2021-11-11 13:31:47'),
(2135, 135, 248, 'CB04002', 2, 600, 2, 'Sales', 1113, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"2\"}', 'Stock out from Sales-47951481\n', '2021-11-11 13:31:47'),
(2136, 1046, 2, '87674', 20, 200, 2, 'Sales', 1114, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-71516762\n', '2021-11-11 13:35:58'),
(2137, 14, 2, '1A27', 2, 200, 2, 'Sales', 1114, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-71516762\n', '2021-11-11 13:35:58'),
(2138, 78, 284, '2107009', 1, 3500, 2, 'Sales', 1114, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-71516762\n', '2021-11-11 13:35:58'),
(2139, 2566, 11, '94611611MC', 1, 6000, 2, 'Sales', 1114, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-71516762\n', '2021-11-11 13:35:58'),
(2140, 649, 1, 'FU0010', 1, 1000, 2, 'Sales', 1114, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-71516762\n', '2021-11-11 13:35:58'),
(2141, 414, 11, 'C4561007', 1, 4000, 2, 'Sales', 1115, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-44110906\n', '2021-11-11 13:37:40'),
(2142, 2817, 28, 'QD6201002', 8, 1000, 2, 'Sales', 1115, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"8\"}', 'Stock out from Sales-44110906\n', '2021-11-11 13:37:40'),
(2143, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1115, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-44110906\n', '2021-11-11 13:37:40'),
(2144, 93, 2, 'HR1003', 30, 100, 2, 'Sales', 1116, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-08941923\n', '2021-11-11 13:38:40'),
(2145, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1117, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-04000489\n', '2021-11-11 13:43:38'),
(2146, 2883, 1, 'CF 1005', 10, 100, 2, 'Sales', 1117, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-04000489\n', '2021-11-11 13:43:38'),
(2147, 68, 2, '210337', 30, 100, 2, 'Sales', 1117, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-04000489\n', '2021-11-11 13:43:38'),
(2148, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 1117, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-04000489\n', '2021-11-11 13:43:38'),
(2149, 42, 27, 'Y094XC', 4, 500, 2, 'Sales', 1118, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"4\"}', 'Stock out from Sales-67675542\n', '2021-11-11 13:46:34'),
(2150, 14, 2, '1A27', 10, 200, 2, 'Sales', 1118, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-67675542\n', '2021-11-11 13:46:34'),
(2151, 1003, 2, '78273', 100, 100, 2, 'Sales', 1118, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock out from Sales-67675542\n', '2021-11-11 13:46:34'),
(2152, 87, 2, '9L104', 100, 150, 2, 'Sales', 1118, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"100\"}', 'Stock out from Sales-67675542\n', '2021-11-11 13:46:34'),
(2153, 1003, 2, '78273', 40, 100, 2, 'Sales', 1119, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"40\"}', 'Stock out from Sales-18919050\n', '2021-11-11 13:48:53'),
(2154, 2909, 27, '1959FZ 1932', 6, 1340, 1, 'receiving', 446, '2022-06-30', 0, '{\"price\":\"1340\",\"qty\":\"6\"}', 'Stock from Receiving-27680138\n', '2021-11-11 14:30:50'),
(2155, 2908, 27, '1061FZ 2213', 7, 1340, 1, 'receiving', 446, '2024-03-31', 0, '{\"price\":\"1340\",\"qty\":\"7\"}', 'Stock from Receiving-27680138\n', '2021-11-11 14:30:50'),
(2156, 1404, 27, '3280FZ 1749', 6, 1340, 1, 'receiving', 446, '2023-10-31', 0, '{\"price\":\"1340\",\"qty\":\"6\"}', 'Stock from Receiving-27680138\n', '2021-11-11 14:30:51'),
(2157, 2910, 30, '2010001', 8, 2000, 1, 'receiving', 447, '2023-10-19', 0, '{\"price\":\"2000\",\"qty\":\"8\"}', 'Stock from Receiving-40114573\n', '2021-11-11 14:38:09'),
(2158, 1402, 30, '3983500070', 12, 750, 1, 'receiving', 448, '2022-11-30', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock from Receiving-64321272\n', '2021-11-11 14:40:36'),
(2159, 2911, 30, '146', 4, 2000, 1, 'receiving', 449, '2023-07-15', 0, '{\"price\":\"2000\",\"qty\":\"4\"}', 'Stock from Receiving-75748399\n', '2021-11-11 14:56:01'),
(2160, 1386, 30, '3015E', 11, 2200, 1, 'receiving', 450, '2024-05-31', 0, '{\"price\":\"2200\",\"qty\":\"11\"}', 'Stock from Receiving-40595373\n', '2021-11-11 14:57:54'),
(2161, 2714, 2, 'FAZ1AC1', 10, 600, 2, 'Sales', 1120, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock out from Sales-72843404\n', '2021-11-11 15:45:44'),
(2162, 1029, 2, '211056', 35, 100, 2, 'Sales', 1121, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"35\"}', 'Stock out from Sales-59117926\n', '2021-11-11 15:47:12'),
(2163, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 1122, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-05383613\n', '2021-11-11 15:47:49'),
(2164, 154, 284, 'SS20049', 6, 1700, 1, 'receiving', 451, '2023-09-30', 0, '{\"price\":\"1700\",\"qty\":\"6\"}', 'Stock from Receiving-09226829\n', '2021-11-11 15:58:57'),
(2165, 154, 284, 'SS20049', 1, 3000, 2, 'Sales', 1123, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-20667370\n', '2021-11-11 16:00:08');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(2166, 607, 2, 'EK21009', 20, 200, 2, 'Sales', 1124, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-84601690\n', '2021-11-11 16:01:55'),
(2167, 1402, 30, '3983500070', 1, 1000, 2, 'Sales', 1125, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-27885823\n', '2021-11-11 16:03:08'),
(2168, 2633, 287, '2101045', 1, 3500, 2, 'Sales', 1126, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-76080481\n', '2021-11-11 16:04:48'),
(2169, 117, 2, 'SKY0180', 5, 400, 2, 'Sales', 1127, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"5\"}', 'Stock out from Sales-69935721\n', '2021-11-11 16:06:24'),
(2170, 77, 2, '2106094', 10, 100, 2, 'Sales', 1128, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-08301353\n', '2021-11-11 17:13:58'),
(2171, 1497, 282, '83220495', 1, 5000, 2, 'Sales', 1129, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-14684075\n', '2021-11-11 18:00:16'),
(2172, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1130, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-97427728\n', '2021-11-11 18:00:52'),
(2173, 2859, 11, '0002', 1, 6000, 2, 'Sales', 1131, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-49596159\n', '2021-11-11 18:29:58'),
(2174, 301, 28, '20201109', 1, 2000, 2, 'Sales', 1132, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-42272627\n', '2021-11-11 18:36:38'),
(2175, 2744, 18, '200801', 2, 300, 2, 'Sales', 1133, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"2\"}', 'Stock out from Sales-12485981\n', '2021-11-11 18:37:16'),
(2176, 1137, 2, 'BH1011', 20, 100, 2, 'Sales', 1134, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-88246491\n', '2021-11-11 18:38:01'),
(2177, 2493, 2, '2103810002', 10, 800, 2, 'Sales', 1135, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"10\"}', 'Stock out from Sales-70739579\n', '2021-11-11 18:59:30'),
(2178, 2849, 18, '10803A', 2, 1000, 2, 'Sales', 1136, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-41935959\n', '2021-11-11 19:01:59'),
(2179, 2451, 135, '0201652', 1, 10000, 2, 'Sales', 1137, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-79224274\n', '2021-11-11 19:13:58'),
(2180, 890, 2, 'TK0048', 30, 100, 2, 'Sales', 1138, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-98041431\n', '2021-11-11 19:15:00'),
(2181, 2801, 1, 'CL1042', 10, 200, 2, 'Sales', 1139, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-75385536\n', '2021-11-11 19:27:09'),
(2182, 949, 2, 'EW211003', 200, 180, 1, 'receiving', 452, '2022-06-30', 0, '{\"price\":\"180\",\"qty\":\"200\"}', 'Stock from Receiving-52654774\n', '2021-11-11 19:35:02'),
(2183, 1342, 11, '1821DS17.35', 1, 3000, 2, 'Sales', 1140, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-08966551\n', '2021-11-11 22:00:49'),
(2184, 2850, 2, 'SR1013', 20, 50, 2, 'Sales', 1141, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-03182388\n', '2021-11-11 22:02:27'),
(2185, 1003, 2, '78273', 210, 100, 2, 'Sales', 1142, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"210\"}', 'Stock out from Sales-46315928\n', '2021-11-11 22:03:18'),
(2186, 1454, 11, '00000', 1, 2000, 2, 'Sales', 1143, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-07215398\n', '2021-11-11 22:03:55'),
(2187, 1434, 11, '036', 1, 3500, 2, 'Sales', 1144, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-55909224\n', '2021-11-11 22:18:34'),
(2188, 1386, 30, 'TTF8015E', 1, 3500, 2, 'Sales', 1145, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-82423610\n', '2021-11-11 22:22:17'),
(2189, 2751, 18, '200530', 1, 1000, 2, 'Sales', 1146, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-96530745\n', '2021-11-11 22:23:05'),
(2190, 2590, 30, 'MN209', 5, 200, 2, 'Sales', 1147, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-43471333\n', '2021-11-11 22:23:37'),
(2191, 1516, 11, '28425-01', 1, 5000, 2, 'Sales', 1148, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-02984873\n', '2021-11-11 22:25:28'),
(2192, 1200, 2, '2002979', 3, 2000, 2, 'Sales', 1149, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock out from Sales-89229594\n', '2021-11-11 22:26:08'),
(2193, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1150, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-90657589\n', '2021-11-11 22:28:07'),
(2194, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 1151, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-06135221\n', '2021-11-11 22:28:36'),
(2195, 1340, 282, '10022020', 1, 5000, 2, 'Sales', 1152, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-70414007\n', '2021-11-11 22:35:01'),
(2196, 48, 11, '1G77', 1, 3500, 2, 'Sales', 1153, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-68406749\n', '2021-11-11 22:37:11'),
(2197, 1029, 2, '211056', 10, 100, 2, 'Sales', 1154, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-05969575\n', '2021-11-11 22:37:40'),
(2198, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1155, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-67256420\n', '2021-11-11 22:38:05'),
(2199, 2850, 2, 'SR1013', 10, 50, 2, 'Sales', 1156, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-69480617\n', '2021-11-11 22:38:38'),
(2200, 1568, 282, 'CN123V', 1, 3500, 2, 'Sales', 1157, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-14610085\n', '2021-11-11 22:39:15'),
(2201, 24, 43, '', 1, 5000, 2, 'Sales', 1158, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-09712376\n', '2021-11-11 22:50:30'),
(2202, 1386, 30, 'TTF8015E', 1, 3500, 2, 'Sales', 1159, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-57380481\n', '2021-11-11 22:52:00'),
(2203, 2420, 11, '68G00620', 1, 2500, 2, 'Sales', 1160, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-85427469\n', '2021-11-11 23:14:30'),
(2204, 11, 1, '1E19', 20, 100, 2, 'Sales', 1161, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-91244955\n', '2021-11-11 23:15:49'),
(2205, 2770, 2, '13520', 1, 8000, 2, 'Sales', 1162, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-77481061\n', '2021-11-11 23:19:05'),
(2206, 1, 2, '3106023', 1, 2000, 2, 'Sales', 1163, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-54322468\n', '2021-11-11 23:19:43'),
(2207, 77, 2, '2106094', 5, 100, 2, 'Sales', 1164, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-37979595\n', '2021-11-11 23:24:17'),
(2208, 1332, 30, 'TMC19-001', 1, 3500, 2, 'Sales', 1165, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-24711578\n', '2021-11-12 08:43:08'),
(2209, 93, 2, 'HR1003', 10, 100, 2, 'Sales', 1166, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-39805553\n', '2021-11-12 08:44:06'),
(2210, 2790, 11, '', 1, 5000, 2, 'Sales', 1167, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-03162273\n', '2021-11-12 08:45:04'),
(2211, 110, 11, '78183', 1, 10000, 2, 'Sales', 1168, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-68085985\n', '2021-11-12 08:46:41'),
(2212, 1003, 2, '78273', 170, 100, 2, 'Sales', 1169, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"170\"}', 'Stock out from Sales-46302354\n', '2021-11-12 08:48:30'),
(2213, 2913, 28, '2221024', 10, 1450, 1, 'receiving', 453, '2022-12-31', 0, '{\"price\":\"1450\",\"qty\":\"10\"}', 'Stock from Receiving-75568497\n', '2021-11-12 14:48:37'),
(2214, 135, 248, 'CB04001', 40, 370, 1, 'receiving', 454, '2024-03-31', 0, '{\"price\":\"370\",\"qty\":\"40\"}', 'Stock from Receiving-18933649\n', '2021-11-12 14:52:22'),
(2215, 427, 2, '79317', 200, 17, 1, 'receiving', 455, '2024-06-30', 0, '{\"price\":\"17\",\"qty\":\"200\"}', 'Stock from Receiving-15170426\n', '2021-11-12 14:59:59'),
(2216, 2667, 2, 'AR21037', 10, 1500, 1, 'receiving', 456, '2023-06-30', 0, '{\"price\":\"1500\",\"qty\":\"10\"}', 'Stock from Receiving-00528278\n', '2021-11-12 15:01:45'),
(2217, 202, 11, 'EMPC211125', 10, 1750, 1, 'receiving', 457, '2023-08-31', 0, '{\"price\":\"1750\",\"qty\":\"10\"}', 'Stock from Receiving-72413967\n', '2021-11-12 15:06:12'),
(2218, 2891, 2, '9M122', 300, 60, 1, 'receiving', 458, '2022-08-31', 0, '{\"price\":\"60\",\"qty\":\"300\"}', 'Stock from Receiving-96898546\n', '2021-11-12 15:10:02'),
(2219, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 1170, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-01620453\n', '2021-11-12 15:11:16'),
(2220, 68, 2, '210337', 300, 31, 1, 'receiving', 459, '2026-02-28', 0, '{\"price\":\"31\",\"qty\":\"300\"}', 'Stock from Receiving-47288676\n', '2021-11-12 15:12:59'),
(2221, 1046, 2, '87675', 200, 68.5, 1, 'receiving', 460, '2025-05-31', 0, '{\"price\":\"68.5\",\"qty\":\"200\"}', 'Stock from Receiving-94114543\n', '2021-11-12 15:15:58'),
(2222, 2914, 1, '417IG02', 200, 77, 1, 'receiving', 461, '2022-10-31', 0, '{\"price\":\"77\",\"qty\":\"200\"}', 'Stock from Receiving-57602164\n', '2021-11-12 15:21:14'),
(2223, 2817, 28, '0D6210502', 40, 280, 1, 'receiving', 462, '2024-05-08', 0, '{\"price\":\"280\",\"qty\":\"40\"}', 'Stock from Receiving-51718269\n', '2021-11-12 15:24:32'),
(2224, 2458, 11, '10210993', 5, 1400, 1, 'receiving', 463, '2025-04-30', 0, '{\"price\":\"1400\",\"qty\":\"5\"}', 'Stock from Receiving-84347252\n', '2021-11-12 15:25:59'),
(2225, 889, 2, 'PM620030', 1000, 21, 1, 'receiving', 464, '2023-11-30', 0, '{\"price\":\"21\",\"qty\":\"1000\"}', 'Stock from Receiving-22357926\n', '2021-11-12 15:28:05'),
(2226, 565, 11, 'CCC3IA1', 3, 6550, 1, 'receiving', 465, '2022-08-31', 0, '{\"price\":\"6550\",\"qty\":\"3\"}', 'Stock from Receiving-36251024\n', '2021-11-12 15:29:30'),
(2227, 152, 284, 'G04421', 5, 1650, 1, 'receiving', 466, '2022-12-31', 0, '{\"price\":\"1650\",\"qty\":\"5\"}', 'Stock from Receiving-24493223\n', '2021-11-12 15:31:46'),
(2228, 1, 2, '2106031', 100, 128, 1, 'receiving', 467, '2023-05-31', 0, '{\"price\":\"128\",\"qty\":\"100\"}', 'Stock from Receiving-42831618\n', '2021-11-12 15:33:56'),
(2229, 14, 2, '1B43', 100, 88, 1, 'receiving', 468, '2025-01-31', 0, '{\"price\":\"88\",\"qty\":\"100\"}', 'Stock from Receiving-53032808\n', '2021-11-12 15:35:55'),
(2230, 1003, 2, '78273', 1500, 35, 1, 'receiving', 469, '2024-01-31', 0, '{\"price\":\"35\",\"qty\":\"1500\"}', 'Stock from Receiving-15411532\n', '2021-11-12 15:48:16'),
(2231, 613, 2, '10201396', 75, 200, 1, 'receiving', 470, '2022-07-31', 0, '{\"price\":\"200\",\"qty\":\"75\"}', 'Stock from Receiving-43794256\n', '2021-11-12 16:03:04'),
(2232, 613, 0, '10201396', 10, 400, 2, 'Sales', 1171, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-09914192\n', '2021-11-12 16:04:45'),
(2233, 286, 2, '417IA06', 3, 1500, 2, 'Sales', 1171, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock out from Sales-09914192\n', '2021-11-12 16:04:45'),
(2234, 108, 2, 'EPRH0761', 5, 100, 2, 'Sales', 1171, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-09914192\n', '2021-11-12 16:04:45'),
(2235, 765, 2, '90138', 10, 300, 2, 'Sales', 1172, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-60978252\n', '2021-11-12 16:07:19'),
(2236, 77, 2, '2106094', 10, 100, 2, 'Sales', 1172, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-60978252\n', '2021-11-12 16:07:19'),
(2237, 5, 284, 'AB124', 1, 4000, 2, 'Sales', 1172, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-60978252\n', '2021-11-12 16:07:19'),
(2238, 442, 2, 'T0100', 10, 200, 2, 'Sales', 1172, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-60978252\n', '2021-11-12 16:07:19'),
(2239, 1470, 289, '027RC', 1, 3500, 2, 'Sales', 1172, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-60978252\n', '2021-11-12 16:07:19'),
(2240, 2758, 10, '40050', 1, 1500, 2, 'Sales', 1173, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-25441839\n', '2021-11-12 16:09:24'),
(2241, 2759, 10, '', 1, 1500, 2, 'Sales', 1173, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-25441839\n', '2021-11-12 16:09:24'),
(2242, 1316, 30, '', 1, 15000, 2, 'Sales', 1174, '0000-00-00', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock out from Sales-48991070\n', '2021-11-12 16:14:45'),
(2243, 1568, 282, 'CN123V', 1, 3500, 2, 'Sales', 1175, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-02820474\n', '2021-11-12 16:15:45'),
(2244, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 1176, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-26642744\n', '2021-11-12 16:17:21'),
(2245, 1223, 2, 'X26E9008', 2, 2000, 2, 'Sales', 1177, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-96791605\n', '2021-11-12 16:17:58'),
(2246, 2907, 30, 'L30191103', 1, 1000, 2, 'Sales', 1178, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-44950485\n', '2021-11-12 16:20:18'),
(2247, 248, 28, 'RV00011', 5, 2500, 1, 'receiving', 471, '2022-05-31', 0, '{\"price\":\"2500\",\"qty\":\"5\"}', 'Stock from Receiving-05212134\n', '2021-11-12 16:24:37'),
(2248, 248, 28, 'RV00011', 2, 40000, 2, 'Sales', 1179, '0000-00-00', 0, '{\"price\":\"40000\",\"qty\":\"2\"}', 'Stock out from Sales-38475141\n', '2021-11-12 16:27:54'),
(2249, 2645, 11, '200635', 1, 3000, 2, 'Sales', 1180, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-59591384\n', '2021-11-12 16:29:25'),
(2250, 1196, 2, 'CA05549', 14, 500, 2, 'Sales', 1181, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"14\"}', 'Stock out from Sales-95463641\n', '2021-11-12 16:30:28'),
(2251, 825, 2, 'B6FOT005', 30, 500, 2, 'Sales', 1182, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-11476821\n', '2021-11-12 16:31:07'),
(2252, 1003, 2, '78273', 200, 100, 2, 'Sales', 1183, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"200\"}', 'Stock out from Sales-81012433\n', '2021-11-12 16:32:30'),
(2253, 375, 2, 'CA2520003-A', 10, 200, 2, 'Sales', 1184, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-27171667\n', '2021-11-12 16:39:25'),
(2254, 938, 2, 'G004732', 10, 100, 2, 'Sales', 1185, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-64702309\n', '2021-11-12 16:40:00'),
(2255, 2807, 2, '200015', 10, 100, 2, 'Sales', 1186, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-53954817\n', '2021-11-12 16:41:07'),
(2256, 2807, 2, '200015', 30, 100, 2, 'Sales', 1187, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-99522607\n', '2021-11-12 16:41:42'),
(2257, 451, 2, 'M2108109', 1, 38000, 2, 'Sales', 1188, '0000-00-00', 0, '{\"price\":\"38000\",\"qty\":\"1\"}', 'Stock out from Sales-14456694\n', '2021-11-12 16:42:41'),
(2258, 1297, 2, 'PA09750', 30, 500, 2, 'Sales', 1189, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-65151440\n', '2021-11-12 16:43:15'),
(2259, 1003, 2, '78273', 40, 100, 2, 'Sales', 1190, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"40\"}', 'Stock out from Sales-79796134\n', '2021-11-12 16:52:57'),
(2260, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1191, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-70641504\n', '2021-11-12 16:53:44'),
(2261, 252, 2, '', 1, 3000, 2, 'Sales', 1192, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-11465591\n', '2021-11-12 16:54:42'),
(2262, 1003, 2, '78273', 50, 100, 2, 'Sales', 1193, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"50\"}', 'Stock out from Sales-37532897\n', '2021-11-12 16:56:20'),
(2263, 1333, 30, '2804T3', 1, 2500, 2, 'Sales', 1194, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-61722083\n', '2021-11-12 16:57:11'),
(2264, 396, 1, '0104003', 10, 500, 2, 'Sales', 1195, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock out from Sales-40740124\n', '2021-11-12 16:59:36'),
(2265, 2825, 1, '00319', 30, 1500, 2, 'Sales', 1196, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"30\"}', 'Stock out from Sales-25164733\n', '2021-11-12 17:00:31'),
(2266, 1175, 283, 'CC21', 1, 2000, 2, 'Sales', 1197, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-39815275\n', '2021-11-12 17:01:53'),
(2267, 2850, 2, 'ZA1011', 30, 50, 2, 'Sales', 1198, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"30\"}', 'Stock out from Sales-84119255\n', '2021-11-12 17:02:40'),
(2268, 2, 2, 'AXF2009001', 5, 200, 2, 'Sales', 1199, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-18270357\n', '2021-11-12 17:03:43'),
(2269, 2530, 289, 'L11PP', 1, 6000, 2, 'Sales', 1200, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-97419378\n', '2021-11-12 17:04:43'),
(2270, 723, 2, '210735', 10, 300, 2, 'Sales', 1201, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-88404231\n', '2021-11-12 17:46:20'),
(2271, 94, 2, 'AB52892', 10, 400, 2, 'Sales', 1202, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-38822361\n', '2021-11-12 17:46:51'),
(2272, 2606, 287, 'E16UP19018', 1, 5000, 2, 'Sales', 1203, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-62576828\n', '2021-11-12 17:52:14'),
(2273, 2791, 288, '1C71', 1, 2000, 2, 'Sales', 1204, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-81655823\n', '2021-11-12 17:57:09'),
(2274, 2850, 2, 'ZA1011', 20, 50, 2, 'Sales', 1205, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-10089908\n', '2021-11-12 17:58:02'),
(2275, 286, 2, '417IA06', 3, 1500, 2, 'Sales', 1206, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock out from Sales-83741784\n', '2021-11-12 17:58:40'),
(2276, 2441, 11, '201326', 1, 3000, 2, 'Sales', 1207, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-21599696\n', '2021-11-12 18:17:15'),
(2277, 2651, 1, '', 1, 10000, 2, 'Sales', 1210, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-16601813\n', '2021-11-12 18:40:35'),
(2278, 1223, 2, 'X26E9008', 5, 2000, 2, 'Sales', 1211, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-15500663\n', '2021-11-12 18:43:21'),
(2279, 2512, 0, 'Y140XN', 10, 100, 2, 'Sales', 1212, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-04661035\n', '2021-11-12 18:44:11'),
(2280, 2879, 27, '952-1', 1, 5000, 2, 'Sales', 1213, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-15602969\n', '2021-11-12 18:49:16'),
(2281, 116, 2, 'ABL1521007A', 10, 300, 2, 'Sales', 1214, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-85448305\n', '2021-11-12 18:58:20'),
(2282, 69, 2, 'UM1010', 20, 250, 2, 'Sales', 1215, '0000-00-00', 0, '{\"price\":\"250\",\"qty\":\"20\"}', 'Stock out from Sales-25975441\n', '2021-11-12 18:59:01'),
(2283, 1333, 30, '2804T3', 1, 2500, 2, 'Sales', 1216, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-71271245\n', '2021-11-12 19:18:33'),
(2284, 2883, 1, 'CF 1005', 30, 100, 2, 'Sales', 1217, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-40555898\n', '2021-11-12 19:23:53'),
(2285, 1084, 2, '200174', 30, 100, 2, 'Sales', 1218, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-55710494\n', '2021-11-12 19:25:15'),
(2286, 2470, 11, '202257', 1, 3000, 2, 'Sales', 1219, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-74476102\n', '2021-11-12 19:38:27'),
(2287, 2696, 115, '', 1, 1000, 2, 'Sales', 1220, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-93504040\n', '2021-11-12 19:39:02'),
(2288, 2493, 2, '2103810002', 1, 800, 2, 'Sales', 1221, '0000-00-00', 0, '{\"price\":\"800\",\"qty\":\"1\"}', 'Stock out from Sales-77932135\n', '2021-11-12 19:39:37'),
(2289, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1222, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-19920005\n', '2021-11-12 19:40:17'),
(2290, 135, 248, 'CB04002', 4, 600, 2, 'Sales', 1223, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"4\"}', 'Stock out from Sales-58501466\n', '2021-11-12 19:40:58'),
(2291, 135, 248, 'CB04001', 4, 600, 2, 'Sales', 1224, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"4\"}', 'Stock out from Sales-05111787\n', '2021-11-12 20:29:35'),
(2292, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1225, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-12332460\n', '2021-11-12 20:36:43'),
(2293, 2895, 2, 'BV1004', 1, 1000, 2, 'Sales', 1226, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-52068758\n', '2021-11-12 20:37:37'),
(2294, 1569, 282, '0333TH112N', 1, 3500, 2, 'Sales', 1227, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-93133037\n', '2021-11-12 20:39:06'),
(2295, 2597, 2, '', 5, 2000, 2, 'Sales', 1228, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-33140127\n', '2021-11-12 20:40:16'),
(2296, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 1229, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-43468190\n', '2021-11-12 20:41:28'),
(2297, 11, 1, '1E19', 30, 100, 2, 'Sales', 1230, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-44590671\n', '2021-11-12 20:42:13'),
(2298, 899, 2, 'EOSGDT001', 1, 20000, 2, 'Sales', 1231, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-84894081\n', '2021-11-12 20:46:52'),
(2299, 723, 2, '210735', 10, 300, 2, 'Sales', 1232, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-09145842\n', '2021-11-12 20:47:36'),
(2300, 2520, 1, '1B27F1', 30, 300, 2, 'Sales', 1233, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"30\"}', 'Stock out from Sales-89746909\n', '2021-11-12 20:48:17'),
(2301, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1234, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-58943767\n', '2021-11-12 20:49:07'),
(2302, 1305, 1, '0F17F3', 5, 900, 2, 'Sales', 1235, '0000-00-00', 0, '{\"price\":\"900\",\"qty\":\"5\"}', 'Stock out from Sales-26720022\n', '2021-11-12 20:51:02'),
(2303, 1137, 2, 'BH1011', 10, 100, 2, 'Sales', 1236, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-84950885\n', '2021-11-12 21:13:02'),
(2304, 2636, 11, '2106100', 1, 3000, 2, 'Sales', 1237, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-13644592\n', '2021-11-12 21:14:54'),
(2305, 2734, 18, '20190822', 5, 200, 2, 'Sales', 1238, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-42112939\n', '2021-11-12 21:18:43'),
(2306, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1239, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-27753257\n', '2021-11-12 21:19:06'),
(2307, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1240, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-52050749\n', '2021-11-12 22:01:16'),
(2308, 2628, 11, '519Y1', 1, 10000, 2, 'Sales', 1241, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-11667089\n', '2021-11-12 22:11:05'),
(2309, 2896, 11, 'AFG4JB1', 1, 2000, 2, 'Sales', 1242, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-43106462\n', '2021-11-12 22:11:31'),
(2310, 2465, 2, 'ST.335', 2, 100, 2, 'Sales', 1243, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"2\"}', 'Stock out from Sales-62881377\n', '2021-11-12 22:26:48'),
(2311, 2519, 1, '1C14B1', 4, 500, 2, 'Sales', 1244, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"4\"}', 'Stock out from Sales-37111878\n', '2021-11-13 00:14:24'),
(2312, 1400, 30, '0000-0000', 1, 1000, 2, 'Sales', 1245, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-88934721\n', '2021-11-13 00:17:04'),
(2313, 2674, 11, '0000', 1, 2000, 2, 'Sales', 1246, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-85500255\n', '2021-11-13 00:17:46'),
(2314, 285, 2, '2105071', 6, 750, 2, 'Sales', 1247, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-71029893\n', '2021-11-13 00:24:37'),
(2315, 14, 2, '1B43', 2, 200, 2, 'Sales', 1248, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-97181974\n', '2021-11-13 00:25:24'),
(2316, 243, 31, '', 1, 2500, 2, 'Sales', 1249, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-43573166\n', '2021-11-13 00:26:10'),
(2317, 2528, 30, '1009 2702', 1, 2000, 2, 'Sales', 1250, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-39209881\n', '2021-11-13 00:26:40'),
(2318, 415, 2, 'CCT20002E', 10, 100, 2, 'Sales', 1251, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-95967017\n', '2021-11-13 00:27:20'),
(2319, 1569, 282, '0333TH112N', 1, 3500, 2, 'Sales', 1252, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-80315596\n', '2021-11-13 00:28:00'),
(2320, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 1253, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-41220826\n', '2021-11-13 00:28:47'),
(2321, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1254, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-25336255\n', '2021-11-13 00:29:19'),
(2322, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1255, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-17726437\n', '2021-11-13 08:49:44'),
(2323, 1, 2, '2106031', 10, 200, 2, 'Sales', 1256, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-12033947\n', '2021-11-13 11:02:51'),
(2324, 1003, 2, '78273', 100, 100, 2, 'Sales', 1256, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"100\"}', 'Stock out from Sales-12033947\n', '2021-11-13 11:02:51'),
(2325, 1497, 282, '', 1, 5000, 2, 'Sales', 1257, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-12333374\n', '2021-11-13 11:04:13'),
(2326, 1420, 30, '0621', 2, 1500, 2, 'Sales', 1257, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock out from Sales-12333374\n', '2021-11-13 11:04:13'),
(2327, 1357, 11, '0421OL', 1, 5000, 2, 'Sales', 1258, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-21159780\n', '2021-11-13 11:19:51'),
(2328, 993, 2, 'Y0B3UL', 10, 150, 2, 'Sales', 1259, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-57774955\n', '2021-11-13 11:21:40'),
(2329, 1558, 282, 'L-357 J', 1, 1500, 2, 'Sales', 1259, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-57774955\n', '2021-11-13 11:21:40'),
(2330, 2915, 284, '77975', 5, 750, 1, 'receiving', 472, '2023-11-30', 0, '{\"price\":\"750\",\"qty\":\"5\"}', 'Stock from Receiving-81456448\n', '2021-11-13 11:27:55'),
(2331, 2915, 284, '77975', 1, 1500, 2, 'Sales', 1260, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-16466066\n', '2021-11-13 11:29:26'),
(2332, 856, 2, '9Y3', 20, 200, 2, 'Sales', 1261, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-14498332\n', '2021-11-13 11:30:11'),
(2333, 842, 2, 'ABL 1521007A', 10, 170, 1, 'receiving', 473, '2023-03-13', 0, '{\"price\":\"170\",\"qty\":\"10\"}', 'Stock from Receiving-35683800\n', '2021-11-13 11:51:50'),
(2334, 842, 2, '', 10, 300, 2, 'Sales', 1262, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-44938417\n', '2021-11-13 11:54:10'),
(2335, 684, 2, 'HH0008', 10, 100, 2, 'Sales', 1263, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-14422354\n', '2021-11-13 11:54:55'),
(2336, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 1264, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-94798728\n', '2021-11-13 11:57:21'),
(2337, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 1265, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-51093727\n', '2021-11-13 11:58:45'),
(2338, 2873, 2, 'T0332', 10, 100, 2, 'Sales', 1266, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-81061489\n', '2021-11-13 12:00:18'),
(2339, 889, 2, 'PM620021', 15, 100, 2, 'Sales', 1267, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-16370107\n', '2021-11-13 12:02:21'),
(2340, 2883, 1, 'CF 1005', 15, 100, 2, 'Sales', 1268, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-22733734\n', '2021-11-13 12:03:32'),
(2341, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 1269, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-05303598\n', '2021-11-13 12:04:22'),
(2342, 248, 0, 'RV00011', 1, 40000, 2, 'Sales', 1270, '0000-00-00', 0, '{\"price\":\"40000\",\"qty\":\"1\"}', 'Stock out from Sales-86515668\n', '2021-11-13 12:05:13'),
(2343, 285, 2, '2105071', 12, 750, 2, 'Sales', 1271, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-75091621\n', '2021-11-13 12:06:10'),
(2344, 2641, 11, '10210862', 1, 5000, 2, 'Sales', 1272, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-84231191\n', '2021-11-13 12:15:25'),
(2345, 2883, 1, 'CF 1005', 10, 100, 2, 'Sales', 1273, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-15984837\n', '2021-11-13 12:16:49'),
(2346, 1402, 30, '3983500070', 4, 1000, 2, 'Sales', 1274, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"4\"}', 'Stock out from Sales-96750207\n', '2021-11-13 12:17:40'),
(2347, 1570, 282, 'B25', 4, 2200, 1, 'receiving', 474, '2024-03-23', 0, '{\"price\":\"2200\",\"qty\":\"4\"}', 'Stock from Receiving-35915592\n', '2021-11-13 12:43:38'),
(2348, 1568, 282, 'CN123V', 3, 2000, 1, 'receiving', 475, '2023-11-30', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-44351442\n', '2021-11-13 12:46:57'),
(2349, 243, 31, '1920', 24, 1500, 1, 'receiving', 476, '2024-06-30', 0, '{\"price\":\"1500\",\"qty\":\"24\"}', 'Stock from Receiving-23396877\n', '2021-11-13 12:50:43'),
(2350, 236, 11, 'A00018', 3, 6500, 1, 'receiving', 477, '2022-02-28', 0, '{\"price\":\"6500\",\"qty\":\"3\"}', 'Stock from Receiving-75533683\n', '2021-11-13 12:52:50'),
(2351, 1520, 11, '893512', 8, 6000, 1, 'receiving', 478, '2023-07-31', 0, '{\"price\":\"6000\",\"qty\":\"8\"}', 'Stock from Receiving-38503299\n', '2021-11-13 12:59:29'),
(2352, 918, 11, '2102142', 1, 2000, 2, 'Sales', 1275, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-32704686\n', '2021-11-13 13:00:35'),
(2353, 2916, 11, '324207', 3, 9500, 1, 'receiving', 479, '2022-04-30', 0, '{\"price\":\"9500\",\"qty\":\"3\"}', 'Stock from Receiving-70728518\n', '2021-11-13 13:08:09'),
(2354, 2916, 11, '324207', 1, 14000, 2, 'Sales', 1276, '0000-00-00', 0, '{\"price\":\"14000\",\"qty\":\"1\"}', 'Stock out from Sales-17859648\n', '2021-11-13 13:10:31'),
(2355, 2710, 1, '1D23C1', 10, 600, 2, 'Sales', 1277, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"10\"}', 'Stock out from Sales-56184819\n', '2021-11-13 13:11:16'),
(2356, 285, 2, '2105071', 6, 750, 2, 'Sales', 1278, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-24715147\n', '2021-11-13 13:11:56'),
(2357, 77, 2, '2108035', 420, 45, 1, 'receiving', 480, '2025-07-31', 0, '{\"price\":\"45\",\"qty\":\"420\"}', 'Stock from Receiving-36244235\n', '2021-11-13 13:18:49'),
(2358, 214, 2, '164F1', 30, 150, 2, 'Sales', 1279, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock out from Sales-98794773\n', '2021-11-13 13:20:32'),
(2359, 825, 2, 'B6FOT005', 30, 500, 2, 'Sales', 1279, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-98794773\n', '2021-11-13 13:20:32'),
(2360, 1443, 11, 'QO173', 1, 2000, 2, 'Sales', 1280, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-17562478\n', '2021-11-13 13:30:21'),
(2361, 2576, 11, '12762691', 2, 3500, 1, 'receiving', 481, '2024-07-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-84314094\n', '2021-11-13 13:46:56'),
(2362, 2576, 11, '12762691', 1, 5000, 2, 'Sales', 1281, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-44893496\n', '2021-11-13 13:49:26'),
(2363, 1003, 2, '78273', 210, 100, 2, 'Sales', 1282, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"210\"}', 'Stock out from Sales-30521502\n', '2021-11-13 14:21:11'),
(2364, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 1283, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-87184930\n', '2021-11-13 14:22:54'),
(2365, 1349, 11, '14', 10, 4000, 1, 'receiving', 482, '2024-06-10', 0, '{\"price\":\"4000\",\"qty\":\"10\"}', 'Stock from Receiving-99565359\n', '2021-11-13 16:04:25'),
(2366, 1349, 11, '14', 1, 6000, 2, 'Sales', 1284, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-90783633\n', '2021-11-13 16:07:43'),
(2367, 1331, 30, 'TMC19-002', 1, 2500, 2, 'Sales', 1285, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-76641351\n', '2021-11-13 16:48:15'),
(2368, 723, 2, '210735', 5, 300, 2, 'Sales', 1286, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-19734430\n', '2021-11-13 16:49:12'),
(2369, 108, 2, 'EPRH0761', 10, 100, 2, 'Sales', 1287, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-55443094\n', '2021-11-13 16:50:16'),
(2370, 889, 2, 'PM620021', 25, 100, 2, 'Sales', 1288, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"25\"}', 'Stock out from Sales-43053067\n', '2021-11-13 16:51:28'),
(2371, 945, 2, '200127', 20, 200, 2, 'Sales', 1289, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-60278506\n', '2021-11-13 16:52:11'),
(2372, 649, 1, 'FUCO13', 10, 1000, 2, 'Sales', 1290, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"10\"}', 'Stock out from Sales-98064290\n', '2021-11-13 16:53:09'),
(2373, 818, 2, 'CA05561', 5, 200, 2, 'Sales', 1291, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-20821613\n', '2021-11-13 16:54:32'),
(2374, 1200, 2, '2002979', 5, 2000, 2, 'Sales', 1292, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-54205339\n', '2021-11-13 16:55:46'),
(2375, 180, 2, 'AR015G', 30, 150, 2, 'Sales', 1293, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"30\"}', 'Stock out from Sales-92005471\n', '2021-11-13 17:26:33'),
(2376, 2622, 11, 'PZF21008', 1, 3000, 2, 'Sales', 1294, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-02922148\n', '2021-11-13 18:05:20'),
(2377, 1149, 2, '1F51', 2, 3000, 2, 'Sales', 1295, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"2\"}', 'Stock out from Sales-75432622\n', '2021-11-13 18:06:09'),
(2378, 1412, 30, '052021SZ100', 1, 1500, 2, 'Sales', 1296, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-25110152\n', '2021-11-13 18:11:48'),
(2379, 684, 2, 'HH0008', 30, 100, 2, 'Sales', 1297, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-34138631\n', '2021-11-13 18:26:09'),
(2380, 684, 2, 'HH0008', 10, 100, 2, 'Sales', 1299, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-03895802\n', '2021-11-13 18:36:16'),
(2381, 2841, 10, 'BSKZ756', 1, 6000, 2, 'Sales', 1300, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-95450115\n', '2021-11-13 18:49:10'),
(2382, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 1301, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-47487445\n', '2021-11-13 18:49:40'),
(2383, 730, 288, 'LK 1013', 1, 3500, 2, 'Sales', 1302, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-80906836\n', '2021-11-13 18:59:24'),
(2384, 488, 11, '324905', 1, 14000, 2, 'Sales', 1302, '0000-00-00', 0, '{\"price\":\"14000\",\"qty\":\"1\"}', 'Stock out from Sales-80906836\n', '2021-11-13 18:59:25'),
(2385, 2863, 11, '10821JU009RM', 1, 1000, 2, 'Sales', 1303, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-34826896\n', '2021-11-13 19:01:36'),
(2386, 285, 2, '2105071', 6, 750, 2, 'Sales', 1303, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-34826896\n', '2021-11-13 19:01:36'),
(2387, 2597, 2, '', 2, 2000, 2, 'Sales', 1304, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-44621953\n', '2021-11-13 19:03:48'),
(2388, 1408, 30, '6401-09', 1, 5000, 2, 'Sales', 1305, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-24162908\n', '2021-11-13 19:11:44'),
(2389, 1393, 30, '323E', 1, 3000, 2, 'Sales', 1305, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-24162908\n', '2021-11-13 19:11:44'),
(2390, 2848, 281, 'RK02721222 17', 1, 4000, 2, 'Sales', 1305, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-24162908\n', '2021-11-13 19:11:44'),
(2391, 87, 2, '9L104', 10, 150, 2, 'Sales', 1306, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-01721610\n', '2021-11-13 19:12:39'),
(2392, 2790, 288, 'A1ALK006', 1, 3200, 1, 'receiving', 483, '2023-05-31', 0, '{\"price\":\"3200\",\"qty\":\"1\"}', 'Stock from Receiving-73165933\n', '2021-11-13 19:35:06'),
(2393, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 1307, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-79095608\n', '2021-11-13 19:37:43'),
(2394, 2765, 2, 'TL670001', 2, 2000, 2, 'Sales', 1307, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock out from Sales-79095608\n', '2021-11-13 19:37:43'),
(2395, 1317, 30, 'T2', 1, 15000, 2, 'Sales', 1307, '0000-00-00', 0, '{\"price\":\"15000\",\"qty\":\"1\"}', 'Stock out from Sales-79095608\n', '2021-11-13 19:37:43'),
(2396, 111, 2, '210919', 10, 100, 2, 'Sales', 1308, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-96053778\n', '2021-11-13 19:39:05'),
(2397, 14, 2, '1B43', 1, 200, 2, 'Sales', 1309, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"1\"}', 'Stock out from Sales-86598109\n', '2021-11-13 20:51:46'),
(2398, 225, 2, 'EN2520012-A', 5, 1000, 2, 'Sales', 1310, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"5\"}', 'Stock out from Sales-84285353\n', '2021-11-13 20:57:01'),
(2399, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 1311, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-03371083\n', '2021-11-13 20:57:38'),
(2400, 1398, 30, '0508215202', 1, 2500, 2, 'Sales', 1312, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"1\"}', 'Stock out from Sales-54466919\n', '2021-11-13 20:58:05'),
(2401, 145, 11, 'AE209', 1, 3000, 2, 'Sales', 1313, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-90508284\n', '2021-11-13 20:59:28'),
(2402, 2882, 30, 'T002', 1, 3000, 2, 'Sales', 1314, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-17531425\n', '2021-11-13 21:04:27'),
(2403, 77, 2, '2108035', 10, 100, 2, 'Sales', 1315, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-17120372\n', '2021-11-13 21:05:06'),
(2404, 2611, 11, 'G109', 1, 3500, 2, 'Sales', 1316, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-34533728\n', '2021-11-13 21:05:49'),
(2405, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1317, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-78875948\n', '2021-11-13 21:06:20'),
(2406, 2644, 288, '21014', 1, 2000, 2, 'Sales', 1318, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-57555772\n', '2021-11-13 21:34:18'),
(2407, 2895, 2, 'BV1004', 3, 1000, 2, 'Sales', 1319, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-14027331\n', '2021-11-13 21:34:55'),
(2408, 2645, 11, '200635', 1, 3000, 2, 'Sales', 1320, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-64754601\n', '2021-11-13 21:35:26'),
(2409, 411, 2, 'C3210014', 10, 200, 2, 'Sales', 1321, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-11705060\n', '2021-11-13 21:35:53'),
(2410, 287, 2, 'ZLM2103004', 6, 750, 2, 'Sales', 1322, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-44608396\n', '2021-11-13 21:36:22'),
(2411, 488, 11, '324905', 1, 14000, 2, 'Sales', 1323, '0000-00-00', 0, '{\"price\":\"14000\",\"qty\":\"1\"}', 'Stock out from Sales-92726500\n', '2021-11-13 21:37:06'),
(2412, 1400, 30, '0000-0000', 1, 1000, 2, 'Sales', 1324, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-34140731\n', '2021-11-13 21:37:59'),
(2413, 2465, 2, 'ST.335', 5, 100, 2, 'Sales', 1325, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-91983536\n', '2021-11-13 21:38:45'),
(2414, 285, 2, '2105071', 6, 750, 2, 'Sales', 1326, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-21831805\n', '2021-11-13 21:39:09'),
(2415, 2451, 135, '0201652', 1, 10000, 2, 'Sales', 1327, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-20074744\n', '2021-11-13 21:50:05'),
(2416, 1, 2, '2106031', 10, 200, 2, 'Sales', 1328, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-59359465\n', '2021-11-13 21:56:34'),
(2417, 2885, 18, 'l29191102', 1, 1000, 2, 'Sales', 1329, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-30832698\n', '2021-11-13 21:56:52'),
(2418, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 1330, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-04835409\n', '2021-11-13 21:57:11'),
(2419, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1331, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-74947128\n', '2021-11-13 22:39:26'),
(2420, 410, 2, 'A52101', 0, 0, 3, 'expire', 14, '2022-01-28', 1, '{\"batch_no\":\"A52101\",\"qty\":\"0\"}', 'Stock from Expiring-14', '2021-11-13 23:01:42'),
(2421, 11, 1, '1E19', 15, 100, 2, 'Sales', 1332, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-15315343\n', '2021-11-13 23:40:14'),
(2422, 2458, 11, '10210690', 1, 3500, 2, 'Sales', 1333, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-39234054\n', '2021-11-14 07:07:29'),
(2423, 1137, 2, 'BH1011', 30, 100, 2, 'Sales', 1334, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-93907901\n', '2021-11-14 07:07:57'),
(2424, 1416, 18, '00-0000', 2, 1500, 2, 'Sales', 1335, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"2\"}', 'Stock out from Sales-45454316\n', '2021-11-14 07:10:05'),
(2425, 2710, 1, '1D23C1', 5, 600, 2, 'Sales', 1336, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"5\"}', 'Stock out from Sales-09958539\n', '2021-11-14 07:37:51'),
(2426, 48, 11, '1G77', 1, 3500, 2, 'Sales', 1337, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-90031390\n', '2021-11-14 08:06:43'),
(2427, 723, 2, '210735', 10, 300, 2, 'Sales', 1338, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-73483398\n', '2021-11-14 08:44:36'),
(2428, 2791, 288, '1C71', 1, 2000, 2, 'Sales', 1339, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-88150433\n', '2021-11-14 09:12:58'),
(2429, 1184, 2, 'OL0004', 6, 500, 2, 'Sales', 1340, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"6\"}', 'Stock out from Sales-51090992\n', '2021-11-14 09:15:38'),
(2430, 1491, 11, 'HW/53ML/RED/2020-10', 1, 3500, 2, 'Sales', 1341, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-68813160\n', '2021-11-14 09:25:52'),
(2431, 2634, 11, '2008221', 1, 3500, 2, 'Sales', 1342, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-38844602\n', '2021-11-14 10:12:05'),
(2432, 2528, 30, '1009 2702', 1, 2000, 2, 'Sales', 1342, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-38844602\n', '2021-11-14 10:12:05'),
(2433, 2863, 11, '10821JU009RM', 1, 10000, 2, 'Sales', 1343, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-68770628\n', '2021-11-14 10:16:41'),
(2434, 684, 2, 'HH0014', 10, 100, 2, 'Sales', 1343, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68770628\n', '2021-11-14 10:16:41'),
(2435, 1029, 2, '211056', 10, 100, 2, 'Sales', 1343, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68770628\n', '2021-11-14 10:16:41'),
(2436, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1343, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68770628\n', '2021-11-14 10:16:41'),
(2437, 285, 2, '2105071', 12, 750, 2, 'Sales', 1344, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-41726906\n', '2021-11-14 11:29:38'),
(2438, 2850, 2, 'ZA1011', 20, 50, 2, 'Sales', 1344, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-41726906\n', '2021-11-14 11:29:38'),
(2439, 378, 2, '87092', 30, 200, 2, 'Sales', 1344, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-41726906\n', '2021-11-14 11:29:38'),
(2440, 378, 2, '87092', 10, 200, 2, 'Sales', 1345, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-44262841\n', '2021-11-14 11:52:05'),
(2441, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1346, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-34335834\n', '2021-11-14 12:04:11'),
(2442, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 1346, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-34335834\n', '2021-11-14 12:04:11'),
(2443, 425, 11, '21020', 1, 2000, 2, 'Sales', 1347, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-85084538\n', '2021-11-14 12:06:27'),
(2444, 77, 2, '2108035', 10, 100, 2, 'Sales', 1347, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-85084538\n', '2021-11-14 12:06:27'),
(2445, 2693, 115, 'HLM-107', 2, 500, 2, 'Sales', 1348, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-07067421\n', '2021-11-14 12:09:05'),
(2446, 2590, 30, 'MNC211', 30, 200, 2, 'Sales', 1348, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock out from Sales-07067421\n', '2021-11-14 12:09:05'),
(2447, 117, 2, 'SKY0180', 10, 400, 2, 'Sales', 1349, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-42194584\n', '2021-11-14 12:40:57'),
(2448, 2789, 288, '', 1, 2000, 2, 'Sales', 1349, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-42194584\n', '2021-11-14 12:40:57'),
(2449, 2696, 115, 'KL620010', 8, 500, 1, 'receiving', 484, '2025-01-31', 0, '{\"price\":\"500\",\"qty\":\"8\"}', 'Stock from Receiving-44963903\n', '2021-11-14 12:45:45'),
(2450, 2696, 115, 'KL620010', 1, 1000, 2, 'Sales', 1350, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-15505061\n', '2021-11-14 12:47:33'),
(2451, 2773, 35, 'KA03237', 1, 3000, 2, 'Sales', 1351, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-63164727\n', '2021-11-14 12:59:23'),
(2452, 2773, 2, 'KA03237', 1, 3000, 2, 'Sales', 1352, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-92022181\n', '2021-11-14 13:00:33'),
(2453, 2578, 11, '213701', 1, 20000, 2, 'Sales', 1353, '0000-00-00', 0, '{\"price\":\"20000\",\"qty\":\"1\"}', 'Stock out from Sales-22465928\n', '2021-11-14 13:07:23'),
(2454, 2810, 2, 'D00865', 30, 100, 2, 'Sales', 1353, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-22465928\n', '2021-11-14 13:07:23'),
(2455, 962, 2, 'OP20029', 10, 100, 2, 'Sales', 1353, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-22465928\n', '2021-11-14 13:07:23'),
(2456, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 1353, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-22465928\n', '2021-11-14 13:07:23'),
(2457, 1137, 1, 'BH1011', 75, 50, 1, 'receiving', 485, '2024-02-29', 0, '{\"price\":\"50\",\"qty\":\"75\"}', 'Stock from Receiving-38446762\n', '2021-11-14 13:10:58'),
(2458, 46, 287, 'BL 1013', 1, 3000, 2, 'Sales', 1354, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-00566952\n', '2021-11-14 13:39:15'),
(2459, 2788, 288, '21520134', 1, 7000, 2, 'Sales', 1354, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-00566952\n', '2021-11-14 13:39:15'),
(2460, 145, 11, 'AE209', 1, 3000, 2, 'Sales', 1354, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-00566952\n', '2021-11-14 13:39:15'),
(2461, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1354, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-00566952\n', '2021-11-14 13:39:15'),
(2462, 2516, 2, '0D07', 1, 3000, 2, 'Sales', 1355, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-45559649\n', '2021-11-14 15:07:56'),
(2463, 2656, 2, 'FOX2021', 10, 100, 2, 'Sales', 1355, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-45559649\n', '2021-11-14 15:07:56'),
(2464, 2801, 1, 'CL1042', 10, 200, 2, 'Sales', 1355, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-45559649\n', '2021-11-14 15:07:56'),
(2465, 1530, 11, 'FN1072849', 4, 4500, 1, 'receiving', 486, '2023-05-31', 0, '{\"price\":\"4500\",\"qty\":\"4\"}', 'Stock from Receiving-33206299\n', '2021-11-14 15:21:47');
INSERT INTO `inventory` (`id`, `product_id`, `item_units_id`, `batch_no`, `qty`, `price`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(2466, 2679, 11, 'FN1076618', 3, 4500, 1, 'receiving', 487, '2024-05-31', 0, '{\"price\":\"4500\",\"qty\":\"3\"}', 'Stock from Receiving-70389662\n', '2021-11-14 15:25:31'),
(2467, 1535, 11, 'FN1074177', 2, 4500, 1, 'receiving', 488, '2023-10-31', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-25001518\n', '2021-11-14 15:27:36'),
(2468, 2917, 11, 'FN1076988', 4, 4500, 1, 'receiving', 489, '2023-06-14', 0, '{\"price\":\"4500\",\"qty\":\"4\"}', 'Stock from Receiving-26397353\n', '2021-11-14 15:36:39'),
(2469, 2918, 11, '2568 FW', 2, 3500, 1, 'receiving', 490, '2024-12-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-82739686\n', '2021-11-14 15:43:33'),
(2470, 1529, 11, '2490 FW', 3, 3500, 1, 'receiving', 491, '2024-08-31', 0, '{\"price\":\"3500\",\"qty\":\"3\"}', 'Stock from Receiving-61322482\n', '2021-11-14 15:47:30'),
(2471, 442, 2, 'T0100', 10, 200, 2, 'Sales', 1356, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-45228417\n', '2021-11-14 15:51:40'),
(2472, 1451, 11, '930660', 2, 7500, 1, 'receiving', 492, '2024-12-14', 0, '{\"price\":\"7500\",\"qty\":\"2\"}', 'Stock from Receiving-12318767\n', '2021-11-14 15:55:00'),
(2473, 2907, 18, 'L30191103', 2, 1000, 2, 'Sales', 1357, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-94661371\n', '2021-11-14 16:31:30'),
(2474, 1137, 1, 'BH1011', 30, 100, 2, 'Sales', 1357, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-94661371\n', '2021-11-14 16:31:30'),
(2475, 442, 2, 'T0100', 15, 200, 2, 'Sales', 1357, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-94661371\n', '2021-11-14 16:31:30'),
(2476, 2623, 11, '21001', 1, 3000, 2, 'Sales', 1357, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-94661371\n', '2021-11-14 16:31:30'),
(2477, 2622, 11, 'PZF21008', 1, 3000, 2, 'Sales', 1357, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-94661371\n', '2021-11-14 16:31:30'),
(2478, 2823, 2, 'EK2009', 1, 30000, 2, 'Sales', 1358, '0000-00-00', 0, '{\"price\":\"30000\",\"qty\":\"1\"}', 'Stock out from Sales-32369778\n', '2021-11-14 16:32:01'),
(2479, 2919, 281, '0000', 12, 1250, 1, 'receiving', 493, '2022-10-31', 0, '{\"price\":\"1250\",\"qty\":\"12\"}', 'Stock from Receiving-06484268\n', '2021-11-14 16:38:53'),
(2480, 1453, 11, '53963021-012 C', 5, 4000, 1, 'receiving', 494, '2025-07-31', 0, '{\"price\":\"4000\",\"qty\":\"5\"}', 'Stock from Receiving-81400814\n', '2021-11-14 16:56:00'),
(2481, 1425, 11, 'L2PP', 1, 6000, 1, 'receiving', 495, '2023-09-30', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock from Receiving-27457500\n', '2021-11-14 17:00:39'),
(2482, 2920, 11, 'L2PP', 1, 6000, 1, 'receiving', 496, '2023-01-31', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock from Receiving-79833731\n', '2021-11-14 17:04:30'),
(2483, 2921, 11, 'L2PP', 1, 6000, 1, 'receiving', 497, '2023-08-14', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock from Receiving-55036876\n', '2021-11-14 17:07:27'),
(2484, 1431, 11, '13332791', 2, 8000, 1, 'receiving', 498, '2024-02-29', 0, '{\"price\":\"8000\",\"qty\":\"2\"}', 'Stock from Receiving-83100051\n', '2021-11-14 17:12:25'),
(2485, 2922, 11, '12064391', 1, 8000, 1, 'receiving', 499, '2023-11-30', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock from Receiving-96292288\n', '2021-11-14 17:18:47'),
(2486, 2923, 11, '13266491', 2, 8000, 1, 'receiving', 500, '2024-02-29', 0, '{\"price\":\"8000\",\"qty\":\"2\"}', 'Stock from Receiving-12017819\n', '2021-11-14 17:25:31'),
(2487, 2924, 11, '085 1E 05', 2, 6000, 1, 'receiving', 501, '2024-03-31', 0, '{\"price\":\"6000\",\"qty\":\"2\"}', 'Stock from Receiving-08690115\n', '2021-11-14 17:33:21'),
(2488, 1557, 30, '2101001', 6, 3500, 1, 'receiving', 502, '2024-01-14', 0, '{\"price\":\"3500\",\"qty\":\"6\"}', 'Stock from Receiving-25069114\n', '2021-11-14 17:39:02'),
(2489, 1557, 30, '2101001', 2, 5000, 2, 'Sales', 1359, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-18881813\n', '2021-11-14 17:39:52'),
(2490, 1476, 289, 'L16154', 2, 6500, 1, 'receiving', 503, '2024-04-30', 0, '{\"price\":\"6500\",\"qty\":\"2\"}', 'Stock from Receiving-41378831\n', '2021-11-14 17:59:04'),
(2491, 1446, 11, 'CR 33 45', 2, 4500, 1, 'receiving', 504, '2024-11-13', 0, '{\"price\":\"4500\",\"qty\":\"2\"}', 'Stock from Receiving-56139618\n', '2021-11-14 18:02:33'),
(2492, 1447, 11, 'CR 14 089', 2, 9000, 1, 'receiving', 505, '2024-03-06', 0, '{\"price\":\"9000\",\"qty\":\"2\"}', 'Stock from Receiving-30035140\n', '2021-11-14 18:04:47'),
(2493, 2532, 289, '0236', 2, 3500, 1, 'receiving', 506, '2024-07-23', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-77098685\n', '2021-11-14 18:06:57'),
(2494, 1373, 18, '144 1E 06MAN05', 2, 4000, 1, 'receiving', 507, '2024-05-31', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock from Receiving-68884396\n', '2021-11-14 18:09:32'),
(2495, 2925, 11, '6112768', 2, 4000, 1, 'receiving', 508, '2023-07-31', 0, '{\"price\":\"4000\",\"qty\":\"2\"}', 'Stock from Receiving-30549673\n', '2021-11-14 18:13:49'),
(2496, 1424, 11, '02218', 2, 11000, 1, 'receiving', 509, '2024-07-14', 0, '{\"price\":\"11000\",\"qty\":\"2\"}', 'Stock from Receiving-91823358\n', '2021-11-14 18:16:35'),
(2497, 2530, 289, '67352423', 4, 4000, 1, 'receiving', 510, '2024-01-31', 0, '{\"price\":\"4000\",\"qty\":\"4\"}', 'Stock from Receiving-48413641\n', '2021-11-14 18:29:29'),
(2498, 1359, 11, 'HCL1-05', 3, 2000, 1, 'receiving', 511, '2023-01-31', 0, '{\"price\":\"2000\",\"qty\":\"3\"}', 'Stock from Receiving-03917337\n', '2021-11-14 18:34:21'),
(2499, 56, 10, 'A2108', 1, 4000, 2, 'Sales', 1360, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-02588106\n', '2021-11-14 18:41:09'),
(2500, 947, 2, '93902', 1, 1000, 2, 'Sales', 1360, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-02588106\n', '2021-11-14 18:41:09'),
(2501, 485, 2, '70122', 5, 200, 2, 'Sales', 1360, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-02588106\n', '2021-11-14 18:41:09'),
(2502, 2926, 292, 'SL03J', 1, 2000, 1, 'receiving', 512, '2023-01-31', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock from Receiving-02702011\n', '2021-11-14 18:43:11'),
(2503, 1397, 30, '13 D192 011 04 57', 2, 2000, 1, 'receiving', 513, '2026-06-30', 0, '{\"price\":\"2000\",\"qty\":\"2\"}', 'Stock from Receiving-38776088\n', '2021-11-14 18:46:08'),
(2504, 2567, 11, '03732210', 1, 3500, 1, 'receiving', 514, '2023-02-28', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-88390788\n', '2021-11-14 18:58:49'),
(2505, 2564, 11, '01425910', 1, 3500, 1, 'receiving', 515, '2023-03-31', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-32631083\n', '2021-11-14 19:00:16'),
(2506, 2927, 11, '11441191', 1, 3500, 1, 'receiving', 516, '2024-04-30', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-00015268\n', '2021-11-14 19:04:28'),
(2507, 56, 10, 'A2108', 1, 4000, 2, 'Sales', 1361, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-28947199\n', '2021-11-14 19:06:33'),
(2508, 2574, 11, '8A', 2, 3500, 1, 'receiving', 517, '2025-01-31', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-22533267\n', '2021-11-14 19:23:00'),
(2509, 2929, 11, '0630610', 1, 3500, 1, 'receiving', 518, '2022-07-31', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-59154898\n', '2021-11-14 19:24:28'),
(2510, 2928, 11, '04446510', 1, 3500, 1, 'receiving', 519, '2023-10-31', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-16207035\n', '2021-11-14 19:29:11'),
(2511, 2930, 11, '00361010', 2, 3500, 1, 'receiving', 520, '2022-06-30', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-19755547\n', '2021-11-14 19:30:48'),
(2512, 2931, 11, '0374210', 2, 3500, 1, 'receiving', 521, '2023-02-28', 0, '{\"price\":\"3500\",\"qty\":\"2\"}', 'Stock from Receiving-20577233\n', '2021-11-14 19:31:52'),
(2513, 2746, 18, '20201114', 1, 500, 2, 'Sales', 1362, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-65601949\n', '2021-11-14 20:04:45'),
(2514, 2622, 11, 'PZF21028', 1, 3000, 2, 'Sales', 1363, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-90727035\n', '2021-11-14 20:05:12'),
(2515, 1149, 2, '1F51', 1, 3000, 2, 'Sales', 1364, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-68532250\n', '2021-11-14 20:05:36'),
(2516, 2868, 2, 'EY1003', 10, 400, 2, 'Sales', 1365, '0000-00-00', 0, '{\"price\":\"400\",\"qty\":\"10\"}', 'Stock out from Sales-54767406\n', '2021-11-14 20:06:44'),
(2517, 41, 1, '44420063', 5, 500, 2, 'Sales', 1366, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"5\"}', 'Stock out from Sales-85584633\n', '2021-11-14 20:07:26'),
(2518, 2850, 2, 'ZA1011', 20, 50, 2, 'Sales', 1367, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-20775498\n', '2021-11-14 20:07:51'),
(2519, 1579, 282, '2525', 1, 3000, 2, 'Sales', 1368, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-11471948\n', '2021-11-14 20:13:07'),
(2520, 2807, 2, '200015', 15, 100, 2, 'Sales', 1369, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-50873627\n', '2021-11-14 20:13:38'),
(2521, 1334, 30, 'MAPR1R0621', 1, 2000, 2, 'Sales', 1370, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-60942925\n', '2021-11-14 20:23:36'),
(2522, 723, 2, '210735', 5, 300, 2, 'Sales', 1371, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-01270869\n', '2021-11-14 20:30:13'),
(2523, 1573, 282, '22121', 1, 8000, 2, 'Sales', 1372, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-12507107\n', '2021-11-14 20:50:13'),
(2524, 2615, 11, '', 1, 4000, 2, 'Sales', 1373, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-49582783\n', '2021-11-14 20:51:11'),
(2525, 2895, 2, 'BV1004', 3, 1000, 2, 'Sales', 1374, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-70342682\n', '2021-11-14 20:54:39'),
(2526, 415, 2, 'CCT20002E', 10, 100, 2, 'Sales', 1375, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-90602379\n', '2021-11-14 20:55:07'),
(2527, 225, 2, 'EN2520012-A', 15, 1000, 2, 'Sales', 1376, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"15\"}', 'Stock out from Sales-62277677\n', '2021-11-14 21:02:49'),
(2528, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1377, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-62743219\n', '2021-11-14 21:24:38'),
(2529, 256, 2, '20200601', 1, 12000, 2, 'Sales', 1378, '0000-00-00', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock out from Sales-47114746\n', '2021-11-14 21:42:03'),
(2530, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 1379, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-23934670\n', '2021-11-14 21:50:43'),
(2531, 1443, 11, 'QO173', 1, 2000, 2, 'Sales', 1380, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-07345003\n', '2021-11-14 21:51:24'),
(2532, 2463, 11, 'FW024G', 1, 3500, 2, 'Sales', 1381, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-97191941\n', '2021-11-14 21:58:14'),
(2533, 862, 11, '508Y1', 1, 10000, 2, 'Sales', 1382, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-34766729\n', '2021-11-14 22:05:59'),
(2534, 2622, 11, 'PZF21028', 1, 3000, 2, 'Sales', 1383, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-43445885\n', '2021-11-14 22:06:48'),
(2535, 2574, 11, '8A', 1, 5000, 2, 'Sales', 1384, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-20932674\n', '2021-11-14 22:18:10'),
(2536, 890, 2, 'TK0048', 10, 100, 2, 'Sales', 1385, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-59953178\n', '2021-11-14 22:34:59'),
(2537, 14, 2, '1B43', 5, 200, 2, 'Sales', 1386, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-28294615\n', '2021-11-14 22:42:18'),
(2538, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1387, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-88599542\n', '2021-11-14 22:53:56'),
(2539, 2622, 11, 'PZF21028', 1, 3000, 2, 'Sales', 1388, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-75512772\n', '2021-11-15 06:57:15'),
(2540, 420, 1, '2010220', 10, 200, 2, 'Sales', 1389, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-19707971\n', '2021-11-15 07:18:36'),
(2541, 1252, 2, 'ET.339', 15, 100, 2, 'Sales', 1390, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-22231380\n', '2021-11-15 07:19:10'),
(2542, 14, 2, '1B43', 5, 200, 2, 'Sales', 1391, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-86256671\n', '2021-11-15 07:32:48'),
(2543, 2463, 11, 'FW024G', 1, 3500, 2, 'Sales', 1392, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-68693196\n', '2021-11-15 07:43:55'),
(2544, 2684, 30, '', 1, 3000, 2, 'Sales', 1393, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-10047433\n', '2021-11-15 08:08:48'),
(2545, 889, 2, 'PM620021', 30, 100, 2, 'Sales', 1394, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-76413358\n', '2021-11-15 08:11:37'),
(2546, 2636, 11, '2106100', 1, 3000, 2, 'Sales', 1395, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-06926324\n', '2021-11-15 08:38:31'),
(2547, 2750, 18, '0100104/TZNG/21', 2, 1000, 2, 'Sales', 1396, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-34562675\n', '2021-11-15 08:56:08'),
(2548, 248, 28, '', 2, 40000, 2, 'Sales', 1397, '0000-00-00', 0, '{\"price\":\"40000\",\"qty\":\"2\"}', 'Stock out from Sales-07299473\n', '2021-11-15 09:13:17'),
(2549, 2667, 30, 'AR21024', 1, 3000, 2, 'Sales', 1398, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-73347470\n', '2021-11-15 10:15:46'),
(2550, 2791, 288, '1C71', 1, 2000, 2, 'Sales', 1399, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-34253144\n', '2021-11-15 10:38:42'),
(2551, 2720, 2, 'PX0030', 10, 50, 2, 'Sales', 1400, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-85386671\n', '2021-11-15 10:39:24'),
(2552, 2738, 18, 'CMPJ0801', 2, 2500, 2, 'Sales', 1401, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock out from Sales-40437022\n', '2021-11-15 11:45:30'),
(2553, 2744, 18, '200801', 2, 300, 2, 'Sales', 1402, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"2\"}', 'Stock out from Sales-51469760\n', '2021-11-15 11:46:08'),
(2554, 662, 2, '9L73', 30, 100, 2, 'Sales', 1403, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-56774729\n', '2021-11-15 12:31:28'),
(2555, 2519, 1, '1C14B1', 10, 500, 2, 'Sales', 1404, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock out from Sales-01556547\n', '2021-11-15 13:41:55'),
(2556, 2506, 11, 'MO305', 1, 3500, 2, 'Sales', 1405, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-64103941\n', '2021-11-15 13:43:55'),
(2557, 890, 2, 'TK0048', 10, 100, 2, 'Sales', 1406, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-67701200\n', '2021-11-15 13:53:49'),
(2558, 1018, 1, 'J0152', 10, 100, 2, 'Sales', 1407, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-92072572\n', '2021-11-15 14:35:58'),
(2559, 1393, 30, '323E', 1, 3000, 2, 'Sales', 1408, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-78697184\n', '2021-11-15 14:53:05'),
(2560, 2849, 18, '10803A', 2, 1000, 2, 'Sales', 1409, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-13249089\n', '2021-11-15 14:53:43'),
(2561, 135, 1, 'CB04001', 4, 600, 2, 'Sales', 1410, '0000-00-00', 0, '{\"price\":\"600\",\"qty\":\"4\"}', 'Stock out from Sales-23112960\n', '2021-11-15 15:18:57'),
(2562, 2801, 1, 'CL1042', 15, 200, 2, 'Sales', 1411, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-48630840\n', '2021-11-15 15:19:41'),
(2563, 2850, 2, 'ZA1011', 20, 50, 2, 'Sales', 1412, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"20\"}', 'Stock out from Sales-52029306\n', '2021-11-15 15:20:18'),
(2564, 77, 2, '2108035', 10, 100, 2, 'Sales', 1413, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-49985013\n', '2021-11-15 16:00:40'),
(2565, 2932, 9, '0003', 6, 25000, 1, 'receiving', 522, '2023-03-15', 0, '{\"price\":\"25000\",\"qty\":\"6\"}', 'Stock from Receiving-73986448\n', '2021-11-15 16:08:18'),
(2566, 82, 287, 'EM304', 1, 3500, 2, 'Sales', 1414, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-19131434\n', '2021-11-15 16:38:27'),
(2567, 2729, 18, '20210128-7', 1, 5000, 2, 'Sales', 1415, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-06002050\n', '2021-11-15 16:46:44'),
(2568, 2933, 18, '200309', 50, 500, 1, 'receiving', 523, '2025-03-08', 0, '{\"price\":\"500\",\"qty\":\"50\"}', 'Stock from Receiving-85720558\n', '2021-11-15 16:53:29'),
(2569, 2934, 18, '1911220', 4, 500, 1, 'receiving', 523, '2024-10-31', 0, '{\"price\":\"500\",\"qty\":\"4\"}', 'Stock from Receiving-85720558\n', '2021-11-15 16:53:30'),
(2570, 2933, 18, '200309', 2, 1000, 2, 'Sales', 1416, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-69543507\n', '2021-11-15 16:54:11'),
(2571, 2711, 2, '2007111', 10, 150, 2, 'Sales', 1417, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-56533893\n', '2021-11-15 17:00:15'),
(2572, 285, 2, '2105071', 6, 750, 2, 'Sales', 1418, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-92126810\n', '2021-11-15 17:27:05'),
(2573, 2611, 11, 'G109', 1, 3500, 2, 'Sales', 1419, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-64030836\n', '2021-11-15 18:14:16'),
(2574, 6, 2, '2107042', 3, 1000, 2, 'Sales', 1420, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"3\"}', 'Stock out from Sales-78730300\n', '2021-11-15 18:18:58'),
(2575, 1137, 2, 'BH1011', 30, 100, 2, 'Sales', 1421, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-80890388\n', '2021-11-15 18:30:55'),
(2576, 2607, 287, '2102022', 1, 5000, 2, 'Sales', 1422, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-45001067\n', '2021-11-15 18:49:07'),
(2577, 1357, 11, '', 2, 5000, 2, 'Sales', 1423, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"2\"}', 'Stock out from Sales-35420348\n', '2021-11-15 18:50:57'),
(2578, 1422, 11, '', 1, 12000, 2, 'Sales', 1424, '0000-00-00', 0, '{\"price\":\"12000\",\"qty\":\"1\"}', 'Stock out from Sales-82083107\n', '2021-11-15 18:54:18'),
(2579, 2927, 11, '', 1, 5000, 2, 'Sales', 1425, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-62662716\n', '2021-11-15 18:55:12'),
(2580, 41, 1, '44420063', 2, 500, 2, 'Sales', 1426, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-97269897\n', '2021-11-15 19:05:03'),
(2581, 11, 1, '1E19', 30, 100, 2, 'Sales', 1427, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"30\"}', 'Stock out from Sales-82265815\n', '2021-11-15 19:10:14'),
(2582, 717, 11, '21023', 1, 2000, 2, 'Sales', 1428, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-76545557\n', '2021-11-15 19:10:50'),
(2583, 2667, 2, 'AR21024', 1, 3000, 2, 'Sales', 1429, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-29496523\n', '2021-11-15 19:11:50'),
(2584, 2512, 2, 'Y140XN', 20, 100, 2, 'Sales', 1430, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-75929632\n', '2021-11-15 19:12:15'),
(2585, 285, 2, '2105071', 6, 750, 2, 'Sales', 1431, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-66885351\n', '2021-11-15 19:16:59'),
(2586, 2634, 11, '2008221', 1, 3500, 2, 'Sales', 1432, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-70582325\n', '2021-11-15 19:21:13'),
(2587, 2923, 11, '13266491', 1, 10000, 2, 'Sales', 1432, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-70582325\n', '2021-11-15 19:21:13'),
(2588, 285, 2, '2105071', 6, 750, 2, 'Sales', 1433, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"6\"}', 'Stock out from Sales-89647247\n', '2021-11-15 19:24:23'),
(2589, 375, 2, 'CA2520003-A', 10, 200, 2, 'Sales', 1434, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-19734278\n', '2021-11-15 19:25:49'),
(2590, 561, 290, '210332', 1, 10000, 2, 'Sales', 1435, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-32476149\n', '2021-11-15 19:35:16'),
(2591, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1435, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-32476149\n', '2021-11-15 19:35:16'),
(2592, 197, 2, '84514', 4, 0, 1, 'reconciliation', 18, '0000-00-00', 0, '{\"price\":\"\",\"qty\":4}', 'Stock from Reconciliation', '2021-11-15 19:38:51'),
(2593, 197, 2, '', 30, 500, 2, 'Sales', 1436, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"30\"}', 'Stock out from Sales-13736839\n', '2021-11-15 19:39:31'),
(2594, 1029, 2, '211056', 10, 100, 2, 'Sales', 1437, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-19419669\n', '2021-11-15 19:44:21'),
(2595, 176, 2, '2108040', 1, 2000, 2, 'Sales', 1438, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-57178184\n', '2021-11-15 19:44:51'),
(2596, 1003, 2, '78273', 20, 100, 2, 'Sales', 1439, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-86977152\n', '2021-11-15 19:45:51'),
(2597, 1502, 11, 'P21012802', 1, 8000, 2, 'Sales', 1440, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-36094434\n', '2021-11-15 19:49:14'),
(2598, 1351, 11, '000', 1, 5000, 2, 'Sales', 1441, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-96394323\n', '2021-11-15 19:51:50'),
(2599, 2512, 2, 'Y140XN', 1, 100, 2, 'Sales', 1442, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"1\"}', 'Stock out from Sales-18391513\n', '2021-11-15 19:55:21'),
(2600, 2498, 10, 'W0767', 1, 7000, 2, 'Sales', 1443, '0000-00-00', 0, '{\"price\":\"7000\",\"qty\":\"1\"}', 'Stock out from Sales-51855228\n', '2021-11-15 20:07:41'),
(2601, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1443, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-51855228\n', '2021-11-15 20:07:41'),
(2602, 723, 2, '210735', 1, 300, 2, 'Sales', 1444, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"1\"}', 'Stock out from Sales-84534132\n', '2021-11-15 20:28:24'),
(2603, 1416, 2, '00-0000', 1, 1500, 2, 'Sales', 1444, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-84534132\n', '2021-11-15 20:28:24'),
(2604, 2519, 1, '1C14B1', 5, 500, 2, 'Sales', 1445, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"5\"}', 'Stock out from Sales-43574925\n', '2021-11-15 20:38:48'),
(2605, 2835, 18, '0000', 1, 3000, 2, 'Sales', 1446, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-72958418\n', '2021-11-15 20:39:25'),
(2606, 2935, 30, 'No-0010', 4, 12500, 1, 'receiving', 524, '2022-10-06', 0, '{\"price\":\"12500\",\"qty\":\"4\"}', 'Stock from Receiving-78213125\n', '2021-11-15 20:45:03'),
(2607, 9, 35, 'C65V', 10, 4500, 1, 'receiving', 525, '2025-02-28', 0, '{\"price\":\"4500\",\"qty\":\"10\"}', 'Stock from Receiving-47481651\n', '2021-11-15 20:52:12'),
(2608, 9, 35, 'C65V', 1, 6000, 2, 'Sales', 1447, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-42484796\n', '2021-11-15 20:53:58'),
(2609, 2762, 2, 'NR00648A', 1, 5000, 2, 'Sales', 1448, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-31153421\n', '2021-11-15 20:56:52'),
(2610, 412, 1, '0101021', 20, 200, 2, 'Sales', 1449, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-40191088\n', '2021-11-15 21:00:12'),
(2611, 2706, 10, '10705', 1, 5000, 2, 'Sales', 1450, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-95654901\n', '2021-11-15 21:04:16'),
(2612, 1003, 2, '78273', 60, 100, 2, 'Sales', 1451, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"60\"}', 'Stock out from Sales-12894373\n', '2021-11-15 21:13:40'),
(2613, 2857, 11, '', 1, 3000, 2, 'Sales', 1452, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-71097794\n', '2021-11-15 21:47:19'),
(2614, 470, 10, 'TZK001', 6, 2500, 1, 'receiving', 526, '2022-07-31', 0, '{\"price\":\"2500\",\"qty\":\"6\"}', 'Stock from Receiving-85494883\n', '2021-11-15 22:08:23'),
(2615, 2936, 284, 'G52421', 8, 2500, 1, 'receiving', 527, '2023-07-31', 0, '{\"price\":\"2500\",\"qty\":\"8\"}', 'Stock from Receiving-74507808\n', '2021-11-15 22:10:29'),
(2616, 470, 10, 'TZK001', 1, 5000, 2, 'Sales', 1453, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-06358871\n', '2021-11-15 22:12:24'),
(2617, 2697, 1, '2010063', 5, 200, 2, 'Sales', 1454, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-52940239\n', '2021-11-15 22:24:09'),
(2618, 2935, 30, 'No-0010', 2, 12500, 1, 'receiving', 528, '2022-10-06', 0, '{\"price\":\"12500\",\"qty\":\"2\"}', 'Stock from Receiving-29776741\n', '2021-11-15 22:36:24'),
(2619, 889, 2, 'PM620021', 10, 100, 2, 'Sales', 1455, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-90634956\n', '2021-11-16 08:14:34'),
(2620, 2750, 18, '0100104/TZNG/21', 2, 1000, 2, 'Sales', 1456, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-23191471\n', '2021-11-16 08:25:32'),
(2621, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1457, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-86148130\n', '2021-11-16 08:35:09'),
(2622, 2722, 292, 'HCG201015', 1, 1000, 2, 'Sales', 1458, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-92562117\n', '2021-11-16 08:59:33'),
(2623, 2780, 2, 'CS20079', 5, 200, 2, 'Sales', 1459, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-31399717\n', '2021-11-16 09:00:30'),
(2624, 1516, 11, '28425-01', 1, 5000, 2, 'Sales', 1461, '0000-00-00', 0, '{\"price\":\"5000\",\"qty\":\"1\"}', 'Stock out from Sales-55732042\n', '2021-11-16 09:46:24'),
(2625, 442, 2, 'T0100', 20, 200, 2, 'Sales', 1462, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"20\"}', 'Stock out from Sales-45120117\n', '2021-11-16 09:46:59'),
(2626, 2512, 2, 'Y140XN', 20, 100, 2, 'Sales', 1463, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"20\"}', 'Stock out from Sales-81910795\n', '2021-11-16 09:47:24'),
(2627, 2923, 11, '', 1, 10000, 2, 'Sales', 1464, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-65592720\n', '2021-11-16 10:47:14'),
(2628, 2597, 2, '', 5, 2000, 2, 'Sales', 1466, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"5\"}', 'Stock out from Sales-76218504\n', '2021-11-16 12:39:11'),
(2629, 11, 1, '1E19', 15, 100, 2, 'Sales', 1467, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-78364475\n', '2021-11-16 12:39:41'),
(2630, 285, 2, '2105071', 12, 750, 2, 'Sales', 1468, '0000-00-00', 0, '{\"price\":\"750\",\"qty\":\"12\"}', 'Stock out from Sales-49710119\n', '2021-11-16 13:50:29'),
(2631, 2683, 30, 'M11', 1, 3000, 2, 'Sales', 1469, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-95368030\n', '2021-11-16 13:51:08'),
(2632, 2938, 10, '122K', 12, 1500, 1, 'receiving', 529, '2024-06-16', 0, '{\"price\":\"1500\",\"qty\":\"12\"}', 'Stock from Receiving-53331424\n', '2021-11-16 14:08:53'),
(2633, 2750, 18, '0100104/TZNG/21', 1, 1000, 2, 'Sales', 1470, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-04311083\n', '2021-11-16 14:15:44'),
(2634, 1577, 10, '121G', 12, 1375, 1, 'receiving', 530, '2024-02-16', 0, '{\"price\":\"1375\",\"qty\":\"12\"}', 'Stock from Receiving-81785197\n', '2021-11-16 14:22:12'),
(2635, 1322, 30, '952-7', 12, 3666, 1, 'receiving', 531, '2024-02-22', 0, '{\"price\":\"3666\",\"qty\":\"12\"}', 'Stock from Receiving-29635505\n', '2021-11-16 14:37:08'),
(2636, 375, 2, 'CA2520003-A', 15, 200, 2, 'Sales', 1471, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"15\"}', 'Stock out from Sales-96663415\n', '2021-11-16 14:46:23'),
(2637, 938, 2, 'G004732', 15, 100, 2, 'Sales', 1472, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"15\"}', 'Stock out from Sales-31446904\n', '2021-11-16 14:46:59'),
(2638, 1316, 30, '1ATCH', 3, 13750, 1, 'receiving', 532, '2024-11-16', 0, '{\"price\":\"13750\",\"qty\":\"3\"}', 'Stock from Receiving-75435398\n', '2021-11-16 15:02:08'),
(2639, 1319, 30, 'ATCH', 2, 13750, 1, 'receiving', 533, '2024-08-16', 0, '{\"price\":\"13750\",\"qty\":\"2\"}', 'Stock from Receiving-57811552\n', '2021-11-16 15:05:55'),
(2640, 1317, 30, 'ATCH', 3, 13750, 1, 'receiving', 534, '2024-10-16', 0, '{\"price\":\"13750\",\"qty\":\"3\"}', 'Stock from Receiving-20438087\n', '2021-11-16 15:10:28'),
(2641, 79, 288, '', 1, 10000, 2, 'Sales', 1473, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-11532326\n', '2021-11-16 15:27:11'),
(2642, 1339, 30, '0000-0000', 1, 2000, 2, 'Sales', 1474, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-07679094\n', '2021-11-16 15:27:37'),
(2643, 1416, 18, '00-0000', 1, 1500, 2, 'Sales', 1475, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"1\"}', 'Stock out from Sales-54567687\n', '2021-11-16 15:28:16'),
(2644, 1319, 30, 'ATCH', 6, 3666, 1, 'receiving', 535, '2024-10-01', 0, '{\"price\":\"3666\",\"qty\":\"6\"}', 'Stock from Receiving-66906338\n', '2021-11-16 15:45:26'),
(2645, 2458, 11, '10210993', 1, 3500, 2, 'Sales', 1476, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-93144173\n', '2021-11-16 16:00:06'),
(2646, 2611, 11, 'G109', 1, 3500, 2, 'Sales', 1477, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-03559014\n', '2021-11-16 16:00:37'),
(2647, 2858, 11, 'LD1049', 1, 4000, 2, 'Sales', 1478, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-74397507\n', '2021-11-16 16:01:04'),
(2648, 1385, 30, 'FDM25', 4, 2500, 1, 'receiving', 536, '2023-11-16', 0, '{\"price\":\"2500\",\"qty\":\"4\"}', 'Stock from Receiving-85914759\n', '2021-11-16 16:09:48'),
(2649, 2939, 30, '1G31', 24, 708, 1, 'receiving', 537, '2021-11-12', 0, '{\"price\":\"708\",\"qty\":\"24\"}', 'Stock from Receiving-79898153\n', '2021-11-16 16:26:11'),
(2650, 2849, 18, '809A', 24, 333, 1, 'receiving', 538, '2023-02-16', 0, '{\"price\":\"333\",\"qty\":\"24\"}', 'Stock from Receiving-91967507\n', '2021-11-16 16:44:40'),
(2651, 162, 287, 'X026', 3, 4700, 1, 'receiving', 539, '2023-09-16', 0, '{\"price\":\"4700\",\"qty\":\"3\"}', 'Stock from Receiving-71501697\n', '2021-11-16 17:13:41'),
(2652, 162, 287, 'L10019', 1, 8000, 2, 'Sales', 1479, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-39030005\n', '2021-11-16 17:14:44'),
(2653, 993, 2, 'Y0B3UL', 10, 150, 2, 'Sales', 1480, '0000-00-00', 0, '{\"price\":\"150\",\"qty\":\"10\"}', 'Stock out from Sales-31671278\n', '2021-11-16 17:15:30'),
(2654, 77, 2, '2108035', 10, 100, 2, 'Sales', 1481, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-99954915\n', '2021-11-16 17:16:16'),
(2655, 41, 1, '44420063', 2, 500, 2, 'Sales', 1482, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"2\"}', 'Stock out from Sales-58368872\n', '2021-11-16 17:16:39'),
(2656, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1483, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-68382056\n', '2021-11-16 17:18:13'),
(2657, 2805, 2, 'T1040004TA', 14, 1000, 2, 'Sales', 1486, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"14\"}', 'Stock out from Sales-89121889\n', '2021-11-16 17:27:09'),
(2658, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1487, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-34194795\n', '2021-11-16 17:27:41'),
(2659, 2849, 18, '10803A', 2, 1000, 2, 'Sales', 1488, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"2\"}', 'Stock out from Sales-69340456\n', '2021-11-16 17:28:07'),
(2660, 2939, 30, '1G31', 1, 2000, 2, 'Sales', 1489, '0000-00-00', 0, '{\"price\":\"2000\",\"qty\":\"1\"}', 'Stock out from Sales-11502812\n', '2021-11-16 17:28:32'),
(2661, 2512, 2, 'Y140XN', 10, 100, 2, 'Sales', 1490, '0000-00-00', 0, '{\"price\":\"100\",\"qty\":\"10\"}', 'Stock out from Sales-89372082\n', '2021-11-16 17:29:04'),
(2662, 968, 16, '2011045', 1, 500, 2, 'Sales', 1491, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"1\"}', 'Stock out from Sales-39807200\n', '2021-11-16 17:30:55'),
(2663, 375, 2, '025-A', 400, 73, 1, 'receiving', 540, '2022-09-16', 0, '{\"price\":\"73\",\"qty\":\"400\"}', 'Stock from Receiving-90884959\n', '2021-11-16 17:56:56'),
(2664, 2467, 2, '0002', 100, 430, 1, 'receiving', 541, '2022-10-16', 0, '{\"price\":\"430\",\"qty\":\"100\"}', 'Stock from Receiving-62102573\n', '2021-11-16 18:22:19'),
(2665, 410, 2, 'A52101', 3, 1500, 2, 'Sales', 1492, '0000-00-00', 0, '{\"price\":\"1500\",\"qty\":\"3\"}', 'Stock out from Sales-78270077\n', '2021-11-16 18:26:48'),
(2666, 48, 287, '1G77', 1, 3500, 2, 'Sales', 1493, '0000-00-00', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock out from Sales-54377747\n', '2021-11-16 18:44:12'),
(2667, 2850, 2, 'ZA1011', 10, 50, 2, 'Sales', 1494, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-70200711\n', '2021-11-16 18:44:41'),
(2668, 145, 5, '', 1, 3000, 2, 'Sales', 1495, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-90704724\n', '2021-11-16 18:46:45'),
(2669, 2723, 115, 'L2001', 5, 500, 2, 'Sales', 1496, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"5\"}', 'Stock out from Sales-19453535\n', '2021-11-16 18:47:39'),
(2670, 938, 2, '2096', 200, 30, 1, 'receiving', 542, '2024-04-16', 0, '{\"price\":\"30\",\"qty\":\"200\"}', 'Stock from Receiving-77556315\n', '2021-11-16 18:50:34'),
(2671, 412, 1, '0101020', 300, 84, 1, 'receiving', 543, '2023-05-16', 0, '{\"price\":\"84\",\"qty\":\"300\"}', 'Stock from Receiving-50462270\n', '2021-11-16 18:55:07'),
(2672, 1333, 30, '2804T3', 2, 2500, 2, 'Sales', 1497, '0000-00-00', 0, '{\"price\":\"2500\",\"qty\":\"2\"}', 'Stock out from Sales-18204729\n', '2021-11-16 19:05:02'),
(2673, 2692, 115, '1871002', 1, 1000, 2, 'Sales', 1498, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-46291462\n', '2021-11-16 19:10:28'),
(2674, 2863, 11, '10821JU009RM', 1, 10000, 2, 'Sales', 1499, '0000-00-00', 0, '{\"price\":\"10000\",\"qty\":\"1\"}', 'Stock out from Sales-92564351\n', '2021-11-16 19:16:41'),
(2675, 2557, 11, '009000', 1, 3500, 1, 'receiving', 544, '2024-11-14', 0, '{\"price\":\"3500\",\"qty\":\"1\"}', 'Stock from Receiving-16917540\n', '2021-11-16 19:18:38'),
(2676, 2720, 2, 'PX0030', 10, 50, 2, 'Sales', 1500, '0000-00-00', 0, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock out from Sales-91189762\n', '2021-11-16 19:19:01'),
(2677, 2849, 18, '10803A', 1, 1000, 2, 'Sales', 1501, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-00111295\n', '2021-11-16 19:19:30'),
(2678, 2874, 11, 'Y069XE', 1, 8000, 2, 'Sales', 1502, '0000-00-00', 0, '{\"price\":\"8000\",\"qty\":\"1\"}', 'Stock out from Sales-01858302\n', '2021-11-16 19:20:08'),
(2679, 2557, 11, '1283', 1, 0, 1, 'reconciliation', 19, '0000-00-00', 0, '{\"price\":\"\",\"qty\":1}', 'Stock from Reconciliation', '2021-11-16 19:27:44'),
(2680, 2557, 11, '009000', 0, 0, 2, 'reconciliation', 20, '0000-00-00', 0, '{\"price\":\"\",\"qty\":0}', 'Stock from Reconciliation', '2021-11-16 19:27:44'),
(2681, 2557, 11, '009000', 1, 6000, 2, 'Sales', 1505, '0000-00-00', 0, '{\"price\":\"6000\",\"qty\":\"1\"}', 'Stock out from Sales-28198597\n', '2021-11-16 19:28:17'),
(2682, 1323, 30, '075350', 10, 500, 1, 'receiving', 545, '2024-06-30', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock from Receiving-55625694\n', '2021-11-16 19:29:53'),
(2683, 1164, 2, 'D2000640', 150, 385, 1, 'receiving', 546, '2023-04-16', 0, '{\"price\":\"385\",\"qty\":\"150\"}', 'Stock from Receiving-27465893\n', '2021-11-16 19:30:21'),
(2684, 1323, 30, '075350', 1, 1000, 2, 'Sales', 1506, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"1\"}', 'Stock out from Sales-83470981\n', '2021-11-16 19:30:23'),
(2685, 414, 11, 'C4561007', 1, 4000, 2, 'Sales', 1507, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-09595171\n', '2021-11-16 19:32:20'),
(2686, 286, 2, '4171A06', 50, 667, 1, 'receiving', 547, '2024-04-16', 0, '{\"price\":\"667\",\"qty\":\"50\"}', 'Stock from Receiving-08591344\n', '2021-11-16 19:35:50'),
(2687, 1163, 2, 'BRB03237A', 180, 450, 1, 'receiving', 548, '2024-02-16', 0, '{\"price\":\"450\",\"qty\":\"180\"}', 'Stock from Receiving-88882206\n', '2021-11-16 19:41:42'),
(2688, 416, 11, 'BL1013', 9, 1500, 1, 'receiving', 549, '2023-05-31', 0, '{\"price\":\"1500\",\"qty\":\"9\"}', 'Stock from Receiving-30986723\n', '2021-11-16 19:43:14'),
(2689, 416, 11, 'BL1013', 1, 3000, 2, 'Sales', 1508, '0000-00-00', 0, '{\"price\":\"3000\",\"qty\":\"1\"}', 'Stock out from Sales-19424028\n', '2021-11-16 19:44:15'),
(2690, 42, 27, 'Y094XC', 43, 0, 1, 'reconciliation', 21, '0000-00-00', 0, '{\"price\":\"\",\"qty\":43}', 'Stock from Reconciliation', '2021-11-16 19:55:17'),
(2691, 42, 27, 'Y094XC', 10, 500, 2, 'Sales', 1510, '0000-00-00', 0, '{\"price\":\"500\",\"qty\":\"10\"}', 'Stock out from Sales-00356958\n', '2021-11-16 19:55:54'),
(2692, 2866, 43, 'T24', 10, 4000, 1, 'receiving', 550, '2022-02-16', 0, '{\"price\":\"4000\",\"qty\":\"10\"}', 'Stock from Receiving-41816156\n', '2021-11-16 19:57:12'),
(2693, 1308, 1, '', 30, 1000, 2, 'Sales', 1514, '0000-00-00', 0, '{\"price\":\"1000\",\"qty\":\"30\"}', 'Stock out from Sales-39245462\n', '2021-11-19 17:23:56'),
(2694, 2926, 292, '', 1, 4000, 2, 'Sales', 1516, '0000-00-00', 0, '{\"price\":\"4000\",\"qty\":\"1\"}', 'Stock out from Sales-01794473\n', '2021-12-01 20:13:03'),
(2695, 2, 2, 'AXF2009001', 5, 200, 2, 'Sales', 1517, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"5\"}', 'Stock out from Sales-74441860\n', '2021-12-05 19:52:37'),
(2696, 10, 2, '80027', 10, 200, 2, 'Sales', 1518, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"10\"}', 'Stock out from Sales-19765446\n', '2021-12-05 19:53:34'),
(2697, 4, 2, 'OK69', 10, 300, 2, 'Sales', 1519, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-74993172\n', '2021-12-05 19:58:14'),
(2698, 4, 2, 'OK69', 10, 300, 2, 'Sales', 1520, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"10\"}', 'Stock out from Sales-98750521\n', '2021-12-05 20:02:29'),
(2699, 4, 2, 'OK69', 5, 300, 2, 'Sales', 1522, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-20211209-0001', '2021-12-09 19:37:57'),
(2700, 4, 2, 'OK69', 5, 300, 2, 'Sales', 1523, '0000-00-00', 0, '{\"price\":\"300\",\"qty\":\"5\"}', 'Stock out from Sales-20211209-0002', '2021-12-09 19:39:42'),
(2701, 2, 2, 'AXF2009001', 2, 200, 2, 'Sales', 1524, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-20211209-0003', '2021-12-09 23:31:55'),
(2702, 2, 2, 'AXF2009001', 2, 200, 2, 'Sales', 1525, '0000-00-00', 0, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock out from Sales-20211210-0001', '2021-12-10 08:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `inv_request`
--

DROP TABLE IF EXISTS `inv_request`;
CREATE TABLE `inv_request` (
  `request_id` int(11) NOT NULL,
  `source_store` int(11) NOT NULL,
  `destination_store` int(11) NOT NULL,
  `completed` int(11) NOT NULL DEFAULT 0,
  `completed_by` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` int(11) NOT NULL DEFAULT 0,
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_request`
--

INSERT INTO `inv_request` (`request_id`, `source_store`, `destination_store`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES
(1, 2, 1, 0, NULL, 5, '2021-11-26 15:11:53', NULL, NULL, 0, NULL, NULL, NULL),
(2, 2, 1, 0, NULL, 5, '2021-11-26 15:35:28', NULL, NULL, 0, NULL, NULL, NULL),
(6, 2, 1, 0, NULL, 5, '2021-11-26 22:23:34', NULL, NULL, 0, NULL, NULL, NULL),
(8, 2, 1, 0, NULL, 5, '2021-11-26 23:11:23', NULL, NULL, 0, NULL, NULL, NULL),
(29, 2, 1, 0, NULL, 5, '2021-11-27 11:32:45', NULL, NULL, 0, NULL, NULL, NULL),
(30, 2, 1, 0, NULL, 5, '2021-11-27 12:05:39', NULL, NULL, 0, NULL, NULL, NULL),
(31, 2, 1, 0, NULL, 5, '2021-11-27 12:08:27', NULL, NULL, 0, NULL, NULL, NULL),
(32, 2, 1, 0, NULL, 5, '2021-11-27 12:14:51', NULL, NULL, 0, NULL, NULL, NULL),
(33, 2, 0, 0, NULL, 5, '2021-11-27 12:37:18', NULL, NULL, 0, NULL, NULL, NULL),
(34, 2, 0, 0, NULL, 5, '2021-11-27 12:38:39', NULL, NULL, 0, NULL, NULL, NULL),
(35, 2, 0, 0, NULL, 5, '2021-11-27 12:43:13', NULL, NULL, 0, NULL, NULL, NULL),
(36, 2, 0, 0, NULL, 5, '2021-11-27 12:44:00', NULL, NULL, 0, NULL, NULL, NULL),
(37, 2, 0, 0, NULL, 5, '2021-11-27 12:45:48', NULL, NULL, 0, NULL, NULL, NULL),
(39, 2, 1, 0, NULL, 5, '2021-11-28 09:52:35', NULL, NULL, 0, NULL, NULL, NULL),
(40, 2, 1, 0, NULL, 5, '2021-11-28 10:05:06', NULL, NULL, 0, NULL, NULL, NULL),
(41, 2, 1, 0, NULL, 5, '2021-11-28 10:12:35', NULL, NULL, 0, NULL, NULL, NULL),
(43, 2, 0, 0, NULL, 5, '2022-01-22 23:27:12', NULL, NULL, 0, NULL, NULL, NULL),
(44, 2, 1, 0, NULL, 1, '2022-01-23 00:52:53', NULL, NULL, 0, NULL, NULL, NULL),
(45, 2, 1, 0, NULL, 1, '2022-01-23 00:55:22', NULL, NULL, 0, NULL, NULL, NULL),
(46, 2, 1, 0, NULL, 1, '2022-01-23 00:56:28', NULL, NULL, 0, NULL, NULL, NULL),
(47, 2, 1, 0, NULL, 1, '2022-01-23 00:59:22', NULL, NULL, 0, NULL, NULL, NULL),
(48, 2, 1, 0, NULL, 1, '2022-01-23 00:59:59', NULL, NULL, 0, NULL, NULL, NULL),
(49, 2, 1, 0, NULL, 1, '2022-01-23 01:02:54', NULL, NULL, 0, NULL, NULL, NULL),
(50, 2, 1, 0, NULL, 1, '2022-01-23 01:03:13', NULL, NULL, 0, NULL, NULL, NULL),
(51, 2, 1, 0, NULL, 1, '2022-01-23 01:05:20', NULL, NULL, 0, NULL, NULL, NULL),
(52, 2, 1, 0, NULL, 1, '2022-01-23 01:05:37', NULL, NULL, 0, NULL, NULL, NULL),
(53, 2, 1, 0, NULL, 1, '2022-01-23 01:06:51', NULL, NULL, 0, NULL, NULL, NULL),
(54, 2, 1, 0, NULL, 1, '2022-01-23 01:07:04', NULL, NULL, 0, NULL, NULL, NULL),
(55, 2, 1, 0, NULL, 1, '2022-01-23 01:08:33', NULL, NULL, 0, NULL, NULL, NULL),
(56, 2, 1, 0, NULL, 1, '2022-01-23 01:10:33', NULL, NULL, 0, NULL, NULL, NULL),
(57, 2, 1, 0, NULL, 1, '2022-01-23 01:19:06', NULL, NULL, 0, NULL, NULL, NULL),
(58, 2, 1, 0, NULL, 1, '2022-01-23 01:19:28', NULL, NULL, 0, NULL, NULL, NULL),
(59, 2, 1, 0, NULL, 1, '2022-01-23 01:20:08', NULL, NULL, 0, NULL, NULL, NULL),
(60, 2, 1, 0, NULL, 1, '2022-01-24 12:35:10', NULL, NULL, 0, NULL, NULL, NULL),
(61, 2, 0, 0, NULL, 1, '2022-01-24 12:35:18', NULL, NULL, 0, NULL, NULL, NULL),
(62, 2, 0, 0, NULL, 1, '2022-01-24 12:35:21', NULL, NULL, 0, NULL, NULL, NULL),
(63, 2, 1, 0, NULL, 1, '2022-01-24 12:35:59', NULL, NULL, 0, NULL, NULL, NULL),
(64, 2, 1, 0, NULL, 1, '2022-01-24 12:38:35', NULL, NULL, 0, NULL, NULL, NULL),
(65, 2, 1, 0, NULL, 1, '2022-01-24 14:51:21', NULL, NULL, 0, NULL, NULL, NULL),
(66, 2, 1, 0, NULL, 1, '2022-01-24 23:57:28', NULL, NULL, 0, NULL, NULL, NULL),
(67, 2, 0, 0, NULL, 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(68, 2, 0, 0, NULL, 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(69, 2, 0, 0, NULL, 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(70, 2, 1, 0, NULL, 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(71, 2, 0, 0, NULL, 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(72, 2, 1, 0, NULL, 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(73, 2, 0, 0, NULL, 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL),
(74, 2, 1, 0, NULL, 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_request_item`
--

DROP TABLE IF EXISTS `inv_request_item`;
CREATE TABLE `inv_request_item` (
  `request_item_id` int(11) NOT NULL,
  `request` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_units_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `equivalent_quantity` double NOT NULL,
  `rejected` int(11) NOT NULL DEFAULT 0,
  `date_rejected` datetime DEFAULT NULL,
  `rejected_by` int(11) DEFAULT NULL,
  `reject_reason` varchar(255) DEFAULT NULL,
  `completed` int(11) NOT NULL DEFAULT 0,
  `completed_by` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` int(11) NOT NULL DEFAULT 0,
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_request_item`
--

INSERT INTO `inv_request_item` (`request_item_id`, `request`, `product_id`, `item_units_id`, `quantity`, `equivalent_quantity`, `rejected`, `date_rejected`, `rejected_by`, `reject_reason`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES
(1, 1, 1, 357, 5, 5, 0, NULL, NULL, NULL, 0, NULL, 4, '2021-05-17 15:11:53', NULL, NULL, 0, NULL, NULL, NULL),
(2, 1, 2, 967, 8, 8, 0, NULL, NULL, NULL, 0, NULL, 4, '2021-05-17 15:11:53', NULL, NULL, 0, NULL, NULL, NULL),
(3, 2, 1, 357, 6, 6, 0, NULL, NULL, NULL, 0, NULL, 4, '2021-05-17 15:35:28', NULL, NULL, 0, NULL, NULL, NULL),
(29, 41, 2913, 28, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 5, '2021-11-28 10:12:35', NULL, NULL, 0, NULL, NULL, NULL),
(30, 41, 2454, 2, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 5, '2021-11-28 10:12:35', NULL, NULL, 0, NULL, NULL, NULL),
(31, 43, 2913, 28, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 5, '2022-01-22 23:27:12', NULL, NULL, 0, NULL, NULL, NULL),
(32, 44, 1, 1, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-23 00:52:53', NULL, NULL, 0, NULL, NULL, NULL),
(33, 45, 1, 1, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-23 00:55:22', NULL, NULL, 0, NULL, NULL, NULL),
(43, 55, 1, 1, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-23 01:08:33', NULL, NULL, 0, NULL, NULL, NULL),
(44, 56, 1, 1, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-23 01:10:33', NULL, NULL, 0, NULL, NULL, NULL),
(55, 68, 2913, 28, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(56, 68, 2454, 2, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(57, 68, 2899, 283, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(58, 70, 2913, 28, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(59, 70, 2454, 2, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(60, 70, 2899, 283, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(61, 72, 1491, 11, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(62, 72, 1273, 29, 3, 3, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(63, 72, 1272, 28, 4, 4, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(64, 74, 1491, 11, 2, 2, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL),
(65, 74, 1273, 29, 3, 3, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL),
(66, 74, 1272, 28, 4, 4, 0, NULL, NULL, NULL, 0, NULL, 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_request_number`
--

DROP TABLE IF EXISTS `inv_request_number`;
CREATE TABLE `inv_request_number` (
  `request_number_id` int(11) NOT NULL,
  `request` int(11) NOT NULL,
  `source` int(11) DEFAULT NULL,
  `value` varchar(230) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` int(11) NOT NULL DEFAULT 0,
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_request_number`
--

INSERT INTO `inv_request_number` (`request_number_id`, `request`, `source`, `value`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES
(1, 1, 2, 'CF.0001', 4, '2021-05-17 15:11:53', NULL, NULL, 0, NULL, NULL, NULL),
(2, 1, 1, 'RQ.2105/002/001', 4, '2021-05-17 15:11:53', NULL, NULL, 0, NULL, NULL, NULL),
(3, 2, 1, 'RQ.2105/002/002', 4, '2021-05-17 15:35:28', NULL, NULL, 0, NULL, NULL, NULL),
(4, 2, 2, 'CF.002', 4, '2021-05-17 15:35:28', NULL, NULL, 0, NULL, NULL, NULL),
(34, 29, 1, 'RQ.2105/002/003', 5, '2021-11-27 11:32:45', NULL, NULL, 0, NULL, NULL, NULL),
(35, 29, 2, 'CF.004', 5, '2021-11-27 11:32:45', NULL, NULL, 0, NULL, NULL, NULL),
(36, 30, 1, 'RQ.2105/002/004', 5, '2021-11-27 12:05:39', NULL, NULL, 0, NULL, NULL, NULL),
(37, 30, 2, 'CF.005', 5, '2021-11-27 12:05:39', NULL, NULL, 0, NULL, NULL, NULL),
(38, 31, 1, 'RQ.2105/002/005', 5, '2021-11-27 12:08:27', NULL, NULL, 0, NULL, NULL, NULL),
(39, 31, 2, 'CF.007', 5, '2021-11-27 12:08:27', NULL, NULL, 0, NULL, NULL, NULL),
(40, 32, 1, 'RQ.2105/002/006', 5, '2021-11-27 12:14:51', NULL, NULL, 0, NULL, NULL, NULL),
(41, 32, 2, 'CF.008', 5, '2021-11-27 12:14:51', NULL, NULL, 0, NULL, NULL, NULL),
(45, 36, 1, 'RQ.2105/002/007', 5, '2021-11-27 12:44:00', NULL, NULL, 0, NULL, NULL, NULL),
(46, 37, 1, 'RQ.2105/002/008', 5, '2021-11-27 12:45:48', NULL, NULL, 0, NULL, NULL, NULL),
(47, 39, 1, 'RQ.2105/002/009', 5, '2021-11-28 09:52:35', NULL, NULL, 0, NULL, NULL, NULL),
(48, 40, 1, 'RQ.2105/002/010', 5, '2021-11-28 10:05:06', NULL, NULL, 0, NULL, NULL, NULL),
(49, 41, 1, 'RQ.2105/002/011', 5, '2021-11-28 10:12:35', NULL, NULL, 0, NULL, NULL, NULL),
(50, 43, 1, 'RQ.2105/002/012', 5, '2022-01-22 23:27:12', NULL, NULL, 0, NULL, NULL, NULL),
(51, 44, 1, 'RQ.2105/002/013', 1, '2022-01-23 00:52:53', NULL, NULL, 0, NULL, NULL, NULL),
(52, 45, 1, 'RQ.2105/002/014', 1, '2022-01-23 00:55:22', NULL, NULL, 0, NULL, NULL, NULL),
(53, 46, 1, 'RQ.2105/002/015', 1, '2022-01-23 00:56:28', NULL, NULL, 0, NULL, NULL, NULL),
(54, 47, 1, 'RQ.2105/002/016', 1, '2022-01-23 00:59:22', NULL, NULL, 0, NULL, NULL, NULL),
(55, 48, 1, 'RQ.2105/002/017', 1, '2022-01-23 00:59:59', NULL, NULL, 0, NULL, NULL, NULL),
(56, 49, 1, 'RQ.2105/002/018', 1, '2022-01-23 01:02:54', NULL, NULL, 0, NULL, NULL, NULL),
(57, 50, 1, 'RQ.2105/002/019', 1, '2022-01-23 01:03:13', NULL, NULL, 0, NULL, NULL, NULL),
(58, 51, 1, 'RQ.2105/002/020', 1, '2022-01-23 01:05:20', NULL, NULL, 0, NULL, NULL, NULL),
(59, 52, 1, 'RQ.2105/002/021', 1, '2022-01-23 01:05:37', NULL, NULL, 0, NULL, NULL, NULL),
(60, 53, 1, 'RQ.2105/002/022', 1, '2022-01-23 01:06:51', NULL, NULL, 0, NULL, NULL, NULL),
(61, 54, 1, 'RQ.2105/002/023', 1, '2022-01-23 01:07:04', NULL, NULL, 0, NULL, NULL, NULL),
(62, 55, 1, 'RQ.2105/002/024', 1, '2022-01-23 01:08:33', NULL, NULL, 0, NULL, NULL, NULL),
(63, 56, 1, 'RQ.2105/002/025', 1, '2022-01-23 01:10:33', NULL, NULL, 0, NULL, NULL, NULL),
(64, 56, 2, 'CF.005', 1, '2022-01-23 01:10:33', NULL, NULL, 0, NULL, NULL, NULL),
(65, 57, 1, 'RQ.2105/002/026', 1, '2022-01-23 01:19:06', NULL, NULL, 0, NULL, NULL, NULL),
(66, 57, 2, 'CF.005', 1, '2022-01-23 01:19:06', NULL, NULL, 0, NULL, NULL, NULL),
(67, 58, 1, 'RQ.2105/002/027', 1, '2022-01-23 01:19:28', NULL, NULL, 0, NULL, NULL, NULL),
(68, 58, 2, 'CF.005', 1, '2022-01-23 01:19:28', NULL, NULL, 0, NULL, NULL, NULL),
(69, 59, 1, 'RQ.2105/002/028', 1, '2022-01-23 01:20:08', NULL, NULL, 0, NULL, NULL, NULL),
(70, 59, 2, 'CF.005', 1, '2022-01-23 01:20:08', NULL, NULL, 0, NULL, NULL, NULL),
(71, 60, 1, 'RQ.2105/002/029', 1, '2022-01-24 12:35:10', NULL, NULL, 0, NULL, NULL, NULL),
(72, 60, 2, 'CF.004', 1, '2022-01-24 12:35:10', NULL, NULL, 0, NULL, NULL, NULL),
(73, 61, 1, 'RQ.2105/002/030', 1, '2022-01-24 12:35:18', NULL, NULL, 0, NULL, NULL, NULL),
(74, 62, 1, 'RQ.2105/002/031', 1, '2022-01-24 12:35:21', NULL, NULL, 0, NULL, NULL, NULL),
(75, 63, 1, 'RQ.2105/002/032', 1, '2022-01-24 12:35:59', NULL, NULL, 0, NULL, NULL, NULL),
(76, 63, 2, 'CF.004', 1, '2022-01-24 12:35:59', NULL, NULL, 0, NULL, NULL, NULL),
(77, 64, 1, 'RQ.2105/002/033', 1, '2022-01-24 12:38:35', NULL, NULL, 0, NULL, NULL, NULL),
(78, 64, 2, 'CF.004', 1, '2022-01-24 12:38:35', NULL, NULL, 0, NULL, NULL, NULL),
(79, 65, 1, 'RQ.2105/002/034', 1, '2022-01-24 14:51:21', NULL, NULL, 0, NULL, NULL, NULL),
(80, 65, 2, 'CF.004', 1, '2022-01-24 14:51:21', NULL, NULL, 0, NULL, NULL, NULL),
(81, 66, 1, 'RQ.2105/002/035', 1, '2022-01-24 23:57:28', NULL, NULL, 0, NULL, NULL, NULL),
(82, 66, 2, 'CF.004', 1, '2022-01-24 23:57:28', NULL, NULL, 0, NULL, NULL, NULL),
(83, 67, 1, 'RQ.2105/002/036', 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(84, 68, 1, 'RQ.2105/002/037', 1, '2022-01-25 01:17:17', NULL, NULL, 0, NULL, NULL, NULL),
(85, 69, 1, 'RQ.2105/002/038', 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(86, 70, 1, 'RQ.2105/002/039', 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(87, 70, 2, 'CF.004', 1, '2022-01-25 01:17:59', NULL, NULL, 0, NULL, NULL, NULL),
(88, 71, 1, 'RQ.2105/002/040', 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(89, 72, 1, 'RQ.2105/002/041', 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(90, 72, 2, 'CF.0004', 1, '2022-01-25 01:45:34', NULL, NULL, 0, NULL, NULL, NULL),
(91, 73, 1, 'RQ.2105/002/042', 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL),
(92, 74, 1, 'RQ.2105/002/043', 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL),
(93, 74, 2, 'CF.0004', 1, '2022-01-25 01:48:20', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_request_number_source`
--

DROP TABLE IF EXISTS `inv_request_number_source`;
CREATE TABLE `inv_request_number_source` (
  `source_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `description` varchar(230) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 0,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` int(11) NOT NULL DEFAULT 0,
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_request_number_source`
--

INSERT INTO `inv_request_number_source` (`source_id`, `name`, `description`, `preferred`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `date_retired`, `retired_by`, `retire_reason`) VALUES
(1, 'System Automation', 'Specifies system as a automator for request number', 1, 4, '2021-05-17 00:00:00', NULL, NULL, 0, NULL, NULL, NULL),
(2, 'Custom ref. no.', 'Custom reference number sources.', 1, 4, '2021-05-17 00:00:00', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_store`
--

DROP TABLE IF EXISTS `inv_store`;
CREATE TABLE `inv_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `description` varchar(230) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_store`
--

INSERT INTO `inv_store` (`store_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`) VALUES
(1, 'Main Store', 'Main Store', 5, '2021-05-17 14:03:52', NULL, NULL),
(2, 'Dispensing Point', 'Dispensing Point', 5, '2021-05-17 14:37:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_type` int(11) NOT NULL,
  `has_set` tinyint(1) NOT NULL DEFAULT 0,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `void` tinyint(1) NOT NULL DEFAULT 0,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `voided_reason` varchar(250) DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_type`, `has_set`, `creator`, `date_created`, `changed_by`, `date_changed`, `void`, `voided_by`, `date_voided`, `voided_reason`, `uuid`) VALUES
(1, 1, 1, 1, '2022-04-11 21:53:31', NULL, NULL, 0, NULL, NULL, NULL, '5bfff6db-041e-4d11-b2e2-36512badd6dd'),
(2, 4, 0, 1, '2022-04-15 15:34:51', NULL, NULL, 0, NULL, NULL, NULL, '2efeffbe-5050-4336-aec0-02785398eda0'),
(3, 2, 1, 1, '2022-04-15 15:39:57', NULL, NULL, 0, NULL, NULL, NULL, '630d6b13-e841-4223-b330-97d42d04cf0c'),
(4, 3, 1, 1, '2022-04-15 15:39:57', NULL, NULL, 0, NULL, NULL, NULL, 'f59fb305-d613-4636-a574-d3d4d62d7382');

-- --------------------------------------------------------

--
-- Table structure for table `level_name`
--

DROP TABLE IF EXISTS `level_name`;
CREATE TABLE `level_name` (
  `level_name_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `prefered` int(11) NOT NULL DEFAULT 1,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(250) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_name`
--

INSERT INTO `level_name` (`level_name_id`, `level_id`, `name`, `description`, `prefered`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 1, 'Dodoma', 'Dodoma', 1, 1, '2022-04-11 21:55:55', NULL, NULL, 0, NULL, NULL, NULL, 'cf78a8ec-f4d6-4a37-9d9e-b247fd89c80e'),
(2, 2, 'Kitete Dispensary', 'Kitete Dispensary', 1, 1, '2022-04-15 15:35:57', NULL, NULL, 0, NULL, NULL, NULL, '2efeffbe-5050-4336-aec0-02785398eda0'),
(3, 3, 'DODOMA MC', 'DODOMA MC', 1, 1, '2022-04-15 15:41:41', NULL, NULL, 0, NULL, NULL, NULL, 'c12d3989-5e81-48a1-9263-e9182d6113f6'),
(4, 4, 'HAZINA', 'HAZINA', 1, 1, '2022-04-15 15:41:41', NULL, NULL, 0, NULL, NULL, NULL, 'c359fad3-a142-4254-9b3c-c4206df65b45');

-- --------------------------------------------------------

--
-- Table structure for table `level_set`
--

DROP TABLE IF EXISTS `level_set`;
CREATE TABLE `level_set` (
  `level_set_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level_set` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(250) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_set`
--

INSERT INTO `level_set` (`level_set_id`, `level_id`, `level_set`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 1, 3, 1, '2022-04-15 15:51:55', NULL, NULL, 0, NULL, NULL, NULL, 'c359fad3-a142-4254-9b3c-c4206df65b45'),
(2, 3, 4, 1, '2022-04-15 15:51:55', NULL, NULL, 0, NULL, NULL, NULL, '3bb7536c-404e-4db2-b5c5-77a8c24e5865'),
(3, 4, 2, 1, '2022-04-15 15:52:25', NULL, NULL, 0, NULL, NULL, NULL, '1b897934-8456-4f36-a00c-826930b17934');

-- --------------------------------------------------------

--
-- Table structure for table `level_type`
--

DROP TABLE IF EXISTS `level_type`;
CREATE TABLE `level_type` (
  `level_type_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(250) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_type`
--

INSERT INTO `level_type` (`level_type_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 'Region', 'Region', 1, '2022-04-11 21:49:05', NULL, NULL, 0, NULL, NULL, NULL, '6de7797f-4aca-4c20-821b-482267e16cee'),
(2, 'District', 'District', 1, '2022-04-11 21:49:05', NULL, NULL, 0, NULL, NULL, NULL, '019f09bc-c07c-47ac-986d-1e11377eab7e'),
(3, 'Ward', 'Ward', 1, '2022-04-11 21:49:05', NULL, NULL, 0, NULL, NULL, NULL, '32f19f4e-e91f-49d2-93f8-430b761da5c0'),
(4, 'Facility', 'Facility', 1, '2022-04-11 21:49:05', NULL, NULL, 0, NULL, NULL, NULL, '94ba5d92-80b3-4206-9bdf-1d4c2deaa44c');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_no` varchar(58) NOT NULL,
  `email` varchar(58) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` int(11) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `retired_date` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `full_name`, `phone_no`, `email`, `creator`, `date_created`, `change_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `retired_date`, `uuid`) VALUES
(1, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-13 15:00:52', NULL, NULL, 0, NULL, NULL, NULL, '85b3a0ad-d9cf-4096-9341-7bc7a3a94407'),
(2, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-13 15:00:52', NULL, NULL, 0, NULL, NULL, NULL, '10380982-c3a5-4fd9-8e97-ec1aeb487148'),
(3, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:36:32', NULL, NULL, 0, NULL, NULL, NULL, 'dade44e2-5985-4c8c-8453-14c964dca6d7'),
(4, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:36:32', NULL, NULL, 0, NULL, NULL, NULL, 'dc3093bb-b9c3-4cc5-9a02-1f08a78394b2'),
(5, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:00', NULL, NULL, 0, NULL, NULL, NULL, '98243525-1d94-4ecd-b787-5b12ad4de364'),
(6, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:00', NULL, NULL, 0, NULL, NULL, NULL, '2c563974-96f0-4c21-96fd-cf222821478d'),
(7, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:06', NULL, NULL, 0, NULL, NULL, NULL, '976323d2-77b2-4325-867b-8f77c668a878'),
(8, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:06', NULL, NULL, 0, NULL, NULL, NULL, '59d90bd1-8c1e-4c87-823d-4d6c4730162b'),
(9, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:20', NULL, NULL, 0, NULL, NULL, NULL, '9e55e3ca-7608-4148-a174-2ab2a61d8a6b'),
(10, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:40:20', NULL, NULL, 0, NULL, NULL, NULL, 'd533d216-d600-43f6-9e01-a1c82dec6316'),
(11, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:41:26', NULL, NULL, 0, NULL, NULL, NULL, '34e6a563-0304-4a9e-a6ed-0dee52e648ee'),
(12, 'Mwayinga Jickson', '0987654321', 'patrick@gmail.com', 1, '2022-04-18 08:41:26', NULL, NULL, 0, NULL, NULL, NULL, '8550f1fb-7154-4f21-a801-4aea9d95f41e'),
(13, 'mwana', '0987654567', 'kuku@gmail.com', 1, '2022-04-27 07:29:35', NULL, NULL, 0, NULL, NULL, NULL, '79b66d1b-1963-4516-bc05-4aa4a719c271'),
(14, 'mwanananan', '09898989', 'kashai@gmail.com', 1, '2022-04-27 07:29:35', NULL, NULL, 0, NULL, NULL, NULL, 'a229ffbd-9514-4ee8-a87d-caed767de9a0'),
(15, 'mwana', '0987654567', 'kuku@gmail.com', 1, '2022-04-27 07:29:48', NULL, NULL, 0, NULL, NULL, NULL, '387bb812-b59d-436b-8b51-9a01f0695743'),
(16, 'mwanananan', '09898989', 'kashai@gmail.com', 1, '2022-04-27 07:29:48', NULL, NULL, 0, NULL, NULL, NULL, 'f97c56b2-b163-43d0-b21c-a08967a74a13'),
(17, 'mwana', '0987654567', 'kuku@gmail.com', 1, '2022-04-27 07:29:56', NULL, NULL, 0, NULL, NULL, NULL, '46f467f9-897a-4dd8-8a40-427dc617563b'),
(18, 'mwanananan', '09898989', 'kashai@gmail.com', 1, '2022-04-27 07:29:56', NULL, NULL, 0, NULL, NULL, NULL, 'cee9e3e0-724e-498a-bb80-21cbc9e94cc7'),
(23, 'pamela', '0753553555', 'pamela@gmail.com', 1, '2022-05-01 15:09:13', NULL, NULL, 0, NULL, NULL, NULL, 'f4adf21e-6a49-4fa2-8d1c-111eb57d8bd9'),
(24, 'kibhonde', '0987654567', 'pamela@gmail.com', 1, '2022-05-01 15:09:13', NULL, NULL, 0, NULL, NULL, NULL, 'ade5df85-71d3-4181-bfc3-4cda0f2ee561'),
(25, 'hussein kinyika', '0717035100', 'kinyika@gmail.com', 1, '2022-05-01 16:18:00', NULL, NULL, 0, NULL, NULL, NULL, 'bae82fb2-3951-4432-acb1-a6bf6c2a1a05'),
(26, 'miriam odemba', '0713570867', 'odemba@gmail.com', 1, '2022-05-01 16:18:00', NULL, NULL, 0, NULL, NULL, NULL, '7888c632-46ef-4c44-be46-7e5d8a3db36d');

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges` (
  `privilege_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`privilege_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'ViewCategory', 'View Categories', 1, '2021-06-20 11:54:22', NULL, NULL, '908f16d0-c91a-11ec-ac4f-00ffb4e1dec0'),
(2, 'FullViewOfItem', 'View Item', 1, '2021-06-20 11:55:06', NULL, NULL, '9096cfb3-c91a-11ec-ac4f-00ffb4e1dec0'),
(3, 'ViewHome', 'View Home Page', 1, '2021-06-21 07:34:07', NULL, NULL, '90c77a2d-c91a-11ec-ac4f-00ffb4e1dec0'),
(4, 'ViewInventory', 'View Inventory Page', 1, '2021-06-21 07:34:07', NULL, NULL, '90e64195-c91a-11ec-ac4f-00ffb4e1dec0'),
(5, 'ViewSales', 'View Sales', 1, '2021-06-21 07:34:07', NULL, NULL, '90f67cc2-c91a-11ec-ac4f-00ffb4e1dec0'),
(6, 'ViewInvoices', 'View Invoices', 1, '2021-06-21 07:34:07', NULL, NULL, '91114b3f-c91a-11ec-ac4f-00ffb4e1dec0'),
(7, 'ViewReceiving', 'View All Receiving', 1, '2021-06-21 07:37:14', NULL, NULL, '91228764-c91a-11ec-ac4f-00ffb4e1dec0'),
(8, 'Viewusers', 'View All Users', 1, '2021-06-21 07:37:14', NULL, NULL, '913f5d49-c91a-11ec-ac4f-00ffb4e1dec0'),
(9, 'ViewItemGroup', 'View Item Groups', 1, '2021-06-21 07:37:14', NULL, NULL, '91773c86-c91a-11ec-ac4f-00ffb4e1dec0'),
(10, 'ViewItemUnits', 'View Item Units', 1, '2021-06-21 07:37:14', NULL, NULL, '918cb735-c91a-11ec-ac4f-00ffb4e1dec0'),
(11, 'ViewReport', 'View Report View', 1, '2021-06-21 07:37:14', NULL, NULL, '91a42608-c91a-11ec-ac4f-00ffb4e1dec0'),
(12, 'PerformWholeSaleTransaction', 'Perform Wholesale Transaction', 1, '2021-06-21 08:06:13', NULL, NULL, '91d3c9c2-c91a-11ec-ac4f-00ffb4e1dec0'),
(13, 'PerformNormalSaleTransaction', 'Perform Noram Sales Transaction', 1, '2021-06-21 08:06:13', NULL, NULL, '91e01fbe-c91a-11ec-ac4f-00ffb4e1dec0'),
(14, 'ViewSalesTransactionOnDetails', 'View Sales Details On a Single\nTransaction', 1, '2021-06-21 08:40:30', NULL, NULL, '91ffef8b-c91a-11ec-ac4f-00ffb4e1dec0'),
(15, 'DeleteSalesTransaction', 'Delete Sales Transactions', 1, '2021-06-21 08:40:30', NULL, NULL, '92271e5b-c91a-11ec-ac4f-00ffb4e1dec0'),
(16, 'ManageMinMaxStockValue', 'Manage Minimun and Maximum stock value', 1, '2021-07-08 12:15:15', NULL, NULL, '923c141b-c91a-11ec-ac4f-00ffb4e1dec0'),
(17, 'ManageReconciliation', 'Manage reconciliation process', 1, '2021-08-08 16:40:57', NULL, NULL, '9267b8c4-c91a-11ec-ac4f-00ffb4e1dec0'),
(18, 'UpdateAfterReconciliation', 'Update from phisical count', 1, '2021-08-08 16:40:57', NULL, NULL, '927c9006-c91a-11ec-ac4f-00ffb4e1dec0'),
(19, 'DownloadPriceTemplate', 'Download Price Tempalate for all Items for review and update', 1, '2021-09-05 12:29:19', NULL, NULL, '92a16167-c91a-11ec-ac4f-00ffb4e1dec0'),
(20, 'UploadItemPrice', 'Upload Price of all Item To Update into new price', 1, '2021-09-05 12:29:19', NULL, NULL, '92ab0c40-c91a-11ec-ac4f-00ffb4e1dec0'),
(21, 'ViewRecevingTransaction', 'View Receiving Transaction', 5, '2021-10-23 18:08:53', NULL, NULL, '92cd5e23-c91a-11ec-ac4f-00ffb4e1dec0'),
(22, 'DeleteRecevingTransaction', 'Delete Receiving Transaction', 5, '2021-10-23 18:08:53', NULL, NULL, '92e8473e-c91a-11ec-ac4f-00ffb4e1dec0'),
(23, 'GraphicalPresentation', 'Graphical Presentation', 5, '2021-11-07 12:45:45', NULL, NULL, '92fb6312-c91a-11ec-ac4f-00ffb4e1dec0'),
(24, 'ElaborativesalesReport', 'Report with profit earned both by item and Category', 5, '2021-11-07 12:45:45', NULL, NULL, '93103da1-c91a-11ec-ac4f-00ffb4e1dec0');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`relationship_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 'Mother', 'Mother', 1, '2022-04-07 11:25:28', NULL, NULL, 0, NULL, NULL, NULL, '1888ff34-2761-468d-bd18-97cb708cc7bb'),
(2, 'Father', 'Father', 1, '2022-04-07 11:25:28', NULL, NULL, 0, NULL, NULL, NULL, 'e5be43ab-2943-4b44-afe7-c5dbb5f96c24');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'Super Admin', 'Special For super admins To perform all Transaction', 1, '2021-06-20 11:49:28', 1, '2021-07-01 11:53:50', '27087dbb-c919-11ec-ac4f-00ffb4e1dec0'),
(2, 'Cashier', 'casheir of the institution use this to perfom transaction', 1, '2021-06-20 11:49:28', 1, '2021-10-23 08:57:12', '2710336c-c919-11ec-ac4f-00ffb4e1dec0'),
(3, 'Manager', 'Managers of  the Institution use this with its privilege', 1, '2021-06-20 11:50:16', 1, '2021-07-04 09:18:31', '272bb534-c919-11ec-ac4f-00ffb4e1dec0'),
(4, 'Director', 'Directors of  the Institution use this with its privilege', 1, '2021-07-01 07:06:06', 5, '2021-11-07 07:18:43', '275197d2-c919-11ec-ac4f-00ffb4e1dec0'),
(5, 'SalesTransaction', 'Special for Sales Only', 1, '2021-07-01 08:26:05', 1, '2021-07-07 11:03:24', '2767def7-c919-11ec-ac4f-00ffb4e1dec0');

-- --------------------------------------------------------

--
-- Table structure for table `role_privileges`
--

DROP TABLE IF EXISTS `role_privileges`;
CREATE TABLE `role_privileges` (
  `role_privilege_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_privileges`
--

INSERT INTO `role_privileges` (`role_privilege_id`, `role_id`, `privilege_id`, `creator`, `date_created`, `changed_by`, `date_changed`) VALUES
(239, 1, 15, 1, '2021-07-01 08:53:50', NULL, NULL),
(240, 1, 2, 1, '2021-07-01 08:53:50', NULL, NULL),
(241, 1, 13, 1, '2021-07-01 08:53:50', NULL, NULL),
(242, 1, 12, 1, '2021-07-01 08:53:50', NULL, NULL),
(243, 1, 1, 1, '2021-07-01 08:53:50', NULL, NULL),
(244, 1, 3, 1, '2021-07-01 08:53:50', NULL, NULL),
(245, 1, 4, 1, '2021-07-01 08:53:50', NULL, NULL),
(246, 1, 6, 1, '2021-07-01 08:53:50', NULL, NULL),
(247, 1, 9, 1, '2021-07-01 08:53:50', NULL, NULL),
(248, 1, 10, 1, '2021-07-01 08:53:50', NULL, NULL),
(249, 1, 7, 1, '2021-07-01 08:53:50', NULL, NULL),
(250, 1, 11, 1, '2021-07-01 08:53:50', NULL, NULL),
(251, 1, 5, 1, '2021-07-01 08:53:50', NULL, NULL),
(252, 1, 14, 1, '2021-07-01 08:53:50', NULL, NULL),
(253, 1, 8, 1, '2021-07-01 08:53:50', NULL, NULL),
(270, 5, 15, 1, '2021-07-07 08:03:24', NULL, NULL),
(271, 5, 2, 1, '2021-07-07 08:03:24', NULL, NULL),
(272, 5, 13, 1, '2021-07-07 08:03:24', NULL, NULL),
(273, 5, 12, 1, '2021-07-07 08:03:24', NULL, NULL),
(274, 5, 1, 1, '2021-07-07 08:03:24', NULL, NULL),
(275, 5, 3, 1, '2021-07-07 08:03:24', NULL, NULL),
(276, 5, 4, 1, '2021-07-07 08:03:24', NULL, NULL),
(277, 5, 6, 1, '2021-07-07 08:03:24', NULL, NULL),
(278, 5, 9, 1, '2021-07-07 08:03:24', NULL, NULL),
(279, 5, 10, 1, '2021-07-07 08:03:24', NULL, NULL),
(280, 5, 7, 1, '2021-07-07 08:03:24', NULL, NULL),
(281, 5, 11, 1, '2021-07-07 08:03:24', NULL, NULL),
(282, 1, 16, 1, '2021-07-08 12:15:53', NULL, NULL),
(283, 1, 17, 1, '2021-08-08 16:42:20', NULL, NULL),
(284, 1, 18, 1, '2021-08-08 16:42:20', NULL, NULL),
(285, 1, 19, 1, '2021-09-05 12:34:15', NULL, NULL),
(286, 1, 20, 1, '2021-09-05 12:34:15', NULL, NULL),
(287, 2, 13, 1, '2021-10-23 05:57:12', NULL, NULL),
(288, 2, 3, 1, '2021-10-23 05:57:12', NULL, NULL),
(289, 2, 4, 1, '2021-10-23 05:57:12', NULL, NULL),
(290, 2, 7, 1, '2021-10-23 05:57:12', NULL, NULL),
(291, 2, 11, 1, '2021-10-23 05:57:12', NULL, NULL),
(292, 2, 5, 1, '2021-10-23 05:57:12', NULL, NULL),
(293, 2, 14, 1, '2021-10-23 05:57:12', NULL, NULL),
(294, 2, 21, 5, '2021-10-23 18:09:42', NULL, NULL),
(295, 2, 2, 5, '2021-10-23 18:29:46', NULL, NULL),
(296, 1, 24, 5, '2021-11-07 12:46:20', NULL, NULL),
(297, 1, 23, 5, '2021-11-07 12:46:20', NULL, NULL),
(298, 4, 22, 5, '2021-11-07 04:18:43', NULL, NULL),
(299, 4, 15, 5, '2021-11-07 04:18:43', NULL, NULL),
(300, 4, 19, 5, '2021-11-07 04:18:43', NULL, NULL),
(301, 4, 24, 5, '2021-11-07 04:18:43', NULL, NULL),
(302, 4, 2, 5, '2021-11-07 04:18:43', NULL, NULL),
(303, 4, 23, 5, '2021-11-07 04:18:43', NULL, NULL),
(304, 4, 16, 5, '2021-11-07 04:18:43', NULL, NULL),
(305, 4, 17, 5, '2021-11-07 04:18:43', NULL, NULL),
(306, 4, 13, 5, '2021-11-07 04:18:43', NULL, NULL),
(307, 4, 12, 5, '2021-11-07 04:18:43', NULL, NULL),
(308, 4, 18, 5, '2021-11-07 04:18:43', NULL, NULL),
(309, 4, 20, 5, '2021-11-07 04:18:43', NULL, NULL),
(310, 4, 1, 5, '2021-11-07 04:18:43', NULL, NULL),
(311, 4, 3, 5, '2021-11-07 04:18:43', NULL, NULL),
(312, 4, 4, 5, '2021-11-07 04:18:43', NULL, NULL),
(313, 4, 6, 5, '2021-11-07 04:18:43', NULL, NULL),
(314, 4, 9, 5, '2021-11-07 04:18:43', NULL, NULL),
(315, 4, 10, 5, '2021-11-07 04:18:43', NULL, NULL),
(316, 4, 7, 5, '2021-11-07 04:18:43', NULL, NULL),
(317, 4, 21, 5, '2021-11-07 04:18:43', NULL, NULL),
(318, 4, 11, 5, '2021-11-07 04:18:43', NULL, NULL),
(319, 4, 5, 5, '2021-11-07 04:18:43', NULL, NULL),
(320, 4, 14, 5, '2021-11-07 04:18:43', NULL, NULL),
(321, 4, 8, 5, '2021-11-07 04:18:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `short_name` varchar(58) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` int(11) NOT NULL DEFAULT 0,
  `retired_date` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `short_name`, `email`, `contact`, `cover_img`, `about_content`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_date`, `retired_reason`, `retired_by`, `uuid`) VALUES
(1, 'Under Five Vaccine Management Information System', 'UVMIS', 'info@sample.com', '+2558 8542 623', '1600654680_photo-1504674900247-0877df9cc836.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;ABOUT US&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#x2019;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Where does it come from?&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;', 0, '2022-04-30 21:35:56', NULL, NULL, 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `profiles_id`, `username`, `password`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 1, 'Mwanamalundi', 'patrick', 1, '2022-04-02 07:21:56', NULL, NULL, '3d53a5c4-8f4e-43cc-8c3c-e616fab36467'),
(2, 2, 'elivice', 'ishengoma', 1, '2022-04-03 09:07:07', NULL, NULL, '6e60c75f-3ce7-40eb-9cc1-4faa0c288b5e'),
(3, 3, 'elivice', 'ishengoma', 1, '2022-04-03 09:08:01', NULL, NULL, '13c3a79d-d6e4-41e4-94ff-eeea30b7a775'),
(4, 4, 'yuda', 'yuda', 1, '2022-04-03 09:12:02', NULL, NULL, 'c764499a-2e1a-4ddd-a137-0c5dc2d20549'),
(5, 5, 'beth', 'beth', 1, '2022-04-18 08:22:49', NULL, NULL, '1bbe18e4-bae9-4828-98cc-07526bb58b1b'),
(6, 6, 'beth', 'beth', 1, '2022-04-18 08:27:52', NULL, NULL, 'a0216612-edbf-4d89-b3a6-d2bda4519a81');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `middle_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `user_emails` varchar(250) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` timestamp NULL DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `dob`, `user_emails`, `phone_no`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'Mwayinga', 'Patrick', 'Jickson', 1, '1997-11-30 12:10:00', 'patrickwillson22@gmail.com', '0753553555', 1, '2022-04-02 07:21:56', NULL, NULL, '3d53a5c4-8f4e-43cc-8c3c-e616fab36467'),
(2, 'mwana', 'elivice', 'ishengoma', 1, '1997-11-30 12:10:00', 'elivice@gmail.com', '0676667688', 1, '2022-04-03 09:07:07', NULL, NULL, '6e60c75f-3ce7-40eb-9cc1-4faa0c288b5e'),
(3, 'mwana', 'elivice', 'ishengoma', 1, '1997-11-30 12:10:00', 'elivice@gmail.com', '0676667688', 1, '2022-04-03 09:08:01', NULL, NULL, '13c3a79d-d6e4-41e4-94ff-eeea30b7a775'),
(4, 'yuda', 'yuda', 'yuda', 1, '2022-01-03 12:11:00', 'yuda@gmail.com', '0676667688', 1, '2022-04-03 09:12:02', NULL, NULL, 'c764499a-2e1a-4ddd-a137-0c5dc2d20549'),
(5, 'beth', 'sida', 'malisa', 2, '1997-11-20 11:22:00', 'bethpatrick@gmail.com', '0653553555', 1, '2022-04-18 08:22:49', NULL, NULL, '1bbe18e4-bae9-4828-98cc-07526bb58b1b'),
(6, 'beth', 'sida', 'malisa', 2, '1997-11-20 11:22:00', 'bethpatrick@gmail.com', '0653553555', 1, '2022-04-18 08:27:52', NULL, NULL, 'a0216612-edbf-4d89-b3a6-d2bda4519a81');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_lore_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) DEFAULT 0,
  `retired_reason` varchar(255) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `uuid` varchar(58) NOT NULL DEFAULT 'uuid()'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_lore_id`, `user_id`, `role_id`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_reason`, `date_retired`, `retired_by`, `uuid`) VALUES
(1, 4, 1, 1, '2022-05-01 09:35:12', NULL, NULL, 0, NULL, NULL, NULL, '4ff697b5-c932-11ec-ac4f-00ffb4e1dec0'),
(3, 1, 1, 1, '2022-05-01 09:37:51', NULL, NULL, 0, NULL, NULL, NULL, '2efd02b5-c932-11ec-ac4f-00ffb4e1dec0');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE `vaccine` (
  `vaccine_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` int(11) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(250) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`vaccine_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `date_retired`, `uuid`) VALUES
(1, 'BCG (Kifua kikuu)', 'BCG (Kifua kikuu)\r\nSindano Bega Kulia', 1, '2022-04-16 07:10:41', NULL, NULL, 0, NULL, NULL, NULL, '42048e05-7d52-4bda-ad05-0825b6f5fd74'),
(2, 'POLIO (Kupooza) - GPV', 'POLIO (Kupooza) - GPV\r\n(Matone - Mdomoni)', 1, '2022-04-16 07:10:41', NULL, NULL, 0, NULL, NULL, NULL, 'dcbcc892-8456-4179-b2a5-51b391559efc'),
(3, 'POLIO (Kupooza) - IPV', 'POLIO (Kupooza) - IPV\r\n(Sindano- Paja la Kulia)', 1, '2022-04-16 07:14:33', NULL, NULL, 0, NULL, NULL, NULL, '4249db3d-8d75-41da-b26a-bdd541e7e05f');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_configuration`
--

DROP TABLE IF EXISTS `vaccine_configuration`;
CREATE TABLE `vaccine_configuration` (
  `vaccine_configuration_id` int(11) NOT NULL,
  `vaccine` int(11) NOT NULL,
  `configuration_type` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` int(11) NOT NULL DEFAULT 0,
  `voided_by` int(11) DEFAULT NULL,
  `voided_reason` varchar(255) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_configuration`
--

INSERT INTO `vaccine_configuration` (`vaccine_configuration_id`, `vaccine`, `configuration_type`, `value`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `voided_by`, `voided_reason`, `date_voided`, `uuid`) VALUES
(1, 1, 1, 'true', 1, '2022-04-16 08:53:51', NULL, NULL, 0, NULL, NULL, NULL, '4249db3d-8d75-41da-b26a-bdd541e7e05f'),
(2, 1, 5, 'true', 1, '2022-04-16 08:53:51', NULL, NULL, 0, NULL, NULL, NULL, 'e3eebca5-f507-4340-ac77-d90c2dc3f382'),
(3, 1, 6, 'true', 1, '2022-04-16 08:56:43', NULL, NULL, 0, NULL, NULL, NULL, 'ab35be36-6572-4578-b7ce-d59a16fe2aba'),
(4, 1, 7, '1', 1, '2022-05-09 20:44:55', NULL, NULL, 0, NULL, NULL, NULL, 'ab35be36-6572-4578-b7ce-d59a16fe2abB');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_configuration_type`
--

DROP TABLE IF EXISTS `vaccine_configuration_type`;
CREATE TABLE `vaccine_configuration_type` (
  `configuration_type_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_configuration_type`
--

INSERT INTO `vaccine_configuration_type` (`configuration_type_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'On Birth', 'On Birth', 1, '2022-04-16 07:00:41', NULL, NULL, '89c2ca88-de05-4b4c-b33f-8737452914d7'),
(2, 'On Week', 'On Week', 1, '2022-04-16 07:00:41', NULL, NULL, '48a6fc76-558e-4395-947f-067fe11ae43c'),
(3, 'On Month', 'On Month', 1, '2022-04-16 07:00:41', NULL, NULL, 'bdc0678b-b5d9-4cbf-a17a-53354d3244a7'),
(4, 'On First Visit', 'On First Visit', 1, '2022-04-16 07:04:50', NULL, NULL, 'f01d86d3-7e8e-45c9-8c77-377d3ba23136'),
(5, 'Remedial After Three(3) Months', 'Remedial After Three(3) Months', 1, '2022-04-16 07:06:17', NULL, NULL, 'fb1728ea-43f0-41d8-bca0-4b93276188ef'),
(6, 'KOVU', 'Kuna Kovu', 1, '2022-04-16 08:56:04', NULL, NULL, 'e3eebca5-f507-4340-ac77-d90c2dc3f382'),
(7, 'Number of Vaccination Pharses', 'Number of Vaccination Pharses', 1, '2022-05-09 20:41:02', NULL, NULL, 'e3eebca5-f507-4340-ac77-d90c2dc3f383');

-- --------------------------------------------------------

--
-- Table structure for table `v_program`
--

DROP TABLE IF EXISTS `v_program`;
CREATE TABLE `v_program` (
  `v_program_id` int(11) NOT NULL,
  `program_source` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT 0,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `voided_reason` varchar(250) DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `v_program_number`
--

DROP TABLE IF EXISTS `v_program_number`;
CREATE TABLE `v_program_number` (
  `program_number_id` int(11) NOT NULL,
  `v_program` int(11) NOT NULL,
  `number_source` int(11) NOT NULL,
  `value` varchar(200) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT 0,
  `voided_by` int(11) DEFAULT NULL,
  `voided_reason` varchar(258) DEFAULT NULL,
  `voided_date` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `v_program_number_source`
--

DROP TABLE IF EXISTS `v_program_number_source`;
CREATE TABLE `v_program_number_source` (
  `number_source_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(258) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT 1,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) DEFAULT NULL,
  `retired_reason` varchar(258) DEFAULT NULL,
  `retired_date` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `v_program_number_source`
--

INSERT INTO `v_program_number_source` (`number_source_id`, `name`, `description`, `preferred`, `creator`, `date_created`, `change_by`, `date_changed`, `retired`, `retired_by`, `retired_reason`, `retired_date`, `uuid`) VALUES
(1, 'System Automation', 'Specifies system as a automator for request number', 1, 4, '2021-05-16 21:00:00', NULL, NULL, 0, NULL, NULL, NULL, 'dd43fa4b-cc3b-11ec-9263-00ffb4e1dec0'),
(2, 'Custom ref. no.', 'Custom reference number sources.', 1, 4, '2021-05-16 21:00:00', NULL, NULL, 0, NULL, NULL, NULL, 'dd45644f-cc3b-11ec-9263-00ffb4e1dec0');

-- --------------------------------------------------------

--
-- Table structure for table `v_program_source`
--

DROP TABLE IF EXISTS `v_program_source`;
CREATE TABLE `v_program_source` (
  `source_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(258) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `v_program_source`
--

INSERT INTO `v_program_source` (`source_id`, `name`, `description`, `creator`, `date_created`, `changed_by`, `date_changed`, `uuid`) VALUES
(1, 'InBound', 'InBound', 1, '2022-05-05 05:38:49', NULL, NULL, 'b1f036d3-f540-4b69-858c-55bad7418cb3'),
(2, 'OutBound', 'OutBound', 1, '2022-05-05 05:38:49', NULL, NULL, 'c30a7cf4-9423-4e88-9e58-c5654e0e6e4e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `birth_facilitator`
--
ALTER TABLE `birth_facilitator`
  ADD PRIMARY KEY (`facilitator_id`),
  ADD UNIQUE KEY `ind_birth_facilitator_uuid` (`uuid`),
  ADD KEY `fk_birth_facilitator_creator` (`creator`),
  ADD KEY `fk_birth_facilitator_chaged_vy` (`changed_by`),
  ADD KEY `fk_birth_facilitator_retired_by` (`retired_by`);

--
-- Indexes for table `birth_place`
--
ALTER TABLE `birth_place`
  ADD PRIMARY KEY (`place_id`),
  ADD UNIQUE KEY `ind_birth_place_uuid` (`uuid`),
  ADD KEY `fk_birth_place_creator` (`creator`),
  ADD KEY `fk_birth_place_chabged_by` (`changed_by`),
  ADD KEY `fk_birth_place_retired_by` (`retired_by`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `ind_client_uuid` (`uuid`),
  ADD KEY `fk_client_creator` (`creator`),
  ADD KEY `fk_client_changed_by` (`change_by`),
  ADD KEY `fk_client_gender` (`gender`),
  ADD KEY `fk_client_birth_place` (`birth_place`),
  ADD KEY `fk_client_birth_facilitator` (`birth_facilitator`);

--
-- Indexes for table `client_location`
--
ALTER TABLE `client_location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `ind_client_location_uuid` (`uuid`),
  ADD KEY `fk_client_location_creator` (`creator`),
  ADD KEY `fk_client_location_changed_by` (`changed_by`),
  ADD KEY `fk_client_location_client` (`client`);

--
-- Indexes for table `client_parent`
--
ALTER TABLE `client_parent`
  ADD PRIMARY KEY (`client_parent_id`),
  ADD UNIQUE KEY `ind_client_parent_uuid` (`uuid`),
  ADD KEY `fk_client_parent_parent` (`parent`),
  ADD KEY `fk_client_parent_relation` (`relation`),
  ADD KEY `fk_client_parent_client` (`client`) USING BTREE;

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`),
  ADD UNIQUE KEY `ind_gender_uuid` (`uuid`),
  ADD KEY `fk_gender_creator` (`creator`),
  ADD KEY `fk_gender_changed_by` (`changed_by`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_request`
--
ALTER TABLE `inv_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_inv_request_changed_by` (`changed_by`),
  ADD KEY `fk_inv_request_completed_by` (`completed_by`),
  ADD KEY `fk_inv_request_creator` (`creator`),
  ADD KEY `fk_inv_request_source_store` (`source_store`),
  ADD KEY `fk_inv_request_voided_by` (`voided_by`);

--
-- Indexes for table `inv_request_item`
--
ALTER TABLE `inv_request_item`
  ADD PRIMARY KEY (`request_item_id`),
  ADD KEY `fk_inv_request_item_changed_by` (`changed_by`),
  ADD KEY `fk_inv_request_item_completed_by` (`completed_by`),
  ADD KEY `fk_inv_request_item_creator` (`creator`),
  ADD KEY `fk_inv_request_item_product_id` (`product_id`),
  ADD KEY `fk_inv_request_item_rejected_by` (`rejected_by`),
  ADD KEY `fk_inv_request_item_item_units_id` (`item_units_id`),
  ADD KEY `fk_inv_request_item_voided_by` (`voided_by`),
  ADD KEY `fk_inv_request_item_request` (`request`);

--
-- Indexes for table `inv_request_number`
--
ALTER TABLE `inv_request_number`
  ADD PRIMARY KEY (`request_number_id`),
  ADD KEY `fk_inv_request_number_changed_by` (`changed_by`),
  ADD KEY `fk_inv_request_number_creator` (`creator`),
  ADD KEY `fk_inv_request_number_request` (`request`),
  ADD KEY `fk_inv_request_number_source` (`source`),
  ADD KEY `fk_inv_request_number_voided_by` (`voided_by`);

--
-- Indexes for table `inv_request_number_source`
--
ALTER TABLE `inv_request_number_source`
  ADD PRIMARY KEY (`source_id`),
  ADD KEY `fk_inv_request_number_source_changed_by` (`changed_by`),
  ADD KEY `fk_inv_request_number_source_creator` (`creator`),
  ADD KEY `fk_inv_request_number_source_retired_by` (`retired_by`);

--
-- Indexes for table `inv_store`
--
ALTER TABLE `inv_store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_inv_store_changed_by` (`changed_by`),
  ADD KEY `fk_inv_store_creator` (`creator`),
  ADD KEY `ind_inv_store_name` (`name`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `ind_level_uuid` (`uuid`),
  ADD KEY `fk_level_creator` (`creator`),
  ADD KEY `fk_level_changed_by` (`changed_by`),
  ADD KEY `fk_level_voided_by` (`voided_by`),
  ADD KEY `fk_level_level_type` (`level_type`);

--
-- Indexes for table `level_name`
--
ALTER TABLE `level_name`
  ADD PRIMARY KEY (`level_name_id`),
  ADD UNIQUE KEY `ind_level_name_uuid` (`uuid`),
  ADD KEY `fk_level_name_creator` (`creator`),
  ADD KEY `fk_level_name_changed_by` (`changed_by`),
  ADD KEY `fk_level_name_retired_by` (`retired_by`),
  ADD KEY `fk_level_name_level_id` (`level_id`);

--
-- Indexes for table `level_set`
--
ALTER TABLE `level_set`
  ADD PRIMARY KEY (`level_set_id`),
  ADD UNIQUE KEY `ind_level_set_uuid` (`uuid`),
  ADD KEY `fk_level_set_creator` (`creator`),
  ADD KEY `fk_level_set_changed_by` (`changed_by`),
  ADD KEY `fk_level_set_retired_by` (`retired_by`),
  ADD KEY `fk_level_set_level_id` (`level_id`),
  ADD KEY `fk_level_set_level_set` (`level_set`);

--
-- Indexes for table `level_type`
--
ALTER TABLE `level_type`
  ADD PRIMARY KEY (`level_type_id`),
  ADD UNIQUE KEY `ind_level_type_uuid` (`uuid`),
  ADD KEY `fk_level_type_creator` (`creator`),
  ADD KEY `fk_level_type_changed_by` (`changed_by`),
  ADD KEY `fk_level_type_retired_by` (`retired_by`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`),
  ADD UNIQUE KEY `ind_parent_uuid` (`uuid`) USING BTREE,
  ADD KEY `fk_parent_changed_by` (`change_by`),
  ADD KEY `fk_parent_creator` (`creator`),
  ADD KEY `fk_parent_retired_by` (`retired_by`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`privilege_id`),
  ADD UNIQUE KEY `ind_privileges_uuid` (`uuid`),
  ADD KEY `fk_privileges_creator` (`creator`),
  ADD KEY `fk_privileges_changed_by` (`changed_by`);

--
-- Indexes for table `relationship`
--
ALTER TABLE `relationship`
  ADD PRIMARY KEY (`relationship_id`),
  ADD UNIQUE KEY `ind_relationship_uuid` (`uuid`),
  ADD KEY `fk_relationship_creator` (`creator`),
  ADD KEY `fk_relationship_changed_by` (`changed_by`),
  ADD KEY `fk_relationship_retired_by` (`retired_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `ind_roles_uuid` (`uuid`),
  ADD KEY `fk_roles_creator` (`creator`),
  ADD KEY `fk_roles_changed_by` (`changed_by`);

--
-- Indexes for table `role_privileges`
--
ALTER TABLE `role_privileges`
  ADD PRIMARY KEY (`role_privilege_id`),
  ADD KEY `fk_role_privileges_role_id` (`role_id`),
  ADD KEY `fk_role_privileges_privilege_id` (`privilege_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_system_settings_uuid` (`uuid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ind_users_uuid` (`uuid`),
  ADD KEY `fk_users_profiles_id` (`profiles_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_user_profiles_uuid` (`uuid`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_lore_id`),
  ADD UNIQUE KEY `ind_user_role_uuid` (`uuid`) USING BTREE,
  ADD KEY `fk_user_role_creator` (`creator`),
  ADD KEY `fk_user_role_changed_by` (`changed_by`),
  ADD KEY `fk_user_role_retired_by` (`retired_by`),
  ADD KEY `fk_user_role_user_id` (`user_id`),
  ADD KEY `fk_user_role_role_id` (`role_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`vaccine_id`),
  ADD UNIQUE KEY `ind_vaccine_uuid` (`uuid`),
  ADD KEY `fk_vaccine_creator` (`creator`),
  ADD KEY `fk_vaccine_changed_by` (`changed_by`),
  ADD KEY `fk_vaccine_retired_by` (`retired_by`);

--
-- Indexes for table `vaccine_configuration`
--
ALTER TABLE `vaccine_configuration`
  ADD PRIMARY KEY (`vaccine_configuration_id`),
  ADD UNIQUE KEY `ind_vaccine_configuration_uuid` (`uuid`),
  ADD KEY `fk_vaccine_configuration_creator` (`creator`),
  ADD KEY `fk_vaccine_configuration_changed_by` (`changed_by`),
  ADD KEY `fk_vaccine_configuration_voided_by` (`voided_by`),
  ADD KEY `fk_vaccine_configuration_vaccine` (`vaccine`),
  ADD KEY `fk_vaccine_configuration_configuration_type` (`configuration_type`);

--
-- Indexes for table `vaccine_configuration_type`
--
ALTER TABLE `vaccine_configuration_type`
  ADD PRIMARY KEY (`configuration_type_id`),
  ADD UNIQUE KEY `ind_vaccine_configuration_type_uuid` (`uuid`),
  ADD KEY `fk_vaccine_configuration_type_creator` (`creator`),
  ADD KEY `fk_vaccine_configuration_type_changed_by` (`changed_by`);

--
-- Indexes for table `v_program`
--
ALTER TABLE `v_program`
  ADD PRIMARY KEY (`v_program_id`),
  ADD UNIQUE KEY `ind_v_program_uuid` (`uuid`),
  ADD KEY `fk_v_program_creator` (`creator`),
  ADD KEY `fk_v_program_changed_by` (`changed_by`),
  ADD KEY `fk_v_program_voided_by` (`voided_by`),
  ADD KEY `fk_v_program_program_source` (`program_source`);

--
-- Indexes for table `v_program_number`
--
ALTER TABLE `v_program_number`
  ADD PRIMARY KEY (`program_number_id`),
  ADD UNIQUE KEY `ind_v_program_number_uuid` (`uuid`),
  ADD KEY `fk_v_program_number_creator` (`creator`),
  ADD KEY `fk_v_program_number_changed_by` (`change_by`),
  ADD KEY `fk_v_program_number_voided_by` (`voided_by`),
  ADD KEY `v_program_number_v_program` (`v_program`),
  ADD KEY `fk_v_program_number_number_source` (`number_source`);

--
-- Indexes for table `v_program_number_source`
--
ALTER TABLE `v_program_number_source`
  ADD PRIMARY KEY (`number_source_id`),
  ADD UNIQUE KEY `ind_v_program_number_source_uuid` (`uuid`),
  ADD KEY `fk_v_program_number_source_creator` (`creator`),
  ADD KEY `fk_v_program_number_source_changed_by` (`change_by`),
  ADD KEY `fk_v_program_number_source_retired_by` (`retired_by`);

--
-- Indexes for table `v_program_source`
--
ALTER TABLE `v_program_source`
  ADD PRIMARY KEY (`source_id`),
  ADD UNIQUE KEY `ind_v_program_source_uuid` (`uuid`),
  ADD KEY `fk_v_program_source_creator` (`creator`),
  ADD KEY `fk_v_program_source_changed_by` (`changed_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `birth_facilitator`
--
ALTER TABLE `birth_facilitator`
  MODIFY `facilitator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `birth_place`
--
ALTER TABLE `birth_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client_location`
--
ALTER TABLE `client_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client_parent`
--
ALTER TABLE `client_parent`
  MODIFY `client_parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2703;

--
-- AUTO_INCREMENT for table `inv_request`
--
ALTER TABLE `inv_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `inv_request_item`
--
ALTER TABLE `inv_request_item`
  MODIFY `request_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `inv_request_number`
--
ALTER TABLE `inv_request_number`
  MODIFY `request_number_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `inv_request_number_source`
--
ALTER TABLE `inv_request_number_source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_store`
--
ALTER TABLE `inv_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level_name`
--
ALTER TABLE `level_name`
  MODIFY `level_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level_set`
--
ALTER TABLE `level_set`
  MODIFY `level_set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level_type`
--
ALTER TABLE `level_type`
  MODIFY `level_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `relationship`
--
ALTER TABLE `relationship`
  MODIFY `relationship_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_privileges`
--
ALTER TABLE `role_privileges`
  MODIFY `role_privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_lore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `vaccine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vaccine_configuration`
--
ALTER TABLE `vaccine_configuration`
  MODIFY `vaccine_configuration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vaccine_configuration_type`
--
ALTER TABLE `vaccine_configuration_type`
  MODIFY `configuration_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `v_program`
--
ALTER TABLE `v_program`
  MODIFY `v_program_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `v_program_number`
--
ALTER TABLE `v_program_number`
  MODIFY `program_number_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `v_program_number_source`
--
ALTER TABLE `v_program_number_source`
  MODIFY `number_source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `v_program_source`
--
ALTER TABLE `v_program_source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_user_role_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_user_role_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `fk_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `v_program`
--
ALTER TABLE `v_program`
  ADD CONSTRAINT `fk_v_program_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_program_source` FOREIGN KEY (`program_source`) REFERENCES `v_program_source` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `v_program_number`
--
ALTER TABLE `v_program_number`
  ADD CONSTRAINT `fk_v_program_number_changed_by` FOREIGN KEY (`change_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_number_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_number_number_source` FOREIGN KEY (`number_source`) REFERENCES `v_program_number_source` (`number_source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_number_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `v_program_number_v_program` FOREIGN KEY (`v_program`) REFERENCES `v_program` (`v_program_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `v_program_number_source`
--
ALTER TABLE `v_program_number_source`
  ADD CONSTRAINT `fk_v_program_number_source_changed_by` FOREIGN KEY (`change_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_number_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_number_source_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `v_program_source`
--
ALTER TABLE `v_program_source`
  ADD CONSTRAINT `fk_v_program_source_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_program_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
