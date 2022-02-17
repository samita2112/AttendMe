import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendme/services/auth.dart';

class editprofile extends StatefulWidget {
  final String type;
  const editprofile({required this.type}) : super();
  // editprofile({
  //   required this.type,
  // });
  @override
  State<editprofile> createState() => _editprofileState(type: this.type);
}

class _editprofileState extends State<editprofile> {
  String type;
  _editprofileState({required this.type});
  //report({required this.imagePath});

  bool edit = true;
  final AuthService _auth = AuthService();
  final db = AuthService().db;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _division = TextEditingController();
  TextEditingController _rollno = TextEditingController();
  TextEditingController _phone = TextEditingController();
  String name = '',
      email = '',
      rollno = '',
      division = '',
      year = '',
      branch = '',
      phone = '',
      name1 = '';
  // type = "";
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
        _name.text = data['Name'];
        _email.text = data['Email'];
        _rollno.text = data['Rollno'];
        _division.text = data['Division'];
        _year.text = data['Year'];
        _branch.text = data['Branch'];
        _phone.text = data['Phone'];
        name1 = data['Name'];
        email = data['Ymail'];
        year = data['Year'];
        branch = data['Branch'];
        rollno = data['Rollno'];
        division = data['Division'];
        // type = data['Type'];
        // _controller.text = name;
      });
    }
    print(type);
    print(_rollno.text);
  }

  @override
  void initState() {
    fetch_profile();
    super.initState();
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
                    Navigator.pushNamed(context, '/profile');
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
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter name' : null,
                              onChanged: (val) {
                                setState(() => name = val);
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                enabled: edit,
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),

                              controller: _name,
                              // key: Key(name),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              controller: _email,
                              // // key: Key(email),
                            ),
                            (type == 'teacher' || type == 'student')
                                ? SizedBox(height: 20)
                                : Visibility(
                                    visible: false, child: const Text("")),
                            // Visibility(visible: false, child: Text("")),
                            (type == 'teacher' || type == 'student')
                                ? TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter Branch' : null,
                                    onChanged: (val) {
                                      setState(() => branch = val);
                                    },
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      icon: Icon(
                                        Icons.account_balance,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                    ),
                                    controller: _branch,
                                    // // key: Key(branch),
                                  )
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? const SizedBox(height: 20)
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter Year' : null,
                                    onChanged: (val) {
                                      setState(() => year = val);
                                    },
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                    ),
                                    controller: _year,
                                    // // key: Key(year),
                                  )
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? const SizedBox(height: 20)
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter division' : null,
                                    onChanged: (val) {
                                      setState(() => division = val);
                                    },
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      icon: Icon(
                                        Icons.groups,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                    ),
                                    controller: _division,
                                    // // key: Key(division),
                                  )
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? const SizedBox(height: 20)
                                : Visibility(visible: false, child: Text("")),
                            (type == 'student')
                                ? TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter roll no.' : null,
                                    onChanged: (val) {
                                      setState(() => rollno = val);
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      icon: Icon(
                                        Icons.card_giftcard,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                    ),
                                    controller: _rollno,
                                  )
                                : Visibility(visible: false, child: Text("")),
                            TextFormField(
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter roll no.' : null,
                              onChanged: (val) {
                                setState(() => rollno = val);
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                enabled: edit,
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              controller: _phone,
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 10),
                            TextButton(
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      letterSpacing: 1.25),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: (MaterialStateProperty.all(
                                        Colors.indigo[900])),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ))),
                                onPressed: () async {
                                  final User? user = auth.currentUser;
                                  final uid = user!.uid;
                                  var collection = db.collection('users');
                                  // String name1 = _name.toString();
                                  //var querySnapshot = await collection.get();
                                  if (_name != name) {
                                    var docSnapshot = await collection
                                        .doc(uid)
                                        .update({'Name': name});
                                  }
                                  // else{
                                  //   var docSnapshot = await collection
                                  //       .doc(uid)
                                  //       .update({'Name': _name});
                                  // }
                                  if (_rollno != rollno) {
                                    var docSnapshot = await collection
                                        .doc(uid)
                                        .update({'Rollno': rollno});
                                  }
                                  // else{
                                  //   var docSnapshot = await collection
                                  //       .doc(uid)
                                  //       .update({'Name': _name});
                                  // }

                                  // var docSnapshot = await collection
                                  //     .doc(uid)
                                  //     .update(

                                  //     );
                                  // {
                                  // Map<String, dynamic> data =
                                  //     docSnapshot.data()!;

                                  // You can then retrieve the value from the Map like this:
                                  // type = data['Type'];
                                  Navigator.pushReplacementNamed(
                                      context, '/profile');
                                })
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
