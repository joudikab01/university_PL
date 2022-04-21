import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/categories_models/data_categories.dart';
import '../models/models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManager extends ChangeNotifier{
  DataHome? _dataHome;
  DataCategories? _dataCategories;
  int selectedCategory = 0;
  bool isSelected=false;

  void changeCategory(int index) {
    selectedCategory = index;
    isSelected=true;
    notifyListeners();
  }

  void setData(DataHome dataHome){
    _dataHome = dataHome;
    notifyListeners();
  }

  DataHome? getData(){
    return _dataHome;
  }

  void setCategories(DataCategories dataCategories){
    _dataCategories=dataCategories;
    notifyListeners();
  }

  DataCategories? getCategories()
  {
    return _dataCategories;
  }
}