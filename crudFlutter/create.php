<?php
$conn=new mysqli("localhost","root","","coba_api");
$kode_buku=$_POST["kode_buku"];
$judul=$_POST["judul"];
$pengarang=$_POST["pengarang"];
$kategori=$_POST["kategori"];
$data=mysqli_query($conn, "Insert into buku set kode_buku='$kode_buku', judul='$judul', pengarang='$pengarang', kategori='$kategori'");
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