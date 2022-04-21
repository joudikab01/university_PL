// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCategories _$DataCategoriesFromJson(Map<String, dynamic> json) =>
    DataCategories(
      categories: (json['key'] as List<dynamic>?)
              ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DataCategoriesToJson(DataCategories instance) =>
    <String, dynamic>{
      'key': instance.categories,
    };
