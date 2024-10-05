import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: SearchBar(
        padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
        leading: const Icon(
          Icons.search_outlined,
          color: Colors.grey,
          size: 19,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.grey, fontSize: 14), // Customize color and size
        ),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        elevation: WidgetStateProperty.all(0),
        hintText: "Pesquisar",

      ),
    );
  }
}