import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

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

Container InicioSesionButton(
    BuildContext context, bool isLogin, Function onTap) {
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

class BotonMenu extends StatelessWidget {
  const BotonMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 149, 102),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}

GestureDetector BotonPrinc(BuildContext context, String TextoPrinc,
    String TextoSec, Color ColorBoton) {
  return GestureDetector(
    // When the child is tapped, show a snackbar.
    onTap: () {
      const snackBar = SnackBar(content: Text('Tap'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    // The custom button
    child: Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: ColorBoton,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: 
      Row(children: <Widget>[
        Container(
          child: Center(
            child: Icon(Icons.access_alarm),
          ),
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          width: 75.0,
          height: 100.0,
        ),
        SizedBox(
              width: 75,
            ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(TextoPrinc),
              widthFactor: MediaQuery.of(context).padding.bottom,
              heightFactor: MediaQuery.of(context).padding.bottom,
            ),
            SizedBox(
              height: 0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(TextoSec),
              widthFactor: MediaQuery.of(context).padding.left,
              heightFactor: MediaQuery.of(context).padding.left,
            ),
          ],
        )
      ]),
    ),
  );
}
