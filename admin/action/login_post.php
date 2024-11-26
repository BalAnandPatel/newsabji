<?php
include '../../constant.php';
$pwd= $_POST["password"]; 
$email= $_POST["email"];
$url = $URL."user/read_userById.php";
$data = array("password"=>$pwd,"email"=>$email);
//print_r($data);
$postdata = json_encode($data);
$client = curl_init($url);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($client, CURLOPT_CONNECTTIMEOUT, 0); 
curl_setopt($client, CURLOPT_TIMEOUT, 4); //timeout in seconds
curl_setopt($client,CURLOPT_RETURNTRANSFER,true);
$response = curl_exec($client);
//$response->message;
curl_close($client);
//print_r($response);
$result = (json_decode($response));
//curl_close($client);
//print_r($result);
//echo $result->message;
///echo $result->record[0]->message;
//print_r($result);
//  print_r($result->token);
if($result->message=="Successfull"){

    session_start();
 $_SESSION["user"]=$email;
 $_SESSION["pass"]=$pwd;
 header('Location:../../index.php');
}else
{
 header('Location:../../account.php?msg='.$result->message);
}


?>