import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:jimmys_app_demo/screens/signin_page.dart';
import 'package:jimmys_app_demo/screens/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:jimmys_app_demo/Plugins/material_color.dart';

// This runs the app and initializes Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
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
            primarySwatch: generateMaterialColor(Palette.primary),
            primaryTextTheme:
                const TextTheme(headline6: TextStyle(color: Colors.black))),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class Palette {
  static const Color primary = Color.fromARGB(255, 0, 0, 0);
}

// Contains everything on the page
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong :("));
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return SignInPage();
            }
          },
        ),
      );
}
