<!DOCTYPE html>
<html lang="en">
<?php include 'includes/header.php'; ?>
<body>
  <?php include 'includes/svg.php' ?>

  <?php include 'includes/preloader.php' ?>

  <?php include 'includes/global-cart.php' ?>
  <header>
    <div class="container-fluid">
      <?php include 'includes/search.php' ?>
    </div>
    <?php include 'includes/menu.php' ?>
  </header>

  <section class="py-3"
    style="background-image: url('images/background-pattern.jpg');background-repeat: no-repeat;background-size: cover;">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">

          <div class="banner-blocks">

            <div class="banner-ad large bg-info block-1">

              <div class="swiper main-swiper">
                <div class="swiper-wrapper">

                  <div class="swiper-slide">
                    <div class="row banner-content p-5">
                      <div class="content-wrapper col-md-7">
                        <div class="categories my-3">500% natural</div>
                        <h3 class="display-4">Fresh Smoothie & Summer Juice</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim massa diam elementum.</p>
                        <a href="shop.php"
                          class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">Shop Now</a>
                      </div>
                      <div class="img-wrapper col-md-5">
                        <img src="images/product-thumb-1.png" alt="Product Thumbnail" class="img-fluid">
                      </div>
                    </div>
                  </div>

                  <div class="swiper-slide">
                    <div class="row banner-content p-5">
                      <div class="content-wrapper col-md-7">
                        <div class="categories mb-3 pb-3">100% natural</div>
                        <h3 class="banner-title">Fresh Smoothie & Summer Juice</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim massa diam elementum.</p>
                        <a href="shop.php" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">Shop
                          Collection</a>
                      </div>
                      <div class="img-wrapper col-md-5">
                        <img src="images/product-thumb-1.png" alt="Product Thumbnail" class="img-fluid">
                      </div>
                    </div>
                  </div>

                  <div class="swiper-slide">
                    <div class="row banner-content p-5">
                      <div class="content-wrapper col-md-7">
                        <div class="categories mb-3 pb-3">100% natural</div>
                        <h3 class="banner-title">Heinz Tomato Ketchup</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim massa diam elementum.</p>
                        <a href="shop.php" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">Shop
                          Collection</a>
                      </div>
                      <div class="img-wrapper col-md-5">
                        <img src="images/product-thumb-2.png" alt="Product Thumbnail" class="img-fluid">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="swiper-pagination"></div>

              </div>
            </div>

            <div class="banner-ad bg-success-subtle block-2"
              style="background:url('images/ad-image-1.png') no-repeat;background-position: right bottom">
              <div class="row banner-content p-5">

                <div class="content-wrapper col-md-7">
                  <div class="categories sale mb-3 pb-3">20% off</div>
                  <h3 class="banner-title">Fruits & Vegetables</h3>
                  <a href="shop.php" class="d-flex align-items-center nav-link">Shop Collection <svg width="24"
                      height="24">
                      <use xlink:href="#arrow-right"></use>
                    </svg></a>
                </div>

              </div>
            </div>

            <div class="banner-ad bg-danger block-3"
              style="background:url('images/ad-image-2.png') no-repeat;background-position: right bottom">
              <div class="row banner-content p-5">

                <div class="content-wrapper col-md-7">
                  <div class="categories sale mb-3 pb-3">15% off</div>
                  <h3 class="item-title">Baked Products</h3>
                  <a href="#" class="d-flex align-items-center nav-link">Shop Collection <svg width="24" height="24">
                      <use xlink:href="#arrow-right"></use>
                    </svg></a>
                </div>

              </div>
            </div>
          </div>
          <!-- / Banner Blocks -->

        </div>
      </div>
    </div>
  </section>

  <!-- read arrival here code -->
  <?php include 'includes/products/newly-arrived.php'; ?>
  <?php include 'includes/products/trending.php'; ?>
  <?php include 'includes/products/best-selling.php'; ?>
  <?php include 'includes/newsletter.php'; ?>
  <?php include 'includes/products/popular.php'; ?>
  <?php include 'includes/products/latest.php'; ?>
  <?php include 'includes/blog.php'; ?>
  <?php include 'includes/app.php'; ?>
  <?php include 'includes/tags.php'; ?>
  <?php include 'includes/service.php'; ?>
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/copyright.php'; ?>

</body>

</html>