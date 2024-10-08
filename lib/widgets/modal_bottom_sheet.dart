import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';

enum OrderedBy {
  relevancia("Relevância"),
  distancia("Distância"),
  preco("Preço"),
  classificacao("Classificação");

  final String value;

  const OrderedBy(this.value);
}

void showOrderByBottomModalSheet(BuildContext context, OrderedBy currentOrder, Function(OrderedBy) onSelected){
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 240,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text('Ordenar por', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),),
            const Divider(
              height: 20,
              thickness: 0.4,
              color: Colors.grey,
            ),
            RadioListTile<OrderedBy>(
              title: Text(OrderedBy.relevancia.value, style: TextStyle(
                color: currentOrder == OrderedBy.relevancia ? MyColorPalette.darkGreen : Colors.black,
                fontWeight: currentOrder == OrderedBy.relevancia ? FontWeight.bold : FontWeight.normal,
                fontSize: 15.3,
              )),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              activeColor: MyColorPalette.darkGreen,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: currentOrder,
              value: OrderedBy.relevancia,
              onChanged:(OrderedBy? value) {
                onSelected(OrderedBy.relevancia);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ),
            RadioListTile<OrderedBy>(
              title: Text(OrderedBy.distancia.value, style: TextStyle(
                color: currentOrder == OrderedBy.distancia ? MyColorPalette.darkGreen : Colors.black,
                fontWeight: currentOrder == OrderedBy.distancia ? FontWeight.bold : FontWeight.normal,
                fontSize: 15.3,
              )),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              activeColor: MyColorPalette.darkGreen,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: currentOrder,
              value: OrderedBy.distancia,
              onChanged:(OrderedBy? value) {
                onSelected(OrderedBy.distancia);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ),
            RadioListTile<OrderedBy>(
              title: Text(OrderedBy.preco.value, style: TextStyle(
                color: currentOrder == OrderedBy.preco ? MyColorPalette.darkGreen : Colors.black,
                fontWeight: currentOrder == OrderedBy.preco ? FontWeight.bold : FontWeight.normal,
                fontSize: 15.3,
              )),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              activeColor: MyColorPalette.darkGreen,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: currentOrder,
              value: OrderedBy.preco,
              onChanged:(OrderedBy? value) {
                onSelected(OrderedBy.preco);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ),
            RadioListTile<OrderedBy>(
              title: Text(OrderedBy.classificacao.value, style: TextStyle(
                color: currentOrder == OrderedBy.classificacao ? MyColorPalette.darkGreen : Colors.black,
                fontWeight: currentOrder == OrderedBy.classificacao ? FontWeight.bold : FontWeight.normal,
                fontSize: 15.3,
              )),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              activeColor: MyColorPalette.darkGreen,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: currentOrder,
              value: OrderedBy.classificacao,
              onChanged:(OrderedBy? value) {
                onSelected(OrderedBy.classificacao);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ),

          ],
        ),
      ),
    );
  });
}