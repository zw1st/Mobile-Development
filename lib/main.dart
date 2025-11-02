import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_dev/presentation/home_page/bloc/bloc.dart';
import 'package:mobile_dev/presentation/home_page/home_page.dart';
import 'package:mobile_dev/repositories/film_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: RepositoryProvider(
        lazy: true,
        create: (_) => FilmRepository(),
        child: BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(context.read<FilmRepository>()),
          child: const MyHomePage(title: 'Список фильмов'),
        ),
      ),
    );
  }
}
