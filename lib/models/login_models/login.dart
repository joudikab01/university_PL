import 'package:json_annotation/json_annotation.dart';
import '../models.dart';
part 'login.g.dart';
@JsonSerializable()
class Login {
  UserSign user;
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: 'error')
  String token;


  Login({
    required this.token, required this.type, required this.user
  });


  factory Login.fromJson(Map<String, dynamic> map) => _$LoginFromJson(map);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}