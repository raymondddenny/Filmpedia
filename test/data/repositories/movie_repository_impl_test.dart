import 'package:dartz/dartz.dart';
import 'package:filmpedia/core/server_exception.dart';
import 'package:filmpedia/core/server_failure.dart';
import 'package:filmpedia/data/datasources/movie_remote_datasources.dart';
import 'package:filmpedia/data/models/movie.dart';
import 'package:filmpedia/data/repositories/movie_repository_impl.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(remoteDatasource: mockRemoteDatasource);
  });

  final tMovieModelList = [
    const MovieModel(id: 1, title: 'Movie 1', overview: 'This is movie 1 overview', posterPath: '/image1.jpg'),
    const MovieModel(id: 2, title: 'Movie 2', overview: 'This is movie 2 overview', posterPath: '/image2.jpg'),
  ];

  final tMovieList = [
    const Movie(id: 1, title: 'Movie 1', overview: 'This is movie 1 overview', posterPath: '/image1.jpg'),
    const Movie(id: 2, title: 'Movie 2', overview: 'This is movie 2 overview', posterPath: '/image2.jpg'),
  ];

  const tQuery = 'Avengers';

  test("should get trending movies from the remote datasources", () async {
    //arrange
    when(mockRemoteDatasource.getTrendingMovies()).thenAnswer((_) async => tMovieModelList);

    //act
    final result = await repository.getTrendingMovies();

    //assert
    verify(mockRemoteDatasource.getTrendingMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test("should get popular movies from the remote datasources", () async {
    //arrange
    when(mockRemoteDatasource.getPopularMovies()).thenAnswer((_) async => tMovieModelList);

    //act
    final result = await repository.getPopularMovies();

    //assert
    verify(repository.getPopularMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test("should get search movies from the remote datasources", () async {
    //arrange
    when(mockRemoteDatasource.searchMovies(tQuery)).thenAnswer((_) async => tMovieModelList);

    //act
    final result = await repository.searchMovies(tQuery);

    //assert
    verify(mockRemoteDatasource.searchMovies(tQuery));
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test("should return ServerFailure when the call to the remote data source is unsuccessful", () async {
    when(mockRemoteDatasource.getPopularMovies()).thenThrow(ServerExecption());

    //act
    final result = await repository.getPopularMovies();

    //assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });

  test("should return ServerFailure when the call to the remote data source is unsuccessful", () async {
    when(mockRemoteDatasource.getTrendingMovies()).thenThrow(ServerExecption());

    //act
    final result = await repository.getTrendingMovies();

    //assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });

  test("should return ServerFailure when the call to the remote data source is unsuccessful", () async {
    when(mockRemoteDatasource.searchMovies(tQuery)).thenThrow(ServerExecption());

    //act
    final result = await repository.searchMovies(tQuery);

    //assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });
}
