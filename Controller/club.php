<?php
	include("../Model/fonction.php");
	session_start();
	$title = "Gestion des clubs";

	//suppresion d'un club
	if(isset($_POST["sup"]) && $_POST["sup"]) {
		//code pour les responsable
		if($_SESSION["responsable"]) {

		} 
		//code pour les adherents
		else {
			UpdateDelete("Delete FROM sabonner where IdClub=".$_POST["id"]." and IDAdherent='".$_SESSION["email"]."'");
		}
	}

	//redirection en cas d'attaque par url
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}

	//obtention des club de la personne concerné
	if(!$_SESSION["responsable"]) {
		$result3 = SelectUnCritere("sabonner","IDADHERENT",$_SESSION["email"]);
		$result = []; 
		while($line = $result3->fetch()) {
			$result2 = SelectUnCritere("club","ID",$line["IdClub"]);
			$a = $result2->fetch();
			$tmp = ["NumLicense"=>$line["Num"],"Label"=>$a["Label"],"ID" => $a["ID"]];
			$result[] = $tmp;
		}
	}
	else {
		$result = SelectUnCritere("responsable","Email","");
	}

	//Redirection vers la page pour ajouter un club
	if(isset($_POST["addClub"]) && $_POST["addClub"]) {
		header("Location:clubAdd.php");
	}



	include("../View/club.view.php");
?>