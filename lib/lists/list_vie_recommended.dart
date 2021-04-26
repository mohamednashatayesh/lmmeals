import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmmeals/pages/item_page.dart';


class FoodRecommended extends StatefulWidget {
  @override
  _FoodRecommendedState createState() => _FoodRecommendedState();
}

class _FoodRecommendedState extends State<FoodRecommended> {
  bool connected = false ;
  @override
  Widget build(BuildContext context) {
    CollectionReference food = FirebaseFirestore.instance.collection('fooditems');

    return StreamBuilder<QuerySnapshot>(
      stream: food.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        void mohamed()async{

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
          if(connected == true){



            return  ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return  document.data()["recommended"] ?  Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 45, 45, 1),
                        borderRadius: BorderRadius.circular(20)

                    ),
                    width: 350,
                    height: 150,

                    child: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: MaterialButton(
                    onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return ItemPage(document.data()["title"], document.data()["des"], document.data()["time"], document.data()["ing"], document.data()["assess1"], document.data()["assess2"], document.data()["assess3"], document.data()["assess4"], document.data()["assess5"]);
                               }));},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color.fromRGBO(45, 45, 45, 1),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 22 ),
                              child: Container(
                                width: 110,
                                height: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                    image: DecorationImage(
                                        image: AssetImage("assets/images/items/${document.data()["img"]}"),
                                        fit: BoxFit.cover
                                    )
                                  //
                                ),
                              ),),
                            Padding(
                              padding: EdgeInsets.only(top: 0, left: 180),
                              child: Row(
                                children: [
                                  Text("Food",
                                    style: TextStyle(
                                        color: Colors.blue ,
                                        fontSize: 15
                                    ),),
                                  Padding(
                                    padding: EdgeInsets.only(left: 100),
                                    child: IconButton(
                                      icon : Icon(Icons.favorite_outline_outlined ),
                                      color: Colors.orange[700],
                                      onPressed: (){},
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35, left: 140),
                              child: Text("${document.data()["title"]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "OrelegaOne"
                                ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 71, left :140),
                              child:  Row(
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
                            ),Padding(
                              padding: EdgeInsets.only(top: 95, left : 140),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ):  SizedBox(
                  height: 0 ,
                  width: 0,
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


// class FoodRecommended extends StatelessWidget {
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
//           return Text("Loading");
//         }
//         void mohamed(){
//
//
//         }
//         Timer(Duration(seconds: 1), mohamed);
//         try {
//           if(snapshot.connectionState == ConnectionState.active){
//
//
//
//           return  ListView(
//             children: snapshot.data.docs.map((DocumentSnapshot document) {
//               return  document.data()["recommended"] ?  Padding(
//                 padding: EdgeInsets.only(top: 5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(45, 45, 45, 1),
//                     borderRadius: BorderRadius.circular(20)
//
//                   ),
//                   width: 350,
//                   height: 130,
//
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       color: Color.fromRGBO(45, 45, 45, 1),
//                       child: Stack(
//                         children: [
//                           Padding(
//                               padding: EdgeInsets.only(left: 5, top: 22 ),
//                           child: Container(
//                             width: 110,
//                             height: 75,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//
//                               image: DecorationImage(
//                                 image: AssetImage("assets/images/items/${document.data()["img"]}"),
//                                 fit: BoxFit.cover
//                               )
//                               //
//                             ),
//                           ),),
//                           Padding(
//                             padding: EdgeInsets.only(top: 1, left: 180),
//                             child: Row(
//                               children: [
//                                 Text("Food",
//                                 style: TextStyle(
//                                   color: Colors.blue ,
//                                   fontSize: 15
//                                 ),),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 120),
//                                   child: IconButton(
//                                     icon : Icon(Icons.favorite_outline_outlined ),
//                                     color: Colors.orange[700],
//                                     onPressed: (){},
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 35, left: 140),
//                             child: Text("${document.data()["title"]}",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontFamily: "OrelegaOne"
//                             ),),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 57, left :140),
//                             child:  Row(
//                               children: [
//                                 Icon( document.data()["assess1"] ?  Icons.favorite :
//                                 Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                 Icon( document.data()["assess2"] ?  Icons.favorite :
//                                 Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                 Icon( document.data()["assess3"] ?  Icons.favorite :
//                                 Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                 Icon( document.data()["assess4"] ?  Icons.favorite :
//                                 Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                                 Icon( document.data()["assess5"] ?  Icons.favorite :
//                                 Icons.favorite_outline_outlined , color: Colors.orange[700],),
//                               ],
//                             ),
//                           ),Padding(
//                             padding: EdgeInsets.only(top: 85, left : 140),
//                             child: Row(
//                               children: [
//                                 Icon(Icons.timer,color: Colors.white38,),
//                                 Text(" ${document.data()["time"]} ",
//                                   style: TextStyle(
//                                       color: Colors.white
//                                   ),),
//                                 Text(" Seconds",
//                                   style: TextStyle(
//                                       color: Colors.white
//                                   ),)
//
//
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ):  SizedBox(
//                 height: 0 ,
//                 width: 0,
//               );
//             }).toList(),
//           );}}catch(e){
//           print(e);
//
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }