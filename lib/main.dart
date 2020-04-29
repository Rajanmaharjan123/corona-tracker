
import 'package:flutter/material.dart';
import 'package:coronatracker/homePage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
//        primaryColor: Colors.blueGrey,
//        textTheme: TextTheme(
//        )

      ),
      home: HomePage(),
    );
  }
}

