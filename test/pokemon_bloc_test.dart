import 'package:clean_arch/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:domain/domain.dart';
import 'package:infraestructure/driven_adapter/local/local.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';

class MockPokemonUseCase extends Mock implements PokemonUseCase {}

void main() {
  late PokemonUseCase pokemonUseCase;
  setUp(() => pokemonUseCase = MockPokemonUseCase());

  group(
    "Pokemon BLOC",
    () {
      blocTest<PokemonBloc, PokemonState>(
        'emits [PokemonLoaded] when GetAllPokemons is added.',
        setUp: () {
          when(() => pokemonUseCase.getAllPokemons())
              .thenAnswer((_) async => dataMockPokemons);
        },
        build: () => PokemonBloc(pokemonUseCase),
        act: (bloc) => bloc.add(GetAllPokemons()),
        expect: () => <PokemonState>[
          PokemonLoading(),
          PokemonLoaded(pokemons: dataMockPokemons),
        ],
      );

      blocTest<PokemonBloc, PokemonState>(
        'emits [PokemonError] when GetAllPokemons is added.',
        setUp: () {
          when(() => pokemonUseCase.getAllPokemons())
              .thenThrow('An error occurred');
        },
        build: () => PokemonBloc(pokemonUseCase),
        act: (bloc) => bloc.add(GetAllPokemons()),
        expect: () => <PokemonState>[
          PokemonLoading(),
          const PokemonError(message: 'An error occurred'),
        ],
      );
    },
  );
}
