// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:filmpedia/core/server_exception.dart';
import 'package:filmpedia/core/server_failure.dart';
import 'package:filmpedia/data/datasources/movie_remote_datasources.dart';
import 'package:filmpedia/data/models/movie.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:filmpedia/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDatasource;
  MovieRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels = await remoteDatasource.getPopularMovies();

      final List<Movie> movies = movieModels.map((e) => e.toEntity()).toList();

      return Right(movies);
    } on ServerExecption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels = await remoteDatasource.getTrendingMovies();

      final List<Movie> movies = movieModels.map((e) => e.toEntity()).toList();

      return Right(movies);
    } on ServerExecption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String queryMovie) async {
    try {
      final List<MovieModel> movieModels = await remoteDatasource.searchMovies(queryMovie);

      final List<Movie> movies = movieModels.map((e) => e.toEntity()).toList();

      return Right(movies);
    } on ServerExecption {
      return Left(ServerFailure());
    }
  }
}
