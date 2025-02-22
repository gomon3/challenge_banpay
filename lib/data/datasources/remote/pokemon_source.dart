import 'package:dio/dio.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:challenge_banpay/data/models/pokemon_pagination_model.dart';
import 'package:challenge_banpay/data/models/pokemon_type_model.dart' as pokemon_type;
import 'package:challenge_banpay/data/models/pokemon_ability_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PaginationModel> getPokemonList(int offset, int limit);
  Future<PokemonModel> getPokemonDetails(String name);
  Future<PaginationModel> getTypesList(int offset, int limit);
  Future<pokemon_type.PokemonTypeModel> getTypeDetails(String id);
  Future<AbilityModel> getAbilityDetails(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio _dio;
  final String pokemon = '/pokemon';
  final String ability = '/ability';
  final String type = '/type';

  PokemonRemoteDataSourceImpl(this._dio);

  @override
  Future<PaginationModel> getPokemonList(int offset, int limit) async {
    final response = await _dio.get(pokemon, queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    final model = PaginationModel.fromJson(response.data);
    return model;
  }

  @override
  Future<PokemonModel> getPokemonDetails(String id) async {
    final response = await _dio.get('$pokemon/$id');
    return PokemonModel.fromJson(response.data);
  }

  @override
  Future<PaginationModel> getTypesList(int offset, int limit) async {
    final response = await _dio.get(type, queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    return PaginationModel.fromJson(response.data);
  }

  @override
  Future<pokemon_type.PokemonTypeModel> getTypeDetails(String id) async {
    final response = await _dio.get('$type/$id');
    final model = pokemon_type.PokemonTypeModel.fromJson(response.data);
    return model;
  }

  @override
  Future<AbilityModel> getAbilityDetails(String id) async {
    final response = await _dio.get('$ability/$id');
    final model = AbilityModel.fromJson(response.data);
    return model;
  }
}
