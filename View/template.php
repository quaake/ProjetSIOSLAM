<!DOCTYPE html>

<?php $title = "Accueil"; ?>

<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <style>
            * {padding:0;margin:0}
            body {display:flex;width:100vw;height:100vh;background-color:#EEE;}
            header {width: 20%;background-color:black;position:relative;min-width:300px;}
            header > h1 {
                color:orange;
                width:80%;
                height:15vh;
                text-align:center;
                padding:10%;
            }
            header > a:last-child {
                color:white;
                height:auto;
                position:absolute;
                font-size:15px;
                bottom:0;
                height:7%;
            }
            header > a {
                color:white;
                width:100%;
                height:7%;
                display:flex;
                justify-content:center;
                align-items:center;
                text-decoration:none;
            }
            header > a:hover {
                background-color:#FFFFFF30;
            }
        </style>
    </head>
    <body>
        <header>
            <h1><?php echo $title; ?></h1>
            <a href="">Page 1</a>
            <a href="">Page 2</a>
            <a href="">Page 3</a>
            <a href="">Page ...</a>
            
            <a href="">Connexion</a>
        </header>
        <footer>

        </footer>
    </body>
</html>