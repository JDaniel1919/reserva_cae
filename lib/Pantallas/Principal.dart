import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '/Widgets/reusable_widgets.dart';
import '/Widgets/reusable_widgets2.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
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
              child: Column(
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
                      Colors.greenAccent,
                      () {}),
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
              )),
        ),
      ),
      bottomNavigationBar: AppBarInf(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Mostrar codigo QR',
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              builder: (BuildContext context) {
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
                          height: 25,
                        ),
                        Text("Escanea tu código QR",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        QrImage(
                          data: '''
                          {
                          'nombre': 'Braumi',
                          'paterno': 'Abrajan',
                          'materno': 'Hinojosa',
                          'matricula': '2019350001',
                          'servicio': 'Computadora'
                          }
                          ''',
                          size: 250,
                        ),
                        // Container(
                        //   height: 250,
                        //   width: 250,
                        //   color: Colors.black45,
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                        Text("Tiempo restante: ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                );
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
