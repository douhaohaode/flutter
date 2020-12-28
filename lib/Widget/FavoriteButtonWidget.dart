import 'package:flutter/material.dart';
import 'package:wz_translation/Modules/modeldemo.dart';



///收藏按钮组件
class FavoriteButtonWidget extends StatefulWidget {
  ///是否收藏了
  final bool isFavorite;
  ///id标记
  final int id;
  final  int row;
  final ValueChanged<bool> onChanged;


  const FavoriteButtonWidget( {
    Key key, this.isFavorite = false, this.id ,this.row,this.onChanged
  }) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}


class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {

  bool curIsFavorite ;

  ValueChanged<bool> Changed;

  int row ;

  @override
    void initState() {
    super.initState();

    curIsFavorite = widget.isFavorite;
    row = widget.row;
    Changed = widget.onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
          curIsFavorite ? Icons.favorite : Icons.favorite_border,
          color: curIsFavorite ? Colors.red : null,),
      onPressed: (){

        setState(() {
          curIsFavorite = !curIsFavorite;
          Changed(curIsFavorite);

          // if(curIsFavorite){
          //发送收藏网络请求
          // }else{
          // 发送取消网络请求
          //   }
           });
       },
    );

  }

}