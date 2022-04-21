import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(name: 'email_verified_at', defaultValue: '')
  String emailVerifiedAt;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String phoneNumber;
  @JsonKey(name: 'facebook_url',defaultValue: '')
  String facebookUrl;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.facebookUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
