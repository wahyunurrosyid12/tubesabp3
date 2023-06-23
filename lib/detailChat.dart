import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';

class detailChat extends StatelessWidget {
  const detailChat({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:Color(0xFFF1E6FF),
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor:Color(0xFF6F35A5),
        leading:InkWell(
          onTap: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 5,),
              CircleAvatar(
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Intan", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Text('Online', style:TextStyle(fontSize: 14),),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    // color:Colors.grey,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF6F35A5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        padding:EdgeInsets.all(15),
                          child:Text(
                            "Lagi apa, Jalan yok lama ga jalan bareng",
                            style: TextStyle(color: Colors.white),
                          ),
                       ),
                       SizedBox(height: 5,),
                       Text("19:10 PM"),
                     ],
                    ),
                    alignment: Alignment.centerRight,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 1000,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.emoji_emotions_outlined),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF6F35A5),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
        
      )
    );
  }
}

