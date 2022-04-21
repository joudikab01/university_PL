// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSign _$UserSignFromJson(Map<String, dynamic> json) => UserSign(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      facebook: json['facebook_url'] as String? ?? '',
    );

Map<String, dynamic> _$UserSignToJson(UserSign instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'facebook_url': instance.facebook,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
