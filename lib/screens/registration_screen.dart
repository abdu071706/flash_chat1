import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'chat_screen.dart';

// CRUD
// async - await - then(value) - ishter butkondon kiyn oshonun dannyiyn al dagy
// oshol dannyi menen ishte
class RegistrationScreen extends StatefulWidget {
  static const String route = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _password = '';
  String _name = ' Janibek';
  bool _isClicked = false;
  String _email = '';

// USERS -> Uid -> email -> password
// UserCredential userCredential == User -> user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: _isClicked
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Container(child: Image.asset('assets/icon.png')),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    onChanged: (adamdinJasganNersesi) {
                      setState(() {
                        _email = adamdinJasganNersesi;
                      });
                      log('_email ===> $_email');
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                      log('_password ===> $_password');
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_email.isNotEmpty && _password.isNotEmpty) {
                            await _registration(_email, _password);
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _registration(String emailAddress, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await _createUser(userCredential.user!);
      // await addUser(userCredential.user);
      log('userCredential ===>$userCredential');
      log('userCredential ==> $userCredential');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      // log(e);

      throw Exception(e);
    }
  }

  _createUser(User user) async {
    final _userCollection = FirebaseFirestore.instance.collection('users');
    // final Map<String, dynamic> _userData = {
    //   'id': user.uid,
    //   'email': user.email,
    //   'password': _password,
    // };
    final UserModel _userModel = UserModel(
      id: user.uid,
      email: user.email,
      password: _password,
      name: _name,
    );

    // await _userCollection.doc(user.uid).set(_userData);
    // _userCollection.doc(user.uid).set(_userData).then((_) {
    _userCollection.doc(user.uid).set(_userModel.toJson()).then((_) {
      setState(() {
        _isClicked = true;
      });

      // await _userCollection.doc(user.uid).set(_userData);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ChatScreen(
                // userData: _userData,
                userModel: _userModel,
              )),
        ),
      );
    });
  }
}
// CRUD
// Create - jasdiruu - post
// Read - alip keluu  - get
// Update - janiloo -
// Delete - ochuruu -
// async - await -> .then(value)

// // CRUD
// // Create - jasdiruu - post
// // Read - alip keluu  - get
// // Update - janiloo -
// // Delete - ochuruu -
// // async - await -> .then(value)

 
