import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge_banpay/presentation/providers/data_sources_providers.dart';

import 'package:challenge_banpay/data/repositories/pokemon_repository_impl.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemons.dart';

// import 'package:challenge_banpay/domain/usecases/add_favorite_pokemon_usecase.dart';
// import 'package:challenge_banpay/domain/usecases/get_favorite_pokemons_usecase.dart';
// import 'package:challenge_banpay/domain/usecases/remove_favorite_pokemon_usecase.dart';


final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final remoteDataSource = ref.read(pokemonRemoteDataSourceProvider);
  final localDataSource = ref.read(pokemonLocalDataSourceProvider);
  return PokemonRepositoryImpl(remoteDataSource, localDataSource);
});

// Providers para los UseCases
final getPokemonListUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonListUseCase(repository);
});

// final addFavoritePokemonUseCaseProvider = Provider((ref) {
//   final repository = ref.read(pokemonRepositoryProvider);
//   return AddFavoritePokemonUseCase(repository);
// });

// final getFavoritePokemonsUseCaseProvider = Provider((ref) {
//   final repository = ref.read(pokemonRepositoryProvider);
//   return GetFavoritePokemonsUseCase(repository);
// });

// final removeFavoritePokemonUseCaseProvider = Provider((ref) {
//   final repository = ref.read(pokemonRepositoryProvider);
//   return RemoveFavoritePokemonUseCase(repository);
// });