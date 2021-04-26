import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lmmeals/pages/admin.dart';
import 'package:lmmeals/pages/home.dart';
import 'package:lmmeals/pages/sign_in_screen.dart';
import 'package:toast/toast.dart';
class Auth{
  Future<void> signUp(BuildContext context, email , pass, username) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
        return SignIn();
      }));
      var users_collection = FirebaseFirestore.instance.collection("users");
      var user_info = FirebaseAuth.instance.currentUser ;
      users_collection.doc(user_info.uid).set(
        {
          "email" : email ,
          "pass" : pass ,
          "username": username,
          "uid": user_info.uid ,
          "fav" :[]

        }
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Toast.show("The password provided is too weak.", context);

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Toast.show("The account already exists for that email.", context);
      }
    } catch (e) {
      print(e);
      Toast.show("sorry this is a problem", context);
    }
  }
  Future<void> signIn(BuildContext context, email , pass) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
      var user_inf = FirebaseAuth.instance.currentUser ;
      if(user_inf.email == "barry.allen@example.com"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_){
            return AdminAddItem();
          }
        ));
      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return Home();
        }));
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Toast.show("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Toast.show("Wrong password provided for that user.", context);
      }
    }
  }
  //barry.allen@example.com
// SuperSecretPassword!
}