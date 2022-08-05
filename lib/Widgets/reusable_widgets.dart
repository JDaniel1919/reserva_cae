import 'package:flutter/material.dart';

class TextFieldPass extends StatefulWidget {
  const TextFieldPass({Key? key}) : super(key: key);

  @override
  State<TextFieldPass> createState() => _TextFieldPassState();
}

class _TextFieldPassState extends State<TextFieldPass> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        labelText: "Contraseña",
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
    Color ColorBorder) {
  return GestureDetector(
    onTap: () {
      const snackBar = SnackBar(content: Text('Tap'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    // The custom button
    child: Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorBoton,
        border: Border.all(color: ColorBorder, width: 2.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(children: <Widget>[
        Container(
          child: Center(
            child: Icon(
              icon,
              color: Colors.white70,
              size: 30,
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
          width: 85.0,
          height: 85.0,
        ),
        SizedBox(
          width: 75,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment(-0.35, -2),
              child: Text(TextoPrinc),
              widthFactor: 0,
              heightFactor: 0,
            ),
            SizedBox(
              height: 0,
            ),
            Align(
              alignment: Alignment(-0.4, 0.75),
              child: Text(
                TextoSec,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              widthFactor: 0,
              heightFactor: 0,
            ),
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

Container BotonReserva(BuildContext, IconData icon, String texto){
  return Container(
    color: Color(0xffe0e0e0),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Icon(icon, size: 30)
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(texto),
        )
      ]
    ),
  );
}