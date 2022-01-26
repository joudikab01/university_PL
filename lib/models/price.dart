import 'package:json_annotation/json_annotation.dart';
part 'price.g.dart';

@JsonSerializable()
class Price {
  late int price;
  @JsonKey(name: 'first_sale')
  late double firstSale;
  @JsonKey(name: 'second_sale')
  late double secondSale;
  @JsonKey(name: 'third_sale')
  late double thirdSale;
  Price(
      {required this.price,
      required this.firstSale,
      required this.secondSale,
      required this.thirdSale});
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
