import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '/Widgets/reusable_widgets.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffe0e0e0)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.05,
                20,
                MediaQuery.of(context).size.height * 0.05),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Elige un sistema de reserva',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                SizedBox(
                  height: 15,
                ),
                BotonPrinc(
                    context,
                    "Reserva un cubiculo de estudio",
                    "Cubiculos",
                    Icons.book_outlined,
                    Color(0xfffadbd8),
                    Colors.orangeAccent,
                    Color(0xff4e001a)),
                SizedBox(
                  height: 15,
                ),
                BotonPrinc(
                    context,
                    "Reserva un equipo de computo",
                    "Computadoras",
                    Icons.computer_outlined,
                    Color(0xffd5f5e3),
                    Colors.green,
                    Color(0xff4e001a)),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Concurrencia',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Concurrencia(
                        context,
                        "Alta",
                        "Cubiculos",
                        Icons.book_outlined,
                        Color(0xfffadbd8),
                        Colors.orangeAccent,
                        Color(0xff4e001a)),
                    Concurrencia(
                        context,
                        "Baja",
                        "Computadoras",
                        Icons.computer_outlined,
                        Color(0xffd5f5e3),
                        Colors.green,
                        Color(0xff4e001a)),
                  ],
                )
              ],
            )),
      ),
      drawer: Drawer(),
    );
  }
}
