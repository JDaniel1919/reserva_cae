import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/Widgets/reusable_widgets.dart';

class Computadoras extends StatefulWidget {
  Computadoras({Key? key}) : super(key: key);

  @override
  State<Computadoras> createState() => _ComputadorasState();
}

class _ComputadorasState extends State<Computadoras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computadoras"),
      ),
      body: Container(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Computadoras',
                    textAlign: TextAlign.end,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
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
                    for(var i = 1;i<=12;i++) GestureDetector(
                      onTap: () {},
                      child: BotonCompu(context, Icons.computer, "C"+ i.toString()),
                    ),
                  ],
                ),
              ),
            ])),
      ),
      drawer: DrawerP(context),
      //bottomNavigationBar: AppBarInf(context),
    );
  }
}
