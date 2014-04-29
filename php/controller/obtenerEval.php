<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 24/03/14
 * Time: 13:36
 */
require '../model/Examen.php';
require "../model/Materia.php";
session_start();
$examen = $_SESSION["examen"];
$flag = $_GET["flag"];

    $json2=$examen->getJustificaciones();
    if($examen->getPuntaje()==null)
    {
        $examen->setPuntaje(0);
    }
    if ($examen->getPuntaje()>=80)
    {
        $json = array("aciertos"=>$examen->getPuntaje(),"errores"=>($examen->getTotal()-$examen->getPuntaje()),"sugerencia"=>"Vas Bien","justificaciones"=>$json2);
    }
    elseif($examen->getPuntaje()<=60){
        $json = array("aciertos"=>$examen->getPuntaje(),"errores"=>($examen->getTotal()-$examen->getPuntaje()),"sugerencia"=>"Busca un asesor","justificaciones"=>$json2);
    }
    else{
        $json = array("aciertos"=>$examen->getPuntaje(),"errores"=>($examen->getTotal()-$examen->getPuntaje()),"sugerencia"=>"Debes Estudiar Mas","justificaciones"=>$json2);
    }



    unset($_SESSION["examen"]);
    unset($_SESSION["active"]);
    echo json_encode($json);

