import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCzZiChndoD24PvDaX8wL-Qc3GusUj7zEA',
    appId: '1:809991010544:android:c1a4f4a50634d98b652a35',
    messagingSenderId: '619383063505',
    projectId: 'authentication-2c138',
    storageBucket: 'authentication-2c138.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOE3CNfPyF1E_D6r2lwh1r4oIZ6yjHGQQ',
    appId: '1:619383063505:ios:f346cd1d2158bbb4a396f0',
    messagingSenderId: '619383063505',
    projectId: 'my-userauthentication-project',
    storageBucket: 'my-userauthentication-project.appspot.com',
    iosClientId:
        '619383063505-ft2tfu822tr3rm49dg0kq2pu8fe059i8.apps.googleusercontent.com',
    iosBundleId: 'com.example.userAuthentication',
  );
}
