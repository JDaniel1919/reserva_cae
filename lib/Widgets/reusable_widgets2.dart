import 'package:flutter/material.dart';

//Widgets usados en varias pantallas

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
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
      children: [
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
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: const Text('Historial'),
          onTap: () {
            Navigator.pop(context);
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
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: const Text('Ayuda'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.accessibility_outlined),
          title: const Text('Acerca de nosotros'),
          onTap: () {
            Navigator.pop(context);
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
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

BottomAppBar AppBarInf(BuildContext context){
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ]
            ),
        ),
  );
}