import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class GetPokemonListUseCase {
  final PokemonRepository repository;

  GetPokemonListUseCase(this.repository);

  Future<List<PokemonEntity>> call(int offset, int limit) async {
    return await repository.getPokemonList(offset, limit);
  }
}