import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import '../models/models.dart';

class Boxes {

  static Box<bool> getLocalBox() {
    return Hive.box<bool>('local');
  }

  static Box<String> getAuthBox()
  {
    return Hive.box<String>('auth');
  }

  static Box<bool> getLikeBox()
  {
    return Hive.box<bool>('isLiked');
  }

  static Box<UserSign> getUserBox(){
    return Hive.box('user');
  }
}
