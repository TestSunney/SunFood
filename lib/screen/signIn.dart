import 'package:flutter/material.dart';
import 'package:sunfood/utility/my_style.dart';
class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        decoration: BoxDecoration(
         color: Colors.pink[100],
          ),
        
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().showTitle('Sunney food'),
                MyStyle().mySizeBox(), //obj show logo
                userFrom(),
                MyStyle().mySizeBox(),
                passFrom(),
                MyStyle().mySizeBox(),
                logInBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logInBtn() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().primary,
          onPressed: () {},
          child: Text(
            'Log in',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget userFrom() => Container(
        width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().primary,
            ),
            labelStyle: TextStyle(color: MyStyle().primary),
            labelText: 'User: ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primary)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().secondry)),
          ),
        ),
      );

  Widget passFrom() => Container(
        width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().primary,
            ),
            labelStyle: TextStyle(color: MyStyle().primary),
            labelText: 'Password: ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primary)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().secondry)),
          ),
        ),
      );
}
