<?php
	include("../Model/fonction.php");
	session_start();
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}

	$title = "Gestion des Notes";
	if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {
		$result = Select("motif");
	}
	if(isset($_POST["confLigne"]) && $_POST["confLigne"]) {
		$tab = [
			"IDMotif" => $_POST["L"],
			"IDNote" => $_SESSION["id"],
			"Date" => $_POST["D"],
			"Trajet" => $_POST["T"],
			"Km" => $_POST["K"],
			"CP" => $_POST["CP"],
			"CR" => $_POST["CR"],
			"CH" => $_POST["CH"]
		];
		if(!Insert($tab, "INSERT into lignenote(IDMotif,IDNote,Date,Trajet,Km,CoutPeage,CoutRepas,CoutHebergement) Values (:IDMotif,:IDNote,:Date,:Trajet,:Km,:CP,:CR,:CH)")) {
			$error = "Erreur lors de l'insertion";
		}
	}
	if(isset($_POST["id"])) {
		$_SESSION["id"] = $_POST["id"];
	}
	if(!isset($_SESSION["id"])) {
		header("Location:index.php");
	}

	if(isset($_POST["edit"])) {
		$edit = $_POST["edit-id"];
		$result = Select("motif");
	}
	if(isset($_POST["confedit"])) {
		UpdateDelete("Update lignenote set IDMotif=".$_POST["L"].",IDNote=".$_SESSION["id"].",Date='".$_POST["D"]."',Trajet='".$_POST["T"]."',Km=".$_POST["K"].",CoutPeage=".$_POST["CP"].",CoutRepas=".$_POST["CR"].",CoutHebergement=".$_POST["CH"]." where id=".$_POST["edit-id"]);
	}
	if(isset($_POST["trash"])) {
		$result = UpdateDelete("Delete from lignenote where id=".$_POST["trash-id"]);
	}
	
	$note = SelectUnCritere("note","IDNote",$_SESSION["id"])->fetch();
	$pour = SelectUnCritere("adherent","Email",$note["IDAdherent"])->fetch();
	$pour = $pour["Nom"]." ".$pour["Prenom"];
	$sign =$note["Signataire"] ;
	$prixKm = SelectUnCritere("Km","id",$note["KmTarif"])->fetch()["Tarif"];
	$res = SelectJoinCritere2("note", "lignenote" , "motif" , "IDNote" , "IDNote", "IDMotif" ,"IDMotif" , "note.IDAdherent", $_SESSION["email"],"note.IDNote",$_SESSION["id"]);
	$tot = 0;
	include("../View/voirNote.view.php");
?>