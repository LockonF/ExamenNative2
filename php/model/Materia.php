<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 17/03/14
 * Time: 18:53
 */
require __DIR__ . "../../vendor/autoload.php";
require "Pregunta.php";
class Materia
{

    private $preguntas;
    private $numPreguntas;
    private $correctas;
    private $incorrectas;
    private $nombre;
    private $db;
    private $idMateria;

    /**
     * @param int $correctas
     */
    public function setCorrectas($correctas)
    {
        $this->correctas = $correctas;
    }

    /**
     * @return int
     */
    public function getCorrectas()
    {
        return $this->correctas;
    }

    /**
     * @param int $incorrectas
     */
    public function setIncorrectas($incorrectas)
    {
        $this->incorrectas = $incorrectas;
    }

    /**
     * @return int
     */
    public function getIncorrectas()
    {
        return $this->incorrectas;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param mixed $numPreguntas
     */
    public function setNumPreguntas($numPreguntas)
    {
        $this->numPreguntas = $numPreguntas;
    }

    /**
     * @return mixed
     */
    public function getNumPreguntas()
    {
        return $this->numPreguntas;
    }

    /**
     * @return Pregunta []
     */
    public function getPreguntas()
    {
        return $this->preguntas;
    }

    /**
     * @return array
     */
    public function getPreguntasJSON()
    {
        $json = array();
        foreach($this->getPreguntas() as $pregunta)
        {
            $json[]=array("Materia"=>$this->idMateria,"idPregunta" => $pregunta->getIdPregunta(), 'oracion' => $pregunta->getOracion(), "opc1" => $pregunta->getOpc1(),
                "opc2" => $pregunta->getOpc2(), "opc3" => $pregunta->getOpc3(), "opc4" => $pregunta->getOpc4(),"grafico"=>$pregunta->getGrafico());
        }
        return json_encode($json);
    }


    /**
     * @return mixed
     */
    public function getIdMateria()
    {
        return $this->idMateria;
    }

    function __construct($id)
    {
        $this->db = new Zebra_DB();
        $this->db=$this->db->getDBObject();
        $this->idMateria = $id;
        $this->setNumPreguntas($this->db->dlookup("numPregunta","Materia","idMateria=".$this->idMateria));
        $this->setNombre($this->db->dlookup("nombre","Materia","idMateria=".$this->idMateria));

        $this->preguntas = array();
        $this->correctas = 0;
        $this->incorrectas = 0;
    }

    function __destruct()
    {
     $this->db->close();
    }

    private function initializeDB()
    {
        $this->db = new Zebra_DB();
        $this->db=$this->db->getDBObject();
    }

    /*
     * Metodo para generar las preguntas
     */
    public function genPreguntas()
    {

        if(isset($this->idMateria))
        {
        try {
            $this->initializeDB();
            $this->preguntas=null;
            $this->preguntas=array();

            /*
             * Obtenemos el numero de preguntas a partir de la materia
             */
            $numPreguntas=intval($this->getNumPreguntas());
            $criteriaMateria=intval($this->getIdMateria());

            /*
             * Realizamos el query a la base de Datos para seleccionar las preguntas
             */
            $query="SELECT P.idPregunta as idPregunta, P.Oracion as oracion, P.opc1 as opc1,P.opc2 as opc2,P.opc3 as opc3,P.opc4 as opc4, P.opcc as opcc,P.grafico as grafico,P.just as just from pregunta P join Tema T on P.tema=T.idTema join Materia M on M.idMateria=T.idMateria
where M.idMateria=".$criteriaMateria." order by rand() limit ".$numPreguntas.";";
            $this->db->query($query);
            while($row=$this->db->fetch_assoc())
            {
                $this->preguntas[] = Pregunta::constructWithParameters($row["idPregunta"],$row["oracion"],$row["opc1"],$row["opc2"],$row["opc3"],$row["opc4"],$row["opcc"],$row["just"],$row["grafico"]);

            }

            return true;

        } catch (Exception $e) {
            return false;
        }
        }
        else return null;
    }

    public static function listMaterias()
    {
        /*Query para el SQL*/
        $db = new Zebra_DB();
        $db=$db->getDBObject();
        $db->select('idMateria,nombre','Materia');
        $json=array();


        /*Generamos un arreglo de arreglos asociativos, que se transformaran en objetos
        cuando lo pasemos a JSON*/
        while ($row = $db->fetch_assoc()) {

            $json[]=array("id"=>$row['idMateria'],"nombre"=>$row['nombre']);
        }
        $db->close();
        return $json;
    }

    /*
     * Esta funcion espera un array de 2 parámetros
     * el primero es el id de la pregunta y el segundo
     * es la opción seleccionada desde la BD
     */


    public static function toJson($param)
    {
        echo json_encode($param);
    }
}

?>