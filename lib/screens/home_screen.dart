import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';
import 'package:too_good_to_go_clone/providers/stock_stores_state.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StockStoresState stockStoresState = context.watch<StockStoresState>();

    return Column(
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
                        Text("dentro de 10 km", style: TextStyle(
                          color: MyColorPalette.darkGreen,
                          fontSize: 14.0,
                        )),
                      ],
                    ),
                  ],
                ),
              ),



              const SearchBar(
                  padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                  leading: Icon(Icons.search),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Recomendações", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ), ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: "Ver tudo ", style: TextStyle(
                          color: Color.fromARGB(255, 70, 2, 187),
                          fontWeight: FontWeight.bold,
                        )),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(Icons.chevron_right, size: 20)
                        ),
                      ],
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
        SizedBox(
          height: 185,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            scrollDirection: Axis.horizontal,
            itemCount: stockStoresState.stores.length,
            itemBuilder: (BuildContext context, int index) {
              return SmallStoreCard(store: stockStoresState.stores[index]);
            },
          ),
        ),
      ],
    );
  }
}