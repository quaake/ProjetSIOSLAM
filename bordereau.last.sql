DROP DATABASE IF EXISTS Projet_Bordereau;

CREATE DATABASE IF NOT EXISTS Projet_Bordereau;
USE Projet_Bordereau;

# -----------------------------------------------------------------------------
#       TABLE : MOTIF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOTIF
 (
   ID INTEGER auto_increment NOT NULL  ,
   Libelle VARCHAR(64) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : RESPONSABLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESPONSABLE
 (
   Email VARCHAR(255) NOT NULL  ,
   Nom VARCHAR(25) NULL  ,
   Prenom VARCHAR(25) NULL  ,
   DateNaissance DATE NULL  ,
   Mdp VARCHAR(70) NOT NULL  ,
   AdresseRue VARCHAR(34) NULL  ,
   AdresseCP CHAR(5) NULL  ,
   AdresseVille VARCHAR(35) NULL  
   , PRIMARY KEY (Email) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTE
 (
   ID INTEGER auto_increment NOT NULL  ,
   IDAdherent VARCHAR(255) NULL  ,
   IDResponsable VARCHAR(255) NULL  ,
   KmTarif REAL(5,2) NULL  ,
   IDClub INTEGER NULL  ,
   Signataire VARCHAR(64) NULL  ,
   Adresse VARCHAR(128) NULL  ,
   Date DATE NULL  ,
   Nom VARCHAR(30) NOT NULL,
   Etat ENUM("En cours","Validé","Justificatif nécessaire") NOT NULL,
   Lieu VARCHAR(32) NULL  ,
   NumRecu VARCHAR(8) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE NOTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_NOTE_ADHERENT
     ON NOTE (IDADHERENT ASC);

CREATE  INDEX I_FK_NOTE_RESPONSABLE
     ON NOTE (IDRESPONSABLE ASC);

CREATE  INDEX I_FK_NOTE_CLUB
     ON NOTE (IDClub ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT
 (
   Mdp VARCHAR(255) NOT NULL,
   IDResponsable VARCHAR(255) NULL  ,
   Nom VARCHAR(24) NULL  ,
   Prenom VARCHAR(24) NULL  ,
   DateNaissance DATE NULL  ,
   Email VARCHAR(255) NOT NULL  ,
   AdresseRue VARCHAR(64) NULL  ,
   AdresseCP CHAR(5) NULL  ,
   AdresseVille VARCHAR(32) NULL  
   , PRIMARY KEY (Email) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ADHERENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ADHERENT_RESPONSABLE
     ON ADHERENT (IDResponsable ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLUB
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLUB
 (
   ID INTEGER auto_increment NOT NULL  ,
   Label VARCHAR(124) NULL  ,
   Ligue VARCHAR(124) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LIGNNOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LIGNENOTE
 (
   ID INTEGER auto_increment NOT NULL  ,
   IDMotif INTEGER NOT NULL  ,
   IDNote INTEGER NOT NULL  ,
   Date DATE NULL  ,
   Trajet VARCHAR(32) NULL  ,
   Km REAL(7,2) NULL  ,
   CoutPeage REAL(5,2) NULL  ,
   CoutRepas REAL(5,2) NULL  ,
   CoutHebergement REAL(5,2) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE LIGNNOTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_LIGNENOTE_MOTIF
     ON LIGNENOTE (IDMOTIF ASC);

CREATE  INDEX I_FK_LIGNENOTE_NOTE
     ON LIGNENOTE (IDNOTE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SABONNER
 (
   IDADHERENT VARCHAR(255) NOT NULL ,
   ID INTEGER NOT NULL ,
   NumLicense VARCHAR(16) NULL  
   , PRIMARY KEY (IDADHERENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ADHERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SABONNER_ADHERENT
     ON SABONNER (IDADHERENT ASC);

CREATE  INDEX I_FK_SABONNER_CLUB
     ON SABONNER (ID ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_ADHERENT (IDAdherent)
      REFERENCES ADHERENT (Email) ;


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_RESPONSABLE (IDResponsable)
      REFERENCES RESPONSABLE (Email) ;


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_CLUB (ID)
      REFERENCES CLUB (ID) ;


ALTER TABLE ADHERENT 
  ADD FOREIGN KEY FK_ADHERENT_RESPONSABLE (IDResponsable)
      REFERENCES RESPONSABLE (Email) ;


ALTER TABLE LIGNENOTE 
  ADD FOREIGN KEY FK_LIGNENOTE_MOTIF (IDMotif)
      REFERENCES MOTIF (ID) ;


ALTER TABLE LIGNENOTE 
  ADD FOREIGN KEY FK_LIGNENOTE_NOTE (IDNote)
      REFERENCES NOTE (ID) ;


ALTER TABLE SABONNER
  ADD FOREIGN KEY FK_ADHERE_ADHERENT (IDAdherent)
      REFERENCES ADHERENT (Email) ;


ALTER TABLE SABONNER
  ADD FOREIGN KEY FK_SABONNER_CLUB (ID)
      REFERENCES CLUB (ID) ;

