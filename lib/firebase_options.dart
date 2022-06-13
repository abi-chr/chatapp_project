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
    apiKey: 'AIzaSyA9_PsO9HxR8DNbbAONrSS4UZ9UrWUW4Yk',
    appId: '1:1072542132511:web:ed87122207baf400e8e82a',
    messagingSenderId: '1072542132511',
    projectId: 'chatapp-project-980af',
    authDomain: 'chatapp-project-980af.firebaseapp.com',
    storageBucket: 'chatapp-project-980af.appspot.com',
    measurementId: 'G-9Z82921F0Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUewzPQ-sdMhYAO5kpFHSuZ4CyroHcCAk',
    appId: '1:1072542132511:android:0c4836e9df032cefe8e82a',
    messagingSenderId: '1072542132511',
    projectId: 'chatapp-project-980af',
    storageBucket: 'chatapp-project-980af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuMsjZjLfbpiXjt-XRJr8jhuUjYJm_Hhk',
    appId: '1:1072542132511:ios:256805e0b7ff1681e8e82a',
    messagingSenderId: '1072542132511',
    projectId: 'chatapp-project-980af',
    storageBucket: 'chatapp-project-980af.appspot.com',
    iosClientId: '1072542132511-da4v13h4912e1emmrpda6i8jgqb391md.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatappProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuMsjZjLfbpiXjt-XRJr8jhuUjYJm_Hhk',
    appId: '1:1072542132511:ios:256805e0b7ff1681e8e82a',
    messagingSenderId: '1072542132511',
    projectId: 'chatapp-project-980af',
    storageBucket: 'chatapp-project-980af.appspot.com',
    iosClientId: '1072542132511-da4v13h4912e1emmrpda6i8jgqb391md.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatappProject',
  );
}
