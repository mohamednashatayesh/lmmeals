import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmmeals/pages/home.dart';

class AdminAddItem extends StatefulWidget {
  @override
  _AdminAddItemState createState() => _AdminAddItemState();
}

class _AdminAddItemState extends State<AdminAddItem> {
  var item_name = TextEditingController();
  var ing1_name = TextEditingController();
  var ing2_name = TextEditingController();
  var ing3_name = TextEditingController();
  var ing4_name = TextEditingController();
  var ing5_name = TextEditingController();
  var ing6_name = TextEditingController();
  var desc1 = TextEditingController();
  var desc2 = TextEditingController();
  var desc3 = TextEditingController();
  var desc4 = TextEditingController();
  var desc5 = TextEditingController();
  var desc6 = TextEditingController();
  var time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the item name",
              style: TextStyle(
                fontSize: 20
              ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
            child: TextField(
               controller: item_name,
              decoration: InputDecoration(
                hintText: "Enter the item name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
            ),),
            /////////// add item name
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 1",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                  controller:ing1_name ,
                decoration: InputDecoration(
                  hintText: "Enter the ingredient1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ////////// add ing field 1
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 2",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:ing2_name ,
                decoration: InputDecoration(
                    hintText: "Enter the ingredient2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            /////// add ing field 2
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 3",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:ing3_name ,
                decoration: InputDecoration(
                    hintText: "Enter the ingredient3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add ing field3
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 4",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:ing4_name ,
                decoration: InputDecoration(
                    hintText: "Enter the ingredient4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ////////// add ing field 4
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 5",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:ing5_name ,
                decoration: InputDecoration(
                    hintText: "Enter the ingredient5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add ing field 5
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the ingredient 6",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:ing6_name ,
                decoration: InputDecoration(
                    hintText: "Enter the ingredient6",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add ing field 6
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Container(
                width: 200,
                height: 5,
                color: Colors.black38,
              ),
            ),
            //////////////////////
            ///////////////////
            /////////////////////
            /////////////////////
            /////////////////////
            /////////////////////
            ////////////////////
            /////////////////////
            ////////////////////
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 1",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc1 ,
                decoration: InputDecoration(
                    hintText: "Enter the description1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ////////// add description field 1
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 2",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc2 ,
                decoration: InputDecoration(
                    hintText: "Enter the description2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            /////// add description field 2
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 3",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc3 ,
                decoration: InputDecoration(
                    hintText: "Enter the description3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add description field3
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 4",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc4 ,
                decoration: InputDecoration(
                    hintText: "Enter the description4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ////////// add description field 4
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 5",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc5 ,
                decoration: InputDecoration(
                    hintText: "Enter the description5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add description field 5
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the description 6",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:desc6 ,
                decoration: InputDecoration(
                    hintText: "Enter the description6",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            ///////// add description field 6
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Container(
                width: 200,
                height: 5,
                color: Colors.black38,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("enter the time",
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller:time ,
                decoration: InputDecoration(
                    hintText: "Enter the time",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: MaterialButton(
                child: Text("Add Item"),
                color: Colors.blue  ,
                onPressed: ()async{
                  print(item_name.text);
                  print(ing1_name.text);
                  print(ing2_name.text);
                  print(ing3_name.text);
                  print(ing4_name.text);
                  print(ing5_name.text);
                  print(ing6_name.text);
                  //////////////
                  print(desc1.text);
                  print(desc2.text);
                  print(desc3.text);
                  print(desc4.text);
                  print(desc5.text);
                  print(desc6.text);
                  print(time.text);
                  DocumentReference doc_inf = await FirebaseFirestore.instance.collection("fooditems").add({
                    "title":item_name.text ,
                    "ing":[],
                    "des":[],
                    "assess1":true ,
                    "assess2":true,
                    "assess3":true,
                    "assess4":false,
                    "assess5":false,
                    "time":time.text,
                    "recommended":false
                  });
                  print(doc_inf.id);
                  FirebaseFirestore.instance.collection("fooditems").doc(doc_inf.id).update(
                    {
                      "ing":[
                        ing1_name.text,
                        ing2_name.text,
                        ing3_name.text,
                        ing4_name.text,
                        ing5_name.text,
                        ing6_name.text,
                      ]
                    }
                  );
                  FirebaseFirestore.instance.collection("fooditems").doc(doc_inf.id).update(
                      {
                        "des":[
                          desc1.text,
                          desc2.text,
                          desc3.text,
                          desc4.text,
                          desc5.text,
                          desc6.text,
                        ]
                      }
                  );


                },
              ),
            )



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return Home() ;
          }));
        },
      ),
    );
  }
}
