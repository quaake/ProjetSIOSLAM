<?php
	ob_start();
?>

<h2>Note <?= htmlentities($_SESSION["id"]) ?></h2>
<p class = "split w50"><a>Signataire : <?= $sign ?></a><a>Pour : <?= $pour ?></a></p>
<p class="tab">Tarif Kilométrique :<?=$prixKm?>€</p>

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
			<th></th>
			<th></th>
		</tr>
	</thead>
		<tbody>
			<?php

				while($l=$res->fetch()) {
					if(isset($edit) && $edit==$l["ID"]) {
					?>
						
					<tr>
						<td><input form="motif" type="date" name="D" required value="<?=$l["Date"]?>"/></td>
						<td><input form="motif" type="text" name="T" required value="<?=$l["Trajet"]?>"/></td>
						<td><input form="motif" type="number" name="K" required value="<?=$l["Km"]?>"/></td>
						<td>
							<select form="motif" name="L">
								<?php
									while($line=$result->fetch()) {
										if($l["IDMotif"]==$line["IDMotif"])
										echo "<option value='".$line["IDMotif"]."' selected>".$line["Libelle"]."</option>";
										else
										echo "<option value='".$line["IDMotif"]."'>".$line["Libelle"]."</option>";
									}
								?>
							</select>
						</td>
						<td>0€</td>
						<td><input form="motif" type="number" name="CP" required value="<?=$l["CoutPeage"]?>"/></td>
						<td><input form="motif" type="number" name="CR" required value="<?=$l["CoutRepas"]?>"/></td>
						<td><input form="motif" type="number" name="CH" required value="<?=$l["CoutHebergement"]?>"/></td>
						<td>0€</td>
						<td><form method='POST' id="motif"><input type='text' value='<?=$l["ID"]?>' readonly name='edit-id' class='hide'/><input type='submit' name='confedit' value='&#10003;'/></form></td>
						<td><form method='POST'><input type='text' value='<?=$l["ID"]?>' readonly name='trash-id' class='hide'/><input type='submit' name='trash' value='&#128465;'/></form></td>
					</tr>

						<?php
					}
					else {
						echo "<tr>";
						echo "<td>".$l["Date"]."</td>";
						echo "<td>".$l["Trajet"]."</td>";
						echo "<td>".$l["Km"]."</td>";
						echo "<td>".$l["Libelle"]."</td>";
						echo "<td>".((double)$l["Km"]*(double)$prixKm)." €</td>";
						echo "<td>".$l["CoutPeage"]." €</td>";
						echo "<td>".$l["CoutRepas"]." €</td>";
						echo "<td>".$l["CoutHebergement"]." €</td>";
						$a = ((double)$l["CoutHebergement"]+(double)$l["CoutRepas"]+(double)$l["CoutPeage"]+((double)$l["Km"]*(double)$l["KmTarif"]));
						echo "<td>".$a." €</td>";
						echo "<td><form method='POST'><input type='text' value='".$l["ID"]."' readonly name='edit-id' class='hide'/><input type='submit' name='edit' value='&#10000;'/></form></td>";
						$tot = $tot + $a;
						echo "</tr>";
					}
				}

				if(isset($_POST["addLigne"]) && $_POST["addLigne"]) {
			?>
				<tr>
					<td><input type="date" name="D" required/></td>
					<td><input type="text" name="T" required/></td>
					<td><input type="number" name="K" required/></td>
					<td>
						<select name="L">
							<?php
								while($line=$result->fetch()) {
									echo "<option value='".$line["IDMotif"]."'>".$line["Libelle"]."</option>";
								}
							?>
						</select>
					</td>
					<td>0€</td>
					<td><input type="number" name="CP" required/></td>
					<td><input type="number" name="CR" required/></td>
					<td><input type="number" name="CH" required/></td>
					<td>0€</td>
					<td></td>
				</tr>
			<?php
				}
			?>
		</tbody>
</table>
<p class="right">Total:<?=$tot?>€</p>

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