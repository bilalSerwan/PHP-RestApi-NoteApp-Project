<?php
function secureRequest($request)
{
    return htmlspecialchars(strip_tags($_POST[$request]));
}


function imagerequest($request)
{
    define('MB', 1048576);
    $massegeER = [];
    $image = $_FILES[$request];
    $imageName = $image['name'];
    $img_tmp = $image['tmp_name'];
    $img_size = $image['size'];
    $arrofimg = explode('.', $imageName);
    $ext = end($arrofimg);
    $allowExt = ['jpg', 'png', 'jpeg', 'pdf'];
    $ext = strtolower($ext);
    if (!in_array($ext, $allowExt)) {
        $massegeER[] = "EXT";
    }
    if ($img_size > 2 * MB) {
        $massegeER[] = "SIZE";
    }
    if (empty($massegeER)) {
        $destination = '../uploads/' . $imageName;
        move_uploaded_file($img_tmp, $destination);
        return $imageName;
    } else {
    return "fail";
    }
}
function deletefile($dir , $imagename){
    if(file_exists($dir . $imagename)){
        unlink($dir .'/'.$imagename);
    }
}
