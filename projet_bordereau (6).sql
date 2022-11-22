-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 22 nov. 2022 à 15:55
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_bordereau`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `Mdp` varchar(255) NOT NULL,
  `IDResponsable` varchar(255) DEFAULT NULL,
  `Nom` varchar(24) DEFAULT NULL,
  `Prenom` varchar(24) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `AdresseRue` varchar(64) DEFAULT NULL,
  `AdresseCP` char(5) DEFAULT NULL,
  `AdresseVille` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`Mdp`, `IDResponsable`, `Nom`, `Prenom`, `DateNaissance`, `Email`, `AdresseRue`, `AdresseCP`, `AdresseVille`) VALUES
('$2y$10$AZWUv1cmU9kF4FtwVSE.geVESivWtMBIZLejHFZ4LX6PwIPSNGSBC', NULL, 'Evan', 'Sabrie', '2022-10-05', 'evan@evan.evan', '23 rue evan evan', 'evan1', 'Evan 32');

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE `club` (
  `ID` int(11) NOT NULL,
  `Label` varchar(124) DEFAULT NULL,
  `Ligue` varchar(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `club`
--

INSERT INTO `club` (`ID`, `Label`, `Ligue`) VALUES
(1, 'club1', 'jsp c quoi');

-- --------------------------------------------------------

--
-- Structure de la table `km`
--

CREATE TABLE `km` (
  `Tarif` double(5,2) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `km`
--

INSERT INTO `km` (`Tarif`, `id`) VALUES
(1.20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `lignenote`
--

CREATE TABLE `lignenote` (
  `ID` int(11) NOT NULL,
  `IDMotif` int(11) NOT NULL,
  `IDNote` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Trajet` varchar(32) DEFAULT NULL,
  `Km` double(7,2) DEFAULT NULL,
  `CoutPeage` double(5,2) DEFAULT NULL,
  `CoutRepas` double(5,2) DEFAULT NULL,
  `CoutHebergement` double(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lignenote`
--

INSERT INTO `lignenote` (`ID`, `IDMotif`, `IDNote`, `Date`, `Trajet`, `Km`, `CoutPeage`, `CoutRepas`, `CoutHebergement`) VALUES
(2, 1, 2, '2022-11-18', 'explication', 18.00, 25.00, 150.00, 229.00),
(4, 2, 2, '2022-11-16', 'ouais', 45.00, 2.00, 2.00, 2.00),
(5, 2, 2, '2022-11-10', '5', 4.00, 5.00, 5.00, 5.00),
(6, 2, 2, '2022-03-10', 'bch', 10.00, 6.00, 5.00, 50.00);

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `IDMotif` int(11) NOT NULL,
  `Libelle` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`IDMotif`, `Libelle`) VALUES
(1, 'Test'),
(2, 'flemme');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `IDNote` int(11) NOT NULL,
  `IDAdherent` varchar(255) NOT NULL,
  `IDResponsable` varchar(255) DEFAULT NULL,
  `KmTarif` int(11) DEFAULT NULL,
  `IDClub` int(11) DEFAULT NULL,
  `Signataire` varchar(64) DEFAULT NULL,
  `Adresse` varchar(128) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Etat` enum('En cours','Validé','Justificatif nécessaire') NOT NULL,
  `Lieu` varchar(32) DEFAULT NULL,
  `NumRecu` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`IDNote`, `IDAdherent`, `IDResponsable`, `KmTarif`, `IDClub`, `Signataire`, `Adresse`, `Date`, `Etat`, `Lieu`, `NumRecu`) VALUES
