import 'package:flutter/material.dart';
import 'package:sunfood/utility/my_style.dart';
Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('OK',style: TextStyle(color: MyStyle().primary),),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
} // when pop up is showing, program will stop untill user clost pop up
