import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui' as ui show window;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wz_translation/Model/ResutlModel.dart';
import 'package:wz_translation/Widget/FavoriteButtonWidget.dart';
import 'wz_translation_model.dart';
import 'package:wz_translation/Model/wz_translation_model.dart';
import 'package:wz_translation/Http/ServiceImpl.dart';
import 'package:wz_translation/Model/ResutlModel.dart';
import 'package:wz_translation/Http/HttpUtils.dart';
import 'package:wz_translation/Http/api.dart';
import 'package:dio/dio.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:wz_translation/Model/ResultMapper.dart';

import 'package:wz_translation/Model/testModel.dart';

const SerializationOptions DEFAULT_SERIALIZE_OPTIONS = SerializationOptions(caseStyle: CaseStyle.Snake);


class wz_translation_page extends StatelessWidget {

  static final String assetsImgIssue = 'images/issue.png';
  static final String assetsImgNotice = 'images/notice.png';


   final List <Widget> tarList = [Tab(text: "第一个",),Tab(text: "第二个", ),Tab( text: "第三个",)];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tarList.length, // tab个数
      child: Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(
            title: Text("翻译"),
            leading: IconButton(
               padding: EdgeInsets.only(left: 20, right: 0 ,top: 0,bottom: 0),
                iconSize: 40,
              icon: getImage(assetsImgNotice),
              onPressed: (){
                print('issue');
              },
            ),
            actions : <Widget> [IconButton(
              padding: EdgeInsets.only(left: 0, right: 20 ,top: 0,bottom: 0),
              iconSize: 40,
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
              tabs: tarList ,
            )),

        body: TabBarView(
          // 类似ViewPage
          children: <Widget> [
            ListView(
              children: <Widget>[
                ListTile(title: Text("这是第1个 tab")),
              ],
            ),
            OnlyGridView(),
            ListView(
              children: <Widget>[
                ListTile(title: Text("这是第2个 tab")),
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
    );
  }
}

class OnlyGridView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OnlyGridViewState();
  }
}

/// 加载状态
enum LoadMoreStatue{
  //加载中
  STATUE_LOADING,
  //加载完成
  STATUE_COMPLETE,
  //空闲中
  STATUE_IDEL
}

class _OnlyGridViewState extends State<OnlyGridView> {

  //当前页面
  int curPageNum = 0;

  List<itemModelVo> contentList = <itemModelVo>[];

  LoadMoreStatue curLoadMoreStatue = LoadMoreStatue.STATUE_IDEL;

  ///加载更多页面对应的内容
  String loadMoreMsg = "";

  RefreshController _refreshController =  RefreshController(initialRefresh: false);

  final double wPadding = 15;

  @override
  void initState(){
    super.initState();
    reFreshData();
  }

  Widget buildCtn() {
    return GridView.builder(
      padding: EdgeInsets.only(left: wPadding, right: wPadding, top: wPadding, bottom: wPadding),
      physics: ClampingScrollPhysics(),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
        crossAxisSpacing: wPadding/2, //水平子Widget之间间距
        mainAxisSpacing: wPadding/2, //垂直子Widget之间间距
        childAspectRatio: 2 / 2.5, //子元素在横轴长度和主轴长度的比例
      ),

      itemBuilder: (c, i) =>
          Item(
            model: contentList[i],
            row: i,
          ),
      itemCount: contentList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      child: buildCtn(),
      header: ClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: reFreshData,
      onLoading: loadMoreData,
    );
  }
  void reFreshData() async {

    // Response responses = await HttpUtils.getInstance().get(API.getList(1),
    //     onSuccess: (responses){
    //       var json = jsonDecode(responses.toString());
    //       final  ResutlModel models = JsonMapper.deserialize<ResutlModel>(json);
    //       ResutlModelVo model =  resultToVo(models);
    //     },
    //     onFailure: (msg){
    //     },
    //     isNeedCache: true);

    setState(() {
      contentList.clear();
      print(contentList);
    });

    curPageNum =1 ;
    ResutlModelVo itemListByCid = await ServiceImpl.getInstance()
        .getItemListByCid(curPageNum, 0);

    if(mounted){
      setState(() {
        if (itemListByCid != null &&
            itemListByCid.data != null &&
            itemListByCid.data.datas != null) {
          contentList.clear();
          contentList.addAll(itemListByCid.data.datas);
        }
      });
    }

    _refreshController.refreshCompleted();
  }

  void loadMoreData() async{

    curPageNum ++ ;
    ResutlModelVo itemListByCid = await ServiceImpl.getInstance()
        .getItemListByCid(curPageNum, 0);
    if(mounted){
      setState(() {
        if (itemListByCid != null &&
            itemListByCid.data != null &&
            itemListByCid.data.datas != null &&
            itemListByCid.data.datas.length > 0) {

          curLoadMoreStatue = LoadMoreStatue.STATUE_IDEL;
          contentList.addAll(itemListByCid.data.datas);
        }else{
          loadMoreMsg = "已经到底了!!";
          curLoadMoreStatue = LoadMoreStatue.STATUE_COMPLETE;
        }
        _refreshController.loadComplete();
      });
    }
  }
}


class Item extends StatefulWidget {

  final String title;
  final itemModelVo model;
  final int  row;
  Item({this.title,this.model,this.row});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {

    final wMargin = 8.0;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return  Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white, // 背景色
        shadowColor: Colors.lightBlue, // 阴影颜色
        elevation: 5, // 阴影高度
        borderOnForeground: false, // 是否在 child 前绘制 border，默认为 true
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 设置圆角
          side: BorderSide(                        // 边框
            color: Colors.black12,
            width: 1,
          ),
        ),

        child: Column(


          children: <Widget>[
            Stack(
              /**
               * Stack中第一个widget为底部的内容，第二个为盖在上面的widget。所以这里的圆形图片CircleAvatar是底部，
               * 第二个Container为盖在上面的文字。那么分析2这里的alignment就是调整第二个widget位置的属性。
               * Alignment将第一个widget的中心当作（0，0）坐标。所以这里的（0.0，0.9）就是如图的位置。
               * */
              alignment: const Alignment(0.0, 0.9),

              children: <Widget>[
                   CachedNetworkImage(
                    imageUrl: widget.model.envelopePic,
                  //  placeholder: (context, url) => CircularProgressIndicator(),
                  //  errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                     width: width,
                     height: (width / 2 - 2 * wMargin - 25),

                  ),
                     Text(
                     widget.model.chapterName,
                     style: new TextStyle(
                    fontSize: 17.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                     ),
              ],
            ),
            Column(
                children: <Widget>[
                  Padding(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child:  Text(widget.model.superChapterName,
                              style: TextStyle(fontSize: 13,
                                color: Colors.grey,
                              ),
                              textAlign : TextAlign.left,
                            ),
                          ),
                        Container(
                      //    width: 40,
                          height: 35,
                          child: FavoriteButtonWidget(
                            isFavorite: widget.model.collect ?? false,
                            id : widget.model.id,row: widget.row,

                            onChanged: (e){
                              widget.model.collect = e;
                              print("==================================================");
                            },

                          ),
                        ),
                        ],
                      ),
                      padding: EdgeInsets.only(left: 10, right: 5),
                    ),
                  Padding(
                    child: Row(
                      children: <Widget>[
                        Text(widget.model.niceDate,
                          style: TextStyle(fontSize: 13,),
                          //textAlign : TextAlign.left,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(left: 10, right: 5,bottom: 5),
                  ),
                ],
            ),
           // SizedBox(height: 3),
          ],
        ),
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


class Screen {
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }
}

