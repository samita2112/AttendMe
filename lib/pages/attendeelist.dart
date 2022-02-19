import 'package:attendme/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendeeList extends StatefulWidget {
  final division, subject, date;

  AttendeeList(
      {required this.division, required this.subject, required this.date});

  @override
  State<AttendeeList> createState() =>
      _AttendeeListState(division: division, subject: subject, date: date);
}

class _AttendeeListState extends State<AttendeeList> {
  final db = AuthService().db;

  final division, subject, date;
  final _auth = AuthService();
  _AttendeeListState(
      {required this.division, required this.subject, required this.date});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.6,
            iconTheme: IconThemeData(
              color: Colors.blue[900],
            ),
            titleTextStyle: TextStyle(color: Colors.blue[900]),
            backgroundColor: Colors.white,
            // backgroundColor: Colors.transparent,
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
          backgroundColor: Colors.green[50],
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject: ${widget.subject}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.5),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Division: ${widget.division}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.5),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Date: ${widget.date}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.5),
                        ),
                        FetchAttendeeList(
                            division: widget.division,
                            subject: widget.subject,
                            date: widget.date),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class FetchAttendeeList extends StatefulWidget {
  final division, subject, date;

  FetchAttendeeList(
      {required this.division, required this.subject, required this.date});

  @override
  State<FetchAttendeeList> createState() =>
      _FetchAttendeeListState(division: division, subject: subject, date: date);
}

class _FetchAttendeeListState extends State<FetchAttendeeList> {
  final db = AuthService().db;
  bool ascending = true;
  final division, subject, date;
  _FetchAttendeeListState(
      {required this.division, required this.subject, required this.date});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: db
            .collection("divisions")
            .doc(widget.division)
            .collection("subjects")
            .doc(widget.subject)
            .collection(widget.date).orderBy('Rollno',descending:false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("Absent");
          return Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: DataTable(
              decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(10)),
              dataRowHeight: 38,
              columns: [
                DataColumn(
                    numeric: true,
                    label: Text('RollNo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                //  DataColumn(label: Text(
                //     'Status',all
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                // )),
              ],
              rows: [...getAttendanceList(snapshot)],
              // border: TableBorder.all(
              //     color: Colors.black26, style: BorderStyle.solid, width: 1, ),
            ),
          );
        });
  }

  getAttendanceList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs.map((doc) {
      return DataRow(color: MaterialStateProperty.all(Colors.cyan[50]), cells: [
        DataCell(
          Text(
            doc["Rollno"],
          ),
        ),
        DataCell(
          Text(
            doc["Name"],
          ),
        ),
      ]);
    }).toList();
  }
}
