// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCzRyMOSduh3ILobG2poJeG0wTt-3ScQEg',
    appId: '1:178362277529:web:367c3d264ff6c52d472208',
    messagingSenderId: '178362277529',
    projectId: 'restauranteartg',
    authDomain: 'restauranteartg.firebaseapp.com',
    storageBucket: 'restauranteartg.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQDoC5Y1TMiKiedMu45KweMEvFpb7Lgtc',
    appId: '1:178362277529:android:635ec4ac24ec1454472208',
    messagingSenderId: '178362277529',
    projectId: 'restauranteartg',
    storageBucket: 'restauranteartg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAO6jfi7YlCagqO7C9Ehdw_8f1r8Wp23DY',
    appId: '1:178362277529:ios:f6e7b2eeb522c6c1472208',
    messagingSenderId: '178362277529',
    projectId: 'restauranteartg',
    storageBucket: 'restauranteartg.appspot.com',
    iosBundleId: 'com.example.actividad2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAO6jfi7YlCagqO7C9Ehdw_8f1r8Wp23DY',
    appId: '1:178362277529:ios:f6e7b2eeb522c6c1472208',
    messagingSenderId: '178362277529',
    projectId: 'restauranteartg',
    storageBucket: 'restauranteartg.appspot.com',
    iosBundleId: 'com.example.actividad2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzRyMOSduh3ILobG2poJeG0wTt-3ScQEg',
    appId: '1:178362277529:web:a4bbee4203adc227472208',
    messagingSenderId: '178362277529',
    projectId: 'restauranteartg',
    authDomain: 'restauranteartg.firebaseapp.com',
    storageBucket: 'restauranteartg.appspot.com',
  );
}
