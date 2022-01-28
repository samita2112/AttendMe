import 'package:flutter/material.dart';
import 'dart:async';

class title extends StatefulWidget {
  const title({Key? key}) : super(key: key);

  @override
  _titleState createState() => _titleState();
}

class _titleState extends State<title> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/title.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AttendMe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 69.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
