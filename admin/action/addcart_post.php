<?php
include '../../constant.php';

/////////////////////

$userId= $_POST["userId"];
$price= $_POST["price"];
$productId= $_POST["productId"];
$quantity=$_POST["quantity"];
$createdBy="Admin";
$createdOn=date('Y-m-d h:i:sa');
$url = $URL."cart/insertCart.php";
$data = array("price"=>$price, "userId"=>$userId, "productId"=>$productId,"quantity"=>$quantity, "createdBy"=>$createdBy, "createdOn"=>$createdOn);
print_r($data);
$postdata = json_encode($data);
$client = curl_init($url);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($client, CURLOPT_CONNECTTIMEOUT, 0); 
curl_setopt($client, CURLOPT_TIMEOUT, 4); //timeout in seconds
curl_setopt($client,CURLOPT_RETURNTRANSFER,true);
$response = curl_exec($client);
curl_close($client);
//print_r($response);
$result = (json_decode($response));


//Product table quantity update



 $productId= $_POST["productId"];
 $quantity=$_POST["quantity"];
 $updatedBy=$_POST["productId"];
 $updatedOn=date('Y-m-d h:i:sa');
$urlProductUpdate = $URL."product/updateProductQuantity.php";
$dataProductUpdate = array("productId"=>$productId, "quantity"=>$quantity, "updatedBy"=>$updatedBy, "updatedOn"=>$updatedOn);
//print_r($dataProductUpdate);
$postdataProductUpdate = json_encode($dataProductUpdate);
$clientProductUpdate = curl_init($urlProductUpdate);
curl_setopt($clientProductUpdate, CURLOPT_POSTFIELDS, $postdataProductUpdate);
curl_setopt($clientProductUpdate, CURLOPT_CONNECTTIMEOUT, 0); 
curl_setopt($clientProductUpdate, CURLOPT_TIMEOUT, 4); //timeout in seconds
curl_setopt($clientProductUpdate,CURLOPT_RETURNTRANSFER,true);
$responseProductUpdate = curl_exec($clientProductUpdate);
curl_close($clientProductUpdate);
//print_r($response);
$resultProductUpdate = (json_decode($responseProductUpdate));



//print_r($result);
if($result->message="Successfull"){
    
  
  header('Location:../../shop.php');
 } else
 {
  //echo "Bad";
  header('Location:../../shop.php?msg='.$result->message);
 }


//print_r($result);
//  print_r($result->token);

?>
