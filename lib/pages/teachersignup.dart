// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class teachersignup extends StatelessWidget {
  //report({required this.imagePath});
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
                    height: 300,
                    color: Colors.blue,
                  ),
                  clipper: CustomClipPath(),
                ),
                const SizedBox(height: 10.0),
                Form(
                  child: Container(
                    padding: const EdgeInsets.only(left: 40.0, right: 80),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black87,
                              size: 30,
                            ),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black87,
                              size: 30,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black87,
                              size: 30,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black87,
                              size: 30,
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 30),
                        FlatButton(
                          child: const Text("SIGN UP"),
                          onPressed: () {},
                          textColor: Colors.white,
                          color: Colors.indigo[900],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/teacher-1.png'),
                              fit: BoxFit.cover),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      height: 140.0,
                      width: 140.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/teacher-2.png'),
                              fit: BoxFit.cover),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Teacher',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
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
