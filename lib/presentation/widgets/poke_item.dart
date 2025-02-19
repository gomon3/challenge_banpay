import 'package:flutter/material.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key, required this.item, required this.press});

  final Map item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: const Color(0xFF3D82AE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: item['url'],
                child: Image.asset('assets/images/bag_1.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              item['name'],
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            item['url'],
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}