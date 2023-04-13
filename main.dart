import 'package:flutter/material.dart';
import 'package:naviguide/screens/home_screen.dart';

void main() {
  runApp(NaviguideApp());
}

class NaviguideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naviguide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}