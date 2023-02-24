import 'package:domain/domain.dart';

final dataMockPokemons = [
  PokeDetail(name: 'Pokemon 1', url: ''),
  PokeDetail(name: 'Pokemon 2', url: ''),
  PokeDetail(name: 'Pokemon 3', url: ''),
];

class PokemonLocal extends PokemonGateway {
  @override
  Future<List<PokeDetail>> getPokemons() async {
    await Future.delayed(const Duration(seconds: 2));
    return dataMockPokemons;
  }
}
