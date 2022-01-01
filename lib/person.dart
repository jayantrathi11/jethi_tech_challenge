import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Person extends ChangeNotifier {
  List<List<String>> list = [
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
    ['Sign In'],
  ];

  late String? name, gender, age;
  void erase() {
    GetStorage box = GetStorage();
    box.erase();
    notifyListeners();
  }

  void change(int index) {
    list[index][0] = list[index][0] == 'Sign In' ? 'Sign Out' : 'Sign In';
    notifyListeners();
  }
}
