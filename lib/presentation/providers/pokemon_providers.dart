import 'package:challenge_banpay/domain/notifiers/pokemon_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge_banpay/presentation/providers/data_sources_providers.dart';

import 'package:challenge_banpay/data/repositories/pokemon_repository_impl.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemons.dart';


final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final remoteDataSource = ref.read(pokemonRemoteDataSourceProvider);
  final localDataSource = ref.read(pokemonLocalDataSourceProvider);
  return PokemonRepositoryImpl(remoteDataSource, localDataSource);
});


final getPokemonListUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonListUseCase(repository);
});

final pokemonListNotifierProvider = StateNotifierProvider<PokemonListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final getPokemonListUseCase = ref.read(getPokemonListUseCaseProvider);
  return PokemonListNotifier(getPokemonListUseCase);
});