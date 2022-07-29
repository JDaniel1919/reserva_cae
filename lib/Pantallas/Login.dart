import '/Widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(500, 128, 0, 64)),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/LogoB.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Correo electronico", Icons.email_outlined, false,
                      _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  rsTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  InicioSesionButton(context, true, () {}),
                  BotonInicioSesion()
                ],
              )),
        ),
      ),
    );
  }

  Row BotonInicioSesion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes una cuenta? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          child: const Text(
            "Registrate",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
