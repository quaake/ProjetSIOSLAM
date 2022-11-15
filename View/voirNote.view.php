<?php
	ob_start();
?>

<h2>Note 21</h2>
<p class = "split w50"><a>Signataire : Une personne</a><a>Pour : Une autre personne?</a></p>
<p class="tab">Tarif Kilométrique :</p>

<?php if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {?>
<form method="POST">
<?php } ?>
<table id="tableClub">
	<thead>
		<tr>
			<th>Date</th>
			<th>Trajet</th>
			<th>KM</th>
			<th>Motif</th>
			<th>Cout du Trajet</th>
			<th>Cout de Péage</th>
			<th>Cout Repas</th>
			<th>Cout Hébérgement</th>
			<th>Total</th>
		</tr>
	</thead>
		<tbody>
			<?php

				while($l=$res->fetch()) {
					echo "<td>".$l["Date"]."</td>";
					echo "<td>".$l["Trajet"]."</td>";
					echo "<td>".$l["Km"]."</td>";
					echo "<td>".$l["Libelle"]."</td>";
					echo "<td>".((double)$l["Km"]*(double)$l["KmTarif"])." €</td>";
					echo "<td>".$l["CoutPeage"]." €</td>";
					echo "<td>".$l["CoutRepas"]." €</td>";
					echo "<td>".$l["CoutHebergement"]." €</td>";
					echo "<td>".((double)$l["CoutHebergement"]+(double)$l["CoutRepas"]+(double)$l["CoutPeage"]+((double)$l["Km"]*(double)$l["KmTarif"]))." €</td>";
				}

				if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {
			?>
				<tr>
					<td><input type="date" required/></td>
					<td><input type="text" required/></td>
					<td><input type="number" required/></td>
					<td>
						<select>
							<?php
								while($line=$result->fetch()) {
									echo "<option value='".$line["ID"]."'>".$line["Libelle"]."</option>";
								}
							?>
						</select>
					</td>
					<td>0€</td>
					<td><input type="number" required/></td>
					<td><input type="number" required/></td>
					<td><input type="number" required/></td>
					<td>0€</td>
				</tr>
			<?php
				}
			?>
		</tbody>
</table>
<p class="right">Total:</p>

<?php 
	if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {
		echo '<div id="addClub">';
		echo '<input type="submit" name="confLigne" value="Confirmer l\'ajout"/>';
		echo '</div>';
	} else {
		echo '<form id="addClub" method="POST">';
		echo '<input type="submit" name="addLigne" value="Nouvelle ligne"/>';
		echo '</form>';
	}
	if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {?>
		</form>
	<?php } ?>

<h2>Justificatifs</h2>
<div id="justificatif">
	<div>
		
	</div>
	<form method="POST">
		<input type="file"/>
		<input type="submit" value="envoyer"/>
	</form>
</div>

<?php

	$content = ob_get_clean();
	include("template.php");

?>