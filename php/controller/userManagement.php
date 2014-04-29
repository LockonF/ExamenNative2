<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 23/04/14
 * Time: 21:01
 */
require "../model/Usuario.php";
require "../model/Usuario_Datos.php";
use \Respect\Validation\Validator as v;


$usuario = new Usuario();
/*
$usuario->setUsername("Santiago");
$usuario->setPassword("12345");
$usuario->setPriviliges(1);
$usuario->createNewUser();

/*
$usuario->getUsuarioDatos()->loadDatos($usuario->getUsername());
*/
/*
$usuario->getUsuarioDatos()->setIdUser($usuario->getUsername());
$usuario->getUsuarioDatos()->setNombre("Santiago");
$usuario->getUsuarioDatos()->setApellidop("Sinisterra");
$usuario->getUsuarioDatos()->setApellidom("Sierra");
$usuario->getUsuarioDatos()->insertDatos();
*/


/*
$usuario->modifyUser();
*/
/*
$usuario->setUsername("SantiagoSS");
$usuario->setPassword("santi123");
$usuario->setPriviliges(2);
$usuario->modifyUser();
*/

/*
$usuario= Usuario::getUserFromDB("SantiagoSS");
$usuario->getUserData();
$usuario->getUsuarioDatos()->setNombre("Santi");
$usuario->getUsuarioDatos()->modifyDatos($usuario->getUsername());


$usuario->deleteUser();
*/


/*
 * Buscando por nombre de usuario
 */

/*
$usuarioLista = Usuario::lookupUsers("ck","1");

*/

//Ejemplo de Get



/*
 * Funcion para manejar busquedas
 * si el parámetro S tiene "all" se buscan todos los usuarios
 * si no, se hace una búsqueda específica
 */

if(isset($_GET["s"]))
    {
    if($_GET["s"]=="all")
    {
        echo Usuario::lookupAllUsers();
    }
}
else
{

    $kw = $_GET["keyword"];
    $type = $_GET["tipo"];
    $valKw = v::regex("/^[a-zA-Z0-9_\.]+$/")->length(1,30)->validate($kw);
    $valType = v::numeric()->positive()->between(0,4)->validate(intval($type));
    if($valKw && $valType)
    {
        echo $usuarioLista = Usuario::lookupUsers($kw,$type);
    }


}