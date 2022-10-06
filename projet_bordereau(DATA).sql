-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 06 oct. 2022 à 14:44
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
  `ID` int(11) NOT NULL,
  `IDResponsable` int(11) DEFAULT NULL,
  `Nom` varchar(24) DEFAULT NULL,
  `Prenom` varchar(24) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Mail` varchar(70) DEFAULT NULL,
  `AdresseRue` varchar(64) DEFAULT NULL,
  `AdresseCP` char(5) DEFAULT NULL,
  `AdresseVille` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE `club` (
  `ID` int(11) NOT NULL,
  `Label` varchar(124) DEFAULT NULL,
  `Ligue` varchar(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `ID` int(11) NOT NULL,
  `Libelle` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`ID`, `Libelle`) VALUES
(1, 'Réunion'),
(2, 'Compétition régionale'),
(3, 'Compétition nationale'),
(4, 'Compétition internationnale'),
(5, 'Stage');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `ID` int(11) NOT NULL,
  `IDAdherent` int(11) DEFAULT NULL,
  `IDResponsable` int(11) DEFAULT NULL,
  `KmTarif` double(5,2) DEFAULT NULL,
  `IDClub` int(11) DEFAULT NULL,
  `Signataire` varchar(64) DEFAULT NULL,
  `Adresse` varchar(128) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Lieu` varchar(32) DEFAULT NULL,
  `NumRecu` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Mail` varchar(70) DEFAULT NULL,
  `Mdp` varchar(70) DEFAULT NULL,
  `AdresseRue` varchar(34) DEFAULT NULL,
  `AdresseCP` char(5) DEFAULT NULL,
  `AdresseVille` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sabonner`
--

CREATE TABLE `sabonner` (
  `IDADHERENT` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `NumLicense` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`ID`),
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
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `sabonner`
--
ALTER TABLE `sabonner`
  ADD PRIMARY KEY (`IDADHERENT`,`ID`),
  ADD KEY `I_FK_SABONNER_ADHERENT` (`IDADHERENT`),
  ADD KEY `I_FK_SABONNER_CLUB` (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `club`
--
ALTER TABLE `club`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lignenote`
--
ALTER TABLE `lignenote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_ibfk_1` FOREIGN KEY (`IDResponsable`) REFERENCES `responsable` (`ID`);

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
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`IDAdherent`) REFERENCES `adherent` (`ID`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`IDResponsable`) REFERENCES `responsable` (`ID`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `club` (`ID`);

--
-- Contraintes pour la table `sabonner`
--
ALTER TABLE `sabonner`
  ADD CONSTRAINT `sabonner_ibfk_1` FOREIGN KEY (`IDADHERENT`) REFERENCES `adherent` (`ID`),
  ADD CONSTRAINT `sabonner_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `club` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
