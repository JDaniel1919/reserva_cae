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
                    "Reserva un equipo de computo",
                    "Imprimir",
                    Icons.print_outlined,
                    Color(0xffd5f5e3),
                    Colors.green,
                    Colors.greenAccent),
                BotonPrinc(
                    context,
                    "Reserva un equipo de computo",
                    "Computadoras",
                    Icons.computer_outlined,
                    Color(0xffd5f5e3),
                    Colors.green,
                    Colors.greenAccent),
                BotonPrinc(
                    context,
                    "Reserva un cubiculo de estudio",
                    "Cubiculos",
                    Icons.book_outlined,
                    Color(0xfffadbd8),
                    Colors.orangeAccent,
                    Colors.deepOrangeAccent),
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
                Row(
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
                )
              ],
            )
            ),
      ),
      bottomNavigationBar: AppBarInf(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Mostrar codigo QR',
        onPressed: () {},
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
