-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Maj 2024, 14:36
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `portfoliodatabase`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `country`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `credentials`
--

INSERT INTO `credentials` (`id`, `username`, `password`) VALUES
(1, 'John', 'mypassword'),
(2, 'Jane', 'passwd'),
(3, 'MikoBass', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(4, 'Joe', 'ccb711f092ac8ef1805b5045fab7e8a6189cb97ad04565e21b5fbcfc9e542e42'),
(5, 'Ronald', '8c434fcd506dbd81e723fb4e0a18b6ddf2ebe4ef9f4c5e472e9f4fdc347d4fec'),
(6, 'StefekB', '41455bd85390f866c132887d4ec3771240b21700c1b8de233ddab2d832c20c00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experience`
--

CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lanOrExp` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `experience`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `experienceconnector`
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
(5, 2),
(5, 17),
(6, 2),
(6, 6),
(6, 18);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test`
--

CREATE TABLE `test` (
  `a` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `country`, `city`, `github`, `about`, `available`) VALUES
(1, 'John', 'Doe', 4, 'Boston', 'github.com', 'Description of meself', 0x31),
(2, 'Jane', 'Doe', 2, 'Paris', 'github.com', 'Description of myself', 0x30),
(3, 'Mikołaj', 'Baran', 1, 'Moryń', 'github.com/MikoBass', 'test', 0x30),
(4, 'Joe', 'Mama', 4, 'Burbank', 'github.com', 'Whos joe', 0x31),
(5, 'Ronald', 'McDonald', 4, 'New York', 'github.com/McDonalds', 'obese', 0x31),
(6, 'Stefan', 'Batory', 1, 'Śląsk', 'github.com', 'lubie ser', 0x31);

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
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `experienceconnector`
--
ALTER TABLE `experienceconnector`
  ADD CONSTRAINT `experiencedinconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `experiencedinconnector_ibfk_2` FOREIGN KEY (`experienceId`) REFERENCES `experience` (`id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
