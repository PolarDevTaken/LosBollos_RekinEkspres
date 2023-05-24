-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Maj 2023, 20:59
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `lbre_delivery`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `delivery_man`
--

CREATE TABLE `delivery_man` (
  `id_dm` int(11) NOT NULL,
  `name_dm` varchar(32) NOT NULL,
  `city_dm` varchar(32) NOT NULL,
  `adress_dm` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `delivery_man`
--

INSERT INTO `delivery_man` (`id_dm`, `name_dm`, `city_dm`, `adress_dm`) VALUES
(0, 'Włodzimierz Kowalski', 'Chorzów', 'Armii Krajowej 42'),
(1, 'Sławek Dobryczłowiek', 'Gliwice', 'Chorzowska 3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ordery_man`
--

CREATE TABLE `ordery_man` (
  `id_om` int(11) NOT NULL,
  `name_om` varchar(32) NOT NULL,
  `city_om` varchar(32) NOT NULL,
  `adress_om` varchar(32) NOT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ordery_man`
--

INSERT INTO `ordery_man` (`id_om`, `name_om`, `city_om`, `adress_om`, `points`) VALUES
(0, 'Jerzy Krzak', 'Chorzów', 'Armii Krajowej 42', 1),
(1, 'Andrzej Przydatny', 'Gliwice', 'Chorzowska 3', 15190);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `package`
--

CREATE TABLE `package` (
  `id_p` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `adress` varchar(32) NOT NULL,
  `ordery_man` int(11) NOT NULL,
  `delivery_man` int(11) NOT NULL,
  `package_sent` date NOT NULL,
  `est_arrival` date NOT NULL,
  `has_arrived` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `package`
--

INSERT INTO `package` (`id_p`, `name`, `city`, `adress`, `ordery_man`, `delivery_man`, `package_sent`, `est_arrival`, `has_arrived`) VALUES
(0, 'Randomproduct', 'Chorzów', 'Armii Krajowej 46', 0, 0, '2023-03-03', '2023-04-03', 1),
(1, 'Los Kurczakos', 'Gliwice', 'Chorzowska 5', 0, 0, '2023-05-17', '2023-05-24', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id_r` int(11) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id_r`, `description`) VALUES
(0, 'admin'),
(1, 'user'),
(2, 'deliveryman');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(0, 'golo', 'dobra', 3),
(1, 'test_user', 'dobra', 1),
(2, 'test_deliveryman', 'dobra', 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`id_dm`);

--
-- Indeksy dla tabeli `ordery_man`
--
ALTER TABLE `ordery_man`
  ADD PRIMARY KEY (`id_om`);

--
-- Indeksy dla tabeli `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id_p`),
  ADD KEY `ordery_man` (`ordery_man`),
  ADD KEY `delivery_man` (`delivery_man`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`ordery_man`) REFERENCES `ordery_man` (`id_om`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`delivery_man`) REFERENCES `delivery_man` (`id_dm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
