import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/stores.dart';
import 'package:too_good_to_go_clone/widgets/headline.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

List<Widget> getStoreList(String title, List<Store> stores){
  return [
    Headline(title: title),
    const SizedBox(height: 5),
    SizedBox(
      height: 177,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        scrollDirection: Axis.horizontal,
        itemCount: stores.length,
        itemBuilder: (BuildContext context, int index) {
          return SmallStoreCard(store: stores[index]);
        },
      ),
    ),
    const SizedBox(height: 19),
  ];
}