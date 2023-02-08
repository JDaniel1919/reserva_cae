import 'package:firebase_auth/firebase_auth.dart';
import '/Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';
import 'package:flutter/material.dart';

//Login
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _myController = TextEditingController();
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
                    20,
                    MediaQuery.of(context).size.height * 0.05,
                    20,
                    MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/LogoW.png"),
                    const SizedBox(
                      height: 35,
                    ),
                    reusableTextField("Correo electronico",
                        Icons.email_outlined, false, _emailTextController),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldPass(
                        text: "Contraseña", controller: _myController),
                    SizedBox(
                      height: 20,
                    ),
                    BotonLogin(context, true, () {
                      //Navigator.pushNamed(context, '/Principal');
                      try {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _myController.text)
                            .then((value) {
                          Navigator.pushNamed(context, '/Principal');
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    TextoRegistro()
                  ],
                )),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  Row TextoRegistro() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0, 0, 0)),
        const Text("¿No tienes una cuenta? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/Registro');
          },
          child: const Text(
            "Registrate",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
