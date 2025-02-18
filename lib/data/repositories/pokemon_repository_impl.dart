import 'package:challenge_banpay/data/datasources/remote/pokemon_source.dart';
import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:challenge_banpay/domain/repositories/pokemon_repository.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:hive/hive.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final Box<PokemonModel> favoriteBox;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.favoriteBox,
  });

  @override
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit) async {
    final data = await remoteDataSource.getPokemonList(offset, limit);
    final models = (data['results'] as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
    return models;
  }

  @override
  Future<PokemonEntity> getPokemonDetails(String name) async {
    final data = await remoteDataSource.getPokemonDetails(name);
    final model = PokemonModel.fromJson(data['results']);
    return model;
  }

  @override
  Future<void> addFavorite(PokemonEntity pokemon) async {
    await favoriteBox.put(pokemon.id, pokemon as PokemonModel);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await favoriteBox.delete(id);
  }

  @override
  Future<List<PokemonEntity>> getFavoritePokemons() async {
    return favoriteBox.values.toList();
  }
}
