import 'package:json_annotation/json_annotation.dart';
import '../models/product.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(name: 'image_url', defaultValue: '')
  String imageUrl;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  Category({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
