import 'package:flutter/material.dart';
import '../data/stores.dart';
import '../widgets/big_store_card.dart';

class StoresList extends StatelessWidget {

  const StoresList({super.key, required this.stores});

  final List<Store> stores;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
          itemCount: stores.length,
          itemBuilder: (BuildContext context, int index) {
            return BigStoreCard(store: stores[index]);
          }
      ),
    );
  }

}