import 'dart:convert';
import 'dart:io';
import 'package:attendme/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendme/services/nfc.dart';
import 'package:nfc_manager/nfc_manager.dart';

class scanpage extends StatefulWidget {
  @override
  State<scanpage> createState() => _scanpageState();
}

class _scanpageState extends State<scanpage> {
  Nfc inst = Nfc();
  bool attendancemarked = false;
  final AuthService _auth = AuthService();
  final db = AuthService().db;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.deepPurple[100],
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              // image:DecorationImage(
              // image: FileImage(File(imagePath)),
              // fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.qr_code_scanner,
                  size: 200.0,
                  color: Colors.blueGrey[900],
                ),
                Container(
                  height: 50.0,
                  width: 100.0,
                  margin: EdgeInsets.only(top: 100.0),
                  child: TextButton(
                      onPressed: () async {
                        var result1;
                        bool isAvailable =
                            await NfcManager.instance.isAvailable();
                        // Start Session

                        if (isAvailable) {
                          NfcManager.instance.startSession(
                              onDiscovered: (NfcTag tag) async {
                            final tech = Ndef.from(tag);
                            var jsonString;
                            final cachedMessage = tech?.cachedMessage;
                            String? decodedPayload;
                            Iterable.generate(cachedMessage!.records.length)
                                .forEach((i) {
                              final record = cachedMessage.records[i];

                              decodedPayload = utf8.decode(record.payload);
                              jsonString = decodedPayload!.substring(3);
                              result1 = jsonDecode(jsonString);
                              print(result1["Subject"]);
                            });
                            NfcManager.instance.stopSession();
                            final User? user = auth.currentUser;
                            final uid = user!.uid;
                            var collection = db.collection('users');
                            //var querySnapshot = await collection.get();
                            var docSnapshot = await collection.doc(uid).get();

                            Map<String, dynamic> data = docSnapshot.data()!;

                            print(uid);
                            if (result1 != null) {
                              final storeresult = await db
                                  .collection('divisions')
                                  .doc(result1["Division"])
                                  .collection("subjects")
                                  .doc(result1["Subject"])
                                  .collection(result1['Date'])
                                  .doc(uid)
                                  .set({
                                "uid": uid,
                                "Rollno": data['Rollno'],
                                "Name": data['Name']
                              });
                              setState(() {
                                attendancemarked = true;
                              });
                              if (attendancemarked = true) {
                                Navigator.pushNamed(
                                    context, '/attendancemarked');
                              }
                            }
                          });
                        }
                      },
                      child: const Text(
                        "SCAN",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey[900]!),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
