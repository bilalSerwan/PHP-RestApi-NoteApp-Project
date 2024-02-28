<?php
include('../connectDB.php');
$title = secureRequest('note_title');
$content = secureRequest('note_content');
$user_id = secureRequest('note_user_id');
$imgname = imagerequest('file');
if ($imgname != 'fail') {
    $stmt = $con->prepare("INSERT INTO `notes` (`note_title`,`note_content`,`note_user_id`,`note_image`) VALUES (?,?,?,?)");
    $stmt->execute(array($title, $content, $user_id, $imgname));

    $count = $stmt->rowCount();

    if ($count > 0) {
        echo "seccess Added the note ";
    } else {
        echo "Failed to Add the note ";
    }
} else {
    echo "fail to add data to db";
}
