// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProductRequest _$EditProductRequestFromJson(Map<String, dynamic> json) =>
    EditProductRequest(
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      categoryId: json['category_id'] as int? ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
      method: json['_method'] as String? ?? '',
    );

Map<String, dynamic> _$EditProductRequestToJson(EditProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'quantity': instance.quantity,
      'category_id': instance.categoryId,
      '_method': instance.method,
    };
