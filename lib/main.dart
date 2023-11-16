import 'package:filmpedia/injection_container.dart';
import 'package:filmpedia/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:filmpedia/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:filmpedia/presentation/pages/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FilmPedia App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          child: const PopularMoviesPage(),
        ));
  }
}
