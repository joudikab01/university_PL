// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      price: json['price'] as int,
      firstSale: (json['first_sale'] as num).toDouble(),
      secondSale: (json['second_sale'] as num).toDouble(),
      thirdSale: (json['third_sale'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'price': instance.price,
      'first_sale': instance.firstSale,
      'second_sale': instance.secondSale,
      'third_sale': instance.thirdSale,
    };
