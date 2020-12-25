import 'package:flutter/material.dart';
import 'package:wz_translation/Modules/modeldemo.dart';



///收藏按钮组件
class FavoriteButtonWidget extends StatefulWidget {
  ///是否收藏了
  final bool isFavorite;
  ///id标记
  final int id;

  const FavoriteButtonWidget( {
    Key key, this.isFavorite = false, this.id,
  }) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}


class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {

  bool curIsFavorite ;

  @override
  void initState() {
    super.initState();

    curIsFavorite = widget.isFavorite;
  }


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(curIsFavorite ? Icons.favorite : Icons.favorite_border,color: Theme.of(context).primaryColor == Colors.white
          ? Colors.black
          : Theme.of(context).primaryColor,),
       //   padding : EdgeInsets.all(16.16),
      onPressed: (){
        //点击收藏的事件
        if(curIsFavorite){
          //将此收藏移除
          // HttpUtils.getInstance().post(API.getUnCollectOriginId(widget.id),
          //     onSuccess: (responses){
          //       Map<String,dynamic> map = jsonDecode(responses.toString());
          //       if(0 == map['errorCode']){
          //         Toast.show("取消收藏成功", context);
                  setState(() {
                    curIsFavorite = !curIsFavorite;
                  });
          //       }else{
          //         Toast.show(map['errorMsg'] ?? "取消收藏失败", context);
          //       }
          //     },
          //     onFailure: (msg){
          //       Toast.show(msg, context);
          //     });
        }else{
          //添加收藏
          // HttpUtils.getInstance().post(API.getCollectArticleById(widget.id),
          //     onSuccess: (responses){
          //       Map<String,dynamic> map = jsonDecode(responses.toString());
          //       if(0 == map['errorCode']){
          //         Toast.show("收藏成功", context);
                  setState(() {
                    curIsFavorite = !curIsFavorite;
                  });
          //       }else if(-1001 == map['errorCode']){
          //         //需要登录
          //         RouteHelpUtils.push(context, LoginPage());
          //
          //       }else{
          //         Toast.show(map['errorMsg'] ?? "收藏失败", context);
          //       }
          //     },
          //     onFailure: (msg){
          //       Toast.show(msg, context);
          //     });
        }

      },
    );

  }

}