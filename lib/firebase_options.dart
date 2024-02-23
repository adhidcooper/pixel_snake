// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
// / ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA932Pz-B3aZxOUdTcwGyB3P0LSeDm9X88',
    appId: '1:589652021108:android:0d227027574155f722e621',
    messagingSenderId: '589652021108',
    projectId: 'pixelsnake-8c339',
    databaseURL: 'https://pixelsnake-8c339-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pixelsnake-8c339.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMP6AnRCCcdjy2Y6os4bq9_Y0RL2wIRAY',
    appId: '1:589652021108:ios:ea948c43a91655a722e621',
    messagingSenderId: '589652021108',
    projectId: 'pixelsnake-8c339',
    databaseURL: 'https://pixelsnake-8c339-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pixelsnake-8c339.appspot.com',
    iosBundleId: 'com.example.pixelSnake',
  );
}
