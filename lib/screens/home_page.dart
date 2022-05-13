import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/screens/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';
import 'package:jimmys_app_demo/Widgets/card_menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.2),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        // Appbar with title
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home Page"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            icon: const Icon(Icons.fastfood),
          ),
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Welcome to the Jimmy's App :)",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "You are signed in as",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  user.email!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
                const CardMenuItem(),
              ],
            ),
          ),
        ),

        // App bar at the bottom of the screen
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.red,
          child: Row(
            children: [
              // Log out button
              const IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: null,
              ),

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
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CartPage())),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
