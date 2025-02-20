import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:challenge_banpay/presentation/providers/pokemon_providers.dart';
import 'package:challenge_banpay/core/constants/rules.dart';
import 'package:challenge_banpay/domain/entities/pokemon_type_entity.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  final int offset = 0;
  final int limit = 30; // No existen más de 30 tipos de pokemones
  List<PokemonTypeEntity> categories = [];
  
  // By default no category is selected
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _getTypesList();
  }

  Future<void> _getTypesList() async {
    final getTypesListUseCase = ref.read(getPokemonTypesListUseCaseProvider);
    final getTypesDetailsUseCase = ref.read(getPokemonTypeeDetailsUseCaseProvider);

    final typesList = await getTypesListUseCase.call(offset, limit);
    for (final type in typesList.results!) {
      final typeId = extractRequestId(type.url!);
      final typeDetails = await getTypesDetailsUseCase.call(typeId);
      categories.add(typeDetails);
    }
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedIndex == index) {
            selectedIndex = -1;
            ref.read(pokemonListNotifierProvider.notifier).resetToPagination();
          } else {
            selectedIndex = index;
            ref.read(pokemonListNotifierProvider.notifier)
               .replaceWithNewList(categories[index].pokemon);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _getNameByLanguage(categories[index], 'es'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: kDefaultPaddin / 8,
              ), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  String _getNameByLanguage(PokemonTypeEntity type, String language) {
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
