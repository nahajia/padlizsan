-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 17. 09:06
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `csevego14oszt`
--
CREATE DATABASE IF NOT EXISTS `csevego14oszt` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `csevego14oszt`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tema`
--

CREATE TABLE `tema` (
  `tema_id` int(11) NOT NULL,
  `tema_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tema`
--

INSERT INTO `tema` (`tema_id`, `tema_nev`) VALUES
(1, 'film'),
(2, 'ételek'),
(3, 'iskola');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uzenet`
--

CREATE TABLE `uzenet` (
  `uzenet_id` int(11) NOT NULL,
  `uzenet_kuldo` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `uzenet_szoveg` text COLLATE utf8_hungarian_ci NOT NULL,
  `uzenet_datum` date NOT NULL,
  `uzenet_tema_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `uzenet`
--

INSERT INTO `uzenet` (`uzenet_id`, `uzenet_kuldo`, `uzenet_szoveg`, `uzenet_datum`, `uzenet_tema_id`) VALUES
(80, 'Józsi', 'Az Örökkévalók jó film?', '2021-11-01', 1),
(81, 'Béla', 'Ha olyan mint a SangChi, akkor gyenge', '2021-11-01', 1),
(82, 'Kriszti', 'Mit főzzek?', '2022-11-16', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`tema_id`);

--
-- A tábla indexei `uzenet`
--
ALTER TABLE `uzenet`
  ADD PRIMARY KEY (`uzenet_id`),
  ADD KEY `uzenet_tema_id` (`uzenet_tema_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `tema`
--
ALTER TABLE `tema`
  MODIFY `tema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `uzenet`
--
ALTER TABLE `uzenet`
  MODIFY `uzenet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `uzenet`
--
ALTER TABLE `uzenet`
  ADD CONSTRAINT `uzenet_ibfk_1` FOREIGN KEY (`uzenet_tema_id`) REFERENCES `tema` (`tema_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
