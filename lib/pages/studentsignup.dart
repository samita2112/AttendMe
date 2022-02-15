// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:attendme/services/auth.dart';

class studentsignup extends StatefulWidget {
  @override
  State<studentsignup> createState() => _studentsignupState();
}

class _studentsignupState extends State<studentsignup> {
  //report({required this.imagePath});
  @override
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  String name = '';

  String email = '';

  String phone = '';

  String rollno = '';

  String division = '';
  String year = 'first';
  String branch = '';
  String password = '';

  String confirmpassword = '';

  String error = '';
  List<DropdownMenuItem<String>> yearItems = [
    DropdownMenuItem(child: Text("First"), value: "first"),
    DropdownMenuItem(child: Text("Second"), value: "second"),
    DropdownMenuItem(child: Text("Third"), value: "third"),
    DropdownMenuItem(child: Text("Fourth"), value: "fourth"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      color: Colors.cyan[100],
                    ),
                    clipper: CustomClipPath(),
                  ),
                  const SizedBox(height: 10.0),
                  Form(
                    key: _formkey,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40.0, right: 80),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter name' : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            },
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
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
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
                          DropdownButton(
                              onChanged: (value) => {},
                              value: year,
                              items: yearItems),
                          // TextFormField(
                          //   validator: (val) =>
                          //       val!.isEmpty ? 'Enter Year' : null,
                          //   onChanged: (val) {
                          //     setState(() => year = val);
                          //   },
                          //   decoration: InputDecoration(
                          //     icon: Icon(
                          //       Icons.groups,
                          //       color: Colors.black87,
                          //       size: 30,
                          //     ),
                          //     hintText: 'Year',
                          //     hintStyle: TextStyle(color: Colors.grey),
                          //   ),
                          // ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Branch' : null,
                            onChanged: (val) {
                              setState(() => branch = val);
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.groups,
                                color: Colors.black87,
                                size: 30,
                              ),
                              hintText: 'Branch',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter division' : null,
                            onChanged: (val) {
                              setState(() => division = val);
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.groups,
                                color: Colors.black87,
                                size: 30,
                              ),
                              hintText: 'Division',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter roll no.' : null,
                            onChanged: (val) {
                              setState(() => rollno = val);
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.card_giftcard,
                                color: Colors.black87,
                                size: 30,
                              ),
                              hintText: 'Roll number',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter password' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            obscureText: true,
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
                          TextFormField(
                            validator: (val) => (val != password)
                                ? 'Passwords do not match'
                                : null,
                            onChanged: (val) {
                              setState(() => confirmpassword = val);
                            },
                            obscureText: true,
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
                          const SizedBox(height: 10),
                          FlatButton(
                            child: const Text("SIGN UP"),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                dynamic result = await _auth.registerStudent(
                                    email,
                                    password,
                                    name,
                                    division,
                                    rollno,
                                    year,
                                    branch);
                                if (result == null) {
                                  setState(() =>
                                      error = 'Please enter a valid Email Id');
                                }
                              }
                            },
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
                                image: AssetImage('assets/student-1.png'),
                                fit: BoxFit.cover),
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      const SizedBox(width: 20.0),
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/student-2.png'),
                                fit: BoxFit.cover),
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Student',
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
