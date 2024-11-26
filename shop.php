<head>
  <?php include 'includes/header.php' ?>
</head>
 <?php

include "constant.php";
$url = $URL . "product/readAllproduct.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$data = array();
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
$resultProduct = json_decode($response);
//print_r($resultProduct);
?> 



<?php
//session_start();
//  echo $jwt=$_SESSION['JWT'];
// $request_headers = [
//   'Authorization:' . $jwt
// ];
$url = $URL . "category/readCategory.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$data = array();
// print_r($data);
$postdata = json_encode($data);
$client = curl_init();
curl_setopt( $client, CURLOPT_URL,$url);
//curl_setopt( $client, CURLOPT_HTTPHEADER,  $request_headers);
curl_setopt($client, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($client, CURLOPT_POST, 5);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
$response = curl_exec($client);
//print_r($response);
$resultcat = json_decode($response);
 //print_r($resultcat);
?>

<!DOCTYPE html>
<html lang="en">


<body>
  <?php include 'includes/svg.php';?>


<?php //include 'includes/preloader.php'; ?>

  <?php include 'includes/global-cart.php';?>

  <header>
    <div class="container-fluid">
      <?php include 'includes/search.php';?>

    </div>
    <?php include 'includes/menu.php';?>
    
  </header>
  
  <section class="py-5 mb-5" style="background: url(images/background-pattern.jpg);">
    <div class="container-fluid">
      <?php include 'includes/breadcrumb.php';?>
     
    </div>
  </section>

  <div class="shopify-grid">
    <div class="container-fluid">
      <div class="row g-5">
        <aside class="col-md-2">
          <div class="sidebar">
            <div class="widget-menu">
              <div class="widget-search-bar">
                <form role="search" method="get" class="d-flex position-relative">
                  <form class="d-flex mt-3 gap-0" action="index.php">
                    <input class="form-control form-control-lg rounded-2 bg-light" type="email"
                      placeholder="Search here" aria-label="Search here">
                    <button class="btn bg-transparent position-absolute end-0" type="submit"><svg width="24" height="24"
                        viewBox="0 0 24 24">
                        <use xlink:href="#search"></use>
                      </svg></button>
                  </form>
                </form>
              </div>
            </div>
            <div class="widget-product-categories pt-5">
              <h5 class="widget-title">Categories</h5>
              <form id="cart" class="form-group flex-wrap" action="admin/action/addcart_post.php" method="POST">
              <ul class="product-categories sidebar-list list-unstyled">
              <?php
                // print_r($response);
                // print_r($result['records']);
                //print_r($resultcat);
                ///echo"---------". $resultcat->records[0]->name;
               
                for($i=0; $i<sizeof($resultProduct->records);$i++)
                { //print_r($resultcat->records[$i]);
                ?>
                <li class="cat-item">
                  <a href="#" class="nav-link"><?php echo $resultProduct->records[$i]->name;?></a>
                </li>
                <?php 
                }
                ?>
               
              </ul>
              </form>
            </div>
            <div class="widget-product-tags pt-3">
              <h5 class="widget-title">Tags</h5>
              <ul class="product-tags sidebar-list list-unstyled">
                <li class="tags-item">
                  <a href="#" class="nav-link">White</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">Cheap</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">Mobile</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">Modern</a>
                </li>
              </ul>
            </div>
            <div class="widget-product-brands pt-3">
              <h5 class="widget-title">Brands</h5>
              <ul class="product-tags sidebar-list list-unstyled">
                <li class="tags-item">
                  <a href="#" class="nav-link">Apple</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">Samsung</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">Huwai</a>
                </li>
              </ul>
            </div>
            <div class="widget-price-filter pt-3">
              <h5 class="widget-titlewidget-title">Filter By Price</h5>
              <ul class="product-tags sidebar-list list-unstyled">
                <li class="tags-item">
                  <a href="#" class="nav-link">Less than $10</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">$10- $20</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">$20- $30</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">$30- $40</a>
                </li>
                <li class="tags-item">
                  <a href="#" class="nav-link">$40- $50</a>
                </li>
              </ul>
            </div>
          </div>
        </aside>

        <main class="col-md-10">
          <div class="filter-shop d-flex justify-content-between">
            <div class="showing-product">
              <p>Showing 1–9 of 55 results</p>
            </div>
            <div class="sort-by">
              <select id="input-sort" class="form-control" data-filter-sort="" data-filter-order="">
                <option value="">Default sorting</option>
                <option value="">Name (A - Z)</option>
                <option value="">Name (Z - A)</option>
                <option value="">Price (Low-High)</option>
                <option value="">Price (High-Low)</option>
                <option value="">Rating (Highest)</option>
                <option value="">Rating (Lowest)</option>
                <option value="">Model (A - Z)</option>
                <option value="">Model (Z - A)</option>
              </select>
            </div>
          </div>
<!-- Product Code is here -->

         <div class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
                
                <?php
                // print_r($result);
                // print_r($result['records']);
                   for($i=0; $i<sizeof($resultProduct->records);$i++)
                    { //print_r($result->records[$i]);
                ?>
                  <div class="col">
                  <form id="cart" class="form-group flex-wrap" action="admin/action/addcart_post.php" method="POST">
                  <div class="product-item">
                      <!-- <span class="badge bg-success position-absolute m-3"> -->
                      <input type="hidden" name="userId" value="<?php echo $_SESSION['user']; ?>">
                        <input type="hidden" name="price" value="<?php echo $resultProduct->records[$i]->price;?>">
                        <!-- Box -->
                      <!-- </span> -->
                      <!-- <a href="#" class="btn-wishlist"><svg width="24" height="24">
                          <use xlink:href="#heart"></use>
                        </svg></a> -->
                      <figure>
                        <a href="products.php" title="Product Title">
                          <img src="sellar/productimages/<?php echo $resultProduct->records[$i]->skuId;?>/<?php echo $resultProduct->records[$i]->skuId;?>1.png" alt="Product Thumbnail" class="tab-image">

                        </a>
                      </figure>
                      <h3><?php echo $resultProduct->records[$i]->productName;?></h3>
                      <input type="hidden" name="productId" value="<?php echo $resultProduct->records[$i]->id;?>">
                      <span class="qty"><?php echo $resultProduct->records[$i]->counterName;?></span>
                      <span class="rating"><svg width="24" height="24"
                          class="text-primary">
                          <use xlink:href="#star-solid"></use>
                        </svg>Left Item(<?php echo $resultProduct->records[$i]->quantity;?>)</span>
                      <span class="price"><?php echo $resultProduct->records[$i]->price;?></span>
                      <div class="d-flex align-items-center justify-content-between">
                      <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number text-center"
                      value="1">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <?php 
                  if($resultProduct->records[$i]->quantity>0)
                  {
                    ?>
                    <button type="submit" class="nav-link">Add to Cart <svg width="18" height="18">
                    <use xlink:href="#cart"></use>
                  </svg></button>
                 <?php } 
                 else {

                 ?>
                 
                  Out of Stock
                  
                 <?php 
                 }
?>
                      </div>
                    </div>
                  </div>
                  </form> 
                <?php
               }
              ?>
                                           
                </div>
                

      







          <!-- / product-grid -->

          <nav class="text-center py-4" aria-label="Page navigation">
            <ul class="pagination d-flex justify-content-center">
              <li class="page-item disabled">
                <a class="page-link bg-none border-0" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item active" aria-current="page"><a class="page-link border-0" href="#">1</a></li>
              <li class="page-item"><a class="page-link border-0" href="#">2</a></li>
              <li class="page-item"><a class="page-link border-0" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link border-0" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>

        </main>

      </div>
    </div>
  </div>
  <?php include 'includes/newsletter.php'; ?>
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/copyright.php'; ?>

</html>