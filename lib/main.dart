import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:untitled1/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TestScreen();
  }
}

class TestScreen extends StatelessWidget {

  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("images/first.jpg"),
      titleText:Text("أهلا بكم في برنامج الصيدلية المناوبة",
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.w800,
              fontSize: 20,color:HexColor("#056bf1") )
      ),


      descText: Text("يمكنكم معرفة كافة الصيدليات المناوبة\n في تركيا عبر تطبيقنا تابع الأن",
        style: GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 18,
            color:HexColor("#3e8cf1")

        ),),

    ),
    OnbordingData( fit: BoxFit.cover,
      image: AssetImage("images/two.jpg"),
      titleText:Text("هل تعلم؟",
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.w800,
              fontSize: 20,color:HexColor("#056bf1") )
      ),
      descText: Text("تطبيقنا يقدم أفضل الكتب العلمية المختصة بالطب البشري والتداوي بالأعشاب ويمكنك الحصول عليها بالمجان",
        style:  GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 18,
            color:HexColor("#3e8cf1"),

        ),
      ),
    ),
    OnbordingData(
      image: AssetImage("images/doctor.jpg"),
      titleText:Text("هل تعلم؟",
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.w800,
              fontSize: 20,color:HexColor("#056bf1") )
      ),

      descText: Text("نقدم استشارات مجانية من قبل أطباء مختصين وذلك فقط باعطائنا التفاصيل عبر الرسائل",
        style:  GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 18,
            color:HexColor("#3e8cf1")

        ),
      ),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroScreen(

      onbordingDataList: list,
      colors: [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],
      pageRoute: MaterialPageRoute(

        builder: (context) => home(),
      ),
      nextButton: Text(

        "التالي",
        style:  GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 14,
            color:HexColor("#3e8cf1")

        ),
      ),
      lastButton: Text(
        "الانتهاء",
        style:  GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 14,
            color:HexColor("#3e8cf1")

        ),
      ),
      skipButton: Text(
        "تخطي",

        style: GoogleFonts.cairo(
            fontWeight: FontWeight.w700,fontSize: 14,
            color:HexColor("#3e8cf1")

        ),
      ),
      selectedDotColor: Colors.blueAccent,
      unSelectdDotColor: Colors.grey,
    );
  }
}