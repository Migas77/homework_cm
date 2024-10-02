import 'package:flutter/material.dart';

class Highlight {
  final IconData iconData;
  final String description;

  Highlight({
    required this.iconData,
    required this.description,
  });
}

Highlight hQualityPriceRatio = Highlight(iconData: Icons.insert_emoticon_sharp, description: "Boa relação qualidade-preço");
Highlight hDeliciousFood = Highlight(iconData: Icons.insert_emoticon_sharp, description: "Comida deliciosa");
Highlight hFriendlyStaff = Highlight(iconData: Icons.insert_emoticon_sharp, description: "Funcionários Amigáveis");
Highlight hGoodQuantity = Highlight(iconData: Icons.insert_emoticon_sharp, description: "Boa Quantidade de Comida");
Highlight hFastRetrieval = Highlight(iconData: Icons.insert_emoticon_sharp, description: "Recolha Rápida");
