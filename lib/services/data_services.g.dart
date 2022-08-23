// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DataService implements DataService {
  _DataService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://127.0.0.1:8000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DataHome> getData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataHome>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/index',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataHome.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductDetails> getProductDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductDetails>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductDetails.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DataCategories> getAllCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataCategories>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataCategories.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupData> signUp(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignupData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/signup',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignupData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Login> logIn(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Login>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Login.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> addProduct(token, data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(data);
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/products/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<DataHome> search(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataHome>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/index',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataHome.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DataHome> sort(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataHome>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/index',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataHome.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteProduct(token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/products/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<EditProduct> editProduct(token, id, formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EditProduct>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EditProduct.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> addComment(token, formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = formData;
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/comments',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> addLike(token, formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = formData;
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/like',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> removeLike(token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/like/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<DataHome> sortBy(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataHome>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/index',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataHome.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> logOut(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/auth/logout',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<UserProducts> getUserProducts(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserProducts>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/products/user_Products/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserProducts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteAccount(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/auth/deleteUser/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> deleteComment(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/comments/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> updateComment(id, token, formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/comments/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
