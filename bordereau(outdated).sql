DROP DATABASE IF EXISTS Projet1;

CREATE DATABASE IF NOT EXISTS Projet1;
USE Projet1;
# -----------------------------------------------------------------------------
#       TABLE : MOTIF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOTIF
 (
   IDMOTIF INTEGER NOT NULL  ,
   LIBELLEMOTIF VARCHAR(64) NULL  
   , PRIMARY KEY (IDMOTIF) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : RESPONSABLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESPONSABLE
 (
   IDRESPONSABLE INTEGER NOT NULL  ,
   NOM VARCHAR(24) NULL  ,
   PRENOM VARCHAR(24) NULL  ,
   DATENAISS DATE NULL  ,
   MAIL CHAR(32) NULL  ,
   MDP CHAR(32) NULL  ,
   ADRESSERUE VARCHAR(34) NULL  ,
   ADRESSECP INTEGER NULL  ,
   ADRESSEVILLE VARCHAR(34) NULL  
   , PRIMARY KEY (IDRESPONSABLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTE
 (
   IDNOTE INTEGER NOT NULL  ,
   IDADHERENT INTEGER NULL  ,
   IDRESPONSABLE INTEGER NULL  ,
   ID INTEGER NOT NULL  ,
   SIGNATAIRE VARCHAR(64) NULL  ,
   ADRESSE CHAR(126) NULL  ,
   DATE DATE NULL  ,
   LIEU VARCHAR(32) NULL  ,
   NUMRECU VARCHAR(8) NULL  
   , PRIMARY KEY (IDNOTE) 
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
     ON NOTE (ID ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT
 (
   IDADHERENT INTEGER NOT NULL  ,
   IDRESPONSABLE INTEGER NULL  ,
   NOM VARCHAR(24) NULL  ,
   PRENOM VARCHAR(24) NULL  ,
   DATNAISS DATE NULL  ,
   MAIL VARCHAR(32) NULL  ,
   ADRESSERUE VARCHAR(32) NULL  ,
   ADRESSECP INTEGER NULL  ,
   ADRESSEVILLE VARCHAR(32) NULL  
   , PRIMARY KEY (IDADHERENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ADHERENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ADHERENT_RESPONSABLE
     ON ADHERENT (IDRESPONSABLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLUB
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLUB
 (
   ID INTEGER NOT NULL  ,
   LABEL VARCHAR(24) NULL  ,
   LIGUE VARCHAR(24) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LIGNNOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LIGNNOTE
 (
   IDLNOTE INTEGER NOT NULL  ,
   IDMOTIF INTEGER NOT NULL  ,
   IDNOTE INTEGER NOT NULL  ,
   DATE DATE NULL  ,
   TRAJET VARCHAR(32) NULL  ,
   KM REAL(5,2) NULL  ,
   KMTARIF REAL(5,2) NULL  ,
   COUTPEAGE REAL(5,2) NULL  ,
   COUTREPAS REAL(5,2) NULL  ,
   COUTHEBERGEMENT REAL(5,2) NULL  
   , PRIMARY KEY (IDLNOTE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE LIGNNOTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_LIGNNOTE_MOTIF
     ON LIGNNOTE (IDMOTIF ASC);

CREATE  INDEX I_FK_LIGNNOTE_NOTE
     ON LIGNNOTE (IDNOTE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERE
 (
   IDADHERENT INTEGER NOT NULL  ,
   ID INTEGER NOT NULL  ,
   NUMLICENSE VARCHAR(16) NULL  
   , PRIMARY KEY (IDADHERENT,ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ADHERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ADHERE_ADHERENT
     ON ADHERE (IDADHERENT ASC);

CREATE  INDEX I_FK_ADHERE_CLUB
     ON ADHERE (ID ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_ADHERENT (IDADHERENT)
      REFERENCES ADHERENT (IDADHERENT) ;


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_RESPONSABLE (IDRESPONSABLE)
      REFERENCES RESPONSABLE (IDRESPONSABLE) ;


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_CLUB (ID)
      REFERENCES CLUB (ID) ;


ALTER TABLE ADHERENT 
  ADD FOREIGN KEY FK_ADHERENT_RESPONSABLE (IDRESPONSABLE)
      REFERENCES RESPONSABLE (IDRESPONSABLE) ;


ALTER TABLE LIGNNOTE 
  ADD FOREIGN KEY FK_LIGNNOTE_MOTIF (IDMOTIF)
      REFERENCES MOTIF (IDMOTIF) ;


ALTER TABLE LIGNNOTE 
  ADD FOREIGN KEY FK_LIGNNOTE_NOTE (IDNOTE)
      REFERENCES NOTE (IDNOTE) ;


ALTER TABLE ADHERE 
  ADD FOREIGN KEY FK_ADHERE_ADHERENT (IDADHERENT)
      REFERENCES ADHERENT (IDADHERENT) ;


ALTER TABLE ADHERE 
  ADD FOREIGN KEY FK_ADHERE_CLUB (ID)
      REFERENCES CLUB (ID) ;

