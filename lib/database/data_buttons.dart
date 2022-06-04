import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Buttons extends StatelessWidget {
  Buttons({Key? key}) : super(key: key);
  final TextEditingController empEmailController = TextEditingController();
  final TextEditingController empPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const <Widget>[
        // ElevatedButton(onPressed:  child:);
      ]),
    );
  }
}
