<?php
	ob_start();
?>

	<table id="tableClub">
	<thead>
		<tr>
			<th>Nom de Note</th>
			<th>Etat</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
		<tbody>
		<?php
			if(isset($result)) {
			for($i=0;$i<sizeof($result);$i++) { 
				echo "<tr>";
				echo "<td>".$result[$i]["Date"]."</td>";
				echo "<td>".$result[$i]["Etat"]."</td>";
				echo "<td><form action='voirNote.php' method='POST'><input name='id' value='".$result[$i]["ID"]."' readonly class='hide'/><input type='submit' name='sup' value='Consulter'/></form></td>";
				echo "<td><form action='editNote.php' method='POST'><input type='text' value='".$result[$i]["ID"]."' readonly name='id' class='hide'/><input type='submit' name='edit' value='&#10000;'/></form></td>";
				echo "</tr>";
			}
			}
		?>
		</tbody>
	</table>
	<div class="split">
	<select form="addClub" name="ihatekevin" id="ihatekevin">
	<?php
	for($i=0;$i<sizeof($resultC);$i++) { 
		echo "<option value=".$resultC[$i]["ID"]." selected>".$resultC[$i]["Label"]."</option>";
	}
	?>
	</select>
	<form id="addClub" method="POST">
		<input type="submit" name="addNote" id="addNote" value="Ajouter une Note"/>
	</form>
	</div>
<?php
	$content=ob_get_clean();
	include("template.php");
?>