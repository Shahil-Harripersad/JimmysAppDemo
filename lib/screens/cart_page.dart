import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:jimmys_app_demo/Widgets/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          title: const Text("Jimmy's App Demo"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: cartList(),
        floatingActionButton: SizedBox.fromSize(
          size: const Size(200, 50),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: const Text(
              "Checkout",
              style: TextStyle(fontSize: 20),
            ),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartPage())),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
