import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:flutter/material.dart';
import 'package:challenge_banpay/core/utils/global.dart';
import 'package:challenge_banpay/presentation/pages/pokemon_list_page.dart';

void main() async {
  Global.env = Env.prod;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
