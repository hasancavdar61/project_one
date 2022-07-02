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
    apiKey: 'AIzaSyD8xotDRuD78IqNOUmV-DzuYstasIfW-iM',
    appId: '1:837170209191:web:283a41c0c42a9b48655682',
    messagingSenderId: '837170209191',
    projectId: 'tidislam-analyze',
    authDomain: 'tidislam-analyze.firebaseapp.com',
    storageBucket: 'tidislam-analyze.appspot.com',
    measurementId: 'G-6GWYK4ZKPR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrf42FGPn1XtAN3W7iFIvfc0yFP48BmuQ',
    appId: '1:837170209191:android:bfe5c6753e18edf4655682',
    messagingSenderId: '837170209191',
    projectId: 'tidislam-analyze',
    storageBucket: 'tidislam-analyze.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwPMqTEVR2hea9ZuLzZoBkimeak95Mb3k',
    appId: '1:837170209191:ios:1f3a906829a3c4d4655682',
    messagingSenderId: '837170209191',
    projectId: 'tidislam-analyze',
    storageBucket: 'tidislam-analyze.appspot.com',
    iosClientId: '837170209191-ta0do26duc96lvlf8d5nvutk8n1tna3e.apps.googleusercontent.com',
    iosBundleId: 'com.daynex.tidislam',
  );
}
