-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 14 feb 2022 om 11:10
-- Serverversie: 10.4.19-MariaDB
-- PHP-versie: 8.0.6

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `beheerder`
--

CREATE TABLE `beheerder` (
  `id` int(11) NOT NULL,
  `gebruikers_naam` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `beheerder`
--

INSERT INTO `beheerder` (`id`, `gebruikers_naam`, `roles`, `password`, `image`) VALUES
(1, 'adminMarvin', '[\"admin\"]', 'testadmin', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

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
('DoctrineMigrations\\Version20211202100505', '2021-12-02 11:18:06', 81),
('DoctrineMigrations\\Version20220131113931', '2022-01-31 12:42:27', 147);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vraag`
--

CREATE TABLE `vraag` (
  `id` int(11) NOT NULL,
  `vraag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `juiste_antwoord` tinyint(1) NOT NULL,
  `punten_ict` int(11) NOT NULL,
  `punten_aen_m` int(11) NOT NULL,
  `punten_ten_i` int(11) NOT NULL,
  `punten_mei` int(11) NOT NULL,
  `punten_ben_i` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vraag`
--

INSERT INTO `vraag` (`id`, `vraag`, `juiste_antwoord`, `punten_ict`, `punten_aen_m`, `punten_ten_i`, `punten_mei`, `punten_ben_i`, `image`) VALUES
(53, 'Ik ben vaak degene die verzint om iets leuks te doen met vrienden of familie.', 1, 0, 1, 1, 1, 1, 'imgVraag1.png'),
(54, 'Ik kan aan  de hand van een gesprek inbeelden wat iemand bedoelt.', 1, 3, 0, 0, 0, 0, 'imgVraag2.png'),
(55, 'Ik ben vaak degene die de leiding neemt in een groep.', 0, 0, 1, 1, 0, 1, 'imgVraag3.png'),
(56, 'Ik heb wel eens gesleuteld aan een voertuig (scooter, fiets, auto, vrachtwagen) door zelf mijn lekke band te vervangen. ', 1, 0, 3, 0, 0, 0, 'imgVraag4.png'),
(57, 'Ik geef ook wel eens advies aan vrienden of familie.', 0, 0, 1, 1, 0, 1, 'imgVraag5.png'),
(58, 'Het lezen en tekenen van elektrische – of technische schema’s lijkt mij interessant.', 1, 0, 0, 0, 3, 0, 'imgVraag6.png'),
(59, 'Als een vriend zijn verhaal doet, luister ik oprecht naar hem/haar.', 0, 0, 0, 1, 0, 0, 'imgVraag7.png'),
(60, 'Het aanleggen van wegen, bruggen en waterbouwkundige wegen spreekt mij aan.', 1, 0, 0, 0, 0, 3, 'imgVraag8.png'),
(61, 'Werken in een groep is echt iets voor mij. Ik vind het handig als het werk verdeeld kan worden.', 1, 1, 1, 1, 1, 1, 'imgVraag9.png'),
(62, 'Het lijkt mij interessant om prototypes (bijvoorbeeld een 3d-printer) te maken.', 1, 0, 0, 3, 0, 0, 'imgVraag10.png'),
(63, 'Ik vind het leuk om een praatje met nieuwe mensen te maken.', 0, 1, 0, 0, 1, 0, 'imgVraag11.png'),
(64, 'Ik ga voorzichtig om met persoonlijke informatie van anderen.', 1, 3, 0, 0, 0, 0, 'imgVraag12.png'),
(65, 'Ik kan mensen overtuigen van mijn mening op een positieve manier.', 0, 1, 1, 1, 0, 0, 'imgVraag13.png'),
(66, 'Ik wil graag weten hoe een auto/fiets/scooter/vrachtwagen werkt.', 1, 0, 3, 0, 0, 0, 'imgVraag14.png'),
(67, 'Ik vind presenteren voor een groep spannend, maar ik durf het wel.', 0, 0, 1, 1, 0, 0, 'imgVraag15.png'),
(68, 'Het maken van elektrische dingen is echt iets voor mij.', 1, 0, 0, 0, 3, 0, 'imgVraag16.png'),
(69, 'Ik kan aan het einde van een film kort vertellen waarover het ging.', 1, 1, 1, 1, 1, 1, 'imgVraag17.png'),
(70, 'Ik kan goed met anderen samenwerken in een projectgroep.', 1, 0, 0, 0, 0, 3, 'imgVraag18.png'),
(71, 'Wat ik heb geleerd probeer ik toe te passen in mijn bijbaantje. ', 1, 1, 1, 1, 1, 1, 'imgVraag19.png'),
(72, 'De productie van drones of robots te begeleiden spreekt mij aan.', 1, 0, 0, 3, 0, 0, 'imgVraag20.png'),
(73, 'Als mijn screenprotector stuk is, kan ik het met behulp van een YouTube video zelf repareren.', 1, 1, 1, 1, 1, 1, 'imgVraag21.png'),
(74, 'Het lijkt mij leuk om een website of app te ontwerpen.', 1, 3, 0, 0, 0, 0, 'imgVraag22.png'),
(75, 'Bij nieuwsberichten kan ik eruit halen wat wel en niet belangrijk is.', 1, 1, 1, 1, 1, 0, 'imgVraag23.png'),
(76, 'Het werken met speciale en bijzondere voertuigen zoals brandweervoertuigen spreekt mij aan.', 1, 0, 3, 0, 0, 0, 'imgVraag24.png'),
(77, 'Wanneer de wifi het niet doet, ga ik zelf opzoek naar de oorzaken en oplossingen.', 1, 1, 1, 1, 1, 1, 'imgVraag25.png'),
(78, 'Het maken en repareren van een keuken of badkamer lijkt mij wel leuk.', 1, 0, 0, 0, 3, 0, 'imgVraag26.png'),
(79, 'Ik heb vaak originele ideeën.', 1, 1, 0, 1, 1, 1, 'imgVraag27.png'),
(80, 'Het meedenken en werken aan het bouwen van een gebouw spreekt mij aan.', 1, 1, 1, 1, 1, 3, 'imgVraag28.png'),
(81, 'ik doe graag kennis op.', 1, 1, 1, 1, 1, 1, 'imgVraag29.png'),
(82, 'robots vind ik cool ik maak ze graag.', 1, 0, 0, 3, 0, 0, 'imgVraag30.png'),
(83, 'Ik ben degene in een groep die altijd een planning maakt en hou me er ook aan.', 0, 1, 0, 1, 0, 0, 'imgVraag31.png'),
(84, 'Ik blijf doorgaan totdat ik mijn doel heb bereikt ondanks tegenslagen.', 1, 3, 0, 0, 0, 0, 'imgVraag32.png'),
(85, 'Ik vind het leuk om een probleem op te lossen voor een ander.', 1, 1, 1, 1, 1, 1, 'imgVraag33.png'),
(86, 'Als ik geen speciaal gereedschap heb om een reparatie uit te voeren, maak ik zelf een speciale tool om het werk te doen.', 1, 0, 3, 0, 0, 0, 'imgVraag34.png'),
(87, 'Wanneer ik met een taak bezig ben, doe ik het zo goed mogelijk.', 1, 1, 1, 1, 1, 1, 'imgVraag35.png'),
(88, 'Het lijkt mij leuk om een cv (centrale verwarming) aan te leggen in een huis of kantoor.  ', 1, 0, 0, 0, 3, 0, 'imgVraag36.png'),
(89, 'Wanneer er regels zijn om ons veilig te houden, volg ik de regels.', 1, 0, 1, 1, 1, 1, 'imgVraag37.png'),
(90, 'schilderen en timmeren lijkt me wel leuk.', 1, 0, 0, 0, 0, 3, 'imgVraag38.png'),
(91, 'Ik vind het fijn dat elke dag anders is.', 1, 1, 1, 1, 1, 1, 'imgVraag39.png'),
(92, 'het maken van een robot arm lijkt me wel cool om te doen.', 1, 0, 0, 3, 0, 0, 'imgVraag40.png'),
(93, 'Ik kan meerdere activiteiten tegelijkertijd aan. ', 1, 1, 1, 1, 1, 1, 'imgVraag41.png'),
(94, 'het maken van een internet netwerk lijkt me cool.', 1, 3, 0, 0, 0, 0, 'imgVraag42.png'),
(95, 'Ik maak altijd iets af wanneer ik met iets ben begonnen.', 1, 1, 0, 1, 1, 1, 'dummyImg.png'),
(96, 'Het werken met grote machines zoals vrachtwagens lijkt me cool.', 1, 0, 3, 0, 0, 0, 'dummyImg.png'),
(97, 'Als er kansen zijn pak ik die.', 1, 0, 1, 0, 1, 1, 'imgVraag45.png'),
(98, 'Het lassen van metalen en het verbinden daarvan lijkt mij gaaf om te doen.', 1, 0, 0, 0, 1, 0, 'dummyImg.png'),
(99, 'Ik zie mezelf later werken met de volgende materialen: hout, beton, tegels, bakstenen, natuurlijke materialen.', 1, 0, 0, 0, 0, 3, 'dummyImg.png'),
(100, 'Het lijkt mij leuk om apparatuur en machines te bouwen en onderhouden met behulp van mechanica, elektronica en ICT.', 1, 0, 0, 3, 0, 0, 'dummyImg.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `vraag`
--
ALTER TABLE `vraag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
