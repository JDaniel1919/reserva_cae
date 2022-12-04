import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';
import 'package:reserva_cae/Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final db = FirebaseDatabase.instance.ref();

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
        child: SingleChildScrollView(
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
                  EditDatos(context, "Nombre", "$nombre", false),
                  SizedBox(
                    height: 10,
                  ),
                  EditDatos(context, "Correo", "$correo", false),
                  SizedBox(
                    height: 10,
                  ),
                  EditDatos(context, "Contraseña", "$pass", true),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Center(
                              child: Icon(
                                Icons.edit,
                                size: 35,
                              ),
                              widthFactor: 1,
                              heightFactor: 2,
                            ),
                            Text("Editar datos"),
                    
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),),
                    
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: AppBarInf(context),
      drawer: DrawerP(context),
    );
  }
}
