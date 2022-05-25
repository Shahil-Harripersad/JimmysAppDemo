import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:jimmys_app_demo/Widgets/cart_list.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static const routeName = '/cart'; //The path to the cart screen
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    double cartTotal =
        cart.calcCartTotal(); //Stores the total price of the cart

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
          body: Column(
            children: [
              Expanded(child: cartList()),
            ],
          ),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

          //Code for total price at the bottom of the screen
          bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                      style: BorderStyle.none)),
              child: Center(
                  child: Text(
                "Total price: R${cartTotal}",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))),
        ));
  }
}
