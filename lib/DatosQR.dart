import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:reserva_cae/main.dart';


final now = new DateTime.now();
String formatterFF = DateFormat('yMd').format(now);
//String formateerHH = DateFormat.Hm().format(now);
//String nombre = "PRUEBA";
bool isReserved = false;
String srv = "";
int num_srv = 0;
int estado = 3;
String nombre = "";
String boleta = "";
String fecha = formatterFF;

//nombre = "";
//import my_prj.globals;

//bool isLoggedIn = false;

// class GenQR{

//   // static String srv = "";
//   // static int num_srv = 0;
//   // static int estado = 3;
//   // static String nombre = "";
//   // static String boleta = "";
//   // static String fecha = "";
//   static late String srv;
//   static late int num_srv;
//   static late int estado;
//   static late String nombre;
//   static late String boleta;
//   static late String fecha;

// Future<String> RTDB() async{
//   final db = FirebaseDatabase.instance.ref('Usuarios');
//   final user = FirebaseAuth.instance.currentUser;
//   final uid = user?.uid;
//   final snapshot = await db.child('/$uid').get();
//   String temp = snapshot.value.toString();
//   return temp;
// }

//   // final snapshot = db.child('Usuarios/$user').get();

//   GenQR(String srv, int num_srv, int estado, String nombre, String boleta, String fecha);
// }

// var s;
// var a = RTDB(s);

// final snapshot = db.child('Usuarios/$user').get();

//GenQR(this.srv, this.num_srv, this.estado, this.nombre, this.boleta, this.fecha);

void RTDB_name() async {
  final db = FirebaseDatabase.instance.ref('Usuarios');
  final user = FirebaseAuth.instance.currentUser;
  final uid = user?.uid;
  final snapshot = await db.child('/$uid/Nombre').get();
  String temp = snapshot.value.toString();
  nombre = temp;
}

void RTDB_boleta() async {
  final db = FirebaseDatabase.instance.ref('Usuarios');
  final user = FirebaseAuth.instance.currentUser;
  final uid = user?.uid;
  final snapshot = await db.child('/$uid/Boleta').get();
  String temp = snapshot.value.toString();
  boleta = temp;
}

void Update_pc(String id, int estado) async {
  final db = FirebaseDatabase.instance.ref('Computadoras/$id');
  await db.update({
    "Estado": estado
  });
}
