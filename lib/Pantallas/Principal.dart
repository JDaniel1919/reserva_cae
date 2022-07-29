import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservaciones"),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Elige un sistema de reserva',
            ),
          ],
        ),
      drawer: Drawer(),
    );
  }
}