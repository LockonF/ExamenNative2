<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 28/04/14
 * Time: 19:14
 */

require_once "Usuario.php";
session_start();

class Session {



    /**
     * @return int
     *
     * Privilegios: 0 = no autenticado, 1 admin, 2 usuario
     */


    public static function getPriviliges()
    {
        if(isset($_SESSION['username']))
        {
            return Usuario::getPriviligesFromDB($_SESSION['username']);
        }
        else return 0;

    }

    /**
     * @return void
     */

    public static function redirectIndex()
    {
        header("Location: index.html");
    }

    /**
     * @return bool
     */

    public static function isAuthenticated()
    {
        if(isset($_SESSION['username']))
            return true;
        return false;
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
                {
                    $_SESSION["username"]=$username;
                    return true;
                }
            }catch (Exception $e)
            {
                $e->getMessage();
            }
        }
        return false;
    }


    /**
     * @return void
     */

    public static function logout()
    {
        session_unset();

    }


    /*
     * Manejo de sesiones para la generacion de examenes
     */



    /**
     * @params bool boolean
     */

    public static function setExamenActive($boolean)
    {
        $_SESSION['active']=$boolean;
    }

    /**
     * @return void
     */

    public static function unsetExam()
    {
        unset($_SESSION['examen']);
    }

    /**
     * @return bool
     */
    public static function isExamenSet()
    {
        if(isset($_SESSION['examen']))
        {
            return true;
        }
        else return false;
    }

    /**
     * @return bool
     */

    public static function isExamenActive()
    {
        if(isset($_SESSION['active']))
        {
            if($_SESSION['active']==true)
                return true;
        }
        return false;
    }

    /**
     * @return Examen
     */

    public static function  getExamenFromSession()
    {
        return unserialize($_SESSION['examen']);
    }

    /**
     * @params Examen $examen
     * @return void
     */
    public static function  setExamenToSession($examen)
    {
        $_SESSION['examen'] = serialize($examen);
    }

    /**
     * @return void
     */

    public static function setExamenGenerated($boolean)
    {
        $_SESSION['finished']=$boolean;
    }

    /**
     * @return bool
     */

    public static function isExamenGenerated()
    {
        if(isset($_SESSION['finished']))
        {
            if($_SESSION['finished']==true)
                return true;
        }
        else return false;
    }

}