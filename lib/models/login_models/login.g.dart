// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      token: json['token'] as String? ?? 'error',
      type: json['type'] as String? ?? '',
      user: UserSign.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'user': instance.user,
      'type': instance.type,
      'token': instance.token,
    };
