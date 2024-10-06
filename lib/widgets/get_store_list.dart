import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/stores.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

import '../mycolors/colors.dart';

List<Widget> getStoreList(String title, List<Store> stores){
  return [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: "Ver tudo ", style: TextStyle(
                    color: MyColorPalette.darkGreen,
                    fontWeight: FontWeight.bold,
                  )),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.chevron_right, size: 20, color: MyColorPalette.darkGreen)
                  ),
                ],
              ),
            ),
          ]
      ),
    ),
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