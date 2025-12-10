-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Kwi 2024, 15:02
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
-- Baza danych: `cvs_db_mb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Poland'),
(2, 'France'),
(3, 'United States of America'),
(4, 'United Kingdom');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `credentials`
--

INSERT INTO `credentials` (`id`, `username`, `password`) VALUES
(1, 'John', 'myPassword');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experiencedin`
--

CREATE TABLE `experiencedin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `experiencedin`
--

INSERT INTO `experiencedin` (`id`, `name`) VALUES
(1, 'java script'),
(2, 'java'),
(3, 'c#'),
(4, 'scala'),
(5, 'c'),
(6, 'mobile'),
(7, 'testing'),
(8, 'admin'),
(9, 'ux/ui'),
(10, 'gamedev'),
(11, 'analytics'),
(12, 'security'),
(13, 'data'),
(14, 'python'),
(15, 'c++');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experiencedinconnector`
--

CREATE TABLE `experiencedinconnector` (
  `userId` int(11) DEFAULT NULL,
  `pLangId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `experiencedinconnector`
--

INSERT INTO `experiencedinconnector` (`userId`, `pLangId`) VALUES
(1, 1),
(1, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `slangconnector`
--

CREATE TABLE `slangconnector` (
  `userId` int(11) DEFAULT NULL,
  `sLangId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `slangconnector`
--

INSERT INTO `slangconnector` (`userId`, `sLangId`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `slangs`
--

CREATE TABLE `slangs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `slangs`
--

INSERT INTO `slangs` (`id`, `name`) VALUES
(1, 'Polish'),
(2, 'English'),
(3, 'French');

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
  `github` char(255) DEFAULT NULL,
  `about` tinytext DEFAULT NULL,
  `available` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `country`, `city`, `github`, `about`, `available`) VALUES
(1, 'John', 'Doe', 3, 'Columbus', 'https://github.com/MikoBass/Pong', 'I have name and am person', 0x01),
(2, 'Jane', 'Doe', 2, 'Paris', 'github.com/MikoBass/pong', 'I am woman and i have name like my husband', 0x00);

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
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `experiencedin`
--
ALTER TABLE `experiencedin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `experiencedinconnector`
--
ALTER TABLE `experiencedinconnector`
  ADD KEY `userId` (`userId`),
  ADD KEY `pLangId` (`pLangId`);

--
-- Indeksy dla tabeli `slangconnector`
--
ALTER TABLE `slangconnector`
  ADD KEY `userId` (`userId`),
  ADD KEY `sLangId` (`sLangId`);

--
-- Indeksy dla tabeli `slangs`
--
ALTER TABLE `slangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `experiencedin`
--
ALTER TABLE `experiencedin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `slangs`
--
ALTER TABLE `slangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `credentials`
--
ALTER TABLE `credentials`
  ADD CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `experiencedinconnector`
--
ALTER TABLE `experiencedinconnector`
  ADD CONSTRAINT `experiencedinconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `experiencedinconnector_ibfk_2` FOREIGN KEY (`pLangId`) REFERENCES `experiencedin` (`id`);

--
-- Ograniczenia dla tabeli `slangconnector`
--
ALTER TABLE `slangconnector`
  ADD CONSTRAINT `slangconnector_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `slangconnector_ibfk_2` FOREIGN KEY (`sLangId`) REFERENCES `slangs` (`id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
