import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:challenge_banpay/presentation/widgets/color_dot.dart';
import 'package:challenge_banpay/presentation/providers/pokemon_providers.dart';
import 'package:challenge_banpay/domain/entities/pokemon_ability_entity.dart';

class ColorAndSize extends ConsumerWidget {
  const ColorAndSize({super.key, required this.pokemon});

  final PokemonEntity pokemon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getPokemonAbilityDetails = ref.read(getPokemonAbilityDetailsProvider);
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Habilidades"),
                  FutureBuilder<List<AbilityEntity>>(
                      future: _getAbilities(
                          pokemon.abilities, getPokemonAbilityDetails),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final abilities = snapshot.data!;
                          final List<Widget> abilitiesWig = [];

                          final List<Color> colors = [
                            const Color(0xFF356C95),
                            const Color(0xFFF8C078),
                            const Color(0xFFA29B9B),
                          ];

                          for (int i = 0; i < abilities.length; i++) {
                            abilitiesWig.add(ColorDot(
                                color: colors[i % colors.length],
                                text: _getNameByLanguage(abilities[i], 'es')));
                          }
                          return Row(children: abilitiesWig);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPaddin / 2),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: kTextColor),
                      children: [
                        const TextSpan(text: "Peso y altura\n"),
                        TextSpan(
                          text: "${pokemon.height / 10} kg",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: "  x  "),
                        TextSpan(
                          text: "${pokemon.weight / 10} cm",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<List<AbilityEntity>> _getAbilities(
      List<AbilityElementEntity> pokemonAbilities, refProv) async {
    final List<AbilityEntity> abilities = [];
    for (final abi in pokemonAbilities) {
      abilities.add(await refProv.call(abi.ability.name));
    }
    return abilities;
  }

  String _getNameByLanguage(AbilityEntity type, String language) {
    //WTF: _TypeError (type '() => NameEntity' is not a subtype of type '(() => NameModel)?' of 'orElse')
    try {
      final name = type.names.firstWhere(
        (element) => element.language.name == language,
      );
      return name.name;
    } catch (e) {
      final name = type.names.firstWhere(
        (element) => element.language.name == 'en',
      );
      return name.name;
    }
  }
}
