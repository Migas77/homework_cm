import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child:
          Column(
            children: [
              const Text('Glória, Aveiro'),
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
              const SizedBox(height: 10),
              SizedBox(
                height: 185,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SmallStoreCard(
                        storeName: "Auchan 1 - Aveiro",
                        storeImagePath: "assets/images/AuchanAveiro.jpg",
                        storeLogoPath: "assets/images/AuchanLogo.jpg",
                        availableSurpriseBags: 3
                    ),
                    SmallStoreCard(
                        storeName: "Auchan 2 - Aveiro",
                        storeImagePath: "assets/images/AuchanAveiro.jpg",
                        storeLogoPath: "assets/images/AuchanLogo.jpg",
                        availableSurpriseBags: 3
                    ),
                  ],
                ),
              ),
            ],
          ),
      )
    );
  }
}