import 'package:json_annotation/json_annotation.dart';
part 'user_login.g.dart';

@JsonSerializable()
class UserLogin {
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

  UserLogin(
      {required this.id,
      required this.email,
      required this.name,
      required this.phoneNumber,
      required this.createdAt,
      required this.updatedAt,
      required this.facebook});

  factory UserLogin.fromJson(Map<String, dynamic> map) =>
      _$UserLoginFromJson(map);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
