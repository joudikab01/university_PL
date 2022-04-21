// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProduct _$EditProductFromJson(Map<String, dynamic> json) => EditProduct(
      id: json['id'] as int? ?? 0,
      ownerId: json['owner_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      likesCount: json['likes_count'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      countViews: json['count_views'] as int? ?? 0,
      categoryId: json['category_id'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      expiredDate: json['expired_date'] as String? ?? '',
      updatedAt: json['updated_a'] as String? ?? '',
    );

Map<String, dynamic> _$EditProductToJson(EditProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'expired_date': instance.expiredDate,
      'quantity': instance.quantity,
      'owner_id': instance.ownerId,
      'category_id': instance.categoryId,
      'count_views': instance.countViews,
      'created_at': instance.createdAt,
      'updated_a': instance.updatedAt,
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
    };
