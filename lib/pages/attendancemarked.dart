import 'dart:io';
import 'package:flutter/material.dart';

class attendancemarked extends StatelessWidget {
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
                  "Your attendance for this session is marked.",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
