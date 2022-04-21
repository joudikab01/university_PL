import 'package:json_annotation/json_annotation.dart';
import '../models.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: 0)
  int price;
  @JsonKey(name: 'image_url',defaultValue: '')
  String image;
  @JsonKey(name: 'facebook_url',defaultValue: '')
  String facebookUrl;
  @JsonKey(name: 'whatsapp_url',defaultValue: '')
  String contactNumber;
  @JsonKey(name: 'expired_date',defaultValue: '')
  String expireDate;
  @JsonKey(defaultValue: 0)
  int quantity;
  @JsonKey(name: 'owner_id',defaultValue: 0)
  int ownerId;
  @JsonKey(name: 'category_id',defaultValue: 0)
  int categoryId;
  @JsonKey(name: 'count_views',defaultValue: 0)
  int countViews;
  @JsonKey(name: 'comments_count',defaultValue: 0)
  int commentsCount;
  @JsonKey(name: 'likes_count',defaultValue: 0)
  int likesCount;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  Products(
      {required this.ownerId,
      required this.id,
      required this.name,
      required this.commentsCount,
      required this.categoryId,
      required this.contactNumber,
      required this.countViews,
      required this.expireDate,
      required this.facebookUrl,
      required this.image,
      required this.price,
      required this.quantity,
      required this.likesCount,
      required this.updatedAt,
      required this.createdAt});

  factory Products.fromJson(Map<String, dynamic> map) =>
      _$ProductsFromJson(map);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
