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
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
                opacity: 0.5)),
        child: Scaffold(
          backgroundColor: Colors.redAccent.withOpacity(0.8),
          // Header with title
          appBar: AppBar(
            title: const Text("Jimmy's App Demo"),
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
          ),

          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text("Welcome to the Jimmy's App :)",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ],
          )),

          // App bar at the bottom of the screen
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.red,
            child: Row(
              children: [
                // Log out button
                IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    }),

                const Spacer(),

                //Search Button
                IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {}),
              ],
            ),
          ),

          // Floating Action Button
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
              onPressed: () {}),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
