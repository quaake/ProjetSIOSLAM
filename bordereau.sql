-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 22 nov. 2022 à 15:27
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
-- Base de données : `bordereau`
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
('$2y$10$1AnJEFBvs3SBwq74yF/IUe0qhvR5EbR5aTI6JKHw3GjyJ.XM.kk9m', 'enzo@enzo.enzo', 'Nom', 'Prenom', '2015-07-15', 'adh@email.fr', '52 rue de ch', '52000', 'Chaumont'),
('$2y$10$AZWUv1cmU9kF4FtwVSE.geVESivWtMBIZLejHFZ4LX6PwIPSNGSBC', 'enzo@enzo.enzo', 'Evan', 'Sabrie', '2022-10-05', 'evan@evan.evan', '23 rue evan evan', 'evan1', 'Evan 32');

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
(1, 'Club escrime', 'Sport de combat'),
(2, 'Club foot', 'Sport collectif'),
(3, 'Club Boxe', 'Sport combat');

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

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `ID` int(11) NOT NULL,
  `Libelle` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `ID` int(11) NOT NULL,
  `IDAdherent` varchar(255) DEFAULT NULL,
  `IDResponsable` varchar(255) DEFAULT NULL,
  `KmTarif` double(5,2) DEFAULT NULL,
  `IDClub` int(11) DEFAULT NULL,
  `Signataire` varchar(64) DEFAULT NULL,
  `Adresse` varchar(128) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Nom` varchar(30) NOT NULL,
  `Etat` enum('En cours','Validé','Justificatif nécessaire') NOT NULL,
  `Lieu` varchar(32) DEFAULT NULL,
  `NumRecu` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`ID`, `IDAdherent`, `IDResponsable`, `KmTarif`, `IDClub`, `Signataire`, `Adresse`, `Date`, `Nom`, `Etat`, `Lieu`, `NumRecu`) VALUES
(1, 'evan@evan.evan', NULL, 0.28, 1, 'Evan', 'adresse?', '2022-11-01', 'Nom', 'En cours', 'Chaumont', '2009-007'),
(2, 'evan@evan.evan', NULL, 0.28, 1, 'Evan', 'adresse?', '2022-10-11', 'Nom', 'Validé', 'Chaumont', '2022-010');

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
('adh@email.fr', '', 3),
('evan@evan.evan', '', 1),
('evan@evan.evan', '', 2);

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
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `I_FK_NOTE_ADHERENT` (`IDAdherent`),
  ADD KEY `I_FK_NOTE_RESPONSABLE` (`IDResponsable`),
  ADD KEY `I_FK_NOTE_CLUB` (`IDClub`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `lignenote`
--
ALTER TABLE `lignenote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `lignenote_ibfk_1` FOREIGN KEY (`IDMotif`) REFERENCES `motif` (`ID`),
  ADD CONSTRAINT `lignenote_ibfk_2` FOREIGN KEY (`IDNote`) REFERENCES `note` (`ID`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`IDAdherent`) REFERENCES `adherent` (`Email`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`IDResponsable`) REFERENCES `responsable` (`Email`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `club` (`ID`);

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
