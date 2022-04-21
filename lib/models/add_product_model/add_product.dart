import 'package:json_annotation/json_annotation.dart';
import '../models.dart';

part 'add_product.g.dart';

@JsonSerializable()
class AddProductModel {
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: 0)
  int price;
  @JsonKey(name: 'image_url', defaultValue: '')
  String image;
  @JsonKey(name: 'expired_date', defaultValue: '')
  String expireDate;
  @JsonKey(defaultValue: 0)
  int quantity;
  @JsonKey(name: 'category_id', defaultValue: 0)
  int categoryId;
  @JsonKey(name: 'list_discounts')
  List<Discount> discounts;

  AddProductModel({
    required this.price,
    required this.quantity,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.discounts,
    required this.expireDate,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddProductModelToJson(this);
}
