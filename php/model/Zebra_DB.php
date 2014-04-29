<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 14/04/14
 * Time: 14:53
 */

require __DIR__ . "../../vendor/autoload.php";

class Zebra_DB
{
    private  $host;
    private  $username;
    private  $password;
    private  $schema;
    private  $db;

    function __construct()
    {
        $this->host="127.0.0.1";
        $this->username="root";
        $this->password="admin";
        $this->schema="cics";
        try{
        $this->db= new Zebra_Database();
        $this->db->connect($this->host,$this->username,$this->password,$this->schema);
        $this->db->set_charset("utf8","utf8_spanish2_ci");
        }
        catch(Exception $e)
        {
            $e->getMessage();
        }
    }

    function getDBObject()
    {
        return $this->db;
    }


}