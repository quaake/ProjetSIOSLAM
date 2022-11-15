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

	$id = 2;
	if(isset($id)) {
		$_SESSION["id"] = $id;
	}
	$res = SelectJoinCritere2("note", "lignenote" , "motif" , "ID" , "IDNote", "IDMotif" ,"ID" , "note.IDAdherent", $_SESSION["email"],"note.ID",$_SESSION["id"]);

	include("../View/voirNote.view.php");
?>