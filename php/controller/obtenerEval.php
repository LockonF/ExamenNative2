<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 24/03/14
 * Time: 13:36
 */
require '../model/Examen.php';
require "../model/Materia.php";
require '../model/Session.php';


$examen = Session::getExamenFromSession();

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


    /*
     * Reestablecemos las variables, el examen se va a nulo
     * la sesion activa se va a falso y el examen generado a falso
     */

    Session::unsetExam();
    Session::setExamenActive(false);
    Session::setExamenGenerated(false);

    echo json_encode($json);

