// ignore: depend_on_referenced_packages
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cae/Pantallas/Imprimir.dart';
import 'package:reserva_cae/Pantallas/Reservaciones.dart';
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
import 'Widgets/Time.dart';

//SISTEMA DE RESERVACIONES EN TIEMPO REAL CON CODIGOS QR
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final db = FirebaseDatabase.instance.ref();
  log('checking db connection');
  log('Conexion exitosa');
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        initialRoute: '/',
        routes: {
          '/': (context) => SplashSC(),
          '/Login': (context) => Login(),
          '/Registro': (context) => Registro(),
          '/Principal': (context) => ChangeNotifierProvider<TimerProvider>(
                create: (context) => TimerProvider(),
                child: Principal(),
              ),
          '/Computadoras': (context) => ChangeNotifierProvider<TimerProvider>(
                create: (context) => TimerProvider(),
                child: Computadoras(),
              ),
          '/Cubiculos': (context) => ChangeNotifierProvider<TimerProvider>(
                create: (context) => TimerProvider(),
                child: Cubiculos(),),
          '/Perfil': (context) => Perfil(),
          '/Reservaciones':(context) => Reservaciones(),
          '/Imprimir':(context) => Imprimir(),
        });
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
      navigateAfterSeconds: ChangeNotifierProvider<TimerProvider>(
        create: (context) => TimerProvider(),
        child: Login(),
      ),
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
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      //loaderColor: Theme.of(context).primaryColor,
      loaderColor: Colors.white,
      loadingText: Text("Cargando..."),
    );
  }
}
