import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jimmys_app_demo/models/cart.dart';
import 'package:jimmys_app_demo/models/orders.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';

class PlaceOrder extends StatefulWidget {
  // const PlaceOrder({Key? key}) : super(key: key);
  final Cart cart;
  const PlaceOrder({required this.cart});
  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
              opacity: 0.2)),
      child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //----------------------------------------------------------------
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 187, 47, 37)),
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: const Text("Your Order Has Been Placed!",
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              //----------------------------------------------------------------
              Container(
                //width: Double.infintiy,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  "Order Number: $newOrderNum",
                  style: const TextStyle(fontSize: 29),
                ),
              ),
              //----------------------------------------------------------------
              Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 150),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (const HomePage())));
                      },
                      child: const Text("Ok",
                          style: TextStyle(fontSize: 28, color: Colors.red))))
              //----------------------------------------------------------------
            ],
          )),
    );
  }
}
