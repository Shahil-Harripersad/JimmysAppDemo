//import 'dart:html';

import 'package:jimmys_app_demo/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double totalAmount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {required this.id,
      required this.totalAmount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  // final OrderItem orderItem = Or
  final List<OrderItem> _orders =
      []; //List of order items; Empty list since no orders by defualt

  List<OrderItem> get orders {
    //this get our order items
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double totalAmount) async {
    // DatabaseReference _ref = FirebaseDatabase.instance.ref().child('Orders');
    final url =
        'https://jimmy-s-app-demo-default-rtdb.asia-southeast1.firebasedatabase.app/Orders.json';

    final timeStamp = DateTime.now();
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'id': DateTime.now().toString(),
            'totalAmount': totalAmount,
            'dateTimw': timeStamp.toIso8601String(),
            'cartProduct': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.name,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              totalAmount: totalAmount,
              products: cartProducts,
              dateTime: timeStamp));
      notifyListeners(); //Notify listeners that we added an order

    } catch (error) {
      throw error;
    }
  }
}
