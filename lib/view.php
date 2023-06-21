<?php
include("dbconnection.php");
header('Content-type: application/json; charset=utf-8');
$con=dbconnection();

$id=$_GET["id"];

$query="SELECT * FROM user_data WHERE id='$id'";

$exe = mysqli_query($con,$query);
$list =array();

    while ($row=  mysqli_fetch_assoc($exe)){
        $list[]=$row;
    }
    echo json_encode($list);
?>