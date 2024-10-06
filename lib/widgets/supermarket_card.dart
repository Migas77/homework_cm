import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/data/supermarkets.dart';

class SupermarketCard extends StatelessWidget{

  const SupermarketCard({
    super.key,
    required this.supermarket
  });

  final Supermarket supermarket;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 7.6),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            splashColor: const Color(0x1F0000FF), // Equivalent to Colors.blue.withAlpha(30)
            onTap: () {},
            child: SizedBox(
                width: 152,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Stack(
                          children: [
                            // Image
                            Image.asset(supermarket.storeImagePath, fit: BoxFit.cover, width: 152, height: 60),
                            // Image's gradient
                            Positioned(child:
                              Container(
                                  width: 152,
                                  height: 60,
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
                              top: 32,
                              left: 48,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundImage: AssetImage(supermarket.logoImagePath),
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              top: 60,
                              child: Column(
                                children: [
                                  const SizedBox(height: 33),
                                  Text(supermarket.name, style: const TextStyle(
                                    fontSize: 17.2,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  const SizedBox(height: 2.5),
                                  Text(supermarket.locale, style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13.5,
                                  )),
                                  const SizedBox(height: 5),
                                  Text("${supermarket.distance.toStringAsFixed(1).replaceFirst(".", ",")} km", style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.5,
                                  ))
                                ],
                              )
                            )
                          ]
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }

}