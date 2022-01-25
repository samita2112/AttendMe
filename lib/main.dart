import 'package:flutter/material.dart';
import 'package:attendme/pages/login.dart';

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

        '/': (context) => login(),
      },
    );
  }
}


//return MaterialApp();