import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetails(String name);
  Future<void> addFavorite(PokemonEntity pokemon);
  Future<void> removeFavorite(String id);
  Future<List<PokemonEntity>> getFavoritePokemons();
}