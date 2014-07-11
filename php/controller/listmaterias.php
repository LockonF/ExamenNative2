<?PHP
require_once '../model/Materia.php';
require_once '../model/Examen.php';
require_once '../model/Session.php';

if(!Session::isExamenActive())
{
    Session::unsetExam();
}

/*
 * Si no tenemos sesión de examen, entonces generamos un nuevo examen
 */
if(!Session::isExamenSet())
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
    Session::setExamenToSession($examen);


    /*
     * Al momento de generar las materias ponemos un examen activo pero que todavia no se ha acabado
     * de generar
    */
    Session::setExamenActive(true);
    Session::setExamenGenerated(false);
    Materia::toJson($lista);
}
else{
    $examen = Session::getExamenFromSession();
    Materia::toJson($examen->getListaJson());

}






?>