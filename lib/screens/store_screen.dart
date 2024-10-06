import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/providers/favorite_stores_state.dart';

import '../data/highlights.dart';
import '../data/stores.dart';
import '../mycolors/colors.dart';
import '../widgets/surprise_bag_count_indicator.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    FavoriteStoresState appState = context.watch<FavoriteStoresState>();

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned.fill(child: Image.asset(store.storeImagePath, fit: BoxFit.cover)),
                        Positioned(child:
                          Container(
                              height: 228,
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
                          left: 12,
                          top: 40,
                          child: IconButton.filledTonal(
                            padding: const EdgeInsets.only(right: 3),
                            icon: const Icon(Icons.arrow_back_ios_new),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.7),
                            )
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 40,
                          child: IconButton.filledTonal(
                              icon: Icon(
                                appState.isFavoriteStore(store) ? Icons.favorite :
                                Icons.favorite_border_outlined
                              ),
                              onPressed: () => appState.toggleFavorite(store),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.7),
                              )
                          ),
                        ),
                        Positioned(
                          right: 60,
                          top: 40,
                          child: IconButton.filledTonal(
                              icon: const Icon(Icons.share_outlined),
                              onPressed: (){
                                debugPrint('Share tapped.');
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.7),
                              )
                          ),
                        ),
                        Positioned(
                          left: 18,
                          bottom: 90,
                          child: StoreIndicators(surpriseBagCount: store.availableSurpriseBags, isNews: store.isNews),
                        ),
                        Positioned(
                            left: 18.2,
                            right: 11.8,
                            bottom: 12,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 33,
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
                                      fontSize: 22,
                                      color: Colors.white
                                    )
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                              alignment: PlaceholderAlignment.middle,
                                              child: Icon(
                                                Icons.shopping_bag_outlined,
                                                size: 20,
                                                color: MyColorPalette.darkGreen,
                                              )
                                          ),
                                          TextSpan(text: " ${store.mealTitle}", style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                          ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                              alignment: PlaceholderAlignment.middle,
                                              child: Icon(
                                                Icons.star,
                                                size: 20,
                                                color: MyColorPalette.lightGreen,
                                              )
                                          ),
                                          TextSpan(text: " ${store.rating}", style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                          )),
                                          TextSpan(text: " (${store.last6monthsReviewCount})", style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey
                                          ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                  alignment: PlaceholderAlignment.middle,
                                                  child: Icon(
                                                    Icons.schedule_outlined,
                                                    size: 20,
                                                    color: MyColorPalette.darkGreen,
                                                  )
                                              ),
                                              TextSpan(text: " Recolhe: ${store.openingRetrievalHours} - ${store.closingRetrievalHours} ", style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 7),
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: MyColorPalette.darkGreen,
                                            borderRadius: BorderRadius.circular(45),
                                          ),
                                          child: const Text('Hoje',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${store.oldPrice.toStringAsFixed(2).replaceFirst(".", ",")} €", style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 15,
                                        color: Colors.grey,
                                        decorationColor: Colors.grey
                                    )),
                                    Text("${store.price.toStringAsFixed(2).replaceFirst(".", ",")} €", style: const TextStyle(
                                        fontSize: 18,
                                        color: MyColorPalette.darkGreen,
                                        fontWeight: FontWeight.w800
                                    ))
                                  ],
                                )
                              )



                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: MyColorPalette.darkGreen,
                                size: 23,
                              )
                            ],
                          ),

                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(store.address,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: MyColorPalette.darkGreen,
                                  )),
                                  const Text("Mais informações sobre a loja", style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            // default flex 1
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: MyColorPalette.darkGreen,
                                  size: 23,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    const Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("O que podes receber", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ))),
                          const SizedBox(height: 6),
                          Align(alignment: Alignment.centerLeft, child: Text(store.description, textAlign: TextAlign.justify,style: const TextStyle(
                            fontSize: 15,
                          ))),
                          const SizedBox(height: 10),
                          IntrinsicWidth(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyColorPalette.grey,
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: Text(store.mealType,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ),

                    const Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ingredientes e alergénios", style: TextStyle(
                            color: MyColorPalette.darkGreen,
                            fontSize: 16,
                          )),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: MyColorPalette.darkGreen,
                            size: 23,
                          )
                        ],
                      ),
                    ),

                    const Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Column(
                          children: [
                            IntrinsicWidth(
                              child: Column(
                                children: [
                                  const Text("O que disseram os outros utilizadores", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 35,
                                        color: MyColorPalette.lightGreen,
                                      ),
                                      const SizedBox(width: 12),
                                      Text("${store.rating} / 5.0", style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Colors.black
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  // so that it has the same size as text (longest present element)
                                  const Divider(
                                    height: 0,
                                    thickness: 0.4,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 15),
                                  const Text("Top 3 destaques", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: MyColorPalette.darkGreen,
                                  )),
                                  const SizedBox(height: 12),
                                  ...store.top3Highlights.map((Highlight highlight) =>
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 3),
                                              Icon(highlight.iconData, size: 30, color: MyColorPalette.darkGreen),
                                              const SizedBox(width: 18),
                                              Text(highlight.description, style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              )),
                                            ],
                                          ),
                                          const SizedBox(height: 14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("Baseado em ${store.last6monthsReviewCount} classificações nos últimos 6 meses", style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            )),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),

                    const Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),

                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.centerLeft, child: Text("O que precisas saber", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                            SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text("•", style: TextStyle(
                                    fontSize: 15,
                                  )),
                                ),
                                Expanded(
                                  child: Text(
                                      "A loja fornecerá embalangens para o teu pedido, mas encorajamos-te a trazer o teu próprio saco para o levar para casa.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 15,
                                      )
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),

                    const SizedBox(height: 11)


                  ],
                ),
              ),
            ),
            Container(
              height: 93,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                child: FilledButton(
                  onPressed: (){},
                  style: FilledButton.styleFrom(
                    backgroundColor: MyColorPalette.darkGreen,
                  ),
                  child: const Text("Reservar", style: TextStyle(
                    fontSize: 15.4,
                    color: Colors.white,
                  )),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}