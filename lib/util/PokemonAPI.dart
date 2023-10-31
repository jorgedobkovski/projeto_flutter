import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Pokemon.dart';

class PokemonApi {
  final String apiUrl = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['pokemon'];
      return data.map((pokemonData) => Pokemon.fromJson(pokemonData)).toList();
    } else {
      throw Exception('Falha ao carregar os Pokémon');
    }
  }
}
