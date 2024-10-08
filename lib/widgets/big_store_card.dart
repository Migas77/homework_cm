import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/providers/favorite_stores_state.dart';
import 'package:too_good_to_go_clone/widgets/surprise_bag_count_indicator.dart';
import '../animations/slide_animations.dart';
import '../data/stores.dart';
import '../mycolors/colors.dart';
import '../screens/store_screen.dart';

class BigStoreCard extends StatelessWidget {
  const BigStoreCard({
    super.key,
    required this.store
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    FavoriteStoresState favoriteStoresState = context.watch<FavoriteStoresState>();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 214.2,
        maxHeight: 214.2,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 7.6),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: const Color(0x1F0000FF), // Equivalent to Colors.blue.withAlpha(30)
          onTap: () => Navigator.push(context, createRouteSlideIn(StoreScreen(store: store))),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                    children: [
                      // Image
                      Positioned.fill(child: Image.asset(store.storeImagePath, fit: BoxFit.cover)),
                      // Image's gradient
                      Positioned(child:
                        Container(
                            height: 112,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: AlignmentDirectional.bottomCenter,
                                    end: AlignmentDirectional.topCenter,
                                    colors: [
                                      Color.fromARGB(120, 0, 0, 0),
                                      Colors.transparent
                                    ],
                                    stops: [0.0, 0.7]
                                )
                            )
                        )
                      ),
                      Positioned(
                          right: 0,
                          child: IconButton.filled(
                            padding: const EdgeInsets.all(3),
                            constraints: const BoxConstraints(maxHeight: 36),
                            onPressed: () => favoriteStoresState.toggleFavorite(store),
                            icon: Icon(
                              favoriteStoresState.isFavoriteStore(store) ? Icons.favorite : Icons.favorite_border_outlined,
                              color: Colors.white
                            ),
                            // remove splash effect
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.black.withOpacity(0.3)
                            )
                          )
                      ),
                      Positioned(
                          top: 13.5,
                          left: 9,
                          child: StoreIndicators(surpriseBagCount: store.availableSurpriseBags, isNews: store.isNews),
                      ),
                      Positioned(
                        left: 10,
                        right: 0,
                        bottom: 5,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(store.logoImagePath),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(store.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.white
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(store.mealTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ),
                      Text("Recolher hoje ${store.openingRetrievalHours} - ${store.closingRetrievalHours}", style: const TextStyle(
                        height: 1.2,
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontSize: 12,
                      )),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${store.oldPrice.toStringAsFixed(2).replaceFirst(".", ",")} €", style: const TextStyle(
                              height: 0.9,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15,
                              color: Colors.grey,
                              decorationColor: Colors.grey
                          )),
                        ],
                      ),
                      
                      Row(
                        children: [
                          Expanded(child:
                            Row(
                              children: [
                                const Icon(Icons.star, color: MyColorPalette.lightGreen, size: 16,),
                                const SizedBox(width: 5),
                                Text(store.rating.toString().replaceFirst(".", ","), style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                )),
                                const SizedBox(
                                    height: 18,
                                    child: VerticalDivider(
                                      thickness: 0.35,
                                      color: Colors.grey,
                                    )
                                ),
                                Text("${store.distance.toStringAsFixed(1).replaceFirst(".", ",")} Km", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                )),
                              ],
                          )
                          ),
                          Align(alignment: Alignment.centerRight, child:
                            Text("${store.price.toStringAsFixed(2).replaceFirst(".", ",")} €", style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 17,
                                color: MyColorPalette.darkGreen
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
          )
        )
      ),
    );
  }

}