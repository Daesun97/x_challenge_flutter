import 'package:flutter/cupertino.dart';

class PinCodeState with ChangeNotifier {
  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  void setCompleted(bool value) {
    _isCompleted = value;
    notifyListeners();
  }
}
