<?php
	include("../Model/fonction.php");
	session_start();
	$title = "Gestion des notes";
	$error = "";
	//redirection en cas d'attaque par url
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}
	$result = SelectUnCritere("note","IDNote",$_POST["id"])->fetch();
	
	if(isset($_POST["btn"])) {
		if(UpdateDelete("Update note set signataire='".$_POST["n"]."', date='".$_POST["d"]."',Adresse='".$_POST["a"]."' WHERE IDNote=".$_POST["id"])) {
			header("Location:notes.php");
		} else {
			$error = "erreur lors de la modification";
		}

	}

	include("../View/editNote.view.php");
	
?>