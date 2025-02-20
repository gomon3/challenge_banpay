import 'package:dio/dio.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<Map<String, dynamic>> getPokemonList(int offset, int limit);
  Future<PokemonModel> getPokemonDetails(String name);
  Future<Map<String, dynamic>> getTypesList(int offset, int limit);
  Future<AbilityElementModel> getAbilityDetails(String id);
  Future<TypeModel> getTypeDetails(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio _dio;
  final String pokemon = '/pokemon';
  final String ability = '/ability';
  final String type = '/type';

  PokemonRemoteDataSourceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> getPokemonList(int offset, int limit) async {
    final response = await _dio.get(pokemon, queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    return response.data;
  }

  @override
  Future<PokemonModel> getPokemonDetails(String id) async {
    final response = await _dio.get('$pokemon/$id');
    final model = PokemonModel.fromJson(response.data);
    return model;
  }

  @override
  Future<Map<String, dynamic>> getTypesList(int offset, int limit) async {
    final response = await _dio.get(type, queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    return response.data;
  }

  @override
  Future<AbilityElementModel> getAbilityDetails(String id) async {
    final response = await _dio.get('$ability/$id');
    final model = AbilityElementModel.fromJson(response.data['results']);
    return model;
  }

  @override
  Future<TypeModel> getTypeDetails(String id) async {
    final response = await _dio.get('$type/$id');
    final model = TypeModel.fromJson(response.data['results']);
    return model;
  }
}
