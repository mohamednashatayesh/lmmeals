
import 'package:flutter/material.dart';
import 'package:lmmeals/lists/list_vie_foods.dart';
import 'package:lmmeals/lists/list_vie_recommended.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
         Row(
           children: [
             IconButton(icon: Icon(Icons.notifications_active_outlined),
                 color: Colors.red,
                 onPressed: (){})
           ],
         )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(

            children: [

                 Text(" What's would you like to \n cook ? ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontSize: 33
                ),),



              Padding(
                padding: EdgeInsets.only(left: 1, top:130  ),
                child: Container(
                  height: 295,
                  child: FoodInformation()
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top:450, left : 17),
                  child: Container(
                    width: 380,
                    decoration: BoxDecoration( //                    <-- BoxDecoration
                      border: Border(bottom: BorderSide(color: Colors.white38)),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 450),
                child: Text("   Recommended",
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                  fontFamily: "Pacifico"
                ),),
              ),
              Padding(padding: EdgeInsets.only(top: 500, left: 7),
              child:Container(
                width: 400,
                height: 300,
                child: FoodRecommended(),
              ) ,)


            ]
          ),
        )
      ),
    );
  }
}
