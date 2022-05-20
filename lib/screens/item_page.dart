//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';

class ItemPageState extends StatefulWidget {
  const ItemPageState({Key? key}) : super(key: key);

  @override
  ItemPage createState() => ItemPage();
}

class ItemPage extends State<ItemPageState> {
  //const ItemPage({Key? key}) : super(key: key);

  int _itemCounter = 1; //Store the number of items the user selects
  final _itemPrice =
      45; //Stores the price of the item. Set to 45 for testing purposes

  void _incrementCounter() {
    //Increments the item counter variable
    if (_itemCounter < 10) {
      setState(() {
        _itemCounter++;
      });
    }
  }

  void _decrementCounter() {
    //Increments the item counter variable
    if (_itemCounter > 1) {
      setState(() {
        _itemCounter--;
      });
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
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Chickin",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "R45.00", //Need to change this to a dynamic value
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
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                  color: Colors.black, width: 0.5, style: BorderStyle.none)),
          //Row is entire counter and add to cart
          child: Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GFIconButton(
                        onPressed: () {
                          _decrementCounter();
                        },
                        color: Colors.redAccent,
                        shape: GFIconButtonShape.pills,
                        size: GFSize.SMALL,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _itemCounter.toString(),
                        style:
                            const TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GFIconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        shape: GFIconButtonShape.pills,
                        color: Colors.redAccent,
                        size: GFSize.SMALL,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Container(
                    //Container for add to cart
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Total : R${(_itemPrice * _itemCounter).toString()}",
                      style: const TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
