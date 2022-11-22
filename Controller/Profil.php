<?php
	session_start();
	include("../Model/fonction.php");
	$title = "Profil";
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}
	else
	{
		if($_SESSION["responsable"] == false){
			$table = "adherent";
			$table2 = "sabonner";
			$id = "IDAdherent ";
		}
		else {
			$table = "responsable";
			$table2 = "sabonnerresp";
			$id = "IdResponsable";
			$enfant = SelectUnCritere("adherent", $id, $_SESSION["email"]);
		}
		$champ1 = "Email";
		$result = SelectUnCritere($table, $champ1, $_SESSION["email"]);
		$club = SelectClub($table2, $id, $_SESSION["email"]);
	
	}
	
	

	include("../View/Profil.view.php");

?>