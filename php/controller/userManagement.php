<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 23/04/14
 * Time: 21:01
 */
require "../model/Usuario.php";
require "../model/Usuario_Datos.php";
require "../model/Session.php";
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
        if(Session::getPriviliges()==1)
        echo Usuario::lookupAllUsers();
    }
}

/*
 * Busqueda por tipo y palabra clave
 */
if(isset($_GET["keyword"])&& isset($_GET["tipo"]))
{

    $kw = $_GET["keyword"];
    $type = $_GET["tipo"];
    $valKw = v::regex("/^[a-zA-Z0-9_\.]+$/")->length(0,31)->validate($kw);
    $valType = v::numeric()->positive()->between(0,4)->validate(intval($type));
    if($valKw && $valType)
    {
        echo $usuarioLista = Usuario::lookupUsers($kw,$type);
    }
}

/*
 * Generar Nuevo Usuario
 */
if(isset($_GET["guardar"])){

    $fail =true;
    $username = $_POST["usuario"];
    $password = $_POST["password"];
    $password_confirm = $_POST["passwordConfirm"];
    $email = $_POST["email"];
    $nombre = $_POST["nombre"];
    $paterno = $_POST["apellido_paterno"];
    $materno = $_POST["apellido_materno"];


    if(v::regex("/^[a-zA-Z0-9_\.]+$/")->length(5,31)->validate($username))
    {
        if(v::string()->length(5,31)->validate($password) && v::equals($password)->validate($password_confirm))
        {
            if(v::email()->validate($email))
            {
                if(v::alpha()->length(0,49)->validate($nombre))
                {
                    if(v::alpha()->length(0,49)->validate($paterno))
                    {
                        if(v::alpha()->length(0,49)->validate($materno))
                        {
                            $usuario_n = new Usuario();
                            $usuario_n->setUsername($username);
                            $usuario_n->setPassword($password);
                            $usuario_n->getUserData()->setEmail($email);
                            $usuario_n->getUserData()->setApellidop($paterno);
                            $usuario_n->getUserData()->setApellidom($materno);
                            $usuario_n->setPriviliges(2);

                            $usuario_n->createNewUser();
                            $fail =false;
                            echo "success";
                        }

                    }
                }
            }
        }
    }
    if($fail)
        echo "fail";


}