<?php
	ob_start();
?>

<div class="center">
<form id="formcon" method="POST">
	<label>ID: </label>
	<input name="id" value="<?= $result["IDNote"] ?>" readonly/>
	<label>Signataire: </label>
	<input placeholder="le signataire (nom+prenom)" name="n" value="<?= $result["Signataire"] ?>" required/>
	<label>Adresse: </label>
	<input placeholder="l'adresse..." name="a" value="<?= $result["Adresse"] ?>" required/>
	<label>Date: </label>
	<input name="d" type="date" value="<?= $result["Date"] ?>" required/>
	<input type="submit" name="btn" value="Modifier"/>
</form>
<a class="error"><?= $error ?></a>
</div>
	
<?php
	$content=ob_get_clean();
	include("template.php");
?>