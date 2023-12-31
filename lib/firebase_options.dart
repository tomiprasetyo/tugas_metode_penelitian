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
    apiKey: 'AIzaSyCVCGYGimYXnIabGGPy5e4JjNURHrZZubg',
    appId: '1:663427318990:web:2f3a05ce3bf08820bebc9f',
    messagingSenderId: '663427318990',
    projectId: 'pendaftaran-86eab',
    authDomain: 'pendaftaran-86eab.firebaseapp.com',
    storageBucket: 'pendaftaran-86eab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIhZZebwaAdcYMXclTIugEpZo4PNldWi4',
    appId: '1:663427318990:android:e5235999eaa6ea44bebc9f',
    messagingSenderId: '663427318990',
    projectId: 'pendaftaran-86eab',
    storageBucket: 'pendaftaran-86eab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRVarBjo_Q-L5m_-atEBQSIQjgqNp8gqs',
    appId: '1:663427318990:ios:65b363eacbc76f3cbebc9f',
    messagingSenderId: '663427318990',
    projectId: 'pendaftaran-86eab',
    storageBucket: 'pendaftaran-86eab.appspot.com',
    iosClientId: '663427318990-ict9edm20kicfako2vrre1b4omskmt5o.apps.googleusercontent.com',
    iosBundleId: 'com.example.tugasMetodePenelitian',
  );
}
