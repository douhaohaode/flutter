import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  static final String assetsImgIssue = 'images/issue.png';
  static final String assetsImgNotice = 'images/notice.png';


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // tab个数
      child: Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(
            title: Text("TabBarDemo"),
            leading: IconButton(
                // padding: EdgeInsets.all(8),
                icon: getImage(assetsImgNotice),
                 onPressed: (){
                    print('issue');
                 },
               ),
            actions : <Widget> [ IconButton(
              icon: getImage(assetsImgIssue),
              onPressed: (){
                  print('notice');
               },
            ),
            ],
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
        bottomNavigationBar: BottomNavigationBar(
               currentIndex: 1,
               iconSize: 30.0,
               type:  BottomNavigationBarType.fixed,
               onTap: (index){
               },
              items: [
                   BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                     title: Text('首页'),
                    ),
                    BottomNavigationBarItem(
                     icon: Icon(Icons.category),
                      title: Text('分类'),
                   ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      title: Text('设置'),
                   ),
                     BottomNavigationBarItem(
                       icon: Icon(Icons.person_rounded),
                        title: Text('个人中心'),
                     ),
                 ],
          ),

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


 //  @override
// Widget build(BuildContext context) {
  //   return  DefaultTabController(
  //       length :3,
  //       child : Scaffold(
  //         appBar: AppBar(
  //           title: Text('水果', style: Theme.of(context).textTheme.headline6),
  //           //title: Text("水果"),
  //           backgroundColor: Colors.white,
  //           centerTitle: true,
  //           leading: IconButton(
  //            // padding: EdgeInsets.all(8),
  //             icon: getImage(assetsImgNotice),
  //             onPressed: (){
  //                print('issue');
  //             },
  //           ),
  //           actions : <Widget> [ IconButton(
  //             icon: getImage(assetsImgIssue),
  //             onPressed: (){
  //                 print('notice');
  //              },
  //           ),
  //           ],
  //           bottom: TabBar(
  //             tabs: <Widget>[
  //               Tab(
  //                 text : "预览1"
  //               ),
  //               Tab(
  //                   text :"预览2"
  //               ),
  //               Tab(
  //                   text :"预览3"
  //               ),
  //
  //             ],
  //
  //           ),
  //
  //         ),
  //   ),
  //   );
  // }
  //
  // Widget getImage(String imagePath) {
  //   return new Image.asset(
  //       imagePath,
  //       width: 35,
  //       height: 35,
  //    // matchTextDirection: false,
  //     //fit: BoxFit.fitWidth,
  //   );
  //
  // }
//}


//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: Get.height * .45,
//             decoration: BoxDecoration(
//               color: Color(0xFFF5CEB8),
//             ),
//             child: Row(
//               children: [
//                 FlutterLogo(
//                   size: 100,
//                 ),
//                 SizedBox(
//                   width: 50,
//                 ),
//                 Text('GETX', style: Theme.of(context).textTheme.headline2),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: Get.height * .35, left: 20, right: 20),
//             child: GridView.count(
//               crossAxisCount: 2,
//               physics: NeverScrollableScrollPhysics(),
//               childAspectRatio: .95,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//               children: <Widget>[
//                 Card(
//                   title: '路由',
//                   icon: Icons.router,
//                   onTap: () {
//                     print("点击了路由'");
//                     Get.toNamed(Routes.NAV);
//                   },
//                 ),
//                 Card(
//                   title: 'State Manager',
//                   icon: Icons.stairs,
//                   onTap: () {
//                     Get.to(StatePage());
//                   },
//                 ),
//                 Card(
//                   title: '依赖注入',
//                   icon: Icons.inbox_outlined,
//                   onTap: () {
//                     Get.to(InjectSimplePage(), binding: InjectSimpleBinding());
//                   },
//                 ),
//                 Card(
//                   title: '国际化',
//                   icon: Icons.language,
//                   onTap: () {
//                     Get.to(LocalPage());
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Card extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final GestureTapCallback onTap;
//   const Card({
//     Key key,
//     @required this.title,
//     @required this.icon,
//     @required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(13),
//         ),
//         child: Column(
//           children: [
//             Spacer(),
//             Icon(
//               icon,
//               size: 80,
//               color: Colors.amber,
//             ),
//             Spacer(),
//             SizedBox(height: 20),
//             Text(title, style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15)),
//           ],
//         ),
//       ),
//     );
//   }
// }
