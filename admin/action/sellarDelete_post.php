<?php
include '../../constant.php';
$id= $_POST["id"];
$status= $_POST["status"];
if($status==1){
  $status=2;
}else{
  $status=1;
}
echo $url = $URL."sellar/deactivate_sellar.php";
$data = array("id"=>$id,"status"=>$status);
print_r($data);
$postdata = json_encode($data);
$client = curl_init($url);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($client, CURLOPT_CONNECTTIMEOUT, 0); 
curl_setopt($client, CURLOPT_TIMEOUT, 4); //timeout in seconds
curl_setopt($client,CURLOPT_RETURNTRANSFER,true);
$response = curl_exec($client);
curl_close($client);
$result = (json_decode($response));
if($result->message="updated"){
      header('Location:../manage-sellar.php');
 } else
 {
    header('Location:../manage-sellar?msg='.$result->message);
 }
?>
