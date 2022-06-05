import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/models/orders.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:jimmys_app_demo/screens/order_confiramtion.dart';
import 'package:provider/provider.dart';
import 'package:jimmys_app_demo/Widgets/cart_list.dart';
import '../models/cart.dart';
import 'package:jimmys_app_demo/Widgets/checkout.dart';
import '../screens/checkoutScreen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  static const routeName = '/cart'; //The path to the cart screen
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Orders newOrder = Orders();

  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    double cartTotal = cart.calcCartTotal; //Stores the total price of the cart

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

            //Back button => Home
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
              //
              //  CheckoutButton(cart: cart),
            ],
          ),
          floatingActionButton: SizedBox.fromSize(
            // ------- This is the checkout button
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
              onPressed: () => showDialog(
                // ------------ This is the dialog displayed onPress()
                context: context,
                builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.all(10),
                    child: Stack(
                      //overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 187, 47, 37)),
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          child: const Text("Confirm Order",
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.center),
                        ),

                        Container(
                            child: Text(
                          "Total: R" + cartTotal.toString(),
                          style: const TextStyle(fontSize: 25),
                        )),

                        Container(
                            margin: const EdgeInsets.only(top: 150),
                            child: CheckoutButton(
                                cart:
                                    cart)) // ------------ this is actually the confirm order button widget
                      ],
                    )),
                //------------------------------------------------
              ).then((exit) {
                if (exit == null) return;

                if (exit) {}
              }), //--------------------------------------------------
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
