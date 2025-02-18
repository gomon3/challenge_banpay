import 'package:flutter/material.dart';
import 'package:challenge_banpay/core/utils/global.dart';
import 'package:challenge_banpay/presentation/pages/pokemon_list_page.dart';

void main() {
  Global.env = Env.dev;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Pokémon App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonListPage(),
  ));
}
