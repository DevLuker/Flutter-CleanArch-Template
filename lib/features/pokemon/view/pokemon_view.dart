import 'package:clean_arch/features/pokemon/bloc/pokemon_bloc.dart';
import 'package:clean_arch/features/pokemon/view/widgets/widgets.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (_) => PokemonBloc(
        context.read<PokemonUseCase>(),
      )..add(GetAllPokemons()),
      child: const PokemonPageBody(),
    );
  }
}

class PokemonPageBody extends StatelessWidget {
  const PokemonPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Pokemon'),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoaded) {
            return ListPokemons(pokemons: state.pokemons);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoaded) {
            return BottomNavigator(
              color: Colors.blue,
              onTap: () => context.read<PokemonBloc>().add(GetAllPokemons()),
            );
          }
          return const BottomNavigator(color: Colors.grey, onTap: null);
        },
      ),
    );
  }
}
