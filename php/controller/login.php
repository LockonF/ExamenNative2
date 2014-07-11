<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 22/03/14
 * Time: 15:43
 */
require "../model/Session.php";
use Respect\Validation\Validator as v;


$username = $_POST['username'];
$password = $_POST['password'];


if(v::regex("/^[a-zA-Z0-9_\.]+$/")->length(6,30)->validate($username))
{
    if(Session::login($username,$password))
    {
        echo "success";
    }
}

else echo "fail";

?>