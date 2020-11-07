import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunfood/utility/my_style.dart';

class AddInfoShop extends StatefulWidget {
  AddInfoShop({Key key}) : super(key: key);

  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add info shop"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyStyle().mySizeBox(),
            nameFrom(),
            MyStyle().mySizeBox(),
            addressFrom(),
            MyStyle().mySizeBox(),
            phoneFrom(),
            MyStyle().mySizeBox(),
            groupImage(),
            MyStyle().mySizeBox(),
            showMap(),
            MyStyle().mySizeBox(),
            saveBtn()
          ],
        ),
      ),
    );
  }

  Widget saveBtn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        color: MyStyle().primary,
        onPressed: () {},
        icon: Icon(Icons.save, color: Colors.white,),
        label: Text('Save Inforation',style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(13.611503, 100.840156);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);

    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  Row groupImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add_a_photo,
                size: 40,
              ),
              onPressed: () {}),
          Container(
            width: 250.0,
            child: Image.asset('images/myimage.png'),
          ),
          IconButton(
              icon: Icon(
                Icons.add_photo_alternate,
                size: 40,
              ),
              onPressed: () {})
        ],
      );

  Widget nameFrom() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Shop name:',
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget addressFrom() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'address:',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
  Widget phoneFrom() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone:',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}
