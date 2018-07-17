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
        <?php

        if(isset($_GET['id'])){
            $id_transaksi = $_GET['id'];
        }

        ?>

        <h1 class="mb-3" style="margin-top: 4%;">Detail Transaction </h1>
        <h4 class="text-center">(ID #<?php echo $id_transaksi; ?>)</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card-body">
                    <div class="table-responsive text-center">
                        <table class="table table-bordered" id="dataTable" cellspacing="0" style="width: 80%; margin: 0 10% 0;">
                            <thead>
                                <tr>
                                    <th width="30%">Nama Buku</th>
                                    <th width="15%">Kategori</th>
                                    <th width="15%">Pengarang</th>
                                    <th width="15%">Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if(isset($_GET['id'])){
                                    $total = 0;
                                    $sql=mysql_query("SELECT * FROM tb_produk, tb_transaksi WHERE tb_produk.id_produk=tb_transaksi.id_produk AND id_transaksi='$id_transaksi'");
                                    while ($data=mysql_fetch_array($sql)) {
                                ?>
                                <tr>
                                    <td><?php echo $data['nama_buku']; ?></td>
                                    <td>
                                    <?php 
                                    $id_kategori = $data['id_kategori'];
                                    $kate=mysql_query("SELECT * FROM tb_kategori WHERE id_kategori='$id_kategori'");
                                    $gori=mysql_fetch_array($kate);
                                    echo $gori['nama_kategori']; 
                                    ?>
                                    </td>
                                    <td><?php echo $data['pengarang']; ?></td>
                                    <td><?php echo number_format($data['harga'])  ?></td>
                                </tr>
                                <?php
                                    $total = $total + $data["harga"];
                                    }

                                ?>
                                <tr>
                                    <td colspan="3">Total</td>
                                    <td >Rp. <?php echo number_format($total, 2); ?></td>
                                </tr>
                                <?php
                                }
                                
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <h4 class="mb-3 text-center" style="margin-top: 2%;">Tata Cara Pembayaran</h4>
                <p class="text-center">Silahkan melakukan pembayaran dengan mentransfer ke rekening di bawah ini :</p>
                <div class="col-lg-12 col-md-12 mb-4 text-center" style="width: 40%;margin-left: 30%; margin-right: 30%;">
                    <div class="card text-center">
                        <div class="card-body">
                            <p><b>Bank BRI</b><br>
                            0123 01 001002 502<br>
                            (a.n Toko Buku Murah)<br>
                            </p>
                        </div>
                    </div>
                </div>
                <p class="text-center">Dengan memasukkan 3 digit terakhir kode unik id transaksi (#<?php echo "$id_transaksi"; ?>) di 3 digit terakhir nominal transfer seperti berikut ini :</p>
                <div class="col-lg-12 col-md-12 mb-4 text-center" style="width: 20%;margin-left: 40%; margin-right: 40%;">
                    <div class="card text-center">
                        <div class="card-body">
                        <?php
                        $total_first = substr($total, 0, (strlen($total)-3));
                        $kode_unik = substr($id_transaksi, (strlen($id_transaksi)-3));
                        $total_price = $total_first.$kode_unik;

                        ?>
                            <h5><b>Rp. <?php echo number_format($total_price); ?></b></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <a style="width: 10%; margin-bottom: 5%;" class="btn btn-info text-center" href="my-transaction.php" >Back</a>
                </div>
            </div>
        </div>
        
    </div>

    <?php include 'footer.php'; ?>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>