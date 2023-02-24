import 'package:clean_arch/features/home/view/home_view.dart';
import 'package:clean_arch/features/pokemon/view/pokemon_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static get routes => <String, WidgetBuilder>{
        home: (_) => const HomeView(),
        pokemon: (_) => const PokemonView(),
      };

  static const home = 'home';
  static const pokemon = 'pokemon';
}
