import 'package:flutter/material.dart';

class Highlight {
  final Icon icon;
  final String description;

  Highlight({
    required this.icon,
    required this.description,
  });
}

Highlight h_quality_price_racio = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Boa relação qualidade-preço");
Highlight h_delicious_food = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Comida deliciosa");
Highlight h_friendly_staff = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Funcionários Amigáveis");
Highlight h_good_quantity = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Boa Quantidade de Comida");
Highlight h_fast_retrieval = Highlight(icon: const Icon(Icons.insert_emoticon_sharp), description: "Recolha Rápida");
