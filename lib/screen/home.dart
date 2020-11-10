import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunfood/screen/add_info_shop.dart';
import 'package:sunfood/screen/main_rider.dart';
import 'package:sunfood/screen/main_shop.dart';
import 'package:sunfood/screen/main_user.dart';
import 'package:sunfood/screen/signIn.dart';
import 'package:sunfood/screen/signUp.dart';
import 'package:sunfood/utility/my_style.dart';
import 'package:sunfood/utility/normal_dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPrefetance();
  }

  Future<Null> checkPrefetance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == 'Shop') {
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'Error user type');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            signUpMenu(),
            testMenu()
          ],
        ),
      );

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Guest'),
      accountEmail: Text('Plese Login'),
    );
  }

  ListTile signInMenu() {
    return ListTile(
        leading: Icon(Icons.login),
        title: Text('Sign In'),
        onTap: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (value) => SignIn());
          Navigator.push(context, route);
        });
  }

  ListTile signUpMenu() {
    return ListTile(
        leading: Icon(Icons.app_registration),
        title: Text('Sign Up'),
        onTap: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (value) => SignUp());
          Navigator.push(context, route);
        });
  }

  ListTile testMenu() {
    return ListTile(
        leading: Icon(Icons.location_city),
        title: Text('**Go to add res_info'),
        onTap: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (value) => AddInfoShop());
          Navigator.push(context, route);
        });
  }
}
