import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/login.dart';
import 'home.dart';
import 'register.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:flip_card/flip_card.dart';


void main() {
  runApp(const help());
}

class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home:  myhelp(title: 'Flutter Demo Home Page'),
    );
  }
}

class myhelp extends StatefulWidget {
  myhelp({Key? key, required this.title}) : super(key: key);

  final String title;




  @override
  State<myhelp> createState() => _myhelp();
}
bool trest = false;
class _myhelp extends State<myhelp> {



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
            SizedBox(height: 150,),
            Icon(Icons.health_and_safety_outlined,size: 100,color: Colors.white,),
            Container(
              width: 350,
              alignment: Alignment.centerRight,

                child: Text("يمكنك الاستفادة من كافة الخصائص بعد اضافة البرنامج الى FireBase"
                    " تم تصميم هذا البرنامج من قبل شركة أفاق للحلول البرمجية",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,color:Colors.white), textDirection: TextDirection.rtl,)
            ),

            SizedBox(height: 70,),

            Row(
              children: [
                Icon(Icons.phone,size: 50,color: Colors.white,),
                Container(


                    child: Text("+90 551 942 30 80",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,color:Colors.white),)
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.email,size: 50,color: Colors.white,),
                Container(


                    child: Text("ansosama12345@gmail.com",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,color:Colors.white),)
                ),
              ],
            ),




          ],
        ),
      ),
    );
  }
}





class thecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
      visible: trest, // bool
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,

        front: Column(

          children: [
            Container(

              width: 360,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              height: 60,
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text("اضفط لمعرفة معلومات الصيدلية",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,color:Colors.black,),
                    textAlign: TextAlign.center,),
                  SizedBox(width: 2,),
                  Icon(Icons.health_and_safety_outlined,size: 40,color: Colors.pink,),

                ],
              ),
            ),
          ],
        ),
        back: Column(

          children: [
            Container(

              width: 360,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              height: 60,
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text("نعتذر حصل خطأ ما يرجى المحاولة لاحقا.",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,color:Colors.black,),
                    textAlign: TextAlign.center,),
                  SizedBox(width: 2,),
                  Icon(Icons.error,size: 40,color: Colors.pink,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


