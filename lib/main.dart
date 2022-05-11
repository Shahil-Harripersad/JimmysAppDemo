import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/authentication_service.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:jimmys_app_demo/screens/signin_page.dart';
import 'package:provider/provider.dart';

// This runs the app and initializes Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// The actual app...
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Multi Provider
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'FlutterDemo', // change header title
        theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.red,
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

// Contains everything on the page
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      // This fetches the home page
      return const HomePage();
    }

    //This fetches the sign in page
    return SignInPage();
  }
}
