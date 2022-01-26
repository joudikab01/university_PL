import 'models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class Product {
  late int id;
  late String name;
  late int price;
  @JsonKey(name: 'image_url')
  late String image;
  @JsonKey(name: 'facebook_url')
  late String facebookUrl;
  @JsonKey(name: 'whatsapp_url')
  late int contactNumber;
  @JsonKey(name: 'expired_date')
  late String expireDate;
  late int quantity;
  @JsonKey(name: 'owner_id')
  late int ownerId;
  @JsonKey(name: 'category_id')
  late Category categoryId;
  @JsonKey(name: 'count_views')
  late int countViews;
  Product(
      {required this.name,
      required this.image,
      required this.expireDate,
      required this.categoryId,
      required this.ownerId,
      required this.contactNumber,
      required this.quantity,
      required this.price,
      required this.facebookUrl,
      required this.countViews});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
