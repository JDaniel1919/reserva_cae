import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Widgets usados en varias pantallas

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 200,
    height: 200,
    color: Colors.white,
  );
}

//Solo para copypaste en nueva pantallas
Container FondoPantallas(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(color: Color(0xffe0e0e0)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.of(context).size.height * 0.02,
          20,
          MediaQuery.of(context).size.height * 0.05),
    ),
  );
}

Drawer DrawerP(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xffbdbdbd),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 8.0,
                left: 4.0,
                child: Text(
                  "Reservaciones",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.circle_outlined),
          title: const Text('Reservaciones activas'),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Proximamente...'),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: const Text('Historial'),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Proximamente...'),
            ));
          },
        ),
        Divider(
          color: Color(0xffbdbdbd),
          thickness: 1,
          endIndent: 10,
        ),
        ListTile(
          leading: Icon(Icons.settings_outlined),
          title: const Text('Configuracion'),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Proximamente...'),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: const Text('Ayuda'),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Proximamente...'),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.accessibility_outlined),
          title: const Text('Acerca de nosotros'),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Proximamente...'),
            ));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout_outlined,
            color: Colors.red,
          ),
          title: const Text(
            'Cerrar sesión',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/Login', (Route<dynamic> route) => false);
            //Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

BottomAppBar AppBarInf(BuildContext context) {
  return BottomAppBar(
    color: Color(0xffb43f6b),
    shape: const CircularNotchedRectangle(),
    child: Container(
      height: 60.0,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.apps_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                //Navigator.popAndPushNamed(context, '/Principal');
                Navigator.popUntil(context, ModalRoute.withName('/Principal'));
                //Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Perfil');
              },
            ),
          ]),
    ),
  );
}

Container Sign_colores(BuildContext context, IconData icono) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icono, size: 25)),
            ),
            SizedBox(width: 10),
            Text("Disponible", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icono, size: 25)),
            ),
            SizedBox(width: 10),
            Text("Ocupado", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icono, size: 25)),
            ),
            SizedBox(width: 10),
            Text("En espera", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )
      ],
    ),
  );
}

// showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
//         return Container(
//           height: heightOfModalBottomSheet,
//           child: RaisedButton(onPressed: () {
//             setState(() {
//               heightOfModalBottomSheet += 10;
//             });
//           }),
//         );
//       });
// });