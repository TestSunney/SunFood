import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sunfood/model/user_model.dart';
import 'package:sunfood/screen/Main_shop.dart';
import 'package:sunfood/screen/main_rider.dart';
import 'package:sunfood/screen/main_user.dart';
import 'package:sunfood/utility/my_style.dart';
import 'package:sunfood/utility/normal_dialog.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Field
  String user, password;

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
          onPressed: () {
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context,
                  'have empty inpt box, put something'); //Well check if inp is emptr or not
            } else {
              checkAuthen();
            }
          },
          child: Text(
            'Log in',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkAuthen() async {
    String url =
        'http://192.168.56.1/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      var result = json.decode(response.data); //decode for json thai laungus
      print('resulr =$result');

      for (var map in result) {
        //for use result is array
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String chooseType = userModel.chooseType;
          if (chooseType == 'User') {
            routeToService(MainUser());
          } else if (chooseType == 'Shop') {
            routeToService(MainShop());
          } else if (chooseType == 'Rider') {
            routeToService(MainRider());
          } else {
            normalDialog(context, "Erroe");
          }
        } else {
          normalDialog(context, 'Worng password');
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

  Widget userFrom() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
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
          onChanged: (value) => password = value.trim(),
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
