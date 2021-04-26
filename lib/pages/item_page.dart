import 'package:flutter/material.dart';


class ItemPage extends StatefulWidget {
  final List desc ;
  final List ingredients ;
  var time ;
  final bool assess1 ;
  final bool assess2 ;
  final bool assess3 ;
  final bool assess4 ;
  final bool assess5 ;
  final String title ;
  ItemPage(this.title , this.desc ,this.time ,  this.ingredients ,this.assess1 , this.assess2, this.assess3 , this.assess4, this.assess5);
  @override
  _ItemPageState createState() => _ItemPageState(this.title , this.desc ,this.time ,  this.ingredients ,this.assess1 , this.assess2, this.assess3 , this.assess4, this.assess5);
}

class _ItemPageState extends State<ItemPage> {
  final List desc ;
  final List ingredients ;
   var time ;
   final bool assess1 ;
   final bool assess2 ;
   final bool assess3 ;
   final bool assess4 ;
   final bool assess5 ;
   final String title ;

  _ItemPageState(this .title,this.desc,this.time, this.ingredients, this.assess1, this.assess2, this.assess3, this.assess4, this.assess5);

  @override
  Widget build(BuildContext context) {
    print(ingredients);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
          icon: Icon(Icons.notifications_active_outlined,color: Colors.red,),
        )],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 15,left: 30),
            child: Text("Food",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17
            ),),),
            Padding(
              padding: EdgeInsets.only(top: 40,
              left: 30),
              child: Column(
                children:[ Row(
                  children: [
                    Container(


                      child: Text("$title",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    fontFamily: "OrelegaOne"
                  ),),
                      width: 300,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Container(

                        child: IconButton(icon: Icon(Icons.favorite_outline_outlined ,color: Colors.orange[700],), onPressed: (){},
                          iconSize: 33,),
                      ),
                    ),


                  ],
                ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon( assess1 ?  Icons.favorite :
                        Icons.favorite_outline_outlined , color: Colors.orange[700],),
                        Icon( assess2 ?  Icons.favorite :
                        Icons.favorite_outline_outlined , color: Colors.orange[700],),
                        Icon( assess3 ?  Icons.favorite :
                        Icons.favorite_outline_outlined , color: Colors.orange[700],),
                        Icon( assess4 ?  Icons.favorite :
                        Icons.favorite_outline_outlined , color: Colors.orange[700],),
                        Icon( assess5 ?  Icons.favorite :
                        Icons.favorite_outline_outlined , color: Colors.orange[700],),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                        children: [
                      Icon(Icons.timer,
                      color: Colors.white38,),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("$time", style: TextStyle(
                              color: Colors.white
                            ),),
                          ),
                          Text(" Minutes",
                          style: TextStyle(
                            color: Colors.white
                          ),)

                        ]
                    )

                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Ingredients",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 26,
                      fontFamily: "OrelegaOne"
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 370,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black
                        ),
                        child: ListView.builder(
                          itemCount: ingredients.length,

                            itemBuilder: (context, index){
                          return Container(
                            child: Text("$index- ${ingredients[index]}",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 18,

                            ),),
                          );
                        })),
    ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 28),
                    child: Container(
                      width: 350,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                        color: Color.fromRGBO(45, 45, 45, 1),

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              width: 120,
                              height: 3,
                              color: Colors.white,
                            ),
                          ) ,
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              child: Text("How To Cook ? ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25
                              ),),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              width: 350,
                              height: 330,
                              child: ListView.builder(
                                itemCount: desc.length,
                                  itemBuilder: (context , index){
                                  return Column(
                                    children: [
                                      Container(
                                      width: 320,
                                      child: Text("${index+1}- ${desc[index]}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),),
                                    ),
                                    SizedBox(height: 14,)]
                                  );

                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  )


                ]
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 80),
            //   child: Row(
            //     children: [
            //       Icon( assess1 ?  Icons.favorite :
            //       Icons.favorite_outline_outlined , color: Colors.orange[700],),
            //       Icon( assess2 ?  Icons.favorite :
            //       Icons.favorite_outline_outlined , color: Colors.orange[700],),
            //       Icon( assess3 ?  Icons.favorite :
            //       Icons.favorite_outline_outlined , color: Colors.orange[700],),
            //       Icon( assess4 ?  Icons.favorite :
            //       Icons.favorite_outline_outlined , color: Colors.orange[700],),
            //       Icon( assess5 ?  Icons.favorite :
            //       Icons.favorite_outline_outlined , color: Colors.orange[700],),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
