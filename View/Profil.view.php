<?php
	$d = $result->fetch();
	ob_start();
?>
<html>

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
		
		<?php if($_SESSION['responsable'] ==  true){?>
		<table>
			<tr>
				<td>Enfant à charge :</td>
				<td class="scndelem">
				<ul>
				<?php 
						while($e = $enfant->fetch())
						{
							echo "<hr>";
							echo "<li>".$e['Nom']." ".$e['Prenom']."</li>";
							$clubenfant = SelectClub("sabonner", "IDAdherent", $e['Email']);
							echo "<ul><li>";
							while($ce = $clubenfant->fetch())
							{
								echo $ce['Label']." | ";
							}
							echo "</li></ul>";
						}
					?>
				</ul>
				</td>
			</tr>
		</table>
		<?php } ?>
	</div>

</html>

<?php

	$content = ob_get_clean();
	include("template.php");

?>