import '../pokemon.dart';

abstract class PokemonGateway {
  Future<List<PokeDetail>> getPokemons();
}
