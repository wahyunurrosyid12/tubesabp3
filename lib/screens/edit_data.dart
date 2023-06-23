import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/screens/list_data.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final Map Listdata;
  const EditData({Key? key, required this.Listdata}) : super(key: key);
  @override
  State<EditData> createState() => _EditDatastate();
}

class _EditDatastate extends State<EditData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id_buku = TextEditingController();
  TextEditingController kode_buku = TextEditingController();
  TextEditingController judul = TextEditingController();
  TextEditingController kategori = TextEditingController();
  TextEditingController pengarang = TextEditingController();
  //Fungsi Post data
  //Edit data
  Future _ubah_data() async {
    final response = await http.post(
        Uri.parse('http://10.62.80.22/flutterApi/crudFlutter/edit.php'),
        body: {
          "id_buku": id_buku.text,
          "kode_buku": kode_buku.text,
          "judul": judul.text,
          "kategori": kategori.text,
          "pengarang": pengarang.text,
        });
    if (response.statusCode == 200) {
      print('Data Berhasil diubah');
      print(response);
      return true;
    }
    return false;
  }

  Future _hapus_data() async {
    final response = await http.post(
        Uri.parse('http://10.62.80.22/flutterApi/crudFlutter/hapus.php'),
        body: {
          "id_buku": id_buku.text,
        });
    if (response.statusCode == 200) {
      print('Data Berhasil diubah');
      print(response);
      return true;
    }
    return false;
  }

  void showDeleteAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin menghapus data?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup alert dialog
              },
            ),
            TextButton(
              child: Text('Hapus'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _hapus_data().then((value) {
                    if (value) {
                      final snackBar = SnackBar(
                          content: const Text("Data Berhasil dihapus!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => dataScren()),
                        );
                      });
                    } else {
                      final snackBar =
                          SnackBar(content: const Text("Data Gagal dihapus!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //untuk menampilkan data pada edit data
    id_buku.text = widget.Listdata['id_buku'];
    kode_buku.text = widget.Listdata['kode_buku'];
    judul.text = widget.Listdata['judul'];
    kategori.text = widget.Listdata['kategori'];
    pengarang.text = widget.Listdata['pengarang'];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dataScren()),
              );
            },
          ),
          title: Text("Edit Data"),
        ),
        backgroundColor: Color(0xFFF1E6FF),
        body: ListView(
          children: [
            Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Kode Buku",
                        style: textTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteCollor,
                        ),
                        child: TextFormField(
                          controller: kode_buku,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Kode Buku",
                            hintStyle: textTextStyle.copyWith(
                                fontSize: 12,
                                color: textCollor.withOpacity(0.6)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Kode Buku Tidak Boleh kosong";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Nama Buku",
                        style: textTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteCollor,
                        ),
                        child: TextFormField(
                          controller: judul,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nama Buku",
                            hintStyle: textTextStyle.copyWith(
                                fontSize: 12,
                                color: textCollor.withOpacity(0.6)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nama Buku Tidak Boleh kosong";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Kategori Buku",
                        style: textTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteCollor,
                        ),
                        child: TextFormField(
                          controller: kategori,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Kategori Buku",
                            hintStyle: textTextStyle.copyWith(
                                fontSize: 12,
                                color: textCollor.withOpacity(0.6)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Kategori Buku Tidak Boleh kosong";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Nama Pengarang",
                        style: textTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteCollor,
                        ),
                        child: TextFormField(
                          controller: pengarang,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nama Pengarang",
                            hintStyle: textTextStyle.copyWith(
                                fontSize: 12,
                                color: textCollor.withOpacity(0.6)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nama Pengarang Tidak Boleh kosong";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: textCollor),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _ubah_data().then((value) {
                                  if (value) {
                                    final snackBar = SnackBar(
                                        content: const Text(
                                            "Data Berhasil diubah!"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    final snackBar = SnackBar(
                                        content:
                                            const Text("Data Gagal diubah!"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Simpan Perubahan",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: bold),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: textButtonRegisterCollor),
                            onPressed: () {
                              showDeleteAlertDialog(context);
                            },
                            child: Text(
                              "Hapus Data Buku",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: bold),
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
