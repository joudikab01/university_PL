import 'package:json_annotation/json_annotation.dart';
part 'signup_with_google.g.dart';

@JsonSerializable()
class SignUpWithGoogle {
  bool status;
  int errNum;
  String message;
  SignUpWithGoogle({
    required this.message,
    required this.status,
    required this.errNum,
  });
  factory SignUpWithGoogle.fromJson(Map<String, dynamic> json) =>
      _$SignUpWithGoogleFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpWithGoogleToJson(this);
}
