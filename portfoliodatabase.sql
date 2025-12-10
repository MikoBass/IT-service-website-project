-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 22, 2024 at 11:03 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfoliodatabase`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Poland'),
(2, 'France'),
(3, 'United_Kingdom'),
(4, 'United_States_of_America');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `username`, `password`) VALUES
(1, 'John', 'mypassword'),
(2, 'Jane', 'passwd'),
(3, 'MikoBass', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(4, 'Joe', 'ccb711f092ac8ef1805b5045fab7e8a6189cb97ad04565e21b5fbcfc9e542e42'),
(5, 'Ronald', '8c434fcd506dbd81e723fb4e0a18b6ddf2ebe4ef9f4c5e472e9f4fdc347d4fec'),
(6, 'Dragon', '3319a8d777ecdca37ead423f4f8ee0650ec3fd70dbe7686ae0a4ac854f9e0337'),
(7, 'Telefon', '44ccc7309ee7c53c336317fe57da449a8b6ae14781829e1aea8aec5277f07a87'),
(8, 'komputer', 'bd823791d15b53c274056d5fea7bddc6851fdff6547f3871f7be100e5ec1fe1b'),
(9, 'kubek', '72ba608dbfac8d46d4aaf40f428badf85af1f929fece7480e56602b4452a71fe'),
(10, 'Domino', '159c22c53d328c2d2258ea4814abfb5a2f81ff779225ecc3b8f4122f9ad54bfa'),
(11, 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experience`
--

CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lanOrExp` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `name`, `lanOrExp`) VALUES
(1, 'java_script', 'exp'),
(2, 'java', 'exp'),
(3, 'csharp', 'exp'),
(4, 'html', 'exp'),
(5, 'css', 'exp'),
(6, 'c', 'exp'),
(7, 'cpp', 'exp'),
(8, 'mobile', 'exp'),
(9, 'data', 'exp'),
(10, 'testing', 'exp'),
(11, 'admin', 'exp'),
(12, 'analitics', 'exp'),
(13, 'ux-ui', 'exp'),
(14, 'gamedev', 'exp'),
(15, 'security', 'exp'),
(16, 'Polish', 'lan'),
(17, 'English', 'lan'),
(18, 'French', 'lan');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experienceconnector`
--

CREATE TABLE `experienceconnector` (
  `userId` int(11) DEFAULT NULL,
  `experienceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experienceconnector`
--

INSERT INTO `experienceconnector` (`userId`, `experienceId`) VALUES
(1, 2),
(1, 14),
(1, 17),
(2, 7),
(2, 18),
(2, 17),
(3, 5),
(3, 1),
(3, 4),
(3, 17),
(3, 16),
(5, 1),
(5, 8),
(5, 11),
(5, 14),
(5, 12),
(5, 15),
(5, 9),
(5, 5),
(5, 7),
(5, 17),
(5, 18),
(6, 2),
(6, 5),
(6, 8),
(7, 3),
(7, 6),
(7, 8),
(7, 11),
(7, 13),
(7, 16),
(8, 2),
(8, 17),
(9, 2),
(9, 17),
(11, 1),
(11, 17),
(10, 1),
(10, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `available` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `country`, `city`, `github`, `about`, `available`) VALUES
(1, 'John', 'Doe', 4, 'Boston', 'github.com', 'Description of meself', 0x31),
(2, 'Jane', 'Doe', 2, 'Paris', 'github.com', 'Description of myself', 0x30),
(3, 'Mikołaj', 'Baran', 1, 'Moryń', 'github.com/MikoBass', 'test', 0x30),
(4, 'Joe', 'Mama', 4, 'Burbank', 'github.com', 'Whos joe', 0x31),
(5, 'Ronald', 'McDonald', 4, 'New York', 'github.com/McDonalds', 'obese', 0x31),
(6, 'Daniel', 'Magical', 1, 'Albequerky', 'github.com', 'asdasdasda', 0x31),
(7, 'Tel', 'Efon', 2, 'Apple', 'github.com', 'asddfsdfsdfas', 0x31),
(8, 'komputer', 'komputer', 1, 'komputer', 'komputera', 'sdas', 0x31),
(9, 'szklanka', 'szklanka', 3, 'szklanka', 'szklanka', 'szklanka', 0x30),
(10, 'kubek', 'kubek', 3, 'kubek', 'kubek', 'kubek', 0x30),
(11, 'kubek', 'szklanka', 2, 'kubek', 'as', 'asdadsfasdfsa', 0x30);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `experienceconnector`
--
ALTER TABLE `experienceconnector`
  ADD KEY `experiencedinconnector_ibfk_1` (`userId`),
  ADD KEY `experiencedinconnector_ibfk_2` (`experienceId`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_ibfk_1` (`country`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `experienceconnector`
--
ALTER TABLE `experienceconnector`
  ADD CONSTRAINT `experiencedinconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `experiencedinconnector_ibfk_2` FOREIGN KEY (`experienceId`) REFERENCES `experience` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
