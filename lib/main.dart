import 'dart:ui';
import 'package:attendme/pages/attendeelist.dart';
import 'package:attendme/pages/login.dart';
import 'package:attendme/pages/forgotPasswordPage.dart';
import 'package:attendme/pages/viewattendance.dart';
import 'package:flutter/material.dart';
import 'package:attendme/pages/signup.dart';
import 'package:attendme/pages/admin_dashboard.dart';
import 'package:attendme/pages/teacher_dashboard.dart';
import 'package:attendme/pages/profile.dart';
import 'package:attendme/pages/title.dart';
import 'package:flutter/material.dart';
import 'package:attendme/pages/login.dart';
import 'package:attendme/pages/scanpage.dart';
import 'package:attendme/pages/attendancemarked.dart';
import 'package:attendme/pages/StudentDashboard.dart';
import 'package:attendme/pages/studentsignup.dart';
import 'package:attendme/pages/stopattendance.dart';
import 'package:attendme/pages/teachersignup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // ignore: prefer_const_constructors
        //'/': (context) => title(),

        '/': (context) => title(),
        '/profile': (context) => profile(),
        // '/editprofile': (context) => editprofile(
        //       type: Type,
        //     ),
        '/signup': (context) => signup(),
        '/admin_dashboard': (context) => AdminDashboard(),
        '/forgotPasswordPage': (context) => forgotPasswordPage(),
        '/teacher_dashboard': (context) => TeacherDashboard(),
        '/login': (context) => login(),
        '/scanpage': (context) => scanpage(),
        '/attendancemarked': (context) => attendancemarked(),
        '/studentdashboard': (context) => StudentDashboard(),
        '/studentsignup': (context) => studentsignup(),
        '/teachersignup': (context) => teachersignup(),
        '/viewattendance': (context) => ViewAttendance(),
        '/stopattendance': (context) => stopAttendance(),
      },
    );
  }
}


//return MaterialApp();