import 'package:flutter/material.dart';
import 'package:reserva_cae/Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.person_rounded,
                        size: 50,
                        color: Colors.black45,
                      ),
                      backgroundColor: Colors.black12),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xffbdbdbd),
                  thickness: 1,
                  endIndent: 0,
                ),
                SizedBox(
                  height: 10,
                ),
                EditDatos(context, "Nombre", "Braumi", false),
                SizedBox(
                  height: 10,
                ),
                EditDatos(context, "Apellido", "Abrajan", false),
                SizedBox(
                  height: 10,
                ),
                EditDatos(context, "Correo", "brau_25@gmail.com", false),
                SizedBox(
                  height: 10,
                ),
                EditDatos(context, "Contraseña", "password", true),
              ],
            )),
      ),
      bottomNavigationBar: AppBarInf(context),
      drawer: DrawerP(context),
    );
  }
}
