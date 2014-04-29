<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 17/03/14
 * Time: 18:53
 */
require __DIR__ . "../../vendor/autoload.php";

class Materia
{

    private $preguntas;
    private $numPreguntas;
    private $correctas;
    private $incorrectas;
    private $justificaciones;
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
     * @param array $justificaciones
     */
    public function setJustificaciones($justificaciones)
    {
        $this->justificaciones = $justificaciones;
    }

    /**
     * @return array
     */
    public function getJustificaciones()
    {
        return $this->justificaciones;
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
     * @return array
     */
    public function getPreguntas()
    {
        return $this->preguntas;
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
        $this->justificaciones = array();
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
            /*
             * Obtenemos el numero de preguntas a partir de la materia
             */
            $numPreguntas=intval($this->getNumPreguntas());
            $criteriaMateria=intval($this->getIdMateria());

            /*
             * Realizamos el query a la base de Datos para seleccionar las preguntas
             */
            $query="SELECT P.idPregunta as idPregunta, P.Oracion as oracion, P.opc1 as opc1,P.opc2 as opc2,P.opc3 as opc3,P.opc4 as opc4,P.grafico as grafico from Pregunta P join Tema T on P.tema=T.idTema join Materia M on M.idMateria=T.idMateria
where M.idMateria=".$criteriaMateria." order by rand() limit ".$numPreguntas.";";
            $this->db->query($query);
            while($row=$this->db->fetch_assoc())
            {
                $this->preguntas[] = array("Materia"=>$this->idMateria,"idPregunta" => $row['idPregunta'], 'oracion' => $row['oracion'], "opc1" => $row['opc1'],
                    "opc2" => $row['opc2'], "opc3" => $row['opc3'], "opc4" => $row['opc4'],"grafico"=>$row['grafico']);
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