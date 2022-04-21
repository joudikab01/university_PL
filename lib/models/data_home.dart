import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';
part 'data_home.g.dart';

@JsonSerializable()
class DataHome{
  @JsonKey(name: 'key',defaultValue: [])
  List<Product> products;

  DataHome({required this.products});

  factory DataHome.fromJson(Map <String,dynamic> map) =>_$DataHomeFromJson(map);
  Map<String,dynamic> toJson() => _$DataHomeToJson(this);
}