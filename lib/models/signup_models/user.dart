import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class UserSign{
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String phoneNumber;
  @JsonKey(name: 'facebook_url', defaultValue: '')
  String facebook;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  UserSign({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.facebook

  });

  factory UserSign.fromJson(Map<String, dynamic> map) => _$UserSignFromJson(map);

  Map<String, dynamic> toJson() => _$UserSignToJson(this);
}