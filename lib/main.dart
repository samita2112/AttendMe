import 'package:attendme/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:attendme/pages/signup.dart';

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

        //'/': (context) => signup(),
        '/': (context) => login(),
      },
    );
  }
}


//return MaterialApp();