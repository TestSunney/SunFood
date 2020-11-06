import 'package:flutter/material.dart';

class MyStyle {
  Color primary = Colors.red;
  Color secondry = Colors.red[100];

  SizedBox  mySizeBox() => SizedBox(width: 8.0, height: 16.0,);


  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  } //show logo

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 30, color: MyStyle().primary, fontWeight: FontWeight.bold),
      );
  MyStyle();
}
