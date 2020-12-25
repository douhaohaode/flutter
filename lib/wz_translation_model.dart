import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class TranslationList{
     List <TranslationModle> lines;
}

@jsonSerializable
class TranslationModle{

     String  date;
     String title;
     String imageUrl;
     bool   isFavorites;

}
