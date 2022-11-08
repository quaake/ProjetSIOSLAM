<?php
	ob_start();
?>
	<div class="center">
	<form method="POST" id="formcon">
		<label for="mail">Identifiant:</label>
		<input id="mail" name="ema" type="email" placeholder="Email..." required/>
		<label for="pwd">Mot de passe:</label>
		<input id="pwd" name="pwd" type="password" placeholder="Mot de passe..." required/>
		<button name="btn" action="submit">Connexion</button>
	</form>
	<a class="linkIns" href="inscription.php">Pas de compte ? créer en un.</a>
	<a class="error"><?= $error ?></a>
	</div>
<?php
	$content=ob_get_clean();
	include("template.php");
?>