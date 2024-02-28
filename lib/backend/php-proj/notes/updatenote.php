<?php
include "../connectDB.php";
$note_id = secureRequest('note_id');
$title = secureRequest('note_title');
$content = secureRequest('note_content');
$image = secureRequest('note_image');

$stmt = $con->prepare(" UPDATE `notes` SET `note_title`=? , `note_content`=? , `note_image`=? WHERE `note_id`={$note_id} ");
$stmt->execute(array($title, $content, $image));

$count = $stmt->rowCount();

if ($count > 0) {
    echo "seccess Updated the note ";
} else {
    echo "Failed to Update the note ";
}
