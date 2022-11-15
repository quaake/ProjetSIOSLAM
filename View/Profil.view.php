<?php
	$d = $result->fetch();
	ob_start();
?>

	<div class="info">
		<h1>Mes informations :</h1>
		<table>

			<tr>
				<td>email :</td>
				<td> <?php echo $d['Email']; ?> </td>
			</tr>

			<tr>
				<td>Nom :</td>
				<td class="scndelem"> <?php echo $d['Nom']; ?> </td>
			</tr>

			<tr>
				<td>Prenom :</td>
				<td class="scndelem"> <?php echo $d['Prenom']; ?> </td>
			</tr>

			<tr>
				<td>Date de naissance :</td>
				<td class="scndelem"> <?php echo $d['DateNaissance']; ?> </td>
			</tr>
		</table>

		<table>
			<tr>
				<td>Adresse :</td>
				<td> <?php echo $d['AdresseRue'].", ".$d['AdresseVille'].", ".$d['AdresseCP']; ?> </td>
			</tr>

			<tr>
				<td>Club :</td>
				<td class="scndelem">
					<?php 
						while($c = $club->fetch())
						{
							echo "<li>".$c['Label']."</li>";
						}
					?>
				</td>
			</tr>
		</table>

		<hr>

		<table>
			<tr>
				<td>Enfant à charge :</td>
				<td> ? </td>
			</tr>
		</table>
	</div>


<?php

	$content = ob_get_clean();
	include("template.php");

?>