import 'package:dio/dio.dart';
import 'package:challenge_banpay/core/utils/config_service.dart';

class PokemonRemoteDataSource {
  final Dio _dio;

  PokemonRemoteDataSource(ConfigService configService)
      : _dio = Dio(BaseOptions(
          baseUrl: configService.getBaseUrl("pokemonService"),
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )) {
    if (configService.isSslEnabled()) {
      _setupSSLPinning();
    }
  }

  void _setupSSLPinning() async {
    print('Setting up SSL pinning');
  }

  Future<Map<String, dynamic>> getPokemonList(int offset, int limit) async {
    final response = await _dio.get('pokemon', queryParameters: {
      'offset': offset,
      'limit': limit,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> getPokemonDetails(String name) async {
    final response = await _dio.get('pokemon/$name');
    return response.data;
  }

  Future<Map<String, dynamic>> getPokemonTypes() async {
    final response = await _dio.get('type');
    return response.data;
  }
}
