import 'package:flutter/material.dart';

import '../mycolors/colors.dart';

class Headline extends StatelessWidget {

  const Headline({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: "Ver tudo ", style: TextStyle(
                    color: MyColorPalette.darkGreen,
                    fontWeight: FontWeight.bold,
                  )),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.chevron_right, size: 20, color: MyColorPalette.darkGreen)
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}