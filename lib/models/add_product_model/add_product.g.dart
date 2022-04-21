// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductModel _$AddProductModelFromJson(Map<String, dynamic> json) =>
    AddProductModel(
      price: json['price'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: json['image_url'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
      discounts: (json['list_discounts'] as List<dynamic>)
          .map((e) => Discount.fromJson(e as Map<String, dynamic>))
          .toList(),
      expireDate: json['expired_date'] as String? ?? '',
    );

Map<String, dynamic> _$AddProductModelToJson(AddProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.image,
      'expired_date': instance.expireDate,
      'quantity': instance.quantity,
      'category_id': instance.categoryId,
      'list_discounts': instance.discounts,
    };
