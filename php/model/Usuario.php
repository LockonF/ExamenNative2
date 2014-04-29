<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 22/03/14
 * Time: 15:28
 */

require_once "Zebra_DB.php";

class Usuario {
    /**
     * \var Usuario_Datos $usuarioDatos
     *
     */

    private $username;
    private $password;
    private $priviliges;
    private $usuarioDatos;
    private $oldUsername;

    public function __construct()
    {
        $this->usuarioDatos = new Usuario_Datos();
    }



    /**
     * @return Usuario_Datos
     */

    public function getUserData()
    {
        if(isset($this->username))
        {
            $this->usuarioDatos->loadDatos($this->username);
        }
        return $this->usuarioDatos;
    }


    /**
     * @return Usuario_Datos
     */
    public function  getUsuarioDatos()
    {
        return $this->usuarioDatos;
    }

    /**
     * @param mixed $oldUsername
     */
    private function setOldUsername($oldUsername)
    {
        $this->oldUsername = $oldUsername;
    }

    /**
     * @return mixed
     */
    public function getOldUsername()
    {
        return $this->oldUsername;
    }

    /**
     * @param mixed $priviliges
     */
    public function setPriviliges($priviliges=1)
    {
        $this->priviliges = $priviliges;
    }

    /**
     * @return mixed
     */
    public function getPriviliges()
    {
        return $this->priviliges;
    }


