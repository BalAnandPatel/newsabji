<?php
include '../../constant.php';

/////////////////////

$deliveryId= $_POST["deliveryId"];
$orderId= $_POST["orderId"];
$status = $_POST["status"];
$updatedOn="22-02-2024";
$updatedBy=$deliveryId;
$url = $URL."deliveryBoy/orderAccept.php";
$data = array("deliveryId"=>$deliveryId,"status"=>$status, "updatedOn"=>$updatedOn, "updatedBy"=>$updatedBy, "orderId" => $orderId);
print_r($data);
$postdata = json_encode($data);
$client = curl_init($url);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($client, CURLOPT_CONNECTTIMEOUT, 0); 
curl_setopt($client, CURLOPT_TIMEOUT, 4); //timeout in seconds
curl_setopt($client,CURLOPT_RETURNTRANSFER,true);
$response = curl_exec($client);
curl_close($client);
print_r($response);

$result = (json_decode($response));

if($result->message="Deleted"){
    
  
 // header('Location:../manage-deliveryBoy.php');
 } else
 {
  //echo "Bad";
  // header('Location:../manage-deliveryBoy?msg='.$result->message);
 }


//print_r($result);
//  print_r($result->token);

?>
