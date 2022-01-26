// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      image: json['image_url'] as String,
      expireDate: json['expired_date'] as String,
      categoryId:
          Category.fromJson(json['category_id'] as Map<String, dynamic>),
      ownerId: json['owner_id'] as int,
      contactNumber: json['whatsapp_url'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      facebookUrl: json['facebook_url'] as String,
      countViews: json['count_views'] as int,
    )..id = json['id'] as int;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.image,
      'facebook_url': instance.facebookUrl,
      'whatsapp_url': instance.contactNumber,
      'expired_date': instance.expireDate,
      'quantity': instance.quantity,
      'owner_id': instance.ownerId,
      'category_id': instance.categoryId,
      'count_views': instance.countViews,
    };
