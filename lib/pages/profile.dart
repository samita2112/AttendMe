import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendme/services/auth.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  //report({required this.imagePath});
  bool edit = false;
  final AuthService _auth = AuthService();
  final db = AuthService().db;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String name = '',
      email = '',
      rollno = '',
      division = '',
      year = '',
      branch = '';
  final _formkey = GlobalKey<FormState>();

  fetch_profile() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    var collection = db.collection('users');
    //var querySnapshot = await collection.get();
    var docSnapshot = await collection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      // type = data['Type'];
      setState(() {
        name = data['Name'];
        email = data['Email'];
        rollno = data['Rollno'];
        division = data['Division'];
        year = data['Year'];
        branch = data['Branch'];
      });
    }
    print(year);
  }

  @override
  void initState() {
    super.initState();
    fetch_profile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.transparent,
            title: const Text(
              'AttendMe',
              style: TextStyle(
                  fontSize: 21,
                  fontFamily: 'Salsa',
                  fontWeight: FontWeight.w500),
            ),
            leading: PopupMenuButton(
                icon: Icon(Icons.menu),
                onSelected: (value) {
                  if (value == '/profile') {
                    Navigator.pushReplacementNamed(context, '/profile');
                  } else {
                    _auth.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Logout"),
                        value: '/login',
                      )
                    ]),
            // backgroundColor: Colors.red[500],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/title.png"), fit: BoxFit.cover)),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  // image:DecorationImage(
                  // image: FileImage(File(imagePath)),
                  // fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: _formkey,
                      child: Container(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: Column(
                          children: [
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter name' : null,
                              // onChanged: (val) {
                              //   setState(() => name = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: name,
                              // key: Key(name),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter email' : null,
                              // onChanged: (val) {
                              //   setState(() => email = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: email,
                              // // key: Key(email),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter Year' : null,
                              // onChanged: (val) {
                              //   setState(() => year = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.groups,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Year',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: year,
                              // // key: Key(year),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter Branch' : null,
                              // onChanged: (val) {
                              //   setState(() => branch = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.groups,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Branch',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: branch,
                              // // key: Key(branch),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter division' : null,
                              // onChanged: (val) {
                              //   setState(() => division = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.groups,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Division',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: division,
                              // // key: Key(division),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // validator: (val) =>
                              //     val!.isEmpty ? 'Enter roll no.' : null,
                              // onChanged: (val) {
                              //   setState(() => rollno = val);
                              // },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.card_giftcard,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                hintText: 'Roll number',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              initialValue: rollno,
                              // // key: Key(rollno),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 10),
                            edit
                                ? TextButton(
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 1.25),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            (MaterialStateProperty.all(
                                                Colors.indigo[900])),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ))),
                                    onPressed: () {
                                      setState(() {
                                        edit = false;
                                      });
                                    },
                                  )
                                : TextButton(
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 1.25),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            (MaterialStateProperty.all(
                                                Colors.indigo[900])),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ))),
                                    onPressed: () {
                                      setState(() {
                                        edit = true;
                                      });
                                    },
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
