// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHome _$DataHomeFromJson(Map<String, dynamic> json) => DataHome(
      products: (json['key'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DataHomeToJson(DataHome instance) => <String, dynamic>{
      'key': instance.products,
    };
