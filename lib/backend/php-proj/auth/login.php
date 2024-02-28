<?php
include "../connectDB.php";
$email = secureRequest("email");
$password = secureRequest("password");

$stmt = $con->prepare("SELECT * FROM `users` WHERE `password`='bilal123' AND `email`='bilal@gmail.com' ");
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "Failed"));
}
