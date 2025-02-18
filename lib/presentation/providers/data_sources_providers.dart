import 'package:challenge_banpay/data/datasources/local/pokemon_source.dart';
import 'package:challenge_banpay/data/datasources/remote/pokemon_source.dart';
import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:challenge_banpay/core/utils/config_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final pokemonBoxProvider = Provider<Box<PokemonModel>>((ref) {
  return Hive.box<PokemonModel>('pokemonBox');
});

final dioProvider = FutureProvider<Dio>((ref) async {
  final configService = ConfigService();
  await configService.loadConfig();

  final dio = Dio(BaseOptions(
    baseUrl: '${configService.getBaseUrl('pokemonService')}/api/v2',
    connectTimeout: const Duration(
        seconds: 10),
    receiveTimeout: const Duration(
        seconds: 10),
  ));

  if (configService.isSslEnabled()) {
    _setupSSLPinning(dio);
  }

  return dio;
});

Future<void> _setupSSLPinning(Dio dio) async {
  print('Setting up SSL pinning');
}

final pokemonRemoteDataSourceProvider =
    Provider<PokemonRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider).value;
  if (dio == null) {
    throw Exception('Dio no ha sido inicializado correctamente');
  }
  return PokemonRemoteDataSourceImpl(dio);
});

final pokemonLocalDataSourceProvider = Provider<PokemonLocalDataSource>((ref) {
  final box = ref.read(pokemonBoxProvider);
  return PokemonLocalDataSourceImpl(box);
});
