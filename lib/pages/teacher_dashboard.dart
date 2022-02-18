// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:attendme/services/auth.dart';

class TeacherDashboard extends StatefulWidget {
  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final AuthService _auth = AuthService();
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
          'Teacher',
          style: TextStyle(
              fontSize: 21, fontFamily: 'Salsa', fontWeight: FontWeight.w500),
        ),
        leading: PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (value) {
              if (value == '/profile') {
                Navigator.pushReplacementNamed(context, '/profile');
              } else {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Profile"),
                    value: '/profile',
                  ),
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
              'assets/teachers.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Take Attendance',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(250.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple[100]!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/viewattendance');
                },
                child: Text(
                  'View Attendee List',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(250.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber[100]!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
