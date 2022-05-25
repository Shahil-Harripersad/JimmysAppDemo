import 'package:flutter/cupertino.dart';

class MenuItems {
  final String itemName;
  final double itemCost;

  const MenuItems({required this.itemName, required this.itemCost});

  Map<String, dynamic> toJson() => {'itemName': itemName, 'itemCost': itemCost};
}
