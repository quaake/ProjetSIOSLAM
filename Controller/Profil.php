<?php
	session_start();
	include("../Model/fonction.php");
	$title = "Profil";

	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}
	else
	{
		if(!$_SESSION["responsable"]){
			$table = "adherent";
			$table2 = "sabonner";
			$id = "IDAdherent ";
		}
		else {
			$table = "responsable";
			$table2 = "sabonnerresp";
			$id = "IdResponsable";
		}
		$champ1 = "Email";
		$result = SelectUnCritere($table, $champ1, $_SESSION["email"]);
		$club = SelectJoinCritere($table, $table2, "club","Email",$id , "IDClub", "ID", "Email", $_SESSION["email"]);
	}
	
	

	include("../View/Profil.view.php");

?>