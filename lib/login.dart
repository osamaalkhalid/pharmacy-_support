import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'about.dart';
import 'home.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const giris());
}

class giris extends StatelessWidget {
  const giris({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const mygiris(title: 'Flutter Demo Home Page'),
    );
  }
}

class mygiris extends StatefulWidget {
  const mygiris({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<mygiris> createState() => _mygiris();
}

class _mygiris extends State<mygiris> {

  late String email;
 late String password;
  bool isLoading = false;

  final _auth = FirebaseAuth.instance;

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
            image: AssetImage("images/back2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child:  IconButton(
                icon: Icon(Icons.arrow_back,size: 40,color: Colors.pink,),
                onPressed:  ()async{

                  Navigator.push(context, PageRouteTransitionBuilder(page: about(), effect: TransitionEffect.leftToRight,));
                },

              ),

            ),

            SizedBox(height: 230,),
            Icon(Icons.health_and_safety_outlined,size: 60,color: Colors.pink,),



            Container(
              width: 350,


              child: TextField(
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54,fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  labelText: "Email",
                  hintText: "Example@ex.com",
                  hintStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54,fontSize: 20),
                  labelStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.pink,fontSize: 20),





                ),

                onChanged: (text){email = text;},

              ),
            ),
            SizedBox(height: 30,),

            Container(
              width: 350,


              child: TextField(
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54,fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  labelText: "Password",
                  hintText: "*****",
                  hintStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54,fontSize: 20),
                  labelStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.pink,fontSize: 20),





                ),
                obscureText: true,
                onChanged: (text){password = text;},


              ),
            ),
            Container(

                child: Text("هل نسيت كلمة المرور؟",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,color:Colors.black,),
                )
            ),

            SizedBox(height: 30,),

            Container(
              width: 350,
              child:RaisedButton(

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

                onPressed: () async{
                  setState(() {
                    isLoading = true;
                  });
                  try{

                    final newuser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  home()),
                    );
                    setState(() {
                      isLoading = false;
                    });


                  }catch(e){
                    setState(() {
                      isLoading = false;
                    });


                  }

                },
              ) ,

            ),

          ],
        ),
      ),
    );
  }
}








