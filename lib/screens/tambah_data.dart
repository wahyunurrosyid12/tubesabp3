import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/screens/list_data.dart';
import 'package:http/http.dart' as http;
class TambahData extends StatefulWidget {
  const TambahData ({Key? key}):super(key: key);
  @override
  State<TambahData> createState()=> _TambahDatastate();
}
class _TambahDatastate extends State<TambahData>{
  final formKey = GlobalKey<FormState>();
  TextEditingController kode_buku=TextEditingController();
  TextEditingController judul=TextEditingController();
  TextEditingController kategori=TextEditingController();
  TextEditingController pengarang=TextEditingController();
  //Fungsi Post data
  _resetForm(){
    kode_buku.clear();
    judul.clear();
    kategori.clear();
    pengarang.clear();
  }
  Future _simpan() async {
    final response=await http.post(
          Uri.parse('http://10.62.80.22/flutterApi/crudFlutter/create.php'),
          body: {
            "kode_buku":kode_buku.text,
            "judul":judul.text,
            "kategori":kategori.text,
            "pengarang":pengarang.text,
          }
        );
        if(response.statusCode==200){
          print('Data Berhasil di simpan');
          return true;
        }
        return false;
  }
  @override
  Widget build(BuildContext context) {
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
          title: Text("Tambah Data")
      ),
      backgroundColor:Color(0xFFF1E6FF),
      body: 
      ListView(
        children: [
           Form(
        key: formKey ,
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Kode Buku", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
            SizedBox(height: 10,),
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
                  hintStyle: textTextStyle.copyWith(fontSize: 12, color: textCollor.withOpacity(0.6)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Kode Buku Tidak Boleh kosong";
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Text("Nama Buku", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
            SizedBox(height: 10,),
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
                  hintStyle: textTextStyle.copyWith(fontSize: 12, color: textCollor.withOpacity(0.6)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Nama Buku Tidak Boleh kosong";
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Text("Kategori Buku", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
            SizedBox(height: 10,),
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
                  hintStyle: textTextStyle.copyWith(fontSize: 12, color: textCollor.withOpacity(0.6)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Kategori Buku Tidak Boleh kosong";
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Text("Nama Pengarang", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
            SizedBox(height: 10,),
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
                  hintStyle: textTextStyle.copyWith(fontSize: 12, color: textCollor.withOpacity(0.6)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Nama Pengarang Tidak Boleh kosong";
                  }
                },
              ),
            ),
            SizedBox(height: 40,),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20,),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textCollor
                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            _simpan().then((value){
                              if(value){
                                final snackBar=SnackBar(content: const Text("Data Berhasil disimpan!"));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                _resetForm();
                              }else{
                                final snackBar=SnackBar(content: const Text("Data Gagal disimpan!"));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          }
                        }, 
                        child: Text("TAMBAH DATA", style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: bold),)),
                    ),
          ],
        ),
      )),
        ],
      )
     
    );
  }
}