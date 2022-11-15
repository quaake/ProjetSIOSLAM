<?php

	include("../Model/fonction.php");
    $title = "Inscription";

    $sql = "INSERT INTO MyGuests (Mdp, Nom, Prenom, DateNaissance,Email,AdresseRue,AdresseCP,AdresseVille)
    VALUES ('John', 'Doe', 'john@example.com')";


 


	include("../View/inscription.view.php");

?>