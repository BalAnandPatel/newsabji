<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart">
  <div class="offcanvas-header justify-content-center">
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
</div>
<?php
//session_start();
if($_SESSION['user']=="True"){}
$user=$_SESSION['user'];
include "constant.php";
$url = $URL . "cart/readCart.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$data = array("user"=>$user);
//print_r($data);
$postdata = json_encode($data);
$client = curl_init();
curl_setopt( $client, CURLOPT_URL,$url);
 //curl_setopt( $client, CURLOPT_HTTPHEADER,  $request_headers);
curl_setopt($client, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($client, CURLOPT_POST, 5);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
$response = curl_exec($client);
//print_r($response);
$result = json_decode($response);
//print_r($result);
$total=0;
$countproduct=0;
$_SESSION['cartsize']=sizeof($result->records);

?>
  <div class="offcanvas-body">
    <div class="order-md-last">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
     
        <span class="text-primary">Your cart</span>
        <span class="badge bg-primary rounded-pill"><?php echo sizeof($result->records);?></span>
      </h4>
      <?php
                // print_r($result);
                // print_r($result['records']);
                for($i=0; $i<sizeof($result->records);$i++)
                { //print_r($result->records[$i]);
                ?>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-sm">
          <div>
            <h6 class="my-0"><?php echo $result->records[$i]->productName;?></h6>
            <small class="text-body-secondary"><?php echo $result->records[$i]->description;?></small>
          </div>
          <span class="text-body-secondary">&#8377;<?php echo $result->records[$i]->price;?></span>
        </li>
        <?php  $GLOBALS['count']=$countproduct+1;?>
        <?php  $total=$result->records[$i]->price + $total;?>
        <?php }?>
        <li class="list-group-item d-flex justify-content-between">
          <span>Total (INR)</span>
          <strong>&#8377;<?php echo $_SESSION["cartTotalAmount"]=$total;?></strong>
          
        </li>
      </ul>
      
      <button class="w-100 btn btn-success btn-lg" onclick="window.location.href='cart.php';" type="submit">View
        Cart</button><br><br>
      <button class="w-100 btn btn-primary btn-lg" onclick="window.location.href='checkout.php';" type="submit">Continue
        to checkout</button>
    </div>
  </div>
  
</div>