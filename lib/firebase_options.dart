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
    apiKey: 'AIzaSyBlc0vLDHLx0kvamjaO3pbObNd-aH4ZCZw',
    appId: '1:735462074258:web:d36875a00fffba5cb9434b',
    messagingSenderId: '735462074258',
    projectId: 'untitled9-c980f',
    authDomain: 'untitled9-c980f.firebaseapp.com',
    storageBucket: 'untitled9-c980f.appspot.com',
    measurementId: 'G-CRLGPV3JZG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpiSTVoxpaifZrA9xOVql65agDvqVgz3Y',
    appId: '1:735462074258:android:569e3ed90e34f7bcb9434b',
    messagingSenderId: '735462074258',
    projectId: 'untitled9-c980f',
    storageBucket: 'untitled9-c980f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAILGXmGA9N8e-KoRJscySQnlaW5O5UIvU',
    appId: '1:735462074258:ios:eb7115959be069e5b9434b',
    messagingSenderId: '735462074258',
    projectId: 'untitled9-c980f',
    storageBucket: 'untitled9-c980f.appspot.com',
    iosClientId: '735462074258-9o9l5ujq2aj3rq44tme8miggguvff6ui.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAILGXmGA9N8e-KoRJscySQnlaW5O5UIvU',
    appId: '1:735462074258:ios:eb7115959be069e5b9434b',
    messagingSenderId: '735462074258',
    projectId: 'untitled9-c980f',
    storageBucket: 'untitled9-c980f.appspot.com',
    iosClientId: '735462074258-9o9l5ujq2aj3rq44tme8miggguvff6ui.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp',
  );
}