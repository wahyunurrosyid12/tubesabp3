import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/detailChat.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;


// class chatdart extends StatefulWidget {
//   const chatdart ({Key? key}):super(key: key);
//   @override
//   State<chatdart> createState()=> _namestate();
// }
// class _namestate extends State<chatdart>{
//   List _listdata=[];
//   Future _getdata () async{
//       try{
//         final response=await http.get(
//           Uri.parse('http://172.20.10.1/flutterApi/crudFlutter/read.php')
//         );
//         if(response.statusCode==200){
//           print(response.body);
//           final data=jsonDecode(response.body);
//           setState((){
//             _listdata=data;
//           });
//         }
//       }catch (e){}
//     }
//   @override
//   void initState(){
//     _getdata();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context){
//     return Container();
//   }
// }

class ChatItem extends StatelessWidget {
  final String id;
  final String title;
  final String subtitle;
  final String time;

  ChatItem(this.id, this.title, this.subtitle, this.time );
  



@override
 Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:Color(0xFFF1E6FF),
      body: Container(
      height: 200, 
      //Atur tinggi sesuai kebutuhan
        child:ListView(
              children: [
                ListTile(
                  title: Text(title),
                  subtitle: Text(subtitle),
                  leading: CircleAvatar(),
                  trailing: Text(time),
                  onTap: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => detailChat()),
                    );
                  },
                ),
              ],
            
        ),
      ),
    );
  }
}

