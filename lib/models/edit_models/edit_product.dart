import 'package:json_annotation/json_annotation.dart';
part 'edit_product.g.dart';

@JsonSerializable()
class EditProduct
{
  @JsonKey( defaultValue: 0 )
  int id;
  @JsonKey( defaultValue: '' )
  String name;
  @JsonKey( defaultValue: 0 )
  int price;
  @JsonKey(name: 'image_url', defaultValue: '' )
  String imageUrl;
  @JsonKey(name: 'expired_date', defaultValue: '')
  String expiredDate;
  @JsonKey( defaultValue: 0 )
  int quantity;
  @JsonKey(name: 'owner_id', defaultValue: 0 )
  int ownerId;
  @JsonKey(name: 'category_id', defaultValue: 0 )
  int categoryId;
  @JsonKey(name: 'count_views', defaultValue: 0 )
  int countViews;
  @JsonKey(name: 'created_at', defaultValue: '' )
  String createdAt;
  @JsonKey(name: 'updated_a', defaultValue: '' )
  String updatedAt;
  @JsonKey(name: 'comments_count', defaultValue: 0 )
  int commentsCount;
  @JsonKey(name: 'likes_count', defaultValue: 0 )
  int likesCount;
  EditProduct({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.price,
    required this.likesCount,
    required this.quantity,
    required this .countViews,
    required this.categoryId,
    required this.commentsCount,
    required this.imageUrl,
    required this.createdAt,
    required this.expiredDate,
    required this.updatedAt
});
  factory EditProduct.fromJson(Map <String,dynamic> map)=> _$EditProductFromJson(map);
  Map <String,dynamic> toJson() => _$EditProductToJson(this);
}