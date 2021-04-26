
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:firebase_core/firebase_core.dart';
import 'package:lmmeals/pages/item_page.dart';

class FoodInformation extends StatefulWidget {
  @override
  _FoodInformationState createState() => _FoodInformationState();
}

class _FoodInformationState extends State<FoodInformation> {
  bool connected = false ;
  List fav_list ;
  bool is_in_fav = true ;
  @override
  Widget build(BuildContext context) {

    CollectionReference food = FirebaseFirestore.instance.collection('fooditems');
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).snapshots().listen((event) {

      fav_list = event.get("fav");
      print(fav_list);

    });

    return StreamBuilder<QuerySnapshot>(
      stream: food.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        void mohamed() async{

          try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              connected = true ;
            }
          } on SocketException catch (_) {
            connected = false ;
          }
          setState(() {

          });

        }
        Timer(Duration(seconds: connected ? 120 : 10), mohamed);

        try {
          if (connected == true ){
            return  ListView(
              scrollDirection: Axis.horizontal,


              children: snapshot.data.docs.map((DocumentSnapshot document) {


                return   Container(
                  color: Colors.black,
                  width: 240,
                  height: 360,
                  child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(

                            width: 190,
                            height: 360,
                            child: MaterialButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return ItemPage(document.data()["title"], document.data()["des"], document.data()["time"], document.data()["ing"], document.data()["assess1"], document.data()["assess2"], document.data()["assess3"], document.data()["assess4"], document.data()["assess5"]);
                                }));

                              },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child:  Stack(
                                  children: [
                                    IconButton(icon: is_in_fav?Icon(Icons.favorite, color: Colors.orange[700],):Icon(Icons.favorite_outline_outlined ,color: Colors.orange[700],), onPressed: (){
                                      var my_title = document.data()["title"] ;
                                      if(fav_list.contains(document.data()["title"])== true){
                                        is_in_fav = false ;
                                        setState(() {
                                          fav_list.remove(document.data()["title"]);
                                        });

                                        print(fav_list);
                                        print(is_in_fav);
                                        FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
                                            {
                                              "fav":fav_list
                                            }
                                        );



                                      }else{
                                        setState(){
                                          is_in_fav = false  ;
                                        }

                                        FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({"fav": FieldValue.arrayUnion(["${document.data()["title"]}"])});
                                      }



                                      //FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({"fav": FieldValue.arrayUnion(["${document.data()["title"]}"])});
                                    },
                                      iconSize: 33,),
                                    Padding(
                                      padding: EdgeInsets.only(top: 120, left: 14),
                                      child: Text("Food",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue
                                        ),),

                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top : 150, left: 10),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                                children:[
                                                  Expanded(
                                                    child: Text("${document.data()["title"]}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontFamily: 'OrelegaOne'
                                                      ),),
                                                  ),]
                                            ),
                                            Row(
                                              children: [
                                                Icon( document.data()["assess1"] ?  Icons.favorite :
                                                Icons.favorite_outline_outlined , color: Colors.orange[700],),
                                                Icon( document.data()["assess2"] ?  Icons.favorite :
                                                Icons.favorite_outline_outlined , color: Colors.orange[700],),
                                                Icon( document.data()["assess3"] ?  Icons.favorite :
                                                Icons.favorite_outline_outlined , color: Colors.orange[700],),
                                                Icon( document.data()["assess4"] ?  Icons.favorite :
                                                Icons.favorite_outline_outlined , color: Colors.orange[700],),
                                                Icon( document.data()["assess5"] ?  Icons.favorite :
                                                Icons.favorite_outline_outlined , color: Colors.orange[700],),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.timer,color: Colors.white38,),
                                                  Text(" ${document.data()["time"]} ",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),),
                                                  Text(" Minutes",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),)


                                                ],
                                              ),
                                            )

                                          ]
                                      ),
                                    ),

                                  ],
                                ),
                                color: Color.fromRGBO(45, 45, 45, 1)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 100),
                          child: Container(
                            width: 200,
                            height: 110,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/items/${document.data()["img"]}" ,
                                    ),
                                    fit: BoxFit.cover
                                ),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),),

                      ]
                  ),
                );
              }).toList(),
            );}}catch(e){
          print(e);

        }
        return CircularProgressIndicator();
      },
    );
  }
}



// class FoodInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference food = FirebaseFirestore.instance.collection('fooditems');
//
//     return StreamBuilder<QuerySnapshot>(
//       stream: food.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         void mohamed(){
//
//         }
//         Timer(Duration(seconds: 1), mohamed);
//
//         try {
//           if (snapshot.connectionState == ConnectionState.done){
//         return  ListView(
//           scrollDirection: Axis.horizontal,
//
//
//           children: snapshot.data.docs.map((DocumentSnapshot document) {
//             print(document.data()["title"]);
//             return   Container(
//               color: Colors.black,
//               width: 240,
//               height: 360,
//               child: Stack(
//                 children: [
//                   Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Container(
//
//                     width: 190,
//                     height: 360,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)
//                       ),
//                       child:  Stack(
//                         children: [
//                           IconButton(icon: Icon(Icons.favorite_outline_outlined ,color: Colors.orange[700],), onPressed: (){},
//                           iconSize: 33,),
//                           Padding(
//                             padding: EdgeInsets.only(top: 120, left: 14),
//                             child: Text("Food",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Colors.blue
//                             ),),
//
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top : 150, left: 10),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children:[
//                                     Expanded(
//                                       child: Text("${document.data()["title"]}",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontFamily: 'OrelegaOne'
//                               ),),
//                                     ),]
//                                 ),
//                               Row(
//                                 children: [
//                                   Icon( document.data()["assess1"] ?  Icons.favorite :
//                                   Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                   Icon( document.data()["assess2"] ?  Icons.favorite :
//                                   Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                   Icon( document.data()["assess3"] ?  Icons.favorite :
//                                   Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                   Icon( document.data()["assess4"] ?  Icons.favorite :
//                                   Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                   Icon( document.data()["assess5"] ?  Icons.favorite :
//                                   Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                 ],
//                               ),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 10),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.timer,color: Colors.white38,),
//                                       Text(" ${document.data()["time"]} ",
//                                       style: TextStyle(
//                                         color: Colors.white
//                                       ),),
//                                       Text(" Seconds",
//                                         style: TextStyle(
//                                           color: Colors.white
//                                       ),)
//
//
//                                     ],
//                                   ),
//                                 )
//
//                               ]
//                             ),
//                           ),
//
//                         ],
//                       ),
//                       color: Color.fromRGBO(45, 45, 45, 1)
//                     ),
//                   ),
//                 ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 30, left: 100),
//                     child: Container(
//                       width: 200,
//                       height: 110,
//
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/items/${document.data()["img"]}" ,
//                           ),
//                           fit: BoxFit.cover
//                         ),
//                           color: Colors.red,
//                         borderRadius: BorderRadius.circular(30)
//                       ),
//                     ),),
//
//                 ]
//               ),
//             );
//           }).toList(),
//         );}}catch(e){
//           print(e);
//
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }



////////////////
////////////////
///////////////
///////////////
///////////////
