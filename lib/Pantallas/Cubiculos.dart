import 'package:flutter/material.dart';
import '../Widgets/reusable_widgets.dart';

class Cubiculos extends StatefulWidget {
  Cubiculos({Key? key}) : super(key: key);

  @override
  State<Cubiculos> createState() => _CubiculosState();
}

class _CubiculosState extends State<Cubiculos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubiculos"),
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
                    for (var i = 1; i <= 12; i++)
                      GestureDetector(
                        onTap: () {},
                        child: BotonReserva(
                            context, Icons.book_outlined, "C" + i.toString()),
                      ),
                  ],
                ),
              ),
            ])),
      ),
      drawer: DrawerP(context),
      bottomNavigationBar: AppBarInf(context),
      //bottomNavigationBar: AppBarInf(context),
    );
  }
}
