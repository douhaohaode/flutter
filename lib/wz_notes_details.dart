import 'package:flutter/material.dart';
import 'package:get/get.dart';

class wz_notes_details extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(title: Text("这是第1个 tab")),
            ListTile(title: Text("这是第1个 tab")),
            ListTile(title: Text("这是第1个 tab"))
          ],
        ),
    );
  }
}
