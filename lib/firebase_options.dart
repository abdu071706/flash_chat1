// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCT4wRKdzFGTcceQ1_IvWc88mvpthzZeQo',
    appId: '1:978813783896:web:b40f159afad1fd51aa5f2d',
    messagingSenderId: '978813783896',
    projectId: 'flashchat1-9a692',
    authDomain: 'flashchat1-9a692.firebaseapp.com',
    storageBucket: 'flashchat1-9a692.appspot.com',
    measurementId: 'G-41LWEPLXPJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1Wl_djORUlgVwdKx0j-50Q_s51g89qAI',
    appId: '1:978813783896:android:1b14df210710137caa5f2d',
    messagingSenderId: '978813783896',
    projectId: 'flashchat1-9a692',
    storageBucket: 'flashchat1-9a692.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHZLiyAoY4PhDAJxoV2VQY9maAsQWLjAE',
    appId: '1:978813783896:ios:3ac846e5a48326f6aa5f2d',
    messagingSenderId: '978813783896',
    projectId: 'flashchat1-9a692',
    storageBucket: 'flashchat1-9a692.appspot.com',
    iosClientId: '978813783896-p3evv9u24d4vsbfdj3qkl2dsbrmsta8q.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChat1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHZLiyAoY4PhDAJxoV2VQY9maAsQWLjAE',
    appId: '1:978813783896:ios:f22f68d33f129393aa5f2d',
    messagingSenderId: '978813783896',
    projectId: 'flashchat1-9a692',
    storageBucket: 'flashchat1-9a692.appspot.com',
    iosClientId: '978813783896-lg0bgtd3g4bh9h1pio6n9891hil32f2t.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChat1.RunnerTests',
  );
}
