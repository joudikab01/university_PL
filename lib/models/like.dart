import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'like.g.dart';

@JsonSerializable()
class Like {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(name: 'product_id', defaultValue: 0)
  int productId;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  Like({
    required this.id,
    required this.productId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Like.fromJson(Map<String, dynamic> map) => _$LikeFromJson(map);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
