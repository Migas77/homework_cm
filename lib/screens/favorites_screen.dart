import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';
import 'package:too_good_to_go_clone/providers/favorite_stores_state.dart';
import 'package:too_good_to_go_clone/screens/stores_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.onButtonPress});

  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) {
    FavoriteStoresState favoritesState = context.watch<FavoriteStoresState>();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Os teus favoritos", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            )),
          ),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: favoritesState.favoriteStores.isEmpty
              ? Column(
                  key: const ValueKey("empty"),
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text("Ainda não tens favoritos", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                    )),
                    const SizedBox(height: 4),
                    const SizedBox(
                        width: 300,
                        child: Text("Clica no ícone do coração numa loja para adicioná-la aos teus favoritos e ela aparecerá aqui.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.5
                          ),
                        )
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColorPalette.darkGreen,
                          minimumSize: const Size(200, 0),
                        ),
                        onPressed: () => onButtonPress(),
                        child: const SizedBox(
                          width: 100,
                          child: Text("Encontrar uma Surprise Bag",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.6,
                                color: Colors.white,
                              )
                          ),
                        )
                    )
                  ],
                )
              : StoresList(
                    key: const ValueKey("notEmpty"),
                    stores: favoritesState.favoriteStores
                )
          )
        )
      ]

    );
  }

}