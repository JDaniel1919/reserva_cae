// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'Pantallas/Login.dart';
import 'Pantallas/Principal.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/text_theme.dart';

void main() {
  //debugPaintSizeEnabled=true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservaciones',
      theme: ThemeData(
        primaryColor: Color(0xff800040),
        primaryColorLight: Color(0xffb43f6b),
        primaryColorDark: Color(0xff4e001a),
        accentColor: Color(0xff9e9e9e),   
      ),
      home: Principal(),
    );
  }
}

