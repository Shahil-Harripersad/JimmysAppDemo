//This model will define how the cart will work

import 'package:flutter/cupertino.dart';
import 'package:jimmys_app_demo/Widgets/cart_list.dart';
import '../screens/item_page.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price});

  int get cartItemQuantity {
    return quantity;
  }

  double get cartItemPrice {
    return price;
  }

  String get cartItemId {
    return id;
  }
}

class Cart with ChangeNotifier {
  List<CartItem> _items = <CartItem>[]; //Stores the items in the cart

  List<CartItem> get items {
    //Getter for the items in the cart
    return _items;
  }

  int get itemCount {
    //Getter for the number of items in our cart
    return _items.length;
  }

  void addItem(String name, int quantity, double price) {
    //Method to add items to the cart
    //Sets the parameters of each cart item to the parameters of the method (which will come from another class)
    _items.add(CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        quantity: quantity,
        price: price));
  }

  void removeItem(String id) {
    //Simply removes the item with the specified id
    _items.removeWhere((item) => item.id == id);
    notifyListeners(); //Notifying the providers when an item is added to the cart
  }

  void clearAllItems() {
    //Method to clear all items in a cart

    _items = [];
    notifyListeners();
  }

  double calcCartTotal() {
    //Calculates and returns the total price of the entire cart
    double cartTotal = 0;

    cartTotal = _items.fold(
        cartTotal, (sum, element) => sum + (element.price * element.quantity));

    return cartTotal;
  }
}
