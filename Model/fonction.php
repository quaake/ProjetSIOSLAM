<?php
	//se connecte a la base de données
	function Connexion () { 
		$serveur="localhost";
	 	$nom="root";
 		$motpasse="root"; 
 		$base="projet_bordereau";
 		try
 		{
			$connect = new PDO("mysql:host=".$serveur.";dbname=".$base, $nom, $motpasse);
 		}
 		catch(PDOException $e)
 		{
			echo "Impossible de se connecter!".$e->getMessage();
 		}
 		return $connect;
	}

	//se déconnecte de la base de données
	function Deconnexion ($connect) {
		if ($connect)
			$connect = NULL;
	}

		function SelectUnCritere($table, $champ1, $critere1) {
		$connect=Connexion(); 
 		$result=$connect ->prepare("select * from ".$table." where ".$champ1." = :critere1") ;
 		$result -> execute(array(':critere1'=>$critere1)); 
		Deconnexion($connect);
 		return $result;}

?>