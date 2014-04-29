<?PHP
require '../model/Materia.php';
require '../model/Examen.php';
session_start();

unset($_SESSION['examen']);
$_SESSION['active']=0;


/*
 * Si no tenemos sesión de examen, entonces generamos un nuevo examen
 */
if(!(isset($_SESSION['examen'])))
{
    $_SESSION["numPasos"]=0;
    $lista=Materia::listMaterias();

    $listaMatExamen=array();

    $examen = new Examen();
    $examen->setidExamen();

    for($i=0;$i<count($lista);$i++)
    {
        $listaMatExamen[$i]=new Materia($lista[$i]['id']);
    }
    $examen->setMaterias($listaMatExamen);
    $examen->setListaJson($lista);
    $_SESSION['examen']=$examen;
    $_SESSION["active"]=null;
    Materia::toJson($lista);
}
else{

    $examen = $_SESSION["examen"];
    Materia::toJson($examen->getListaJson());

}






?>