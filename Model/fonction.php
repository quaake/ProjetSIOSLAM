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
?>