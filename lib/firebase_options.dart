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
    apiKey: 'AIzaSyC_xkJxI3-7GcmrKwhLZbaIiqxJ-7oUsN4',
    appId: '1:437256727613:web:e3713680c346651547ce54',
    messagingSenderId: '437256727613',
    projectId: 'crypto-list-app-v1',
    authDomain: 'crypto-list-app-v1.firebaseapp.com',
    storageBucket: 'crypto-list-app-v1.firebasestorage.app',
    measurementId: 'G-C6G75PD2TC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPWcGx7iEYC7BDlW70zRMHVEvJtGF5-Fs',
    appId: '1:437256727613:android:9fe4d0f2203066b747ce54',
    messagingSenderId: '437256727613',
    projectId: 'crypto-list-app-v1',
    storageBucket: 'crypto-list-app-v1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOpJat-5Qdz0BTIjkbNLSWWttMSRnBpQI',
    appId: '1:437256727613:ios:595e8203f53c1c1647ce54',
    messagingSenderId: '437256727613',
    projectId: 'crypto-list-app-v1',
    storageBucket: 'crypto-list-app-v1.firebasestorage.app',
    iosBundleId: 'com.txchatvoice.voiceChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOpJat-5Qdz0BTIjkbNLSWWttMSRnBpQI',
    appId: '1:437256727613:ios:595e8203f53c1c1647ce54',
    messagingSenderId: '437256727613',
    projectId: 'crypto-list-app-v1',
    storageBucket: 'crypto-list-app-v1.firebasestorage.app',
    iosBundleId: 'com.txchatvoice.voiceChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_xkJxI3-7GcmrKwhLZbaIiqxJ-7oUsN4',
    appId: '1:437256727613:web:fc8a528f48e24b9b47ce54',
    messagingSenderId: '437256727613',
    projectId: 'crypto-list-app-v1',
    authDomain: 'crypto-list-app-v1.firebaseapp.com',
    storageBucket: 'crypto-list-app-v1.firebasestorage.app',
    measurementId: 'G-JX888CX7XL',
  );
}
