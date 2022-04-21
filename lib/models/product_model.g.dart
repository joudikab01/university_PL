// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String? ?? '',
      image: json['image_url'] as String? ?? '',
      expireDate: json['expired_date'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
      ownerId: json['owner_id'] as int? ?? 0,
      contactNumber: json['whatsapp_url'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      facebookUrl: json['facebook_url'] as String? ?? '',
      countViews: json['count_views'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      commentsCount: json['comments_count'] as int? ?? 0,
      likesCount: json['likes_count'] as int? ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );

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
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'count_views': instance.countViews,
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'category': instance.category,
    };
