import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'screens/auth_screen.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        // primaryColor: Colors.pink.shade200,
        colorScheme: ColorScheme(
          primary: Colors.pink.shade200,
          onPrimary: Color.lerp(Colors.pink, Colors.white, .9),
          secondary: Colors.pink.shade100,
          onSecondary: Color.lerp(Colors.pink, Colors.white, .2),
          surface: Colors.pink,
          onSurface: Color.lerp(Colors.pink, Colors.white, .7),
          background: Colors.pink.shade50,
          onBackground: Color.lerp(Colors.pink, Colors.white, .2),
          tertiary: Colors.purple.shade400,
          brightness: Brightness.light,
          error: Colors.red.shade800,
          onError: Colors.white,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink.shade400,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
