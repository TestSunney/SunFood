import 'package:flutter/material.dart';

class MyStyle {
  Color primary = Colors.red;
  Color secondry = Colors.red[100];

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }//Prsgress bar

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  SizedBox mySizeBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  } //show logo

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 30,
            color: MyStyle().primary,
            fontWeight: FontWeight.bold),
      );

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5, //hafe os screen
        child: Text(
          string,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  } //text center

  MyStyle();
}
