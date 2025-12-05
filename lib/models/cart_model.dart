import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();  // Notify listeners (UI) when an item is added
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();  // Notify listeners (UI) when an item is removed
  }
}