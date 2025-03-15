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
    apiKey: 'AIzaSyBHA6XWCEoC37YKFIjfocuXMzCbkO7Lbek',
    appId: '1:644736432167:web:371fc0810fa626e801b602',
    messagingSenderId: '644736432167',
    projectId: 'auth-d46b9',
    authDomain: 'auth-d46b9.firebaseapp.com',
    storageBucket: 'auth-d46b9.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2cc2fd1lXztLGP1Oker-jHXXT1bvldF4',
    appId: '1:644736432167:android:9cd466a7cd512fa001b602',
    messagingSenderId: '644736432167',
    projectId: 'auth-d46b9',
    storageBucket: 'auth-d46b9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiRRS1ERX09nQdJ2lw73t3FJzP6EUe8Yk',
    appId: '1:644736432167:ios:186f97f3a113e0fe01b602',
    messagingSenderId: '644736432167',
    projectId: 'auth-d46b9',
    storageBucket: 'auth-d46b9.firebasestorage.app',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiRRS1ERX09nQdJ2lw73t3FJzP6EUe8Yk',
    appId: '1:644736432167:ios:186f97f3a113e0fe01b602',
    messagingSenderId: '644736432167',
    projectId: 'auth-d46b9',
    storageBucket: 'auth-d46b9.firebasestorage.app',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBHA6XWCEoC37YKFIjfocuXMzCbkO7Lbek',
    appId: '1:644736432167:web:fa854396515b7aa201b602',
    messagingSenderId: '644736432167',
    projectId: 'auth-d46b9',
    authDomain: 'auth-d46b9.firebaseapp.com',
    storageBucket: 'auth-d46b9.firebasestorage.app',
  );
}
