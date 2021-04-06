import 'package:flutter/material.dart';

class SaveData extends ChangeNotifier {
  void saveData() {
    notifyListeners();
  }
}
