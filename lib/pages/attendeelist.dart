import 'package:attendme/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendeeList extends StatelessWidget {
  final db = AuthService().db;
  final _auth = AuthService();
  final division, subject, date;

  AttendeeList(
      {required this.division, required this.subject, required this.date});
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
                  if (value == '/login') {
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
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/title.png"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    // image:DecorationImage(
                    // image: FileImage(File(imagePath)),
                    // fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.80,
                      padding: EdgeInsets.all(35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Subject: $subject"),
                          Text("Division: $division"),
                          Text("Date: $date"),
                          FetchAttendeeList(
                              division: division, subject: subject, date: date),
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

class FetchAttendeeList extends StatelessWidget {
  final db = AuthService().db;
  final division, subject, date;

  FetchAttendeeList(
      {required this.division, required this.subject, required this.date});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: db
            .collection("divisions")
            .doc(division)
            .collection("subjects")
            .doc(subject)
            .collection(date)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("Absent");
          return Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Table(children:[
              TableRow(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Rollno"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name"),
                  )
                  ]
                  ),
            ...getAttendanceList(snapshot)],
            border: TableBorder.all(  
                          color: Colors.black26,  
                          style: BorderStyle.solid,  
                          width: 1),  ),
          );
        });
  }

  getAttendanceList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs.map((doc) {
      return TableRow(
        children:[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(doc["Rollno"],),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(doc["Name"],
             ),
           )
           ]
           );
    }).toList();
  }
}
