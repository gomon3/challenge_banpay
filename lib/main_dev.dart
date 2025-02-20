import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/core/utils/global.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:challenge_banpay/core/utils/config_service.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:challenge_banpay/data/models/pokemon_model.dart';
import 'package:challenge_banpay/presentation/pages/pokemon_list_page.dart';

void main() async {
  Global.env = Env.dev;
  WidgetsFlutterBinding.ensureInitialized();
  
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(PokemonModelAdapter());
  await Hive.openBox<PokemonModel>('pokemonBox');

  await ConfigService().loadConfig();

  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokémon App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PokemonListPage(),
    );
  }
}
