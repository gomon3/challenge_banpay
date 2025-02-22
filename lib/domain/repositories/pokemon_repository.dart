import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';
import 'package:challenge_banpay/domain/entities/pokemon_type_entity.dart' as type;
import 'package:challenge_banpay/data/models/pokemon_ability_model.dart';

abstract class PokemonRepository {
  Future<PaginationEntity> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetails(String name);
  Future<PaginationEntity> getTypesList(int offset, int limit);
  Future<type.PokemonTypeEntity> getTypeDetails(String id);
  Future<AbilityModel> getAbilityDetails(String id);
  Future<List<PokemonEntity>> getFavorites();
  Future<void> saveFavorite(PokemonEntity pokemon);
  Future<void> removeFavorite(String id);
  Future<void> updateNickname(String id, String nickname);
}