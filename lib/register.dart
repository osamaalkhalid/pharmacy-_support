import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/about.dart';
import 'home.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp( register());
}

class register extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const myregister(title: 'Flutter Demo Home Page'),
    );
  }
}

class myregister extends StatefulWidget {
  const myregister({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  State<myregister> createState() => _myregister();
}

class _myregister extends State<myregister> {
  late String email;
  late String password;
  bool isLoading =false;
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

                  Navigator.push(context, PageRouteTransitionBuilder(page: about(), effect: TransitionEffect.leftToRight,));
                },

              ),

            ),

            SizedBox(height: 230,),
            Icon(Icons.health_and_safety_outlined,size: 60,color: Colors.white,),
            Container(
                child: Text("أنشأ حسابك الخاص الأن",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,color:Colors.white) )
            ),



            SizedBox(height: 30,),
            Container(
              width: 350,


              child: TextField(
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Email",
                  hintText: "Example@ex.com",
                  hintStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),
                  labelStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),





                ),

                onChanged: (text){
                  email = text;
                },

              ),
            ),
            SizedBox(height: 30,),

            Container(
              width: 350,


              child: TextField(
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Password",
                  hintText: "*****",
                  hintStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),
                  labelStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 20),





                ),
                obscureText: true,
                onChanged: (text){
                  password = text;
                },


              ),
            ),


            SizedBox(height: 30,),
            Container(
              width: 350,
              child:RaisedButton(
                onPressed:() async{
                  setState(() {
                    isLoading = true;
                  });
                  try{

                    final newuser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password,);
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
                    child:   Text("تسجيل حساب",
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








