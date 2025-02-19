import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailsUseCase {
  final PokemonRepository repository;

  GetPokemonDetailsUseCase(this.repository);

  Future<PokemonEntity> call(String id) async {
    return await repository.getPokemonDetails(id);
  }
}