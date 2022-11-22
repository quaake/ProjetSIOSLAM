<?php
	ob_start();
?>

<script>function verif() {return confirm('Cela va supprimer le club de maniére irreversible etes vous sûre?');}</script>
<table id="tableClub">
	<thead>
		<tr>
			<th>Nom du club</th>
			<th>Numéro de license</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<?php
			if(isset($result)) {
			for($i=0;$i<sizeof($result);$i++) { 
				echo "<tr>";
				echo "<td>".$result[$i]["Label"]."</td>";
				echo "<td>".$result[$i]["NumLicense"]."</td>";
				echo "<td><form method='POST'><input name='id' value='".$a["ID"]."' readonly/><input type='submit' name='sup' onclick='return verif()' value='supprimer'/></form></td>";
				echo "</tr>";
			}
			}
			?>
	</tbody>
</table>
<form id="addClub" method="POST">
	<input type="submit" name="addClub" value="Ajouter un club"/>
</form>

<?php
	$content=ob_get_clean();
	include("template.php");
?>