import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';
import 'package:reserva_cae/DatosQR.dart';

class Cubiculos extends StatefulWidget {
  Cubiculos({Key? key}) : super(key: key);

  @override
  State<Cubiculos> createState() => _CubiculosState();
}

class _CubiculosState extends State<Cubiculos> {
  late Timer timer;

  var st_cb01 = 3;
  var st_cb02 = 3;
  var st_cb03 = 3;
  var st_cb04 = 3;
  var st_cb05 = 3;
  var st_cb06 = 3;
  var st_cb07 = 3;
  var st_cb08 = 3;

  @override
  final CB1 = FirebaseDatabase.instance.ref();
  final CB2 = FirebaseDatabase.instance.ref();
  final CB3 = FirebaseDatabase.instance.ref();
  final CB4 = FirebaseDatabase.instance.ref();
  final CB5 = FirebaseDatabase.instance.ref();
  final CB6 = FirebaseDatabase.instance.ref();
  final CB7 = FirebaseDatabase.instance.ref();
  final CB8 = FirebaseDatabase.instance.ref();

  initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {});
    });
    super.initState();

    CB1.child('Cubiculos/CB01/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      // String value = snapshot.value.toString();
      // st_pc01 = int.parse(value);
      st_cb01 = int.parse(snapshot.value.toString());
    });
    CB2.child('Cubiculos/CB02/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb02 = int.parse(snapshot.value.toString());
    });
    CB3.child('Cubiculos/CB03/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb03 = int.parse(snapshot.value.toString());
    });
    CB4.child('Cubiculos/CB04/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb04 = int.parse(snapshot.value.toString());
    });
    CB5.child('Cubiculos/CB05/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb05 = int.parse(snapshot.value.toString());
    });
    CB6.child('Cubiculos/CB06/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb06 = int.parse(snapshot.value.toString());
    });
    CB7.child('Cubiculos/CB07/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb07 = int.parse(snapshot.value.toString());
    });
    CB8.child('Cubiculos/CB08/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_cb08 = int.parse(snapshot.value.toString());
    });
  }

  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubiculos"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(0xffe0e0e0)),
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).size.height * 0.03,
                    20,
                    MediaQuery.of(context).size.height * 0.05),
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Reserva tu cubiculo',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 22.0)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      "Manten limpio tu cubiculo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff800040),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cubiculos',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 1?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB01";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB01", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB1", getColor(st_cb01)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 2?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB02";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB02", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB2", getColor(st_cb02)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 3?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB03";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB03", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB3", getColor(st_cb03)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 4?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB04";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB04", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB4", getColor(st_cb04)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 5?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB05";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB05", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB5", getColor(st_cb05)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 6?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB06";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB06", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB6", getColor(st_cb06)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 7?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB07";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB07", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB7", getColor(st_cb07)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Msg_Reserv(
                                        BuildContext,
                                        "¿Quieres reservar el Cubiculo 8?", () {
                                      Navigator.pop(context, 'Cancelar');
                                    }, () {
                                      Navigator.pop(context, 'OK');
                                      srv = "Cubiculo";
                                      num_srv = "CB08";
                                      estado = 2;
                                      isReserved = true;
                                      Update_cub("CB08", 2);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MsgConfirmacion(BuildContext, () {
                                                Navigator.pop(context, 'OK');
                                              }));
                                    }));
                          },
                          child: BotonReserva(context, Icons.book_outlined,
                              "CB8", getColor(st_cb08)),
                        ),
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ),
      drawer: DrawerP(context),
      bottomNavigationBar: AppBarInf(context),
      //bottomNavigationBar: AppBarInf(context),
    );
  }

  Color getColor(int Estado) {
    Color color;
    if (Estado == 0) {
      color = Colors.green;
    } else if (Estado == 1) {
      color = Colors.red;
    } else if (Estado == 2) {
      color = Colors.orange;
    } else {
      color = Colors.white;
    }
    return color;
  }
}
