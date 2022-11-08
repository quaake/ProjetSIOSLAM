<?php
	include("../Model/fonction.php");
	session_start();
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}
	$error = "";
	if(isset($_POST["btn"]) && $_POST["btn"]) {
		if($_SESSION["responsable"]) {

		}
		else {
			$array = array("IDADHERENT"=>$_SESSION["email"],"ID"=>$_POST["club"],"NumLicense"=>$_POST["num"]);
			$query = "INSERT into sabonner(IDAdherent,IdClub,Num) VALUE (:IDADHERENT,:ID,:NumLicense)";
			$result = Insert($array,$query);
			if (!$result) 
				$error = "erreur lors de l'insertion";
			else 
				header("Location:club.php");
			
		}
	}
	$title = "Gestion des clubs";
	$result = Select("club");
	include("../View/clubAdd.view.php");
?>