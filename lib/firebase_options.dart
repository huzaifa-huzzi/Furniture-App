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
    apiKey: 'AIzaSyAfS9pmShaPPCMwk7rljcb2AtJV_16meok',
    appId: '1:151080593680:web:ce5af902df4e9f9e435d95',
    messagingSenderId: '151080593680',
    projectId: 'furniture-store-857c3',
    authDomain: 'furniture-store-857c3.firebaseapp.com',
    storageBucket: 'furniture-store-857c3.appspot.com',
    measurementId: 'G-GW8982EKQ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDduMPBW6NdnC5BcoLm8ffkm-Le9eZQu8Y',
    appId: '1:151080593680:android:fce0474439d4655f435d95',
    messagingSenderId: '151080593680',
    projectId: 'furniture-store-857c3',
    storageBucket: 'furniture-store-857c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnCO-DcJLDliOwJBnvhHGgQaX5k8BRm6g',
    appId: '1:151080593680:ios:6b46d029cbde0571435d95',
    messagingSenderId: '151080593680',
    projectId: 'furniture-store-857c3',
    storageBucket: 'furniture-store-857c3.appspot.com',
    iosBundleId: 'com.example.dartFurnitureStoreApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnCO-DcJLDliOwJBnvhHGgQaX5k8BRm6g',
    appId: '1:151080593680:ios:a0bc7961b3e30ee7435d95',
    messagingSenderId: '151080593680',
    projectId: 'furniture-store-857c3',
    storageBucket: 'furniture-store-857c3.appspot.com',
    iosBundleId: 'com.example.dartFurnitureStoreApp.RunnerTests',
  );
}
