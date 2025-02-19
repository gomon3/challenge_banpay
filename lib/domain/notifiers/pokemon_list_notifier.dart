import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemons.dart';

class PokemonListNotifier
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
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
      final newPokemonList = (newData['results'] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();
      final currentState = state;

      if (currentState is AsyncData<List<Map<String, dynamic>>>) {
        state = AsyncValue.data([...currentState.value, ...newPokemonList]);
      } else {
        state = AsyncValue.data(newPokemonList);
      }

      offset += limit;
      hasMore = newData['next'] != null;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      isLoading = false;
    }
  }
}
