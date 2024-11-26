<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../config/database.php';
include_once '../../objects/product.php';
include_once '../../config/database.php';
include_once '../../objects/seller.php';
include_once '../../constant.php';
require '../../php-jwt/src/JWT.php';
require '../../php-jwt/src/ExpiredException.php';
require '../../php-jwt/src/SignatureInvalidException.php';
require '../../php-jwt/src/BeforeValidException.php';
use \Firebase\JWT\JWT;

// get database connection
  
$database = new Database();
$db = $database->getConnection();
  
$insert_product= new Product($db);
$getHeaders = apache_request_headers();
//print_r($getHeaders);
$jwt = "123";

if($jwt){

    try {

         //$decoded = JWT::decode($jwt, $SECRET_KEY, array('HS256'));

  
// get posted data
$data = json_decode(file_get_contents("php://input"));
//print_r($data);  
// make sure data is not empty
if(
    1
    // !empty($data->userType) &&
    // !empty($data->userName) &&
    // !empty($data->userMobile) &&
    // !empty($data->userEmail) &&
    // !empty($data->userPass)
)

{

    $insert_product->skuId = $data->skuId;
    $insert_product->name = $data->name;
    $insert_product->shippingCharge = $data->shippingCharge;
    $insert_product->price = $data->price;
    $insert_product->description = $data->description;
    $insert_product->categoriesId = $data->categoriesId;
    $insert_product->image = "";
    $insert_product->discount = $data->discount;
    $insert_product->sellarId = $data->sellarId;
        
    //var_dump($exam);
    // create the reg
    if($insert_product->insertProduct()){

        http_response_code(201);
        echo json_encode(array("message"=>"Successfull"));
    }
    else{
  
        // set response code - 503 service unavailable
        http_response_code(503);
  
        // tell the user
        echo json_encode(array("message" => "Unable to insert user"));
    }
}
}
catch (Exception $e){
    // print_r($e);
          http_response_code(401);
      
          echo json_encode(array(
              "message" => "Access denied.",
              "error" => $e->getMessage()
          ));
      }
      
  }  
  
// tell the user data is incomplete
else{
  
    // set response code - 400 bad request
    http_response_code(400);
  
    // tell the user
    echo json_encode(array("message" => "Unable to insert user. Data is incomplete."));
}
?>