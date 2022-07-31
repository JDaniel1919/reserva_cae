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
                MediaQuery.of(context).size.height * 0.03,
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
                    Colors.deepOrangeAccent),
                SizedBox(
                  height: 0,
                ),
                BotonPrinc(
                    context,
                    "Reserva un equipo de computo",
                    "Computadoras",
                    Icons.computer_outlined,
                    Color(0xffd5f5e3),
                    Colors.green,
                    Colors.greenAccent),
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
                  height: 10,
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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffb43f6b),
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 65.0,
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
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Escanear codigo QR',
        onPressed: () {},
        child: const Icon(
          Icons.qr_code_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      drawer: Drawer(
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
              leading: Icon(Icons.logout_outlined, color: Colors.red,),
              title: const Text('Cerrar sesión', style: TextStyle(color: Colors.red, fontSize: 18),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
