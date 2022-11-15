<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
	    <title><?= $title ?></title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1><a href="index.php">Accueil</a></h1>


                <a href="profil.php">Profil</a>
                <a href="club.php">Gestion des clubs</a>
                <a href="notes.php">Gestion des Notes</a>
   
            <a href="connexion.php">Connexion</a>
        </header>
        <footer>
		    <h1 class="title"><?= $title ?></h1>
            <div class="content">
                <?php if(isset($content)) echo $content;
                
                else echo "pas de contenu";
                ?>
            </div>
        </footer>
    </body>
</html>