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
     * @return void
     */

    public static function logout()
    {
        session_unset();
    }



}