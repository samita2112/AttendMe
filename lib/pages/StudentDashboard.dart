// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  //report({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        iconTheme: IconThemeData(
          color: Colors.blue[900],
        ),
        titleTextStyle: TextStyle(color: Colors.blue[900]),
        backgroundColor: Colors.white,
        title: const Text(
          'Student',
          style: TextStyle(
              fontSize: 21, fontFamily: 'Salsa', fontWeight: FontWeight.w500),
        ),
        leading: PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (value) {
              if (value == '/previous_reports') {
                Navigator.pushReplacementNamed(context, '/previous_reports');
              } else {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Logout"),
                    value: '/login',
                  )
                ]),
        // backgroundColor: Colors.red[500],
      ),

      // body: const Center(
      //   // child: Image(image: AssetImage('assets/img2.png'),
      //   // ),

      //    ),

      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/student.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 70.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'GIVE ATTENDANCE',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(250.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo[900]!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
