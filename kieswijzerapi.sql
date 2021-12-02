-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 02 dec 2021 om 13:25
-- Serverversie: 10.4.22-MariaDB
-- PHP-versie: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kieswijzerapi`
--
CREATE DATABASE IF NOT EXISTS `kieswijzerapi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kieswijzerapi`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `beheerder`
--

DROP TABLE IF EXISTS `beheerder`;
CREATE TABLE `beheerder` (
  `id` int(11) NOT NULL,
  `gebruikers_naam` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211202092219', '2021-12-02 10:46:35', 46),
('DoctrineMigrations\\Version20211202093810', '2021-12-02 10:46:35', 10),
('DoctrineMigrations\\Version20211202100505', '2021-12-02 11:18:06', 81);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vraag`
--

DROP TABLE IF EXISTS `vraag`;
CREATE TABLE `vraag` (
  `id` int(11) NOT NULL,
  `vraag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `juiste_antwoord` tinyint(1) NOT NULL,
  `punten_ict` int(11) NOT NULL,
  `punten_aen_m` int(11) NOT NULL,
  `punten_ten_i` int(11) NOT NULL,
  `punten_mei` int(11) NOT NULL,
  `punten_ben_i` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vraag`
--

INSERT INTO `vraag` (`id`, `vraag`, `juiste_antwoord`, `punten_ict`, `punten_aen_m`, `punten_ten_i`, `punten_mei`, `punten_ben_i`) VALUES
(1, 'Ik ben vaak degene die verzint om iets leuks te doen met vrienden of familie.', 1, 0, 1, 1, 1, 1),
(2, 'Ik kan aan  de hand van een gesprek inbeelden wat iemand bedoelt. ', 1, 3, 0, 0, 0, 0),
(3, 'Ik ben vaak degene die de leiding neemt in een groep.', 0, 0, 1, 1, 0, 1),
(4, 'Ik heb wel eens gesleuteld aan een voertuig (scooter, fiets, auto, vrachtwagen) door zelf mijn lekke band te vervangen.', 1, 0, 3, 0, 0, 0),
(5, 'Ik geef ook wel eens advies aan vrienden of familie. ', 0, 0, 1, 1, 0, 1),
(6, 'Het lezen en tekenen van elektrische – of technische schema’s lijkt mij interessant.', 1, 0, 0, 0, 3, 0),
(7, 'Als een vriend zijn verhaal doet, luister ik oprecht naar hem/haar. ', 0, 0, 0, 1, 0, 0),
(8, 'Het aanleggen van wegen, bruggen en waterbouwkundige wegen spreekt mij aan.', 1, 0, 0, 0, 0, 3),
(9, 'Werken in een groep is echt iets voor mij. Ik vind het handig als het werk verdeeld kan worden.  ', 1, 1, 1, 1, 1, 1),
(10, 'Het lijkt mij interessant om prototypes (bijvoorbeeld een\"3\"d-printer) te maken.', 1, 0, 0, 3, 0, 0),
(11, 'Ik vind het leuk om een praatje met nieuwe mensen te maken. ', 0, 1, 0, 1, 1, 0),
(12, 'Ik ga voorzichtig om met persoonlijke informatie van anderen.', 1, 3, 0, 0, 0, 0),
(13, 'Ik kan mensen overtuigen van mijn mening op een positieve manier.', 0, 1, 1, 1, 0, 0),
(14, 'Ik wil graag weten hoe een auto/fiets/scooter/vrachtwagen werkt.', 1, 0, 3, 0, 0, 0),
(15, 'Ik vind presenteren voor een groep spannend, maar ik durf het wel. ', 0, 0, 1, 1, 0, 0),
(16, 'Het aanleggen en aansluiten van elektrische installaties (lampen) lijkt echt iets voor mij.', 1, 0, 0, 0, 3, 0),
(17, 'Ik kan aan het einde van een film kort vertellen waarover het ging. ', 1, 1, 1, 1, 1, 1),
(18, 'Ik kan goed met anderen samenwerken in een projectgroep.', 1, 0, 0, 0, 0, 3),
(19, 'Wat ik heb geleerd probeer ik toe te passen in mijn bijbaantje. ', 1, 1, 1, 1, 1, 1),
(20, 'De productie van drones of robots te begeleiden spreekt mij aan.', 1, 0, 0, 3, 0, 0),
(21, 'Als mijn screenprotector stuk is, kan ik het met behulp van een YouTube video zelf repareren. ', 1, 1, 1, 1, 1, 1),
(22, 'Het lijkt mij leuk om een website te ontwikkelen.', 1, 3, 0, 0, 0, 0),
(23, 'Bij nieuwsberichten kan ik eruit halen wat wel en niet belangrijk is.', 1, 1, 1, 1, 1, 0),
(24, 'Het werken met speciale en bijzondere voertuigen zoals brandweervoertuigen spreekt mij aan.', 1, 0, 3, 0, 0, 0),
(25, 'Wanneer de wifi het niet doet, ga ik zelf opzoek naar de oorzaken en oplossingen. ', 1, 1, 1, 1, 1, 1),
(26, 'Het installeren en aansluiten keuken en sanitaire onderdelen spreekt mij aan.', 1, 0, 0, 0, 3, 0),
(27, 'Ik heb vaak originele ideeën.', 1, 1, 0, 1, 1, 1),
(28, 'Het meedenken en werken aan het bouwen van een gebouw spreekt mij aan.', 1, 0, 0, 0, 0, 3),
(29, 'Ik hou ervan om meer te weten over een onderwerp.', 1, 1, 1, 1, 1, 1),
(30, 'Het lijkt mij leuk om het onderhoud van drones of robots voor te bereiden en ondersteunen.', 1, 0, 0, 3, 0, 0),
(31, 'Ik ben degene in een groep die altijd een planning maakt en hou me er ook aan.', 0, 1, 0, 1, 0, 0),
(32, 'Ik blijf doorgaan totdat ik mijn doel heb bereikt ondanks tegenslagen.', 1, 3, 0, 0, 0, 0),
(33, 'Ik vind het leuk om een probleem op te lossen voor een ander.', 1, 1, 1, 1, 1, 1),
(34, 'Als ik geen speciaal gereedschap heb om een reparatie uit te voeren, maak ik zelf een speciale tool om het werk te doen.', 1, 0, 3, 0, 0, 0),
(35, 'Wanneer ik met een taak bezig ben, doe ik het zo goed mogelijk. ', 1, 1, 1, 1, 1, 1),
(36, 'Het lijkt mij leuk om een cv (centrale verwarming) aan te leggen in een huis of kantoor.  ', 1, 0, 0, 0, 3, 0),
(37, 'Wanneer er regels zijn om ons veilig te houden, volg ik de regels.', 1, 0, 1, 1, 1, 1),
(38, 'Ik zie mezelf later in de gebouwde omgeving werken als schilder of timmerman of metselaar.', 1, 0, 0, 0, 0, 3),
(39, 'Ik vind het fijn dat elke dag anders is.', 1, 1, 1, 1, 1, 1),
(40, 'De bewerking-, montage- en bedradingtechnieken voor het monteren van onderdelen (bijvoorbeeld een robotarm) is echt iets voor mij.', 1, 0, 0, 3, 0, 0),
(41, 'Ik kan meerdere activiteiten tegelijkertijd aan. ', 1, 1, 1, 1, 1, 1),
(42, 'Ik heb interesse in het leren ontwerpen van netwerken en systemen.', 1, 3, 0, 0, 0, 0),
(43, 'Ik maak altijd iets af wanneer ik met iets ben begonnen. ', 1, 1, 0, 1, 1, 1),
(44, 'Het werken met speciale hulpmiddelen om zware onderdelen van bijvoorbeeld vrachtwagens te de- en monteren lijkt mij gaaf.', 1, 0, 3, 0, 0, 0),
(45, 'Als er kansen zijn pak ik die. ', 1, 0, 1, 0, 1, 1),
(46, 'Het lassen van metalen en het verbinden daarvan lijkt mij gaaf om te doen.', 1, 0, 0, 0, 3, 0),
(47, 'Ik zie mezelf later werken met de volgende materialen: hout, beton, tegels, bakstenen, natuurlijke materialen.', 1, 0, 0, 0, 0, 3),
(48, 'Het lijkt mij leuk om apparatuur en machines te bouwen en onderhouden met behulp van mechanica, elektronica en ICT.', 1, 0, 0, 3, 0, 0);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `beheerder`
--
ALTER TABLE `beheerder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_954CF31CD5FD38DA` (`gebruikers_naam`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `vraag`
--
ALTER TABLE `vraag`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `beheerder`
--
ALTER TABLE `beheerder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `vraag`
--
ALTER TABLE `vraag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
