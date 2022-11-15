<!DOCTYPE html>
  <?php if(session_id() == ''){
      session_start();
   } ?>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
	    <title><?= $title ?></title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1><a href="index.php">Accueil</a></h1>

            <?php if(isset($_SESSION["login"])) { ?>
                <a href="profil.php">Profil</a>
                <a href="club.php">Gestion des clubs</a>
                <a href="notes.php">Gestion des Notes</a>
            <?php } ?>
            <a href="<?= isset($_SESSION["login"]) ?"logout.php" : "connexion.php" ?>"><?= isset($_SESSION["login"])?$_SESSION["login"]:"Connexion"?></a>
        </header>
        <footer>
		    <h1 class="title"><?= $title ?></h1>
            <div class="content">
                <?php if(isset($content)) echo $content; ?>
            </div>
        </footer>
    </body>
</html>