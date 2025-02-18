import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetails(String name);
  Future<AbilityElementEntity> getAbilityDetails(String id);
  Future<TypeEntity> getTypeDetails(String id);
  Future<List<PokemonEntity>> getFavorites();
  Future<void> saveFavorite(PokemonEntity pokemon);
  Future<void> removeFavorite(String id);
  Future<void> updateNickname(String id, String nickname);
}