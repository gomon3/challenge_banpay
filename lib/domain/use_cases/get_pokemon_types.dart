import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class GetPokemonTypesListUseCase {
  final PokemonRepository repository;

  GetPokemonTypesListUseCase(this.repository);

  Future<Map<String, dynamic>> call(int offset, int limit) async {
    return await repository.getTypesList(offset, limit);
  }
}