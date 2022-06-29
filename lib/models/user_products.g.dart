// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProducts _$UserProductsFromJson(Map<String, dynamic> json) => UserProducts(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      likes: (json['likes'] as List<dynamic>?)
              ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      facebookUrl: json['facebook_url'] as String? ?? '',
      emailVerifiedAt: json['email_verified_at'] as String? ?? '',
    );

Map<String, dynamic> _$UserProductsToJson(UserProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone_number': instance.phoneNumber,
      'facebook_url': instance.facebookUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'products': instance.products,
      'comments': instance.comments,
      'likes': instance.likes,
    };
