import 'package:flutter/cupertino.dart';

class ProductsManager extends ChangeNotifier {
  int selectedProduct = 0;
  int selectedTab = 1;

  void selectProduct(int index) {
    selectedProduct = index;
    notifyListeners();
  }

  void goToTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
