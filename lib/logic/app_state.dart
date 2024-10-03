import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/stores.dart';

class MyAppState with ChangeNotifier {

  List<Store> favorites = [];

  void toggleFavorite(Store store) {
    if (favorites.contains(store)) {
      favorites.remove(store);
    } else {
      favorites.add(store);
    }
    notifyListeners();
  }

  bool isFavorite(Store store) {
    return favorites.contains(store);
  }

}