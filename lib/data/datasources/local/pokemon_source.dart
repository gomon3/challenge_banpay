import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:hive/hive.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonModel>> getFavorites();
  Future<void> saveFavorite(PokemonModel pokemon);
  Future<void> removeFavorite(String id);
  Future<void> updateNickname(String id, String nickname);
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final Box<PokemonModel> _box;

  PokemonLocalDataSourceImpl()
    : _box = Hive.box<PokemonModel>('favorites');

  @override
  Future<void> saveFavorite(PokemonModel pokemon) async {
    await _box.put(pokemon.id, pokemon);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await _box.delete(id);
  }

  @override
  Future<List<PokemonModel>> getFavorites() async {
    return _box.values.toList();
  }
  
  @override
  Future<void> updateNickname(String id, String nickname) async {
    final pokemon = _box.get(id);
    pokemon!.nickname = nickname;
    return await _box.put(id, pokemon);
  }
}