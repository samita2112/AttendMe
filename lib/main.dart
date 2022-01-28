import 'package:flutter/material.dart';
import 'package:attendme/pages/login.dart';
import 'package:attendme/pages/studentsignup.dart';
import 'package:attendme/pages/teachersignup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // ignore: prefer_const_constructors
        //'/': (context) => title(),

        // '/': (context) => login(),
        '/studentsignup': (context) => studentsignup(),
        '/teachersignup': (context) => teachersignup(),
      },
    );
  }
}


//return MaterialApp();