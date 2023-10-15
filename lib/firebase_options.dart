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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCCYh2_u1ufcy_w9WUacI3JzentAEbFgsY',
    appId: '1:845531807200:web:ef28d44a021b8e2892bf85',
    messagingSenderId: '845531807200',
    projectId: 'todo-cycle8-online',
    authDomain: 'todo-cycle8-online.firebaseapp.com',
    storageBucket: 'todo-cycle8-online.appspot.com',
    measurementId: 'G-PRB53EC099',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNBn63XIykoCbpXdzKKvcyYsrVNX7cyk0',
    appId: '1:845531807200:android:b4801bc72c5e5db792bf85',
    messagingSenderId: '845531807200',
    projectId: 'todo-cycle8-online',
    storageBucket: 'todo-cycle8-online.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSsTKMlmkwLbhuifCpK39TZEhohoFgFeY',
    appId: '1:845531807200:ios:59244ef89b5e600092bf85',
    messagingSenderId: '845531807200',
    projectId: 'todo-cycle8-online',
    storageBucket: 'todo-cycle8-online.appspot.com',
    iosBundleId: 'com.example.todoList',
  );
}
