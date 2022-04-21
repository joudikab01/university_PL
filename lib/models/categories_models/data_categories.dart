import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import '../models.dart';

part 'data_categories.g.dart';

@JsonSerializable()
class DataCategories{
  @JsonKey(name: 'key',defaultValue: [])
  List <Categories> categories;

  DataCategories({required this.categories});

  factory DataCategories.fromJson(Map <String,dynamic> map) =>_$DataCategoriesFromJson(map);
  Map<String,dynamic> toJson() => _$DataCategoriesToJson(this);
}