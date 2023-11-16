import 'package:filmpedia/core/server_failure.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String queryMovie);
}
