import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/api_exception.dart';
import '../services/api_response.dart';
import '../services/data_services.dart';
import 'package:dio/dio.dart';

class ProductsManager extends ChangeNotifier {
  int selectedCategory = 0;
  int selectedProduct = 0;
  int selectedTab = 2;
  bool isSelected = false;
  bool view = false;
  bool isEng = true;
  String _password = '';
  String _email = '';
  String _phoneNumber = '';
  String _name = '';
  String _url = '';
  Map<String, dynamic> map = {};
  Map<String, dynamic> mapL = {};
  DataHome? searchData;

  //check connection
  bool isConnected = false;
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected = connectivityResult != ConnectivityResult.none;
    return isConnected;
  }

  void setMap() {
    map = {
      'email': _email,
      'phone_number': _phoneNumber,
      'name': _name,
      'password': _password,
      'facebook_url': _url
    };
  }

  Color cardColor(int index) {
    if (index == selectedCategory) return Colors.white;
    return Colors.white38;
  }

  ///////Hive  .........


  bool getLike(int id)
  {
    var box = Boxes.getLikeBox();
    return box.get('$id') ?? false;
  }

  void setLike(int id, bool value)
  {
    var box = Boxes.getLikeBox();
    box.put('$id', value);
  }

  void changeLocal(String local) {
    var box = Boxes.getLocalBox();
    if (local == 'EN' || local == 'الإنكليزية') {
      isEng = true;
    } else {
      isEng = false;
    }
    box.put('local', isEng);
    notifyListeners();
  }

  bool getLocal() {
    var box = Boxes.getLocalBox();
    return box.get('local') ?? true;
  }

  String getToken() {
    var box = Boxes.getAuthBox();
    return box.get('token') ?? 'error';
  }

  void setToken(String token) {
    var box = Boxes.getAuthBox();
    //box.clear();
    box.put('token', token);
    notifyListeners();
  }

  ////////...........
  void changeCategory(int index) {
    selectedCategory = index;
    isSelected = true;
    notifyListeners();
  }

  void back() {
    isSelected = false;
    notifyListeners();
  }

  void viewComments() {
    view = !view;
    notifyListeners();
  }

  void selectProduct(int index) {
    selectedProduct = index;
    notifyListeners();
  }

  void goToTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void refresh(){
    notifyListeners();
  }

  //////////Requests ........
  Future<DataHome> getAllData2() {
    DataService dataService = DataService(Dio());
    return dataService.getData();
  }
  ApiResponse<DataHome>? _dataHomeResponse;
  ApiResponse<DataHome>? get dataHomeResponse => _dataHomeResponse;
  set dataHomeResponse(ApiResponse<DataHome>? value) {
    _dataHomeResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<DataHome>> getAllData() async {
    DataService dataService = DataService(Dio());
    if (await checkInternet()) {
      dataHomeResponse = ApiResponse.loading('');
      try {
        DataHome dataHome = await dataService.getData();
        dataHomeResponse = ApiResponse.completed(dataHome);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return dataHomeResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return dataHomeResponse = ApiResponse.error(e.toString());
      }
    } else {
      return dataHomeResponse = ApiResponse.error('No Internet Connection');
    }
    return dataHomeResponse!;
  }

  Future<ProductDetails> getProductDetails2(int id) {
    DataService dataService = DataService(Dio());
    return dataService.getProductDetails(id.toString());
  }

  ApiResponse<ProductDetails>? _productDetailsResponse;
  ApiResponse<ProductDetails>? get productDetailsResponse => _productDetailsResponse;
  set productDetailsResponse(ApiResponse<ProductDetails>? value) {
    _productDetailsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<ProductDetails>> getProductDetails(int id) async {
    DataService dataService = DataService(Dio());
    if (await checkInternet()) {
      productDetailsResponse = ApiResponse.loading('');
      try {
        ProductDetails productDetails = await dataService.getProductDetails(id.toString());
        productDetailsResponse = ApiResponse.completed(productDetails);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return productDetailsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return productDetailsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return productDetailsResponse = ApiResponse.error('No Internet Connection');
    }
    return productDetailsResponse!;
  }

  Future<DataCategories> getAllCategories2() {
    DataService dataService = DataService(Dio());
    return dataService.getAllCategories();
  }
  ApiResponse<DataCategories>? _dataCategoriesResponse;
  ApiResponse<DataCategories>? get dataCategoriesResponse => _dataCategoriesResponse;
  set dataCategoriesResponse(ApiResponse<DataCategories>? value) {
    _dataCategoriesResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<DataCategories>> getAllCategories() async {
    DataService dataService = DataService(Dio());
    if (await checkInternet()) {
      dataCategoriesResponse = ApiResponse.loading('');
      try {
        DataCategories dataCategories = await dataService.getAllCategories();
        dataCategoriesResponse = ApiResponse.completed(dataCategories);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return dataCategoriesResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return dataCategoriesResponse = ApiResponse.error(e.toString());
      }
    } else {
      return dataCategoriesResponse = ApiResponse.error('No Internet Connection');
    }
    return dataCategoriesResponse!;
  }

  Future<SignupData> signUp2() {
    FormData formData = FormData.fromMap(map);
    DataService dataService = DataService(Dio());
    return dataService.signUp(formData);
  }
  ApiResponse<SignupData>? _signupDataResponse;
  ApiResponse<SignupData>? get signupDataResponse => _signupDataResponse;
  set signupDataResponse(ApiResponse<SignupData>? value) {
    _signupDataResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<SignupData>> signUp() async {
    DataService dataService = DataService(Dio());
    FormData formData = FormData.fromMap(map);
    if (await checkInternet()) {
      signupDataResponse = ApiResponse.loading('');
      try {
        SignupData signUpData = await dataService.signUp(formData);
        signupDataResponse = ApiResponse.completed(signUpData);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return signupDataResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return signupDataResponse = ApiResponse.error(e.toString());
      }
    } else {
      return signupDataResponse = ApiResponse.error('No Internet Connection');
    }
    return signupDataResponse!;
  }

  Future<Login> logIn2() {
    FormData formData = FormData.fromMap(mapL);
    DataService dataService = DataService(Dio());
    return dataService.logIn(formData);
  }
  ApiResponse<Login>? _loginResponse;
  ApiResponse<Login>? get loginResponse => _loginResponse;
  set loginResponse(ApiResponse<Login>? value) {
    _loginResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Login>> logIn() async {
    DataService dataService = DataService(Dio());
    FormData formData = FormData.fromMap(mapL);
    if (await checkInternet()) {
      loginResponse = ApiResponse.loading('');
      try {
        Login login = await dataService.logIn(formData);
        loginResponse = ApiResponse.completed(login);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return loginResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return loginResponse = ApiResponse.error(e.toString());
      }
    } else {
      return loginResponse = ApiResponse.error('No Internet Connection');
    }
    return loginResponse!;
  }

  Future addProduct(String token, Map<String, dynamic> data) {
    DataService dataService = DataService(Dio());
    return dataService.addProduct(token, data);
  }

  void search(FormData formData, String value) async {
    if (value == '') {
      searchData = DataHome(products: []);
      notifyListeners();
    } else {
      DataService dataService = DataService(Dio());
      searchData = await dataService.search(formData);
      notifyListeners();
    }
  }

  Future<DataHome> sort(FormData formData) {
    DataService dataService = DataService(Dio());
    return dataService.sort(formData);
  }

  Future<void> deleteProduct(String token, int id) async {
    DataService dataService = DataService(Dio());
    await dataService.deleteProduct(token, id);
    notifyListeners();
  }


  Future<void> editProduct(String token, int id,FormData formData) async {
    DataService dataService = DataService(Dio());
    await dataService.editProduct(token, id,formData);
    notifyListeners();
  }

  Future<void> addComment(String token,FormData formData){
    DataService dataService = DataService(Dio());
    return dataService.addComment(token,formData);
  }

  Future<void> addLike(String token,FormData formData){
    DataService dataService = DataService(Dio());
    return dataService.addLike(token,formData);
  }

  Future<void> removeLike(String token,int id){
    DataService dataService = DataService(Dio());
    return dataService.removeLike(token,id);
  }

  Future <DataHome> sortBy(FormData formData)
  {
    DataService dataService = DataService(Dio());
    return dataService.sortBy(formData);
  }


  Future<void> logOut(String token)
  {
    DataService dataService = DataService(Dio());
    return dataService.logOut(token);
  }

  Future<UserProducts> getUserProducts(int id)
  {
        //??UserSign(id: 1, email: '', name: '', phoneNumber: '', createdAt: '', updatedAt: '', facebook: '');
    DataService dataService = DataService(Dio());
    return dataService.getUserProducts(id);
  }


  Future <void> deleteAccount(String token, int id)
  {
    DataService dataService =  DataService(Dio());
    return dataService.deleteAccount(id, token);
  }


  Future <void> deleteComment(int id, String token)
  {
    DataService dataService = DataService(Dio());
    return dataService.deleteComment(id, token);
  }

  Future <void> updateComment(int id, String token, FormData formData)
  {
    DataService dataService = DataService(Dio());
    return dataService.updateComment(id, token, formData);
  }


  /////////...........

  void setNameNumber(String name, String number, String url) {
    _name = name;
    _phoneNumber = number;
    _url = url;
    setMap();
    notifyListeners();
  }

  void setEmailPassword(String email, String password) {
    _email = email;
    _password = password;
    notifyListeners();
  }

  void setLoginData(String email, String password) {
    mapL = {'email': email, 'password': password};
    notifyListeners();
  }

  String searchKey(String key) {
    if (key == 'Name') {
      return 'searchByName';
    } else if (key == 'From Date') {
      return 'searchByDateFrom';
    } else {
      return 'searchByDateTo';
    }
  }

void setUser(UserSign userSign) async {
    final box = Boxes.getUserBox();
    await box.put('userData', userSign);
    notifyListeners();
}

}

dynamic throwCustomException(DioError? dioError) {
  var statusCode = dioError?.response?.statusCode;
  switch (dioError!.type) {
    case DioErrorType.cancel:
      throw RequestWasCancelledException("CANCEL");
    case DioErrorType.connectTimeout:
      throw ConnectionTimeout("CONNECT_TIMEOUT");
    case DioErrorType.other:
      throw DefaultTimeout("DEFAULT");
    case DioErrorType.receiveTimeout:
      throw ReceiveTimeout("RECEIVE_TIMEOUT");
    case DioErrorType.sendTimeout:
      throw SendTimeout("SEND_TIMEOUT");
    case DioErrorType.response:
      switch (statusCode) {
        case 400:
          throw BadRequestException(dioError.response?.statusMessage);
        case 401:
        case 403:
          throw UnauthorisedException(dioError.response?.statusMessage);
        case 404:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
        case 500:
        default:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
      }
  }
}
