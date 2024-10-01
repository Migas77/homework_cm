import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/rendering.dart';
import 'package:too_good_to_go_clone/widgets/big_store_card.dart';

import '../data/stores.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({
    super.key, 
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum OrderedBy { relevancia, distancia, preco, classificacao }

class _SearchScreenState extends State<SearchScreen> {
  bool positive = false;
  OrderedBy _orderBy = OrderedBy.relevancia;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchBar(
                  padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                  leading: Icon(Icons.search),
              ),
              const SizedBox(height: 10),
              AnimatedToggleSwitch<bool>.size(
                current: positive,
                values: const [false, true],
                iconOpacity: 0.2,
                indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width),
                customIconBuilder: (context, local, global) => Text(
                    local.value ? 'Mapa' : 'Lista',
                    style: TextStyle(
                        color: Color.lerp(
                            Colors.black, Colors.white, local.animationValue))),
                borderWidth: 4.0,
                iconAnimationType: AnimationType.onHover,
                style: ToggleStyle(
                  indicatorColor: Colors.teal,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                selectedIconScale: 1.0,
                onChanged: (b) => setState(() => positive = b),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "Ordenar por: ", style: TextStyle(
                          color: Colors.black
                        )),
                        TextSpan(
                          text: "Relevância ",
                          recognizer: TapGestureRecognizer()..onTap = () {
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
                                          groupValue: _orderBy,
                                          value: OrderedBy.relevancia,
                                          onChanged:(OrderedBy? value) { setState(() {
                                            _orderBy = OrderedBy.relevancia;
                                          });},
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                        ),
                                        RadioListTile<OrderedBy>(
                                          title: const Text('Distância'),
                                          controlAffinity: ListTileControlAffinity.trailing,
                                          groupValue: _orderBy,
                                          value: OrderedBy.distancia,
                                          onChanged:(OrderedBy? value) { setState(() {
                                            _orderBy = OrderedBy.distancia;
                                          });},
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                        ),
                                        RadioListTile<OrderedBy>(
                                          title: const Text('Preço'),
                                          controlAffinity: ListTileControlAffinity.trailing,
                                          groupValue: _orderBy,
                                          value: OrderedBy.preco,
                                          onChanged:(OrderedBy? value) { setState(() {
                                            _orderBy = OrderedBy.preco;
                                          });},
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                        ),
                                        RadioListTile<OrderedBy>(
                                          title: const Text('Classificação'),
                                          controlAffinity: ListTileControlAffinity.trailing,
                                          groupValue: _orderBy,
                                          value: OrderedBy.classificacao,
                                          onChanged:(OrderedBy? value) { setState(() {
                                            _orderBy = OrderedBy.classificacao;
                                          });},
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          style: const TextStyle(
                            color: Color.fromARGB(255, 70, 2, 187),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () => print('Icon clicked'),
                            child: const Icon(Icons.keyboard_arrow_down, size: 20, color: Color.fromARGB(255, 70, 2, 187)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (BuildContext context, int index) {
                return BigStoreCard(store: stores[index]);
              }
            )
          )
        ],
      ),
    );
  }
}