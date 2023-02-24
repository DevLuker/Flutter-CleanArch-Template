import 'package:clean_arch/config/routes/app_routes.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infraestructure/infraestructure.dart';
part '../config/dependencies/dependencies_dev.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => pokemonGateway),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poke Clean Architecture',
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
