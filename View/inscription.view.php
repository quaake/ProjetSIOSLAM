<?php 
	ob_start();
?>

            <div class = "center">
                <form action="" method="POST" id="formcon">
                
                    <label for="name">Email: </label>
                    <input type="email" placeholder="Email" id="Email" name="Email" required/>
                
                    <label for="email">Mot de passe: </label>
                    <input type="password" placeholder="Mot de passe" id="Mot-de-passe" name="mdp" required/>

                    <label for="email">Confirmer: </label>
                    <input type="password" placeholder="Confirmation Du Mot de passe" name="mdpConf" id="Mot-de-passe" required/>

                    <label for="email">Nom: </label>
                    <input type="text" placeholder="Nom" id="Nom" name="Nom" required/>

                    <label for="email">Prenom: </label>
                    <input type="text" placeholder="prenom" id="prenom" name="prenom" required/>

                    <label for="email">Date de Naissance: </label>
                    <input type="date" placeholder="Date" id="Date" name="Date" required/>

                    <label for="email">Adresse:</label>
                    <input type="text" placeholder="adresse" id="adresse" name="adresse" required/>
                    
                    <label for="email">Code Postal: </label>
                    <input type="text" placeholder="cp" id="cp" name="cp" required/>

                    <label for="email">Ville: </label>
                    <input type="text" placeholder="ville" id="ville" name="ville" required/>

                    <button type="submit" value="Valider" name="btnValid">S'inscrire!</button>
                
            </form>
<?php
	$content=ob_get_clean();
	include("template.php");
?>