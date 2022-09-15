import 'package:firebase_auth/firebase_auth.dart';

import '/Widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _NombreTextController = TextEditingController();
  TextEditingController _myController = TextEditingController();
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
                    logoWidget("assets/LogoB.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    reusableTextField("Nombre", Icons.person_outline, false,
                        _NombreTextController),
                    SizedBox(
                      height: 15,
                    ),
                    reusableTextField("Correo electronico",
                        Icons.email_outlined, false, _emailTextController),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldPass(
                        text: "Contraseña", controller: _myController),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldPass(
                        text: "Ingresa nuevamente la contraseña", controller: _passwordTextController),
                    SizedBox(
                      height: 25,
                    ),
                    BotonLogin(context, false, () {
                      try {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _myController.text,
                        )
                            .then((value) {
                          Navigator.pushNamed(context, '/Principal');
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    TextoAdd()
                  ],
                )),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  Row TextoAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0, 0, 0)),
        const Text("¿Ya tienes una cuenta? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/Login');
            //Navigator.pop(context);
          },
          child: const Text(
            "Iniciar sesión",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
