import 'package:flutter/material.dart';

class TextFieldPass extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const TextFieldPass({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<TextFieldPass> createState() => _TextFieldPassState();
}

class _TextFieldPassState extends State<TextFieldPass> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscure,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(color: Colors.white70, Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        labelText: widget.text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container BotonLogin(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'Iniciar sesión' : 'Registrarse',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

GestureDetector BotonPrinc(
    BuildContext context,
    String TextoPrinc,
    String TextoSec,
    IconData icon,
    Color ColorBoton,
    Color ColorIcon,
    Color ColorBorder,
    Color ColorBorder2,
    Function Tap) {
  return GestureDetector(
    onTap: () {
      Tap();
    },
    // The custom button
    child: Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.85,
      //padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: ColorBoton,
        border: Border.all(color: ColorBorder2, width: 2.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(children: <Widget>[
        Container(
          child: Center(
            child: Icon(
              icon,
              color: Colors.white70,
              size: MediaQuery.of(context).devicePixelRatio * 12,
            ),
          ),
          margin: const EdgeInsets.all(3.0),
          //padding: const EdgeInsets.all(1.0),
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
              color: ColorIcon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              )),
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(children: <Widget>[
                Text(
                  TextoSec,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(TextoPrinc),
              ]),
            )
          ],
        )
      ]),
    ),
  );
}

Container Disponibilidad(
    BuildContext context,
    String TextoPrinc,
    String TextoSec,
    IconData icon,
    Color ColorBoton,
    Color ColorIcon,
    Color ColorBorder) {
  return Container(
    width: 132.0,
    height: 140.0,
    padding: const EdgeInsets.all(6.0),
    margin: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: ColorBoton,
      border: Border.all(color: ColorBorder, width: 2.5),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: <Widget>[
        Container(
          child: Center(
            child: Icon(
              icon,
              color: Colors.white70,
              size: 25,
            ),
          ),
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(1.0),
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
              color: ColorIcon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              )),
          width: 60.0,
          height: 60.0,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            TextoSec,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          widthFactor: 0,
          heightFactor: 0,
        ),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(TextoPrinc),
          widthFactor: 0,
          heightFactor: 0,
        ),
      ],
    ),
  );
}

Container BotonReserva(
    BuildContext, IconData icon, String texto, Color ColorDisp) {
  return Container(
    color: Color(0xffe0e0e0),
    child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorDisp,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, size: 30)),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(texto),
      )
    ]),
  );
}

GestureDetector EditDatos(
    BuildContext context, String Texto1, String Texto2, bool isPasswordType) {
  int len = Texto2.length;
  if (isPasswordType) {
    Texto2 = "*" * len;
  }
  return GestureDetector(
    onTap: () {
      const snackBar = SnackBar(content: Text('Tap'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Container(
      margin: EdgeInsets.only(left: 15),
      color: Colors.transparent,
      height: 75,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(Texto1,
                    style: TextStyle(color: Colors.black54, fontSize: 16))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(Texto2,
                    style: TextStyle(color: Colors.black, fontSize: 18)))
          ],
        ),
      ),
    ),
  );
}

AlertDialog Msg_Reserv(
    BuildContext, String text, Function popc, Function popok) {
  return AlertDialog(
    title: const Text('Confirma tu reservación'),
    content: Text(text),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          popc();
        },
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          popok();
        },
        child: const Text('OK'),
      ),
    ],
    actionsAlignment: MainAxisAlignment.spaceEvenly,
  );
}

AlertDialog MsgConfirmacion(BuildContext, Function popok) {
  return AlertDialog(
    title: const Text('Reservación exitosa'),
    content: Text(
        "Recuerda que tienes 5 minutos para validar tu reservación escaneando tu código QR"),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          popok();
        },
        child: const Text('OK'),
      ),
    ],
    actionsAlignment: MainAxisAlignment.center,
  );
}
