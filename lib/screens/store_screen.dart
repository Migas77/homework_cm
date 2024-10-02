import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/stores.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return Column(
          children: [
            Stack(
              children: [
                Image.asset(store.storeImagePath, fit: BoxFit.cover, height: 228),
                Positioned(
                  left: 12,
                  top: 40,
                  child: IconButton.filledTonal(
                    padding: const EdgeInsets.only(right: 3),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: (){
                      Navigator.of(context).pop();
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
                      icon: const Icon(Icons.favorite_border_outlined),
                      onPressed: (){
                        debugPrint('Favorite tapped.');
                      },
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4AAEFD), //blue
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Text(
                      '${store.availableSurpriseBags <= 5 ? store.availableSurpriseBags : '5+'} '
                          'Surprise Bag${store.availableSurpriseBags > 1 ? 's' : ''}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  )
                ),
                Positioned(
                    left: 18.2,
                    bottom: 12,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 33,
                          backgroundImage: AssetImage(store.logoImagePath),
                        ),
                        const SizedBox(width: 10),
                        Text(store.name, style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.white
                        )),
                      ],
                    ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                                        color: Colors.green,
                                      )
                                  ),
                                  TextSpan(text: " ${store.mealType}", style: const TextStyle(
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
                                        color: Colors.green,
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
                                            color: Colors.green,
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
                                    color: const Color(0xFF4AAEFD), //blue
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
                                color: Colors.green,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                        size: 23,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(store.address, style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green
                          ))
                        ]),
                        const Row(children: [
                          Text("Mais informações sobre a loja", style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey
                          ))
                        ]),
                      ],
                    ),
                  ),

                  Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.green,
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

          ],
        );
      }),
    );
  }
}