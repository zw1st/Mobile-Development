import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_dev/components/locale/l10n/app_locale_en.dart';
import 'package:mobile_dev/presentation/home_page/bloc/bloc.dart';
import 'package:mobile_dev/presentation/home_page/home_page.dart';
import 'package:mobile_dev/presentation/like_bloc/like_bloc.dart';
import 'package:mobile_dev/presentation/locale_bloc/locale_bloc.dart';
import 'package:mobile_dev/presentation/locale_bloc/locale_state.dart';
import 'package:mobile_dev/repositories/film_repository.dart';

import 'components/locale/l10n/app_locale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => LocaleBloc(Locale(Platform.localeName)),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            locale: state.currentLocale,
            localizationsDelegates: AppLocale.localizationsDelegates,
            supportedLocales: AppLocale.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
            ),
            home: RepositoryProvider(
              lazy: true,
              create: (_) => FilmRepository(),
              child: BlocProvider<LikeBloc>(
                lazy: false,
                create: (context) => LikeBloc(),
                child: BlocProvider<HomeBloc>(
                  lazy: false,
                  create: (context) => HomeBloc(context.read<FilmRepository>()),
                  child: const MyHomePage(title: "Фильмы"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
