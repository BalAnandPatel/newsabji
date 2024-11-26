<DOTYPE html>
<html lang="en">
<head>
  <?php include 'includes/header.php' ?>
</head>
<?php
//session_start();
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
$resultcart = json_decode($response);
//print_r($result);
//$total=0;
$totalprice=0;
?>
<body>
  <?php include 'includes/svg.php' ?>


<?php include 'includes/preloader.php' ?>

  <?php include 'includes/global-cart.php' ?>

  <header>
    <div class="container-fluid">
      <?php include 'includes/search.php' ?>

    </div>
    <?php include 'includes/menu.php' ?>
<script>
  $(document).ready(function() {
 
 /* Set rates */

 var taxRate = 0.05;

 var fadeTime = 100;

 /* Assign actions */

 $('.pass-quantity input').change(function() {

   updateQuantity(this);

 });

 $('.remove-item button').click(function() {

   removeItem(this);

 });


 /* Recalculate cart */

 function recalculateCart() {

   var subtotal = 0;

   /* Sum up row totals */

   $('.item').each(function() {

     subtotal += parseFloat($(this).children('.product-line-price').text());

   });

   /* Calculate totals */

   var tax = subtotal * taxRate;

   var total = subtotal + tax;

   /* Update totals display */

   $('.totals-value').fadeOut(fadeTime, function() {

     $('#cart-subtotal').html(subtotal.toFixed(2));

     $('#cart-tax').html(tax.toFixed(2));

     $('.cart-total').html(total.toFixed(2));

     if (total == 0) {

       $('.checkout').fadeOut(fadeTime);

     } else {

       $('.checkout').fadeIn(fadeTime);

     }

     $('.totals-value').fadeIn(fadeTime);

   });

 }


 /* Update quantity */

 function updateQuantity(quantityInput) {
   alert(quantityInput);
   /* Calculate line price */

   var productRow = $(quantityInput).parent().parent();

   var price = parseFloat(productRow.children('.product-price').text());

   var quantity = $(quantityInput).val();

   var linePrice = price * quantity;

   /* Update line price display and recalc cart totals */

   productRow.children('.product-line-price').each(function() {

     $(this).fadeOut(fadeTime, function() {

       $(this).text(linePrice.toFixed(2));

       recalculateCart();

       $(this).fadeIn(fadeTime);

     });

   });

 }

 /* Remove item from cart */

 function removeItem(removeButton) {

   /* Remove row from DOM and recalc cart total */

   var productRow = $(removeButton).parent().parent();

   productRow.slideUp(fadeTime, function() {

     productRow.remove();

     recalculateCart();

   });

 }

});


//var a=document.getElementById('subtotal1').innerText;
//alert(subtotal);
var qty=document.getElementById('quantity').value;

