import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/models/cart.dart';
import 'package:jimmys_app_demo/models/orders.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatefulWidget {
  final Cart cart;
  // final CartItem cartCost;

  const CheckoutButton({required this.cart});
  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
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
            : () async {
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.items.toList(), widget.cart.calcCartTotal);
              }); //Checks to see if cart has items
  }
}
