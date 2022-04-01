import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'contactus.dart';
import 'about.dart';
import 'book.dart';
import 'eczane.dart';
import 'help.dart';


import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const myhome(title: 'Flutter Demo Home Page'),
    );
  }
}

class myhome extends StatefulWidget {
  const myhome({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<myhome> createState() => _myhome();
}

class _myhome extends State<myhome> {

  final _auth = FirebaseAuth.instance;
  late User signeduser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentus();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new  Text("عذرا",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,color:Colors.black) ),
          content: new  Text("انت قمت بتسجيل حساب مسبقا",
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.w800,
                fontSize: 19,color:Colors.black45) ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child:  Text("اغلاق",
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.w800,
                fontSize: 16,color:Colors.black) ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void getcurrentus(){

    try{
      final userr = _auth.currentUser;
      if(userr != null){
        signeduser = userr;

      }
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Container(
       child: Column(
          children: [

            Container(
              alignment: Alignment.center,


                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(840),
                    bottomRight: Radius.circular(840)
                  ),
                  color: Colors.blueAccent,

                ),
                width:width,
                height: 80,
                child: Text("أهلا وسهلا بكم",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,color:Colors.white) )
            ),




            SizedBox(height: 10,),


            Container(
              child: Text("كيف نستطيع مساعدتك؟",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,color:Colors.black) )
              ),

            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () async {

                    Navigator.push(context, PageRouteTransitionBuilder(page: book(), effect: TransitionEffect.rightToLeft,));
                  },
               child: shape(Icon(Icons.menu_book_rounded,size: 50,color: Colors.white,),"قسم الكتب","الكتب الطبية",Colors.blueAccent.withOpacity(0.6),Colors.blue,"مراجعة الكتب"),
                ),

                SizedBox(width: 30,),
                GestureDetector(
                  onTap: () async {

                    Navigator.push(context, PageRouteTransitionBuilder(page: eczane(), effect: TransitionEffect.rightToLeft,));
                  },
                child:shape(Icon(Icons.health_and_safety_outlined,size: 50,color: Colors.white,),"الصيدليات","الصيدلية المناوبة",HexColor("#f96e51"),HexColor("#fc9783"),"مراجعة الصيدليات "),
                ),
                  SizedBox(width: 10,),

              ],
            ),


            SizedBox(height: 38,),
            Row(
              children: [
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () async {


                    if(signeduser !=null){
                      _showDialog();


                     }else{
                       Navigator.push(context, PageRouteTransitionBuilder(page: about(), effect: TransitionEffect.rightToLeft,));
                    }
                  },
                child:shape(Icon(Icons.settings,size: 50,color: Colors.white,),"الحساب","سجل معنا الأن",HexColor("#ff6eb7"),HexColor("#fb49a8"),"انشاء حساب"),
                ),
                SizedBox(width: 30,),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(context, PageRouteTransitionBuilder(page: contactus(), effect: TransitionEffect.rightToLeft,));

                  },
                  child:shape(Icon(Icons.chat_rounded,size: 50,color: Colors.white,),"الاستشارات","الاستشارات الطبية",HexColor("#00d992"),HexColor("#01bf81"),"مراجعة الاستشارات "),

                ),
                SizedBox(width: 10,),

              ],
            ),
            SizedBox(height: 130,),

            Container(
              child:RaisedButton(
                onPressed: () async{
                  Navigator.push(context, PageRouteTransitionBuilder(page: help(), effect: TransitionEffect.rightToLeft,));

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient:  LinearGradient(
                      colors: <Color>[
                       Colors.greenAccent,
                        Colors.green,

                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child:   Text("مساعدة؟",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,color:Colors.white,),
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








class shape extends StatelessWidget{
   shape( this.theicon, this.first, this.two, this.firstcolor, this.secondcolor,this.three);

  final Icon theicon;
  final String first;
  final String two;
  final Color firstcolor;
  final Color secondcolor;
   final String three;




  @override

  Widget build(BuildContext context) {

      return  Container(
        width: 170,
        height: 185,
     

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: firstcolor,

               blurRadius: 16,
                spreadRadius: 0.1,
                offset: Offset(3.0, 20.75),

            ),
          ],

        ),

        child:  Stack(
          alignment: Alignment.topCenter,
          textDirection: TextDirection.rtl,
          children: [

             ShaderMask(
                child: Image.asset("images/bluecolr.png",),

                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      colors: [
                        firstcolor,
                       secondcolor,
                       // HexColor("#45bfd4"),
                      //  HexColor("#2ca3b7"),
                      ]
                  ).createShader(bounds);

                },

                blendMode: BlendMode.srcATop,
              ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: theicon
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child:

              Text(first,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,color:Colors.white )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child:
              Text(two,

                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,color:Colors.white )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150,),
              child:

              Text(three,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,color:secondcolor )
              ),
            ),




          ],
        ),
    );

  }


}


