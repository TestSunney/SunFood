import 'package:flutter/material.dart';
import 'package:sunfood/screen/home.dart';
import 'package:sunfood/screen/add_info_shop.dart';
import 'package:sunfood/screen/test.dart';

main() => runApp(MyApp());

//test git
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'Sunney Food',
      home:
          Home(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
