import 'package:json_annotation/json_annotation.dart';

part 'discount.g.dart';

@JsonSerializable()
class Discount{
  String date;
  @JsonKey(name: 'd_v')
  int dv;

  Discount({required this.date , required this.dv});

  factory Discount.fromJson(Map <String,dynamic> json) => _$DiscountFromJson(json);
  Map <String,dynamic> toJson() => _$DiscountToJson(this);
}