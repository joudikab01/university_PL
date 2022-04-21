import 'package:json_annotation/json_annotation.dart';
part 'edit_product_request.g.dart';

@JsonSerializable()
class EditProductRequest
{
  @JsonKey( defaultValue: '' )
  String name;
  @JsonKey(defaultValue: 0 )
  int price;
  @JsonKey(name: 'image_url', defaultValue: '' )
  String imageUrl;
  @JsonKey( defaultValue: 0 )
  int quantity;
  @JsonKey(name: 'category_id', defaultValue: 0 )
  int categoryId;
  @JsonKey(name: '_method', defaultValue: '')
  String method;
  EditProductRequest({
    required this.name,
    required this.price,
    required this.quantity,
    required this.categoryId,
    required this.imageUrl,
    required this.method
  });
  factory EditProductRequest.fromJson(Map <String,dynamic> map)=> _$EditProductRequestFromJson(map);
  Map <String,dynamic> toJson() => _$EditProductRequestToJson(this);
}