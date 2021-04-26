import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lmmeals/models/auth.dart';
import 'package:lmmeals/pages/sign_up_screen.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var email = TextEditingController();
  var pass = TextEditingController();
  bool connected = false ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/img2.png"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height*(24.63/100)),
                    child: Center(
                      child: Text("LMMeals",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily: "Pacifico"
                        ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text("Sign In",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*(6.15/100)),
                    child: Container(
                      width: size.width-50,
                      child: TextField(
                        controller: email,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(
                            color: Colors.white54
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[800])
                          ),
                          focusColor: Colors.orange[800],
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange[800])
                          ),
                          prefixIcon: Icon(Icons.email_outlined,color: Colors.white)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      width: size.width-50,
                      child: TextField(
                        controller: pass,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(
                              color: Colors.white54
                          ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange[800])
                            ),

                            focusColor: Colors.orange[800],
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange[800])
                            ),
                            prefixIcon: Icon(Icons.privacy_tip_outlined,color: Colors.white),


                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*(2/100)),
                    child: MaterialButton(
                      minWidth: size.width-50,
                      color: Colors.orange[800],
                      onPressed: () async {
                        try{
                          final result = await InternetAddress.lookup("google.com") ;
                          if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
                            connected = true ;

                          }
                        } on SocketException catch(_){
                          connected = false ;
                        }
                        void moh(){
                          setState(() {

                          });
                        }
                        Timer(Duration(seconds: 60),moh );
                        if (connected == true){
                          var x = Auth() ;
                          x.signIn(context, email.text, pass.text);
                        }else{
                          Toast.show("sorry no Internet connection", context);
                        }

                      },
                      child: Text("Sign In",
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Pacifico',
                            color: Colors.white
                        ),),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*(24.36/100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),),
                        InkWell(
                          child:Text("Register",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.deepOrange
                            ),) ,
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (_){
                                  return SignUp();
                                }
                            ));
                          },
                        )
                      ],
                    ),

                  )

                ],

              )

            ]
        ),
      ),
    );
  }
}
