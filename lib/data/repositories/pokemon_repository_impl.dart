import 'package:challenge_banpay/data/datasources/local/pokemon_source.dart';
import 'package:challenge_banpay/data/datasources/remote/pokemon_source.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _remoteDataSource;
  final PokemonLocalDataSource _localDataSource;

  PokemonRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource);

  @override
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit) async {
    return await _remoteDataSource.getPokemonList(offset, limit);
  }

  @override
  Future<PokemonEntity> getPokemonDetails(String name) async {
    return await _remoteDataSource.getPokemonDetails(name);
  }
  
  @override
  Future<AbilityElementEntity> getAbilityDetails(String id) async {
    return await _remoteDataSource.getAbilityDetails(id);
  }

  @override
  Future<TypeEntity> getTypeDetails(String id) async {
    return await _remoteDataSource.getTypeDetails(id);
  }
  
  @override
  Future<List<PokemonEntity>> getFavorites() async {
    return await _localDataSource.getFavorites();
  }
  
  @override
  Future<void> removeFavorite(String id) async {
    return await _localDataSource.removeFavorite(id);
  }
  
  @override
  Future<void> saveFavorite(PokemonEntity pokemon) async {
    return await _localDataSource.saveFavorite(pokemon as PokemonModel);
  }
  
  @override
  Future<void> updateNickname(String id, String nickname) async {
    return await _localDataSource.updateNickname(id, nickname);
  }
}
