import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class GetPokemonTypesListUseCase {
  final PokemonRepository repository;

  GetPokemonTypesListUseCase(this.repository);

  Future<PaginationEntity> call(int offset, int limit) async {
    return await repository.getTypesList(offset, limit);
  }
}