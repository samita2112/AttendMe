import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class stopAttendance extends StatefulWidget {
  @override
  State<stopAttendance> createState() => _stopAttendanceState();
}

class _stopAttendanceState extends State<stopAttendance> {
  String popuptext = "";
  bool stopp = false;
  //report({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.deepOrange[100],
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
                Text(
                  "Attendance Session Started",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.15,
                    fontSize: 23.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Image.asset(
                    'assets/tick.png',
                    height: 150.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    onPressed: () async {
                      var result;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                      setState(() {
                        popuptext = "Scan to stop attendance session";
                      });
                      bool isAvailable =
                          await NfcManager.instance.isAvailable();
                      // Start Session

                      if (isAvailable) {
                        NfcManager.instance.startSession(
                            onDiscovered: (NfcTag tag) async {
                          var ndef = Ndef.from(tag);

                          NdefMessage message = NdefMessage([
                            NdefRecord.createText(
                                'No division and subject assigned'),
                          ]);

                          // try {
                          await ndef!.write(message);
                          result = 'Success to "Ndef Write"';
                          print(result);
                          setState(() {
                            stopp = true;
                          });
                          if (stopp = true) {
                            Navigator.pushNamed(context, '/teacher_dashboard');
                          }
                          NfcManager.instance.stopSession();
                          // } catch (e) {
                          //   result = e;
                          //   NfcManager.instance.stopSession(
                          //       errorMessage:
                          //           result.toString());
                          // }
                        });
                      }
                    },
                    child: Text(
                      'Stop Attendance',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15.0)),
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size.fromWidth(250.0)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red[400]!),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text('$popuptext'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Tap your device on the tag to scan"),
        ],
      ),
    );
  }
}
