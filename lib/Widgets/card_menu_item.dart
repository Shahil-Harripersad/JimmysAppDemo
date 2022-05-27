import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';

class CardMenuItem extends StatelessWidget {
  const CardMenuItem({Key? key}) : super(key: key);

  //Need to create a constructor for these cards

  final String pdtId = "1"; //To be assinged by the database
  final String pdtName = "Chicken"; //To be assinged by the database
  final double pdtPrice = 45.00; //To be assinged by the database
  final String description =
      "Jimmy's style chicken prepared with a sauce of your choice."; //To be assinged by the database

  @override
  Widget build(BuildContext context) {
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
                  "${pdtName}",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  "R${pdtPrice.toString()}",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Container(
              alignment: Alignment.centerRight,
              child: GFIconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
                type: GFButtonType.transparent,
              ),
            )
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
