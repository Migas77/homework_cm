import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';
import 'package:too_good_to_go_clone/providers/stock_stores_state.dart';
import 'package:too_good_to_go_clone/widgets/search_bar.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StockStoresState stockStoresState = context.watch<StockStoresState>();
    List<String> titles = ["Recomendações", "Salva antes que seja tarde"];
    List<int> indexesForTitles = [0, 6, 8];

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
                          const Text("dentro de 10 km", style: TextStyle(
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

          // i want to repeat this a certain number of times
          for (int i = 0; i < titles.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(titles[i], style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ), ),
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
                itemCount: stockStoresState.stores.sublist(indexesForTitles[i], indexesForTitles[i + 1]).length,
                itemBuilder: (BuildContext context, int index) {
                  return SmallStoreCard(store: stockStoresState.stores.sublist(indexesForTitles[i], indexesForTitles[i + 1])[index]);
                },
              ),
            ),
            const SizedBox(height: 19),
          ]

        ],
      ),
    );
  }
}