<?php
$dsn = "mysql:host=localhost;dbname=usesr";
$user = "root";
$pass = "";
$opition = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
try {
    $con = new PDO($dsn, $user, $pass, $opition);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connnected seccussfully";
} catch (PDOException $error) {
    echo $error->getMessage();
}
// $stmt = $con->prepare("INSERT INTO `allusers`(`user_name`, `user_password`) VALUES ('bannaZyad','banna123')");
// $output = $stmt->execute();
// echo $output;
$stmt = $con->prepare("SELECT * FROM `allusers`");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
   echo json_encode(array("data"=>$data,"status"=>"seccess"));
} else {
    echo "Faild To Fetch Data";
}
 ?>
