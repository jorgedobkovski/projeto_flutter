import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/Pokemon.dart';
import '../util/PokemonAPI.dart';
import 'PokemonDetailPage.dart';

class PokemonSearchPage extends StatefulWidget {
  @override
  _PokemonSearchPageState createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  List<Pokemon> _pokemons = [];
  final PokemonApi _pokemonApi = PokemonApi();
  final List<Pokemon> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPokemons() async {
    final pokemons = await _pokemonApi.fetchPokemons();
    setState(() {
      _pokemons = pokemons;
    });
  }

  void _searchPokemons(String query) {
    setState(() {
      _searchResults.clear();
      if (query.isNotEmpty) {
        _searchResults.addAll(_pokemons
            .where((pokemon) =>
            pokemon.name.toLowerCase().contains(query.toLowerCase()))
            .toList());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar Pokémon'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _searchPokemons('');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar Pokémon',
              ),
              onChanged: (query) {
                _searchPokemons(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final pokemon = _searchResults[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: pokemon.img,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(pokemon.name),
                  subtitle: Text('Tipo: ${pokemon.type.join(', ')}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailPage(pokemon),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
