import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Person extends ChangeNotifier {
  late String? name, gender, age;
  void erase() {
    GetStorage box = GetStorage();
    box.erase();
    notifyListeners();
  }

  void add(String? name, String gender, String age) {
    this.name = name;
    this.age = age;
    this.gender = gender;
  }
}
