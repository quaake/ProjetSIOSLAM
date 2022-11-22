<?php
	function Connexion ( ) { 
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
 		return $connect;}
	function Deconnexion ($connect) {
		if ($connect)
			$connect = NULL;}

	function Select($table) {
		$connect=Connexion();
 		$result = $connect -> query("select * from " . $table);
		Deconnexion($connect);
		return $result;}
	function SelectUnCritere($table, $champ1, $critere1) {
		$connect=Connexion(); 
 		$result=$connect ->prepare("select * from ".$table." where ".$champ1." = :critere1") ;
 		$result -> execute(array(':critere1'=>$critere1)); 
		Deconnexion($connect);
 		return $result;}
	function SelectCritere($table, $champ1, $critere1, $champ2, $critere2) {
		$connect=Connexion(); 
 		$result=$connect ->prepare("select * from ".$table." where ".$champ1." = :critere1 AND ".$champ2." = :critere2") ;
 		$result -> execute(array(':critere1'=>$critere1,':critere2'=>$critere2)); 
		Deconnexion($connect);
 		return $result;}

	function UpdateDelete($query) {
		$connect=Connexion();
		$result = $connect->prepare($query);
		$result = $result->execute();
		Deconnexion($connect);
		return $result;}
	
	function Insert($tableau, $query) {
		$connect=Connexion();
		$result = $connect->prepare($query);
		$result = $result->execute($tableau);
		Deconnexion($connect);
		return $result;}
	function InsertBindParam($table, $Champ1, $Champ2, $Champ3, $Champ4, $Champ5, $Champ6,$Champ7, $Champ8,$Champ9, $Champ10) {
		$connect=Connexion();
		$result = $connect->prepare('INSERT INTO '.$table .' VALUE (:Champ1, :Champ2, :Champ3, :Champ4, :Champ5, :Champ6, :Champ7, :Champ8, :Champ9, :Champ10)');
		$result -> bindParam(':Champ1', $Champ1, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ2', $Champ2, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ3', $Champ3, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ4', $Champ4, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ5', $Champ5, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ6', $Champ6) ;
		$result -> bindParam(':Champ7', $Champ7, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ8', $Champ8, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ9', $Champ9, PDO ::PARAM_STR) ;
		$result -> bindParam(':Champ10', $Champ10, PDO ::PARAM_STR) ;
		$result -> execute();
		Deconnexion($connect);
		return $result;}
	function InsertBindValue() {
		$connect=Connexion();
		$result = $connect->prepare('INSERT INTO adherents (email, mdp) VALUE (:email, :mdp)');
		$result -> bindValue(':email', date("h:i:s")."@test.fr", PDO ::PARAM_STR) ;
		$result -> bindValue(':mdp', "123", PDO ::PARAM_STR) ;
		$result -> execute();
		Deconnexion($connect);
		return $result;}
	
	function TestTransaction()  {
		$connect=Connexion();
		try
		{ 
			$connect -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$connect -> beginTransaction(); 
			$connect -> exec('Insert into adherents(email,mdp) Values("a@Email.com","123")'); 
			$connect -> exec('Insert into adherents(email,mdp) Values("a@Email.com","123")'); 
			$connect -> commit(); 
			echo "Tout s'est bien déroulé"; 
		} 
		catch(Exception $e) 
		{ 
			$connect -> rollBack(); 
			echo "Une erreur a empecher l'insertion";
		} }

	function SelectJoinCritere($table, $table2 , $table3 , $champ1 , $champ2, $champ3 ,$champ4 , $critere1, $result1)
	{
		$connect=Connexion();
		$result=$connect->prepare("SELECT * from $table INNER JOIN $table2 ON $table.$champ1 = $table2.$champ2 INNER JOIN $table3 ON $table2.$champ3 = $table3.$champ4 WHERE $critere1 = :loguser");

    	$result->execute(array(':loguser'=>$result1));

    	Deconnexion($connect);
    	return $result;
	}
	function SelectJoinCritere2($table, $table2 , $table3 , $champ1 , $champ2, $champ3 ,$champ4 , $critere1, $result1,$critere2,$result2)
	{
		$connect=Connexion();
		$result=$connect->prepare("SELECT * from $table INNER JOIN $table2 ON $table.$champ1 = $table2.$champ2 INNER JOIN $table3 ON $table2.$champ3 = $table3.$champ4 WHERE $critere1 = :loguser AND $critere2=:log");
		$result->execute(array(':loguser'=>$result1,':log'=>$result2));

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