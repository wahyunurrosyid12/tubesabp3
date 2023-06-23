<?php
$conn=new mysqli("localhost","root","","coba_api");
$id_buku=$_POST["id_buku"];
$data=mysqli_query($conn, "delete from buku where id_buku='$id_buku'");
if (condition) {
    echo json_encode([
        'pesan'=>'sukses'
    ]);
} else {
    echo json_encode([
        'pesan'=>'gagal'
    ]);
}
?>