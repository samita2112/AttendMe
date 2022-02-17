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
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _division = TextEditingController();
  TextEditingController _rollno = TextEditingController();
  TextEditingController _phone = TextEditingController();

  String type = "";
  final _formkey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> yearItems = [
    DropdownMenuItem(child: Text("First"), value: "First"),
    DropdownMenuItem(child: Text("Second"), value: "Second"),
    DropdownMenuItem(child: Text("Third"), value: "Third"),
    DropdownMenuItem(child: Text("Fourth"), value: "Fourth"),
  ];

  fetch_profile() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    var collection = db.collection('users');
    //var querySnapshot = await collection.get();
    var docSnapshot = await collection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      type = data['Type'];
      print(type);
      (type=='student')?
      setState(() {
        _name.text = data['Name'];
        _email.text = data['Email'];
        _rollno.text = data['Rollno'];
        _division.text = data['Division'];
        _year.text = data['Year'];
        _branch.text = data['Branch'];
        _phone.text = data['Phone'];
        type = data['Type'];
        // _controller.text = name;
      }):setState(() {
        _name.text = data['Name'];
        _email.text = data['Email'];
        _branch.text = data['Branch'];
        _phone.text = data['Phone'];
        type = data['Type'];
        // _controller.text = name;
      });
    }
  }

  @override
  void initState() {
    fetch_profile();
    // _name.text = "$email";
    // _email.text = "$email";
    // _branch.text = "$branch";
    // _year.text = "$year";
    // _division.text = "$division";
    // _rollno.text = "$rollno";
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
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/title.png"), fit: BoxFit.cover)),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      // image:DecorationImage(
                      // image: FileImage(File(imagePath)),
                      // fit: BoxFit.cover),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            key: _formkey,
                            child: Container(
                              padding: const EdgeInsets.only(left: 40.0, right: 40),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter name' : null,
                                    onChanged: (val) {
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.black,
                                      enabled: edit,
                                      hintText: 'Name',
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
                                        val!.isEmpty ? 'Enter Email' : null,
                                    onChanged: (val) {
                                    },
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      icon: Icon(
                                        Icons.mail,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                      hintText: 'Email',

                                    ),

                                    // // key: Key(email),
                                    controller: _email,
                                  ),
                                  (type == 'teacher' || type == 'student')
                                      ? SizedBox(height: 20)
                                      : Visibility(
                                          visible: false, child: const Text("")),
                                  (type == 'teacher' || type == 'student')
                                      ? TextFormField(
                                          validator: (val) =>
                                        val!.isEmpty ? 'Enter Branch' : null,
                                    onChanged: (val) {
                                    },
                                          decoration: InputDecoration(
                                            enabled: edit,
                                            hintText: 'Branch',
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
                                      ? DropdownButtonFormField(
                              onChanged: (edit)?(String? newValue) {
                                setState(() {
                                  _year.text = newValue!;
                                });
                              }:null,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              // isExpanded: true,
                              
                              validator: (String? newValue) =>
                                  newValue==null ? 'Enter Year' : null,
                              hint: Text('Year'),
                              value: _year.text,
                              items: yearItems)
                                      : Visibility(visible: false, child: Text("")),
                                  (type == 'student')
                                      ? const SizedBox(height: 20)
                                      : Visibility(visible: false, child: Text("")),
                                  (type == 'student')
                                      ? TextFormField(
                                          validator: (val) =>
                                            val!.isEmpty ? 'Enter Division' : null,
                                            onChanged: (val) {
                                          },
                                          decoration: InputDecoration(
                                            enabled: edit,
                                            hintText: 'Division',
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
                                            val!.isEmpty ? 'Enter Rollno' : null,
                                            onChanged: (val) {
                                          },
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            enabled: edit,
                                            hintText: 'Rollno',
                                            icon: Icon(
                                              Icons.card_giftcard,
                                              color: Colors.black87,
                                              size: 30,
                                            ),
                                          ),
                                          controller: _rollno,
                                        )
                                      : Visibility(visible: false, child: Text("")),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter Phone' : null,
                                    onChanged: (val) {
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      enabled: edit,
                                      hintText: 'Phone',
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black87,
                                        size: 30,
                                      ),
                                    ),
                                    controller: _phone,
                                  ),
                                  const SizedBox(height: 10),
                                  (edit)?TextButton(
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
                                    onPressed: () async{
                                      if (_formkey.currentState!.validate()) {
                                      final User? user = auth.currentUser;
                                        final uid = user!.uid;
                                        var collection = db.collection('users');
                                        // String name1 = _name.toString();
                                        //var querySnapshot = await collection.get();
                                        if(type=='teacher'){
                                          var docSnapshot = await collection
                                              .doc(uid)
                                              .update({'Name': _name.text,'Email':_email.text,'Branch':_branch.text,'Phone':_phone.text});}
                                        else if(type=='student'){
                                          var docSnapshot = await collection
                                              .doc(uid)
                                              .update({'Name': _name.text,'Email':_email.text,'Branch':_branch.text,'Year':_year.text,'Division':_division.text,'Rollno':_rollno.text,'Phone':_phone.text});}
                                        
                                        

                                      setState(() {
                                        edit=false;
                                      });}
                                    },
                                  ):TextButton(
                                    child: const Text(
                                      'Edit',
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
                                    onPressed: () {
                                      setState(() {
                                        edit=true;
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
                ),
              ),
            ),
          )),
    );
  }
}
