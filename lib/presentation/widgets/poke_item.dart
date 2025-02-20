import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key, required this.item, required this.press});

  final PokemonEntity item;
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
                color: const Color(0xFFD3A984),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: '${item.id}',
                child: CachedNetworkImage(
                  imageUrl: item.smallImageSrc,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              item.name.toUpperCase(),
              style: const TextStyle(color: kTextLightColor, ),
            ),
          ),
          Text(
            item.nickname ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
