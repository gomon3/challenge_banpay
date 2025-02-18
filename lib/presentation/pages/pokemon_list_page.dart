import 'package:challenge_banpay/presentation/pages/pokemon_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';



class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<dynamic> pokemonList = [];
  List<dynamic> filteredList = [];
  int offset = 0;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  Future<void> fetchPokemon() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=20'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        pokemonList.addAll(data['results']);
        filteredList = List.from(pokemonList);
        offset += 20;
        isLoading = false;
      });
    }
  }

  void searchPokemon(String query) {
    setState(() {
      filteredList = pokemonList.where((pokemon) => pokemon['name'].contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(labelText: 'Search Pokémon'),
              onChanged: searchPokemon,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length + 1,
              itemBuilder: (context, index) {
                if (index == filteredList.length) {
                  return isLoading ? Center(child: CircularProgressIndicator()) : SizedBox();
                }
                return ListTile(
                  title: Text(filteredList[index]['name'].toUpperCase()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailPage(name: filteredList[index]['name']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: fetchPokemon,
            child: Text('Load More'),
          ),
        ],
      ),
    );
  }
}