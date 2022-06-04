import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  String lastOrderNum =
      ""; //the order numbered fetched and cast toString() => cannot be cast to int immediately

  int intOrderNum = 0; // converting string to int for incrementing

  String newOrderNum =
      ""; // converting int back toString() and passing this as the new order number

  String? orderNumPath =
      ""; //The ID of the last order to be used in the path to fetch the order number

  final DatabaseReference _readRef =
      FirebaseDatabase.instance.ref(); //instance of database

  @override
  void initState() {
    //Hover cursor over method to get definition
    super.initState();
    _activateListeners();
  }

  void _activateListeners() async {
    //
    final snapshot = await _readRef
        .child('recentOrderId/orderID')
        .get(); //getting order ID or the last order
    if (snapshot.exists) {
      print(snapshot.value);
      orderNumPath = snapshot.value.toString(); //assigning the ID to a variable
      print(
          '========================================================= The most recent orderID fetched: ====== $orderNumPath');
      //--------------------------------------------------------------------
      final readOrder = _readRef
          .child(
              'Orders/$orderNumPath/orderNum') //Accessing the last orer number using the ID we just fetched
          .onValue
          .listen((event) {
        final orderNum =
            event.snapshot.value; //assiging the number to the orderNum varialbe

        setState(() {
          //hover setState for definition
          print(
              '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% The order number fetched from the last order %%%%%%   $orderNum'); //For debugging orderNum

          lastOrderNum = orderNum.toString();
          intOrderNum = int.parse(lastOrderNum) + 1; //incrementing order number
          print(
              '****************************************  Adding one to order number ****** $intOrderNum'); // For debugging

          newOrderNum = intOrderNum.toString();

          print(
              '---------------------------------------- The new order number set toString ------  $newOrderNum'); // For debugging

          Provider.of<Orders>(context, listen: false).addOrder(
              //passing the cart items, total amount and new order number to the addOrder method in orders.dart
              widget.cart.items.toList(),
              widget.cart.calcCartTotal,
              newOrderNum);
        });
      });
      //--------------------------------------------------------------------

    } else {
      print('No data available.');
    }
  }

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
                initState();
                //
                //    showDialog(
                //       context: context,
                //      builder: (context) => Dialog(
                //         backgroundColor: Colors.transparent,
                //          insetPadding: EdgeInsets.all(10),
                //         child: Stack()));
                //
              });
  }
}
