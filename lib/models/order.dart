import 'package:flutter/rendering.dart';

class Order {
  final String custNo;
  final String empNo;
  final double totalCost;
  final String status;
  final DateTime dateTime;
  final bool accepted;

  const Order(
      {required this.custNo,
      required this.empNo,
      required this.totalCost,
      required this.status,
      required this.dateTime,
      required this.accepted});

  Map<String, dynamic> toJson() => {
        'custNo': custNo,
        'empNo': empNo,
        'totalCost': totalCost,
        'status': status,
        'dateTime': dateTime,
        'accepted': accepted
      };
}
