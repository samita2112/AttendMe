// import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  //report({required this.imagePath});
  // bool _value = false;

  int role = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    color: Colors.cyan[100],
                  ),
                  clipper: CustomClipPath(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 100.0),
                  height: 350.0,
                  width: 350,

                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/girl.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'SignUp',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto'),
                      ),

                      SizedBox(height: 10.0),
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.indigo,
                        ),
                      ),

                      SizedBox(height: 20.0),
                      ListTile(
                        title: Text(
                          'Teacher',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            value: 1,
                            groupValue: role,
                            onChanged: (int? value) {
                              setState(() {
                                role = value!;
                              });
                            },
                            activeColor: Colors.indigo[900],
                          ),
                        ),
                      ),
                      // SizedBox(height: 25.0),
                      ListTile(
                        title: Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            value: 2,
                            groupValue: role,
                            onChanged: (int? value) {
                              setState(() {
                                role = value!;
                              });
                            },
                            activeColor: Colors.indigo[900],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (role == 2) {
                                Navigator.pushReplacementNamed(
                                    context, '/studentsignup');
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/teachersignup');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.indigo[900]!),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height - 100, size.width / 2, size.height - 30);

    path.quadraticBezierTo(
        3 / 4 * size.width, size.height + 25, size.width, size.height - 25);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
