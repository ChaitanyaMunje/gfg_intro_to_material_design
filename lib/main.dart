import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_material_design/firebase_authentication/home_page.dart';
import 'package:intro_to_material_design/not_uploaded_videos/language_detection.dart';
import 'package:provider/provider.dart';

import 'firebase_authentication/login_page.dart';

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //firebaseUser = context.watch<User>();
      debugShowCheckedModeBanner: false,
      home: LanguageDetectionPage(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      //If the user is successfully Logged-In.
      return HomePage();
    } else {
      //If the user is not Logged-In.
      return LoginPage();
    }
  }
}
