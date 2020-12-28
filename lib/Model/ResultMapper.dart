import 'package:wz_translation/Model/ResutlModel.dart';



ResutlModelVo resultToVo(ResutlModel model){
  return ResutlModelVo(modelToVo(model.data) , model.errorCode, model.errorMsg);
}


ListModelVo modelToVo(ListModel  model){
     return ListModelVo(
         model.curPage,
         model.offset,
         model.over,
         model.pageCount,
         model.size,
         model.total,
         model.datas.map((e) {
           return itemToVo(Map<String, dynamic>.from(e));
         }).toList(),
      );
}


itemModelVo itemToVo(Map model) {
  return itemModelVo(model['apkLink'], model['chapterId'], model['chapterName'],  model['collect']
      , model['envelopePic'], model['fresh'], model['id'], model['niceDate'], model['publishTime']
      , model['shareDate'], model['superChapterName'],model['title'] , model['type'], model['visible']);
  //, model['niceShareDate']
}