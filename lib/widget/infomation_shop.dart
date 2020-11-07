import 'package:flutter/material.dart';
import 'package:sunfood/screen/add_info_shop.dart';
import 'package:sunfood/utility/my_style.dart';

class InfomationShop extends StatefulWidget {
  InfomationShop({Key key}) : super(key: key);

  @override
  _InfomationShopState createState() => _InfomationShopState();
}

class _InfomationShopState extends State<InfomationShop> {
  void routeToAddInfo() {
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyStyle().titleCenter(context, 'No informaton yet, pull something'),
        addAndEditBtn()
      ],
    );
  }

  Row addAndEditBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16, bottom: 16),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => routeToAddInfo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
