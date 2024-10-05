import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/providers/stock_stores_state.dart';
import 'package:too_good_to_go_clone/screens/stores_list.dart';
import 'package:too_good_to_go_clone/screens/search_screen_map.dart';
import 'package:too_good_to_go_clone/widgets/search_bar.dart';

import '../mycolors/colors.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({
    super.key, 
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum OrderedBy { relevancia, distancia, preco, classificacao }

class _SearchScreenState extends State<SearchScreen> {
  bool isMap = false;
  OrderedBy _orderBy = OrderedBy.relevancia;

  @override
  Widget build(BuildContext context){
    StockStoresState stockStoresState = context.watch<StockStoresState>();

    List<Widget> children = [
      if (isMap)
        SearchScreenMap(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: Colors.white.withOpacity(0.7),
            child: Column(
              children: [
                const SizedBox(height: 13),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(child: MySearchBar()),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 37,
                      width: 37,
                      child: IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.tune_outlined,
                          color: MyColorPalette.darkGreen,
                          size: 20,
                        ),
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          backgroundColor: Colors.white,
                        ),

                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 37,
                      width: 37,
                      child: IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: MyColorPalette.darkGreen,
                          size: 20,
                        ),
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 16),
                AnimatedToggleSwitch<bool>.size(
                  height: 37,
                  current: isMap,
                  values: const [false, true],
                  iconOpacity: 1,
                  indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  customIconBuilder: (context, local, global) => Text(
                      local.value ? 'Mapa' : 'Lista',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.lerp(
                          MyColorPalette.darkGreen, Colors.white, local.animationValue)
                        )),
                  iconAnimationType: AnimationType.onHover,
                  style: ToggleStyle(
                    indicatorColor: MyColorPalette.darkGreen,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                  ),
                  selectedIconScale: 1.0,
                  onChanged: (b) => setState(() => isMap = b),
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (!isMap)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
                              color: MyColorPalette.darkGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: GestureDetector(
                              onTap: () => print('Icon clicked'),
                              child: const Icon(Icons.keyboard_arrow_down, size: 20, color: MyColorPalette.darkGreen),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
        ],
      ),
      if (!isMap)
        Expanded(child: StoresList(stores: stockStoresState.stores))
    ];

    return isMap ? Stack(children: children) : Column(children: children);
  }
}