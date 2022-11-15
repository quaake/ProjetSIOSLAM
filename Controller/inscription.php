<?php

	include("../Model/fonction.php");
    $title = "Inscription";
    $table = "adherent";
    $str = "Location:connexion.php";

    if(isset($_POST['btnValid']) && $_POST['btnValid'] =='Valider' && $_POST['mdp'] == $_POST['mdpConf']){
        $mail = filter_input(INPUT_POST, 'Email', FILTER_VALIDATE_EMAIL);
        $hashMDP = password_hash($_POST['mdp'], PASSWORD_BCRYPT);
        $newAdherent = InsertAdherent($mail, $hashMDP, $_POST['Nom'], $_POST['prenom'], $_POST['Date'], $_POST['adresse'], $_POST['cp'], $_POST['ville']);
        if($newAdherent){
            header($str);
        }
        else{
            echo "Erreur lors de la création du nouvel adhérent !";
        }

        
}

 


	include("../View/inscription.view.php");

?>