import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/provider/user_provider.dart';
import 'package:todo_list/ui/home/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routName,
      routes: {
        HomePage.routName:(context) => HomePage()
      },



      theme: ThemeData(
        primaryColor: Color(0xff5D9CEC),
        scaffoldBackgroundColor: Color(0xffDFECDB),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,


          )

        )
      ),


    );
  }
}


