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

          ],
        );
      }),
    );
  }
}