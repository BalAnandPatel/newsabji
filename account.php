<!DOCTYPE html>
<html lang="en">

<head>
  <?php include 'includes/header.php' ?>
</head>

<body>
  <?php include 'includes/svg.php' ?>


<?php include 'includes/preloader.php' ?>

  <?php include 'includes/global-cart.php' ?>
  <header>
    <div class="container-fluid">
      <?php include 'includes/search.php' ?>
    </div>

  </header>


  <section class="py-5 mb-5" style="background: url(images/background-pattern.jpg);">
    <div class="container-fluid">
      <?php include 'includes/breadcrumb.php' ?>
    </div>
    <div class="container-sm">
      <div class="row justify-content-center">
        <div class="col-lg-4 p-5 bg-white border shadow-sm">
          <h5 class="text-uppercase mb-4">Login</h5>
          <?php
          //echo $_SESSION["registration"]; 
         // $_SESSION["registration"]="";
          
          ?>
          <form id="form" class="form-group flex-wrap" action="admin/action/login_post.php" method="POST">
            <div class="col-12 pb-3">
              <label class="d-none">Username or email address *</label>
              <input type="text" name="email" placeholder="Username / email" class="form-control">
            </div>
            <div class="col-12 pb-3">
              <label class="d-none">Password *</label>
              <input type="password" name="password" placeholder="Password" class="form-control">
            </div>
            <div class="col-12 pb-3">
              <label>
                <input type="checkbox">
                <span class="label-body">Remember me</span>
                
              </label>
            </div>
            <div class="col-12">
              <button type="submit" name="submit" class="btn btn-primary text-uppercase w-100">Log in</button>
              <p><a href="forgot-password.php">Lost your password?</a></p>
              <span class="label-body"><a href="userReg.php">New Account Create</a></span>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <?php include 'includes/footer.php' ?>
  <?php include 'includes/copyright.php' ?>
</body>

</html>