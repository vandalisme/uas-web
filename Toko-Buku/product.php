<?php
session_start();

include "config.php";

if(isset($_SESSION['id'])){
    $id_user = $_SESSION['id'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <?php include 'title.php'; ?>

    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <?php include 'header.php'; ?>

    <div class="container">

        <?php include 'search.php'; ?>

        <!-- <img src="images/banner.jpg" style="height: 100%; width: 80%; margin-left: 10%; margin-right: 10%"> -->

        <?php include 'product-all.php'; ?>

        <?php include 'cart.php'; ?>
        
    </div>

    <?php include 'footer.php'; ?>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>