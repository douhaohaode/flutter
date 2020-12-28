
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UnmappedProperties {

  String name;

  Map<String, dynamic> _extraPropsMap = {};

  @jsonProperty
  void unmappedSet(String name, dynamic value) {
    _extraPropsMap[name] = value;
  }

  @jsonProperty
  Map<String, dynamic> unmappedGet() {
    return _extraPropsMap;
  }
}


@jsonSerializable
class testModle{
 // final json = '''{"name":"Bob","extra1":1,"extra2":"xxx"}''';

  @JsonProperty(name:"name")
  String name;

  @JsonProperty(name:"extra1")
  int extra1;

  @JsonProperty(name:"extra2")
  String extra2;

}


@jsonSerializable
class AllPrivateFields {
  String _name;
  String _lastName;

  set name(dynamic value) {
    _name = value;
  }

  String get name => _name;

  @JsonProperty(name: 'lastName')
  void setLastName(dynamic value) {
    _lastName = value;
  }

  @JsonProperty(name: 'lastName')
  String getLastName() => _lastName;
}

