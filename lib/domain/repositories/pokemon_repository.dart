import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';

abstract class PokemonRepository {
  Future<PaginationEntity> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetails(String name);
  Future<PaginationEntity> getTypesList(int offset, int limit);
  Future<AbilityElementEntity> getAbilityDetails(String id);
  Future<TypeEntity> getTypeDetails(String id);
  Future<List<PokemonEntity>> getFavorites();
  Future<void> saveFavorite(PokemonEntity pokemon);
  Future<void> removeFavorite(String id);
  Future<void> updateNickname(String id, String nickname);
}