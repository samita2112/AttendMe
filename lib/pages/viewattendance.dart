import 'package:attendme/pages/attendeelist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendme/services/auth.dart';
import 'package:nfc_manager/nfc_manager.dart';

class ViewAttendance extends StatefulWidget {
  @override
  bool takeattendance;

  ViewAttendance({this.takeattendance = false});
  State<ViewAttendance> createState() =>
      _ViewAttendanceState(takeattendance: takeattendance);
}

class _ViewAttendanceState extends State<ViewAttendance> {
  DateTime selectedDate = DateTime.now();
  final AuthService _auth = AuthService();
  bool writetag = false;
  final db = AuthService().db;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late bool takeattendance;
  String popuptext = "";
  _ViewAttendanceState({this.takeattendance = false});

  TextEditingController _division = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _date = TextEditingController();

  String type = "";
  final _formkey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> divisionItems = [
    DropdownMenuItem(child: Text("D12A"), value: "D12A"),
    DropdownMenuItem(child: Text("D12B"), value: "D12B"),
    DropdownMenuItem(child: Text("D12C"), value: "D12C"),
  ];
  List<DropdownMenuItem<String>> subjectItems = [
    DropdownMenuItem(child: Text("CSS"), value: "CSS"),
    DropdownMenuItem(child: Text("AI"), value: "AI"),
    DropdownMenuItem(child: Text("AOA"), value: "AOA"),
  ];

  @override
  void initState() {
    super.initState();
    _date.text =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
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
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/title.png"),
                        fit: BoxFit.cover)),
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
                              padding:
                                  const EdgeInsets.only(left: 40.0, right: 40),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _division.text = newValue!;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: Colors.black87,
                                          size: 30,
                                        ),
                                      ),
                                      // isExpanded: true,

                                      validator: (String? newValue) =>
                                          newValue == null
                                              ? 'Enter Division'
                                              : null,
                                      hint: Text('Division'),
                                      // value: _division.text,
                                      items: divisionItems),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField(
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _subject.text = newValue!;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: Colors.black87,
                                          size: 30,
                                        ),
                                      ),
                                      // isExpanded: true,

                                      validator: (String? newValue) =>
                                          newValue == null
                                              ? 'Enter Subject'
                                              : null,
                                      hint: Text('Subject'),
                                      // value: _subject.text,
                                      items: subjectItems),
                                  const SizedBox(height: 10),
                                  // TextFormField(
                                  //   controller: _date,
                                  //   decoration: InputDecoration(
                                  //     fillColor: Colors.black,
                                  //     hintText: 'Date',
                                  //     icon: Icon(
                                  //       Icons.person,
                                  //       color: Colors.black87,
                                  //       size: 30,
                                  //     ),
                                  //   ),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                        child: Text("Choose Date"),
                                      ),
                                      Text(_date.text)
                                    ],
                                  ),
                                  (takeattendance)
                                      ? TextButton(
                                          child: const Text(
                                            'Start Attendance',
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
                                          onPressed: () async {
                                            var result;
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  _buildPopupDialog(context),
                                            );
                                            setState(() {
                                              popuptext =
                                                  "Scan to start attendance";
                                            });
                                            bool isAvailable = await NfcManager
                                                .instance
                                                .isAvailable();
                                            // Start Session

                                            if (isAvailable) {
                                              NfcManager.instance.startSession(
                                                  onDiscovered:
                                                      (NfcTag tag) async {
                                                var ndef = Ndef.from(tag);

                                                NdefMessage message =
                                                    NdefMessage([
                                                  NdefRecord.createText(
                                                      '{"Division":"${_division.text}","Subject":"${_subject.text}","Date":"${_date.text}"}'),
                                                ]);

                                                // try {
                                                await ndef!.write(message);
                                                result =
                                                    'Success to "Ndef Write"';
                                                print(result);
                                                NfcManager.instance
                                                    .stopSession();
                                                setState(() {
                                                  writetag = true;
                                                });
                                                if (writetag == true) {
                                                  Navigator.pushNamed(context,
                                                      '/stopattendance');
                                                }
                                                // } catch (e) {
                                                //   result = e;
                                                //   NfcManager.instance.stopSession(
                                                //       errorMessage:
                                                //           result.toString());
                                                // }
                                              });
                                            }
                                          },
                                        )
                                      : TextButton(
                                          child: const Text(
                                            'View Attendee List',
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
                                          onPressed: () async {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => AttendeeList(
                                                    // Pass the automatically generated path to
                                                    // the DisplayPictureScreen widget.
                                                    division: _division.text,
                                                    subject: _subject.text,
                                                    date: _date.text),
                                              ),
                                            );
                                          },
                                        ),
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

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text('$popuptext'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Tap your device on the tag to scan"),
        ],
      ),
      // actions: <Widget>[
      //   new FlatButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     textColor: Theme.of(context).primaryColor,
      //     child: const Text('OK'),
      //   ),
      // ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        _date.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }
}
