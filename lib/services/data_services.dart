import 'dart:async';
import '../models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'data_services.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/api')
abstract class DataService {
  factory DataService(Dio dio, {String? baseUrl}) {
    return _DataService(dio, baseUrl: baseUrl);
  }

  @POST('/products/index')
  Future<DataHome> getData();

  @GET('/products/{id}')
  Future<ProductDetails> getProductDetails(@Path("id") String id);

  @GET('/categories')
  Future<DataCategories> getAllCategories();

  @POST('/auth/signup')
  Future<SignupData> signUp(@Body() FormData formData);

  @POST('/auth/login')
  Future<Login> logIn(@Body() FormData formData);

  @POST('/products/')
  Future<void> addProduct(
      @Header("Authorization") String token, @Body() Map<String, dynamic> data);

  @POST('/products/index')
  Future<DataHome> search(@Body() FormData formData);

  @POST('/products/index')
  Future<DataHome> sort(@Body() FormData formData);

  @DELETE('/products/{id}')
  Future<void> deleteProduct(
      @Header("Authorization") String token, @Path("id") int id);

  @POST('/products/{id}')
  Future<EditProduct> editProduct(@Header("Authorization") String token,
      @Path("id") int id, @Body() FormData formData);

  @POST('/comments')
  Future<void> addComment(
      @Header("Authorization") String token, @Body() FormData formData);

  @POST('/like')
  Future<void> addLike(
      @Header("Authorization") String token, @Body() FormData formData);

  @DELETE('/like/{id}')
  Future<void> removeLike(
      @Header("Authorization") String token, @Path("id") int id);

  @POST('/products/index')
  Future <DataHome> sortBy(FormData formData);

  @POST('/auth/logout')
  Future <void> logOut(@Header('Authorization') String token);

  @GET('/products/user_Products/{id}')
  Future<UserProducts> getUserProducts(@Path("id") int id);

  @DELETE('/auth/deleteUser/{id}')
  Future<void> deleteAccount(
      @Path("id") int id, @Header('Authorization') String token);

  @DELETE('/comments/{id}')
  Future<void> deleteComment(
      @Path("id") int id, @Header('Authorization') String token);

  @POST('/comments/{id}')
  Future<void> updateComment(@Path("id") int id,
      @Header('Authorization') String token, FormData formData);
}
