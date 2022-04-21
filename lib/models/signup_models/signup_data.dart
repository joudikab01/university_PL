import 'package:json_annotation/json_annotation.dart';
import '../models.dart';
part 'signup_data.g.dart';
@JsonSerializable()
class SignupData {
  UserSign user;
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: '')
  String token;


  SignupData({
    required this.token, required this.type, required this.user
  });


  factory SignupData.fromJson(Map<String, dynamic> map) => _$SignupDataFromJson(map);

  Map<String, dynamic> toJson() => _$SignupDataToJson(this);
}