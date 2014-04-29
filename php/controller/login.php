<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 22/03/14
 * Time: 15:43
 */
require "../model/Usuario.php";
use Respect\Validation\Validator as v;


$username = $_POST['username'];
$password = $_POST['password'];


if(v::regex("/^[a-zA-Z0-9_\.]+$/")->length(6,30)->validate($username))
{
    if(Usuario::login($username,$password))
    {
        session_start();
        $_SESSION["username"]=$username;
        echo "success";
    }
}

else echo "fail";

?>