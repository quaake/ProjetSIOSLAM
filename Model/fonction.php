<?php
	//se connecte a la base de données
	function Connexion () { 
		$serveur="localhost";
	 	$nom="root";
 		$motpasse="root"; 
 		$base="bloc3act3poulin";
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

?>