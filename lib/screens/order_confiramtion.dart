import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:jimmys_app_demo/models/cart.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ConfirmOrder());
  }

  ConfirmOrder() => showDialog(
        context: context,
        builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Stack(
              //overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 187, 47, 37)),
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: const Text("Confirm Order",
                      style: TextStyle(fontSize: 28),
                      textAlign: TextAlign.center),
                ),
                //       Container(
                //         child: Text(
                //   "Total: R" + num,
                //         style: const TextStyle(fontSize: 25),
                //      )),

                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 130, bottom: 10),
                  child: ElevatedButton(
                    child: Text('Place Order'),
                    onPressed: () => print('done'),
                  ),
                )
                // GFButton(onPressed: (() => Text('Finally')))
              ],
            )),
      );
}
