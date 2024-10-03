import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/stores.dart';

class FavoriteStoresState with ChangeNotifier {

  List<Store> favoriteStores = [];

  void toggleFavorite(Store store) {
    if (favoriteStores.contains(store)) {
      favoriteStores.remove(store);
    } else {
      favoriteStores.add(store);
    }
    notifyListeners();
  }

  bool isFavoriteStore(Store store) {
    return favoriteStores.contains(store);
  }

}