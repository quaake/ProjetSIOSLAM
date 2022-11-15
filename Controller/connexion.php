<?php
	include("../Model/fonction.php");
	session_start();
	$title = "connexion";
	$error = "";

	if(isset($_POST["btn"])) {
		
		$result = SelectUnCritere("adherent","Email",$_POST["ema"]);
		if($line = $result->fetch()) {
			if(password_verify($_POST["pwd"],$line["Mdp"])==1) {
				$_SESSION["login"] = SelectUnCritere("Adherent", "Email", $_POST["ema"])->fetch()["Nom"];
				$_SESSION["email"] = $_POST["ema"];
				$_SESSION["responsable"] = false;
				header("Location:index.php");
			}
			
		}
		$result = SelectUnCritere("responsable","Email",$_POST["ema"]);
		if($line = $result->fetch()) {
			if(password_verify($_POST["pwd"],$line["Mdp"])==1) {
					$_SESSION["login"] = SelectUnCritere("Responsable", "Email", $_POST["ema"])->fetch()["Nom"];
					$_SESSION["email"] = $_POST["ema"];
					$_SESSION["responsable"] = true;
				header("Location:index.php");
			}
		}
		$error = "Mauvais login ou mot de passe";
	}
	
	include("../View/connexion.view.php");
?>