import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat1/screens/splash_screen.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        WelcomeScreen.route: (context) => WelcomeScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        LoginScreen.route: (context) => LoginScreen(),
      },
    );
  }
}
