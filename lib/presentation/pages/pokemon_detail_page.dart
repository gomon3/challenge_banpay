import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PokemonDetailPage extends StatefulWidget {
  final String name;
  PokemonDetailPage({required this.name});
  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  Map<String, dynamic>? pokemonData;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    fetchPokemonDetails();
    checkFavoriteStatus();
  }

  Future<void> fetchPokemonDetails() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.name}'));
    if (response.statusCode == 200) {
      setState(() {
        pokemonData = json.decode(response.body);
      });
    }
  }

  Future<void> checkFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.name) ?? false;
    });
  }

  Future<void> toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.name, isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name.toUpperCase())),
      body: pokemonData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Image.network(pokemonData!['sprites']['front_default']),
                Text('Height: ${pokemonData!['height']}'),
                Text('Weight: ${pokemonData!['weight']}'),
                Text('Base Experience: ${pokemonData!['base_experience']}'),
                Text('Abilities:'),
                Column(
                  children: (pokemonData!['abilities'] as List)
                      .map((e) => Text(e['ability']['name']))
                      .toList(),
                ),
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: toggleFavorite,
                ),
              ],
            ),
    );
  }
}