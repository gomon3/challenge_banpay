import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge_banpay/presentation/providers/pokemon_providers.dart';

class PokemonListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(pokemonRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      body: FutureBuilder<List<PokemonEntity>>(
        future: repository.getPokemonList(0, 20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ListTile(
                  title: Text(pokemon.name),
                  onTap: () {
                    // Navegar a la vista de detalle
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}