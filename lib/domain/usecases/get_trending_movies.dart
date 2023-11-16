import 'package:dartz/dartz.dart';
import 'package:filmpedia/core/server_failure.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:filmpedia/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository movieRepository;
  GetTrendingMovies({required this.movieRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getTrendingMovies();
  }
}
