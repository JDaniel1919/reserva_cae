// ignore: depend_on_referenced_packages
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:reserva_cae/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/Pantallas/Computadoras.dart';
import 'package:reserva_cae/Pantallas/Cubiculos.dart';
import 'package:reserva_cae/Pantallas/Perfil.dart';
import 'package:reserva_cae/Pantallas/Registro.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Pantallas/Login.dart';
import 'Pantallas/Principal.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  //FirebaseDatabase database = FirebaseDatabase.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final db = FirebaseDatabase.instance.ref();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  log('checking db connection!');
  final snapshot = await db.child('Usuarios/US01').get();
    String temp = snapshot.value.toString();
    print(temp + "Hola");
    //print(snapshot.value);


  debugPaintSizeEnabled=false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
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
        //home: Perfil(),
      //home: Perfil(),
      initialRoute: '/',
      routes:{
        '/':(context) => SplashSC(),
        '/Login':(context) => Login(),
        '/Registro':(context) => Registro(),
        '/Principal':(context) => Principal(),
        '/Computadoras':(context) => Computadoras(),
        '/Cubiculos':(context) => Cubiculos(),
        '/Perfil':(context) => Perfil()
      }
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
      seconds: 3,
      //navigateAfterSeconds: Principal(),
      navigateAfterSeconds: Login(),
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
      photoSize: 120,
      styleTextUnderTheLoader: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold,
           color: Colors.white),
      //loaderColor: Theme.of(context).primaryColor,
      loaderColor: Colors.white,
      loadingText: Text("Cargando..."),
    );
  }
}
