import 'package:flutter/material.dart';
import 'package:attendme/pages/login.dart';
import 'package:attendme/pages/scanpage.dart';
import 'package:attendme/pages/attendancemarked.dart';
import 'package:attendme/pages/StudentDashboard.dart';

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

        '/': (context) => scanpage(),
        // '/scanpage': (context) => scanpage(),
        // '/attendancemarked': (context) => attendancemarked(),
        // '/studentdashboard': (context) => StudentDashboard(),
      },
    );
  }
}


//return MaterialApp();