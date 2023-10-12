import 'package:flutter/material.dart';
import 'package:my_project/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define a cor de destaque do tema
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Arial', // Define a fonte global como Arial
            color: Colors.white, // Define a cor de texto global como branca
          ),
        ),
      ),
      home: Login(),
    );
  }
}
