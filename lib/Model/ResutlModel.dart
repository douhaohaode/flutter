
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable, JsonProperty;

class ResutlModelVo{

  ListModelVo data;
  int errorCode;
  String errorMsg;

  ResutlModelVo(
       this.data,
       this.errorCode,
       this.errorMsg,
    );
}


@jsonSerializable
class ResutlModel  {

  @JsonProperty(name: "data")
  ListModel data;

  @JsonProperty(name: "errorCode")
  int errorCode;

  @JsonProperty(name: "errorMsg")
  String errorMsg;

  }


  class ListModelVo{

    int curPage;
    int offset;
    bool over;
    int pageCount;
    int size;
    int total;
    List<itemModelVo> datas;

    ListModelVo(
    this.curPage,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
        this.datas
     );
  }


@jsonSerializable
class ListModel  {

  @JsonProperty(name: "curPage")
  int curPage;

  @JsonProperty(name: "offset")
  int offset;

  @JsonProperty(name: "over")
  bool over;

  @JsonProperty(name: "pageCount")
  int pageCount;

  @JsonProperty(name: "size")
  int size;

  @JsonProperty(name: "total")
  int total;


  @JsonProperty(name: "datas")
  List<dynamic>  datas;

}


class itemModelVo {

  String apkLink;
  int chapterId;
  String chapterName;
  bool collect;
  String envelopePic;
  bool fresh;
  int id;
  String niceDate;
  int publishTime;
  int shareDate;
  String superChapterName;
  String title;
  int type;
  int visible;

  itemModelVo(
    this.apkLink,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.envelopePic,
    this.fresh,
    this.id,
    this.niceDate,
    this.publishTime,
    this.shareDate,
    this.superChapterName,
    this.title,
    this.type,
    this.visible,
    );
}


@jsonSerializable
class itemModel {

  @JsonProperty(name: "apkLink")
  String apkLink;

  @JsonProperty(name: "chapterId")
  int chapterId;

  @JsonProperty(name: "chapterName")
  String chapterName;

  @JsonProperty(name: "collect")
  bool collect;

  @JsonProperty(name: "envelopePic")
  String envelopePic;

  @JsonProperty(name: "fresh")
  bool fresh;

  @JsonProperty(name: "id")
  int id;

  @JsonProperty(name: "niceDate")
  String niceDate;

  @JsonProperty(name: "publishTime")
  int publishTime;

  @JsonProperty(name: "shareDate")
  int shareDate;

  @JsonProperty(name: "superChapterName")
  String superChapterName;

  @JsonProperty(name: "title")
  String title;

  @JsonProperty(name: "type")
  int type;

  @JsonProperty(name: "visible")
  int visible;

}