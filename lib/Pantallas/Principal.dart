import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reserva_cae/DatosQR.dart';
import 'package:reserva_cae/Widgets/Time.dart';
import 'package:sprintf/sprintf.dart';
import '/Widgets/reusable_widgets.dart';
import '/Widgets/reusable_widgets2.dart';
import '/Widgets/Time.dart';
import 'package:reserva_cae/DatosQR.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  late Timer timer2;

  //Duration duration = Duration();
  //Timer? timer;
  String temp =
      srv + "|" + num_srv + "|" + nombre + "|" + boleta + "|" + fecha + "||";

  //Cambio qr
  // initState() {
  //   timer2 = Timer.periodic(Duration(seconds: 1), (t) {
  //     setState(() {});
  //   });
  //   super.initState();
  // }
  @override
  // void initState() {
  //   timer2 = Timer.periodic(Duration(seconds: 1), (t) {
  //     setState(() {});
  //   });
  //   // TODO: implement initState
  //   super.initState();
  //   //timerQR = Provider.of<TimerProvider>(context, listen: false);
  // }

  initState() {
    super.initState();
    timerQR = Provider.of<TimerProvider>(context, listen: false);
    timerQR.InitVariables();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservaciones"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xffe0e0e0)),
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20,
                  MediaQuery.of(context).size.height * 0.02,
                  20,
                  MediaQuery.of(context).size.height * 0.05),
              child: Consumer<TimerProvider>(
                builder: (context, timeprovider, widget) {
                  return Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Elige una opción',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BotonPrinc(
                          context,
                          "Agregar a cola de impresión",
                          "Imprimir",
                          Icons.print_outlined,
                          Color(0xffd5f5e3),
                          Colors.green,
                          Colors.greenAccent,
                          Colors.greenAccent, () {
                          Navigator.pushNamed(context, '/Imprimir');
                        timer2.cancel();
                      }),
                      BotonPrinc(
                          context,
                          "Reserva un equipo de computo",
                          "Computadoras",
                          Icons.computer_outlined,
                          Color(0xffd5f5e3),
                          Colors.green,
                          Colors.greenAccent,
                          Colors.greenAccent, () {
                        Navigator.pushNamed(context, '/Computadoras');
                        timer2.cancel();
                      }),
                      BotonPrinc(
                          context,
                          "Reserva un cubiculo de estudio",
                          "Cubiculos",
                          Icons.book_outlined,
                          Color(0xfffadbd8),
                          Colors.orangeAccent,
                          Colors.deepOrangeAccent,
                          Colors.deepOrangeAccent, () {
                        Navigator.pushNamed(context, '/Cubiculos');
                        timer2.cancel();
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Disponibilidad',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Disponibilidad(
                                context,
                                "Alta",
                                "Cubiculos",
                                Icons.book_outlined,
                                Color(0xfffadbd8),
                                Colors.orangeAccent,
                                Color(0xff4e001a)),
                            Disponibilidad(
                                context,
                                "Baja",
                                "Computadoras",
                                Icons.computer_outlined,
                                Color(0xffd5f5e3),
                                Colors.green,
                                Color(0xff4e001a)),
                          ],
                        ),
                      )
                    ],
                  );
                },
              )),
        ),
      ),
      bottomNavigationBar: AppBarInf(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Mostrar codigo QR',
        onPressed: () {
          RTDB_name();
          RTDB_boleta();
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (BuildContext context,
                    StateSetter setState /*You can rename this!*/) {
                  timer2 = Timer.periodic(Duration(seconds: 1), (t) {
                    setState(() {});
                  });
                  return FractionallySizedBox(
                    heightFactor: 0.7,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 5,
                            width: 25,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 2.5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Text("Escanea tu código QR",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 25,
                          ),
                          (isTimerActive)
                              ? QrImage(
                                  //data: "" + nombre,
                                  data: srv +
                                      "|" +
                                      num_srv +
                                      "|" +
                                      nombre +
                                      "|" +
                                      boleta +
                                      "|" +
                                      fecha +
                                      "||",
                                  size: 250,
                                )
                              : Center(
                                  child: Container(
                                    height: 250,
                                    width: 250,
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xffb43f6b),
                                      shape: BoxShape.rectangle,
                                      //border: Border.all(width: 2.5),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Inicia una reservacion\npara visualizar tu codigo QR",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                          // Container(
                          //   height: 250,
                          //   width: 250,
                          //   color: Colors.black45,
                          // ),
                          SizedBox(
                            height: 35,
                          ),
                          (isTimerActive)
                              ? Column(
                                  children: [
                                    Text("Tiempo restante: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                    //CountDownTimer(isTimerActive),
                                    Center(
                                      child: Text(
                                        //'${timerQR.minute} : ' + '${timerQR.seconds} ',
                                        sprintf("%02i:%02i",
                                            [timerQR.minute, timerQR.seconds]),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                      "Inicia una reservación para ver el tiempo restante"),
                                )
                        ],
                      ),
                    ),
                  );
                });
              });
        },
        child: const Icon(
          Icons.qr_code_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      drawer: DrawerP(context),
    );
  }
}
