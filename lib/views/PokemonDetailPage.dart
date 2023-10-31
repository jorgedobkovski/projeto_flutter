import 'package:flutter/material.dart';
import '../models/Pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: pokemon.img,
              width: 200,
              height: 200,
            ),
            Text('Número: ${pokemon.num}'),
            Text('Tipo: ${pokemon.type.join(', ')}'),
            Text('Altura: ${pokemon.height}'),
            Text('Peso: ${pokemon.weight}'),
            Text('Doce: ${pokemon.candy}'),
            Text('Contagem de Doces: ${pokemon.candyCount}'),
            Text('Ovo: ${pokemon.egg}'),
            Text('Chance de Spawn: ${pokemon.spawnChance}'),
            Text('Média de Spawns: ${pokemon.avgSpawns}'),
            Text('Tempo de Spawn: ${pokemon.spawnTime}'),
            Text('Multiplicadores: ${pokemon.multipliers.join(', ')}'),
            Text('Fraquezas: ${pokemon.weaknesses.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
