// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:reserva_cae/Pantallas/Computadoras.dart';
import 'package:reserva_cae/Pantallas/Registro.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Pantallas/Login.dart';
import 'Pantallas/Principal.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/text_theme.dart';

void main() {
  debugPaintSizeEnabled=false;
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
        //accentColor: Color(0xffe0e0e0),
        accentColor: Color(0xff9e9e9e),
        appBarTheme: AppBarTheme(
          color: Color(0xff800040),
        ),
      ),
      //home: SplashSC(),
      home: Principal(),
    );
  }
}

class SplashSC extends StatefulWidget {
  SplashSC({Key? key}) : super(key: key);

  @override
  State<SplashSC> createState() => _SplashSCState();
}

class _SplashSCState extends State<SplashSC> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Principal(),
      image: Image.asset("assets/LogoC.png"),
      backgroundColor: Color(0xffffffff),
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          Theme.of(context).primaryColor,
        ],
      ),
      photoSize: 150,
      styleTextUnderTheLoader: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold,
           color: Colors.white),
      //loaderColor: Theme.of(context).primaryColor,
      loaderColor: Colors.white,
      loadingText: Text("Cargando..."),
    );
  }
}
