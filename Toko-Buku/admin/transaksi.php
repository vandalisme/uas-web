<div class="container">

    <h1 class="mt-4 mb-3">Manage Transaksi</h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">manage</a>
        </li>
        <li class="breadcrumb-item active"><?php echo $page;?></li>
    </ol>

    <div class="row">
	        <div class="col-md-12">
	            <div class="card-body">
	                <div class="table-responsive text-center">
	                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                        <thead>
	                            <tr>
	                                <th width="5%">No.</th>
	                                <th width="15%">ID Transaksi</th>
	                                <th width="15%">Tanggal Transaksi</th>
	                                <th width="25%">Nama Pelanggan</th>
	                                <th>Jumlah Buku</th>
	                                <th>Total</th>
	                                <th width="10%">&nbsp;Action&nbsp;</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <?php
	                            $sql=mysql_query("SELECT * FROM tb_transaksi GROUP BY id_transaksi ORDER BY tanggal_transaksi DESC");
	                            $no=1;
	                            while($data=mysql_fetch_array($sql)){
	                                $id_transaksi = $data['id_transaksi'];
	                                $count = mysql_query("SELECT *, count(id_transaksi), sum(harga) FROM tb_transaksi, tb_produk, tb_user WHERE tb_transaksi.id_produk=tb_produk.id_produk AND tb_transaksi.id_user=tb_user.id AND id_transaksi='$id_transaksi'");
	                                $c = mysql_fetch_array($count);
	                            ?>
	                            <tr>
	                                <td><?php echo $no; ?></td>
	                                <td><?php echo $data['id_transaksi']; ?></td>
	                                <td><?php echo $data['tanggal_transaksi']; ?></td>
	                                <td><?php echo $c['nama']; ?></td>
	                                <td><?php echo $c['count(id_transaksi)']; ?></td>
	                                <td>Rp. <?php echo number_format($c['sum(harga)'], 2); ?></td>
	                                <td>
	                                    <a class="btn btn-primary" href="detail-transaction.php?id=<?php echo $data['id_transaksi'];?>&nama=<?php echo $c['nama'];?>">
	                                        <i class="glyphicon glyphicon-pencil"></i>Detail
	                                    </a>
	                                </td>
	                            </tr>
	                            <?php 
	                            $no++;
	                            } ?>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>
        
    </div>
</div>