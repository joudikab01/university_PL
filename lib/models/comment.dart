import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(name: 'owner_id', defaultValue: 0)
  int ownerId;
  @JsonKey(name: 'product_id', defaultValue: 0)
  int productId;
  @JsonKey(defaultValue: '')
  String value;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  Comment(
      {required this.productId,
      required this.id,
      required this.ownerId,
      required this.value,
      required this.createdAt,
      required this.updatedAt});
  factory Comment.fromJson(Map<String, dynamic> map) => _$CommentFromJson(map);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
