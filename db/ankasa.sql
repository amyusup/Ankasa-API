-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2020 at 04:28 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ankasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `facilities` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `terminal` varchar(255) NOT NULL,
  `seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`id`, `name`, `image`, `facilities`, `class`, `code`, `terminal`, `seat`) VALUES
(1, 'Garuda Indonesia', 'https://i.ibb.co/FgJV3K8/garuda-indonesia-logo-BD82882-F07-seeklogo-4.png', 'Wifi,Toilet,Snack,Baggage', 'Business', 'GA-001', 'A,B,C', 200),
(2, 'Air Asia', 'https://i.ibb.co/GW4cm94/AIR-ASIA-1-2.png', 'Snack,Toilet', 'Economy', 'QZ-001', 'A', 150),
(3, 'Lion Air', 'https://i.ibb.co/CbTk2P2/Lion-Air-logo-logotype-2.png', 'Toilet', 'Economy', 'JT-001', 'B', 120),
(4, 'Garuda Indonesia', 'https://i.ibb.co/QpbHPn0/kisspng-logo-airplane-garuda-indonesia-airline-members-benefits-ppia-unimelb-5b6cf86a673673-33004425.png', 'Snack,Baggage,Wifi,Toilet', 'First', 'GA-002', 'A,B,C', 200),
(5, 'Fly Emirates', 'https://i.ibb.co/PQZ5YBQ/kisspng-emirates-auckland-airline-team-new-zealand-united-arab-emirates-5b0698dfbfb6a1-1361480515271.png', 'Snack,Baggage,Wifi,Toilet', 'Business', 'EK-001', 'A,C', 250),
(6, 'Air Asia', 'https://i.ibb.co/GW4cm94/AIR-ASIA-1-2.png', 'Snack,Baggage,Wifi,Toilet', 'Business', 'AK-001', 'A,B,C', 300),
(7, 'Citilink', 'https://i.ibb.co/FgJV3K8/garuda-indonesia-logo-BD82882-F07-seeklogo-4.png', 'Snack,Baggage,Toilet', 'Economy', 'QG-001', 'A', 150),
(8, 'Lion Air', 'https://i.ibb.co/CbTk2P2/Lion-Air-logo-logotype-2.png', 'Toilet', 'Economy', 'JT-001', 'B', 120);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ordered_seat` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isPaid` tinyint(1) NOT NULL,
  `fee` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `flight_id`, `user_id`, `ordered_seat`, `time`, `isPaid`, `fee`) VALUES
(1, 3, 2, '18,19,20,21', '2020-11-30 15:42:21', 1, 0),
(2, 125, 2, '1,2,3,4,5,6', '2020-11-30 18:08:38', 0, 0),
(3, 131, 2, '1,2', '2020-12-01 12:45:16', 0, 800000),
(4, 131, 2, '3,4', '2020-12-01 12:46:00', 0, 800000),
(5, 184, 2, '1,2', '2020-12-01 14:59:30', 0, 1400000);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sending_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `id_from`, `id_to`, `message`, `sending_time`) VALUES
(1, 2, 4, 'ini first chat', '2020-11-28 15:56:38'),
(2, 4, 2, 'ini second chat', '2020-11-28 16:56:26'),
(3, 4, 2, 'hallo', '2020-11-28 18:21:41'),
(4, 2, 4, 'testing kuy', '2020-11-28 18:26:18'),
(5, 2, 4, 'testing lagi kuy', '2020-11-28 18:31:53'),
(6, 2, 4, 'hallo juga', '2020-11-28 18:32:43'),
(7, 2, 4, 'hai lagi', '2020-11-28 18:38:08'),
(8, 2, 4, 'mantap gan', '2020-11-28 19:14:15'),
(9, 2, 4, '123123', '2020-11-28 19:16:36'),
(10, 2, 4, 'hai', '2020-11-29 02:09:41'),
(11, 2, 4, 'testing kuy', '2020-11-29 02:11:59'),
(12, 2, 3, 'hallo admin', '2020-11-30 00:04:33'),
(13, 2, 2, 'tes', '2020-12-01 13:06:02'),
(14, 2, 2, '', '2020-12-01 13:06:05'),
(15, 2, 1, 'hallo', '2020-12-01 13:28:35'),
(16, 2, 1, 'bjir dicuekin', '2020-12-01 13:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `city_departure` varchar(255) NOT NULL,
  `city_arrived` varchar(255) NOT NULL,
  `plane` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `departure` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `time_estimate` time NOT NULL,
  `gate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `city_departure`, `city_arrived`, `plane`, `price`, `seat`, `departure`, `status`, `time_estimate`, `gate`) VALUES
