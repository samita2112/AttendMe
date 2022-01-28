import 'dart:io';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  //report({required this.imagePath});
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
                    color: Colors.teal[100],
                  ),
                  clipper: CustomClipPath(),
                ),
                const SizedBox(height: 20.0),
                Form(
                  child: Container(
                    padding: const EdgeInsets.only(left: 40.0, right: 80),
                    child: Column(
                      children: [
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
                        TextButton(
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.indigo[900]!),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 300.0,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 100.0),
                      height: 350.0,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/girl.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
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
