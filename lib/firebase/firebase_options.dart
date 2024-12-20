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
    apiKey: 'AIzaSyA9m2mPM13gc_TOz2wvTfMTYTo7GNe5oN4',
    appId: '1:665418154669:web:0dee47bebf526472a63c24',
    messagingSenderId: '665418154669',
    projectId: 'stone-budget',
    authDomain: 'stone-budget.firebaseapp.com',
    storageBucket: 'stone-budget.firebasestorage.app',
    measurementId: 'G-GNTBN6KY07',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYYeKJEEM1qEBEKhP_vy5EAfmXq585bLQ',
    appId: '1:665418154669:android:acfd668dc6190b52a63c24',
    messagingSenderId: '665418154669',
    projectId: 'stone-budget',
    storageBucket: 'stone-budget.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMWSwhqT_Zi4ZMFBfFfsadSkQihCOeCS8',
    appId: '1:665418154669:ios:2dc1fe2ded48bb38a63c24',
    messagingSenderId: '665418154669',
    projectId: 'stone-budget',
    storageBucket: 'stone-budget.firebasestorage.app',
    iosClientId: '665418154669-74c0ccf9oc8hge6o51akacujpvigl9ls.apps.googleusercontent.com',
    iosBundleId: 'com.stone.budget',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMWSwhqT_Zi4ZMFBfFfsadSkQihCOeCS8',
    appId: '1:665418154669:ios:2dc1fe2ded48bb38a63c24',
    messagingSenderId: '665418154669',
    projectId: 'stone-budget',
    storageBucket: 'stone-budget.firebasestorage.app',
    iosClientId: '665418154669-74c0ccf9oc8hge6o51akacujpvigl9ls.apps.googleusercontent.com',
    iosBundleId: 'com.stone.budget',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9m2mPM13gc_TOz2wvTfMTYTo7GNe5oN4',
    appId: '1:665418154669:web:dcfbd83afc6a3103a63c24',
    messagingSenderId: '665418154669',
    projectId: 'stone-budget',
    authDomain: 'stone-budget.firebaseapp.com',
    storageBucket: 'stone-budget.firebasestorage.app',
    measurementId: 'G-WSJC7K018D',
  );

}