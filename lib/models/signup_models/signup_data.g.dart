// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupData _$SignupDataFromJson(Map<String, dynamic> json) => SignupData(
      token: json['token'] as String? ?? '',
      type: json['type'] as String? ?? '',
      user: UserSign.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupDataToJson(SignupData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'type': instance.type,
      'token': instance.token,
    };
