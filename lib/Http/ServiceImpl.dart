
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:wz_translation/Http/HttpUtils.dart';
import 'package:wz_translation/Http/api.dart';
import 'package:wz_translation/Model/wz_translation_model.dart';
class ServiceImpl{
  static ServiceImpl _instance;

  static ServiceImpl getInstance() {
    if (_instance == null) _instance = ServiceImpl();
    return _instance;
 }

  /// 获取体系数据
  // getItemTree() async{
  //
  //   Response responses = await HttpUtils.getInstance().get(API.itemTree,
  //       onSuccess: (responses){
  //
  //       },
  //       onFailure: (msg){
  //
  //       },
  //       isNeedCache: true);
  //
  //   ItemTreeEntity itemTreeEntity = ItemTreeEntity().fromJson(jsonDecode(responses.toString()));
  //   return itemTreeEntity;
  //
  // }

  /// 获取知识体系下的文章
  ///
  /// 页码：拼接在链接上，从0开始。
  ///
  /// cid 分类的id，上述二级目录的id
  ///
  getItemListByCid(int pageNum , int cid) async{

    Response responses = await HttpUtils.getInstance().get(API.getList(pageNum),
        onSuccess: (responses){

        },
        onFailure: (msg){

        },
        isNeedCache: true);
    ItemListEntity itemListEntity = ItemListEntity().fromJson(jsonDecode(responses.toString()));
    return itemListEntity;
  }



}