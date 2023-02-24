import 'dart:async';

import '../../models/pokemon/gateway/pokemon_gateway.dart';
import '../../models/pokemon/pokemon.dart';

class PokemonUseCase {
  const PokemonUseCase(this._pokemonGateway);
  final PokemonGateway _pokemonGateway;

  Future<List<PokeDetail>> getAllPokemons() => _pokemonGateway.getPokemons();
}
