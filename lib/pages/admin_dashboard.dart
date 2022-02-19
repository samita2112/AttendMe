// import 'dart:html';
import 'dart:io';
import 'package:attendme/services/auth.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
          'Admin',
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
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Add Teachers',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(300.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal[100]!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Add Classes',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(300.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red[100]!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Add Students',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(300.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo[100]!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View/Edit Details',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(300.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber[100]!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Set Subjects',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15.0)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(300.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[100]!),
                ),
              ),
            ),
            ],
        ),
      ),
    );
  }
}
