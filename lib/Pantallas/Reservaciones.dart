import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';

class Reservaciones extends StatefulWidget {
  const Reservaciones({Key? key}) : super(key: key);

  @override
  State<Reservaciones> createState() => _Reservaciones();
  //State();
}

class _Reservaciones extends State<Reservaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reservaciones")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffe0e0e0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.02,
              20,
              MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.85,
                //padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey, width: 2.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: (isReserved)
                    ? Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Container(
                                  child: Text("Nombre: $nombre",
                                      textAlign: TextAlign.start),
                                  width: 190,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text(
                                    "Boleta: $boleta",
                                    textAlign: TextAlign.start,
                                  ),
                                  width: 180,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text("Servicio: $srv",
                                      textAlign: TextAlign.start),
                                  width: 180,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text(
                                    "No. Servicio: $num_srv",
                                    textAlign: TextAlign.start,
                                  ),
                                  width: 180,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text("Fecha: $fecha",
                                      textAlign: TextAlign.start),
                                  width: 180,
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Finalizar sesión activa",
                                    style: TextStyle(fontSize: 10)),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (srv == "Computadoras") {
                                      Update_pc(num_srv, 0);
                                    } else {
                                      Update_cub(num_srv, 0);
                                    }
                                                      showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Se ha finalizado la sesión actual"),
                            content: Text(
                                "$srv - $num_srv"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                            actionsAlignment: MainAxisAlignment.center,
                          ));
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.power_settings_new,
                                      size: 30,
                                    ),
                                    widthFactor: 2,
                                    heightFactor: 2,
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),

                                // Container(
                                //   child: Text("Tiempo: ", textAlign: TextAlign.start),
                                //   width: 100,
                                // ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Text(
                          "Realiza una reservacion para ver la informacion de ella",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
