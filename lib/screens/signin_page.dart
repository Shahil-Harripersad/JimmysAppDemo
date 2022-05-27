import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';
import 'package:jimmys_app_demo/screens/signup_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'order_confiramtion.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Widget contains entire home page
  @override
  Widget build(BuildContext context) {
    // Layout containing screen
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.2),
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

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
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
              ),

              // Password Input
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextFormField(
                  controller: passwordController,
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

              GFButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                }, // onPressed
                shape: GFButtonShape.pills,
                color: Colors.black,
                text: "Sign In",
                size: GFSize.LARGE,
                blockButton: true,
              ),
              const SizedBox(height: 24),
              const Text("Don't have an account?",
                  style: TextStyle(color: Colors.black)),
              const Padding(padding: EdgeInsets.all(5)),
              GFButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => (SignUpPage()))),
                text: "Sign Up",
                borderSide: const BorderSide(color: Colors.black),
                color: Colors.transparent,
                shape: GFButtonShape.pills,
                size: GFSize.LARGE,
              ),

              // ConfirmOrder()
            ],
          ),
        ),
      ),
    );
  }
}
