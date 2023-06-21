<?php
include("dbconnection.php");
header('Content-type: application/json; charset=utf-8');
$con=dbconnection();

if(isset($_POST["fullname"]))
{
    $fullname=mysqli_real_escape_string($con, $_POST["fullname"]);
}

if(isset($_POST["email"]))
{
    $email=mysqli_real_escape_string($con, $_POST["email"]);
}

if(isset($_POST["password"]))
{
    $password=mysqli_real_escape_string($con, $_POST["password"]);
}

$query="INSERT INTO `user_data` (fullname, email, password) VALUES ('$fullname', '$email', '$password')";
$exe=mysqli_query($con,$query);

$arr=[];
if($exe)
{
    $arr["success"]=true;
    $arr["message"]="New record created successfully";
}
else
{
    $arr["success"]=false;
    $arr["message"]="Error executing query: ".mysqli_error($con);
}
echo json_encode($arr);
?>
