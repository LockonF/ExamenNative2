<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 23/03/14
 * Time: 09:53
 */
require __DIR__ . "../../vendor/autoload.php";
require_once "Zebra_DB.php";

class Examen{


    //Objetos tipo materia
    private $materias;

    //Objeto de la BD
    private $db;
    private $listaJson;
    private $justificacionesExamen= array();

    //Enteros
    private $idExamen;
    private $puntaje=0;
    private $total=120;

    function __construct()
    {
        $this->db = new Zebra_DB();
        $this->db=$this->db->getDBObject();
    }
    function __destruct()
    {
        $this->db->close();
    }

    /**
     * @return int
     */
    public function getTotal()
    {
        return $this->total;
    }



    /**
     * @param mixed $listaJson
     */
    public function setListaJson($listaJson)
    {
        $this->listaJson = $listaJson;
    }

    /**
     * @return mixed
     */
    public function getListaJson()
    {
        return $this->listaJson;
    }


    public function setMaterias($materias)
    {
        $this->materias = $materias;
    }

    /**
     * @return mixed
     */
    public function getMaterias()
    {
        return $this->materias;
    }

    /*
     * Setter del id Del examen,
     * saca el id de la BD
     */

    public function setidExamen()
    {
        $this->db->query("SELECT MAX(idExamen) as maxID from examen;");
        $row = $this->db->fetch_assoc();
        $datetime = new DateTime();
        if(isset($row["maxID"]))
        {

            $this->idExamen=($row["maxID"]+1);
        }
        else
        {
            $this->idExamen=1;
        }
        $timestamp = $datetime->format('Y\-m\-d\ ');
        $this->db->insert("Examen",
            array(
                "idExamen"=>$this->idExamen,
                "idUser"=>$_SESSION["username"],
                "puntaje"=>0,
                "tipo"=>0,
                "fecha"=>$timestamp
            ));
        $this->db->close();
    }

    /**
     * @param int
     * @return Materia
     */

    public  function lookupMateria($idMat)
    {
        for($i=0;$i<count($this->materias);$i++)
        {
            if($this->materias[$i]->getidMateria()==$idMat)
                return $this->materias[$i];
        }
        return null;
    }

    /*
     *
     */


    public function evaluatePregunta($idPreg,$opc)
    {
        $idPreg=intval(str_replace("p","",$idPreg));
        $opc= intval(str_replace("opc","",$opc));

        $db = new Zebra_DB();
        $db=$db->getDBObject();
        $db->query("SELECT P.oracion as oracion ,P.opcc as opcc ,P.just as just,M.idMateria as idMateria from Pregunta P join Tema T on P.tema= T.idTema join Materia M on T.idMateria = M.idMateria where P.idPregunta=?;",array($idPreg));
        $row= $db->fetch_assoc();

        $materia=$this->lookupMateria($row["idMateria"]);
        if($row["opcc"]==$opc)
        {
            $materia->setCorrectas($materia->getCorrectas()+1);
        }
        else{
            $materia->setIncorrectas($materia->getIncorrectas()+1);

            $opcc= $db->dlookup("opc".$row["opcc"],"pregunta","idPregunta=?",array($idPreg));
            $this->justificacionesExamen[] = array("id"=>$idPreg,"opcc"=>$opcc,"oracion"=>$row["oracion"],"just"=>$row["just"]);
        }
    }

    /**
     * @return array(mixed);
     */

    public function getJustificaciones(){
        return $this->justificacionesExamen;
    }

    /**
     * @return void
     */

    public function cleanExamen()
    {
        $this->puntaje=0;
        for($i=0;$i<count($this->getMaterias());$i++)
        {
            $this->getMaterias()[$i]->setCorrectas(0);
            $this->getMaterias()[$i]->setIncorrectas(0);
            $this->justificacionesExamen= null;

        }
    }

    /**
     * @return int
     */
    private  function totalScore()
    {
        for($i=0;$i<count($this->getMaterias());$i++)
        {
            $this->puntaje=$this->puntaje+$this->getMaterias()[$i]->getCorrectas();
        }
        return $this->puntaje;

    }

    /**
     * @return int
     */

    public function getPuntaje()
    {
        return $this->puntaje;
    }

    /**
     * @param int
     */

    public function setPuntaje($puntaje)
    {
        $this->puntaje=$puntaje;
    }


    /*
     *
     */
    public function submitToDB()
    {
        $score = $this->totalScore();
        $db = new Zebra_DB();
        $db=$db->getDBObject();
        if($db->update("examen",array(
            "puntaje"=>$score),"idExamen=?",array($this->idExamen)));
        {
            for($i=0;$i<count($this->getMaterias());$i++)
            {
                $mat=intval($this->getMaterias()[$i]->getIdMateria());
                $correctas=$this->getMaterias()[$i]->getCorrectas();
                $db->insert("Examen_resultado",
                array("idExamen"=>$this->idExamen,
                      "materia"=>$mat,
                      "puntaje"=>$correctas
                ));
            }
            return true;

        }

        return false;
    }

}



?>