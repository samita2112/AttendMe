import 'package:attendme/pages/admin_dashboard.dart';
import 'package:attendme/pages/teacher_dashboard.dart';
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
        '/admin_dashboard':(context)=> AdminDashboard(),
        '/teacher_dashboard':(context)=> TeacherDashboard(),
        '/login': (context) => login(),
      },
    );
  }
}


//return MaterialApp();