(1, 'Medan', 'Tokyo', 1, 2000000, 1, '2020-11-28 10:17:27', 0, '08:30:00', 2),
(2, 'Jakarta', 'Singapore', 1, 700000, 8, '2020-11-30 15:24:53', 0, '03:30:00', 2),
(3, 'Jakarta', 'Singapore', 3, 700000, 21, '2020-11-30 15:42:21', 0, '03:30:00', 2),
(104, 'Jakarta', 'Tokyo', 1, 700000, 0, '2020-12-01 12:03:47', 0, '03:30:00', 2),
(105, 'Jakarta', 'Tokyo', 3, 900000, 0, '2020-12-01 15:03:57', 0, '02:30:00', 2),
(106, 'Tokyo', 'Jakarta', 2, 400000, 0, '2020-12-01 12:03:57', 0, '03:30:00', 2),
(107, 'Tokyo', 'Jakarta', 4, 500000, 0, '2020-12-01 15:03:57', 0, '02:30:00', 2),
(108, 'Barcelona', 'Jakarta', 5, 500000, 0, '2020-12-01 17:03:57', 0, '03:30:00', 2),
(109, 'Jakarta', 'London', 1, 700000, 0, '2020-12-01 17:03:47', 0, '05:30:00', 2),
(110, 'Jakarta', 'London', 3, 900000, 0, '2020-12-01 18:03:57', 0, '03:30:00', 2),
(111, 'London', 'Jakarta', 2, 400000, 0, '2020-12-01 19:03:57', 0, '05:30:00', 2),
(112, 'London', 'Jakarta', 4, 500000, 0, '2020-12-01 20:03:57', 0, '03:30:00', 2),
(113, 'Jakarta', 'Barcelona', 5, 500000, 0, '2020-12-01 22:03:57', 0, '05:30:00', 2),
(114, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-02 12:03:47', 0, '03:30:00', 2),
(115, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-02 15:03:57', 0, '02:30:00', 2),
(116, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-02 12:03:57', 0, '03:30:00', 2),
(117, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-02 15:03:57', 0, '01:30:00', 2),
(118, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-02 17:03:57', 0, '06:30:00', 2),
(119, 'Istanbul', 'London', 1, 700000, 0, '2020-12-02 17:03:47', 0, '04:30:00', 2),
(120, 'Istanbul', 'London', 3, 900000, 0, '2020-12-02 18:03:57', 0, '03:30:00', 2),
(121, 'London', 'Istanbul', 2, 400000, 0, '2020-12-02 19:03:57', 0, '02:30:00', 2),
(122, 'London', 'Istanbul', 4, 500000, 0, '2020-12-02 20:03:57', 0, '03:30:00', 2),
(123, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-02 22:03:57', 0, '04:30:00', 2),
(124, 'Jakarta', 'Tokyo', 1, 700000, 0, '2020-12-03 12:03:47', 0, '03:30:00', 2),
(125, 'Jakarta', 'Tokyo', 3, 900000, 6, '2020-11-30 18:08:38', 0, '02:30:00', 2),
(126, 'Tokyo', 'Jakarta', 2, 400000, 0, '2020-12-03 12:03:57', 0, '03:30:00', 2),
(127, 'Tokyo', 'Jakarta', 4, 500000, 0, '2020-12-03 15:03:57', 0, '02:30:00', 2),
(128, 'Barcelona', 'Jakarta', 5, 500000, 0, '2020-12-03 17:03:57', 0, '03:30:00', 2),
(129, 'Jakarta', 'London', 1, 700000, 0, '2020-12-03 17:03:47', 0, '05:30:00', 2),
(130, 'Jakarta', 'London', 3, 900000, 0, '2020-12-03 18:03:57', 0, '03:30:00', 2),
(131, 'London', 'Jakarta', 2, 400000, 4, '2020-12-01 12:46:00', 0, '05:30:00', 2),
(132, 'London', 'Jakarta', 4, 500000, 0, '2020-12-03 20:03:57', 0, '03:30:00', 2),
(133, 'Jakarta', 'Barcelona', 5, 500000, 0, '2020-12-03 22:03:57', 0, '05:30:00', 2),
(134, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-07 12:03:47', 0, '03:30:00', 2),
(135, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-07 15:03:57', 0, '02:30:00', 2),
(136, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-07 12:03:57', 0, '03:30:00', 2),
(137, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-07 15:03:57', 0, '01:30:00', 2),
(138, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-07 17:03:57', 0, '06:30:00', 2),
(139, 'Istanbul', 'London', 1, 700000, 0, '2020-12-07 17:03:47', 0, '04:30:00', 2),
(140, 'Istanbul', 'London', 3, 900000, 0, '2020-12-07 18:03:57', 0, '03:30:00', 2),
(141, 'London', 'Istanbul', 2, 400000, 0, '2020-12-07 19:03:57', 0, '02:30:00', 2),
(142, 'London', 'Istanbul', 4, 500000, 0, '2020-12-07 20:03:57', 0, '03:30:00', 2),
(143, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-07 22:03:57', 0, '04:30:00', 2),
(144, 'Sydney', 'Jakarta', 1, 700000, 0, '2020-12-04 12:03:47', 0, '03:30:00', 2),
(145, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-04 15:03:57', 0, '02:30:00', 2),
(146, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-04 12:03:57', 0, '03:30:00', 2),
(147, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-04 15:03:57', 0, '02:30:00', 2),
(148, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-04 17:03:57', 0, '03:30:00', 2),
(149, 'Sydney', 'London', 1, 700000, 0, '2020-12-04 17:03:47', 0, '05:30:00', 2),
(150, 'Sydney', 'London', 3, 900000, 0, '2020-12-04 18:03:57', 0, '03:30:00', 2),
(151, 'London', 'Sydney', 2, 400000, 0, '2020-12-04 19:03:57', 0, '05:30:00', 2),
(152, 'London', 'Sydney', 4, 500000, 0, '2020-12-04 20:03:57', 0, '03:30:00', 2),
(153, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-04 22:03:57', 0, '05:30:00', 2),
(154, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-05 12:03:47', 0, '03:30:00', 2),
(155, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-05 15:03:57', 0, '02:30:00', 2),
(156, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-05 12:03:57', 0, '03:30:00', 2),
(157, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-05 15:03:57', 0, '01:30:00', 2),
(158, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-05 17:03:57', 0, '06:30:00', 2),
(159, 'Istanbul', 'London', 1, 700000, 0, '2020-12-05 17:03:47', 0, '04:30:00', 2),
(160, 'Istanbul', 'London', 3, 900000, 0, '2020-12-05 18:03:57', 0, '03:30:00', 2),
(161, 'London', 'Istanbul', 2, 400000, 0, '2020-12-05 19:03:57', 0, '02:30:00', 2),
(162, 'London', 'Istanbul', 4, 500000, 0, '2020-12-05 20:03:57', 0, '03:30:00', 2),
(163, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-05 22:03:57', 0, '04:30:00', 2),
(164, 'Sydney', 'Jakarta', 1, 700000, 0, '2020-12-06 12:03:47', 0, '03:30:00', 2),
(165, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-06 15:03:57', 0, '02:30:00', 2),
(166, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-06 12:03:57', 0, '03:30:00', 2),
(167, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-06 15:03:57', 0, '02:30:00', 2),
(168, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-06 17:03:57', 0, '03:30:00', 2),
(169, 'Sydney', 'London', 1, 700000, 0, '2020-12-06 17:03:47', 0, '05:30:00', 2),
(170, 'Sydney', 'London', 3, 900000, 0, '2020-12-06 18:03:57', 0, '03:30:00', 2),
(171, 'London', 'Sydney', 2, 400000, 0, '2020-12-06 19:03:57', 0, '05:30:00', 2),
(172, 'London', 'Sydney', 4, 500000, 0, '2020-12-06 20:03:57', 0, '03:30:00', 2),
(173, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-06 22:03:57', 0, '05:30:00', 2),
(174, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-08 12:03:47', 0, '03:30:00', 2),
(175, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-08 15:03:57', 0, '02:30:00', 2),
(176, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-08 12:03:57', 0, '03:30:00', 2),
(177, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-08 15:03:57', 0, '01:30:00', 2),
(178, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-08 17:03:57', 0, '06:30:00', 2),
(179, 'Istanbul', 'London', 1, 700000, 0, '2020-12-08 17:03:47', 0, '04:30:00', 2),
(180, 'Istanbul', 'London', 3, 900000, 0, '2020-12-08 18:03:57', 0, '03:30:00', 2),
(181, 'London', 'Istanbul', 2, 400000, 0, '2020-12-08 19:03:57', 0, '02:30:00', 2),
(182, 'London', 'Istanbul', 4, 500000, 0, '2020-12-08 20:03:57', 0, '03:30:00', 2),
(183, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-08 22:03:57', 0, '04:30:00', 2),
(184, 'Sydney', 'Jakarta', 1, 700000, 2, '2020-12-01 14:59:30', 0, '03:30:00', 2),
(185, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-09 15:03:57', 0, '02:30:00', 2),
(186, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-09 12:03:57', 0, '03:30:00', 2),
(187, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-09 15:03:57', 0, '02:30:00', 2),
(188, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-09 17:03:57', 0, '03:30:00', 2),
(189, 'Sydney', 'London', 1, 700000, 0, '2020-12-09 17:03:47', 0, '05:30:00', 2),
(190, 'Sydney', 'London', 3, 900000, 0, '2020-12-09 18:03:57', 0, '03:30:00', 2),
(191, 'London', 'Sydney', 2, 400000, 0, '2020-12-09 19:03:57', 0, '05:30:00', 2),
(192, 'London', 'Sydney', 4, 500000, 0, '2020-12-09 20:03:57', 0, '03:30:00', 2),
(193, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-09 22:03:57', 0, '05:30:00', 2),
(194, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-10 12:03:47', 0, '03:30:00', 2),
(195, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-10 15:03:57', 0, '02:30:00', 2),
(196, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-10 12:03:57', 0, '03:30:00', 2),
(197, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-10 15:03:57', 0, '01:30:00', 2),
(198, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-10 17:03:57', 0, '06:30:00', 2),
(199, 'Istanbul', 'London', 1, 700000, 0, '2020-12-10 17:03:47', 0, '04:30:00', 2),
(200, 'Istanbul', 'London', 3, 900000, 0, '2020-12-10 18:03:57', 0, '03:30:00', 2),
(201, 'London', 'Istanbul', 2, 400000, 0, '2020-12-10 19:03:57', 0, '02:30:00', 2),
(202, 'London', 'Istanbul', 4, 500000, 0, '2020-12-10 20:03:57', 0, '03:30:00', 2),
(203, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-10 22:03:57', 0, '04:30:00', 2),
(204, 'Jakarta', 'London', 3, 900000, 0, '2020-12-03 18:03:57', 0, '03:30:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `airplane_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `top_destination`
--

CREATE TABLE `top_destination` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `top_destination`
--

INSERT INTO `top_destination` (`id`, `city`, `country`, `img`) VALUES
(1, 'Tokyo', 'Japan', 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80%20750w'),
(2, 'Bali', 'Indonesia', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=377&q=80%20377w'),
(3, 'Singapore', 'Singapore', 'https://images.unsplash.com/photo-1565967511849-76a60a516170?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80%20751w'),
(4, 'Agra', 'India', 'https://images.unsplash.com/photo-1545562083-c583d014b4f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=718&q=80 718w'),
(5, 'Barcelona', 'Spain', 'https://images.unsplash.com/photo-1562883676-8c7feb83f09b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=361&q=80 361w'),
(6, 'Sydney', 'Australia', 'https://images.unsplash.com/photo-1549180030-48bf079fb38a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=282&q=80 282w'),
(7, 'Paris', 'France', 'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80 334w'),
(8, 'Phuket', 'Thailand', 'https://images.unsplash.com/photo-1568434927638-4acfab6b11dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80 375w'),
(9, 'London', 'England', 'https://images.unsplash.com/photo-1494922275507-58dc039ed337?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80%20334w'),
(10, 'Istanbul', 'Turkey', 'https://images.unsplash.com/photo-1602941800793-78c44baca4d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80%20375w'),
(11, 'Washington DC', 'United States', 'https://images.unsplash.com/photo-1565571370459-5c78ebb358de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80 400w');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `biometric` varchar(1000) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `photo` varchar(1000) NOT NULL DEFAULT 'blank.png',
  `phone` varchar(11) NOT NULL,
  `device_token` varchar(1000) NOT NULL DEFAULT '',
  `role` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `biometric`, `address`, `photo`, `phone`, `device_token`, `role`) VALUES
(1, 'Admin Rizky', 'rizky@admin.co', 'anjay', NULL, '', 'blank.png', '', '', 6),
(2, 'Rizky Agung Pratama', 'agungrizky1805@gmail.com', '$2b$10$E9zYGx9sk7tUxVablD1uK.FpWwr05JrO4wu2eEwnkqie0GYD6OyiG', NULL, 'Jakarta,  Indonesia', '1606831194478-IMG_20201108_102231.jpg', '87796523558', '', 5),
(3, 'Ahmad Maulana Yusuf', 'amyusup@gmail.com', '$2b$10$6jxFE53g5JNb9HEjtViUH.nDR1mWsE8NfMx1B.M.l2HbTtldwVDD2', NULL, '', '', '0', '', 5),
(4, 'Saidina Hamzah', 'hamzah12@gmail.com', '$2b$10$dCn7EsgYV926.38UWrLDnulu.v0zkaiXMBDstQh.QAaxaElYlbCOC', NULL, '', '', '0', '', 5),
(5, 'Ucup Hamzah', 'saiducup@gmail.com', '$2b$10$OEo4fa/LVlwtyVLpypHNV.ZicvcVByoA.uZ8NrGOREqwuESpCeZP6', NULL, 'Bagatelle, Barbados', 'blank.png', '', '', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_from` (`id_from`),
  ADD KEY `id_to` (`id_to`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plane` (`plane`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airplane_id` (`airplane_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `top_destination`
--
ALTER TABLE `top_destination`
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
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane`) REFERENCES `airlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`airplane_id`) REFERENCES `airlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
