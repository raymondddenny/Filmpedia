// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  const MovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
        return ListTile(
          leading: Image.network(
            '$imageBaseUrl${movie.posterPath}',
            width: 100,
            fit: BoxFit.cover,
          ),
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          onTap: () {},
        );
      },
    );
  }
}
