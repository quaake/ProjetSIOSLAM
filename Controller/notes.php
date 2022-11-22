<?php
	include("../Model/fonction.php");
	session_start();
	$title = "Gestion des notes";
	
	//redirection en cas d'attaque par url
	if(!isset($_SESSION["responsable"]) || !isset($_SESSION["email"])) {
		header("Location:index.php");
	}
	
	//obtention des notes de la personne concerné
	if(!$_SESSION["responsable"]) {
		$result1 = SelectUnCritere("note","IDAdherent",$_SESSION["email"]);
		$result = []; 
		while($a = $result1->fetch()) {
			$tmp = ["Etat"=>$a["Etat"],"Date"=>$a["Date"],"ID" => $a["ID"]];
			$result[] = $tmp;
		}
	}
	else {
		$result = SelectUnCritere("responsable","Email","");
	}
	
	//Clubs
	if(!$_SESSION["responsable"]) {
		$result3 = SelectUnCritere("sabonner","IDADHERENT",$_SESSION["email"]);
		$resultC = []; 
		while($line = $result3->fetch()) {
			$result2 = SelectUnCritere("club","ID",$line["IdClub"]);
			$a = $result2->fetch();
			$tmp = ["NumLicense"=>$line["Num"],"Label"=>$a["Label"],"ID" => $a["ID"]];
			$resultC[] = $tmp;
		}
	}
	else {
		$resultC = SelectUnCritere("responsable","Email","");
	}
	if(isset($_POST["addNote"]) && isset($_POST["ihatekevin"])) {
		echo 'oui';
		$mail = $_SESSION["email"];
		$tarif = 10;
		$nom = UpdateDelete("Select Nom FROM adherent WHERE Email = ".$_SESSION['email']);
		$addr = UpdateDelete("Select AdresseRue, AdresseCP, AdresseVille FROM adherent WHERE Email = ".$_SESSION['email']);
		$addrfull = $addr["AdresseRue"]." ".$addr["AdresseCP"]." ".$addr["AdresseVille"];
		$num = date('Y')."-".UpdateDelete("Select MAX(ID) from note")."1";
		$row = UpdateDelete("INSERT INTO note(IDAdherent, IDResponsable, KmTarif, IDClub, Adresse, Date, Etat, Lieu, NumRecu) VALUES ('$mail',$tarif,".$_POST['ihatekevin'].",'$addrfull','".date('Y-m-d')."','En Cours','".$addr['AdresseVille']."',$num)");
		$oui = $row->rowCount();
	}

	include("../View/notes.view.php");
	
?>