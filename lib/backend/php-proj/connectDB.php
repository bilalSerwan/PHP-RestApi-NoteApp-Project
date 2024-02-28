<?php
$dsn = "mysql:host=localhost;dbname=noteapp";
$user = "root";
$pass = "";
$opition = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
try {
    $con = new PDO($dsn, $user, $pass, $opition);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connnected seccussfully";
    include "function.php";
} catch (PDOException $error) {
    echo $error->getMessage();
}
