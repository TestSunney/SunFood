import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:sunfood/utility/my_style.dart';
import 'package:sunfood/utility/normal_dialog.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent[100]),
        child: ListView(
          
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            myLogo(),
            MyStyle().mySizeBox(),
            showAppName(),
            MyStyle().mySizeBox(),
            nameForm(),
            MyStyle().mySizeBox(),
            userForm(),
            MyStyle().mySizeBox(),
            passForm(),
            MyStyle().mySizeBox(),
            MyStyle().showTitle('Type'),
            MyStyle().mySizeBox(),
            userRadio(),
            ownerRadio(),
            riderRadio(),
            registerBtn(),
          ],
        ),
      ),
    );
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'User who is gonna order',
                  style: TextStyle(color: MyStyle().primary),
                )
              ],
            ),
          ),
        ],
      );

  Widget ownerRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'shop',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'Rest owner',
                  style: TextStyle(color: MyStyle().primary),
                )
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'rider',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'devidery//rider',
                  style: TextStyle(color: MyStyle().primary),
                )
              ],
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('Sunney Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.face,
                  color: MyStyle().primary,
                ),
                labelStyle: TextStyle(color: MyStyle().primary),
                labelText: 'Your name:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primary)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().secondry)),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: MyStyle().primary,
                ),
                labelStyle: TextStyle(color: MyStyle().primary),
                labelText: 'Account name:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primary)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().secondry)),
              ),
            ),
          ),
        ],
      );

  Widget passForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) =>
                  password = value.trim(), //For take valur from text field
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: MyStyle().primary,
                ),
                labelStyle: TextStyle(color: MyStyle().primary),
                labelText: 'Password:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primary)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().secondry)),
              ),
            ),
          ),
        ],
      );

  //End user reg from

  Widget registerBtn() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().primary,
          onPressed: () {
            print(
                'name =$name, user =$user, password =$password, chooseType = $chooseType');
            if (name == null ||
                name.isEmpty ||
                user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('have space');
              normalDialog(context, 'Emypt');
            } else if (chooseType == null) {
              normalDialog(context, 'Choose type');
            } else {
              checkUser(); //If user put all box, go to checkUser
              //registerThread();
            }
          },
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkUser() async {
    String url =
        'http://192.168.56.1/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        registerThread(); 
        //Mean chack with Database, and it's not duplicate name, that's why is null
        //if null go to registerThread=> to regis
        //according to php
      } else {
        normalDialog(context, "This user: \"$user\" is taken,change new one");// Not null
      }
    } catch (e) {}
  }
  //Ep8

  Future<Null> registerThread() async {
    //regisection
    String url =
        'http://192.168.56.1/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';
    try {
      Response response = await Dio().get(url);
      print('res =$response');
      if (response.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, "Can not connet to server// can't reg");
      }
    } catch (e) {}
  }
} // at ep5
