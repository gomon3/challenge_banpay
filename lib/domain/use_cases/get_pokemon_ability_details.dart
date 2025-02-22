import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';
import 'package:challenge_banpay/domain/entities/pokemon_ability_entity.dart';

class GetPokemonAbilityDetails {
  final PokemonRepository repository;

  GetPokemonAbilityDetails(this.repository);

  Future<AbilityEntity> call(String id) async {
    return await repository.getAbilityDetails(id);
  }
}