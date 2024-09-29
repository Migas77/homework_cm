import 'package:flutter/material.dart';

class SmallStoreCard extends StatelessWidget {
  const SmallStoreCard({
    super.key, 
    required this.storeName,
    required this.storeImagePath,
    required this.storeLogoPath,
    required this.availableSurpriseBags,
  });

  final String storeName;
  final String storeImagePath;
  final String storeLogoPath;
  final int availableSurpriseBags;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: const Color(0x1F0000FF), // Equivalent to Colors.blue.withAlpha(30)
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
          width: 250,
          height: 177,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  // Image
                  Image.asset(storeImagePath, fit: BoxFit.cover, width: 250, height: 100),
                  // Image's gradient
                  Positioned(child: 
                    Container(
                      width: 250,
                      height: 100,
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
                      onPressed: () { debugPrint('Favorite tapped.'); },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white
                      ),
                      // remove splash effect
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    )
                  ),
                  Positioned(
                    top: 13.5,
                    left: 9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4AAEFD), //blue
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Text(
                        '$availableSurpriseBags Surprise Bag${availableSurpriseBags > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )

                  ),
                  Positioned(
                    left: 10,
                    bottom: 5,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(storeLogoPath),
                        ),
                        const SizedBox(width: 10),
                        Text(storeName, style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white
                        )),
                      ],
                    ),
                  ),
                ]
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Suprise Bag", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                    Text("Recolher hoje 21:30 - 22:00", style: TextStyle(
                      color: Color.fromARGB(255, 112, 112, 112),
                      fontSize: 12,
                    )),
                    Row(
                      children: [
                        Expanded(child: 
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.green, size: 18,),
                              SizedBox(width: 5),
                              Text("4,7", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                              SizedBox(
                                height: 18,
                                child: VerticalDivider(
                                  thickness: 0.35,
                                  color: Colors.grey,
                                )
                              ),
                              Text("4,1 Km", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                            ],
                          )
                        ),
                        Align(alignment: Alignment.centerRight, child:
                          Text("4,99 €", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 3, 44, 4)
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
      )
    );
  }

}