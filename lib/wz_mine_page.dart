import 'package:flutter/material.dart';


class wz_mine_page extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // tab个数
      child: Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(

            title: Text("我的"),

            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorColor : Colors.black,
              labelColor : Colors.black,
              unselectedLabelColor : Colors.black38,
              unselectedLabelStyle: TextStyle(fontSize: 16), // 未选择样式
              labelStyle: TextStyle( fontSize: 19, height: 1.5, fontWeight: FontWeight.w600,), // 选择的样式
              tabs: <Widget>[
                Tab(
                  text: "第一个",
                ),
                Tab(
                  text: "第二个",
                ),
                Tab(
                  text: "第三个",
                ),
              ],
            )),

        body: TabBarView(
          // 类似ViewPage
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(title: Text("这是第1个 tab")),
                ListTile(title: Text("这是第1个 tab")),
                ListTile(title: Text("这是第1个 tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("这是第2个 tab")),
                ListTile(title: Text("这是第2个 tab")),
                ListTile(title: Text("这是第2个 tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("这是第3个 tab")),
                ListTile(title: Text("这是第3个 tab")),
                ListTile(title: Text("这是第3个 tab"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(String imagePath) {
    return new Image.asset(
      imagePath,
      width: 35,
      height: 35,
      // matchTextDirection: false,
      //fit: BoxFit.fitWidth,
    );

  }
}