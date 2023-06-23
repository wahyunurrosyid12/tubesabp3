<?php
$conn=new mysqli("localhost","root","","coba_api");
$id_buku=$_POST["id_buku"];
$kode_buku=$_POST["kode_buku"];
$judul=$_POST["judul"];
$pengarang=$_POST["pengarang"];
$kategori=$_POST["kategori"];
$data=mysqli_query($conn, "update buku set kode_buku='$kode_buku', judul='$judul', pengarang='$pengarang', kategori='$kategori' where id_buku='$id_buku'");
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