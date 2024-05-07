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
    apiKey: 'AIzaSyDhOZHxIY-bhkAQeQGRdyLfTw3aG3yKYJw',
    appId: '1:1008623998331:web:9d3e3b0c449a0a71d519de',
    messagingSenderId: '1008623998331',
    projectId: 'minorsem6-229e4',
    authDomain: 'minorsem6-229e4.firebaseapp.com',
    storageBucket: 'minorsem6-229e4.appspot.com',
    measurementId: 'G-P8KLD67G82',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSECHH_UX984uSEk-ECMJJJ1C9vf7U_YA',
    appId: '1:1008623998331:android:db58db3e670022ddd519de',
    messagingSenderId: '1008623998331',
    projectId: 'minorsem6-229e4',
    storageBucket: 'minorsem6-229e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4P_ALQLE9NeKYwauUIgZM2ZkZvLophzI',
    appId: '1:1008623998331:ios:4ffb1e2c7a7bbecad519de',
    messagingSenderId: '1008623998331',
    projectId: 'minorsem6-229e4',
    storageBucket: 'minorsem6-229e4.appspot.com',
    iosBundleId: 'com.example.minorSem6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4P_ALQLE9NeKYwauUIgZM2ZkZvLophzI',
    appId: '1:1008623998331:ios:4ffb1e2c7a7bbecad519de',
    messagingSenderId: '1008623998331',
    projectId: 'minorsem6-229e4',
    storageBucket: 'minorsem6-229e4.appspot.com',
    iosBundleId: 'com.example.minorSem6',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhOZHxIY-bhkAQeQGRdyLfTw3aG3yKYJw',
    appId: '1:1008623998331:web:2729e345b836bfb6d519de',
    messagingSenderId: '1008623998331',
    projectId: 'minorsem6-229e4',
    authDomain: 'minorsem6-229e4.firebaseapp.com',
    storageBucket: 'minorsem6-229e4.appspot.com',
    measurementId: 'G-XRE8DL0XQE',
  );
}