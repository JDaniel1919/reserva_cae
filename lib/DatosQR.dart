
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:reserva_cae/main.dart';

final now = new DateTime.now();
String formatterFF = DateFormat('dMy').format(now);
//String formateerHH = DateFormat.Hm().format(now);
//String nombre = "PRUEBA";
bool isReserved = false;
bool isTimerActive = false;
String srv = "";
String num_srv = "";
int estado = 3;
String nombre = "";
String boleta = "";
String fecha = formatterFF;
var timerQR;

//bool isLoggedIn = false;

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
  await db.update({"Estado": estado});
}

void Update_cub(String id, int estado) async {
  final db = FirebaseDatabase.instance.ref('Cubiculos/$id');
  await db.update({"Estado": estado});
}