function addQty(value)
{
 var qty=document.getElementById('quantity').value;
 var price=document.getElementById('hprice').value;
 var subtotal=document.getElementById('subtotal1').innerText;
     if(value=="add")
     {
      // console.log(subtotal);
      // console.log(qty);
      var subtotal=price*qty
      document.getElementById('subtotal1').innerHTML=subtotal;  
   // alert(qty);
     }
     else
     {
      var b=subtotal/qty
      document.getElementById('subtotal1').innerHTML=b; 
     }
     
}
//document.getElementById('subtotal1').innerHTML=subtotal;

    </script>
  </header>

  <section class="py-5 mb-5" style="background: url(images/background-pattern.jpg);">
    <div class="container-fluid">
      <?php include 'includes/breadcrumb.php' ?>
    </div>
  </section>

  <section class="py-5">
    <div class="container-fluid">
      <div class="row g-5">
        <div class="col-md-8">

          <div class="table-responsive cart">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="card-title text-uppercase text-muted">Product</th>
                  <th scope="col" class="card-title text-uppercase text-muted">Quantity</th>
                  <th scope="col" class="card-title text-uppercase text-muted">Subtotal</th>
                  <th scope="col" class="card-title text-uppercase text-muted"></th>
                </tr>
              </thead>
              <tbody>
              <!-- <form class="form-horizontal row-fluid" name="sellarUpdate" method="post" enctype="multipart/form-data" action="admin/action/updatecartpost.php">   -->
              <?php
                //print_r($result);
                //print_r($result);
                for($i=0; $i<sizeof($resultcart->records); $i++)
                { //print_r($result->records[$i]);
                ?> 
              <tr>
               
                  <td scope="row" class="py-4">
                    <div class="cart-info d-flex flex-wrap align-items-center mb-4">
                      <div class="col-lg-3">
                        <div class="card-image">
                          <img src="images/product-thumb-11.jpg" alt="cloth" class="img-fluid">
                        </div>
                      </div>
                      <div class="col-lg-9">
                        <div class="card-detail ps-3">
                          <h5 class="card-title">
                            <a href="#" class="text-decoration-none"><?php echo $resultcart->records[$i]->productName;?></a>
                          </h5>
                        </div>
                      </div>
                    </div>
                  </td>
                  <td class="py-4">
                    <div class="input-group product-qty w-50">
                      <span class="input-group-btn pass-quantity">
                        <button type="button" onclick="addQty('sub')" class="quantity-left-minus btn btn-light btn-number" data-type="minus">
                          <svg width="16" height="16">
                            <use xlink:href="#minus"></use>
                          </svg>
                        </button>
                      </span>
                      <input type="text" id="quantity"  name="quantity" class="form-control input-number text-center"
                        value="<?php echo $resultcart->records[$i]->quantity;?>" min="1">
                      <span class="input-group-btn">
                        <button type="button"  onclick="addQty('add')" class="quantity-right-plus btn btn-light btn-number" data-type="plus"
                          data-field="">
                          <svg width="16" height="16">
                            <use xlink:href="#plus"></use>
                          </svg>
                        </button>
                      </span>
                    </div>
                  </td>
                  <td class="py-4">
                    <div class="total-price">
                      <input type="hidden" id="hprice" value="<?php echo $resultcart->records[$i]->price;?>">
                      <span class="money text-dark" id="subtotal1">
                        <?php echo $resultcart->records[$i]->price;?>
                      </span>
                    </div>
                  </td>
                  <td class="py-4">
                    <div class="cart-remove">
                    <form class="form-horizontal row-fluid" name="sellarUpdate" method="post" enctype="multipart/form-data" action="admin/action/deleteProductCart_post.php">  
                      <button type="submit">
                      <input type="hidden"  name="quantity" class="form-control input-number text-center"
                      value="<?php echo $resultcart->records[$i]->quantity;?>">
                        <input type="hidden" name="productId" value="<?php echo $resultcart->records[$i]->productId;?>">
                        <input type="hidden" name="user" value="<?php echo $user;?>">
                        <svg width="24" height="24">
                          <use xlink:href="#trash"></use>
                        </svg>
                      </button>
                </form>
                    </div>
                  </td>
                  </tr>
                  <?php $totalprice= $resultcart->records[$i]->price + $totalprice;?>
                  <?php } ?>
               <!-- </form>  -->
             
              </tbody>
            </table>
          </div>

        </div>
        <div class="col-md-4">
          <div class="cart-totals bg-grey py-5">
            <h4 class="text-dark pb-4">Cart Total</h4>
            <div class="total-price pb-5">
              <table cellspacing="0" class="table text-uppercase">
                <tbody>
                  <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                    <th>Subtotal</th>
                    <td data-title="Subtotal">
                      <span class="price-amount amount text-dark ps-5">
                        <bdi>
                          <span class="price-currency-symbol">$</span><?php echo $totalprice;?>
                        </bdi>
                      </span>
                    </td>
                  </tr>
                  <tr class="order-total pt-2 pb-2 border-bottom">
                    <th>Total</th>
                    <td data-title="Total">
                      <span class="price-amount amount text-dark ps-5">
                        <bdi>
                          <span class="price-currency-symbol">$</span><?php echo $totalprice;?></bdi>
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="button-wrap row g-2">
              <div class="col-md-6"><button class="btn btn-light py-3 px-4 text-uppercase btn-rounded-none w-100">Update
                shopping  Cart</button></div>
              <div class="col-md-6"><button
                  class="btn btn-dark py-3 px-4 text-uppercase btn-rounded-none w-100" onclick="window.location.href='shop.php';">Continue Shopping</button></div>
              <div class="col-md-12"><button
                  class="btn btn-primary py-3 px-4 text-uppercase btn-rounded-none w-100" onclick="window.location.href='checkout.php';">Proceed to checkout</button>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <?php include 'includes/newsletter.php'; ?>

  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/copyright.php'; ?>
</body>

              </html>