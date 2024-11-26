<head>
  <?php include 'includes/header.php' ?>
</head>
<?php
//session_start();

// $jwt=$_SESSION['JWT'];
// $request_headers = [
//   'Authorization:' . $jwt
// ];
include "constant.php";
$url = $URL . "address/readAddress.php ";
$userId=$_SESSION['user'];
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$data = array("userId"=>$userId);
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
$resultchek = json_decode($response);
//print_r($resultchek);


///////////////////////////


//session_start();
//$user=$_SESSION['user'];
//include "constant.php";
$urltotal = $URL . "cart/readCarttotalamount.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$datatotal = array("user"=>$userId);
//print_r($data);
$postdatatotal = json_encode($datatotal);
$clienttotal = curl_init();
curl_setopt( $clienttotal, CURLOPT_URL,$urltotal);
 //curl_setopt( $client, CURLOPT_HTTPHEADER,  $request_headers);
curl_setopt($clienttotal, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($clienttotal, CURLOPT_POST, 5);
curl_setopt($clienttotal, CURLOPT_POSTFIELDS, $postdatatotal);
$responsetotal = curl_exec($clienttotal);
//print_r($responsetotal);
$resulttotal = json_decode($responsetotal);
//print_r($resulttotal);
$grandtotal=$resulttotal->records[0]->totalamont;
//$totalprice=0;



//// Read Product Detail ans sellar Id
$urlprodcutDetails = $URL . "product/readproductDtailsforOrder.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$dataproductDetails = array("user"=>$userId);
//print_r($data);
$postdataproductDetails = json_encode($dataproductDetails);
$clientproductDetails = curl_init();
curl_setopt( $clientproductDetails, CURLOPT_URL,$urlprodcutDetails);
//curl_setopt( $client, CURLOPT_HTTPHEADER,  $request_headers);
curl_setopt($clientproductDetails, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($clientproductDetails, CURLOPT_POST, 5);
curl_setopt($clientproductDetails, CURLOPT_POSTFIELDS, $postdataproductDetails);
$responseproductDetails = curl_exec($clientproductDetails);
//print_r($responseproductDetails);
$resultproductDetails = json_decode($responseproductDetails);
print_r($resultproductDetails);
//$i=0;
for($i=0; $i<sizeof($resultproductDetails->records);$i++)
{
print_r($resultproductDetails->records[$i]);

echo "<br>";  
}
///echo $grandtotal=$resultproductDetails->records[0]->totalamont;
?>
<!DOCTYPE html>
<html lang="en">



<body>
  <?php include 'includes/svg.php' ?>


<?php include 'includes/preloader.php' ?>

  <?php include 'includes/global-cart.php' ?>

  <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasSearch">
    <div class="offcanvas-header justify-content-center">
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div class="order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Search</span>
        </h4>
        <form role="search" action="index.php" method="get" class="d-flex mt-3 gap-0">
          <input class="form-control rounded-start rounded-0 bg-light" type="email"
            placeholder="What are you looking for?" aria-label="What are you looking for?">
          <button class="btn btn-dark rounded-end rounded-0" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>


  <header>
    <div class="container-fluid">
      <?php include 'includes/search.php' ?>

    </div>
    <?php include 'includes/menu.php' ?>
  </header>

  <section class="py-5 mb-5" style="background: url(images/background-pattern.jpg);">
    <div class="container-fluid">
      <?php include 'includes/breadcrumb.php' ?>
    </div>
  </section>
  <section class="shopify-cart checkout-wrap py-5">
    <div class="container-fluid">
      <form class="form-group" action="admin/action/placeorder_post.php" method="post">
     <?php 
     //print_r($result->records[$i]);
     //print_r($response);
     for($i=0; $i<sizeof($resultchek->records); $i++)
                { //print_r($result->records[$i]);
                ?>
        <div class="row d-flex flex-wrap">
          <div class="col-lg-6">
            <h4 class="text-dark pb-4">Billing Details</h4>
            <div class="billing-details">
              <label for="fname">First Name*</label>
              <input type="text" name="orderdetails" value="<?php print_r($resultproductDetails);?>"> 
              <input type="text" id="fname" name="firstname" value="<?php echo $resultchek->records[$i]->userId;?>" class="form-control mt-2 mb-4 ps-3">
              <!-- <label for="cname">Company Name(optional)*</label> -->
              <!-- <input type="text" id="cname" name="companyname" class="form-control mt-2 mb-4"> -->
              <label for="cname">Country / Region*</label>
              <select class="form-select form-control mt-2 mb-4" aria-label="Default select example">
                <option selected="" hidden="">Inida</option>
                <option value="1">UK</option>
                <option value="2">Australia</option>
                <option value="3">Canada</option>
              </select>
              <label for="address">Street Address*</label>
              <input type="text" id="adr" name="address" placeholder="House number and street name"
                class="form-control mt-3 ps-3 mb-3" value="<?php echo $resultchek->records[$i]->addressLine2;?>">
              
              <label for="city">Town / City *</label>
              <input type="text" id="city" name="city" class="form-control mt-3 ps-3 mb-4" value="<?php echo $resultchek->records[$i]->addressLine2;?>">
              <label for="state">State *</label>
              <select class="form-select form-control mt-2 mb-4" aria-label="Default select example">
                <option selected="" hidden="">Florida</option>
                <option value="1">New York</option>
                <option value="2">Chicago</option>
                <option value="3">Texas</option>
                <option value="3">San Jose</option>
                <option value="3">Houston</option>
              </select>
              <label for="zip">Zip Code *</label>
              <input type="text" id="zip" name="zip" class="form-control mt-2 mb-4 ps-3" value="<?php echo $resultchek->records[$i]->postalCode;?>">
              <label for="email">Phone *</label>
              <input type="text" id="phone" name="phone" class="form-control mt-2 mb-4 ps-3">
              <label for="email">Email address *</label>
              <input type="text" id="email" name="email" class="form-control mt-2 mb-4 ps-3">
            </div>
          </div>
          <div class="col-lg-6">
            <h4 class="text-dark pb-4">Additional Information</h4>
            <div class="billing-details">
              <label for="fname">Order notes (optional)</label>
              <textarea class="form-control pt-3 pb-3 ps-3 mt-2"
                placeholder="Notes about your order. Like special notes for delivery."></textarea>
            </div>
            <div class="your-order mt-5">
              <h4 class="display-7 text-dark pb-4">Cart Totals</h4>
              <div class="total-price">
                <table cellspacing="0" class="table">
                  <tbody>
                    <tr class="subtotal border-top border-bottom pt-2 pb-2 text-uppercase">
                      <th>Subtotal</th>
                      <td data-title="Subtotal">
                        <span class="price-amount amount ps-5">
                          <bdi>
                            <span class="price-currency-symbol">$</span><?php echo $_SESSION["cartTotalAmount"];?></bdi>
                        </span>
                      </td>
                    </tr>
                    <tr class="order-total border-bottom pt-2 pb-2 text-uppercase">
                      <th>Total</th>
                      <td data-title="Total">
                        <span class="price-amount amount ps-5">
                          <bdi>
                            <span class="price-currency-symbol">$</span><?php echo $_SESSION["cartTotalAmount"]?> </bdi>
                        </span>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div class="list-group mt-5 mb-3">
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios1" value="" checked>
                    <span>
                      <strong class="text-uppercase">Direct bank transfer</strong>
                      <small class="d-block text-body-secondary">Make your payment directly into our bank account.
                        Please use your Order ID. Your order will shipped after funds have cleared in our
                        account.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios2" value="">
                    <span>
                      <strong class="text-uppercase">Check payments</strong>
                      <small class="d-block text-body-secondary">Please send a check to Store Name, Store Street, Store
                        Town, Store State / County, Store Postcode.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios3" value="">
                    <span>
                      <strong class="text-uppercase">Cash on delivery</strong>
                      <small class="d-block text-body-secondary">Pay with cash upon delivery.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios3" value="">
                    <span>
                      <strong class="text-uppercase">Paypal</strong>
                      <small class="d-block text-body-secondary">Pay via PayPal; you can pay with your credit card if
                        you don’t have a PayPal account.</small>
                    </span>
                  </label>
                </div>
                <button type="submit" name="submit"
                  class="btn btn-dark btn-lg text-uppercase btn-rounded-none w-100">Place an order</button>
              </div>
            </div>
          </div>
        </div>
        <?php }?>
      </form>
    </div>
  </section>

  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/copyright.php'; ?>
</body>

</html>