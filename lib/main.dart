import 'package:flutter/material.dart';
import 'package:sabelas/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabelas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF3B75B),
        accentColor: Color(0xFFF9F1BF)
      ),
      home: HomeScreen(),
    );
  }
}