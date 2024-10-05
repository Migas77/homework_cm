import 'package:flutter/material.dart';

enum OrderedBy { relevancia, distancia, preco, classificacao }

void showOrderByBottomModalSheet(BuildContext context, OrderedBy currentOrder, Function(OrderedBy) onSelected){
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
                title: const Text('Relevância'),
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: currentOrder,
                value: OrderedBy.relevancia,
                onChanged:(OrderedBy? value) {
                  onSelected(OrderedBy.relevancia);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              ),
              RadioListTile<OrderedBy>(
                title: const Text('Distância'),
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: currentOrder,
                value: OrderedBy.distancia,
                onChanged:(OrderedBy? value) {
                  onSelected(OrderedBy.distancia);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              ),
              RadioListTile<OrderedBy>(
                title: const Text('Preço'),
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: currentOrder,
                value: OrderedBy.preco,
                onChanged:(OrderedBy? value) {
                  onSelected(OrderedBy.preco);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              ),
              RadioListTile<OrderedBy>(
                title: const Text('Classificação'),
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
      ),
    );
  });
}