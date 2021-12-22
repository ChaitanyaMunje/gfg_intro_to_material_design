import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_material_design/firebase_authentication/home_page.dart';
import 'package:intro_to_material_design/firebase_authentication/signup_page.dart';
import 'package:provider/provider.dart';

import 'firebase_authentication/authentication.dart';
import 'firebase_authentication/login_page.dart';
import 'firebase_authentication/splah_screen.dart';
import 'not_uploaded_videos/language_translator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     // 2
    //     Provider<AuthenticationService>(
    //       create: (_) => AuthenticationService(FirebaseAuth.instance),
    //     ),
    //     // 3
    //     StreamProvider(
    //       create: (context) =>
    //           context.read<AuthenticationService>().authStateChanges,
    //       initialData: null,
    //     )
    //   ],
      //child:
      return MaterialApp(
        title: 'Flutter Firebase Auth',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //     visualDensity: VisualDensity.adaptivePlatformDensity,
        //     primaryColor: Colors.indigoAccent),
       // initialRoute: '/',
        home: LanguageTranslatorApp(),
        // routes: {
        //   '/': (context) => Splash(),
        //   '/auth': (context) => AuthenticationWrapper(),
        //   '/signin': (context) => SignIn(),
        //   '/signup': (context) => SignUp(),
        //   '/home': (context) => Home(),
        // },
      );
    //);
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
      return const Home();
    }
    return SignIn();
  }
}
