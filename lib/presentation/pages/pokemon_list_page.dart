import 'package:challenge_banpay/core/constants/rules.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/presentation/widgets/poke_item.dart';
import 'package:challenge_banpay/presentation/widgets/poke_types.dart';
import 'package:flutter_svg/svg.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:challenge_banpay/presentation/providers/pokemon_providers.dart';
import 'package:challenge_banpay/presentation/providers/data_sources_providers.dart';
import 'package:challenge_banpay/presentation/pages/pokemon_detail_page.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryAsync = ref.watch(dioProvider);

    return Scaffold(
      appBar: _getAppBart(),
      body: repositoryAsync.when(
        data: (repository) {
          final pokemonListAsync = ref.watch(pokemonListNotifierProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Text(
                  "Pokédex",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Categories(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: pokemonListAsync.when(
                    data: (pokemonList) {
                      final getPokemonDetailsUseCase =
                          ref.read(getPokemonDetailsUseCaseProvider);

                      return NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            ref
                                .read(pokemonListNotifierProvider.notifier)
                                .loadMore();
                          }
                          return true;
                        },
                        child: GridView.builder(
                            itemCount: pokemonList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: kDefaultPaddin,
                              crossAxisSpacing: kDefaultPaddin,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                FutureBuilder<PokemonEntity>(
                                    future: getPokemonDetailsUseCase.call(
                                        extractRequestId(
                                            pokemonList[index].url!)),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text(
                                                'Error: ${snapshot.error}'));
                                      } else {
                                        final pokemon = snapshot.data!;
                                        return PokeCard(
                                          item: pokemon,
                                          press: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PokemonDetailPage(
                                                pokemon: pokemon,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    })),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Center(
                        child:
                            Text('Error aver: $error + ${stack.toString()}')),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  AppBar _getAppBart() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
