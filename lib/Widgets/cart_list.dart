import 'dart:core';

import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/Widgets/card_menu_item.dart';
import 'package:jimmys_app_demo/Widgets/card_cart_item.dart';

class cartList extends StatefulWidget {
  cartList({Key? key}) : super(key: key);

  final _cartTotal = 0;

  @override
  _cartListState createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CardCartItem(),
        CardCartItem(),
      ],
    );
  }
}

class cartItem {
  final int itemPrice;
  final String itemName;

  cartItem(this.itemPrice, this.itemName);
}
