import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();  // Notify listeners that the state has changed
  }

  void decrement() {
    _counter--;
    notifyListeners();  // Notify listeners (UI) that the counter has changed
  }

  void reset() {
    _counter = 0;
    notifyListeners();  // Notify listeners to reset the UI
  }
}