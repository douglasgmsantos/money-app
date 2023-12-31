// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// ignore: depend_on_referenced_packages
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
    apiKey: 'AIzaSyBfBvJ3IbnR3-nQR8JRUFzu-JbFs4XD9Sc',
    appId: '1:319137741227:web:75f88cd21ed745fbefbaee',
    messagingSenderId: '319137741227',
    projectId: 'money-app-f9957',
    authDomain: 'money-app-f9957.firebaseapp.com',
    storageBucket: 'money-app-f9957.appspot.com',
    measurementId: 'G-35CC8MGK88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7B-JmrPgtXtR0N13tACV4-WeWlUnczAs',
    appId: '1:319137741227:android:fa1c62d0c791dd08efbaee',
    messagingSenderId: '319137741227',
    projectId: 'money-app-f9957',
    storageBucket: 'money-app-f9957.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACmk4t_3jgO6pWUj8OgWHzbzDL9zeXkXg',
    appId: '1:319137741227:ios:e36ed8bc768fe5afefbaee',
    messagingSenderId: '319137741227',
    projectId: 'money-app-f9957',
    storageBucket: 'money-app-f9957.appspot.com',
    iosClientId:
        '319137741227-nvhms0rtprksrdt1sejg8g0kaio9ruvu.apps.googleusercontent.com',
    iosBundleId: 'br.com.money',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACmk4t_3jgO6pWUj8OgWHzbzDL9zeXkXg',
    appId: '1:319137741227:ios:88841ccce06d6b22efbaee',
    messagingSenderId: '319137741227',
    projectId: 'money-app-f9957',
    storageBucket: 'money-app-f9957.appspot.com',
    iosClientId:
        '319137741227-qsd7bmls4k7ue9t45el0dc0g3hpfdb3g.apps.googleusercontent.com',
    iosBundleId: 'br.com.money.RunnerTests',
  );
}
