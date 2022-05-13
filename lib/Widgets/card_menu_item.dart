import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jimmys_app_demo/screens/item_page.dart';

class CardMenuItem extends StatelessWidget {
  const CardMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => (ItemPage()))),
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
              children: const [
                Text(
                  "Chickin",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  "R49.00",
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
