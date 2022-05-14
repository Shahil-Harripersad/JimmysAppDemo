//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';

class ItemPageState extends StatefulWidget {
  @override
  ItemPage createState() => ItemPage();
}

class ItemPage extends State<ItemPageState> {
  //const ItemPage({Key? key}) : super(key: key);

  int _itemCounter = 0; //Store the number of items the user selects
  double _itemPrice =
      45; //Stores the price of the item. Set to 45 for testing purposes

  void _incrementCounter() {
    //Increments the item counter variable
    setState(() {
      _itemCounter = checkQuantity(_itemCounter + 1);
    });
  }

  void _decrementCounter() {
    //Decrements the item counter variable
    setState(() {
      _itemCounter = checkQuantity(_itemCounter - 1);
    });
  }

  int checkQuantity(int itemQuantity) {
    //Sets the min and max value that item quantity can be

    if (itemQuantity < 0) {
      //Setting max items to 0
      return 0;
    } else if (itemQuantity > 10) {
      //Setting max items to 10
      return 10;
    } else {
      return itemQuantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.2),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          title: const Text("Item Screen"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image(
              image: const AssetImage("assets/images/JimmysChicken.png"),
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Chickin",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "R45.00",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Jimmy's style chicken prepared with a sauce of your choice.",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: const Icon(
                        Icons.favorite_outline,
                        size: 30,
                        color: Colors.black,
                      ))
                ])),
            const SizedBox(height: 40),
            GFRadioListTile(
              titleText: 'Lemon & Herb',
              size: 25,
              activeBorderColor: Colors.black,
              focusColor: Colors.black,
              type: GFRadioType.basic,
              value: 0,
              groupValue: 1,
              onChanged: (value) {},
              inactiveIcon: null,
            ),
            GFRadioListTile(
              titleText: 'Prego',
              size: 25,
              activeBorderColor: Colors.black,
              focusColor: Colors.black,
              type: GFRadioType.basic,
              value: 0,
              groupValue: 1,
              onChanged: (value) {},
              inactiveIcon: null,
            ),
            GFRadioListTile(
              titleText: 'Peri peri',
              size: 25,
              activeBorderColor: Colors.black,
              focusColor: Colors.black,
              type: GFRadioType.basic,
              value: 0,
              groupValue: 1,
              onChanged: (value) {},
              inactiveIcon: null,
            ),
            GFRadioListTile(
              titleText: 'Preezy',
              size: 25,
              activeBorderColor: Colors.black,
              focusColor: Colors.black,
              type: GFRadioType.basic,
              value: 0,
              groupValue: 1,
              onChanged: (value) {},
              inactiveIcon: null,
            ),
          ]),
        ),
        floatingActionButton: SizedBox.fromSize(
          size: const Size(200, 50),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: const Text(
              "Add to cart",
              style: TextStyle(fontSize: 20),
            ),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        //Code for bottom bar with item spinner

        //First we create a container that will wrap a bottom navigation bar to hold our elements
        bottomNavigationBar: Container(
          height: 70,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                  color: Colors.black, width: 0.5, style: BorderStyle.none)),
          //Row is entire counter and add to cart
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                //Container that holds the spinner
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                //This row is for the individual buttons which are themselves in a row too
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _decrementCounter();
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${_itemCounter.toString()}",
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _incrementCounter();
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
            Container(
              //Container for add to cart
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              padding: EdgeInsets.all(5),
              child: Text(
                "R${(_itemPrice * _itemCounter).toString()} | Add to cart",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
