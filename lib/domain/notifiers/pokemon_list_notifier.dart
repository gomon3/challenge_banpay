import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';
import 'package:challenge_banpay/domain/entities/pokemon_type_entity.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemons.dart';

class PokemonListNotifier extends StateNotifier<AsyncValue<List<ResultEntity>>> {
  final GetPokemonListUseCase getPokemonListUseCase;
  
  int offset = 0;
  final int limit = 10;
  bool hasMore = true;
  bool isLoading = false;

  PokemonListNotifier(this.getPokemonListUseCase)
      : super(const AsyncValue.loading()) {
    loadMore();
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoading) return;

    isLoading = true;

    try {
      final newData = await getPokemonListUseCase.call(offset, limit);
      final newPokemonList = newData.results ?? [];
      final currentState = state;

      if (currentState is AsyncData<List<ResultEntity>>) {
        state = AsyncValue.data([...currentState.value, ...newPokemonList]);
      } else {
        state = AsyncValue.data(newPokemonList);
      }

      offset += limit;
      hasMore = newData.next != null;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isLoading = false;
    }
  }

  void replaceWithNewList(List<PokemonEntity> pokemonEntityList) {
    final newList = <ResultEntity>[];
    for (final pokemon in pokemonEntityList) {
      newList.add(ResultEntity(
        name: pokemon.pokemon.name,
        url: pokemon.pokemon.url,
      ));
    }
    state = AsyncValue.data(newList);
    offset = 0;
    hasMore = false;
  }

  void resetToPagination() {
    state = const AsyncValue.loading();
    offset = 0;
    hasMore = true;
    loadMore();
  }
}
