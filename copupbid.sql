-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 10:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `copupbid`
--

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `id` int(11) NOT NULL,
  `auction_title` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `current_bid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `countdown_timer` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `auction_title`, `start_date`, `image_path`, `end_date_time`, `user_id`, `current_bid`, `countdown_timer`, `description`) VALUES
(27, '2k', '2023-10-09 13:51:00', '/copup/auction_uploads/6523eaa6ce478.png', NULL, 0, 0.00, 0, NULL),
(28, '5k', '2023-10-09 13:57:00', '/copup/auction_uploads/6523eab6e3087.png', NULL, 0, 0.00, 0, NULL),
(29, '5k', '2023-10-09 15:17:00', '/copup/auction_uploads/6523ef46a992a.png', NULL, 0, 0.00, 0, NULL),
(30, 'moving on', '2023-10-10 14:47:00', '/copup/auction_uploads/6524048dc7ca8.png', NULL, 0, 0.00, 0, NULL),
(31, 'moving on', '2023-10-10 14:47:00', '/copup/auction_uploads/65240620c0d83.png', NULL, 0, 0.00, 0, NULL),
(32, 'moving on', '2023-10-10 14:47:00', '/copup/auction_uploads/652406243c462.png', NULL, 0, 0.00, 0, NULL),
(33, '5k', '2023-10-09 15:17:00', '/copup/auction_uploads/65240628c84a7.png', NULL, 0, 0.00, 0, NULL),
(34, '5k', '2023-10-09 15:17:00', '/copup/auction_uploads/65240721dd852.png', NULL, 0, 0.00, 0, NULL),
(35, '5k', '2023-10-09 15:17:00', '/copup/auction_uploads/652407da13b86.png', NULL, 0, 0.00, 0, NULL),
(36, '5k prix', '2023-10-10 15:02:00', '/copup/auction_uploads/652407f896dc7.png', '2023-10-10 15:02:00', 0, 0.00, 0, NULL),
(37, '5k', '2023-10-14 15:40:00', '/copup/auction_uploads/65256291558cc.png', '2023-10-14 15:41:00', 0, 0.00, 0, NULL),
(38, '5k new ', '2023-10-14 10:32:00', '/copup/auction_uploads/652a62372580e.png', '2023-10-14 02:32:00', 0, 0.00, 0, NULL),
(39, '5k new 2', '2023-10-14 10:41:00', '/copup/auction_uploads/652a625268f10.png', '2023-10-15 10:41:00', 0, 0.00, 0, NULL),
(40, 'new work one data ', '2023-10-14 10:57:00', '/copup/auction_uploads/652a662ef049c.png', '2023-10-16 10:57:00', 0, 0.00, 0, NULL),
(41, 'set time', '2023-10-14 13:40:00', '/copup/auction_uploads/652a8c3de70a7.png', '2023-10-14 18:40:00', 0, 0.00, 0, 'work now thanks '),
(42, 'help', '2023-10-14 16:43:00', '/copup/auction_uploads/652a8d1e952f3.jpeg', '2023-10-14 19:43:00', 0, 0.00, 0, 'time');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `bid_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `bid_coin_balance` int(11) NOT NULL DEFAULT 0,
  `main_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone_number`, `full_name`, `bid_coin_balance`, `main_amount`, `is_admin`) VALUES
(1, 'potato', '$2y$10$66ZfPl6w4E99Fu6Tuhw3puCJmF/ldJyHbMR4FzQsoiv2CbeOFfVh2', 'oghenesupersam914@gmail.com', '', '', 1900, 0.00, 0),
(2, 'test', '$2y$10$vPU/p5DGJ1I4LJpc4pEE4.F0ASWxL96.GG0oJLuzqNdyxaRGseDFG', 'test@gmail.com', '', '', 200, 0.00, 0),
(3, 'light1', '$2y$10$2tvTrukSCNpv6ajgX9Btk.ZrGWmYF3wXMTH/XceMzCDSZL4K32N7y', 'light1@gmail.com', '', '', 210, 0.00, 0),
(4, 'light', '$2y$10$yRQvSuPzQIWtkNjDwAecx.KnYgQzSJMjBT3YgCXfW45PFM4HyHnnG', 'light@gmail.com', '', '', 0, 0.00, 0),
(5, 'potato0', '$2y$10$ZmuQt1Hsk1f.H2qn4mGMI.2eoQiFGICNNlTpmSIJtQn.wTjV1A3Re', 'potato0@gmail.com', '', '', 100, 0.00, 0),
(6, 'potato03', '$2y$10$UFCE0fyOA9BEkjgUMuQ3K.E3fJ/oMKwx8/1VqYfRCteq8E6Maqeai', 'potato03@gmail.com', '07065785436', '', 0, 0.00, 0),
(7, 'chris', '$2y$10$x5MlM/4Gkso5bEN2ClkWh.hgF30vr/ipz5UMFEYqKDXvYkUH4ACK2', 'chris@gmail.com', '+2348035788493', 'chris nice', 0, 0.00, 0),
(10, 'admin', '$2y$10$i7wkIBlIBr4mR/4WBRKvs.G6goW1OKNugmebYf50kfyAhCPfXxyeC', '', '', '', 0, 0.00, 1),
(11, 'kewe', '$2y$10$8HFTk1mm/TpluPbof4V7a.1B2bVFht/Ty8zXGqO0.2UvlXreAY7Mu', 'kewe@gmail.com', '0908879363', 'kewe', 10, 0.00, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
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
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
