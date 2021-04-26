import 'package:flutter/material.dart';
import 'package:lmmeals/pages/sign_in_screen.dart';
import 'package:lmmeals/pages/sign_up_screen.dart';

class StartSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      body: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img1.png"),
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
                  child: Text("Ordering your food orders",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                    ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height*(11/100), left: 20),
                child: Text("Can \n I \n Help \n You ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    wordSpacing: 1,
                      color: Colors.white,
                      fontSize: 25,
                    fontFamily: 'Pacifico'
                  ),),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height*(10/100)),
                child: MaterialButton(
                  minWidth: size.width-50,
                  color: Colors.orange[800],
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return SignUp();
                      }
                    ));

                  },
                  child: Text("Register",
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
                padding: EdgeInsets.only(top: size.height*(2/100)),
                child: MaterialButton(
                  minWidth: size.width-50,
                  color: Colors.orange[800],
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return SignIn();
                    }));
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

            ],
          )

        ]
      )

    );
  }
}
