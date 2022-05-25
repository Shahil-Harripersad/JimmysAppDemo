import 'dart:core';
import 'package:flutter/material.dart';
import 'package:jimmys_app_demo/Widgets/card_menu_item.dart';
import 'package:jimmys_app_demo/Widgets/card_cart_item.dart';
import 'package:provider/provider.dart'; //Provider is a package that help us manage our states
import '../models/cart.dart';

class cartList extends StatefulWidget {
  cartList({Key? key}) : super(key: key);

  @override
  _cartListState createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (ctx, i) => CardCartItem(
            cart.items.toList()[i].id,
            cart.items.toList()[i].price,
            cart.items.toList()[i].quantity,
            cart.items.toList()[i].name));
  }
}
