import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
/*
* don’t forget to add the dependency on it to your pubspec.yaml first.
* provider: ^4.0.4
* > flutter pub get
*/

class BeefModel with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void add() {
    _number++;
    notifyListeners();
  }

  void sub() {
    _number--;
    notifyListeners();
  }
}
