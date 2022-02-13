import 'package:flutter/material.dart';
import 'package:project_async/homescreen.dart';
import 'package:project_async/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        canvasColor: Colors.black,
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white),
          headline2: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
