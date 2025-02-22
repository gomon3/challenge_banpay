import 'package:challenge_banpay/domain/notifiers/pokemon_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge_banpay/presentation/providers/data_sources_providers.dart';

import 'package:challenge_banpay/data/repositories/pokemon_repository_impl.dart';
import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemons.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemon_details.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemon_types.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemon_types_details.dart';
import 'package:challenge_banpay/domain/use_cases/get_pokemon_ability_details.dart';


final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final remoteDataSource = ref.read(pokemonRemoteDataSourceProvider);
  final localDataSource = ref.read(pokemonLocalDataSourceProvider);
  return PokemonRepositoryImpl(remoteDataSource, localDataSource);
});


final getPokemonListUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonListUseCase(repository);
});

final getPokemonDetailsUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonDetailsUseCase(repository);
});

final getPokemonTypesListUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonTypesListUseCase(repository);
});

final getPokemonTypeeDetailsUseCaseProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonTypeDetailsUseCase(repository);
});

final getPokemonAbilityDetailsProvider = Provider((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemonAbilityDetails(repository);
});

final pokemonListNotifierProvider = StateNotifierProvider<PokemonListNotifier, AsyncValue<List<ResultEntity>>>((ref) {
  final getPokemonListUseCase = ref.read(getPokemonListUseCaseProvider);
  return PokemonListNotifier(getPokemonListUseCase);
});