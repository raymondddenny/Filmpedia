import 'package:dartz/dartz.dart';
import 'package:filmpedia/core/server_failure.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:filmpedia/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository movieRepository;
  SearchMovies({required this.movieRepository});

  Future<Either<Failure, List<Movie>>> call(String queryMovie) async {
    return await movieRepository.searchMovies(queryMovie);
  }
}
