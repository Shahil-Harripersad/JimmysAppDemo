import 'package:jimmys_app_demo/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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

  Map<String, dynamic> toJson() => {
        'id': dateTime,
        'totalAmount': totalAmount,
        'dateTime': dateTime,
        'products': products
      };
}
