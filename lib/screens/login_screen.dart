import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        // backgroundColor: 
      
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Flash Chat', style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>  WelcomeScreen(),
          ));
        }, icon:Icon(Icons.arrow_back,color: Colors.black,) ),
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: _isClicked
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: Image.asset('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                      log('email ===>$_email');
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                      log('password ===> $_password');
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password.',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_email.isNotEmpty && _password.isNotEmpty) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              _isClicked = true;
                            });
                            await _login(_email, _password);
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _login(String emailAddress, String password) async {
    log('login ===> $emailAddress and $password   ');
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      log('userCredential.user.uid ==> ${userCredential.user!.uid}');
      await _getUser(userCredential.user!.uid);
      log('userCredential ===> $userCredential');
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.e ==>${e.code}');
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      // log(e);
      throw Exception(e);
    }
  }

  Future<void> _getUser(String userId) async {
    final  _response =
        await FirebaseFirestore.instance.collection('users').doc(userId ).get();
    log('response ==> ${_response.data()}');
    // final _userData = jsonDecode(_response); ---> kata
    final _userModel = UserModel.fromJson(_response.data() as Map<String, dynamic>);
    log('userModel ==> $_userModel');
    setState(() {
      _isClicked = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ChatScreen(
              userModel: _userModel,
            )),
      ),
    );
  }
  // Future<void> signIn()async{
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
}