    /**
     * @param mixed $password
     */
    public function setPassword($password)
    {
        $this->password = PHPassLib\Hash\BCrypt::hash($password,array("rounds"=>10));
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @return mixed
     */
    public function getUsername()
    {
        return $this->username;
    }




    /**
     * @return boolean
     */

    public function setPasswordOnDB($pass)
    {
       if(isset($this->username))
       {
           $db = new Zebra_DB();
           $db = $db->getDBObject();
           if($db->update("usuario",array("password"=>$pass),"username= ? ",array($this->username)))
           {
               $this->setPassword($pass);
           }
           $db->close();
       }
       return false;
    }


    /**
     * @return boolean
     */

    public function setPriviligesOnDB($priv=1)
    {
        if(isset($this->username))
        {
            $db = new Zebra_DB();
            $db = $db->getDBObject();
        if($db->update("usuario",array("tipo"=>$priv),"username= ?",array($this->username)))
            {
                $this->setPriviliges($priv);
                $db->close();
                return true;
            }
        }
        return false;
    }

    /**
     * @return boolean
     */

    public function modifyUser()
    {
        $db = new Zebra_DB();
        $db = $db->getDBObject();
        $datetime = new DateTime();
        $timestamp = $datetime->format('Y\-m\-d\ h:i:s');
        $ip = $_SERVER['REMOTE_ADDR'];

        if($db->update("usuario",array('username'=>$this->username,'password'=>$this->password,
            "tipo"=>$this->priviliges,"creado"=>$timestamp,"modificado"=>$timestamp,"login_ip"=>$ip
        ),"username = ?",array($this->oldUsername)))
        {
            $db->close();
            $this->oldUsername=$this->username;
            return true;

        }
        $db->close();
        return false;;

    }

    /**
     * @return boolean
     */

    public function deleteUser()
    {
        $db = new Zebra_DB();
        $db = $db->getDBObject();
        if($db->delete("usuario","username = ? ",array($this->username)))
        {
            $db->close();
            return true;
        }
        $db->close();
        return false;
    }

    /**
     * @return array
     */

    public static  function lookupAllUsers()
    {
        $usuarioList = array();
        $db = new Zebra_DB();
        $db = $db->getDBObject();
        $db->debug=true;
        $db->query("Select * from Usuario u left join Usuario_datos uc on u.username = uc.idUser");
        while($row = $db->fetch_assoc())
        {
            $usuario = array(
                "username"=>$row["username"],
                "password"=>$row["password"],
                "privileges"=>$row["tipo"],
                "nombre"=>$row["nombre"],
                "apellidop"=>$row["apellidop"],
                "apellidom"=>$row["apellidom"],
                "fechanac"=>$row["fechanac"],
                "fechareg"=>$row["fechareg"],
                "escuela"=>$row["escuela"],
                "email"=>$row["email"]);
            $usuarioList [] = $usuario;

        }
        $db->close();
        return json_encode($usuarioList);

    }

    public static  function lookupUsers($username,$type)
    {
        if(isset($username) && $username!="")
        {
            $usuarioList = array();
            $db = new Zebra_DB();
            $db = $db->getDBObject();
            $db->debug=true;
            //Usuarios
            if($type==1)
            {
                $db->query("Select * from Usuario u left join Usuario_datos uc on u.username = uc.idUser where u.username like ?",array("%".$username."%"));
            }
            //Nombre
            if($type==2)
            {
                $db->query("Select * from Usuario u left join Usuario_datos uc on u.username = uc.idUser where (uc.nombre like ? or uc.apellidop like ? or uc.apellidom like ?)",array("%".$username."%","%".$username."%","%".$username."%"));

            }
            //Escuela
            if($type==3)
            {
                $db->query("Select * from Usuario u left join Usuario_datos uc on u.username = uc.idUser where uc.escuela like ?",array("%".$username."%"));

            }


            while($row = $db->fetch_assoc())
            {
                $usuario = array(
                "username"=>$row["username"],
                "password"=>$row["password"],
                "privileges"=>$row["tipo"],
                "nombre"=>$row["nombre"],
                "apellidop"=>$row["apellidop"],
                "apellidom"=>$row["apellidom"],
                "fechanac"=>$row["fechanac"],
                "fechareg"=>$row["fechareg"],
                "escuela"=>$row["escuela"],
                "email"=>$row["email"]);
                $usuarioList [] = $usuario;

            }
            $db->close();
            return json_encode($usuarioList);
        }
        return null;
    }

    /**
     * @return boolean
     */

    public function createNewUser()
    {
        if(isset($this->username) && isset($this->password) && isset($this->priviliges))
        {

            $db = new Zebra_DB();
            $db = $db->getDBObject();

            $datetime = new DateTime();
            $timestamp = $datetime->format('Y\-m\-d\ h:i:s');
            $ip = $_SERVER['REMOTE_ADDR'];
            if($db->insert("Usuario",array('username'=>$this->username,'password'=>$this->password,
            "tipo"=>$this->priviliges,"creado"=>$timestamp,"modificado"=>$timestamp,"login_ip"=>$ip
            )))
            {
                $db->close();
                return true;
            }

        }
        $db->close();
        return false;
    }


    /**
     * @return Usuario
     */

    public static function getUserFromDB($username)
    {
        $db=new Zebra_DB();
        $db=$db->getDBObject();
        $data=$db->dlookup("username,password,tipo","Usuario","username=?",array($username));
        $db->close();
        if(isset($data))
        {
            $usuario = new Usuario();
            $usuario->setUsername($data['username']);
            $usuario->setPassword($data['password']);
            $usuario->setPriviliges($data['tipo']);
            $usuario->setOldUsername($data['username']);
        }
        if(isset($usuario))
            return $usuario;
        return null;
    }

    /**
     * @return boolean
     */
     public static function login($username,$pass)
     {
         if(isset($username) && isset($pass))
         {
             try{


             $db=new Zebra_DB();
             $db=$db->getDBObject();
             $hash=$db->dlookup("password","Usuario","username=?",array($username));
             $db->close();
             if(PHPassLib\Hash\BCrypt::verify($pass,$hash))
                 return true;
             }catch (Exception $e)
             {
                 $e->getMessage();
             }
         }
         return false;
     }

    /**
     * @return int
     *
     * Tipo 1 = Admin
     * Tipo 2 = Usuario Común
     */
    public static function getPriviligesFromDB($username)
    {
        $db=new Zebra_DB();
        $db=$db->getDBObject();
        $priv = $db->dlookup("tipo","Usuario","username=?",array($username));
        $db->close();
        return $priv;
    }


}

?>