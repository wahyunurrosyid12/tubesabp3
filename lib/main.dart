import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/screens/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: LoginPage(),
    );
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor:Color(0xFFF1E6FF),
    body: Center(
     child:Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Selamat Datang", style:secondTextStyle.copyWith(fontSize: 30, fontWeight: bold),),
                    SizedBox(height: 11,),
                    //Text("Aplikasi ini adalah Aplikasi Flutter Buatan Wahyu Nurrosyid 1301218690 dengan refrensi Youtube", style: greyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center,),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Email", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteCollor,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "wahyunurrosyid0@gmail.com",
                              hintStyle: textTextStyle.copyWith(fontSize: 12, color: textCollor.withOpacity(0.6)),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 11,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password", style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteCollor,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: greyCollor,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("Remember me", style: greyTextStyle.copyWith(fontSize: 12, ),)
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Register');
                          },
                          child: Text(
                            'Lupa Password',
                            style: textTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dataScren()),
                          );
                        }, 
                        child: Text("LOGIN", style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: bold),)),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical:19),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greyCollor
                        ),
                        onPressed: (){}, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png", height: 20,),
                              SizedBox(width: 11,),
                              Text("LOGIN DENGAN GOOGLE", style: textTextStyle.copyWith(fontSize: 14, fontWeight: bold),),
                            ],
                          )
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Anda Belum Memiliki Akun?", style: secondTextStyle.copyWith(fontSize: 12),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            print('Register');
                          },
                          child: Text(
                            'Register',
                            style: orangeTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
              ),
          ),
      ),
    );
  }
}


