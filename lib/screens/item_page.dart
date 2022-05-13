import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/Plugins/authentication_service.dart';
import 'package:jimmys_app_demo/screens/home_page.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Chickin",
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "R49.00",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
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
              ]),
            ),
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
      ),
    );
  }
}
