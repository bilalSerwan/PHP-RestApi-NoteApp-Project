<?php
include "../connectDB.php";
$note_id = secureRequest('note_id');
$imagename = secureRequest('imagename');

$stmt = $con->prepare("DELETE FROM `notes` WHERE `note_id`={$note_id}");
$stmt->execute();

$count = $stmt->rowCount();

if ($count > 0) {
    deletefile('../uploads', $imagename);
    echo "Seccess Deleted  the note ";
} else {
    echo "Failed to delete the note ";
}
