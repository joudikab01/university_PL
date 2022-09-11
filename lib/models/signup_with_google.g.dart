// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_with_google.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpWithGoogle _$SignUpWithGoogleFromJson(Map<String, dynamic> json) =>
    SignUpWithGoogle(
      message: json['message'] as String,
      status: json['status'] as bool,
      errNum: json['errNum'] as int,
    );

Map<String, dynamic> _$SignUpWithGoogleToJson(SignUpWithGoogle instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'message': instance.message,
    };
