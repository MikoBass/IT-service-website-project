CREATE TABLE `credentials` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(20),
  `password` char
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `firstName` varchar(30),
  `lastName` varchar(30),
  `country` integer,
  `city` varchar(20),
  `sLangs` integer,
  `pLangs` integer,
  `technologies` integer,
  `workedIn` integer,
  `github` text,
  `about` text,
  `available` binary
);

CREATE TABLE `pLangs` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `uses` integer
);

CREATE TABLE `techs` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `uses` integer
);

CREATE TABLE `workedIn` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `sLangs` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `uses` integer
);

CREATE TABLE `country` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `sLangConnector` (
  `userId` integer,
  `sLangId` integer
);

CREATE TABLE `pLangConnector` (
  `userId` integer,
  `pLangId` integer
);

CREATE TABLE `workedInConnector` (
  `userId` integer,
  `workedInId` integer
);

CREATE TABLE `techConnector` (
  `userId` integer,
  `techId` integer
);

CREATE TABLE `plangUses` (
  `pLangId` integer,
  `workedInId` integer
);

CREATE TABLE `techsUses` (
  `techsId` integer,
  `workedInId` integer
);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `credentials` (`id`);

ALTER TABLE `sLangConnector` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `sLangConnector` ADD FOREIGN KEY (`sLangId`) REFERENCES `sLangs` (`id`);

ALTER TABLE `pLangConnector` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `pLangConnector` ADD FOREIGN KEY (`pLangId`) REFERENCES `pLangs` (`id`);

ALTER TABLE `workedInConnector` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `workedInConnector` ADD FOREIGN KEY (`workedInId`) REFERENCES `workedIn` (`id`);

ALTER TABLE `techConnector` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `techConnector` ADD FOREIGN KEY (`techId`) REFERENCES `techs` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`country`) REFERENCES `country` (`id`);

ALTER TABLE `plangUses` ADD FOREIGN KEY (`pLangId`) REFERENCES `pLangs` (`id`);

ALTER TABLE `plangUses` ADD FOREIGN KEY (`workedInId`) REFERENCES `workedIn` (`id`);

ALTER TABLE `techsUses` ADD FOREIGN KEY (`techsId`) REFERENCES `techs` (`id`);

ALTER TABLE `techsUses` ADD FOREIGN KEY (`workedInId`) REFERENCES `workedIn` (`id`);
