import 'package:attendme/pages/admin_dashboard.dart';
import 'package:attendme/pages/teacher_dashboard.dart';
import 'package:attendme/pages/title.dart';
import 'package:flutter/material.dart';
import 'package:attendme/pages/login.dart';
import 'package:attendme/pages/scanpage.dart';
import 'package:attendme/pages/attendancemarked.dart';
import 'package:attendme/pages/StudentDashboard.dart';
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
        '/': (context) => title(),
        // '/': (context) => login(),
        '/admin_dashboard':(context)=> AdminDashboard(),
        '/teacher_dashboard':(context)=> TeacherDashboard(),
        '/login': (context) => login(),
        '/scanpage': (context) => scanpage(),
        '/attendancemarked': (context) => attendancemarked(),
        '/studentdashboard': (context) => StudentDashboard(),
        '/studentsignup': (context) => studentsignup(),
        '/teachersignup': (context) => teachersignup(),
      },
    );
  }
}


//return MaterialApp();