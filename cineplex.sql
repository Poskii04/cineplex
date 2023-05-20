-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 20, 2023 alle 08:53
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cineplex`
--
CREATE DATABASE IF NOT EXISTS `cineplex` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cineplex`;

-- --------------------------------------------------------

--
-- Struttura della tabella `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `CodC` int(11) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `citta` varchar(30) NOT NULL,
  `via` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cinema`
--

INSERT INTO `cinema` (`CodC`, `provincia`, `citta`, `via`) VALUES
(2, 'UD', 'San Daniele', 'Via BelProsciutto 48'),
(3, 'UD', 'Udine', 'Via Veronika 17'),
(4, 'MI', 'Milano', 'Via Antonio Zanon 77'),
(5, 'TS', 'Trieste', 'Via Pescheria 48');

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `CodF` int(11) NOT NULL,
  `titolo` varchar(20) NOT NULL,
  `genere` varchar(20) NOT NULL,
  `regista` varchar(40) NOT NULL,
  `minuti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`CodF`, `titolo`, `genere`, `regista`, `minuti`) VALUES
(1, 'Inception', 'Azione', 'Christopher Nolan', 190),
(2, 'La Tarantella', 'Musica', 'Alessandra Celentano', 110),
(3, '50 sfumature di Malg', 'Amore', 'Cristiano Malgioglio', 190),
(4, 'Devo fare nomi e cog', 'Dramma', 'Giuseppe Conte', 210),
(5, 'Shutter Island', 'Thriller ', 'Martin Scorsese', 170),
(6, 'Diego Maradona', 'Documentario ', 'Asif Kapadia', 110);

-- --------------------------------------------------------

--
-- Struttura della tabella `proiettare`
--

DROP TABLE IF EXISTS `proiettare`;
CREATE TABLE `proiettare` (
  `CodP` int(11) NOT NULL,
  `CodC` int(11) NOT NULL,
  `CodF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proiettare`
--

INSERT INTO `proiettare` (`CodP`, `CodC`, `CodF`) VALUES
(3, 2, 1),
(4, 2, 2),
(5, 2, 4),
(6, 2, 5),
(7, 2, 6),
(9, 2, 2),
(10, 2, 4),
(11, 2, 5),
(12, 2, 6),
(14, 2, 2),
(15, 2, 4),
(16, 2, 5),
(17, 2, 6),
(18, 2, 2),
(19, 2, 4),
(20, 2, 5),
(21, 2, 6),
(22, 3, 2),
(23, 3, 3),
(24, 2, 2),
(25, 2, 4),
(26, 2, 5),
(27, 2, 6),
(28, 3, 2),
(29, 3, 3),
(30, 4, 1),
(31, 4, 1),
(32, 4, 2),
(33, 4, 3),
(34, 4, 5),
(35, 5, 2),
(36, 5, 1),
(37, 5, 3),
(38, 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

DROP TABLE IF EXISTS `utenti`;
CREATE TABLE `utenti` (
  `CODU` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`CodC`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`CodF`);

--
-- Indici per le tabelle `proiettare`
--
ALTER TABLE `proiettare`
  ADD PRIMARY KEY (`CodP`),
  ADD KEY `CodC` (`CodC`),
  ADD KEY `CodF` (`CodF`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`CODU`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cinema`
--
ALTER TABLE `cinema`
  MODIFY `CodC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `CodF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `proiettare`
--
ALTER TABLE `proiettare`
  MODIFY `CodP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `CODU` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `proiettare`
--
ALTER TABLE `proiettare`
  ADD CONSTRAINT `proiettare_ibfk_1` FOREIGN KEY (`CodC`) REFERENCES `cinema` (`CodC`),
  ADD CONSTRAINT `proiettare_ibfk_2` FOREIGN KEY (`CodF`) REFERENCES `film` (`CodF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
