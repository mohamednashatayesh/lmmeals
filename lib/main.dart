import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lmmeals/pages/admin.dart';
import 'package:lmmeals/pages/home.dart';
import 'package:lmmeals/pages/item_page.dart';
import 'package:lmmeals/pages/sign_up_screen.dart';
import 'package:lmmeals/pages/ss.dart';
import 'package:lmmeals/pages/start.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  final QuerySnapshot result =
  await FirebaseFirestore.instance.collection('fooditems').get();
  final List<DocumentSnapshot> documents = result.docs;
  documents.forEach((data) {
    print(data["title"]);

  });
 


 runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  StartSc()
    );
  }
}
