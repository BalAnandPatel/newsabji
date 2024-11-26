<?php
include 'includes/header.php';
$userId=$_SESSION['user'];
// $request_headers = [
//   'Authorization:' . $jwt
// ];
include "constant.php";
$id="192";
$url = $URL . "product/readproductById.php";
//$url="http://localhost/onlinesabjimandiapi/api/src/category/readCategory.php";
$data = array("id"=>$id,"userId"=>$userId); 
//print_r($data);
$postdata = json_encode($data);
$client = curl_init();
curl_setopt( $client, CURLOPT_URL,$url);
//curl_setopt( $client, CURLOPT_HTTPHEADER,  $request_headers);
curl_setopt($client, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($client, CURLOPT_POST, 5);
curl_setopt($client, CURLOPT_POSTFIELDS, $postdata);
$response = curl_exec($client);
print_r($response);
$resultsiglepro = json_decode($response);
//print_r($resultsiglepro);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php include 'includes/header.php' ?>
</head>

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
  <form id="cart" class="form-group flex-wrap" action="admin/action/addcart_post.php" method="POST">
  <?php
                // print_r($result);
                //print_r($result['records']);
                for($i=0; $i<sizeof($resultsiglepro->records);$i++)
                { //print_r($result->records[$i]);
                ?>
  <section id="selling-product" class="single-product mt-0 mt-md-5">
    <div class="container-fluid">
      <nav class="breadcrumb">
        <a class="breadcrumb-item" href="#">Home</a>
        <a class="breadcrumb-item" href="#">Pages</a>
        <span class="breadcrumb-item active" aria-current="page">Single Product</span>
      </nav>
      <div class="row g-5">
        <div class="col-lg-7">
          <div class="row flex-column-reverse flex-lg-row">
            <div class="col-md-12 col-lg-2">
              <!-- product-thumbnail-slider -->
              <div class="swiper product-thumbnail-slider">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <img src="sellar/productimages/<?php echo $resultsiglepro->records[$i]->skuId;?>/<?php echo $resultsiglepro->records[$i]->skuId;?>1.png" alt="" class="thumb-image img-fluid">
                  </div>
                  
                </div>
              </div>
              <!-- / product-thumbnail-slider -->
            </div>
           
            <div class="col-md-12 col-lg-10">
              <!-- product-large-slider -->
              <div class="swiper product-large-slider">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <div class="image-zoom" data-scale="2.5" data-image="images/product-large-1.jpg">
                      <img src="sellar/productimages/<?php echo $resultsiglepro->records[$i]->skuId;?>/<?php echo $resultsiglepro->records[$i]->skuId;?>1.png" alt="product-large" class="img-fluid"></div>
                  </div>
                 
                </div>
                <div class="swiper-pagination"></div>
              </div>
              <!-- / product-large-slider -->
            </div>
          </div>
        </div>
       
        <div class="col-lg-5">
          <div class="product-info">
            <div class="element-header">
              <h2 itemprop="name" class="display-6"><?php echo $resultsiglepro->records[$i]->name;?></h2>
              <div class="rating-container d-flex gap-0 align-items-center">
                <div class="rating" data-rating="1">
                  <!-- Product Description -->
                </div>
                
                  
            </div>
            <div class="product-price pt-3 pb-3">
              <strong class="text-primary display-6 fw-bold">$<?php echo $resultsiglepro->records[$i]->price;?></strong>
              <del class="ms-2">$<?php echo $resultsiglepro->records[$i]->discount;?></del>
            </div>
            <p><?php echo $resultsiglepro->records[$i]->name;?></p>
            <div class="cart-wrap py-5">
              <!-- <div class="color-options product-select">
                <div class="color-toggle" data-option-index="0">
                  <h6 class="item-title text-uppercase text-dark">Color:</h6>
                  <ul class="select-list list-unstyled d-flex">
                    <li class="select-item pe-3" data-val="Green" title="Green">
                      <a href="#" class="btn btn-light active"><?php //echo $resultsiglepro->records[$i]->color;?></a>
                    </li>
                    
                  </ul>
                </div>
              </div> -->
              <!-- <div class="swatch product-select" data-option-index="1">
                <h6 class="item-title text-uppercase text-dark">Size:</h6>
                <ul class="select-list list-unstyled d-flex">
                  <li data-value="S" class="select-item pe-3">
                    <a href="#" class="btn btn-light">XL</a>
                  </li>
                  <li data-value="M" class="select-item pe-3">
                    <a href="#" class="btn btn-light">L</a>
                  </li>
                  <li data-value="L" class="select-item pe-3">
                    <a href="#" class="btn btn-light">M</a>
                  </li>
                  <li data-value="L" class="select-item">
                    <a href="#" class="btn btn-light">S</a>
                  </li>
                </ul>
              </div> -->
              <div class="product-quantity pt-3">
                <div class="stock-number text-dark"><?php echo $resultsiglepro->records[$i]->quantity;?> in stock</div>
                <div class="stock-button-wrap">

                  <div class="input-group product-sqty" style="max-width: 150px;">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-light btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number text-center"
                      value="1" min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-light btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <div class="qty-button d-flex flex-wrap pt-3">
                    <button type="submit" class="btn btn-primary py-3 px-4 text-uppercase me-3 mt-3">Buy now</button>
                    
                      <input type="hidden" name ="productId" value="<?php echo $resultsiglepro->records[$i]->id;?>">
                      <input type="hidden" name ="userId" value="<?php echo $userId;?>">
                      <input type="hidden" name ="price" value="<?php echo $resultsiglepro->records[$i]->price;?>">
                      <input type="hidden" name ="skuId" value="<?php echo $resultsiglepro->records[$i]->skuId;?>">
                      <button type="submit" name="add-to-cart" value="126s9" class="btn btn-dark py-3 px-4 text-uppercase mt-3">Add to cart</button>
                      
                  </div>
                </div>
              </div>
            </div>
            <div class="meta-product py-2">
              <div class="meta-item d-flex align-items-baseline">
                <h6 class="item-title no-margin pe-2">SKU:</h6>
                <ul class="select-list list-unstyled d-flex">
                  <li data-value="S" class="select-item">1223</li>
                </ul>
              </div>
              <div class="meta-item d-flex align-items-baseline">
                <h6 class="item-title no-margin pe-2">Category:</h6>
                <ul class="select-list list-unstyled d-flex">
                  <li data-value="S" class="select-item">
                    <a href="#">Watch</a>,
                  </li>
                  <li data-value="S" class="select-item">
                    <a href="#"> Screen touch</a>,
                  </li>
                </ul>
              </div>
              <div class="meta-item d-flex align-items-baseline">
                <h6 class="item-title no-margin pe-2">Tags:</h6>
                <ul class="select-list list-unstyled d-flex">
                  <li data-value="S" class="select-item">
                    <a href="#">Classic</a>,
                  </li>
                  <li data-value="S" class="select-item">
                    <a href="#"> Modern</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>



      </div>
    </div>
  </section>

  <section class="product-info-tabs py-5">
    <div class="container-fluid">
      <div class="row">
        <div class="d-flex flex-column flex-md-row align-items-start gap-5">
          <div class="nav flex-row flex-wrap flex-md-column nav-pills me-3 col-lg-3" id="v-pills-tab" role="tablist"
            aria-orientation="vertical">
            <button class="nav-link text-start active" id="v-pills-description-tab" data-bs-toggle="pill"
              data-bs-target="#v-pills-description" type="button" role="tab" aria-controls="v-pills-description"
              aria-selected="true">Description</button>
            <button class="nav-link text-start" id="v-pills-additional-tab" data-bs-toggle="pill"
              data-bs-target="#v-pills-additional" type="button" role="tab" aria-controls="v-pills-additional"
              aria-selected="false">Additional Information</button>
            <button class="nav-link text-start" id="v-pills-reviews-tab" data-bs-toggle="pill"
              data-bs-target="#v-pills-reviews" type="button" role="tab" aria-controls="v-pills-reviews"
              aria-selected="false">Customer Reviews</button>
          </div>
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-description" role="tabpanel"
              aria-labelledby="v-pills-description-tab" tabindex="0">
              <h5>Product Description</h5>
              <p><?php echo $resultsiglepro->records[$i]->description;?></p>
             
          </div>
        </div>
      </div>
    </div>
  </section>
  <?php
 }

?>
</form>

  <section id="related-products" class="product-store position-relative py-5">
    <div class="container-fluid">

      <div class="row">
        <div class="col-md-12">

          <div class="section-header d-flex justify-content-between my-5">

            <h2 class="section-title">Related Products</h2>

            <div class="d-flex align-items-center">
              <div class="swiper-buttons">
                <button class="swiper-prev products-carousel-prev btn btn-primary">❮</button>
                <button class="swiper-next products-carousel-next btn btn-primary">❯</button>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="row">
        <div class="col-md-12">

          <div class="products-carousel swiper">
            <div class="swiper-wrapper">

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-tomatoes.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-tomatoketchup.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-bananas.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-bananas.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>
              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-tomatoes.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-tomatoketchup.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-bananas.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

              <div class="product-item swiper-slide">
                <a href="#" class="btn-wishlist"><svg width="24" height="24">
                    <use xlink:href="#heart"></use>
                  </svg></a>
                <figure>
                  <a href="product-single.html" title="Product Title">
                    <img src="images/thumb-bananas.png" class="tab-image">
                  </a>
                </figure>
                <h3>Sunstar Fresh Melon Juice</h3>
                <span class="qty">1 Unit</span><span class="rating"><svg width="24" height="24" class="text-primary">
                    <use xlink:href="#star-solid"></use>
                  </svg> 4.5</span>
                <span class="price">$18.00</span>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="input-group product-qty">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#minus"></use>
                        </svg>
                      </button>
                    </span>
                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="10"
                      min="1" max="100">
                    <span class="input-group-btn">
                      <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus"
                        data-field="">
                        <svg width="16" height="16">
                          <use xlink:href="#plus"></use>
                        </svg>
                      </button>
                    </span>
                  </div>
                  <a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                </div>
              </div>

            </div>
          </div>
          <!-- / products-carousel -->

        </div>
      </div>

    </div>
  </section>

  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/copyright.php'; ?>
</body>

</html>