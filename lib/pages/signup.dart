// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  //report({required this.imagePath});
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal[500],
      //   title: const Text(
      //     'plantd',
      //     style: TextStyle(
      //       fontSize: 30,
      //       fontFamily: 'Salsa',
      //     ),
      //   ),
      //   actions: [
      //     PopupMenuButton(
      //         icon: Icon(Icons.menu),
      //         onSelected: (value) {
      //           if (value == '/previous_reports') {
      //             Navigator.pushReplacementNamed(context, '/previous_reports');
      //           } else {
      //             Navigator.pushReplacementNamed(context, '/login');
      //           }
      //         },
      //         itemBuilder: (context) => [
      //               PopupMenuItem(
      //                   child: Text("Previous Report"),
      //                   value: '/previous_reports'),
      //               PopupMenuItem(
      //                 child: Text("Logout"),
      //                 value: '/login',
      //               )
      //             ]),
      //   ],
      //   // backgroundColor: Colors.red[500],
      // ),

      // body: const Center(
      //   // child: Image(image: AssetImage('assets/img2.png'),
      //   // ),

      //    ),
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
                    color: Colors.teal[100],
                  ),
                  clipper: CustomClipPath(),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      // SizedBox(
                      //   height: 80.0,
                      // ),
                      Text(
                        'SignUp',
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto'),
                      ),

                      SizedBox(height: 10.0),
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
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
                        // leading: Radio(
                        //   value: 1,
                        //   groupValue: val,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       val = value;
                        //     });
                        //   },
                        // ),
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
                      ),
                      const SizedBox(height: 20),
                      // FlatButton(
                      //   child: const Text("SignUp"),
                      //   onPressed: () {},
                      //   textColor: Colors.white,
                      //   color: Colors.indigo,
                      // )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 100.0),
              height: 350.0,
              width: 350.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/girl.png'), fit: BoxFit.cover),
              ),
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
