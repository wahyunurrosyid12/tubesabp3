import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/edit_data.dart';
import 'package:flutter_application_1/screens/tambah_data.dart';
import '../dummy_data.dart';
import '../widgets/chat_item.dart';
import 'package:http/http.dart' as http;

class dataScren extends StatefulWidget {
  const dataScren({Key? key}) : super(key: key);
  @override
  State<dataScren> createState() => _namestate();
}

class _namestate extends State<dataScren> {
  List _listdata = [];
  //Fungsi untuk read data
  Future _getdata() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.62.80.22/flutterApi/crudFlutter/read.php'));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6FF),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          title: Text("Data Buku")),
      body: ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          String imageUrl = 'https://www.pngplay.com/wp-content/uploads/12/Clip-Art-Books-PNG-HD-Quality.png';
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditData(
                            Listdata: {
                              "id_buku": _listdata[index]['id_buku'],
                              "kode_buku": _listdata[index]['kode_buku'],
                              "judul": _listdata[index]['judul'],
                              "pengarang": _listdata[index]['pengarang'],
                              "kategori": _listdata[index]['kategori'],
                            },
                          )),
                );
              },

              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
                title: Text(
                  _listdata[index]['judul'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_listdata[index]['pengarang']),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            "+",
            style: TextStyle(fontSize: 32),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahData()),
            );
          }),
    );
  }
}
// class dataScren extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat Imo'),
//         backgroundColor:Color(0xff0d0140),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//              Navigator.push(
//               context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//             );
//           },
//         ),
//       ),
//       body: GridView(
//         padding: const EdgeInsets.all(25),
//         children: DUMMY_CHAT
//             .map(
//               (catData) => ChatItem(
//                     catData.id,
//                     catData.title,
//                     catData.subtitle,
//                     catData.time,
//                   ),
//             )
//             .toList(),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 600,
//           childAspectRatio: 8/2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 10,

//         ),
//       ),
//     );
//   }
// }
