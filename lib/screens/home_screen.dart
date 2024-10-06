import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';
import 'package:too_good_to_go_clone/providers/stock_stores_state.dart';
import 'package:too_good_to_go_clone/widgets/get_store_list.dart';
import 'package:too_good_to_go_clone/widgets/search_bar.dart';

import '../providers/favorite_stores_state.dart';
import '../widgets/headline.dart';
import '../widgets/supermarket_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StockState stockState = context.watch<StockState>();
    FavoriteStoresState favoritesState = context.watch<FavoriteStoresState>();
    List<String> titles = ["Recomendações", "Salva antes que seja tarde", "Novas Surprise Bags"];
    List<int> indexesForTitles = [0, 4, 6, 9];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
      
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.location_on_sharp, size: 14, color: MyColorPalette.darkGreen)
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(text: "Glória, Aveiro", style: TextStyle(
                                  color: MyColorPalette.darkGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                )),
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(Icons.keyboard_arrow_down_outlined, size: 25, color: MyColorPalette.darkGreen)
                                ),
                              ],
                            ),
                          ),
                          const Text("dentro de 15 km", style: TextStyle(
                            color: MyColorPalette.darkGreen,
                            fontSize: 14.0,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),

                const MySearchBar(),
                const SizedBox(height: 14),
              ],
            ),
          ),

          // Repeat for all titles and respective stores
          for (int i = 0; i < titles.length; i++) ...[
            ...getStoreList(titles[i], stockState.stores.sublist(indexesForTitles[i], indexesForTitles[i + 1]))
          ],

          if (stockState.supermarkets.isNotEmpty) ...[
            const Headline(title: "Supermercados"),
            const SizedBox(height: 5),
            SizedBox(
              height: 177,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                scrollDirection: Axis.horizontal,
                itemCount: stockState.supermarkets.length,
                itemBuilder: (BuildContext context, int index) {
                  return SupermarketCard(supermarket: stockState.supermarkets[index]);
                },
              ),
            ),
            const SizedBox(height: 19),
          ],

          // Favorites
          if (favoritesState.favoriteStores.isNotEmpty)
            ...getStoreList("Os teus favoritos", favoritesState.favoriteStores),


        ],
      ),
    );
  }
}