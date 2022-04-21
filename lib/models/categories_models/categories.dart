import 'package:json_annotation/json_annotation.dart';
import '../models.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(name: 'img_url', defaultValue: '')
  String imageUrl;
  @JsonKey(defaultValue: [])
  List<Products> products;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  Categories({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
