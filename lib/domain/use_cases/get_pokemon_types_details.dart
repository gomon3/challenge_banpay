import 'package:challenge_banpay/domain/entities/pokemon_type_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class GetPokemonTypeDetailsUseCase {
  final PokemonRepository repository;

  GetPokemonTypeDetailsUseCase(this.repository);

  Future<PokemonTypeEntity> call(String id) async {
    return await repository.getTypeDetails(id);
  }
}