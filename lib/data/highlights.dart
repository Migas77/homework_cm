import 'package:flutter/material.dart';

class Highlight {
  final Icon icon;
  final String description;

  Highlight({
    required this.icon,
    required this.description,
  });
}

Highlight hQualityPriceRatio = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Boa relação qualidade-preço");
Highlight hDeliciousFood = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Comida deliciosa");
Highlight hFriendlyStaff = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Funcionários Amigáveis");
Highlight hGoodQuantity = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Boa Quantidade de Comida");
Highlight hFastRetrieval = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Recolha Rápida");
