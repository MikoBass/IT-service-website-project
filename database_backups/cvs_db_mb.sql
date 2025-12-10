-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2024 at 08:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvs_db_mb`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Poland'),
(2, 'France'),
(3, 'United States of America'),
(4, 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `username`, `password`) VALUES
(1, 'John', 'myPassword');

-- --------------------------------------------------------

--
-- Table structure for table `experiencedin`
--

CREATE TABLE `experiencedin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experiencedin`
--

INSERT INTO `experiencedin` (`id`, `name`) VALUES
(1, 'java_script'),
(2, 'java'),
(3, 'csharp'),
(4, 'scala'),
(5, 'c'),
(6, 'mobile'),
(7, 'testing'),
(8, 'admin'),
(9, 'ux-ui'),
(10, 'gamedev'),
(11, 'analitics'),
(12, 'security'),
(13, 'data'),
(14, 'python'),
(15, 'cpp');

-- --------------------------------------------------------

--
-- Table structure for table `experiencedinconnector`
--

CREATE TABLE `experiencedinconnector` (
  `userId` int(11) DEFAULT NULL,
  `pLangId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experiencedinconnector`
--

INSERT INTO `experiencedinconnector` (`userId`, `pLangId`) VALUES
(1, 1),
(1, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `slangconnector`
--

CREATE TABLE `slangconnector` (
  `userId` int(11) DEFAULT NULL,
  `sLangId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slangconnector`
--

INSERT INTO `slangconnector` (`userId`, `sLangId`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `slangs`
--

CREATE TABLE `slangs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slangs`
--

INSERT INTO `slangs` (`id`, `name`) VALUES
(1, 'Polish'),
(2, 'English'),
(3, 'French');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `github` char(255) DEFAULT NULL,
  `about` tinytext DEFAULT NULL,
  `available` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `country`, `city`, `github`, `about`, `available`) VALUES
(1, 'John', 'Doe', 3, 'Columbus', 'https://github.com/MikoBass/Pong', 'I have name and am person', 0x31),
(2, 'Jane', 'Doe', 2, 'Paris', 'github.com/MikoBass/pong', 'I am woman and i have name like my husband', 0x30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencedin`
--
ALTER TABLE `experiencedin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencedinconnector`
--
ALTER TABLE `experiencedinconnector`
  ADD KEY `userId` (`userId`),
  ADD KEY `pLangId` (`pLangId`);

--
-- Indexes for table `slangconnector`
--
ALTER TABLE `slangconnector`
  ADD KEY `userId` (`userId`),
  ADD KEY `sLangId` (`sLangId`);

--
-- Indexes for table `slangs`
--
ALTER TABLE `slangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experiencedin`
--
ALTER TABLE `experiencedin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `slangs`
--
ALTER TABLE `slangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credentials`
--
ALTER TABLE `credentials`
  ADD CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `experiencedinconnector`
--
ALTER TABLE `experiencedinconnector`
  ADD CONSTRAINT `experiencedinconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `experiencedinconnector_ibfk_2` FOREIGN KEY (`pLangId`) REFERENCES `experiencedin` (`id`);

--
-- Constraints for table `slangconnector`
--
ALTER TABLE `slangconnector`
  ADD CONSTRAINT `slangconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `slangconnector_ibfk_2` FOREIGN KEY (`sLangId`) REFERENCES `slangs` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
