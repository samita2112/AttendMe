import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendme/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // create user obj based on firebase
  MyUser? _userFromFirebaseUser(User? user) {
    return MyUser(uid: user?.uid);
    //return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
    // .map(_userFromFirebaseUser);
  }

  //register
  Future registerStudent(String email, String password, String name,
      String division, String rollno, String year, String branch) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      final new_user = await db.collection('users').doc(user!.uid).set({
        "Name": name,
        "Email": email,
        "Division": division,
        "Rollno": rollno,
        "Year": year,
        "Branch": branch,
        "Type": 'student'
      });

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerTeacher(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      final new_user = await db.collection('users').doc(user!.uid).set({
        "Name": name,
        "Email": email,
        // "Password": password,
        "Type": 'teacher',
      });

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("LOGOUT hua haiiii");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
