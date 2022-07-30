import '/Widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _NombreTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(500, 128, 0, 64)),
        child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height* 0.05,
                   20, MediaQuery.of(context).size.height* 0.05),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/LogoB.png"),
                  const SizedBox(
                    height: 35,
                  ),
                  reusableTextField("Nombre", Icons.person_outline,false,
                      _NombreTextController),
                   SizedBox(
                    height: 15,
                  ),   
                  reusableTextField("Correo electronico", Icons.email_outlined, false,
                      _emailTextController),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldPass(),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldPass(),
                  SizedBox(
                    height: 25,
                  ),
                  InicioSesionButton(context, false, () {}),
                  SizedBox(
                    height: 5,
                  ),
                  TextoAdd()
                ],
              )
              ),
      ),
    resizeToAvoidBottomInset: false
    );
  }

  Row TextoAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height * 0, 0, 0)
                  ),
        const Text("¿Ya tienes una cuenta? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          child: const Text(
            "Iniciar sesión",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}