import 'package:flutter/material.dart';
import 'package:sunfood/utility/signout_process.dart';

class MainShop extends StatefulWidget {
  MainShop({Key key}) : super(key: key);

  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(),
          )
        ],
      ),
    );
  }
}
