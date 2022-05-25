import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../screens/item_page.dart';

class CardCartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String name;

  const CardCartItem(this.id, this.price, this.quantity, this.name);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Column(children: <Widget>[
      InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => (ItemPageState()))),
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const ClipRect(
                child: Align(
              alignment: Alignment.center,
              widthFactor: 0.8,
              child: Image(
                image: AssetImage("assets/images/JimmysChicken.png"),
                height: 100,
                fit: BoxFit.cover,
              ),
            )),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  "R${price}",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Text("x" + quantity.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20)),
            const SizedBox(width: 20),
            Container(
              alignment: Alignment.centerRight,
              child: GFIconButton(
                onPressed: () {
                  cart.removeItem(this.id); //Id hard coded
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.black,
                ),
                type: GFButtonType.transparent,
              ),
            ),
          ]),

          /*child:  Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Image(
                    image: AssetImage("assets/images/JimmysChicken.png"),
                    height: 100,
                  ),
                ]),
          ), */
        ),
      )
    ]);
  }
}
