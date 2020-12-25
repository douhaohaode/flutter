
import 'package:flutter/material.dart';

class API {

  static String baseUrl = "https://www.wanandroid.com";

  //获取分页
   static String getList([int pageNum =0]){
     return "/project/list/$pageNum/json?cid=294";
   }
}
