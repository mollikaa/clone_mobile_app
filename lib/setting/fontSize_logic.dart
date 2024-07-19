import 'package:flutter/material.dart';

class FontsizeLogic extends ChangeNotifier{
  double _size = 0; 
  double get size => _size; 

  void increase() {
    _size +=2; 
    notifyListeners();
  }

  void decrease() {
    _size -= 2; 
    notifyListeners();
  }
}