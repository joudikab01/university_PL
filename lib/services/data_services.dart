import 'dart:async';
import '../models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'data_services.g.dart';

@RestApi(baseUrl: '')
abstract class DataService {
  factory DataService(Dio dio, {String? baseUrl}) {
    return _DataService(dio, baseUrl: baseUrl);
  }
  @POST('signUp')
  Future<void> signUp(@Body() FormData formData);
  @GET('getAllProducts')
  Future<Product> getProducts();
}
