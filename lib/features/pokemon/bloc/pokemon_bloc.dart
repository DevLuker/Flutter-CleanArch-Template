// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc(this._pokemonUseCase) : super(PokemonInitial()) {
    on<GetAllPokemons>(_onGetAllPokemons);
  }

  final PokemonUseCase _pokemonUseCase;

  Future<void> _onGetAllPokemons(
    GetAllPokemons event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      emit(PokemonLoading());
      final response = await _pokemonUseCase.getAllPokemons();
      emit(PokemonLoaded(pokemons: response));
    } catch (e) {
      emit(const PokemonError(message: 'An error occurred'));
    }
  }
}
