import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/home.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class contactus extends StatefulWidget {
  @override
  _contactusState createState() => _contactusState();
}
final _auth = FirebaseAuth.instance;

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) {


   late String email;
   late String title;
   late String phone;
   late String mesaj;
    //for showing loading
    bool loading = false;

    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.green.withOpacity(.9),
                      Colors.greenAccent.withOpacity(.9),

                    ])),
          ),
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
           Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.topCenter,
             child:    Text("نشكركم لثقتكم",
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,color:Colors.white )
            ),

          ),
          Padding(
            padding: EdgeInsets.only(bottom:160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("احصلو على استشارات مجانية الان",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,color:Colors.white )
                ),
                SizedBox(
                  height: 4,
                ),
                Text(" الرجاء املاء كافة الحقول",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,color:Colors.white )
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          onChanged: (text){
                            setState(() {
                              email = text;
                            });
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "البريد الألكتروني",
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),

                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,color:Colors.white )
                        )),
                  ],
                ),
                //city
                SizedBox(
                  height: 16,
                ),
                //TODO remove unwanted containers
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                            onChanged: (text){
                              setState(() {
                                title = text;
                              });
                            },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'الاسم',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,color:Colors.white )
                        )),
                  ],
                ),
                //phonenumber
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                            onChanged: (text){
                              setState(() {
                                phone = text;
                              });
                            },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'رقم الهاتف',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,color:Colors.white )
                        )),
                  ],
                ),
                //college
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                            onChanged: (text){
                              mesaj = text;

                            },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'الرسالة',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,color:Colors.white )
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Center(
                      child: TextButton(
                        onPressed: ()  async{

                        try{
                          await  FirebaseFirestore.instance.collection('message').add({
                            'email': email,
                            'name': title,
                            'phone': phone,
                            'mesaj': mesaj,


                          });




                        }catch(e){

                          }
                        },
                        child: Text(
                            'ارسال الرسالة ',
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,color:Colors.black )
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}