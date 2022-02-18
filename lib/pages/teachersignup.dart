// ignore_for_file: deprecated_member_use

import 'package:attendme/services/auth.dart';
import 'package:flutter/material.dart';

class teachersignup extends StatefulWidget {
  @override
  State<teachersignup> createState() => _teachersignupState();
}

class _teachersignupState extends State<teachersignup> {
  //report({required this.imagePath});
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  String name = '';

  String email = '';

  String phone = '';

  String password = '';
  String? branch = null;

  String confirmpassword = '';

  String error = '';

  List<DropdownMenuItem<String>> branchItems = [
    DropdownMenuItem(child: Text("CMPN"), value: "cmpn"),
    DropdownMenuItem(child: Text("INFT"), value: "inft"),
    DropdownMenuItem(child: Text("EXTC"), value: "extc"),
    DropdownMenuItem(child: Text("ETRX"), value: "etrx"),
    DropdownMenuItem(child: Text("INST"), value: "inst"),
    DropdownMenuItem(child: Text("AIDS"), value: "aids"),
  ];

  @override
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
                      height: 300,
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
                          DropdownButtonFormField(
                              onChanged: (String? newValue) {
                                setState(() {
                                  branch = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.account_balance,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              // isExpanded: true,

                              hint: Text('Branch'),
                              value: branch,
                              items: branchItems),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter phone no.' : null,
                            onChanged: (val) {
                              setState(() => phone = val);
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black87,
                                size: 30,
                              ),
                              hintText: 'Phone no.',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return ("Email is Required.");
                              } else {
                                if (val.trim().contains("@ves.ac.in")) {
                                  return null;
                                } else {
                                  return "Enter VES id";
                                }
                              }
                            },
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
                          const SizedBox(height: 30),
                          FlatButton(
                            child: const Text("SIGN UP"),
                            onPressed: () async {
                              // Navigator.pushReplacementNamed(
                              //     context, '/teacher_dashboard');
                              if (_formkey.currentState!.validate()) {
                                dynamic result = await _auth.registerTeacher(
                                    email, password, phone, branch!, name);
                                if (result == null) {
                                  setState(() =>
                                      error = 'Please enter a valid Email Id');
                                } else
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
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
                        height: 120.0,
                        width: 120.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/teacher1.png'),
                                fit: BoxFit.cover),
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        height: 120.0,
                        width: 120.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/teacher2.png'),
                                fit: BoxFit.cover),
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
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
