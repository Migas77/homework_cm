import 'package:flutter/material.dart';

import '../mycolors/colors.dart';

class StoreIndicators extends StatelessWidget{

  const StoreIndicators({
    super.key,
    required this.surpriseBagCount,
    required this.isNews
  });

  final int surpriseBagCount;
  final bool isNews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isNews) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 19,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
            ),
            child: const Text('Novidade',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 19,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MyColorPalette.lightYellow,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            '${surpriseBagCount <= 5 ? surpriseBagCount : '5+'} '
                'Surprise Bag${surpriseBagCount > 1 ? 's' : ''}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.5,
              color: MyColorPalette.darkGreen,
            ),
          ),
        ),
      ],
    );
  }

}