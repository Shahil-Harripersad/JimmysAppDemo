import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/authentication_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/cat2.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          // Header with title
          appBar: AppBar(
            title: const Text("Jimmy's App Demo"),
          ),

          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome to the Jimmy's App :)"),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: RawMaterialButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                      },
                      child: const Text("Sign out")))
            ],
          )),
        ));
  }

/*  return Scaffold(
      // Header with title
      appBar: AppBar(
        title: const Text("Jimmy's App Demo"),
      ),

      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welcome to the Jimmy's App :)"),
          Container(
              margin: const EdgeInsets.all(20),
              child: RawMaterialButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: const Text("Sign out")))
        ],
      )),
    ); */
}
