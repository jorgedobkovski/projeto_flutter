import 'package:flutter/material.dart';
import 'package:projeto_simples_em_flutter/views/PokemonSearchPage.dart';
import '../models/Pokemon.dart';
import '../util/PokemonAPI.dart';
import 'PokemonDetailPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<Pokedex> {
  final PokemonApi _pokemonApi = PokemonApi();
  List<Pokemon> _pokemons = [];
  final List<String> _filterOptions = ['All', 'Grass', 'Fire', 'Water'];
  String _selectedFilter = 'All';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    final pokemons = await _pokemonApi.fetchPokemons();
    setState(() {
      _pokemons = pokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list),
            onSelected: (value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return _filterOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = _pokemons[index];

          if (_selectedFilter != 'All' &&
              !pokemon.type.contains(_selectedFilter)) {
            return Container();
          }

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonSearchPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
