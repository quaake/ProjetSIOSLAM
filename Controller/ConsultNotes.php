<?php
    include("../Model/fonction.php");
    include("../View/ConsultNotesView.php");
    if (isset($_POST['email']) && isset($_POST['mdp']))
{
    //Requêtes
    $result = SelectCritere("liste_licencies","email",$_POST["email"],"MotDePasse",$_POST["mdp"]);
    if ($result->rowCount() == 1)
    {
        //Affectation de l'email dans la session et redirection vers une autre page
        $_SESSION['Mail'] = $_POST['email'];
        header ("Location:PageConReussi.php");

    }
    // Sinon, message d'erreur
    else 
    {
        echo "Login Incorrect";
    }
}
?>