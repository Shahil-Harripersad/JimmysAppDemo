import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/Widgets/place_order.dart';
import 'package:jimmys_app_demo/models/cart.dart';
import 'package:jimmys_app_demo/models/orders.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatefulWidget {
  final Cart cart;
  // final CartItem cartCost;

  const CheckoutButton({required this.cart});
  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

// This button
class _CheckoutButtonState extends State<CheckoutButton> {
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ElevatedButton(
        child: const Text(
          'Place Order',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          padding: const EdgeInsets.all(20.0),
        ),
        onPressed: widget.cart.calcCartTotal <= 0
            ? null
            : () {
                //
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => (PlaceOrder(
                          cart: cart,
                        ))));
                // Navigator.pop(
                //    context, true); // This closes the checkout dialog box
              });
  }
}
