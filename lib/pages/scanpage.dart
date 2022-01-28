import 'dart:io';
import 'package:flutter/material.dart';

class scanpage extends StatelessWidget {
  //report({required this.imagePath});
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/attendancemarked');
                      },
                      child: Text(
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
