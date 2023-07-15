
// import 'package:chat_messenger/screen/auth/welcome_screen.dart';

import 'package:flash_chat1/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full-screen
     
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>  WelcomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Welcome to Flash Chat', style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * .15,
              right: MediaQuery.of(context).size.width * .25,
              width: MediaQuery.of(context).size.width * .5,
          
              child: Image.asset('assets/icon.png')),
          // Positioned(
          //     bottom: MediaQuery.of(context).size.height * .15,
          //     // left: MediaQuery.of(context).size.width * .05,
          //     width: MediaQuery.of(context).size.width,
          //     // height: MediaQuery.of(context).size.height * .06,
          //     child: Text('',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: 16, color: Colors.black87, letterSpacing: .5))),
        ],
      ),
    );
  }
}
