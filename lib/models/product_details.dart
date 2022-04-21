import 'models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: 0)
  int price;
  @JsonKey(name: 'image_url', defaultValue: '')
  String image;
  @JsonKey(name: 'facebook_url', defaultValue: '')
  String facebookUrl;
  @JsonKey(name: 'whatsapp_url', defaultValue: '')
  String contactNumber;
  @JsonKey(name: 'expired_date', defaultValue: '')
  String expireDate;
  @JsonKey(defaultValue: 0)
  int quantity;
  @JsonKey(name: 'owner_id', defaultValue: 0)
  int ownerId;
  @JsonKey(name: 'category_id', defaultValue: 0)
  int categoryId;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;
  @JsonKey(name: 'count_views', defaultValue: 0)
  int countViews;
  @JsonKey(name: 'comments_count', defaultValue: 0)
  int commentsCount;
  @JsonKey(name: 'likes_count', defaultValue: 0)
  int likesCount;
  @JsonKey(name: 'new_price')
  double newPrice;
  Category category;
  User user;
  List<Like> likes;
  List<Comment> comments;
  bool? isFav=false;

  ProductDetails(
      {required this.name,
      required this.image,
      required this.expireDate,
      required this.categoryId,
      required this.ownerId,
      required this.contactNumber,
      required this.quantity,
      required this.price,
      required this.facebookUrl,
      required this.countViews,
      required this.id,
      required this.category,
      required this.commentsCount,
      required this.likesCount,
      required this.updatedAt,
      required this.createdAt,
      required this.comments,
      required this.likes,
      required this.newPrice,
      required this.user,this.isFav});

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}
