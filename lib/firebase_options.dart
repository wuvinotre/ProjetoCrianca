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
    apiKey: 'AIzaSyBRI45bfxAKw8QgG6wDi9AkgmcXRc-b9Ms',
    appId: '1:654760512004:web:7726d8f8743e1c49568351',
    messagingSenderId: '654760512004',
    projectId: 'projetocrianca-ae4a3',
    authDomain: 'projetocrianca-ae4a3.firebaseapp.com',
    databaseURL: 'https://projetocrianca-ae4a3-default-rtdb.firebaseio.com',
    storageBucket: 'projetocrianca-ae4a3.appspot.com',
    measurementId: 'G-NXBX5RXGEV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdZPkx8S1BrdPrs1SHnxqQ56_VddgYGO4',
    appId: '1:654760512004:android:4cd006bb569f71ff568351',
    messagingSenderId: '654760512004',
    projectId: 'projetocrianca-ae4a3',
    databaseURL: 'https://projetocrianca-ae4a3-default-rtdb.firebaseio.com',
    storageBucket: 'projetocrianca-ae4a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgSHdyNl0qvatFdfjY5uEpCGIaLv1tZ28',
    appId: '1:654760512004:ios:75381bb5b054b942568351',
    messagingSenderId: '654760512004',
    projectId: 'projetocrianca-ae4a3',
    databaseURL: 'https://projetocrianca-ae4a3-default-rtdb.firebaseio.com',
    storageBucket: 'projetocrianca-ae4a3.appspot.com',
    iosClientId: '654760512004-o63pc4al417fdf0jc62olltdr71g6bog.apps.googleusercontent.com',
    iosBundleId: 'br.com.unisociesc.projetoCrianca',
  );
}
