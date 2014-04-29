<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 23/04/14
 * Time: 13:22
 */
require __DIR__ . "../../vendor/autoload.php";
require_once "Zebra_DB.php";


class Usuario_Datos {
    private $idUser;
    private $nombre;
    private $apellidop;
    private $apellidom;
    private $fechanac;
    private $fechareg;
    private $fechasusc;
    private $escuela;
    private $email;

    /**
     * @param mixed $apellidop
     */
    public function setApellidop($apellidop)
    {
        $this->apellidop = $apellidop;
    }

    /**
     * @return mixed
     */
    public function getApellidop()
    {
        return $this->apellidop;
    }

    /**
     * @param mixed $apellidom
     */
    public function setApellidom($apellidom)
    {
        $this->apellidom = $apellidom;
    }

    /**
     * @return mixed
     */
    public function getApellidom()
    {
        return $this->apellidom;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $escuela
     */
    public function setEscuela($escuela)
    {
        $this->escuela = $escuela;
    }

    /**
     * @return mixed
     */
    public function getEscuela()
    {
        return $this->escuela;
    }

    /**
     * @param mixed $fechanac
     */
    public function setFechanac($fechanac)
    {
        $this->fechanac = $fechanac;
    }

    /**
     * @return mixed
     */
    public function getFechanac()
    {
        return $this->fechanac;
    }

    /**
     * @param mixed $fechareg
     */
    public function setFechareg($fechareg)
    {
        $this->fechareg = $fechareg;
    }

    /**
     * @return mixed
     */
    public function getFechareg()
    {
        return $this->fechareg;
    }

    /**
     * @param mixed $fechasusc
     */
    public function setFechasusc($fechasusc)
    {
        $this->fechasusc = $fechasusc;
    }

    /**
     * @return mixed
     */
    public function getFechasusc()
    {
        return $this->fechasusc;
    }

    /**
     * @param mixed $idUser
     */
    public function setIdUser($idUser)
    {
        $this->idUser = $idUser;
    }

    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->idUser;
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
     * @return void
     */

    public function loadDatos($username)
    {
        if(isset($username))
        {
            $db = new Zebra_DB();
            $db = $db->getDBObject();
            $data = $db->dlookup("*","usuario_datos","idUser = ?",array($username));
            $this->idUser= $data["idUser"];
            $this->nombre= $data["nombre"];
            $this->apellidop = $data["apellidop"];
            $this->apellidom = $data["apellidom"];
            $this->fechanac = $data["fechanac"];
            $this->fechareg = $data["fechareg"];
            $this->fechasusc= $data["fechasusc"];
            $this->escuela = $data["escuela"];
            $this->email = $data["email"];
            $db->close();
        }
    }

    /**
     * @return boolean
     */

    public function insertDatos()
    {
           $db =  new Zebra_DB();
           $db =  $db->getDBObject();
           if($db->insert("usuario_datos",array("idUser"=>$this->idUser, "nombre"=>$this->nombre, "apellidop"=>$this->apellidop,
           "apellidom"=>$this->apellidom,"fechanac"=>$this->fechanac,"fechareg"=>$this->fechareg, "fechasusc"=>$this->fechasusc,
           "escuela" => $this->escuela, "email"=>$this->email)))
           {
               $db->close();
               return true;
           }
            $db->close();
           return false;
    }

    /**
     *@return boolean
     */

    public  function modifyDatos($username)
    {
         $db =  new Zebra_DB();
         $db =  $db->getDBObject();
         if(($db->update("usuario_datos",array("idUser"=>$this->idUser, "nombre"=>$this->nombre, "apellidop"=>$this->apellidop,
             "apellidom"=>$this->apellidom,"fechanac"=>$this->fechanac,"fechareg"=>$this->fechareg, "fechasusc"=>$this->fechasusc,
             "escuela" => $this->escuela, "email"=>$this->email),"idUser = ?",array($username))))
         {
            $db->close();
             return true;
         }
        return false;
    }

    /**
     * @return boolean
     */
    public  function  deleteDatos($username)
    {
        $db = new Zebra_DB();
        $db = $db->getDBObject();
        if($db->delete("usuario_datos","idUser = ?",array($username)))
        {
            $db->close();
            return true;

        }
        return false;
    }




} 