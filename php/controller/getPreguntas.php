<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 17/03/14
 * Time: 19:40
 */

require_once "../model/Materia.php";
require "../model/Examen.php";
require_once "../model/Session.php";



$idLookup = $_GET['idMateria'];
$examen = Session::getExamenFromSession();

/*
 * Su nuestro examen aun no se ha generado procedemos
 * a hacer todo el desastre
 */

if(!Session::isExamenGenerated())
{

    $examen->lookupMateria($idLookup)->genPreguntas();
    $materia=$examen->lookupMateria($idLookup);
    Materia::toJson($materia->getPreguntas());
    $_SESSION["numPasos"]++;

    /*
     *Hacemos los pasos de la generacion del examen y lo ponemos como generado
     */

    if($_SESSION["numPasos"]==count($examen->getMaterias()))
    {
        $_SESSION["examen"]=$examen;
        Session::setExamenGenerated(true);
    }
}
else
{
    $materia=$examen->lookupMateria($idLookup);
    Materia::toJson($materia->getPreguntas());
}


?>