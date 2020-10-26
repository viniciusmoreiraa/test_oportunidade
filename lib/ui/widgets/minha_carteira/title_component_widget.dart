import 'package:flutter/material.dart';
import 'package:genial_test/utils/style.dart';

class TitleComponentText extends StatelessWidget {
  final String s;

  const TitleComponentText({Key key, this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 20),
      child: Text(
        s.toUpperCase(),
        style: styleH3(context: context),
      ),
    );
  }
}
