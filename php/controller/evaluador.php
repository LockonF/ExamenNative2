<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 23/03/14
 * Time: 16:26
 */
require "../model/Examen.php";
require "../model/Materia.php";


session_start();

$examen = $_SESSION["examen"];
$examen->cleanExamen();


$arr = json_decode($_POST['json'],true);
for($j=0;$j<count($arr);$j++)
{
    $examen->evaluatePregunta($arr[$j]["idPregunta"],$arr[$j]["opcSelec"]);
}
if($_POST['save'])
{
    $examen->submitToDB();
    echo "1";
}



?>