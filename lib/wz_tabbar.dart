
import 'package:flutter/material.dart';
import 'package:wz_translation/wz_translation_page.dart';
import 'package:wz_translation/wz_course_page.dart';
import 'package:wz_translation/wz_notes_page.dart';
import 'package:wz_translation/wz_mine_page.dart';


class wz_tabbar extends StatefulWidget {


  wz_tabbar({Key key}) : super(key: key);

  _wz_tabbar createState() => _wz_tabbar();

}

class _wz_tabbar extends State<wz_tabbar> {

    int cureentIndex = 0;

    final  List listTabs = [wz_translation_page() , wz_notes_page() , wz_course_page() , wz_mine_page() ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: this.listTabs[this.cureentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this.cureentIndex = index;
          });
        },
        currentIndex: this.cureentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.language_sharp),label :'翻译', ),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: '笔记',),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard_outlined),label: '学习',),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'我的',),
        ],
      ),
    );
  }
}