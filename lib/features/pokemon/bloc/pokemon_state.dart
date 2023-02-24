part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded({required this.pokemons});
  final List<PokeDetail> pokemons;
  @override
  List<Object?> get props => [pokemons];
}

class PokemonError extends PokemonState {
  const PokemonError({
    required this.message,
  });
  final String message;
  @override
  List<Object?> get props => [message];
}
