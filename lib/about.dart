import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/login.dart';
import 'home.dart';
import 'register.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const about());
}

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const myabout(title: 'Flutter Demo Home Page'),
    );
  }
}

class myabout extends StatefulWidget {
  const myabout({Key? key, required this.title}) : super(key: key);

   final String title;


  @override
  State<myabout> createState() => _myabout();
}

class _myabout extends State<myabout> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child:  IconButton(
                icon: Icon(Icons.arrow_back,size: 40,color: Colors.white,),
                onPressed:  ()async{

                  Navigator.push(context, PageRouteTransitionBuilder(page: home(), effect: TransitionEffect.leftToRight,));
                },

              ),

            ),
            SizedBox(height: 230,),
            Icon(Icons.health_and_safety_outlined,size: 60,color: Colors.white,),
            Container(
                child: Text("أنشأ حسابك الخاص أو قم بتسجيل الدخول",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,color:Colors.white) )
            ),



            SizedBox(height: 30,),


            Container(
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child:OutlinedButton(

                  onPressed: () async {

                    Navigator.push(context, PageRouteTransitionBuilder(page: register(), effect: TransitionEffect.rightToLeft,));
                  },
                child:  Text("تسجيل حساب",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,color:Colors.white,),
                  textAlign: TextAlign.center,)
              )

            ),

            SizedBox(height: 30,),
            Container(
              width: 350,
              child:RaisedButton(
                onPressed: () async {

                  Navigator.push(context, PageRouteTransitionBuilder(page: giris(), effect: TransitionEffect.rightToLeft,));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child:   Text("تسجيل دخول",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,color:Colors.pink,),
                      textAlign: TextAlign.center,)
                    ,
                  ),
                ),
              ) ,

            ),

          ],
        ),
      ),
    );
  }
}








