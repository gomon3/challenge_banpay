import 'package:dio/dio.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList(int offset, int limit);
  Future<PokemonModel> getPokemonDetails(String name);
  Future<AbilityElementModel> getAbilityDetails(String id);
  Future<TypeModel> getTypeDetails(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio _dio;

  // PokemonRemoteDataSourceImpl(ConfigService configService)
  //     : _dio = Dio(BaseOptions(
  //         baseUrl: configService.getBaseUrl("pokemonService"),
  //         connectTimeout: const Duration(seconds: 10),
  //         receiveTimeout: const Duration(seconds: 10),
  //       )) {
  //   if (configService.isSslEnabled()) {
  //     _setupSSLPinning();
  //   }
  // }

  PokemonRemoteDataSourceImpl(this._dio);


  void _setupSSLPinning() async {
    print('Setting up SSL pinning');
  }

  @override
  Future<List<PokemonModel>> getPokemonList(int offset, int limit) async {
    final response = await _dio.get('pokemon', queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    final models = (response.data['results'] as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
    return models;
  }

  @override
  Future<PokemonModel> getPokemonDetails(String name) async {
    final response = await _dio.get('pokemon/$name');
    final model = PokemonModel.fromJson(response.data['results']);
    return model;
  }

  @override
  Future<AbilityElementModel> getAbilityDetails(String id) async {
    final response = await _dio.get('pokemon/$id');
    final model = AbilityElementModel.fromJson(response.data['results']);
    return model;
  }
  
  @override
  Future<TypeModel> getTypeDetails(String id) async {
    final response = await _dio.get('pokemon/$id');
    final model = TypeModel.fromJson(response.data['results']);
    return model;
  }
}
