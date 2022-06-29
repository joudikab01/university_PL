import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


@JsonSerializable()
@HiveType(typeId: 1)
class UserSign{
  @JsonKey(defaultValue: 0)
  @HiveField(0)
  int id;
  @JsonKey(defaultValue: '')
  @HiveField(1)
  String name;
  @JsonKey(defaultValue: '')
  @HiveField(2)
  String email;
  @JsonKey(name: 'phone_number', defaultValue: '')
  @HiveField(3)
  String phoneNumber;
  @JsonKey(name: 'facebook_url', defaultValue: '')
  @HiveField(4)
  String facebook;
  @JsonKey(name: 'created_at', defaultValue: '')
  @HiveField(5)
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  @HiveField(6)
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