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
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flip_card/flip_card.dart';


void main() {
  runApp(const eczane());
}

class eczane extends StatelessWidget {
  const eczane({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home:  myeczane(title: 'Flutter Demo Home Page'),
    );
  }
}

class myeczane extends StatefulWidget {
   myeczane({Key? key, required this.title}) : super(key: key);

  final String title;




  @override
  State<myeczane> createState() => _myeczane();
}
bool trest = false;
class _myeczane extends State<myeczane> {
  final jobRoleCtrl = TextEditingController();
  final jobRoleCtrl2= TextEditingController();


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
            SizedBox(height: 100,),
            Icon(Icons.health_and_safety_outlined,size: 60,color: Colors.white,),
            Container(
                child: Text("الرجاء اختيار ولايتك ومنطقتك ",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,color:Colors.white) )
            ),



            SizedBox(height: 10,),



            Container(
                 width: 350,

                child:
                CustomDropdown(
                  hintText: 'اختر الولاية',
                  hintStyle:  GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,color:Colors.black),
                  listItemStyle: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,color:Colors.black),
                  selectedStyle: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,color:Colors.black,),


                  items: const ['هاتاي', 'اسطنبول', 'دينيزلي', 'أنطاليا'],
                  controller: jobRoleCtrl,
                ),

            ),

            SizedBox(height: 30,),


            Container(
              width: 350,

              child:
              CustomDropdown(
                hintText: 'اختر المدينة',
                hintStyle:  GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,color:Colors.black),
                listItemStyle: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,color:Colors.black),
                selectedStyle: GoogleFonts.cairo(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,color:Colors.black,),


                items: const ['انطاكيا', 'اسكندرون', 'باشاك شهير', 'اسنيورت'],
                controller: jobRoleCtrl2,
              ),

            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              child:RaisedButton(
                onPressed: ()  {
                 setState(() {
                    trest = true;
                 });
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
                    child:   Text("اظهار الصيدلية",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,color:Colors.pink,),
                      textAlign: TextAlign.center,)
                    ,
                  ),
                ),
              ) ,

            ),
            SizedBox(height: 60,),
            thecard(),
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


