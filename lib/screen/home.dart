import 'package:flutter/material.dart';
import 'package:sunfood/screen/signIn.dart';
import 'package:sunfood/screen/signUp.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHeadDrawer(), signInMenu(), signUpMenu()],
        ),
      );

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

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      accountName: Text('Guest'),
      accountEmail: Text('Plese Login'),
    );
  }
}
