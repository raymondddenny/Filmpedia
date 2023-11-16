import 'package:dartz/dartz.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:filmpedia/domain/repositories/movie_repository.dart';
import 'package:filmpedia/domain/usecases/get_popular_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetPopularMovies usecase;
  late MovieRepository movieRepository;

  setUp(() {
    movieRepository = MockMovieRepository();
    usecase = GetPopularMovies(movieRepository: movieRepository);
  });

  final tMovieList = [
    const Movie(id: 1, title: 'Movie 1', overview: 'This is movie 1 overview', posterPath: '/image1.jpg'),
    const Movie(id: 2, title: 'Movie 2', overview: 'This is movie 2 overview', posterPath: '/image2.jpg'),
  ];

  test("Should get popular movies from the movie repository", () async {
    when(movieRepository.getPopularMovies()).thenAnswer((_) async => Right(tMovieList));

    final result = await usecase();

    expect(result, Right(tMovieList));
    verify(movieRepository.getPopularMovies());
    verifyNoMoreInteractions(movieRepository);
  });
}
