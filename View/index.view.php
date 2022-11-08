<?php
	ob_start();
?>
	
	<div class="center"><h1>Bienvenue dans l’application Bordereau</h1></div>
<?php
	$content=ob_get_clean();
	include("template.php");
?>