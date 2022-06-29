import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_products.g.dart';

@JsonSerializable()
class UserProducts
{
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(name: 'email_verified_at', defaultValue: '')
  String emailVerifiedAt;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String phoneNumber;
  @JsonKey(name: 'facebook_url',defaultValue: '')
  String facebookUrl;
  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;
  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;
  @JsonKey(defaultValue: [])
  List <Products> products;
  @JsonKey(defaultValue: [])
  List <Comment> comments;
  @JsonKey(defaultValue: [])
  List <Like> likes;

  UserProducts({
    required this.products,
    required this.likes,
    required this.comments,
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
    required this.facebookUrl,
    required this.emailVerifiedAt
});

  factory UserProducts.fromJson(Map <String,dynamic> map) => _$UserProductsFromJson(map);
  Map <String,dynamic> toJson() => _$UserProductsToJson(this);


}