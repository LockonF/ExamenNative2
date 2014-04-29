<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 17/03/14
 * Time: 19:40
 */

require_once "../model/Materia.php";
require "../model/Examen.php";
session_start();

$idLookup = $_GET['idMateria'];
$examen = $_SESSION["examen"];

$activeTest = $_SESSION["active"];
if(!isset($activeTest))
{

    $examen->lookupMateria($idLookup)->genPreguntas();
    $materia=$examen->lookupMateria($idLookup);
    Materia::toJson($materia->getPreguntas());
    $_SESSION["numPasos"]++;
    if($_SESSION["numPasos"]==count($examen->getMaterias()))
    {
        $_SESSION["active"]=1;
        $_SESSION["examen"]=$examen;
    }
}
else
{
    $materia=$examen->lookupMateria($idLookup);
    Materia::toJson($materia->getPreguntas());
}


?>