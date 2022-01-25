// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  //report({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text(
          'plantd',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Salsa',
          ),
        ),
        actions: [
          PopupMenuButton(
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
                        child: Text("Previous Report"),
                        value: '/previous_reports'),
                    PopupMenuItem(
                      child: Text("Logout"),
                      value: '/login',
                    )
                  ]),
        ],
        // backgroundColor: Colors.red[500],
      ),

      // body: const Center(
      //   // child: Image(image: AssetImage('assets/img2.png'),
      //   // ),

      //    ),

      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  color: Colors.blue,
                ),
                clipper: CustomClipPath(),
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 80.0,
                    ),
                    Text(
                      'Diseases:',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Remedy:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    height: 250.0,
                    width: 250.0,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: FileImage(File(imagePath)),
                    //         fit: BoxFit.cover),
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.all(Radius.circular(10))),
                  )
                ],
              ),
            ],
          ),
        ],
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
