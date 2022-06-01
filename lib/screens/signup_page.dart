import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/models/customers.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';
import 'package:jimmys_app_demo/screens/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jimmys_app_demo/models/customers.dart';

import '../utils/show_snack_bar.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void verifySignUp(String email, String password, String confirmPassword,
      BuildContext context) {
    if (email.isEmpty) {
      showSnackBar(context, 'Enter your email');
    } else if (password.isEmpty) {
      showSnackBar(context, 'Enter your password');
    } else if (password.isEmpty) {
      showSnackBar(context, 'Confirm your password');
    } else if (password != confirmPassword) {
      showSnackBar(context, 'Password do not match');
    } else {
      context.read<AuthenticationService>().signUp(email, password, context);
    }
  } // Widget contains entire home page

  @override
  Widget build(BuildContext context) {
    // Layout containing screen
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.red.withOpacity(0.5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const GFImageOverlay(
                  height: 175,
                  width: 175,
                  shape: BoxShape.circle,
                  image: AssetImage('assets/images/JimmysVarsityLogo.jpg'),
                  boxFit: BoxFit.cover,
                ),
              ),

              // email field
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(width: 2),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  iconColor: Colors.black,
                  focusColor: Colors.black,
                ),
              ),

              // Password Input
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    iconColor: Colors.black,
                    focusColor: Colors.black,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    iconColor: Colors.black,
                    focusColor: Colors.black,
                  ),
                ),
              ),

//Sing up initiated using button
              GFButton(
                onPressed: () {
                  verifySignUp(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    confirmPasswordController.text.trim(),
                    context,
                  );
                },
                shape: GFButtonShape.pills,
                color: Colors.black,
                text: "Sign up",
                size: GFSize.LARGE,
                blockButton: true,
              ),
              const SizedBox(height: 24),
              const Text("Already have an account?",
                  style: TextStyle(color: Colors.black)),
              const Padding(padding: EdgeInsets.all(5)),

              GFButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage())),
                text: "Sign In",
                borderSide: const BorderSide(color: Colors.black),
                color: Colors.transparent,
                shape: GFButtonShape.pills,
                size: GFSize.LARGE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
