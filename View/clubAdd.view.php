<?php
	ob_start();
?>

<div class="center">
<form id="formcon" method="POST">
	<label>Nom du club</label>
	<select name="club">
			<?php
				while($line = $result->fetch()) {
					echo "<option value='".$line["ID"]."'>".$line["Label"]."</option>";
				}
			?>
	</select>
	<label>Numero de license</label>
	<input placeholder="le numero..." name="num" required/>
	<input type="submit" name="btn" value="Ajouter"/>
</form>
<a class="error"><?= $error ?></a>
</div>
	
<?php
	$content=ob_get_clean();
	include("template.php");
?>