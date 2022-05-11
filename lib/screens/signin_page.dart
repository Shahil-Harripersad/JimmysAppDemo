import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/authentication_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Widget contains entire home page
  @override
  Widget build(BuildContext context) {
    // Layout
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 50, right: 30, bottom: 20),
            child: Image.asset('assets/images/Jimmys-Killer-Grills.png'),
          ),

          const Text("test@gmail.com"),
          const Text("test123"),
          // email field
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
          ),

          // Password Input
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
          ),

          const Padding(padding: EdgeInsets.all(10)),

          Row(

              // Sign in button
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(20)),
                Expanded(
                    child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                        emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  // ignore: unnecessary_const
                  child: const Text("Sign In"),
                )),
                const Padding(padding: EdgeInsets.all(10)),
                Expanded(
                    child:
                        // Sign up Button
                        MaterialButton(
                  padding: EdgeInsets.only(),
                  color: Colors.red,
                  onPressed: () {
                    context.read<AuthenticationService>().signUp(
                        emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: const Text("Sign up"),
                )),
                const Padding(padding: EdgeInsets.all(20)),
              ]),

          Padding(padding: EdgeInsets.only(bottom: 10))
        ],
      ),
    ));
  }
}
