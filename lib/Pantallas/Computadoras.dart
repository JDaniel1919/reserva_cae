import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';
import 'package:reserva_cae/Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:intl/intl.dart';

class Computadoras extends StatefulWidget {
  Computadoras({Key? key}) : super(key: key);

  @override
  State<Computadoras> createState() => _ComputadorasState();
}

// Color setColor(int Estado) {
//   //red is just a sample color
//   Color color;
//   if (Estado == 0) {
//     color = Colors.green;
//   } else if (Estado == 1) {
//     color = Colors.red;
//   } else if (Estado == 2) {
//     color = Colors.orange;
//   } else {
//     color = Colors.white;
//   }
//   return color;
// }

// PC1.onValue.listen((DatabaseEvent event) {
//     final data = event.snapshot.value;
// });

// PC1.onChildChanged().listen((DatabaseEvent event){
//   // String temp = event.snapshot.value.toString();
//   // print(temp);
// });

class _ComputadorasState extends State<Computadoras> {
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;
  late Timer timer;

  var st_pc01 = 3;
  var st_pc02 = 3;
  var st_pc03 = 3;
  var st_pc04 = 3;
  var st_pc05 = 3;
  var st_pc06 = 3;
  var st_pc07 = 3;
  var st_pc08 = 3;
  var st_pc09 = 3;
  var st_pc10 = 3;
  var st_pc11 = 3;
  var st_pc12 = 3;
  var st_pc13 = 3;
  var st_pc14 = 3;
  var st_pc15 = 3;

  @override
  final PC1 = FirebaseDatabase.instance.ref();
  final PC2 = FirebaseDatabase.instance.ref();
  final PC3 = FirebaseDatabase.instance.ref();
  final PC4 = FirebaseDatabase.instance.ref();
  final PC5 = FirebaseDatabase.instance.ref();
  final PC6 = FirebaseDatabase.instance.ref();
  final PC7 = FirebaseDatabase.instance.ref();
  final PC8 = FirebaseDatabase.instance.ref();
  final PC9 = FirebaseDatabase.instance.ref();
  final PC10 = FirebaseDatabase.instance.ref();
  final PC11 = FirebaseDatabase.instance.ref();
  final PC12 = FirebaseDatabase.instance.ref();
  final PC13 = FirebaseDatabase.instance.ref();
  final PC14 = FirebaseDatabase.instance.ref();
  final PC15 = FirebaseDatabase.instance.ref();

  final user = FirebaseAuth.instance.currentUser?.uid;
  //final db = FirebaseDatabase.instance.ref().child('Usuarios/$user');

  // final snapshot = db.child('Usuarios/$user').get();

  initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {});
    });
    super.initState();

    PC1.child('Computadoras/PC01/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      // String value = snapshot.value.toString();
      // st_pc01 = int.parse(value);
      st_pc01 = int.parse(snapshot.value.toString());
    });
    PC2.child('Computadoras/PC02/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc02 = int.parse(snapshot.value.toString());
    });
    PC3.child('Computadoras/PC03/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc03 = int.parse(snapshot.value.toString());
    });
    PC4.child('Computadoras/PC04/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc04 = int.parse(snapshot.value.toString());
    });
    PC5.child('Computadoras/PC05/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc05 = int.parse(snapshot.value.toString());
    });
    PC6.child('Computadoras/PC06/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc06 = int.parse(snapshot.value.toString());
    });
    PC7.child('Computadoras/PC07/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc07 = int.parse(snapshot.value.toString());
    });
    PC8.child('Computadoras/PC08/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc08 = int.parse(snapshot.value.toString());
    });
    PC9.child('Computadoras/PC09/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc09 = int.parse(snapshot.value.toString());
    });
    PC10.child('Computadoras/PC10/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc10 = int.parse(snapshot.value.toString());
    });
    PC11.child('Computadoras/PC11/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc11 = int.parse(snapshot.value.toString());
    });
    PC12.child('Computadoras/PC12/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc12 = int.parse(snapshot.value.toString());
    });
    PC13.child('Computadoras/PC13/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc13 = int.parse(snapshot.value.toString());
    });
    PC14.child('Computadoras/PC14/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      st_pc14 = int.parse(snapshot.value.toString());
    });
    PC15.child('Computadoras/PC15/Estado').onValue.listen((event) {
      var snapshot = event.snapshot;
      // String value = snapshot.value.toString();
      // st_pc01 = int.parse(value);
      st_pc15 = int.parse(snapshot.value.toString());
    });
  }

  void dispose() {
    super.dispose();
    timer.cancel();
  }

  // void resfresh(Expanded widget_ref){
  //   setState(() {
  //     build(context);
  //   });
  // }

  void resfresh() {
    setState(() {
      build(context);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computadoras"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffe0e0e0)),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20,
                  MediaQuery.of(context).size.height * 0.03,
                  20,
                  MediaQuery.of(context).size.height * 0.05),
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Reserva tu computadora',
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
                    "Manten limpios los equipos",
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Computadoras',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sala ' + (activeIndex + 1).toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  items: [
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
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 1 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 1;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC01", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C1",
                                  getColor(st_pc01))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 2 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 2;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC02", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C2",
                                  getColor(st_pc02))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 3 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 3;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC03", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C3",
                                  getColor(st_pc03))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 4 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 4;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC04", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C4",
                                  getColor(st_pc04))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 5 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 5;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC05", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C5",
                                  getColor(st_pc05))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 6 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 6;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC06", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C6",
                                  getColor(st_pc06))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 7 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 7;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC07", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C7",
                                  getColor(st_pc07))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 8 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 8;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC08", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C8",
                                  getColor(st_pc08))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 9 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 9;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC09", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer, "C9",
                                  getColor(st_pc09))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 10 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 10;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC10", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C10", getColor(st_pc10))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 11 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 11;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC11", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C11", getColor(st_pc11)))
                        ],
                      ),
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
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 12 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 12;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC12", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C12", getColor(st_pc12))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 13 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 13;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC13", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C13", getColor(st_pc13))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 14 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 14;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC14", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C14", getColor(st_pc14))),
                          GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Msg_Reserv(BuildContext,
                                            "¿Quieres reservar la PC 15 de la Sala 1",
                                            () {
                                          Navigator.pop(context, 'Cancelar');
                                        }, () {
                                          Navigator.pop(context, 'OK');
                                          srv = "Computadoras";
                                          num_srv = 15;
                                          estado = 2;
                                          isReserved = true;
                                          Update_pc("PC15", 2);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  MsgConfirmacion(BuildContext,
                                                      () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  }));
                                        }));
                              },
                              child: BotonReserva(context, Icons.computer,
                                  "C15", getColor(st_pc15))),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    initialPage: 0,
                    reverse: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                buildindicator(),

                // Expanded(
                //   child: GridView.count(
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 10,
                //     crossAxisCount: 4,
                //     children: <Widget>[
                //       for(var i = 1;i<=12;i++) GestureDetector(
                //         onTap: () {},
                //         child: BotonCompu(context, Icons.computer, "C"+ i.toString()),
                //       ),
                //     ],
                //   ),
                // ),
              ])),
        ),
      ),
      bottomNavigationBar: AppBarInf(context),
      drawer: DrawerP(context),
      //bottomNavigationBar: AppBarInf(context),
    );
  }

  Widget buildindicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: WormEffect(
          activeDotColor: Color(0xff800040),
          dotWidth: 10,
          dotHeight: 10,
        ),
      );

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
