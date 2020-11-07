import 'package:flutter/material.dart';
import 'package:sunfood/utility/my_style.dart';
import 'package:sunfood/utility/signout_process.dart';
import 'package:sunfood/widget/infomation_shop.dart';
import 'package:sunfood/widget/list_food_maau_shop.dart';
import 'package:sunfood/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  MainShop({Key key}) : super(key: key);

  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
//Field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            foodMenu(),
            infomationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
      leading: Icon(Icons.home),
      title: Text('Order that coustomer order'),
      subtitle: Text('Order that we didnt do it'),
      onTap: () {
        setState(() {
          currentWidget = OrderListShop();//pop page out
        });
        Navigator.pop(context);
      });

  ListTile foodMenu() => ListTile(
      leading: Icon(Icons.fastfood),
      title: Text('Menu'),
      subtitle: Text('all our food'),
      onTap: () {
        setState(() {
          currentWidget = ListFoodMenuShop();
        });
        Navigator.pop(context);
      });

  ListTile infomationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('Inforation'),
        subtitle: Text('all detaill ,open hr, lose'),
        onTap: () {
        setState(() {
          currentWidget = InfomationShop();
        });
        Navigator.pop(context);
      });

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.logout),
        title: Text('sign out'),
        subtitle: Text('sig out and back'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Name Shop',
        style: TextStyle(color: MyStyle().primary),
      ),
      accountEmail: Text('Login'),
    );
  }
}
