import 'package:flutter/material.dart';

class Highlight {
  final IconData iconData;
  final String description;

  Highlight({
    required this.iconData,
    required this.description,
  });
}

Highlight hQualityPriceRatio = Highlight(iconData: Icons.paid_outlined, description: "Boa relação qualidade-preço");
Highlight hDeliciousFood = Highlight(iconData: Icons.thumb_up_alt_outlined, description: "Comida deliciosa");
Highlight hFriendlyStaff = Highlight(iconData: Icons.sentiment_satisfied_alt_outlined, description: "Funcionários Amigáveis");
Highlight hGoodQuantity = Highlight(iconData: Icons.shopping_bag_outlined, description: "Boa Quantidade de Comida");
Highlight hFastRetrieval = Highlight(iconData: Icons.speed_outlined, description: "Recolha Rápida");