(2, 'evan@evan.evan', NULL, 1, 1, 'Enzo', '26 rue enzo', '2022-11-09', 'En cours', 'un truc', '1200-05'),
(3, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1'),
(4, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1'),
(5, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1'),
(6, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1'),
(7, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1'),
(8, 'evan@evan.evan', NULL, 1, 1, NULL, NULL, '2022-11-22', 'En cours', NULL, '2022-1');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `Email` varchar(255) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Mail` varchar(70) DEFAULT NULL,
  `Mdp` varchar(70) NOT NULL,
  `AdresseRue` varchar(34) DEFAULT NULL,
  `AdresseCP` char(5) DEFAULT NULL,
  `AdresseVille` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`Email`, `Nom`, `Prenom`, `DateNaissance`, `Mail`, `Mdp`, `AdresseRue`, `AdresseCP`, `AdresseVille`) VALUES
('enzo@enzo.enzo', 'enzo', 'enzo', '2022-10-05', 'enzo', '$2y$10$AZWUv1cmU9kF4FtwVSE.geVESivWtMBIZLejHFZ4LX6PwIPSNGSBC', 'sersgrehh', '14251', 'dthhtdrh');

-- --------------------------------------------------------

--
-- Structure de la table `sabonner`
--

CREATE TABLE `sabonner` (
  `IDAdherent` varchar(255) NOT NULL,
  `Num` varchar(16) NOT NULL,
  `IdClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sabonner`
--

INSERT INTO `sabonner` (`IDAdherent`, `Num`, `IdClub`) VALUES
('evan@evan.evan', '5161681881', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sabonnerresp`
--

CREATE TABLE `sabonnerresp` (
  `Num` varchar(16) NOT NULL,
  `IdResponsable` varchar(255) NOT NULL,
  `IdClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `I_FK_ADHERENT_RESPONSABLE` (`IDResponsable`);

--
-- Index pour la table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `km`
--
ALTER TABLE `km`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignenote`
--
ALTER TABLE `lignenote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `I_FK_LIGNENOTE_MOTIF` (`IDMotif`),
  ADD KEY `I_FK_LIGNENOTE_NOTE` (`IDNote`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`IDMotif`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`IDNote`) USING BTREE,
  ADD KEY `I_FK_NOTE_ADHERENT` (`IDAdherent`),
  ADD KEY `I_FK_NOTE_RESPONSABLE` (`IDResponsable`),
  ADD KEY `I_FK_NOTE_CLUB` (`IDClub`),
  ADD KEY `fk2` (`KmTarif`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`Email`);

--
-- Index pour la table `sabonner`
--
ALTER TABLE `sabonner`
  ADD PRIMARY KEY (`IDAdherent`,`IdClub`),
  ADD KEY `IdClub` (`IdClub`);

--
-- Index pour la table `sabonnerresp`
--
ALTER TABLE `sabonnerresp`
  ADD PRIMARY KEY (`IdClub`,`IdResponsable`),
  ADD KEY `IdResponsable` (`IdResponsable`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `club`
--
ALTER TABLE `club`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `km`
--
ALTER TABLE `km`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lignenote`
--
ALTER TABLE `lignenote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `IDMotif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `IDNote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_ibfk_1` FOREIGN KEY (`IDResponsable`) REFERENCES `responsable` (`Email`);

--
-- Contraintes pour la table `lignenote`
--
ALTER TABLE `lignenote`
  ADD CONSTRAINT `lignenote_ibfk_1` FOREIGN KEY (`IDMotif`) REFERENCES `motif` (`IDMotif`),
  ADD CONSTRAINT `lignenote_ibfk_2` FOREIGN KEY (`IDNote`) REFERENCES `note` (`IDNote`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`IDAdherent`) REFERENCES `adherent` (`Email`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`IDResponsable`) REFERENCES `responsable` (`Email`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`IDClub`) REFERENCES `club` (`ID`),
  ADD CONSTRAINT `note_ibfk_4` FOREIGN KEY (`KmTarif`) REFERENCES `km` (`id`);

--
-- Contraintes pour la table `sabonner`
--
ALTER TABLE `sabonner`
  ADD CONSTRAINT `sabonner_ibfk_1` FOREIGN KEY (`IdClub`) REFERENCES `club` (`ID`),
  ADD CONSTRAINT `sabonner_ibfk_2` FOREIGN KEY (`IDAdherent`) REFERENCES `adherent` (`Email`);

--
-- Contraintes pour la table `sabonnerresp`
--
ALTER TABLE `sabonnerresp`
  ADD CONSTRAINT `sabonnerresp_ibfk_1` FOREIGN KEY (`IdResponsable`) REFERENCES `responsable` (`Email`),
  ADD CONSTRAINT `sabonnerresp_ibfk_2` FOREIGN KEY (`IdClub`) REFERENCES `club` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
