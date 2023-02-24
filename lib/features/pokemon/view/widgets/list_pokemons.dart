import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ListPokemons extends StatelessWidget {
  const ListPokemons({
    super.key,
    required this.pokemons,
  });
  final List<PokeDetail> pokemons;

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty) {
      return const Center(
        child: Text('There is no information'),
      );
    } else {
      return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (_, i) {
          final pokemon = pokemons[i];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                pokemon.name,
              ),
            ),
          );
        },
      );
    }
  }
}
