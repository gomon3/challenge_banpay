import 'package:challenge_banpay/data/datasources/local/pokemon_source.dart';
import 'package:challenge_banpay/data/datasources/remote/pokemon_source.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit) async {
    return await remoteDataSource.getPokemonList(offset, limit);
  }

  @override
  Future<PokemonEntity> getPokemonDetails(String name) async {
    return await remoteDataSource.getPokemonDetails(name);
  }
  
  @override
  Future<AbilityElementEntity> getAbilityDetails(String id) async {
    return await remoteDataSource.getAbilityDetails(id);
  }

  @override
  Future<TypeEntity> getTypeDetails(String id) async {
    return await remoteDataSource.getTypeDetails(id);
  }
  
  @override
  Future<List<PokemonEntity>> getFavorites() async {
    return await localDataSource.getFavorites();
  }
  
  @override
  Future<void> removeFavorite(String id) async {
    return await localDataSource.removeFavorite(id);
  }
  
  @override
  Future<void> saveFavorite(PokemonEntity pokemon) async {
    return await localDataSource.saveFavorite(pokemon);
  }
  
  @override
  Future<void> updateNickname(String id, String nickname) async {
    return await localDataSource.updateNickname(id, nickname);
  }
}
