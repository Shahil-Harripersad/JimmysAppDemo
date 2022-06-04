//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:jimmys_app_demo/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderItem {
  final String customerID;
  final String orderNum;
  final double totalAmount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {required this.customerID,
      required this.orderNum,
      required this.totalAmount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders =
      []; //List of order items; Empty list since no orders by defualt

  List<OrderItem> get orders {
    return [..._orders]; //this get our order items
  }

  //method for adding the order to the database
  Future<void> addOrder(
      List<CartItem> cartProducts, double totalAmount, String orderNum) async {
    DatabaseReference _ref = FirebaseDatabase.instance
        .ref(); //A single database reference that can be reused for different children (i.e Orders or Customers)

    final order = _ref.child(
        'Orders'); //making use of our database reference and giving it the path Orders

    final latestORderid = _ref.child(
        'recentOrderId'); //making use of our database reference to store the most recent orderID created

    final timeStamp = DateTime.now();

    final FirebaseAuth _auth = FirebaseAuth
        .instance; // creating an instance of built in authentication
    User? myUser = FirebaseAuth
        .instance.currentUser; // getting the detail of the current user

    try {
      if (myUser != null) {
        DatabaseReference uniqueID = order
            .push(); //this creates a uniques id for our order database path

        String? recentOrder = uniqueID
            .key; //assigning the ID to a string so it is visible in print()

        latestORderid.set({
          'orderID': uniqueID.key
        }); //setting the seperate ID stored to the new ID
        print(
            '############################################ $recentOrder'); //for debugging uniqueID

        uniqueID.set({
          //using the unique ID we made for order to create a new order
          'customerID': myUser.uid, //inserting the user uid specifically
          'orderNum': orderNum,
          'totalAmount': totalAmount,
          'dateTime': timeStamp.toString(),
          'cartProduct':
              cartProducts // a list mapped to the model cartItems in cart
                  .map((cp) => {
                        'id': cp.id,
                        'title': cp.name,
                        'quantity': cp.quantity,
                        'price': cp.price
                      })
                  .toList()
        });

        notifyListeners(); //Notify listeners that we added an order

        _orders.insert(
            0,
            OrderItem(
                customerID: myUser.uid,
                orderNum: orderNum.toString(),
                totalAmount: totalAmount,
                products: cartProducts,
                dateTime: timeStamp));
      }

      notifyListeners(); //Notify listeners that we added an order

    } catch (error) {
      throw error;
    }
  }
}
