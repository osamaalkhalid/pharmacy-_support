import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'contactus.dart';
import 'package:page_route_transition/page_route_transition.dart';

void main() {
  runApp(const book());
}

class book extends StatelessWidget {
  const book({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const mybook(title: 'Flutter Demo Home Page'),
    );
  }
}

class mybook extends StatefulWidget {
  const mybook({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<mybook> createState() => _mybook();
}

class _mybook extends State<mybook> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "التداوي بالأعشاب", "writer": "ابن سيرين" ,"img":"https://www.neelwafurat.com/images/eg/abookstore/covers/normal/210/210881.jpg" },
    {"id": 2, "name": "العلم الطبي", "writer": "ابن سينا","img":"https://i.pinimg.com/564x/96/d0/c5/96d0c54763a42abca04102725067eaa9.jpg" },
    {"id": 3, "name": "معلومات في الطب ", "writer": "احمد الخالد", "img":"https://ketabpedia.com/wp-content/uploads/2019/10/bnw2584.jpg"},

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });

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
                height: 90,
                child:Column(
                  children: [
                    SizedBox(height: 4,),
                    Icon(Icons.book,size: 30,color: Colors.white,),
                    Text("قسم الكتب الطبية",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,color:Colors.white) ),
                  ],
                )


            ),




            SizedBox(height: 10,),


            Container(
                child: Text("كيف نستطيع مساعدتك؟",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,color:Colors.black) )
            ),

            SizedBox(height: 8,),




        Container(

          width:340,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.blue, blurRadius: 9,),
            ],
          ),
          child: TextField(

            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            onChanged: (value) => _runFilter(value),

            style:GoogleFonts.cairo(
                fontWeight: FontWeight.w800,
                fontSize: 20,color:Colors.black ),

            decoration: InputDecoration(

              hintText: "...ابحث عن الكتاب الذي تريده",
               labelStyle:   GoogleFonts.cairo(
                fontWeight: FontWeight.w800,
                fontSize: 20,color:Colors.black ),
               hintStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.w800,
                fontSize: 20,color:Colors.black ),

               fillColor: Colors.white,

              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueAccent, width: 0.1),
                borderRadius: BorderRadius.circular(20.0),
              ),
              border:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueAccent, width: 0.1),
                borderRadius: BorderRadius.circular(20.0),
              ),
              prefixIcon: Icon(Icons.search,color:Colors.blueAccent),

            ),
          ),
        ),



            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(

                  key: ValueKey(_foundUsers[index]["id"]),

                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child:Container(
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Expanded(
                              child:Image.network(
                                 "${ _foundUsers[index]['img']}",
                              ),
                              flex:2 ,
                            ),
                          ),
                        ),
                        Expanded(
                          child:Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child:  ListTile(

                                 //   leading: Text(
                                     // _foundUsers[index]["id"].toString(),
                                      //style: const TextStyle(fontSize: 24),
                                    //),
                                    title: Text(_foundUsers[index]['name'],
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w800,
                                            fontSize:20,color:Colors.black)
                                    ),

                                    subtitle: Text(
                                        ' الكاتب:${_foundUsers[index]["writer"].toString()}',
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,color:Colors.grey)

                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        child:Text("قرائة الكتاب",
                                        style:  GoogleFonts.cairo(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,color:Colors.black ),),
                                        onPressed: ()
                                        {},
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex:8 ,
                        ),
                      ],
                    ),
                  ),





                ),
              )
                  : const Text(
                'لاتوجد نتائج',
                style: TextStyle(fontSize: 24),
              ),
            ),




          ],
        ),
      ),
    );
  }
}







