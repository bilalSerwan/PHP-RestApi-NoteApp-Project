<?php
include "../connectDB.php";

$stmt = $con->prepare("SELECT * FROM `notes`");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
   echo json_encode(array("data"=>$data,"status"=>"seccess"));
} else {
    echo "Faild To Fetch Data";
}
