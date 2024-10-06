import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/providers/favorite_stores_state.dart';
import 'package:too_good_to_go_clone/screens/stores_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
        Expanded(child: StoresList(stores: favoritesState.favoriteStores))
      ]

    );
  }

}