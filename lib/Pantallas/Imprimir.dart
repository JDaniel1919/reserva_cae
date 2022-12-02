import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Imprimir extends StatefulWidget {
  Imprimir({Key? key}) : super(key: key);

  @override
  State<Imprimir> createState() => _ImprimirState();
}

class _ImprimirState extends State<Imprimir> {
  //final storage = FirebaseStorage.instance.ref();
  //final mountainsRef = storageRef.child("mountains.jpg");
  //final imagesRef = storage.child("Documentos");
  //String? _directoryPath;
  //String? _fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imprimir documento")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffe0e0e0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.25,
              20,
              MediaQuery.of(context).size.height * 0.25),
          child: Column(children: [
            SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Text('Subir un documento para impresión',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            SizedBox(height: 30),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.16,
            //   width: MediaQuery.of(context).size.width * 0.85,
            //   //padding: const EdgeInsets.all(3.0),
            //   margin: const EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     color: Colors.grey,
            //     border: Border.all(color: Colors.grey, width: 2.5),
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),

            // ),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['docx', 'pdf', 'doc'],
                );

                //File file = File(result.path);

                if (result != null) {
                  Uint8List? fileBytes = result.files.first.bytes;
                  String fileName = result.files.first.name;
                  final file = result.files.first;
                  String path = (result.files.first.path).toString();
                  print("PATH222 $file.path");
                  print("PATH333 $path");
                  var myFile = File(path);
                  //File fileR = File(path);

                  //Upload file
                  await FirebaseStorage.instance
                      .ref('/Documentos/$fileName')
                      .putFile(myFile);
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Se ha subido el documento $fileName"),
                            content: Text(
                                "Avisa al administrador para imprimir tu documento"),
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
                }
              },
              child: Center(
                child: Icon(
                  Icons.upload_file_outlined,
                  size: 60,
                ),
                widthFactor: 2,
                heightFactor: 2,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ]),
        ),
      ),
    );
  }
}
