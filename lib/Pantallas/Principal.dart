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
                const Text('Elige un sistema de reserva',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                BotonPrinc(context, "Reserva un cubiculo de estudio", "Cubiculos", Colors.blue)
              ],
            )),
      ),
      drawer: Drawer(),
    );
  }
}
