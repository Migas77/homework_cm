import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/stores.dart';
import '../data/supermarkets.dart';

class StockState with ChangeNotifier {

  final List<Store> stores = allStoresList;
  final List<Supermarket> supermarkets = allSupermarketsList;

}