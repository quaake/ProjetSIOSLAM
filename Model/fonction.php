<?php
	//se connecte a la base de donn�es
	function Connexion () { 
		$serveur="localhost";
	 	$nom="root";
 		$motpasse="root"; 
 		$base="bordereau";
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

	//se d�connecte de la base de donn�es
	function Deconnexion ($connect) {
		if ($connect)
			$connect = NULL;
	}

	function SelectUnCritere($table, $champ1, $critere1)
	{
		$connect=Connexion();

		$result=$connect->prepare("SELECT * FROM ".$table." WHERE ".$champ1." =:critere1");

		$result->execute(array(':critere1'=>$critere1));

		Deconnexion($connect);
		return $result;
	}

	function SelectClub($table, $id, $loguser)
	{
		$connect=Connexion();

    	$result=$connect->prepare("SELECT Label from club INNER JOIN ".$table." ON club.ID = ".$table.".IDClub WHERE ".$table.".".$id." = :loguser");

    	$result->execute(array(':loguser'=>$loguser));

    	Deconnexion($connect);
    	return $result;
	}

	function InsertBindParam($table, $Champ1, $Champ2, $Champ3, $Champ4, $Champ5, $Champ6,$Champ7, $Champ8,$Champ9) {
		$connect=Connexion();
		$result = $connect->prepare('INSERT INTO '.$table .' VALUE (:Champ1, :Champ2, :Champ3, :Champ4, :Champ5, :Champ6, :Champ7, :Champ8, :Champ9)');
		$result -> bindParam(':Champ1', $Champ1, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ2', $Champ2, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ3', $Champ3, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ4', $Champ4, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ5', $Champ5, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ6', $Champ6) ;
		$result -> bindParam(':Champ7', $Champ7, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ8', $Champ8, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ9', $Champ9, PDO ::PARAM_STR) ;
		$result -> execute();
		Deconnexion($connect);
		return $result;
	}
?>