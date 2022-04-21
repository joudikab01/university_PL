import 'package:flutter/material.dart';
import '../models/models.dart';
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
  DataHome? dataHome;

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
  Future<DataHome> getAllData() {
    DataService dataService = DataService(Dio());
    return dataService.getData();
  }

  Future<ProductDetails> getProductDetails(int id) {
    DataService dataService = DataService(Dio());
    return dataService.getProductDetails(id.toString());
  }

  Future<DataCategories> getAllCategories() {
    DataService dataService = DataService(Dio());
    return dataService.getAllCategories();
  }

  Future<SignupData> signUp() {
    FormData formData = FormData.fromMap(map);
    DataService dataService = DataService(Dio());
    return dataService.signUp(formData);
  }

  Future<Login> logIn() {
    FormData formData = FormData.fromMap(mapL);
    DataService dataService = DataService(Dio());
    return dataService.logIn(formData);
  }

  Future addProduct(String token, Map<String, dynamic> data) {
    DataService dataService = DataService(Dio());
    return dataService.addProduct(token, data);
  }

  void search(FormData formData, String value) async {
    if (value == '') {
      dataHome = DataHome(products: []);
      notifyListeners();
    } else {
      DataService dataService = DataService(Dio());
      dataHome = await dataService.search(formData);
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


  Future <void> logOut(String token)
  {
    DataService dataService = DataService(Dio());
    return dataService.logOut(token);
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

  Map<String, dynamic> mp = {};
  setProfile(UserLogin login) {
    mp.clear();
    mp = {
      'name': login.name,
      'email': login.email,
      'phone number': login.phoneNumber,
      'facebook': login.facebook,
      'id': login.id
    };
  }

  Map<String, dynamic> getProfile() {
    return mp;
  }

  setProfileS(SignupData signupData) {
    mp.clear();
    mp = {
      'name': signupData.user.name,
      'email': signupData.user.email,
      'phone number': signupData.user.phoneNumber,
      'facebook': signupData.user.facebook,
      'id': signupData.user.id
    };
  }

  Map<String, dynamic> getProfileS() {
    return mp;
  }
}
