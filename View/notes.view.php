<?php
	ob_start();
?>

	<table>
		<tbody>
		<tr>
			<th>Nom de Note</th>
			<th>Etat</th>
			<th></th>
		</tr>
		<?php
			if(isset($result)) {
			for($i=0;$i<sizeof($result);$i++) { 
				echo "<tr>";
				echo "<td>".$result[$i]["Date"]."</td>";
				echo "<td>".$result[$i]["Etat"]."</td>";
				echo "<td><form method='POST'><input name='id' value='".$a["ID"]."' readonly/><input type='submit' name='sup' value='Consulter'/></form></td>";
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